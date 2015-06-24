--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-24 10:46:50 CEST

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
-- TOC entry 183 (class 1259 OID 8114043)
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
-- TOC entry 230 (class 1259 OID 8114565)
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
-- TOC entry 229 (class 1259 OID 8114548)
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
-- TOC entry 222 (class 1259 OID 8114452)
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
-- TOC entry 197 (class 1259 OID 8114222)
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
-- TOC entry 200 (class 1259 OID 8114256)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8114649)
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
-- TOC entry 192 (class 1259 OID 8114165)
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
-- TOC entry 231 (class 1259 OID 8114579)
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
-- TOC entry 216 (class 1259 OID 8114382)
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
-- TOC entry 195 (class 1259 OID 8114202)
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
-- TOC entry 199 (class 1259 OID 8114250)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8114182)
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
-- TOC entry 205 (class 1259 OID 8114299)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8114324)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8114139)
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
-- TOC entry 184 (class 1259 OID 8114052)
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
-- TOC entry 185 (class 1259 OID 8114063)
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
-- TOC entry 180 (class 1259 OID 8114017)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8114036)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8114331)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8114362)
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
-- TOC entry 226 (class 1259 OID 8114498)
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
-- TOC entry 187 (class 1259 OID 8114096)
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
-- TOC entry 189 (class 1259 OID 8114131)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8114305)
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
-- TOC entry 188 (class 1259 OID 8114116)
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
-- TOC entry 194 (class 1259 OID 8114194)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8114317)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8114437)
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
-- TOC entry 225 (class 1259 OID 8114490)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8114625)
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
-- TOC entry 212 (class 1259 OID 8114346)
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
-- TOC entry 204 (class 1259 OID 8114290)
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
-- TOC entry 203 (class 1259 OID 8114280)
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
-- TOC entry 224 (class 1259 OID 8114479)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8114414)
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
-- TOC entry 177 (class 1259 OID 8113988)
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
-- TOC entry 176 (class 1259 OID 8113986)
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
-- TOC entry 213 (class 1259 OID 8114356)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8114026)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8114010)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8114370)
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
-- TOC entry 207 (class 1259 OID 8114311)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8114261)
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
-- TOC entry 237 (class 1259 OID 8114669)
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
-- TOC entry 236 (class 1259 OID 8114661)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8114656)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8114424)
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
-- TOC entry 186 (class 1259 OID 8114088)
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
-- TOC entry 202 (class 1259 OID 8114267)
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
-- TOC entry 223 (class 1259 OID 8114468)
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
-- TOC entry 233 (class 1259 OID 8114638)
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
-- TOC entry 191 (class 1259 OID 8114151)
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
-- TOC entry 178 (class 1259 OID 8113997)
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
-- TOC entry 228 (class 1259 OID 8114525)
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
-- TOC entry 196 (class 1259 OID 8114213)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8114338)
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
-- TOC entry 218 (class 1259 OID 8114407)
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
-- TOC entry 198 (class 1259 OID 8114245)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8114515)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8114397)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8113991)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2854 (class 0 OID 8114043)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 8114565)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-558a-6e7a-5bca-5df35ea8c14c	000d0000-558a-6e7a-3020-c40657af405b	\N	00090000-558a-6e7a-55a6-f1e9057c5778	\N	000b0000-558a-6e7a-5b21-6e19ffb57400	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558a-6e7a-a85c-68706ad04cc9	000d0000-558a-6e7a-581a-1ee86fec1525	\N	00090000-558a-6e7a-aa5d-694689628153	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558a-6e7a-ece3-d34937dbcbc1	000d0000-558a-6e7a-6361-153285904882	\N	00090000-558a-6e7a-53a3-13faa9cf1d26	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558a-6e7a-024d-435453a4a731	000d0000-558a-6e7a-f110-afac9d90fb28	\N	00090000-558a-6e7a-57ac-13a5904dc1e2	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558a-6e7a-dee3-52866100e1f8	000d0000-558a-6e7a-f899-d7638c9e736f	\N	00090000-558a-6e7a-7bde-d38032e31bac	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558a-6e7a-c533-bc6c92a8d69f	000d0000-558a-6e7a-aed1-1d94ec9f6d13	\N	00090000-558a-6e7a-aa5d-694689628153	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2900 (class 0 OID 8114548)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 8114452)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-558a-6e79-af39-4ea126de0766	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-558a-6e79-808c-abcb5f43962b	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-558a-6e79-0e3f-ced7189d9b36	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2868 (class 0 OID 8114222)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-558a-6e7a-16de-6e34febfe29e	\N	\N	00200000-558a-6e7a-3620-8320a8ca8c38	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-558a-6e7a-a03d-1e61a109ac34	\N	\N	00200000-558a-6e7a-302b-6e4eeeeb5733	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-558a-6e7a-5fc0-0ae35909be0e	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-558a-6e7a-0bf5-e85d5b0db5c3	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-558a-6e7a-4605-7c750fbc8638	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2871 (class 0 OID 8114256)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 8114649)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8114165)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-558a-6e78-40ea-02970005c548	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-558a-6e78-88c0-696e186b1aec	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-558a-6e78-d86c-541e61208363	AL	ALB	008	Albania 	Albanija	\N
00040000-558a-6e78-607a-2c06731b2f10	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-558a-6e78-b4a3-4234e89c42d3	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-558a-6e78-a9a8-ef2ceef214bb	AD	AND	020	Andorra 	Andora	\N
00040000-558a-6e78-4345-d459cb0097d3	AO	AGO	024	Angola 	Angola	\N
00040000-558a-6e78-ff0b-d94a043488fe	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-558a-6e78-bbfc-8ed92d94d5db	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-558a-6e78-a21f-bd144796282e	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-558a-6e78-c913-036017e7e4cc	AR	ARG	032	Argentina 	Argenitna	\N
00040000-558a-6e78-6504-97e0234e1314	AM	ARM	051	Armenia 	Armenija	\N
00040000-558a-6e78-ffcb-3705c7154383	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-558a-6e78-7267-91aea5fb0c72	AU	AUS	036	Australia 	Avstralija	\N
00040000-558a-6e78-f40a-bdddea08e63a	AT	AUT	040	Austria 	Avstrija	\N
00040000-558a-6e78-21c2-612d70620d13	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-558a-6e78-b610-59bf257d337a	BS	BHS	044	Bahamas 	Bahami	\N
00040000-558a-6e78-1e02-542e47f58a49	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-558a-6e78-9f31-baf1eb7c2b50	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-558a-6e78-a32b-b19bb9029f81	BB	BRB	052	Barbados 	Barbados	\N
00040000-558a-6e78-a359-100f56b05d63	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-558a-6e78-1b8f-03cf1fe2ac33	BE	BEL	056	Belgium 	Belgija	\N
00040000-558a-6e78-983b-9b38d608c040	BZ	BLZ	084	Belize 	Belize	\N
00040000-558a-6e78-296e-a542db58a790	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-558a-6e78-a151-6989f5973f81	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-558a-6e78-f24d-e249e03691b9	BT	BTN	064	Bhutan 	Butan	\N
00040000-558a-6e78-bd95-3da7b0335ac1	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-558a-6e78-cabd-a71bfa9c8290	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-558a-6e78-8f5b-64a7cac65c2b	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-558a-6e78-303e-ed89488afa3f	BW	BWA	072	Botswana 	Bocvana	\N
00040000-558a-6e78-e73b-fb7ff8833e4c	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-558a-6e78-760b-251920f05384	BR	BRA	076	Brazil 	Brazilija	\N
00040000-558a-6e78-966c-2f13e970e8c4	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-558a-6e78-3610-cf4b328289cf	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-558a-6e78-4037-c1cecc2e3cb3	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-558a-6e78-f9f1-b2186efe0b99	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-558a-6e78-f715-5f1054b72f8e	BI	BDI	108	Burundi 	Burundi 	\N
00040000-558a-6e78-b427-a978d3f3159d	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-558a-6e78-943a-c7375656a7c0	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-558a-6e78-5d04-f618b3f05d1d	CA	CAN	124	Canada 	Kanada	\N
00040000-558a-6e78-c702-6c75d3952e92	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-558a-6e78-2dc1-fbf31db4488b	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-558a-6e78-182a-042541b69641	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-558a-6e78-bd3b-9cc588a15865	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-558a-6e78-08b0-27350f79e396	CL	CHL	152	Chile 	Čile	\N
00040000-558a-6e78-eafa-8b5ea91e8d4a	CN	CHN	156	China 	Kitajska	\N
00040000-558a-6e78-ac77-b4bc45cbaf3d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-558a-6e78-8f1e-4a6c1f5ef32c	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-558a-6e78-2091-1443ee869589	CO	COL	170	Colombia 	Kolumbija	\N
00040000-558a-6e78-823b-ad9c31a10a43	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-558a-6e78-6817-2e3aad473bc8	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-558a-6e78-b5e0-9a1dbd0e5936	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-558a-6e78-97f2-a6023c882b0c	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-558a-6e78-3d2c-0d21a0d72e3c	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-558a-6e78-2e2d-f340b516bf1d	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-558a-6e78-57b5-ae4c3003316f	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-558a-6e78-4a7a-1fcbe3936fec	CU	CUB	192	Cuba 	Kuba	\N
00040000-558a-6e78-3eef-3b3bb08973dd	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-558a-6e78-de2c-9d8e8f61a176	CY	CYP	196	Cyprus 	Ciper	\N
00040000-558a-6e78-a358-07c4a198d08b	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-558a-6e78-19bc-6adfd0c873e7	DK	DNK	208	Denmark 	Danska	\N
00040000-558a-6e78-9799-3b7e01fe6908	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-558a-6e78-6318-c60e06606822	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-558a-6e78-a0f7-e4c237e4db5f	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-558a-6e78-80e1-dd20dd3107a5	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-558a-6e78-99d3-5baccfc2f97f	EG	EGY	818	Egypt 	Egipt	\N
00040000-558a-6e78-df29-03f1a58bfa5a	SV	SLV	222	El Salvador 	Salvador	\N
00040000-558a-6e78-7dcf-e54df2c3659a	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-558a-6e78-e3ec-b5628f8cb038	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-558a-6e78-5b11-6a260089dba1	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-558a-6e78-0b19-0d0801c7a540	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-558a-6e78-7b11-c5fd3d210aff	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-558a-6e78-c3ea-d1f156ec4653	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-558a-6e78-e103-08c18d177e5f	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-558a-6e78-98a1-d9a3c41c87de	FI	FIN	246	Finland 	Finska	\N
00040000-558a-6e78-2187-cfc9c1220e06	FR	FRA	250	France 	Francija	\N
00040000-558a-6e78-eb88-3b3088a20020	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-558a-6e78-1607-00276676294f	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-558a-6e78-80fc-6bd56991b693	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-558a-6e78-1bd0-c01c204ba2c2	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-558a-6e78-4980-e8415e4c3b58	GA	GAB	266	Gabon 	Gabon	\N
00040000-558a-6e78-ab0e-29ed9f167cca	GM	GMB	270	Gambia 	Gambija	\N
00040000-558a-6e78-c593-dd9fc27ea6d2	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-558a-6e78-e48d-06a532f9923c	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-558a-6e78-62da-a94087452420	GH	GHA	288	Ghana 	Gana	\N
00040000-558a-6e78-e12a-a55800a0bbdb	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-558a-6e78-a8df-fed52836d118	GR	GRC	300	Greece 	Grčija	\N
00040000-558a-6e78-0779-c3ee5ca9996d	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-558a-6e78-3e5f-58b3a6e2b08d	GD	GRD	308	Grenada 	Grenada	\N
00040000-558a-6e78-278e-0d4e333ee555	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-558a-6e78-02ad-4339b20ff98d	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-558a-6e78-6408-7ce006d33089	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-558a-6e78-8083-f82c6718cdd4	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-558a-6e78-d129-bafdb89c2c76	GN	GIN	324	Guinea 	Gvineja	\N
00040000-558a-6e78-a9e7-96361b8d555f	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-558a-6e78-4ae4-f2f7d36f9c02	GY	GUY	328	Guyana 	Gvajana	\N
00040000-558a-6e78-1498-7922a09ed8be	HT	HTI	332	Haiti 	Haiti	\N
00040000-558a-6e78-81e9-89317e124ece	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-558a-6e78-4f8f-a65c36a8457c	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-558a-6e78-bd6a-77cc9b3758c5	HN	HND	340	Honduras 	Honduras	\N
00040000-558a-6e78-dc72-083c041c45d2	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-558a-6e78-a304-3f6f2fb96bd1	HU	HUN	348	Hungary 	Madžarska	\N
00040000-558a-6e78-1a42-3643f7a3d37c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-558a-6e78-102c-b04f9c1ece6e	IN	IND	356	India 	Indija	\N
00040000-558a-6e78-4abd-f1107249b1d4	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-558a-6e78-d931-1b6badd9f347	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-558a-6e78-a2c6-2a8b2645f8f4	IQ	IRQ	368	Iraq 	Irak	\N
00040000-558a-6e78-9220-9c7e4e290be4	IE	IRL	372	Ireland 	Irska	\N
00040000-558a-6e78-00e6-fb0fa9a21223	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-558a-6e78-bb54-b39448d46f4f	IL	ISR	376	Israel 	Izrael	\N
00040000-558a-6e78-2281-f77ff8a60ecb	IT	ITA	380	Italy 	Italija	\N
00040000-558a-6e78-da39-22ae31d43747	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-558a-6e78-5544-42f8db8603cf	JP	JPN	392	Japan 	Japonska	\N
00040000-558a-6e78-59f4-8a471b994bad	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-558a-6e78-02eb-48cf3a0c814f	JO	JOR	400	Jordan 	Jordanija	\N
00040000-558a-6e78-b321-034107cb3caf	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-558a-6e78-e455-829f672921a3	KE	KEN	404	Kenya 	Kenija	\N
00040000-558a-6e78-2172-17fbe29026af	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-558a-6e78-971d-cb3044a75ab1	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-558a-6e78-83fe-04843966fa8e	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-558a-6e78-c5e3-5aa671bc14e1	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-558a-6e78-b417-b48bafd5c94e	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-558a-6e78-f9d5-ca930313008c	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-558a-6e78-231d-1ca1cf65c693	LV	LVA	428	Latvia 	Latvija	\N
00040000-558a-6e78-6473-09679c402ef8	LB	LBN	422	Lebanon 	Libanon	\N
00040000-558a-6e78-d564-f8f3a76c153e	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-558a-6e78-47a5-9bf8da34af9c	LR	LBR	430	Liberia 	Liberija	\N
00040000-558a-6e78-4700-170e7df3f9d1	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-558a-6e78-8ba2-9f5b127e297f	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-558a-6e78-bd8e-10e53946060f	LT	LTU	440	Lithuania 	Litva	\N
00040000-558a-6e78-da07-d4acb4dbec40	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-558a-6e78-6dd1-db869b14ffe5	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-558a-6e78-5438-aad174e2ef7e	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-558a-6e78-b9ce-4507461aaa0b	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-558a-6e78-e907-fbf0ae333d6c	MW	MWI	454	Malawi 	Malavi	\N
00040000-558a-6e78-4eca-9f5ba30d9a23	MY	MYS	458	Malaysia 	Malezija	\N
00040000-558a-6e78-d81c-c5ed36f470d7	MV	MDV	462	Maldives 	Maldivi	\N
00040000-558a-6e78-8596-26c0ef2f3064	ML	MLI	466	Mali 	Mali	\N
00040000-558a-6e78-c1af-a87ab377a2f6	MT	MLT	470	Malta 	Malta	\N
00040000-558a-6e78-d278-a11e491a0ddf	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-558a-6e78-df64-b44742d87c35	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-558a-6e78-2f24-cfab0965f89c	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-558a-6e78-93ae-6e6eb3d87fe3	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-558a-6e78-a124-c77e9a761ca9	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-558a-6e78-8f1a-8ec7c8e1d65f	MX	MEX	484	Mexico 	Mehika	\N
00040000-558a-6e78-3465-68b3ccb3aefd	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-558a-6e78-10b8-9145c410b424	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-558a-6e78-5797-a8c18f51d3c3	MC	MCO	492	Monaco 	Monako	\N
00040000-558a-6e78-7f50-0c7a0c458444	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-558a-6e78-0076-2870f24488bf	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-558a-6e78-06cc-b0dd19925751	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-558a-6e78-e9f7-862809812c7e	MA	MAR	504	Morocco 	Maroko	\N
00040000-558a-6e78-c44b-daef9a97eff1	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-558a-6e78-9852-7cb469ddd20f	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-558a-6e78-9988-bae0f9854e1e	NA	NAM	516	Namibia 	Namibija	\N
00040000-558a-6e78-f1f6-ee13c342225b	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-558a-6e78-e6bb-3a009b459c22	NP	NPL	524	Nepal 	Nepal	\N
00040000-558a-6e78-2d31-81859b92aef8	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-558a-6e78-922e-08c9da2093c5	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-558a-6e78-4dde-fd190c07b903	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-558a-6e78-c3ef-8e7e7e879274	NE	NER	562	Niger 	Niger 	\N
00040000-558a-6e78-f112-406945de2a3b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-558a-6e78-063e-5a574d9cd6c5	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-558a-6e78-3f27-d447635d9345	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-558a-6e78-1e02-fd619e661ca8	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-558a-6e78-80c2-35d0f69a01e4	NO	NOR	578	Norway 	Norveška	\N
00040000-558a-6e78-3f94-8759505cc485	OM	OMN	512	Oman 	Oman	\N
00040000-558a-6e78-17b5-ab85f67e4ea7	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-558a-6e78-b9bc-d6f4900a55ae	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-558a-6e78-ae1b-7d64354d5691	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-558a-6e78-2b14-227a5d926c4b	PA	PAN	591	Panama 	Panama	\N
00040000-558a-6e78-d8c3-dd8008e74441	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-558a-6e78-4427-2b011e67603c	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-558a-6e78-a887-3be48c7ce0f6	PE	PER	604	Peru 	Peru	\N
00040000-558a-6e78-6a6b-986648094a49	PH	PHL	608	Philippines 	Filipini	\N
00040000-558a-6e78-0d15-fddf8968eafd	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-558a-6e78-7fa6-27fca5cbd16c	PL	POL	616	Poland 	Poljska	\N
00040000-558a-6e78-c307-717f58f8b402	PT	PRT	620	Portugal 	Portugalska	\N
00040000-558a-6e78-290d-3ad7b144890e	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-558a-6e78-a0c9-e88eb3a91b34	QA	QAT	634	Qatar 	Katar	\N
00040000-558a-6e78-e9ad-004a0fafdadb	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-558a-6e78-97d3-302c96f87b28	RO	ROU	642	Romania 	Romunija	\N
00040000-558a-6e78-441d-d0544b83dca9	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-558a-6e78-6ae0-b7ac40ede4bd	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-558a-6e78-05c6-2f953dfe076f	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-558a-6e78-3c5a-c35b92319306	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-558a-6e78-8cc8-34939740414a	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-558a-6e78-1422-5b8106b596ae	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-558a-6e78-3baf-a2577f058108	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-558a-6e78-6d0a-dc780ced563c	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-558a-6e78-e1b0-dcc97b4e14cc	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-558a-6e78-9890-aee89735ce1e	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-558a-6e78-ab70-d5ade91cea1c	SM	SMR	674	San Marino 	San Marino	\N
00040000-558a-6e78-7f8f-d7deb3ad1e5e	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-558a-6e78-5ea3-98e237cd9525	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-558a-6e78-4214-71e1fa0f0623	SN	SEN	686	Senegal 	Senegal	\N
00040000-558a-6e78-7cee-7d150fc1bb1a	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-558a-6e78-541b-06afeb2e0586	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-558a-6e78-35a5-790cb17696d1	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-558a-6e78-83ea-4c833fa83bde	SG	SGP	702	Singapore 	Singapur	\N
00040000-558a-6e78-468e-aa5968c06df6	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-558a-6e78-9d14-b6f782366703	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-558a-6e78-55fc-0d11b2fcf989	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-558a-6e78-0ac8-b5231906d0d6	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-558a-6e78-82af-04b2186a3aa6	SO	SOM	706	Somalia 	Somalija	\N
00040000-558a-6e78-ff7a-0493c32d04f8	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-558a-6e78-a2dd-dd4ce61bd660	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-558a-6e78-7aef-b44cad1a1c75	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-558a-6e78-18da-c10a80b5eecd	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-558a-6e78-cf65-c38fee5cdbec	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-558a-6e78-0de2-ddeaef3ea1e1	SD	SDN	729	Sudan 	Sudan	\N
00040000-558a-6e78-fe6e-7cfbd80debf4	SR	SUR	740	Suriname 	Surinam	\N
00040000-558a-6e78-0afc-254747c91d32	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-558a-6e78-eb4a-e1ce60e4c261	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-558a-6e78-3a9c-530bd27c0ee3	SE	SWE	752	Sweden 	Švedska	\N
00040000-558a-6e78-79c1-a86091cc5a41	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-558a-6e78-0490-975bcbe0c56f	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-558a-6e78-e429-8b310b6141e5	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-558a-6e78-17e6-86d1d06768d9	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-558a-6e78-fce1-1e14e1fa5482	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-558a-6e78-d665-c28e9c8dcfaf	TH	THA	764	Thailand 	Tajska	\N
00040000-558a-6e78-fa0f-9b3ea2f2d376	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-558a-6e78-dda9-d0ad686b913f	TG	TGO	768	Togo 	Togo	\N
00040000-558a-6e78-d03d-42f1d5ea676f	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-558a-6e78-0f0a-861f96f73e5b	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-558a-6e78-b686-a6ae2a9b649f	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-558a-6e78-2ab4-601ca27f0080	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-558a-6e78-3cce-464aaf9bfb1b	TR	TUR	792	Turkey 	Turčija	\N
00040000-558a-6e78-91ae-1813990201b8	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-558a-6e78-a3fa-51cc8893e566	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-558a-6e78-fb12-975ee18fac62	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-558a-6e78-c12c-1ecfa0dd5e1d	UG	UGA	800	Uganda 	Uganda	\N
00040000-558a-6e78-05c7-a1743e664d22	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-558a-6e78-dfae-b3669c2b6633	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-558a-6e78-8928-61ffc730214e	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-558a-6e78-6819-8544cad835b5	US	USA	840	United States 	Združene države Amerike	\N
00040000-558a-6e78-3ee1-fd6e9f5baf93	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-558a-6e78-87fb-837ff2991f2c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-558a-6e78-a2fa-8a760ad490e8	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-558a-6e78-aee6-66ae99e4c1ac	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-558a-6e78-5292-1fffbef0ea5d	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-558a-6e78-e84f-d894ee821946	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-558a-6e78-1a8b-b62d20c8f50d	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-558a-6e78-3311-9860d91e6665	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-558a-6e78-ff33-7035bda48d27	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-558a-6e78-e41e-3c4a58e9cddd	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-558a-6e78-e33a-6ecfc6bb666e	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-558a-6e78-b7d7-2f0938261d81	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-558a-6e78-1d96-d46e80aba3b7	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2902 (class 0 OID 8114579)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 8114382)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-558a-6e7a-6ed3-feb6b9a5428e	000e0000-558a-6e7a-e5b9-cf83c35996a8	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-558a-6e79-1a3d-2a4c69212715
000d0000-558a-6e7a-3020-c40657af405b	000e0000-558a-6e7a-e5b9-cf83c35996a8	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-558a-6e79-1a3d-2a4c69212715
000d0000-558a-6e7a-581a-1ee86fec1525	000e0000-558a-6e7a-e5b9-cf83c35996a8	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-558a-6e79-c129-c2efcf40f8ba
000d0000-558a-6e7a-6361-153285904882	000e0000-558a-6e7a-e5b9-cf83c35996a8	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-558a-6e79-7fc8-a57f695c3dbf
000d0000-558a-6e7a-f110-afac9d90fb28	000e0000-558a-6e7a-e5b9-cf83c35996a8	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-558a-6e79-7fc8-a57f695c3dbf
000d0000-558a-6e7a-f899-d7638c9e736f	000e0000-558a-6e7a-e5b9-cf83c35996a8	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-558a-6e79-7fc8-a57f695c3dbf
000d0000-558a-6e7a-aed1-1d94ec9f6d13	000e0000-558a-6e7a-e5b9-cf83c35996a8	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-558a-6e79-1a3d-2a4c69212715
\.


--
-- TOC entry 2866 (class 0 OID 8114202)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8114250)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8114182)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-558a-6e7a-d60e-442412e2ab6b	00080000-558a-6e7a-7b52-c5a66aa31af6	00090000-558a-6e7a-55a6-f1e9057c5778	AK		
\.


--
-- TOC entry 2841 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 8114299)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 8114324)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 8114139)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-558a-6e78-ccce-e8c919413be4	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-558a-6e78-0e63-0bb5e4ddea25	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-558a-6e78-c371-b2188249a44e	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-558a-6e78-fd25-c17c7a6b6bfb	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-558a-6e78-1399-3f855423b399	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-558a-6e78-6e9f-5fc62370931c	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-558a-6e78-238f-ac87668f5012	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-558a-6e78-ff8b-3cd16abdff6b	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-558a-6e78-f9e7-cce93fb3b6cb	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-558a-6e78-d5ed-d4e1bde765ee	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-558a-6e78-e7e4-ab32b6a68083	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-558a-6e78-1f50-56e58a583bcc	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-558a-6e78-89c6-f035dcf78caa	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-558a-6e79-6f20-0d217dda8c10	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-558a-6e79-5924-78db5c8d6269	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-558a-6e79-84f4-54a839851ef9	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-558a-6e79-f311-47b56ec74aa4	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-558a-6e79-10ba-35da7b606731	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-558a-6e79-85d1-c69efcba7971	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2855 (class 0 OID 8114052)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-558a-6e79-43ab-026b7cd58e47	00000000-558a-6e79-5924-78db5c8d6269	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-558a-6e79-470b-83902afa8129	00000000-558a-6e79-5924-78db5c8d6269	00010000-558a-6e78-947d-a922b7b31b83	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-558a-6e79-0da1-d00ae7c98e24	00000000-558a-6e79-84f4-54a839851ef9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2856 (class 0 OID 8114063)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-558a-6e7a-8a64-2a0da1220954	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-558a-6e7a-57ac-13a5904dc1e2	00010000-558a-6e7a-3ff7-173624b7d12a	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-558a-6e7a-53a3-13faa9cf1d26	00010000-558a-6e7a-15cc-93e55fa08a2f	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-558a-6e7a-49d1-82b7c50472f4	00010000-558a-6e7a-6d48-c95d85dbfde3	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-558a-6e7a-dd51-e4e260986985	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-558a-6e7a-7c06-b11a4a1d852f	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-558a-6e7a-a4bc-f79b604dd0b2	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-558a-6e7a-82c2-cd90e3561fa9	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-558a-6e7a-55a6-f1e9057c5778	00010000-558a-6e7a-b831-665425ab9578	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-558a-6e7a-aa5d-694689628153	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-558a-6e7a-32af-8e0854648fe3	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-558a-6e7a-7bde-d38032e31bac	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-558a-6e7a-2272-574fa6b0f7ef	00010000-558a-6e7a-d01c-b59cb6d26226	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2843 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 8114017)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-558a-6e78-3255-a0261bbeffce	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-558a-6e78-506e-fa3bf5a57c3c	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-558a-6e78-6f6c-10489517d579	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-558a-6e78-15d1-c132ccdede79	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-558a-6e78-f200-bc4f59a30ae3	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-558a-6e78-9a7a-b853841bdc88	Abonma-read	Abonma - branje	f
00030000-558a-6e78-bca9-8a0807c345e9	Abonma-write	Abonma - spreminjanje	f
00030000-558a-6e78-988b-2756fe36659c	Alternacija-read	Alternacija - branje	f
00030000-558a-6e78-df84-34492271de08	Alternacija-write	Alternacija - spreminjanje	f
00030000-558a-6e78-8482-b54e9efd2184	Arhivalija-read	Arhivalija - branje	f
00030000-558a-6e78-9990-7aa7db019746	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-558a-6e78-900a-db4d5ab33d0a	Besedilo-read	Besedilo - branje	f
00030000-558a-6e78-17a1-e8143038dcf1	Besedilo-write	Besedilo - spreminjanje	f
00030000-558a-6e78-0261-92e27d9d2a56	DogodekIzven-read	DogodekIzven - branje	f
00030000-558a-6e78-36df-376591d7e917	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-558a-6e78-ae49-204ff4d3a6f4	Dogodek-read	Dogodek - branje	f
00030000-558a-6e78-8cc6-f411f9caa421	Dogodek-write	Dogodek - spreminjanje	f
00030000-558a-6e78-c7e1-d17caaac130c	DrugiVir-read	DrugiVir - branje	f
00030000-558a-6e78-8a89-176c54dc2ca6	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-558a-6e78-f6ba-48fa729a17a3	Drzava-read	Drzava - branje	f
00030000-558a-6e78-7a4d-2d47d80e191f	Drzava-write	Drzava - spreminjanje	f
00030000-558a-6e78-7e81-86af427445e0	Funkcija-read	Funkcija - branje	f
00030000-558a-6e78-44a7-e8fa3b910be7	Funkcija-write	Funkcija - spreminjanje	f
00030000-558a-6e78-0af2-cc7a20ee416e	Gostovanje-read	Gostovanje - branje	f
00030000-558a-6e78-2027-a6db2870954a	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-558a-6e78-fe3f-71a62dd86366	Gostujoca-read	Gostujoca - branje	f
00030000-558a-6e78-2cb2-72855fd41df6	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-558a-6e78-b4f9-155f9d0c7c7c	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-558a-6e78-c33d-0afc22d11a1c	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-558a-6e78-6506-e16b607c907a	Kupec-read	Kupec - branje	f
00030000-558a-6e78-1a25-8291c2d7918a	Kupec-write	Kupec - spreminjanje	f
00030000-558a-6e78-4535-78daafb1f15e	NacinPlacina-read	NacinPlacina - branje	f
00030000-558a-6e78-2eb1-bb8a7b0aedd5	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-558a-6e78-8e6b-6a7c602bc542	Option-read	Option - branje	f
00030000-558a-6e78-3084-0229e3bb121e	Option-write	Option - spreminjanje	f
00030000-558a-6e78-5d50-ef44b88d128e	OptionValue-read	OptionValue - branje	f
00030000-558a-6e78-b77f-5750604e34e1	OptionValue-write	OptionValue - spreminjanje	f
00030000-558a-6e78-6e22-febf9a8f9b89	Oseba-read	Oseba - branje	f
00030000-558a-6e78-d0d5-caf8a11cfa0c	Oseba-write	Oseba - spreminjanje	f
00030000-558a-6e78-5b65-9131626704bb	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-558a-6e78-25c4-db54f664a5db	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-558a-6e78-b56b-920fae501d64	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-558a-6e78-c66a-a2c7e3811398	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-558a-6e78-40d3-b1282102748b	Pogodba-read	Pogodba - branje	f
00030000-558a-6e78-56a3-34dcab365c40	Pogodba-write	Pogodba - spreminjanje	f
00030000-558a-6e78-a746-e7d9daf2c6ed	Popa-read	Popa - branje	f
00030000-558a-6e78-6b12-04f5ff902e84	Popa-write	Popa - spreminjanje	f
00030000-558a-6e78-8dae-c6208d136fdb	Posta-read	Posta - branje	f
00030000-558a-6e78-38b8-0500a8eacf36	Posta-write	Posta - spreminjanje	f
00030000-558a-6e78-ba51-32f48e814dc5	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-558a-6e78-37e8-e2ffc401f806	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-558a-6e78-1293-d7bf8c79c837	PostniNaslov-read	PostniNaslov - branje	f
00030000-558a-6e78-60a1-323d58296827	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-558a-6e78-f59e-057c98c0370d	Predstava-read	Predstava - branje	f
00030000-558a-6e78-6a2d-a2bdfe37d637	Predstava-write	Predstava - spreminjanje	f
00030000-558a-6e78-7a18-da216cd46e6d	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-558a-6e78-7d1a-513cfc53a9cd	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-558a-6e78-6a6f-99c91a10ccf4	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-558a-6e78-e5d9-70dcad5d5ce1	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-558a-6e78-f380-d347a06c4d06	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-558a-6e78-f4f9-598698b86ce6	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-558a-6e78-4725-23c36e7ad516	ProgramDela-read	ProgramDela - branje	f
00030000-558a-6e78-16f9-5d9ec8b073d6	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-558a-6e78-631d-8f000b9fc269	ProgramFestival-read	ProgramFestival - branje	f
00030000-558a-6e78-a9a7-c68cf5072502	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-558a-6e78-5205-b0065aef1787	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-558a-6e78-4006-f090d34adedb	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-558a-6e78-7483-5d69fafd6da4	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-558a-6e78-be33-5039ad398946	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-558a-6e78-7aa2-515ccaefb318	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-558a-6e78-f5a5-71b415647e29	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-558a-6e78-652e-bd56706d3c2c	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-558a-6e78-3567-4aacfd7d4b10	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-558a-6e78-1a0b-a5830b193684	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-558a-6e78-e357-3d6d93cf0933	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-558a-6e78-4af2-42c91afabcbf	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-558a-6e78-d5a7-d0471a4b4be9	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-558a-6e78-5968-28ce432d4885	ProgramRazno-read	ProgramRazno - branje	f
00030000-558a-6e78-3c0b-55acc23c20e7	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-558a-6e78-bc1b-1a9333daa373	Prostor-read	Prostor - branje	f
00030000-558a-6e78-df3f-7d8bc7176323	Prostor-write	Prostor - spreminjanje	f
00030000-558a-6e78-3add-c138d6975a2a	Racun-read	Racun - branje	f
00030000-558a-6e78-3d78-8b99e336bdca	Racun-write	Racun - spreminjanje	f
00030000-558a-6e78-79f5-4fb6f55636e7	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-558a-6e78-f499-b0b1aa18d6e4	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-558a-6e78-5f8d-eda41b3eae4c	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-558a-6e78-8173-7c35eab79f61	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-558a-6e78-950a-f70c7c72eddc	Rekvizit-read	Rekvizit - branje	f
00030000-558a-6e78-adc7-4fbbbdbb0200	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-558a-6e78-40c0-b99685ea59e1	Revizija-read	Revizija - branje	f
00030000-558a-6e78-3654-d71b67a4a064	Revizija-write	Revizija - spreminjanje	f
00030000-558a-6e78-d01f-3c59f3a0435f	Rezervacija-read	Rezervacija - branje	f
00030000-558a-6e78-59fc-2b8b3b2c205e	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-558a-6e78-49b4-db14999a90be	SedezniRed-read	SedezniRed - branje	f
00030000-558a-6e78-b969-f30c500535a3	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-558a-6e78-7e26-00214b8aade4	Sedez-read	Sedez - branje	f
00030000-558a-6e78-206f-a0e233a196bd	Sedez-write	Sedez - spreminjanje	f
00030000-558a-6e78-c679-92280a5dcaaa	Sezona-read	Sezona - branje	f
00030000-558a-6e78-2df9-c27614632f65	Sezona-write	Sezona - spreminjanje	f
00030000-558a-6e78-d67f-69e22d083bcf	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-558a-6e78-50c8-e1bf12bbdcc1	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-558a-6e78-f300-b03773d0a3e0	Stevilcenje-read	Stevilcenje - branje	f
00030000-558a-6e78-ac14-13d9245f5b29	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-558a-6e78-895e-76ff76a29a4d	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-558a-6e78-d495-1c1c7199d40c	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-558a-6e78-bf34-7e310f585c1c	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-558a-6e78-d9c5-75367111539c	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-558a-6e78-e08d-f03c16412ec6	Telefonska-read	Telefonska - branje	f
00030000-558a-6e78-a170-3cd20ce1e8dd	Telefonska-write	Telefonska - spreminjanje	f
00030000-558a-6e78-6b8c-a14e337c7311	TerminStoritve-read	TerminStoritve - branje	f
00030000-558a-6e78-1a8f-25f2c00c9430	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-558a-6e78-946c-cbbd40d041ee	TipFunkcije-read	TipFunkcije - branje	f
00030000-558a-6e78-8990-3fa77216cae9	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-558a-6e78-6250-1e79064458f2	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-558a-6e78-ee87-0e2f2c12327f	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-558a-6e78-1cce-d050d0c847c1	Trr-read	Trr - branje	f
00030000-558a-6e78-0bb0-330d546ff165	Trr-write	Trr - spreminjanje	f
00030000-558a-6e78-98e3-e2bef0a24587	Uprizoritev-read	Uprizoritev - branje	f
00030000-558a-6e78-f3e3-b22d5607a5ae	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-558a-6e78-76c4-7003c360e40d	Vaja-read	Vaja - branje	f
00030000-558a-6e78-a655-3456ec80a350	Vaja-write	Vaja - spreminjanje	f
00030000-558a-6e78-c78a-b462518d999a	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-558a-6e78-793e-3de4acb5dc8e	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-558a-6e78-8a7e-751a4fdd1e1c	Zaposlitev-read	Zaposlitev - branje	f
00030000-558a-6e78-794d-0dea9e87063d	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-558a-6e78-bafb-f482eac054b4	Zasedenost-read	Zasedenost - branje	f
00030000-558a-6e78-ef53-38d7e38f3784	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-558a-6e78-8e3d-078ebdcc1bb5	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-558a-6e78-c61d-167a1d81c267	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-558a-6e78-d16f-5eb01cd421c9	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-558a-6e78-b626-2da5ca0c6340	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2853 (class 0 OID 8114036)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-558a-6e78-ee25-029ba118b5f4	00030000-558a-6e78-506e-fa3bf5a57c3c
00020000-558a-6e78-5274-f5b2b2d1ce3f	00030000-558a-6e78-f6ba-48fa729a17a3
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-9a7a-b853841bdc88
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-bca9-8a0807c345e9
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-988b-2756fe36659c
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-df84-34492271de08
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-8482-b54e9efd2184
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-ae49-204ff4d3a6f4
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-15d1-c132ccdede79
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-8cc6-f411f9caa421
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-f6ba-48fa729a17a3
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-7a4d-2d47d80e191f
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-7e81-86af427445e0
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-44a7-e8fa3b910be7
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-0af2-cc7a20ee416e
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-2027-a6db2870954a
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-fe3f-71a62dd86366
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-2cb2-72855fd41df6
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-b4f9-155f9d0c7c7c
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-c33d-0afc22d11a1c
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-8e6b-6a7c602bc542
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-5d50-ef44b88d128e
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-6e22-febf9a8f9b89
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-d0d5-caf8a11cfa0c
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-a746-e7d9daf2c6ed
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-6b12-04f5ff902e84
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-8dae-c6208d136fdb
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-38b8-0500a8eacf36
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-1293-d7bf8c79c837
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-60a1-323d58296827
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-f59e-057c98c0370d
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-6a2d-a2bdfe37d637
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-f380-d347a06c4d06
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-f4f9-598698b86ce6
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-bc1b-1a9333daa373
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-df3f-7d8bc7176323
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-5f8d-eda41b3eae4c
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-8173-7c35eab79f61
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-950a-f70c7c72eddc
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-adc7-4fbbbdbb0200
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-c679-92280a5dcaaa
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-2df9-c27614632f65
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-946c-cbbd40d041ee
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-98e3-e2bef0a24587
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-f3e3-b22d5607a5ae
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-76c4-7003c360e40d
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-a655-3456ec80a350
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-bafb-f482eac054b4
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-ef53-38d7e38f3784
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-8e3d-078ebdcc1bb5
00020000-558a-6e78-0b62-eebb3f284623	00030000-558a-6e78-d16f-5eb01cd421c9
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-9a7a-b853841bdc88
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-8482-b54e9efd2184
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-ae49-204ff4d3a6f4
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-f6ba-48fa729a17a3
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-0af2-cc7a20ee416e
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-fe3f-71a62dd86366
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-b4f9-155f9d0c7c7c
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-c33d-0afc22d11a1c
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-8e6b-6a7c602bc542
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-5d50-ef44b88d128e
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-6e22-febf9a8f9b89
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-d0d5-caf8a11cfa0c
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-a746-e7d9daf2c6ed
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-8dae-c6208d136fdb
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-1293-d7bf8c79c837
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-60a1-323d58296827
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-f59e-057c98c0370d
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-bc1b-1a9333daa373
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-5f8d-eda41b3eae4c
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-950a-f70c7c72eddc
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-c679-92280a5dcaaa
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-e08d-f03c16412ec6
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-a170-3cd20ce1e8dd
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-1cce-d050d0c847c1
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-0bb0-330d546ff165
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-8a7e-751a4fdd1e1c
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-794d-0dea9e87063d
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-8e3d-078ebdcc1bb5
00020000-558a-6e78-dc3a-9e18e42e6508	00030000-558a-6e78-d16f-5eb01cd421c9
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-9a7a-b853841bdc88
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-988b-2756fe36659c
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-8482-b54e9efd2184
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-9990-7aa7db019746
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-900a-db4d5ab33d0a
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-0261-92e27d9d2a56
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-ae49-204ff4d3a6f4
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-f6ba-48fa729a17a3
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-7e81-86af427445e0
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-0af2-cc7a20ee416e
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-fe3f-71a62dd86366
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-b4f9-155f9d0c7c7c
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-8e6b-6a7c602bc542
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-5d50-ef44b88d128e
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-6e22-febf9a8f9b89
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-a746-e7d9daf2c6ed
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-8dae-c6208d136fdb
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-f59e-057c98c0370d
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-f380-d347a06c4d06
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-bc1b-1a9333daa373
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-5f8d-eda41b3eae4c
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-950a-f70c7c72eddc
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-c679-92280a5dcaaa
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-946c-cbbd40d041ee
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-76c4-7003c360e40d
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-bafb-f482eac054b4
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-8e3d-078ebdcc1bb5
00020000-558a-6e78-3440-c54f4031623f	00030000-558a-6e78-d16f-5eb01cd421c9
00020000-558a-6e78-0700-df73f1f8bdc6	00030000-558a-6e78-9a7a-b853841bdc88
00020000-558a-6e78-0700-df73f1f8bdc6	00030000-558a-6e78-bca9-8a0807c345e9
00020000-558a-6e78-0700-df73f1f8bdc6	00030000-558a-6e78-df84-34492271de08
00020000-558a-6e78-0700-df73f1f8bdc6	00030000-558a-6e78-8482-b54e9efd2184
00020000-558a-6e78-0700-df73f1f8bdc6	00030000-558a-6e78-ae49-204ff4d3a6f4
00020000-558a-6e78-0700-df73f1f8bdc6	00030000-558a-6e78-f6ba-48fa729a17a3
00020000-558a-6e78-0700-df73f1f8bdc6	00030000-558a-6e78-0af2-cc7a20ee416e
00020000-558a-6e78-0700-df73f1f8bdc6	00030000-558a-6e78-fe3f-71a62dd86366
00020000-558a-6e78-0700-df73f1f8bdc6	00030000-558a-6e78-8e6b-6a7c602bc542
00020000-558a-6e78-0700-df73f1f8bdc6	00030000-558a-6e78-5d50-ef44b88d128e
00020000-558a-6e78-0700-df73f1f8bdc6	00030000-558a-6e78-a746-e7d9daf2c6ed
00020000-558a-6e78-0700-df73f1f8bdc6	00030000-558a-6e78-8dae-c6208d136fdb
00020000-558a-6e78-0700-df73f1f8bdc6	00030000-558a-6e78-f59e-057c98c0370d
00020000-558a-6e78-0700-df73f1f8bdc6	00030000-558a-6e78-bc1b-1a9333daa373
00020000-558a-6e78-0700-df73f1f8bdc6	00030000-558a-6e78-5f8d-eda41b3eae4c
00020000-558a-6e78-0700-df73f1f8bdc6	00030000-558a-6e78-950a-f70c7c72eddc
00020000-558a-6e78-0700-df73f1f8bdc6	00030000-558a-6e78-c679-92280a5dcaaa
00020000-558a-6e78-0700-df73f1f8bdc6	00030000-558a-6e78-946c-cbbd40d041ee
00020000-558a-6e78-0700-df73f1f8bdc6	00030000-558a-6e78-8e3d-078ebdcc1bb5
00020000-558a-6e78-0700-df73f1f8bdc6	00030000-558a-6e78-d16f-5eb01cd421c9
00020000-558a-6e78-244e-d7a75eb56cca	00030000-558a-6e78-9a7a-b853841bdc88
00020000-558a-6e78-244e-d7a75eb56cca	00030000-558a-6e78-8482-b54e9efd2184
00020000-558a-6e78-244e-d7a75eb56cca	00030000-558a-6e78-ae49-204ff4d3a6f4
00020000-558a-6e78-244e-d7a75eb56cca	00030000-558a-6e78-f6ba-48fa729a17a3
00020000-558a-6e78-244e-d7a75eb56cca	00030000-558a-6e78-0af2-cc7a20ee416e
00020000-558a-6e78-244e-d7a75eb56cca	00030000-558a-6e78-fe3f-71a62dd86366
00020000-558a-6e78-244e-d7a75eb56cca	00030000-558a-6e78-8e6b-6a7c602bc542
00020000-558a-6e78-244e-d7a75eb56cca	00030000-558a-6e78-5d50-ef44b88d128e
00020000-558a-6e78-244e-d7a75eb56cca	00030000-558a-6e78-a746-e7d9daf2c6ed
00020000-558a-6e78-244e-d7a75eb56cca	00030000-558a-6e78-8dae-c6208d136fdb
00020000-558a-6e78-244e-d7a75eb56cca	00030000-558a-6e78-f59e-057c98c0370d
00020000-558a-6e78-244e-d7a75eb56cca	00030000-558a-6e78-bc1b-1a9333daa373
00020000-558a-6e78-244e-d7a75eb56cca	00030000-558a-6e78-5f8d-eda41b3eae4c
00020000-558a-6e78-244e-d7a75eb56cca	00030000-558a-6e78-950a-f70c7c72eddc
00020000-558a-6e78-244e-d7a75eb56cca	00030000-558a-6e78-c679-92280a5dcaaa
00020000-558a-6e78-244e-d7a75eb56cca	00030000-558a-6e78-6b8c-a14e337c7311
00020000-558a-6e78-244e-d7a75eb56cca	00030000-558a-6e78-6f6c-10489517d579
00020000-558a-6e78-244e-d7a75eb56cca	00030000-558a-6e78-946c-cbbd40d041ee
00020000-558a-6e78-244e-d7a75eb56cca	00030000-558a-6e78-8e3d-078ebdcc1bb5
00020000-558a-6e78-244e-d7a75eb56cca	00030000-558a-6e78-d16f-5eb01cd421c9
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-3255-a0261bbeffce
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-506e-fa3bf5a57c3c
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-6f6c-10489517d579
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-15d1-c132ccdede79
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-f200-bc4f59a30ae3
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-9a7a-b853841bdc88
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-bca9-8a0807c345e9
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-988b-2756fe36659c
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-df84-34492271de08
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-8482-b54e9efd2184
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-9990-7aa7db019746
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-900a-db4d5ab33d0a
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-17a1-e8143038dcf1
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-0261-92e27d9d2a56
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-36df-376591d7e917
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-ae49-204ff4d3a6f4
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-8cc6-f411f9caa421
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-f6ba-48fa729a17a3
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-7a4d-2d47d80e191f
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-7e81-86af427445e0
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-44a7-e8fa3b910be7
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-0af2-cc7a20ee416e
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-2027-a6db2870954a
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-fe3f-71a62dd86366
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-2cb2-72855fd41df6
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-b4f9-155f9d0c7c7c
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-c33d-0afc22d11a1c
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-6506-e16b607c907a
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-1a25-8291c2d7918a
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-4535-78daafb1f15e
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-2eb1-bb8a7b0aedd5
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-8e6b-6a7c602bc542
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-3084-0229e3bb121e
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-5d50-ef44b88d128e
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-b77f-5750604e34e1
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-6e22-febf9a8f9b89
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-d0d5-caf8a11cfa0c
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-5b65-9131626704bb
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-25c4-db54f664a5db
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-b56b-920fae501d64
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-c66a-a2c7e3811398
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-40d3-b1282102748b
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-56a3-34dcab365c40
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-a746-e7d9daf2c6ed
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-6b12-04f5ff902e84
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-8dae-c6208d136fdb
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-38b8-0500a8eacf36
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-ba51-32f48e814dc5
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-37e8-e2ffc401f806
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-1293-d7bf8c79c837
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-60a1-323d58296827
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-f59e-057c98c0370d
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-6a2d-a2bdfe37d637
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-7a18-da216cd46e6d
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-7d1a-513cfc53a9cd
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-6a6f-99c91a10ccf4
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-e5d9-70dcad5d5ce1
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-f380-d347a06c4d06
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-f4f9-598698b86ce6
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-4725-23c36e7ad516
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-16f9-5d9ec8b073d6
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-631d-8f000b9fc269
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-a9a7-c68cf5072502
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-5205-b0065aef1787
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-4006-f090d34adedb
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-7483-5d69fafd6da4
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-be33-5039ad398946
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-7aa2-515ccaefb318
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-f5a5-71b415647e29
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-652e-bd56706d3c2c
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-3567-4aacfd7d4b10
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-1a0b-a5830b193684
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-e357-3d6d93cf0933
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-4af2-42c91afabcbf
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-d5a7-d0471a4b4be9
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-5968-28ce432d4885
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-3c0b-55acc23c20e7
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-bc1b-1a9333daa373
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-df3f-7d8bc7176323
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-3add-c138d6975a2a
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-3d78-8b99e336bdca
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-79f5-4fb6f55636e7
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-f499-b0b1aa18d6e4
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-5f8d-eda41b3eae4c
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-8173-7c35eab79f61
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-950a-f70c7c72eddc
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-adc7-4fbbbdbb0200
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-40c0-b99685ea59e1
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-3654-d71b67a4a064
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-d01f-3c59f3a0435f
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-59fc-2b8b3b2c205e
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-49b4-db14999a90be
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-b969-f30c500535a3
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-7e26-00214b8aade4
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-206f-a0e233a196bd
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-c679-92280a5dcaaa
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-2df9-c27614632f65
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-d67f-69e22d083bcf
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-50c8-e1bf12bbdcc1
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-f300-b03773d0a3e0
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-ac14-13d9245f5b29
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-895e-76ff76a29a4d
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-d495-1c1c7199d40c
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-bf34-7e310f585c1c
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-d9c5-75367111539c
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-e08d-f03c16412ec6
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-a170-3cd20ce1e8dd
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-6b8c-a14e337c7311
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-1a8f-25f2c00c9430
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-946c-cbbd40d041ee
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-8990-3fa77216cae9
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-6250-1e79064458f2
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-ee87-0e2f2c12327f
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-1cce-d050d0c847c1
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-0bb0-330d546ff165
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-98e3-e2bef0a24587
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-f3e3-b22d5607a5ae
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-76c4-7003c360e40d
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-a655-3456ec80a350
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-c78a-b462518d999a
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-793e-3de4acb5dc8e
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-8a7e-751a4fdd1e1c
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-794d-0dea9e87063d
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-bafb-f482eac054b4
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-ef53-38d7e38f3784
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-8e3d-078ebdcc1bb5
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-c61d-167a1d81c267
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-d16f-5eb01cd421c9
00020000-558a-6e7a-c670-f265424ced00	00030000-558a-6e78-b626-2da5ca0c6340
\.


--
-- TOC entry 2881 (class 0 OID 8114331)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8114362)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 8114498)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-558a-6e7a-5b21-6e19ffb57400	00090000-558a-6e7a-8a64-2a0da1220954	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2858 (class 0 OID 8114096)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-558a-6e7a-7b52-c5a66aa31af6	00040000-558a-6e78-40ea-02970005c548	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558a-6e7a-e4db-f325fdab07ef	00040000-558a-6e78-40ea-02970005c548	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558a-6e7a-d35c-ed202ce43436	00040000-558a-6e78-40ea-02970005c548	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558a-6e7a-9bdf-08453c7df2a9	00040000-558a-6e78-40ea-02970005c548	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558a-6e7a-f6ab-bf89fab857c4	00040000-558a-6e78-40ea-02970005c548	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558a-6e7a-2050-8cce12ccccf7	00040000-558a-6e78-55fc-0d11b2fcf989	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2860 (class 0 OID 8114131)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-558a-6e78-5333-c528f770e167	8341	Adlešiči
00050000-558a-6e78-48d4-79e29415bb86	5270	Ajdovščina
00050000-558a-6e78-154f-ebf22566638e	6280	Ankaran/Ancarano
00050000-558a-6e78-1ded-175a7543490b	9253	Apače
00050000-558a-6e78-1ca8-bf37c605edba	8253	Artiče
00050000-558a-6e78-001e-b494a7e719a8	4275	Begunje na Gorenjskem
00050000-558a-6e78-60a9-4ab8287e1dd4	1382	Begunje pri Cerknici
00050000-558a-6e78-1150-3ef2e2d33e10	9231	Beltinci
00050000-558a-6e78-65c9-a7a235cf6221	2234	Benedikt
00050000-558a-6e78-2d2f-7e20488fb7ec	2345	Bistrica ob Dravi
00050000-558a-6e78-dcd1-af310f3b868e	3256	Bistrica ob Sotli
00050000-558a-6e78-6f7b-5a7568c3dee0	8259	Bizeljsko
00050000-558a-6e78-aed2-cc85abfbaf79	1223	Blagovica
00050000-558a-6e78-743b-fbb89cf8aaa5	8283	Blanca
00050000-558a-6e78-7918-51fc8f7d260f	4260	Bled
00050000-558a-6e78-d5b1-44b352a9f6eb	4273	Blejska Dobrava
00050000-558a-6e78-afdd-b191bc722994	9265	Bodonci
00050000-558a-6e78-ca69-c133ddb5917c	9222	Bogojina
00050000-558a-6e78-72b2-94cc1e8a605f	4263	Bohinjska Bela
00050000-558a-6e78-e4ce-62d54f7b3322	4264	Bohinjska Bistrica
00050000-558a-6e78-6ef3-e37b743f9ab0	4265	Bohinjsko jezero
00050000-558a-6e78-861e-d9ac74803e2f	1353	Borovnica
00050000-558a-6e78-edb1-3532fb1ac40e	8294	Boštanj
00050000-558a-6e78-4cee-dbe8f9eb5c7d	5230	Bovec
00050000-558a-6e78-c761-3672736007dc	5295	Branik
00050000-558a-6e78-b08f-1d1c650c7d6e	3314	Braslovče
00050000-558a-6e78-4bc1-5fd82df7a848	5223	Breginj
00050000-558a-6e78-f6df-49af28f40eb3	8280	Brestanica
00050000-558a-6e78-f04b-e3fbd1be0f4f	2354	Bresternica
00050000-558a-6e78-bdd4-ea28c8298cf5	4243	Brezje
00050000-558a-6e78-d162-c9aa3a249e40	1351	Brezovica pri Ljubljani
00050000-558a-6e78-6c57-2ba1ecafc2bf	8250	Brežice
00050000-558a-6e78-2fe6-4143559475bc	4210	Brnik - Aerodrom
00050000-558a-6e78-f603-5d8443cb5bf7	8321	Brusnice
00050000-558a-6e78-1e49-55d34afcb839	3255	Buče
00050000-558a-6e78-267c-0469e72d40dd	8276	Bučka 
00050000-558a-6e78-663f-adadc41f9c19	9261	Cankova
00050000-558a-6e78-6cb9-207ad3b0bf7b	3000	Celje 
00050000-558a-6e78-8437-42605b77b747	3001	Celje - poštni predali
00050000-558a-6e78-35e0-1e45390e786a	4207	Cerklje na Gorenjskem
00050000-558a-6e78-b119-0729faa5c153	8263	Cerklje ob Krki
00050000-558a-6e78-80ae-f2ae840e4a9f	1380	Cerknica
00050000-558a-6e78-a7a7-0813ce26b3bf	5282	Cerkno
00050000-558a-6e78-86d4-f51aa8093b5c	2236	Cerkvenjak
00050000-558a-6e78-fdcf-fd1e0612da49	2215	Ceršak
00050000-558a-6e78-81b8-f2838cf6c034	2326	Cirkovce
00050000-558a-6e78-a300-489a6dc2b331	2282	Cirkulane
00050000-558a-6e78-26e4-b3b92989c742	5273	Col
00050000-558a-6e78-be11-c3a737d01852	8251	Čatež ob Savi
00050000-558a-6e78-047a-184b6cbd79da	1413	Čemšenik
00050000-558a-6e78-b624-e41f3cb05d49	5253	Čepovan
00050000-558a-6e78-3e45-596ae5d1496d	9232	Črenšovci
00050000-558a-6e78-9e71-df109fe210eb	2393	Črna na Koroškem
00050000-558a-6e78-dd76-bf2721150fa5	6275	Črni Kal
00050000-558a-6e78-d330-5c44c8c936e7	5274	Črni Vrh nad Idrijo
00050000-558a-6e78-b933-a968f8c046f1	5262	Črniče
00050000-558a-6e78-ef8e-ba46f72380cb	8340	Črnomelj
00050000-558a-6e78-2bd4-bf2ebc12eda3	6271	Dekani
00050000-558a-6e78-1c08-387f544ac291	5210	Deskle
00050000-558a-6e78-1ce9-07e1846cef18	2253	Destrnik
00050000-558a-6e78-6428-dd9ec02fd584	6215	Divača
00050000-558a-6e78-56a3-7b40b2952bd2	1233	Dob
00050000-558a-6e78-c87a-c508b1af0035	3224	Dobje pri Planini
00050000-558a-6e78-5631-31807ddefff1	8257	Dobova
00050000-558a-6e78-bcab-20793ebad3b7	1423	Dobovec
00050000-558a-6e78-4dc5-19fd6abd909d	5263	Dobravlje
00050000-558a-6e78-45aa-575750f13030	3204	Dobrna
00050000-558a-6e78-a6b8-dd8166bae6c1	8211	Dobrnič
00050000-558a-6e78-32c3-59641f54a750	1356	Dobrova
00050000-558a-6e78-fed9-c34783ad5e3e	9223	Dobrovnik/Dobronak 
00050000-558a-6e78-bfa1-53c0421a3944	5212	Dobrovo v Brdih
00050000-558a-6e78-c50a-c03188cf9f67	1431	Dol pri Hrastniku
00050000-558a-6e78-0d37-e6cdbfe01346	1262	Dol pri Ljubljani
00050000-558a-6e78-4179-82d8c229d294	1273	Dole pri Litiji
00050000-558a-6e78-3527-ea50550b21b3	1331	Dolenja vas
00050000-558a-6e78-e69f-3e9eeb1f9e22	8350	Dolenjske Toplice
00050000-558a-6e78-a26a-3cf3b693ea08	1230	Domžale
00050000-558a-6e78-571f-548ee1bf12ff	2252	Dornava
00050000-558a-6e79-aa1f-369013dd5a2e	5294	Dornberk
00050000-558a-6e79-809c-13d0e02a125b	1319	Draga
00050000-558a-6e79-9001-2bcad55c2cd8	8343	Dragatuš
00050000-558a-6e79-7bf1-6046927a7c0c	3222	Dramlje
00050000-558a-6e79-def7-12487d468286	2370	Dravograd
00050000-558a-6e79-81b0-3d9b1535b4f8	4203	Duplje
00050000-558a-6e79-789d-49ec4a94543c	6221	Dutovlje
00050000-558a-6e79-5f7b-bd0e3d803dc8	8361	Dvor
00050000-558a-6e79-52c1-926ffb1a114f	2343	Fala
00050000-558a-6e79-3481-29d7db83997c	9208	Fokovci
00050000-558a-6e79-3468-16c28b97c7e3	2313	Fram
00050000-558a-6e79-8a04-a17d7ac59613	3213	Frankolovo
00050000-558a-6e79-027a-fca1446f15c0	1274	Gabrovka
00050000-558a-6e79-3dc5-bb2135f3210a	8254	Globoko
00050000-558a-6e79-455c-85ff34b943ef	5275	Godovič
00050000-558a-6e79-4acf-c52b7718dcaf	4204	Golnik
00050000-558a-6e79-025d-fb3e2e91156e	3303	Gomilsko
00050000-558a-6e79-b341-14a8e8ab1c4d	4224	Gorenja vas
00050000-558a-6e79-c401-2e4655158a74	3263	Gorica pri Slivnici
00050000-558a-6e79-6822-355576f47048	2272	Gorišnica
00050000-558a-6e79-ba67-45de9ca738b0	9250	Gornja Radgona
00050000-558a-6e79-07f6-d07b1eea6431	3342	Gornji Grad
00050000-558a-6e79-d680-66ea65812ca9	4282	Gozd Martuljek
00050000-558a-6e79-0d54-ed473f40f816	6272	Gračišče
00050000-558a-6e79-cadb-3be006522bbb	9264	Grad
00050000-558a-6e79-6d08-9b5ce95da2e0	8332	Gradac
00050000-558a-6e79-3078-f1b19f4bfac8	1384	Grahovo
00050000-558a-6e79-dc8c-3a6d9072bb16	5242	Grahovo ob Bači
00050000-558a-6e79-99f7-5597a103cf47	5251	Grgar
00050000-558a-6e79-5d8b-744258229fed	3302	Griže
00050000-558a-6e79-91dd-4d549dc44608	3231	Grobelno
00050000-558a-6e79-3fdd-c88e1aba414a	1290	Grosuplje
00050000-558a-6e79-2128-d05fbf9d0212	2288	Hajdina
00050000-558a-6e79-9248-90e24db51326	8362	Hinje
00050000-558a-6e79-3975-0eb4720cefe8	2311	Hoče
00050000-558a-6e79-b9fc-74df1854f463	9205	Hodoš/Hodos
00050000-558a-6e79-a9d8-5cb2e6977cd7	1354	Horjul
00050000-558a-6e79-af10-331de974fe32	1372	Hotedršica
00050000-558a-6e79-fa9b-a9ed7ac79fe2	1430	Hrastnik
00050000-558a-6e79-0f2c-1a865e4a1cb0	6225	Hruševje
00050000-558a-6e79-dfcc-8274febfce3c	4276	Hrušica
00050000-558a-6e79-b93b-8fb0c4eb4fed	5280	Idrija
00050000-558a-6e79-c0ed-cfbc983d6a47	1292	Ig
00050000-558a-6e79-0229-2a726133816d	6250	Ilirska Bistrica
00050000-558a-6e79-fb33-7a598c9f022a	6251	Ilirska Bistrica-Trnovo
00050000-558a-6e79-bd8d-edd23971ba7e	1295	Ivančna Gorica
00050000-558a-6e79-a7ca-63cdd801c9b2	2259	Ivanjkovci
00050000-558a-6e79-d7d4-20753086b9a2	1411	Izlake
00050000-558a-6e79-03aa-cdeca2afedde	6310	Izola/Isola
00050000-558a-6e79-bf86-1ce44ed2569d	2222	Jakobski Dol
00050000-558a-6e79-7f7b-d32d88ddf31a	2221	Jarenina
00050000-558a-6e79-cfe0-23eda78a2ce3	6254	Jelšane
00050000-558a-6e79-7806-59fdd3d8eec0	4270	Jesenice
00050000-558a-6e79-de57-8389b7be2269	8261	Jesenice na Dolenjskem
00050000-558a-6e79-be8a-3e16a4d74fb6	3273	Jurklošter
00050000-558a-6e79-4acc-0e0cc4d3b621	2223	Jurovski Dol
00050000-558a-6e79-946a-f4879ed95475	2256	Juršinci
00050000-558a-6e79-133d-90ab6834ac80	5214	Kal nad Kanalom
00050000-558a-6e79-462c-4e3911263aea	3233	Kalobje
00050000-558a-6e79-e5da-0cc04861e475	4246	Kamna Gorica
00050000-558a-6e79-8a0e-726383e81308	2351	Kamnica
00050000-558a-6e79-0790-21577d8dc4ff	1241	Kamnik
00050000-558a-6e79-7698-d25595d16b37	5213	Kanal
00050000-558a-6e79-57c7-12b38f3d644f	8258	Kapele
00050000-558a-6e79-e33e-52a4f6d0f9c1	2362	Kapla
00050000-558a-6e79-16d5-48c6f7960e7a	2325	Kidričevo
00050000-558a-6e79-3676-92a17f7375bc	1412	Kisovec
00050000-558a-6e79-199f-7794ec1ac8f8	6253	Knežak
00050000-558a-6e79-c2d3-a6ff394e9af3	5222	Kobarid
00050000-558a-6e79-9edf-16a2f19922bf	9227	Kobilje
00050000-558a-6e79-f5f8-723803a9c563	1330	Kočevje
00050000-558a-6e79-4574-0231bc233d96	1338	Kočevska Reka
00050000-558a-6e79-426a-46120b2a4e81	2276	Kog
00050000-558a-6e79-180e-5f874bfda294	5211	Kojsko
00050000-558a-6e79-2d01-4fbafdc679b4	6223	Komen
00050000-558a-6e79-7880-9c0657496131	1218	Komenda
00050000-558a-6e79-c92a-26a7ea0d5355	6000	Koper/Capodistria 
00050000-558a-6e79-be21-8a1106aca36a	6001	Koper/Capodistria - poštni predali
00050000-558a-6e79-6b62-ca3d66c1d022	8282	Koprivnica
00050000-558a-6e79-dded-87b67f4a72bc	5296	Kostanjevica na Krasu
00050000-558a-6e79-850b-470b564f9520	8311	Kostanjevica na Krki
00050000-558a-6e79-d32d-6aa48fb5b8be	1336	Kostel
00050000-558a-6e79-83d1-e6b3e57339f1	6256	Košana
00050000-558a-6e79-9273-b3ed044fa868	2394	Kotlje
00050000-558a-6e79-c510-b06b164703b5	6240	Kozina
00050000-558a-6e79-334d-7c5ed4c3b68d	3260	Kozje
00050000-558a-6e79-e3d2-c56f9e8b8d1d	4000	Kranj 
00050000-558a-6e79-e91b-9f2c50c2e131	4001	Kranj - poštni predali
00050000-558a-6e79-135f-c9a0f1267ad6	4280	Kranjska Gora
00050000-558a-6e79-d92f-c2fcb17aa39b	1281	Kresnice
00050000-558a-6e79-78ac-be44b5827c72	4294	Križe
00050000-558a-6e79-2b77-345948c3053a	9206	Križevci
00050000-558a-6e79-5372-4bcc1e811049	9242	Križevci pri Ljutomeru
00050000-558a-6e79-2912-bfbe45acf7f9	1301	Krka
00050000-558a-6e79-2b29-84ec757c423a	8296	Krmelj
00050000-558a-6e79-81ff-9338e855d120	4245	Kropa
00050000-558a-6e79-87d3-69bef0872714	8262	Krška vas
00050000-558a-6e79-d3da-5f6992318b13	8270	Krško
00050000-558a-6e79-798d-25b6e28ff794	9263	Kuzma
00050000-558a-6e79-67ec-17c0299387b4	2318	Laporje
00050000-558a-6e79-c600-f0f7c7f32dc1	3270	Laško
00050000-558a-6e79-6d28-443bb1e7fa07	1219	Laze v Tuhinju
00050000-558a-6e79-6a98-c2f9800e8247	2230	Lenart v Slovenskih goricah
00050000-558a-6e79-86e5-322cb88ee9f2	9220	Lendava/Lendva
00050000-558a-6e79-5276-b580eb299a20	4248	Lesce
00050000-558a-6e79-e788-836c7388662c	3261	Lesično
00050000-558a-6e79-9941-b3435a5739a6	8273	Leskovec pri Krškem
00050000-558a-6e79-55cf-296f5c4e2b0a	2372	Libeliče
00050000-558a-6e79-581c-b62c561fe53e	2341	Limbuš
00050000-558a-6e79-7df6-707afa19c110	1270	Litija
00050000-558a-6e79-1b8d-73ec95cd59c6	3202	Ljubečna
00050000-558a-6e79-e7d4-742c7e9fbf2f	1000	Ljubljana 
00050000-558a-6e79-c3a1-85308cf16b3a	1001	Ljubljana - poštni predali
00050000-558a-6e79-c85f-be6534e0a4ae	1231	Ljubljana - Črnuče
00050000-558a-6e79-4fb5-fac3babc5ea3	1261	Ljubljana - Dobrunje
00050000-558a-6e79-c793-e58ec157d4a9	1260	Ljubljana - Polje
00050000-558a-6e79-83f6-8e76e89efe3d	1210	Ljubljana - Šentvid
00050000-558a-6e79-1ab2-2165748c7c9b	1211	Ljubljana - Šmartno
00050000-558a-6e79-03a2-d0cac7a9d3a7	3333	Ljubno ob Savinji
00050000-558a-6e79-94e2-7508907c3714	9240	Ljutomer
00050000-558a-6e79-f731-18288e96134a	3215	Loče
00050000-558a-6e79-6af6-9b8d724d68a0	5231	Log pod Mangartom
00050000-558a-6e79-0435-cacfdfbc2aab	1358	Log pri Brezovici
00050000-558a-6e79-94cb-202e6677a035	1370	Logatec
00050000-558a-6e79-0740-9cdfa5e8d456	1371	Logatec
00050000-558a-6e79-410c-5f3526522c02	1434	Loka pri Zidanem Mostu
00050000-558a-6e79-6e10-cb6c3b1d53fc	3223	Loka pri Žusmu
00050000-558a-6e79-a02e-108fd4270582	6219	Lokev
00050000-558a-6e79-ad26-2c35bc957f04	1318	Loški Potok
00050000-558a-6e79-e9eb-3e113ce823c1	2324	Lovrenc na Dravskem polju
00050000-558a-6e79-dcd1-199a6e6456d5	2344	Lovrenc na Pohorju
00050000-558a-6e79-453f-e40a923790b9	3334	Luče
00050000-558a-6e79-139a-341d4a570df5	1225	Lukovica
00050000-558a-6e79-0f51-bad98209d902	9202	Mačkovci
00050000-558a-6e79-b1ce-8e41eb1eb239	2322	Majšperk
00050000-558a-6e79-fcfa-46a9f0f5b187	2321	Makole
00050000-558a-6e79-6124-1c01ee29dcb3	9243	Mala Nedelja
00050000-558a-6e79-0443-7f1a91734511	2229	Malečnik
00050000-558a-6e79-ce3f-1bd33c30ea3b	6273	Marezige
00050000-558a-6e79-ab1b-9e2bd88c6445	2000	Maribor 
00050000-558a-6e79-e819-345e53b6c4f1	2001	Maribor - poštni predali
00050000-558a-6e79-7d66-ab68cac4e414	2206	Marjeta na Dravskem polju
00050000-558a-6e79-ae5e-f454d8fa05a3	2281	Markovci
00050000-558a-6e79-6dd4-d93dd9e4357f	9221	Martjanci
00050000-558a-6e79-127e-5c3bdf99e4cd	6242	Materija
00050000-558a-6e79-a5c3-9c5070136fa1	4211	Mavčiče
00050000-558a-6e79-ebc0-1242fde1c44f	1215	Medvode
00050000-558a-6e79-9e6c-d6c45884018d	1234	Mengeš
00050000-558a-6e79-4728-e5458d83830b	8330	Metlika
00050000-558a-6e79-ce1f-3e4792ba7aeb	2392	Mežica
00050000-558a-6e79-36a3-0a880018d43d	2204	Miklavž na Dravskem polju
00050000-558a-6e79-5f07-87a02cfe3d9f	2275	Miklavž pri Ormožu
00050000-558a-6e79-78c2-f701a32d740f	5291	Miren
00050000-558a-6e79-2633-004f6ee72803	8233	Mirna
00050000-558a-6e79-872d-3ae33603040a	8216	Mirna Peč
00050000-558a-6e79-ffb6-fb614fd92ceb	2382	Mislinja
00050000-558a-6e79-9567-884f67f78309	4281	Mojstrana
00050000-558a-6e79-5aab-0acb7e4b4408	8230	Mokronog
00050000-558a-6e79-5fac-821551307fec	1251	Moravče
00050000-558a-6e79-6f3d-9733b2166cfa	9226	Moravske Toplice
00050000-558a-6e79-b417-928230452fac	5216	Most na Soči
00050000-558a-6e79-cfe3-80a65e055e09	1221	Motnik
00050000-558a-6e79-7bef-6f83244cc04a	3330	Mozirje
00050000-558a-6e79-ed6d-20fe0005929c	9000	Murska Sobota 
00050000-558a-6e79-b406-f2ec86532c01	9001	Murska Sobota - poštni predali
00050000-558a-6e79-b177-294abc21915d	2366	Muta
00050000-558a-6e79-af95-320ee8691426	4202	Naklo
00050000-558a-6e79-8106-702082be8374	3331	Nazarje
00050000-558a-6e79-0e05-654931095de3	1357	Notranje Gorice
00050000-558a-6e79-a87d-c8ae2cf7557c	3203	Nova Cerkev
00050000-558a-6e79-3636-4a00b2d4c94a	5000	Nova Gorica 
00050000-558a-6e79-1c6e-45edafdd2524	5001	Nova Gorica - poštni predali
00050000-558a-6e79-c5ef-61df58f1d7ce	1385	Nova vas
00050000-558a-6e79-c53f-1cb5bcdc7349	8000	Novo mesto
00050000-558a-6e79-4ebd-8791a742a101	8001	Novo mesto - poštni predali
00050000-558a-6e79-954b-0392213a2596	6243	Obrov
00050000-558a-6e79-06fb-5eb2e6d37fc2	9233	Odranci
00050000-558a-6e79-ff50-4ac8405bccca	2317	Oplotnica
00050000-558a-6e79-aedf-cd54945f3999	2312	Orehova vas
00050000-558a-6e79-c7fa-95a1e5a1de2b	2270	Ormož
00050000-558a-6e79-bc0c-0c5ad2d7d27b	1316	Ortnek
00050000-558a-6e79-9519-d6a2069f9e94	1337	Osilnica
00050000-558a-6e79-9854-199e45ac446c	8222	Otočec
00050000-558a-6e79-3b3c-32994d15783c	2361	Ožbalt
00050000-558a-6e79-b545-e91839eb1664	2231	Pernica
00050000-558a-6e79-66ef-ee97abe270e7	2211	Pesnica pri Mariboru
00050000-558a-6e79-2f60-a76d88942d5e	9203	Petrovci
00050000-558a-6e79-f164-47e2d1c2e730	3301	Petrovče
00050000-558a-6e79-52af-bfc88b89da76	6330	Piran/Pirano
00050000-558a-6e79-442a-088ba4525a9f	8255	Pišece
00050000-558a-6e79-b923-71ffd3dc5554	6257	Pivka
00050000-558a-6e79-fd02-dd96f819e91e	6232	Planina
00050000-558a-6e79-17eb-01a431a19e48	3225	Planina pri Sevnici
00050000-558a-6e79-7322-a2e9e7cb791a	6276	Pobegi
00050000-558a-6e79-dd38-a50acf7331c0	8312	Podbočje
00050000-558a-6e79-a56a-cf66f90e4e15	5243	Podbrdo
00050000-558a-6e79-5f9c-27c18b98c630	3254	Podčetrtek
00050000-558a-6e79-1a3c-030c6f1c8d83	2273	Podgorci
00050000-558a-6e79-c281-ea195d611373	6216	Podgorje
00050000-558a-6e79-83dc-9371151719cb	2381	Podgorje pri Slovenj Gradcu
00050000-558a-6e79-e078-5a7ad4f170ec	6244	Podgrad
00050000-558a-6e79-ada9-03f7115d3320	1414	Podkum
00050000-558a-6e79-5e92-3efafa95a88d	2286	Podlehnik
00050000-558a-6e79-b297-b239e1ef2a1a	5272	Podnanos
00050000-558a-6e79-f3d5-499ecd6d736b	4244	Podnart
00050000-558a-6e79-ceba-4972a61bc907	3241	Podplat
00050000-558a-6e79-88f4-768408f012c6	3257	Podsreda
00050000-558a-6e79-3934-3ec83651f04c	2363	Podvelka
00050000-558a-6e79-15d0-96e6bdbb7187	2208	Pohorje
00050000-558a-6e79-dd78-701e2bd693a2	2257	Polenšak
00050000-558a-6e79-098c-a10416d4c1cd	1355	Polhov Gradec
00050000-558a-6e79-b742-1ff6012fc162	4223	Poljane nad Škofjo Loko
00050000-558a-6e79-076b-23ab6cba1981	2319	Poljčane
00050000-558a-6e79-3bf9-3774c97dc54d	1272	Polšnik
00050000-558a-6e79-8d5b-eb87377b02bd	3313	Polzela
00050000-558a-6e79-a458-f0822c8bcc02	3232	Ponikva
00050000-558a-6e79-2cf5-88ed3064f970	6320	Portorož/Portorose
00050000-558a-6e79-ed1c-1c6c49b7e227	6230	Postojna
00050000-558a-6e79-2802-d0c2fb3fb9ea	2331	Pragersko
00050000-558a-6e79-6794-94ae7a1216e5	3312	Prebold
00050000-558a-6e79-30b3-18e49dfc6ed2	4205	Preddvor
00050000-558a-6e79-4d02-d9155952eeb2	6255	Prem
00050000-558a-6e79-86ab-1ad1e22e602f	1352	Preserje
00050000-558a-6e79-ed5b-7362a5c19724	6258	Prestranek
00050000-558a-6e79-2655-2bd76e46e2dc	2391	Prevalje
00050000-558a-6e79-9858-3a98a798263c	3262	Prevorje
00050000-558a-6e79-86f7-8c9d20de2324	1276	Primskovo 
00050000-558a-6e79-fe66-2f39e7b25d95	3253	Pristava pri Mestinju
00050000-558a-6e79-cd23-a12e8cf6f58c	9207	Prosenjakovci/Partosfalva
00050000-558a-6e79-d129-4aeff2594bb8	5297	Prvačina
00050000-558a-6e79-99ac-5c80e0931cab	2250	Ptuj
00050000-558a-6e79-bf68-93c06c3a1e9a	2323	Ptujska Gora
00050000-558a-6e79-c4eb-db0284286ce5	9201	Puconci
00050000-558a-6e79-325b-9c099051663f	2327	Rače
00050000-558a-6e79-3c25-071160ea88ba	1433	Radeče
00050000-558a-6e79-108d-b28750f9bfbe	9252	Radenci
00050000-558a-6e79-a616-810f6ed6258f	2360	Radlje ob Dravi
00050000-558a-6e79-268c-a84aeef924f9	1235	Radomlje
00050000-558a-6e79-c5e5-1ad518567c21	4240	Radovljica
00050000-558a-6e79-6eb4-f017988e5f8a	8274	Raka
00050000-558a-6e79-b4f7-80f52876f90a	1381	Rakek
00050000-558a-6e79-1fc2-a79cb6ed2753	4283	Rateče - Planica
00050000-558a-6e79-a11e-bc9f15039cc2	2390	Ravne na Koroškem
00050000-558a-6e79-5949-79ab2a736ea9	9246	Razkrižje
00050000-558a-6e79-2c8f-53d7106ad609	3332	Rečica ob Savinji
00050000-558a-6e79-5cf7-819e385b501c	5292	Renče
00050000-558a-6e79-d96b-ba23501f757a	1310	Ribnica
00050000-558a-6e79-95e6-0368111e60fa	2364	Ribnica na Pohorju
00050000-558a-6e79-73e6-26ac03650fb1	3272	Rimske Toplice
00050000-558a-6e79-d79e-1f4bf53fa340	1314	Rob
00050000-558a-6e79-d109-49c1e9b0b1ee	5215	Ročinj
00050000-558a-6e79-e17c-c5bd9fa6d4ab	3250	Rogaška Slatina
00050000-558a-6e79-4933-6a4d1da2391e	9262	Rogašovci
00050000-558a-6e79-25fb-b3d727923e79	3252	Rogatec
00050000-558a-6e79-0048-f272b793e019	1373	Rovte
00050000-558a-6e79-948b-5523eee1993d	2342	Ruše
00050000-558a-6e79-069c-228c574c8eb2	1282	Sava
00050000-558a-6e79-6106-ac8b773a85b1	6333	Sečovlje/Sicciole
00050000-558a-6e79-c5d8-240e953e30a2	4227	Selca
00050000-558a-6e79-750e-e2e1d01602ee	2352	Selnica ob Dravi
00050000-558a-6e79-81a6-079ca2c5dc9a	8333	Semič
00050000-558a-6e79-464f-791982357d6b	8281	Senovo
00050000-558a-6e79-3a23-f5e54e2329fd	6224	Senožeče
00050000-558a-6e79-bf09-265e60e96fa9	8290	Sevnica
00050000-558a-6e79-f70d-c496d40a9904	6210	Sežana
00050000-558a-6e79-0c6c-caf206ee4a55	2214	Sladki Vrh
00050000-558a-6e79-80ee-4969d001f300	5283	Slap ob Idrijci
00050000-558a-6e79-5dc0-a093c97aeace	2380	Slovenj Gradec
00050000-558a-6e79-59d5-551de791437a	2310	Slovenska Bistrica
00050000-558a-6e79-e039-faae49849f17	3210	Slovenske Konjice
00050000-558a-6e79-0aa8-f4ae75c32f5d	1216	Smlednik
00050000-558a-6e79-f032-8591cceaa9a4	5232	Soča
00050000-558a-6e79-6e2c-68dde2ba8c69	1317	Sodražica
00050000-558a-6e79-5abe-e8eefb15b783	3335	Solčava
00050000-558a-6e79-219a-08ef13bf9071	5250	Solkan
00050000-558a-6e79-ece4-c9c9e24dc519	4229	Sorica
00050000-558a-6e79-0836-e378c5f51a3c	4225	Sovodenj
00050000-558a-6e79-fec0-58d9cb063e4f	5281	Spodnja Idrija
00050000-558a-6e79-5f2b-049b59c0b1ec	2241	Spodnji Duplek
00050000-558a-6e79-7a42-9b2ba57ad4a9	9245	Spodnji Ivanjci
00050000-558a-6e79-0e5e-bc6057f52d85	2277	Središče ob Dravi
00050000-558a-6e79-8b9a-eced64ca5b1e	4267	Srednja vas v Bohinju
00050000-558a-6e79-8f00-b7750f54a215	8256	Sromlje 
00050000-558a-6e79-59c6-cdb9fc3fa7ef	5224	Srpenica
00050000-558a-6e79-10e5-035cd260aa73	1242	Stahovica
00050000-558a-6e79-9cc7-4c9041ae5331	1332	Stara Cerkev
00050000-558a-6e79-a0c7-72c203700291	8342	Stari trg ob Kolpi
00050000-558a-6e79-91b2-90654226f53d	1386	Stari trg pri Ložu
00050000-558a-6e79-d9dd-4faf6e694df7	2205	Starše
00050000-558a-6e79-68bc-29a340cf1dc0	2289	Stoperce
00050000-558a-6e79-aadd-0fcbf77987eb	8322	Stopiče
00050000-558a-6e79-dbf7-30ca2af21259	3206	Stranice
00050000-558a-6e79-f41f-c062917cb6e3	8351	Straža
00050000-558a-6e79-12c1-2689a7afc4ed	1313	Struge
00050000-558a-6e79-70d1-f826fe84c842	8293	Studenec
00050000-558a-6e79-f2aa-9d8756484c77	8331	Suhor
00050000-558a-6e79-d613-05e524ebe1a2	2233	Sv. Ana v Slovenskih goricah
00050000-558a-6e79-0ea9-2197f9065cad	2235	Sv. Trojica v Slovenskih goricah
00050000-558a-6e79-aeb3-2768fb7da1a0	2353	Sveti Duh na Ostrem Vrhu
00050000-558a-6e79-d14a-bd3d94b1983f	9244	Sveti Jurij ob Ščavnici
00050000-558a-6e79-1c7a-cb6d377106ee	3264	Sveti Štefan
00050000-558a-6e79-3ae1-89dfd983f293	2258	Sveti Tomaž
00050000-558a-6e79-38e7-f33d2a6770f6	9204	Šalovci
00050000-558a-6e79-1039-9b18e0499558	5261	Šempas
00050000-558a-6e79-39c0-75c73530714d	5290	Šempeter pri Gorici
00050000-558a-6e79-9ab1-4c3574c87ac9	3311	Šempeter v Savinjski dolini
00050000-558a-6e79-c9cb-4c60cb532996	4208	Šenčur
00050000-558a-6e79-bbfd-d4a3d6fd5f8e	2212	Šentilj v Slovenskih goricah
00050000-558a-6e79-aaba-9c69747daa92	8297	Šentjanž
00050000-558a-6e79-aefd-3bd40272694d	2373	Šentjanž pri Dravogradu
00050000-558a-6e79-06b0-a723650be301	8310	Šentjernej
00050000-558a-6e79-77fb-6570bc6dece5	3230	Šentjur
00050000-558a-6e79-651e-ae28caa20037	3271	Šentrupert
00050000-558a-6e79-5cb3-3866a27ecaca	8232	Šentrupert
00050000-558a-6e79-0aa8-4b2e144424e9	1296	Šentvid pri Stični
00050000-558a-6e79-eb86-157aae5acdb6	8275	Škocjan
00050000-558a-6e79-a256-977a6a4d728d	6281	Škofije
00050000-558a-6e79-2bf6-65700e11d22e	4220	Škofja Loka
00050000-558a-6e79-21bc-3bd0aeb4f2b6	3211	Škofja vas
00050000-558a-6e79-8788-c997dc92edfa	1291	Škofljica
00050000-558a-6e79-93b9-45cccd42a44c	6274	Šmarje
00050000-558a-6e79-49c3-dad7cbb40e9a	1293	Šmarje - Sap
00050000-558a-6e79-f42a-fa9e072ffd5b	3240	Šmarje pri Jelšah
00050000-558a-6e79-8690-481bb03a98cf	8220	Šmarješke Toplice
00050000-558a-6e79-2fcd-afbfba0876f0	2315	Šmartno na Pohorju
00050000-558a-6e79-e53a-5f67c3c69129	3341	Šmartno ob Dreti
00050000-558a-6e79-6693-d862bb99fe4d	3327	Šmartno ob Paki
00050000-558a-6e79-2577-e4cc5d16b815	1275	Šmartno pri Litiji
00050000-558a-6e79-50ca-7aeb342c6467	2383	Šmartno pri Slovenj Gradcu
00050000-558a-6e79-9dd5-4e6bfb18eb51	3201	Šmartno v Rožni dolini
00050000-558a-6e79-6ad0-3320dbcab548	3325	Šoštanj
00050000-558a-6e79-44ff-2a647383ac79	6222	Štanjel
00050000-558a-6e79-532c-5486ec227b1c	3220	Štore
00050000-558a-6e79-05a0-e3b35a01fa5c	3304	Tabor
00050000-558a-6e79-9864-c13595f9e115	3221	Teharje
00050000-558a-6e79-45d1-480f6380e6be	9251	Tišina
00050000-558a-6e79-6852-0dc9a1f6132a	5220	Tolmin
00050000-558a-6e79-10b3-bf46c1c7efe6	3326	Topolšica
00050000-558a-6e79-7718-f26611e7a595	2371	Trbonje
00050000-558a-6e79-9805-10adea2327cf	1420	Trbovlje
00050000-558a-6e79-89d7-5c13f823c41e	8231	Trebelno 
00050000-558a-6e79-d119-9e5609604207	8210	Trebnje
00050000-558a-6e79-78dc-c2cb801f9ecc	5252	Trnovo pri Gorici
00050000-558a-6e79-5255-af9b0b90bc69	2254	Trnovska vas
00050000-558a-6e79-a5a5-9e283d669205	1222	Trojane
00050000-558a-6e79-bc5e-1124919a6e2b	1236	Trzin
00050000-558a-6e79-a2b0-75a7591080ca	4290	Tržič
00050000-558a-6e79-36fd-8b3e0a5b1a0f	8295	Tržišče
00050000-558a-6e79-21b6-741196f7731b	1311	Turjak
00050000-558a-6e79-8089-2233fd5c286b	9224	Turnišče
00050000-558a-6e79-409e-04e90323a49a	8323	Uršna sela
00050000-558a-6e79-d1e8-a01c30018584	1252	Vače
00050000-558a-6e79-db04-7de45fa249cf	3320	Velenje 
00050000-558a-6e79-e43c-28024caaa843	3322	Velenje - poštni predali
00050000-558a-6e79-d42b-1c701f020722	8212	Velika Loka
00050000-558a-6e79-6ce7-cf279e3002fc	2274	Velika Nedelja
00050000-558a-6e79-1c12-f27d4fbd864a	9225	Velika Polana
00050000-558a-6e79-bd05-2b1996ac6cbf	1315	Velike Lašče
00050000-558a-6e79-30aa-495f9a765048	8213	Veliki Gaber
00050000-558a-6e79-3a67-c2c44f2db21e	9241	Veržej
00050000-558a-6e79-6789-0d35fcee3fb3	1312	Videm - Dobrepolje
00050000-558a-6e79-4ec2-9ceb81bd2180	2284	Videm pri Ptuju
00050000-558a-6e79-e952-68267337812a	8344	Vinica
00050000-558a-6e79-abf8-d1753dc080b6	5271	Vipava
00050000-558a-6e79-e049-39664f286093	4212	Visoko
00050000-558a-6e79-5701-ad40dbe91b1b	1294	Višnja Gora
00050000-558a-6e79-6ef3-2f3156f14b8f	3205	Vitanje
00050000-558a-6e79-cbce-1804a9702976	2255	Vitomarci
00050000-558a-6e79-a5bf-f9c0c0e1fd1c	1217	Vodice
00050000-558a-6e79-689b-1196a3b1a89a	3212	Vojnik\t
00050000-558a-6e79-400b-19e5811aeacf	5293	Volčja Draga
00050000-558a-6e79-8395-03e4ed281faf	2232	Voličina
00050000-558a-6e79-0232-caf0c1aef73c	3305	Vransko
00050000-558a-6e79-248e-f2ace2193233	6217	Vremski Britof
00050000-558a-6e79-cade-6de6f4e9bed1	1360	Vrhnika
00050000-558a-6e79-0071-37cd3367ba33	2365	Vuhred
00050000-558a-6e79-77e6-a9803b86f175	2367	Vuzenica
00050000-558a-6e79-982e-d155835a386d	8292	Zabukovje 
00050000-558a-6e79-77f9-edb31fa5bee8	1410	Zagorje ob Savi
00050000-558a-6e79-fc05-b0a66e50ee3d	1303	Zagradec
00050000-558a-6e79-7bac-4f3923380fcb	2283	Zavrč
00050000-558a-6e79-4ec1-0124a943fa7a	8272	Zdole 
00050000-558a-6e79-98ea-3618f5dc213b	4201	Zgornja Besnica
00050000-558a-6e79-edfc-6cc11fc8720d	2242	Zgornja Korena
00050000-558a-6e79-0a59-dc527fcfc75b	2201	Zgornja Kungota
00050000-558a-6e79-729f-f46ae48062c0	2316	Zgornja Ložnica
00050000-558a-6e79-ecdc-6ab11fabe90f	2314	Zgornja Polskava
00050000-558a-6e79-b165-231868aff3a9	2213	Zgornja Velka
00050000-558a-6e79-a207-ed8614ee1d8d	4247	Zgornje Gorje
00050000-558a-6e79-2add-683a3712c981	4206	Zgornje Jezersko
00050000-558a-6e79-464e-3221e5d5db7a	2285	Zgornji Leskovec
00050000-558a-6e79-054e-a36c90fe55be	1432	Zidani Most
00050000-558a-6e79-5aec-4dd6a75ada12	3214	Zreče
00050000-558a-6e79-5fcc-6135da3d4e19	4209	Žabnica
00050000-558a-6e79-5eb0-f3c8c0c2470d	3310	Žalec
00050000-558a-6e79-6085-54970f4da7ca	4228	Železniki
00050000-558a-6e79-3c79-00dd03ed8921	2287	Žetale
00050000-558a-6e79-d649-e512d3380fcc	4226	Žiri
00050000-558a-6e79-a32e-ebb8b9b57973	4274	Žirovnica
00050000-558a-6e79-e4c6-222054ef0ff3	8360	Žužemberk
\.


--
-- TOC entry 2877 (class 0 OID 8114305)
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
-- TOC entry 2859 (class 0 OID 8114116)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 8114194)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8114317)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8114437)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantieme, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 8114490)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-558a-6e7a-c40d-d0b51cde470f	00080000-558a-6e7a-2050-8cce12ccccf7	0900	AK
00190000-558a-6e7a-dde6-1fc59a923973	00080000-558a-6e7a-d35c-ed202ce43436	0987	A
00190000-558a-6e7a-c243-c1e056806855	00080000-558a-6e7a-e4db-f325fdab07ef	0989	A
\.


--
-- TOC entry 2903 (class 0 OID 8114625)
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
-- TOC entry 2883 (class 0 OID 8114346)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-558a-6e79-ed70-6c59cb3e4229	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-558a-6e79-6666-720917f93062	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-558a-6e79-9b15-6ff851d9d62e	0003	Kazinska	t	84	Kazinska dvorana
00220000-558a-6e79-0882-f12b2cc59a8e	0004	Mali oder	t	24	Mali oder 
00220000-558a-6e79-7186-d564f77c33c7	0005	Komorni oder	t	15	Komorni oder
00220000-558a-6e79-2586-2349ac68cbc6	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-558a-6e79-f3be-739f765c4fa6	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2875 (class 0 OID 8114290)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8114280)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8114479)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8114414)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 8113988)
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
-- TOC entry 2884 (class 0 OID 8114356)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 8114026)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-558a-6e78-ee25-029ba118b5f4	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-558a-6e78-5274-f5b2b2d1ce3f	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-558a-6e78-f88c-e5d643ab323b	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-558a-6e78-d7e3-6e12537acd5a	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-558a-6e78-0b62-eebb3f284623	planer	Planer dogodkov v koledarju	t
00020000-558a-6e78-dc3a-9e18e42e6508	kadrovska	Kadrovska služba	t
00020000-558a-6e78-3440-c54f4031623f	arhivar	Ažuriranje arhivalij	t
00020000-558a-6e78-0700-df73f1f8bdc6	igralec	Igralec	t
00020000-558a-6e78-244e-d7a75eb56cca	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-558a-6e7a-c670-f265424ced00	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2850 (class 0 OID 8114010)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-558a-6e78-947d-a922b7b31b83	00020000-558a-6e78-f88c-e5d643ab323b
00010000-558a-6e78-f548-0c677da4cd67	00020000-558a-6e78-f88c-e5d643ab323b
00010000-558a-6e7a-8e10-9e56f206c046	00020000-558a-6e7a-c670-f265424ced00
\.


--
-- TOC entry 2886 (class 0 OID 8114370)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 8114311)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8114261)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 8114669)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-558a-6e79-4cd5-4025d7731a17	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-558a-6e79-30bc-970a31d2f83c	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-558a-6e79-df55-025cc6161166	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-558a-6e79-dfff-071aac3070b5	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-558a-6e79-5921-e4a289a446b4	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2907 (class 0 OID 8114661)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-558a-6e79-3a1e-bfd33ffb7e75	00230000-558a-6e79-dfff-071aac3070b5	popa
00240000-558a-6e79-dfbd-6542e6ab86ce	00230000-558a-6e79-dfff-071aac3070b5	oseba
00240000-558a-6e79-fe24-152e81fd06a3	00230000-558a-6e79-30bc-970a31d2f83c	prostor
00240000-558a-6e79-8ef6-28d93fdf39c0	00230000-558a-6e79-dfff-071aac3070b5	besedilo
00240000-558a-6e79-1b1a-3ab58a995f04	00230000-558a-6e79-dfff-071aac3070b5	uprizoritev
00240000-558a-6e79-1cca-fc4d5ad88452	00230000-558a-6e79-dfff-071aac3070b5	funkcija
00240000-558a-6e79-9b55-a574cfd7888d	00230000-558a-6e79-dfff-071aac3070b5	tipfunkcije
00240000-558a-6e79-76e7-233cb5157002	00230000-558a-6e79-dfff-071aac3070b5	alternacija
00240000-558a-6e79-d441-b339155b0d82	00230000-558a-6e79-4cd5-4025d7731a17	pogodba
00240000-558a-6e79-ac82-df7029435fc3	00230000-558a-6e79-dfff-071aac3070b5	zaposlitev
\.


--
-- TOC entry 2906 (class 0 OID 8114656)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8114424)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-558a-6e7a-29a1-fc40d3ad93fd	000e0000-558a-6e7a-e5b9-cf83c35996a8	00080000-558a-6e7a-7b52-c5a66aa31af6	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-558a-6e7a-514a-343891e31b63	000e0000-558a-6e7a-e5b9-cf83c35996a8	00080000-558a-6e7a-7b52-c5a66aa31af6	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-558a-6e7a-86d4-ba765237f487	000e0000-558a-6e7a-e5b9-cf83c35996a8	00080000-558a-6e7a-f6ab-bf89fab857c4	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2857 (class 0 OID 8114088)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8114267)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-558a-6e7a-2a94-94dec28508d0	00180000-558a-6e7a-16de-6e34febfe29e	000c0000-558a-6e7a-5bca-5df35ea8c14c	00090000-558a-6e7a-55a6-f1e9057c5778	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558a-6e7a-cb0b-88f9e77c0c0d	00180000-558a-6e7a-16de-6e34febfe29e	000c0000-558a-6e7a-a85c-68706ad04cc9	00090000-558a-6e7a-aa5d-694689628153	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558a-6e7a-74d8-62e0ba88f0a7	00180000-558a-6e7a-16de-6e34febfe29e	000c0000-558a-6e7a-ece3-d34937dbcbc1	00090000-558a-6e7a-53a3-13faa9cf1d26	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558a-6e7a-f5d2-4e156fa4ff5f	00180000-558a-6e7a-16de-6e34febfe29e	000c0000-558a-6e7a-024d-435453a4a731	00090000-558a-6e7a-57ac-13a5904dc1e2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558a-6e7a-9ead-e8e379ddfabf	00180000-558a-6e7a-16de-6e34febfe29e	000c0000-558a-6e7a-dee3-52866100e1f8	00090000-558a-6e7a-7bde-d38032e31bac	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558a-6e7a-da1c-aaa58f972ad8	00180000-558a-6e7a-5fc0-0ae35909be0e	\N	00090000-558a-6e7a-7bde-d38032e31bac	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2894 (class 0 OID 8114468)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-558a-6e79-1a3d-2a4c69212715	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-558a-6e79-b30b-1518a025410c	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-558a-6e79-435e-d894dc844848	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-558a-6e79-c129-c2efcf40f8ba	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-558a-6e79-a08d-40187ea65cd2	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-558a-6e79-e449-e70909c9c32b	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-558a-6e79-2bff-fea47a721b71	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-558a-6e79-4c85-df2afbc69fab	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-558a-6e79-e656-ba4eb693d1c1	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-558a-6e79-62d1-68cf4573fb43	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-558a-6e79-eea6-78dbb2217a3c	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-558a-6e79-e0a6-ec2619164e5e	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-558a-6e79-fb9b-8f68b4f06bf5	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-558a-6e79-9ecd-d252857c91ed	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-558a-6e79-0757-e9e4023899a0	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-558a-6e79-7fc8-a57f695c3dbf	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2904 (class 0 OID 8114638)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-558a-6e79-d939-6a322ea33db3	01	Velika predstava	f	1.00	1.00
002b0000-558a-6e79-71c9-df223500228a	02	Mala predstava	f	0.50	0.50
002b0000-558a-6e79-4c29-cc5eadc477d2	03	Mala koprodukcija	t	0.40	1.00
002b0000-558a-6e79-e6b5-42b24226d01a	04	Srednja koprodukcija	t	0.70	2.00
002b0000-558a-6e79-51c7-6ef97b2f0b30	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2862 (class 0 OID 8114151)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 8113997)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-558a-6e78-f548-0c677da4cd67	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO5yW6ky5M4hu7X1z85O4utGJCC31nw7.	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-558a-6e7a-15cc-93e55fa08a2f	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-558a-6e7a-3ff7-173624b7d12a	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-558a-6e7a-b831-665425ab9578	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-558a-6e7a-d01c-b59cb6d26226	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-558a-6e7a-6d48-c95d85dbfde3	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-558a-6e7a-7e21-5456578349bc	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-558a-6e7a-f84b-9ef979d493c5	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-558a-6e7a-a979-5518d7bedf98	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-558a-6e7a-a773-27effd4c9d50	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-558a-6e7a-8e10-9e56f206c046	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-558a-6e78-947d-a922b7b31b83	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2899 (class 0 OID 8114525)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-558a-6e7a-5e1e-a38740c666fd	00160000-558a-6e79-af39-4ea126de0766	00150000-558a-6e79-989d-eb9940efbec7	00140000-558a-6e78-093e-053ffde930e3	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-558a-6e79-7186-d564f77c33c7
000e0000-558a-6e7a-e5b9-cf83c35996a8	00160000-558a-6e79-0e3f-ced7189d9b36	00150000-558a-6e79-6fde-b138ac8dd61d	00140000-558a-6e78-f231-3fe4b0c617a7	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-558a-6e79-2586-2349ac68cbc6
000e0000-558a-6e7a-ec17-7d5a36d1ac9f	\N	00150000-558a-6e79-6fde-b138ac8dd61d	00140000-558a-6e78-f231-3fe4b0c617a7	00190000-558a-6e7a-dde6-1fc59a923973	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-558a-6e79-7186-d564f77c33c7
000e0000-558a-6e7a-3a31-ba728c74ab1f	\N	00150000-558a-6e79-6fde-b138ac8dd61d	00140000-558a-6e78-f231-3fe4b0c617a7	00190000-558a-6e7a-dde6-1fc59a923973	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-558a-6e79-7186-d564f77c33c7
\.


--
-- TOC entry 2867 (class 0 OID 8114213)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-558a-6e7a-3620-8320a8ca8c38	000e0000-558a-6e7a-e5b9-cf83c35996a8	1	
00200000-558a-6e7a-302b-6e4eeeeb5733	000e0000-558a-6e7a-e5b9-cf83c35996a8	2	
\.


--
-- TOC entry 2882 (class 0 OID 8114338)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8114407)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 8114245)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 8114515)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-558a-6e78-093e-053ffde930e3	01	Drama	drama (SURS 01)
00140000-558a-6e78-de59-2826608139e3	02	Opera	opera (SURS 02)
00140000-558a-6e78-a20b-a0f3bf9af721	03	Balet	balet (SURS 03)
00140000-558a-6e78-a27c-ca00c5fadc8e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-558a-6e78-6710-b807d79f39bd	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-558a-6e78-f231-3fe4b0c617a7	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-558a-6e78-20c6-25494230c2f0	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2888 (class 0 OID 8114397)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-558a-6e79-d11f-fcba41f44ab2	01	Opera	opera
00150000-558a-6e79-d564-224a3d727af0	02	Opereta	opereta
00150000-558a-6e79-c629-751dea1d3e23	03	Balet	balet
00150000-558a-6e79-2d33-da93191d5661	04	Plesne prireditve	plesne prireditve
00150000-558a-6e79-89a1-5cf5683b851b	05	Lutkovno gledališče	lutkovno gledališče
00150000-558a-6e79-5433-52765f75892e	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-558a-6e79-ebc2-3f5dc8d3c649	07	Biografska drama	biografska drama
00150000-558a-6e79-989d-eb9940efbec7	08	Komedija	komedija
00150000-558a-6e79-ecaf-d8f60a8f5a5b	09	Črna komedija	črna komedija
00150000-558a-6e79-ac59-9026963e8e9e	10	E-igra	E-igra
00150000-558a-6e79-6fde-b138ac8dd61d	11	Kriminalka	kriminalka
00150000-558a-6e79-8835-08a9f38d6e00	12	Musical	musical
\.


--
-- TOC entry 2439 (class 2606 OID 8114051)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 8114572)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8114562)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8114467)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 8114235)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 8114260)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 8114654)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 8114177)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 8114620)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 8114393)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8114211)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 8114254)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 8114191)
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
-- TOC entry 2531 (class 2606 OID 8114303)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 8114330)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 8114149)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 8114060)
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
-- TOC entry 2446 (class 2606 OID 8114084)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 8114040)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2430 (class 2606 OID 8114025)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 8114336)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 8114369)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 8114510)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 8114113)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 8114137)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 8114309)
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
-- TOC entry 2461 (class 2606 OID 8114127)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 8114198)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 8114321)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 8114449)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 8114495)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 8114636)
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
-- TOC entry 2551 (class 2606 OID 8114353)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 8114294)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 8114285)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 8114489)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 8114421)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 8113996)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 8114360)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 8114014)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2432 (class 2606 OID 8114034)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 8114378)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8114316)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 8114266)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 8114678)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 8114666)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 8114660)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 8114434)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 8114093)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 8114276)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8114478)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 8114648)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 8114162)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8114009)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 8114541)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 8114220)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 8114344)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 8114412)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 8114249)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 8114523)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 8114405)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 1259 OID 8114242)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2579 (class 1259 OID 8114435)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2580 (class 1259 OID 8114436)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2453 (class 1259 OID 8114115)
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
-- TOC entry 2544 (class 1259 OID 8114337)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2538 (class 1259 OID 8114323)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2539 (class 1259 OID 8114322)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2490 (class 1259 OID 8114221)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2566 (class 1259 OID 8114394)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2567 (class 1259 OID 8114396)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2568 (class 1259 OID 8114395)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2478 (class 1259 OID 8114193)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2479 (class 1259 OID 8114192)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 8114512)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2598 (class 1259 OID 8114513)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 8114514)
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
-- TOC entry 2606 (class 1259 OID 8114546)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2607 (class 1259 OID 8114543)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2608 (class 1259 OID 8114547)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2609 (class 1259 OID 8114545)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2610 (class 1259 OID 8114544)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2468 (class 1259 OID 8114164)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2469 (class 1259 OID 8114163)
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
-- TOC entry 2444 (class 1259 OID 8114087)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2554 (class 1259 OID 8114361)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2508 (class 1259 OID 8114255)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2434 (class 1259 OID 8114041)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2435 (class 1259 OID 8114042)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2559 (class 1259 OID 8114381)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2560 (class 1259 OID 8114380)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2561 (class 1259 OID 8114379)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2482 (class 1259 OID 8114199)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2483 (class 1259 OID 8114201)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2484 (class 1259 OID 8114200)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2642 (class 1259 OID 8114668)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2518 (class 1259 OID 8114289)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2519 (class 1259 OID 8114287)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2520 (class 1259 OID 8114286)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2521 (class 1259 OID 8114288)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2425 (class 1259 OID 8114015)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2426 (class 1259 OID 8114016)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2547 (class 1259 OID 8114345)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2533 (class 1259 OID 8114310)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2575 (class 1259 OID 8114422)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2576 (class 1259 OID 8114423)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2628 (class 1259 OID 8114624)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2629 (class 1259 OID 8114621)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2630 (class 1259 OID 8114622)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2631 (class 1259 OID 8114623)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2457 (class 1259 OID 8114129)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2458 (class 1259 OID 8114128)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2459 (class 1259 OID 8114130)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2418 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2583 (class 1259 OID 8114450)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2584 (class 1259 OID 8114451)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2620 (class 1259 OID 8114576)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2621 (class 1259 OID 8114578)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2622 (class 1259 OID 8114574)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2623 (class 1259 OID 8114577)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2624 (class 1259 OID 8114575)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2572 (class 1259 OID 8114413)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 8114298)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2525 (class 1259 OID 8114297)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2526 (class 1259 OID 8114295)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2527 (class 1259 OID 8114296)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2396 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2616 (class 1259 OID 8114564)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2617 (class 1259 OID 8114563)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2632 (class 1259 OID 8114637)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2489 (class 1259 OID 8114212)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2639 (class 1259 OID 8114655)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2440 (class 1259 OID 8114062)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2441 (class 1259 OID 8114061)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2449 (class 1259 OID 8114094)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2450 (class 1259 OID 8114095)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2513 (class 1259 OID 8114279)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2514 (class 1259 OID 8114278)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2515 (class 1259 OID 8114277)
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
-- TOC entry 2496 (class 1259 OID 8114244)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2497 (class 1259 OID 8114240)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2498 (class 1259 OID 8114237)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2499 (class 1259 OID 8114238)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2500 (class 1259 OID 8114236)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2501 (class 1259 OID 8114241)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2502 (class 1259 OID 8114239)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2456 (class 1259 OID 8114114)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2474 (class 1259 OID 8114178)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2475 (class 1259 OID 8114180)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2476 (class 1259 OID 8114179)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2477 (class 1259 OID 8114181)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2532 (class 1259 OID 8114304)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2602 (class 1259 OID 8114511)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2611 (class 1259 OID 8114542)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2447 (class 1259 OID 8114085)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2448 (class 1259 OID 8114086)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2569 (class 1259 OID 8114406)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 8114679)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2467 (class 1259 OID 8114150)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2645 (class 1259 OID 8114667)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2552 (class 1259 OID 8114355)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2553 (class 1259 OID 8114354)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 8114573)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2399 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2464 (class 1259 OID 8114138)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 8114524)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2595 (class 1259 OID 8114496)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2596 (class 1259 OID 8114497)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2433 (class 1259 OID 8114035)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2503 (class 1259 OID 8114243)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2676 (class 2606 OID 8114815)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2673 (class 2606 OID 8114800)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2674 (class 2606 OID 8114805)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2678 (class 2606 OID 8114825)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2672 (class 2606 OID 8114795)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2677 (class 2606 OID 8114820)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2675 (class 2606 OID 8114810)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2707 (class 2606 OID 8114970)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 8114975)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2659 (class 2606 OID 8114730)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2695 (class 2606 OID 8114910)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2694 (class 2606 OID 8114905)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2693 (class 2606 OID 8114900)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2671 (class 2606 OID 8114790)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2701 (class 2606 OID 8114940)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2703 (class 2606 OID 8114950)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2702 (class 2606 OID 8114945)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2666 (class 2606 OID 8114765)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2665 (class 2606 OID 8114760)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2691 (class 2606 OID 8114890)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2712 (class 2606 OID 8114995)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2713 (class 2606 OID 8115000)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2714 (class 2606 OID 8115005)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2718 (class 2606 OID 8115025)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2715 (class 2606 OID 8115010)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2719 (class 2606 OID 8115030)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2717 (class 2606 OID 8115020)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2716 (class 2606 OID 8115015)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2664 (class 2606 OID 8114755)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 8114750)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 8114715)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2655 (class 2606 OID 8114710)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2697 (class 2606 OID 8114920)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2679 (class 2606 OID 8114830)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2651 (class 2606 OID 8114690)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2652 (class 2606 OID 8114695)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2700 (class 2606 OID 8114935)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2699 (class 2606 OID 8114930)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2698 (class 2606 OID 8114925)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2667 (class 2606 OID 8114770)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2669 (class 2606 OID 8114780)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2668 (class 2606 OID 8114775)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2733 (class 2606 OID 8115100)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2686 (class 2606 OID 8114865)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2684 (class 2606 OID 8114855)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2683 (class 2606 OID 8114850)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2685 (class 2606 OID 8114860)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2649 (class 2606 OID 8114680)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2650 (class 2606 OID 8114685)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2696 (class 2606 OID 8114915)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2692 (class 2606 OID 8114895)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2705 (class 2606 OID 8114960)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2706 (class 2606 OID 8114965)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2730 (class 2606 OID 8115085)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2727 (class 2606 OID 8115070)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2728 (class 2606 OID 8115075)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2729 (class 2606 OID 8115080)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2661 (class 2606 OID 8114740)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2660 (class 2606 OID 8114735)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2662 (class 2606 OID 8114745)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2709 (class 2606 OID 8114980)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2710 (class 2606 OID 8114985)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2724 (class 2606 OID 8115055)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2726 (class 2606 OID 8115065)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2722 (class 2606 OID 8115045)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2725 (class 2606 OID 8115060)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2723 (class 2606 OID 8115050)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2704 (class 2606 OID 8114955)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2690 (class 2606 OID 8114885)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2689 (class 2606 OID 8114880)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2687 (class 2606 OID 8114870)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2688 (class 2606 OID 8114875)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2721 (class 2606 OID 8115040)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2720 (class 2606 OID 8115035)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2731 (class 2606 OID 8115090)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2670 (class 2606 OID 8114785)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2711 (class 2606 OID 8114990)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 8115095)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2654 (class 2606 OID 8114705)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2653 (class 2606 OID 8114700)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2657 (class 2606 OID 8114720)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2658 (class 2606 OID 8114725)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2682 (class 2606 OID 8114845)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2681 (class 2606 OID 8114840)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2680 (class 2606 OID 8114835)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-06-24 10:46:51 CEST

--
-- PostgreSQL database dump complete
--

