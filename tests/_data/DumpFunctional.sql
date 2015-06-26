--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-26 14:44:52 CEST

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
-- TOC entry 183 (class 1259 OID 8257902)
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
-- TOC entry 230 (class 1259 OID 8258420)
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
-- TOC entry 229 (class 1259 OID 8258403)
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
-- TOC entry 222 (class 1259 OID 8258307)
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
-- TOC entry 197 (class 1259 OID 8258081)
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
-- TOC entry 200 (class 1259 OID 8258115)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8258503)
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
-- TOC entry 192 (class 1259 OID 8258024)
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
-- TOC entry 231 (class 1259 OID 8258433)
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
-- TOC entry 216 (class 1259 OID 8258241)
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
-- TOC entry 195 (class 1259 OID 8258061)
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
-- TOC entry 199 (class 1259 OID 8258109)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8258041)
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
-- TOC entry 205 (class 1259 OID 8258158)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8258183)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8257998)
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
-- TOC entry 184 (class 1259 OID 8257911)
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
-- TOC entry 185 (class 1259 OID 8257922)
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
-- TOC entry 180 (class 1259 OID 8257876)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8257895)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8258190)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8258221)
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
-- TOC entry 226 (class 1259 OID 8258353)
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
-- TOC entry 187 (class 1259 OID 8257955)
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
-- TOC entry 189 (class 1259 OID 8257990)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8258164)
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
-- TOC entry 188 (class 1259 OID 8257975)
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
-- TOC entry 194 (class 1259 OID 8258053)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8258176)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8258296)
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
-- TOC entry 225 (class 1259 OID 8258345)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8258479)
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
-- TOC entry 212 (class 1259 OID 8258205)
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
-- TOC entry 204 (class 1259 OID 8258149)
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
-- TOC entry 203 (class 1259 OID 8258139)
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
-- TOC entry 224 (class 1259 OID 8258334)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8258273)
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
-- TOC entry 177 (class 1259 OID 8257847)
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
-- TOC entry 176 (class 1259 OID 8257845)
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
-- TOC entry 213 (class 1259 OID 8258215)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8257885)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8257869)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8258229)
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
-- TOC entry 207 (class 1259 OID 8258170)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8258120)
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
-- TOC entry 237 (class 1259 OID 8258523)
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
-- TOC entry 236 (class 1259 OID 8258515)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8258510)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8258283)
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
-- TOC entry 186 (class 1259 OID 8257947)
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
-- TOC entry 202 (class 1259 OID 8258126)
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
-- TOC entry 223 (class 1259 OID 8258323)
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
-- TOC entry 233 (class 1259 OID 8258492)
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
-- TOC entry 191 (class 1259 OID 8258010)
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
-- TOC entry 178 (class 1259 OID 8257856)
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
-- TOC entry 228 (class 1259 OID 8258380)
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
-- TOC entry 196 (class 1259 OID 8258072)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8258197)
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
-- TOC entry 218 (class 1259 OID 8258266)
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
-- TOC entry 198 (class 1259 OID 8258104)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8258370)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8258256)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8257850)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2848 (class 0 OID 8257902)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8258420)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-558d-4943-ca33-b233906df754	000d0000-558d-4943-fe14-28b46807a172	\N	00090000-558d-4942-bf6a-75daa8b33166	000b0000-558d-4943-fc30-631389280e7e	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558d-4943-3871-7d777d8df9b5	000d0000-558d-4943-2739-786fc17f4873	\N	00090000-558d-4942-ab1f-048987e0fc76	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558d-4943-bb77-1cdefd9cf113	000d0000-558d-4943-a3b0-8ce9c715027b	\N	00090000-558d-4942-ceeb-e6a50e1e11d9	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558d-4943-a71e-a34ac167daa9	000d0000-558d-4943-2ac0-172f908963b0	\N	00090000-558d-4942-52d5-9437b369b173	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558d-4943-ecf6-b842dcc85316	000d0000-558d-4943-fceb-633ddea8013a	\N	00090000-558d-4942-dbc6-89443e5a72f8	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558d-4943-52b2-18d931769c7d	000d0000-558d-4943-7b0e-a9ac97aed9b6	\N	00090000-558d-4942-ab1f-048987e0fc76	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2894 (class 0 OID 8258403)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 8258307)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-558d-4942-3228-9a82aab32104	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-558d-4942-7f0c-6cbbabd2c414	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-558d-4942-1c13-a136b490ef92	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2862 (class 0 OID 8258081)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-558d-4943-3360-948e04b72395	\N	\N	00200000-558d-4943-167d-420fc720e3b6	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-558d-4943-d661-c2a3ca8ce329	\N	\N	00200000-558d-4943-a30b-ea6da8898cec	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-558d-4943-438c-6c2603c8b699	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-558d-4943-b41e-ed9f324a3ff2	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-558d-4943-a073-df8e28463402	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2865 (class 0 OID 8258115)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 8258503)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 8258024)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-558d-4940-2d55-50b8603a546c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-558d-4940-982e-aa68d67813e5	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-558d-4940-a9f2-b13f967e1d6a	AL	ALB	008	Albania 	Albanija	\N
00040000-558d-4940-65fd-a32a6214db40	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-558d-4940-9237-71365db01976	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-558d-4940-6c4b-dc72cfc6ee0e	AD	AND	020	Andorra 	Andora	\N
00040000-558d-4940-0c41-3e71dd6a3733	AO	AGO	024	Angola 	Angola	\N
00040000-558d-4940-174f-d467ad960fd1	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-558d-4940-b5db-845d20c12140	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-558d-4940-1713-af082a99d768	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-558d-4940-1274-0c2a97a7ee53	AR	ARG	032	Argentina 	Argenitna	\N
00040000-558d-4940-d93c-e3fbc3f6f56d	AM	ARM	051	Armenia 	Armenija	\N
00040000-558d-4940-69be-c08e0d5cb37b	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-558d-4940-8e58-a4b2ea713dc7	AU	AUS	036	Australia 	Avstralija	\N
00040000-558d-4940-f8b1-b14aadc0bd6d	AT	AUT	040	Austria 	Avstrija	\N
00040000-558d-4940-d651-795d56331939	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-558d-4940-086b-0ebdd23b6503	BS	BHS	044	Bahamas 	Bahami	\N
00040000-558d-4940-8b3a-79baba1ed596	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-558d-4940-fa84-4d1450442e9c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-558d-4940-a36a-fbda2196edfc	BB	BRB	052	Barbados 	Barbados	\N
00040000-558d-4940-a107-650124077d03	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-558d-4940-d7b5-bb3e00b60198	BE	BEL	056	Belgium 	Belgija	\N
00040000-558d-4940-2e20-a4d042c0640a	BZ	BLZ	084	Belize 	Belize	\N
00040000-558d-4940-446f-649b53fe297d	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-558d-4940-0185-5dd15cb43fab	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-558d-4940-886b-05d3627902f5	BT	BTN	064	Bhutan 	Butan	\N
00040000-558d-4940-99c8-da4409fb0b32	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-558d-4940-0f06-8922cb93b476	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-558d-4940-85bc-6a78e13a986c	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-558d-4940-be8b-8cbf7564ebd9	BW	BWA	072	Botswana 	Bocvana	\N
00040000-558d-4940-b086-f92e2312b824	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-558d-4940-f98b-e3b8d04441e8	BR	BRA	076	Brazil 	Brazilija	\N
00040000-558d-4940-346e-17bab65df0d1	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-558d-4940-c26d-563f9f4e99ed	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-558d-4940-5580-ea2a5655e2fc	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-558d-4940-2b7d-9f8f3e4de6f9	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-558d-4940-de29-c89000575e7a	BI	BDI	108	Burundi 	Burundi 	\N
00040000-558d-4940-b279-2fec6b605dc8	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-558d-4940-c1f1-c8bb6fb7a26d	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-558d-4940-f8fb-f0b75f238fff	CA	CAN	124	Canada 	Kanada	\N
00040000-558d-4940-8d1c-59630d996efc	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-558d-4940-37b8-87095ed17da7	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-558d-4940-8e31-e06a54d024bd	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-558d-4940-b2c9-d4b11186bc6b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-558d-4940-9243-c17d5eec271c	CL	CHL	152	Chile 	Čile	\N
00040000-558d-4940-883c-ae07d2d2b33c	CN	CHN	156	China 	Kitajska	\N
00040000-558d-4940-38d3-94dbe157f864	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-558d-4940-46d1-7182fe953a7d	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-558d-4940-4cab-66ad39a61abb	CO	COL	170	Colombia 	Kolumbija	\N
00040000-558d-4940-74f4-13edccdd7d22	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-558d-4940-73c2-f238b7739298	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-558d-4940-daba-0bafa2b3e6d9	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-558d-4940-49c9-47102e554779	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-558d-4940-b7d5-2710622cfe30	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-558d-4940-6a04-ed0462d7d41a	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-558d-4940-67b6-9ff960fdb0df	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-558d-4940-944b-926d5c42e7a0	CU	CUB	192	Cuba 	Kuba	\N
00040000-558d-4940-9df3-6f2d7e0bb85e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-558d-4940-4dd2-7cccde1ae158	CY	CYP	196	Cyprus 	Ciper	\N
00040000-558d-4940-a55a-d5e92d185949	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-558d-4940-cbb5-5a1c3938f910	DK	DNK	208	Denmark 	Danska	\N
00040000-558d-4940-1357-4605577fe4df	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-558d-4940-cfb8-11632c9cc0ac	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-558d-4940-472b-5cd8adeb8aea	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-558d-4940-2316-d877f9647fb7	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-558d-4940-937b-6f30501f68ac	EG	EGY	818	Egypt 	Egipt	\N
00040000-558d-4940-80ee-d987cc4c1004	SV	SLV	222	El Salvador 	Salvador	\N
00040000-558d-4940-88d0-12d613cf97ac	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-558d-4940-adc0-bf2c905730c8	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-558d-4940-210c-21684ad4842b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-558d-4940-d5c0-0013347e8eb2	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-558d-4940-fad4-c964e0a4d218	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-558d-4940-b198-3fb2c897f9d6	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-558d-4940-662b-5639db5eef47	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-558d-4940-3fb0-63fb307201dd	FI	FIN	246	Finland 	Finska	\N
00040000-558d-4940-5bd8-a3796259a4f1	FR	FRA	250	France 	Francija	\N
00040000-558d-4940-6d92-772c7c5ce68b	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-558d-4940-2204-d0ecea3c3050	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-558d-4940-c133-5633236fb7b7	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-558d-4940-0bf0-5b2caf1c36bf	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-558d-4940-de49-1a05e02489e9	GA	GAB	266	Gabon 	Gabon	\N
00040000-558d-4940-357b-694863bbd627	GM	GMB	270	Gambia 	Gambija	\N
00040000-558d-4940-83d3-a5aafa1d6ca2	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-558d-4940-d389-77795f82a71b	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-558d-4940-17fb-1db6a2ccaa28	GH	GHA	288	Ghana 	Gana	\N
00040000-558d-4940-dd96-8fc628b5988a	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-558d-4940-15c8-1a5ff2a516f4	GR	GRC	300	Greece 	Grčija	\N
00040000-558d-4940-fd12-39a950a0f290	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-558d-4940-a8a7-ed8bc724f1de	GD	GRD	308	Grenada 	Grenada	\N
00040000-558d-4940-0a8b-1fe6f2f14311	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-558d-4940-2792-9edb8130270e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-558d-4940-1223-ba2f5acdb965	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-558d-4940-c8c8-a0a04dbfbeac	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-558d-4940-aeb2-ae2944142731	GN	GIN	324	Guinea 	Gvineja	\N
00040000-558d-4940-0d48-d95a65bd7950	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-558d-4940-4b12-73ea9bc8a433	GY	GUY	328	Guyana 	Gvajana	\N
00040000-558d-4940-b647-e57c19dd9403	HT	HTI	332	Haiti 	Haiti	\N
00040000-558d-4940-1cce-b50cc567b039	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-558d-4940-c524-64958fc652ae	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-558d-4940-d0b9-8c6b6fefa192	HN	HND	340	Honduras 	Honduras	\N
00040000-558d-4940-81a3-f9ccb834eab9	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-558d-4940-f4fc-bd132ee42884	HU	HUN	348	Hungary 	Madžarska	\N
00040000-558d-4940-83c0-67e8d73b507c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-558d-4940-0c6f-9f2f0f6dd081	IN	IND	356	India 	Indija	\N
00040000-558d-4940-d5e5-33b2e335f680	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-558d-4940-86b4-733776048b74	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-558d-4940-c07c-43e6bcf02a3b	IQ	IRQ	368	Iraq 	Irak	\N
00040000-558d-4940-bb73-eb7b8bf2ae7e	IE	IRL	372	Ireland 	Irska	\N
00040000-558d-4940-2f2d-909cd4f5e952	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-558d-4940-3722-ce1fc30dc5c0	IL	ISR	376	Israel 	Izrael	\N
00040000-558d-4940-00f9-7f0d85abf091	IT	ITA	380	Italy 	Italija	\N
00040000-558d-4940-c369-032bd89f3c66	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-558d-4940-777e-dd03f2183a22	JP	JPN	392	Japan 	Japonska	\N
00040000-558d-4940-4f22-8cd683a1265a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-558d-4940-1420-debde4e4862f	JO	JOR	400	Jordan 	Jordanija	\N
00040000-558d-4940-277e-00c716a4c3a2	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-558d-4940-e5a5-42a2a68f37ed	KE	KEN	404	Kenya 	Kenija	\N
00040000-558d-4940-97ac-895effa7d23b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-558d-4940-ea3d-90ddc9605ad5	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-558d-4940-319a-839a25cbdc29	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-558d-4940-d75d-611edac2e424	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-558d-4940-e4cb-0c7af406d9e5	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-558d-4940-3783-298ed83ad05a	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-558d-4940-0ea6-906f51b0e3ea	LV	LVA	428	Latvia 	Latvija	\N
00040000-558d-4940-8f96-2b5d3fac3283	LB	LBN	422	Lebanon 	Libanon	\N
00040000-558d-4940-fa5a-65d3c1d77927	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-558d-4940-4bdd-729aa8b4e257	LR	LBR	430	Liberia 	Liberija	\N
00040000-558d-4940-38b0-5efd33980051	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-558d-4940-b7c3-89d0dce36283	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-558d-4940-aa19-96984791d583	LT	LTU	440	Lithuania 	Litva	\N
00040000-558d-4940-2594-b5ec6ae05403	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-558d-4940-9f6b-557f46ec7f45	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-558d-4940-4b74-9f274e00676e	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-558d-4940-36da-092fed51a512	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-558d-4940-9160-2fb2b7ffe08b	MW	MWI	454	Malawi 	Malavi	\N
00040000-558d-4940-7ccc-a485a0e1bd33	MY	MYS	458	Malaysia 	Malezija	\N
00040000-558d-4940-781e-bb59b7b88b0f	MV	MDV	462	Maldives 	Maldivi	\N
00040000-558d-4940-4e88-fd36d70fe00b	ML	MLI	466	Mali 	Mali	\N
00040000-558d-4940-2aae-00d66676bee9	MT	MLT	470	Malta 	Malta	\N
00040000-558d-4940-4d42-44ac262fb2bc	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-558d-4940-10b1-d56693cd3ae1	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-558d-4940-7820-651362e962ad	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-558d-4940-c8b2-265ec90fd08d	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-558d-4940-8a38-2674339dd004	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-558d-4940-6ac4-168af0aae329	MX	MEX	484	Mexico 	Mehika	\N
00040000-558d-4940-a12b-1581d3654467	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-558d-4940-c634-00f066e9dd88	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-558d-4940-4fa0-23818162fbe1	MC	MCO	492	Monaco 	Monako	\N
00040000-558d-4940-1c99-9950ff50eae3	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-558d-4940-b37c-9968e8966a0f	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-558d-4940-5d3d-94f8b2836fde	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-558d-4940-2878-5c87be977d7b	MA	MAR	504	Morocco 	Maroko	\N
00040000-558d-4940-aa6e-9d8092345653	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-558d-4940-12f3-96f3aa430b62	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-558d-4940-65ba-282c2a2eec88	NA	NAM	516	Namibia 	Namibija	\N
00040000-558d-4940-6604-277818159ff1	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-558d-4940-224b-910a0a170838	NP	NPL	524	Nepal 	Nepal	\N
00040000-558d-4940-5e99-efdda84e162e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-558d-4940-8e64-6b3a45922314	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-558d-4940-6f91-5644de9e1514	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-558d-4940-2156-a077c10dd88a	NE	NER	562	Niger 	Niger 	\N
00040000-558d-4940-c57c-7ea2611d68ae	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-558d-4940-d8fb-b7a8b754ec67	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-558d-4940-dc1b-93ca4c02fd3f	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-558d-4940-70ca-e78a59eda0e0	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-558d-4940-e289-737cb2169bc1	NO	NOR	578	Norway 	Norveška	\N
00040000-558d-4940-ba73-0078a413c0e2	OM	OMN	512	Oman 	Oman	\N
00040000-558d-4940-7587-e49c95fe77b6	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-558d-4940-6e5c-3689def17ee2	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-558d-4940-1b65-79d0c9207539	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-558d-4940-cbc9-d90dfd9babf1	PA	PAN	591	Panama 	Panama	\N
00040000-558d-4940-aa99-25f05c85e512	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-558d-4940-0c03-73b453875b67	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-558d-4940-39d6-3c5bd5a5be2d	PE	PER	604	Peru 	Peru	\N
00040000-558d-4940-8be1-1102b500410f	PH	PHL	608	Philippines 	Filipini	\N
00040000-558d-4940-3662-a9cf10b6cbb7	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-558d-4940-ae6e-9d296798a916	PL	POL	616	Poland 	Poljska	\N
00040000-558d-4940-6358-0fbda286217f	PT	PRT	620	Portugal 	Portugalska	\N
00040000-558d-4940-dba5-06300766af58	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-558d-4940-d983-cca3c57e4659	QA	QAT	634	Qatar 	Katar	\N
00040000-558d-4940-1b21-8e4c9304546c	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-558d-4940-1a79-01f610c16c1a	RO	ROU	642	Romania 	Romunija	\N
00040000-558d-4940-3132-9b48120dd989	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-558d-4940-5df4-f7c1c2665c03	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-558d-4940-9155-a78d0886a841	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-558d-4940-909c-0d0630b00247	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-558d-4940-90f1-e0665575b255	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-558d-4940-3f5a-1412b316e114	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-558d-4940-6cef-5465e88cc384	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-558d-4940-cc33-b6efb27f5bc2	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-558d-4940-e560-daf40555c583	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-558d-4940-2aa9-a7b8ebcaaa4b	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-558d-4940-a683-da3b9e5702d0	SM	SMR	674	San Marino 	San Marino	\N
00040000-558d-4940-5a7a-3c100c727193	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-558d-4940-5657-46e6990ee7be	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-558d-4940-4c31-936c215fa55f	SN	SEN	686	Senegal 	Senegal	\N
00040000-558d-4940-bd8e-f18876c361ab	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-558d-4940-f082-9094497f7a71	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-558d-4940-eb5a-560902809723	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-558d-4940-bf1a-5e840489c716	SG	SGP	702	Singapore 	Singapur	\N
00040000-558d-4940-08ff-51d9c1a31fce	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-558d-4940-f124-3cc8fb7927a8	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-558d-4940-2d1f-ece8c2e8c8ca	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-558d-4940-3467-5a1961797c4d	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-558d-4940-4f4d-dc6fe3339f10	SO	SOM	706	Somalia 	Somalija	\N
00040000-558d-4940-cf5c-6c0add16f54d	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-558d-4940-6d84-35087c4a12cb	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-558d-4940-eb88-2f97d36801b1	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-558d-4940-206c-894980573521	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-558d-4940-b356-19a9a29e22d4	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-558d-4940-2e5f-c31cc484af7f	SD	SDN	729	Sudan 	Sudan	\N
00040000-558d-4940-9fb9-4ba0746a489b	SR	SUR	740	Suriname 	Surinam	\N
00040000-558d-4940-27be-ec990bb663c6	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-558d-4940-087e-c2b7b5266fed	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-558d-4940-b084-bfec7b2e45af	SE	SWE	752	Sweden 	Švedska	\N
00040000-558d-4940-48e4-c0183e56299a	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-558d-4940-a025-84bb403f1c5b	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-558d-4940-f239-1c3afda01d52	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-558d-4940-5a4c-36f893eccdeb	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-558d-4940-5bee-d1b72d1bac52	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-558d-4940-ebd5-51f400bdb90d	TH	THA	764	Thailand 	Tajska	\N
00040000-558d-4940-7ab7-354c87806911	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-558d-4940-f25c-ddb1c2050af4	TG	TGO	768	Togo 	Togo	\N
00040000-558d-4940-68de-4afc0a2bb526	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-558d-4940-2bb3-e41da22f9fac	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-558d-4940-6469-3695eb466734	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-558d-4940-0628-eff81116daab	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-558d-4940-c429-f92e7be4cc9b	TR	TUR	792	Turkey 	Turčija	\N
00040000-558d-4940-81ae-edd52e778e09	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-558d-4940-5f53-29f23d21e42c	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-558d-4940-057a-105839c2f669	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-558d-4940-6ab2-a027e8cf43a2	UG	UGA	800	Uganda 	Uganda	\N
00040000-558d-4940-8da1-d0239c2bab14	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-558d-4940-5d71-5a37510b0985	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-558d-4940-fdd6-d43cf7ef66bb	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-558d-4940-7eae-be05d1a1c171	US	USA	840	United States 	Združene države Amerike	\N
00040000-558d-4940-4d16-7e16b5b3af04	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-558d-4940-7b64-cce6bd8b139e	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-558d-4940-ebed-c7d3f7945f0f	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-558d-4940-91fb-0e1635df2201	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-558d-4940-d0ea-0d363e3d4d70	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-558d-4940-9330-f3f0721ef84b	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-558d-4940-dbf6-ac858e4ed788	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-558d-4940-1540-08558a414d41	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-558d-4940-f9b0-ed7f2c6b47d0	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-558d-4940-4204-f49313796c13	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-558d-4940-c611-c1f932b3708f	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-558d-4940-959f-0861df45150f	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-558d-4940-4608-95d53fc17a2e	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2896 (class 0 OID 8258433)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-558d-4943-9396-9b4ff1a0af60	000e0000-558d-4943-f257-6f84503db682	\N	\N	10000.80	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-558d-4941-6eb7-2e4529e4fa8e	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-558d-4943-c124-2cc5e43fe545	000e0000-558d-4943-9292-2936e40eaec5	\N	\N	5000.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-558d-4941-5623-e1058566bfb0	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2881 (class 0 OID 8258241)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-558d-4943-fe6f-352a4e212a26	000e0000-558d-4943-9292-2936e40eaec5	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-558d-4941-cff5-3737272321e7
000d0000-558d-4943-fe14-28b46807a172	000e0000-558d-4943-9292-2936e40eaec5	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-558d-4941-cff5-3737272321e7
000d0000-558d-4943-2739-786fc17f4873	000e0000-558d-4943-9292-2936e40eaec5	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-558d-4941-17c4-387dbfa8f9b2
000d0000-558d-4943-a3b0-8ce9c715027b	000e0000-558d-4943-9292-2936e40eaec5	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-558d-4941-3b39-b8f324e5b34a
000d0000-558d-4943-2ac0-172f908963b0	000e0000-558d-4943-9292-2936e40eaec5	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-558d-4941-3b39-b8f324e5b34a
000d0000-558d-4943-fceb-633ddea8013a	000e0000-558d-4943-9292-2936e40eaec5	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-558d-4941-3b39-b8f324e5b34a
000d0000-558d-4943-7b0e-a9ac97aed9b6	000e0000-558d-4943-9292-2936e40eaec5	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-558d-4941-cff5-3737272321e7
\.


--
-- TOC entry 2860 (class 0 OID 8258061)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8258109)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 8258041)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-558d-4943-0352-a1914ef46a74	00080000-558d-4942-b843-e3fd81cfcd0a	00090000-558d-4942-bf6a-75daa8b33166	AK		
\.


--
-- TOC entry 2835 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8258158)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8258183)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 8257998)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-558d-4940-ad8a-f99247caf65e	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-558d-4940-9286-f555320969a0	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-558d-4940-1b79-e32d73c9a9eb	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-558d-4940-2bdf-13de2e83aa98	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-558d-4940-1eb4-4e900990295a	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-558d-4940-5535-f202642593bd	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-558d-4940-b7e6-ae08d2c79acb	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-558d-4940-1012-0c4ab01b431a	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-558d-4940-69f8-1ebaac3ff1d9	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-558d-4940-0947-db3d415c410e	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-558d-4940-4254-5ce3b47ee6f2	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-558d-4940-fc0a-d85df9b84d50	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-558d-4940-08ed-cc6349d4b611	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-558d-4942-83bb-f88c5b271e3c	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-558d-4942-b0fc-62b1f22c4472	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-558d-4942-1125-db6c7f616de5	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-558d-4942-6f8f-1f4fb68e8e4a	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-558d-4942-d98b-52a8ab789dc6	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-558d-4942-ecf9-237b8dc3a42c	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2849 (class 0 OID 8257911)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-558d-4942-503b-b1982e2674c5	00000000-558d-4942-b0fc-62b1f22c4472	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-558d-4942-dd97-3e0393ec1320	00000000-558d-4942-b0fc-62b1f22c4472	00010000-558d-4940-6ebc-61f6efbcc99d	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-558d-4942-7ada-e4754c23b7f0	00000000-558d-4942-1125-db6c7f616de5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2850 (class 0 OID 8257922)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-558d-4942-c95f-14a1a88a5fe9	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-558d-4942-52d5-9437b369b173	00010000-558d-4942-6a89-8000e349bb40	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-558d-4942-ceeb-e6a50e1e11d9	00010000-558d-4942-1ac9-599d024e5eb8	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-558d-4942-b744-e788b82bff93	00010000-558d-4942-e8e7-68f94c52fbdc	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-558d-4942-955f-7adcbf9a0929	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-558d-4942-eb03-6c1099b7096d	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-558d-4942-19bc-35c48f77c6f1	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-558d-4942-b324-8822b1bed68f	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-558d-4942-bf6a-75daa8b33166	00010000-558d-4942-5586-cb164d7e3d33	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-558d-4942-ab1f-048987e0fc76	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-558d-4942-4088-2f8315805214	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-558d-4942-dbc6-89443e5a72f8	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-558d-4942-0cd7-10bc6b088ca7	00010000-558d-4942-aff9-47aa56652d05	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2837 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 8257876)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-558d-4940-8863-31944b359b6a	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-558d-4940-f947-8a77945e12f9	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-558d-4940-12be-fe987ce7bfc0	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-558d-4940-337a-f140a2b6cc2c	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-558d-4940-63af-d626ec4301ec	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-558d-4940-02d8-c1b98aa9e66a	Abonma-read	Abonma - branje	f
00030000-558d-4940-d87d-6af173417e45	Abonma-write	Abonma - spreminjanje	f
00030000-558d-4940-7476-4bf937477bce	Alternacija-read	Alternacija - branje	f
00030000-558d-4940-1098-903450f4d51b	Alternacija-write	Alternacija - spreminjanje	f
00030000-558d-4940-1270-2d5e173cd0d6	Arhivalija-read	Arhivalija - branje	f
00030000-558d-4940-1765-6793752b2b35	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-558d-4940-d851-a1d3dced6a67	Besedilo-read	Besedilo - branje	f
00030000-558d-4940-29bb-aa21a0a58531	Besedilo-write	Besedilo - spreminjanje	f
00030000-558d-4940-1d20-0d04e673ac56	DogodekIzven-read	DogodekIzven - branje	f
00030000-558d-4940-500f-216a19d4ee5c	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-558d-4940-fd07-787cef07f86f	Dogodek-read	Dogodek - branje	f
00030000-558d-4940-b9c2-5d154ebbea58	Dogodek-write	Dogodek - spreminjanje	f
00030000-558d-4940-5918-c8cb9cb3e8a4	DrugiVir-read	DrugiVir - branje	f
00030000-558d-4940-419a-a2d7d7f8216f	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-558d-4940-ed76-cee5b52e965f	Drzava-read	Drzava - branje	f
00030000-558d-4940-9056-1480a0e9087f	Drzava-write	Drzava - spreminjanje	f
00030000-558d-4940-7ae6-f826f2945001	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-558d-4940-e2cf-156c9ae49f84	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-558d-4940-23c2-cf4d1df4eb67	Funkcija-read	Funkcija - branje	f
00030000-558d-4940-42dc-0c399c4ee338	Funkcija-write	Funkcija - spreminjanje	f
00030000-558d-4940-93d1-b279396890d7	Gostovanje-read	Gostovanje - branje	f
00030000-558d-4940-acfe-bb4861c7d384	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-558d-4940-008c-92860a406e6b	Gostujoca-read	Gostujoca - branje	f
00030000-558d-4940-43c4-f64bdaedd05f	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-558d-4940-03d4-4b24bcc20c4c	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-558d-4940-dd39-f8559c9da172	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-558d-4940-7d7d-6661e5ca30a3	Kupec-read	Kupec - branje	f
00030000-558d-4940-fbbb-841d0694e590	Kupec-write	Kupec - spreminjanje	f
00030000-558d-4940-edfa-02f751d31159	NacinPlacina-read	NacinPlacina - branje	f
00030000-558d-4940-dd2b-aed107ba5afe	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-558d-4940-6113-bc8f88692847	Option-read	Option - branje	f
00030000-558d-4940-786c-ecf6360d6464	Option-write	Option - spreminjanje	f
00030000-558d-4940-67a2-c19c0665adcc	OptionValue-read	OptionValue - branje	f
00030000-558d-4940-d080-b75aa4eee927	OptionValue-write	OptionValue - spreminjanje	f
00030000-558d-4940-a2ac-fddb61d3d9ad	Oseba-read	Oseba - branje	f
00030000-558d-4940-7314-0fea47bfa9d8	Oseba-write	Oseba - spreminjanje	f
00030000-558d-4940-506a-5c79eac28da0	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-558d-4940-7029-702218774b51	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-558d-4940-abb7-948a3cf3b866	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-558d-4940-c56c-ca2ef468f8a4	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-558d-4940-a883-75b3f884aaca	Pogodba-read	Pogodba - branje	f
00030000-558d-4940-b6d8-7fb08bb6579e	Pogodba-write	Pogodba - spreminjanje	f
00030000-558d-4940-8d5c-84b40feae435	Popa-read	Popa - branje	f
00030000-558d-4940-5d38-dcdfc2e4fafd	Popa-write	Popa - spreminjanje	f
00030000-558d-4940-03f1-de9d24e48916	Posta-read	Posta - branje	f
00030000-558d-4940-007d-8c55a85502ec	Posta-write	Posta - spreminjanje	f
00030000-558d-4940-6790-b0cd9f236347	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-558d-4940-2689-64292fdeeb54	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-558d-4940-fd53-9093c1c49662	PostniNaslov-read	PostniNaslov - branje	f
00030000-558d-4940-a8ce-d97367e645d0	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-558d-4940-c6e3-857be376dc2e	Predstava-read	Predstava - branje	f
00030000-558d-4940-2353-9b4cbdff4c8d	Predstava-write	Predstava - spreminjanje	f
00030000-558d-4940-f8b6-6e3d730a6472	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-558d-4940-6d57-31aaa84373f7	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-558d-4940-567c-d2db4d55fb26	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-558d-4940-245b-4d2947ab6647	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-558d-4940-46a3-a1e49cb55f70	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-558d-4940-dea8-afb9d8ea1300	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-558d-4940-0313-bcdbab9d3328	ProgramDela-read	ProgramDela - branje	f
00030000-558d-4940-ae7f-6fcb57102309	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-558d-4940-47c1-7c88a1b79ebb	ProgramFestival-read	ProgramFestival - branje	f
00030000-558d-4940-6595-ae99e1edbd14	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-558d-4940-03ac-c968b9695bd8	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-558d-4940-d530-98965255160c	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-558d-4940-8359-e53e2c3f1f25	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-558d-4940-f2ff-97aa75cb268e	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-558d-4940-1d39-7f6fe0f9b2ff	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-558d-4940-688a-28e936e248c4	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-558d-4940-47d3-7caa52790ff3	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-558d-4940-3c2f-ba3bc195cb66	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-558d-4940-1a19-a27043062642	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-558d-4940-0015-4beed367505c	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-558d-4940-cc21-0a8cfeb8ccdf	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-558d-4940-3504-efcf1e701537	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-558d-4940-447f-6ac29d68e7ea	ProgramRazno-read	ProgramRazno - branje	f
00030000-558d-4940-66dc-7149c23c5ac8	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-558d-4940-2c83-598e9c9ec9c7	Prostor-read	Prostor - branje	f
00030000-558d-4940-7c5f-865fac3a99b3	Prostor-write	Prostor - spreminjanje	f
00030000-558d-4940-aa85-a1a87558f8dd	Racun-read	Racun - branje	f
00030000-558d-4940-7b50-ef50c7526e38	Racun-write	Racun - spreminjanje	f
00030000-558d-4940-4ead-b0ada784786c	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-558d-4940-7088-97d861de45e2	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-558d-4940-4524-89c7e4ca5703	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-558d-4940-cbf9-f0884f3fc6ba	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-558d-4940-dadd-cb4d87cf480e	Rekvizit-read	Rekvizit - branje	f
00030000-558d-4940-e5f4-11eda26e2b80	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-558d-4940-ff51-7656b0ba7aa8	Revizija-read	Revizija - branje	f
00030000-558d-4940-b5c3-bd8a89e155db	Revizija-write	Revizija - spreminjanje	f
00030000-558d-4940-f332-c9184112994b	Rezervacija-read	Rezervacija - branje	f
00030000-558d-4940-409a-e5a9d95b7e8d	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-558d-4940-babf-4c4bd8112bbc	SedezniRed-read	SedezniRed - branje	f
00030000-558d-4940-e905-17a30aee011f	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-558d-4940-35de-6fae4d605bfd	Sedez-read	Sedez - branje	f
00030000-558d-4940-7d68-297afa972eaf	Sedez-write	Sedez - spreminjanje	f
00030000-558d-4940-61a6-1093d70c5b5f	Sezona-read	Sezona - branje	f
00030000-558d-4940-9c21-435ee6a089f3	Sezona-write	Sezona - spreminjanje	f
00030000-558d-4940-a8f9-c9d4a3666d1d	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-558d-4940-4ea5-6797f411d5be	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-558d-4940-a03a-d50fcbd11423	Stevilcenje-read	Stevilcenje - branje	f
00030000-558d-4940-1f09-255997add196	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-558d-4940-7020-32380cf74dcf	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-558d-4940-169b-69b66bf6ea8e	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-558d-4940-0438-4969bbbca21a	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-558d-4940-2334-ff3a529aba1c	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-558d-4940-7e7d-c56fa7a3cdd5	Telefonska-read	Telefonska - branje	f
00030000-558d-4940-ba11-692d5f80fa17	Telefonska-write	Telefonska - spreminjanje	f
00030000-558d-4940-d5ac-1b9049367ea8	TerminStoritve-read	TerminStoritve - branje	f
00030000-558d-4940-3a6e-f41de67d79da	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-558d-4940-64e8-a095b9803539	TipFunkcije-read	TipFunkcije - branje	f
00030000-558d-4940-9f2b-b1a72350ea36	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-558d-4940-b229-25b1e1c6343a	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-558d-4940-876b-474796c33ae5	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-558d-4940-d0ab-973774b9689e	Trr-read	Trr - branje	f
00030000-558d-4940-f02e-6c040ec851b7	Trr-write	Trr - spreminjanje	f
00030000-558d-4940-a6b6-a0b5dd332032	Uprizoritev-read	Uprizoritev - branje	f
00030000-558d-4940-91b2-2cd2188dd3bf	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-558d-4940-bf77-8a990a948fe2	Vaja-read	Vaja - branje	f
00030000-558d-4940-e0a3-a0dc16d21401	Vaja-write	Vaja - spreminjanje	f
00030000-558d-4940-e727-fcfac66efb06	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-558d-4940-c0a2-dfa46b101291	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-558d-4940-9f92-8f44b1653393	Zaposlitev-read	Zaposlitev - branje	f
00030000-558d-4940-909b-f390030df4fd	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-558d-4940-6781-539e00adb1dd	Zasedenost-read	Zasedenost - branje	f
00030000-558d-4940-d83f-ede7ccac840a	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-558d-4940-7ac4-f370880b2a9c	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-558d-4940-0e1d-fe7dd0bde545	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-558d-4940-fc7d-9d54ac739b9d	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-558d-4940-42dd-8cd4b855a86e	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2847 (class 0 OID 8257895)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-558d-4940-f591-4e8526c9976c	00030000-558d-4940-f947-8a77945e12f9
00020000-558d-4940-85b8-9202f93528f1	00030000-558d-4940-ed76-cee5b52e965f
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-02d8-c1b98aa9e66a
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-d87d-6af173417e45
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-7476-4bf937477bce
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-1098-903450f4d51b
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-1270-2d5e173cd0d6
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-fd07-787cef07f86f
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-337a-f140a2b6cc2c
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-b9c2-5d154ebbea58
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-ed76-cee5b52e965f
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-9056-1480a0e9087f
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-23c2-cf4d1df4eb67
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-42dc-0c399c4ee338
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-93d1-b279396890d7
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-acfe-bb4861c7d384
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-008c-92860a406e6b
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-43c4-f64bdaedd05f
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-03d4-4b24bcc20c4c
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-dd39-f8559c9da172
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-6113-bc8f88692847
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-67a2-c19c0665adcc
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-a2ac-fddb61d3d9ad
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-7314-0fea47bfa9d8
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-8d5c-84b40feae435
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-5d38-dcdfc2e4fafd
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-03f1-de9d24e48916
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-007d-8c55a85502ec
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-fd53-9093c1c49662
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-a8ce-d97367e645d0
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-c6e3-857be376dc2e
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-2353-9b4cbdff4c8d
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-46a3-a1e49cb55f70
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-dea8-afb9d8ea1300
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-2c83-598e9c9ec9c7
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-7c5f-865fac3a99b3
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-4524-89c7e4ca5703
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-cbf9-f0884f3fc6ba
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-dadd-cb4d87cf480e
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-e5f4-11eda26e2b80
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-61a6-1093d70c5b5f
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-9c21-435ee6a089f3
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-64e8-a095b9803539
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-a6b6-a0b5dd332032
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-91b2-2cd2188dd3bf
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-bf77-8a990a948fe2
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-e0a3-a0dc16d21401
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-6781-539e00adb1dd
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-d83f-ede7ccac840a
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-7ac4-f370880b2a9c
00020000-558d-4940-623d-91743dab3fe7	00030000-558d-4940-fc7d-9d54ac739b9d
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-02d8-c1b98aa9e66a
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-1270-2d5e173cd0d6
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-fd07-787cef07f86f
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-ed76-cee5b52e965f
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-93d1-b279396890d7
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-008c-92860a406e6b
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-03d4-4b24bcc20c4c
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-dd39-f8559c9da172
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-6113-bc8f88692847
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-67a2-c19c0665adcc
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-a2ac-fddb61d3d9ad
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-7314-0fea47bfa9d8
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-8d5c-84b40feae435
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-03f1-de9d24e48916
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-fd53-9093c1c49662
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-a8ce-d97367e645d0
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-c6e3-857be376dc2e
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-2c83-598e9c9ec9c7
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-4524-89c7e4ca5703
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-dadd-cb4d87cf480e
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-61a6-1093d70c5b5f
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-7e7d-c56fa7a3cdd5
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-ba11-692d5f80fa17
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-d0ab-973774b9689e
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-f02e-6c040ec851b7
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-9f92-8f44b1653393
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-909b-f390030df4fd
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-7ac4-f370880b2a9c
00020000-558d-4940-7e1e-448690ac6bbb	00030000-558d-4940-fc7d-9d54ac739b9d
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-02d8-c1b98aa9e66a
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-7476-4bf937477bce
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-1270-2d5e173cd0d6
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-1765-6793752b2b35
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-d851-a1d3dced6a67
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-1d20-0d04e673ac56
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-fd07-787cef07f86f
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-ed76-cee5b52e965f
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-23c2-cf4d1df4eb67
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-93d1-b279396890d7
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-008c-92860a406e6b
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-03d4-4b24bcc20c4c
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-6113-bc8f88692847
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-67a2-c19c0665adcc
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-a2ac-fddb61d3d9ad
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-8d5c-84b40feae435
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-03f1-de9d24e48916
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-c6e3-857be376dc2e
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-46a3-a1e49cb55f70
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-2c83-598e9c9ec9c7
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-4524-89c7e4ca5703
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-dadd-cb4d87cf480e
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-61a6-1093d70c5b5f
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-64e8-a095b9803539
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-bf77-8a990a948fe2
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-6781-539e00adb1dd
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-7ac4-f370880b2a9c
00020000-558d-4940-4284-8bfc9eb72846	00030000-558d-4940-fc7d-9d54ac739b9d
00020000-558d-4940-9f45-45b73b145d1c	00030000-558d-4940-02d8-c1b98aa9e66a
00020000-558d-4940-9f45-45b73b145d1c	00030000-558d-4940-d87d-6af173417e45
00020000-558d-4940-9f45-45b73b145d1c	00030000-558d-4940-1098-903450f4d51b
00020000-558d-4940-9f45-45b73b145d1c	00030000-558d-4940-1270-2d5e173cd0d6
00020000-558d-4940-9f45-45b73b145d1c	00030000-558d-4940-fd07-787cef07f86f
00020000-558d-4940-9f45-45b73b145d1c	00030000-558d-4940-ed76-cee5b52e965f
00020000-558d-4940-9f45-45b73b145d1c	00030000-558d-4940-93d1-b279396890d7
00020000-558d-4940-9f45-45b73b145d1c	00030000-558d-4940-008c-92860a406e6b
00020000-558d-4940-9f45-45b73b145d1c	00030000-558d-4940-6113-bc8f88692847
00020000-558d-4940-9f45-45b73b145d1c	00030000-558d-4940-67a2-c19c0665adcc
00020000-558d-4940-9f45-45b73b145d1c	00030000-558d-4940-8d5c-84b40feae435
00020000-558d-4940-9f45-45b73b145d1c	00030000-558d-4940-03f1-de9d24e48916
00020000-558d-4940-9f45-45b73b145d1c	00030000-558d-4940-c6e3-857be376dc2e
00020000-558d-4940-9f45-45b73b145d1c	00030000-558d-4940-2c83-598e9c9ec9c7
00020000-558d-4940-9f45-45b73b145d1c	00030000-558d-4940-4524-89c7e4ca5703
00020000-558d-4940-9f45-45b73b145d1c	00030000-558d-4940-dadd-cb4d87cf480e
00020000-558d-4940-9f45-45b73b145d1c	00030000-558d-4940-61a6-1093d70c5b5f
00020000-558d-4940-9f45-45b73b145d1c	00030000-558d-4940-64e8-a095b9803539
00020000-558d-4940-9f45-45b73b145d1c	00030000-558d-4940-7ac4-f370880b2a9c
00020000-558d-4940-9f45-45b73b145d1c	00030000-558d-4940-fc7d-9d54ac739b9d
00020000-558d-4940-fab9-96e5e8f2c9db	00030000-558d-4940-02d8-c1b98aa9e66a
00020000-558d-4940-fab9-96e5e8f2c9db	00030000-558d-4940-1270-2d5e173cd0d6
00020000-558d-4940-fab9-96e5e8f2c9db	00030000-558d-4940-fd07-787cef07f86f
00020000-558d-4940-fab9-96e5e8f2c9db	00030000-558d-4940-ed76-cee5b52e965f
00020000-558d-4940-fab9-96e5e8f2c9db	00030000-558d-4940-93d1-b279396890d7
00020000-558d-4940-fab9-96e5e8f2c9db	00030000-558d-4940-008c-92860a406e6b
00020000-558d-4940-fab9-96e5e8f2c9db	00030000-558d-4940-6113-bc8f88692847
00020000-558d-4940-fab9-96e5e8f2c9db	00030000-558d-4940-67a2-c19c0665adcc
00020000-558d-4940-fab9-96e5e8f2c9db	00030000-558d-4940-8d5c-84b40feae435
00020000-558d-4940-fab9-96e5e8f2c9db	00030000-558d-4940-03f1-de9d24e48916
00020000-558d-4940-fab9-96e5e8f2c9db	00030000-558d-4940-c6e3-857be376dc2e
00020000-558d-4940-fab9-96e5e8f2c9db	00030000-558d-4940-2c83-598e9c9ec9c7
00020000-558d-4940-fab9-96e5e8f2c9db	00030000-558d-4940-4524-89c7e4ca5703
00020000-558d-4940-fab9-96e5e8f2c9db	00030000-558d-4940-dadd-cb4d87cf480e
00020000-558d-4940-fab9-96e5e8f2c9db	00030000-558d-4940-61a6-1093d70c5b5f
00020000-558d-4940-fab9-96e5e8f2c9db	00030000-558d-4940-d5ac-1b9049367ea8
00020000-558d-4940-fab9-96e5e8f2c9db	00030000-558d-4940-12be-fe987ce7bfc0
00020000-558d-4940-fab9-96e5e8f2c9db	00030000-558d-4940-64e8-a095b9803539
00020000-558d-4940-fab9-96e5e8f2c9db	00030000-558d-4940-7ac4-f370880b2a9c
00020000-558d-4940-fab9-96e5e8f2c9db	00030000-558d-4940-fc7d-9d54ac739b9d
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-8863-31944b359b6a
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-f947-8a77945e12f9
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-12be-fe987ce7bfc0
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-337a-f140a2b6cc2c
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-63af-d626ec4301ec
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-02d8-c1b98aa9e66a
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-d87d-6af173417e45
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-7476-4bf937477bce
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-1098-903450f4d51b
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-1270-2d5e173cd0d6
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-1765-6793752b2b35
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-d851-a1d3dced6a67
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-29bb-aa21a0a58531
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-1d20-0d04e673ac56
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-500f-216a19d4ee5c
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-fd07-787cef07f86f
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-b9c2-5d154ebbea58
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-ed76-cee5b52e965f
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-9056-1480a0e9087f
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-7ae6-f826f2945001
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-e2cf-156c9ae49f84
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-23c2-cf4d1df4eb67
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-42dc-0c399c4ee338
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-93d1-b279396890d7
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-acfe-bb4861c7d384
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-008c-92860a406e6b
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-43c4-f64bdaedd05f
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-03d4-4b24bcc20c4c
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-dd39-f8559c9da172
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-7d7d-6661e5ca30a3
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-fbbb-841d0694e590
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-edfa-02f751d31159
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-dd2b-aed107ba5afe
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-6113-bc8f88692847
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-786c-ecf6360d6464
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-67a2-c19c0665adcc
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-d080-b75aa4eee927
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-a2ac-fddb61d3d9ad
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-7314-0fea47bfa9d8
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-506a-5c79eac28da0
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-7029-702218774b51
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-abb7-948a3cf3b866
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-c56c-ca2ef468f8a4
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-a883-75b3f884aaca
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-b6d8-7fb08bb6579e
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-8d5c-84b40feae435
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-5d38-dcdfc2e4fafd
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-03f1-de9d24e48916
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-007d-8c55a85502ec
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-6790-b0cd9f236347
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-2689-64292fdeeb54
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-fd53-9093c1c49662
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-a8ce-d97367e645d0
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-c6e3-857be376dc2e
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-2353-9b4cbdff4c8d
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-f8b6-6e3d730a6472
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-6d57-31aaa84373f7
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-567c-d2db4d55fb26
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-245b-4d2947ab6647
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-46a3-a1e49cb55f70
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-dea8-afb9d8ea1300
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-0313-bcdbab9d3328
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-ae7f-6fcb57102309
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-47c1-7c88a1b79ebb
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-6595-ae99e1edbd14
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-03ac-c968b9695bd8
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-d530-98965255160c
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-8359-e53e2c3f1f25
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-f2ff-97aa75cb268e
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-1d39-7f6fe0f9b2ff
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-688a-28e936e248c4
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-47d3-7caa52790ff3
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-3c2f-ba3bc195cb66
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-1a19-a27043062642
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-0015-4beed367505c
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-cc21-0a8cfeb8ccdf
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-3504-efcf1e701537
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-447f-6ac29d68e7ea
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-66dc-7149c23c5ac8
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-2c83-598e9c9ec9c7
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-7c5f-865fac3a99b3
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-aa85-a1a87558f8dd
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-7b50-ef50c7526e38
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-4ead-b0ada784786c
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-7088-97d861de45e2
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-4524-89c7e4ca5703
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-cbf9-f0884f3fc6ba
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-dadd-cb4d87cf480e
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-e5f4-11eda26e2b80
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-ff51-7656b0ba7aa8
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-b5c3-bd8a89e155db
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-f332-c9184112994b
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-409a-e5a9d95b7e8d
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-babf-4c4bd8112bbc
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-e905-17a30aee011f
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-35de-6fae4d605bfd
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-7d68-297afa972eaf
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-61a6-1093d70c5b5f
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-9c21-435ee6a089f3
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-a8f9-c9d4a3666d1d
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-4ea5-6797f411d5be
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-a03a-d50fcbd11423
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-1f09-255997add196
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-7020-32380cf74dcf
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-169b-69b66bf6ea8e
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-0438-4969bbbca21a
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-2334-ff3a529aba1c
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-7e7d-c56fa7a3cdd5
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-ba11-692d5f80fa17
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-d5ac-1b9049367ea8
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-3a6e-f41de67d79da
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-64e8-a095b9803539
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-9f2b-b1a72350ea36
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-b229-25b1e1c6343a
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-876b-474796c33ae5
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-d0ab-973774b9689e
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-f02e-6c040ec851b7
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-a6b6-a0b5dd332032
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-91b2-2cd2188dd3bf
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-bf77-8a990a948fe2
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-e0a3-a0dc16d21401
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-e727-fcfac66efb06
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-c0a2-dfa46b101291
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-9f92-8f44b1653393
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-909b-f390030df4fd
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-6781-539e00adb1dd
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-d83f-ede7ccac840a
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-7ac4-f370880b2a9c
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-0e1d-fe7dd0bde545
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-fc7d-9d54ac739b9d
00020000-558d-4942-1617-e6be4bd844c2	00030000-558d-4940-42dd-8cd4b855a86e
\.


--
-- TOC entry 2875 (class 0 OID 8258190)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8258221)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8258353)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-558d-4943-fc30-631389280e7e	00090000-558d-4942-c95f-14a1a88a5fe9	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2852 (class 0 OID 8257955)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-558d-4942-b843-e3fd81cfcd0a	00040000-558d-4940-2d55-50b8603a546c	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558d-4942-0005-df458e71afe9	00040000-558d-4940-2d55-50b8603a546c	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558d-4942-79d0-64ac0902b0d6	00040000-558d-4940-2d55-50b8603a546c	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558d-4942-38a6-30bef8296d8e	00040000-558d-4940-2d55-50b8603a546c	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558d-4942-74ae-67577b253b81	00040000-558d-4940-2d55-50b8603a546c	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558d-4942-4cf0-ffb6cf673572	00040000-558d-4940-2d1f-ece8c2e8c8ca	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2854 (class 0 OID 8257990)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-558d-4940-a046-a6a5c5dfc851	8341	Adlešiči
00050000-558d-4940-7684-6bc77cc94440	5270	Ajdovščina
00050000-558d-4940-be85-87a7739bd7d7	6280	Ankaran/Ancarano
00050000-558d-4940-55a0-321ebb510b89	9253	Apače
00050000-558d-4940-d818-be78a1edda88	8253	Artiče
00050000-558d-4940-4a84-7b603e3dc358	4275	Begunje na Gorenjskem
00050000-558d-4940-7354-81d1d8ea1cc6	1382	Begunje pri Cerknici
00050000-558d-4940-f9d5-0b5c084b040e	9231	Beltinci
00050000-558d-4940-7a04-74cdc58d23b2	2234	Benedikt
00050000-558d-4940-f378-003c3263c44f	2345	Bistrica ob Dravi
00050000-558d-4940-b6f1-ce176d40ec9e	3256	Bistrica ob Sotli
00050000-558d-4940-02d1-7389dd4f6e90	8259	Bizeljsko
00050000-558d-4940-d79b-71270fb65d0d	1223	Blagovica
00050000-558d-4940-9e50-19babeeed0a7	8283	Blanca
00050000-558d-4940-b16e-8c8ae00c6f0d	4260	Bled
00050000-558d-4940-c29f-cdf578aad7ff	4273	Blejska Dobrava
00050000-558d-4940-591e-1b5050689be4	9265	Bodonci
00050000-558d-4940-6074-81ba787bc568	9222	Bogojina
00050000-558d-4940-3f9d-d611f5d1dcf8	4263	Bohinjska Bela
00050000-558d-4940-ee7c-f26d6f978e3d	4264	Bohinjska Bistrica
00050000-558d-4940-5e3f-b127e675a396	4265	Bohinjsko jezero
00050000-558d-4940-6d3f-2b0871a77f61	1353	Borovnica
00050000-558d-4940-6832-76800c93b2c8	8294	Boštanj
00050000-558d-4940-2893-146d6419225f	5230	Bovec
00050000-558d-4940-31e5-fffded22e8e3	5295	Branik
00050000-558d-4940-a3f7-c49187eabfef	3314	Braslovče
00050000-558d-4940-d671-6f6d50277cc0	5223	Breginj
00050000-558d-4940-8bd6-678e8e34f675	8280	Brestanica
00050000-558d-4940-67b1-e7e291d37f1f	2354	Bresternica
00050000-558d-4940-34be-489e236f232a	4243	Brezje
00050000-558d-4940-10b5-de2d3b43cc25	1351	Brezovica pri Ljubljani
00050000-558d-4940-8388-7df3586ee193	8250	Brežice
00050000-558d-4940-7a05-2b128d9dd5fb	4210	Brnik - Aerodrom
00050000-558d-4940-73a9-04a992486b60	8321	Brusnice
00050000-558d-4940-958d-0120f41cc1e3	3255	Buče
00050000-558d-4940-b2bd-d11c5b6ff09e	8276	Bučka 
00050000-558d-4940-e412-6cc2dd8aa4a0	9261	Cankova
00050000-558d-4940-ad00-a1eb936be8a6	3000	Celje 
00050000-558d-4940-22d7-8468ed12f8dc	3001	Celje - poštni predali
00050000-558d-4940-46b7-66fcdcf2ff63	4207	Cerklje na Gorenjskem
00050000-558d-4940-6141-7e47a556635c	8263	Cerklje ob Krki
00050000-558d-4940-60e6-c87ad5d69f48	1380	Cerknica
00050000-558d-4940-138e-e1496711f1d2	5282	Cerkno
00050000-558d-4940-058d-2ce956c404b1	2236	Cerkvenjak
00050000-558d-4940-ae67-fe862cb4db14	2215	Ceršak
00050000-558d-4940-81e8-a66dc1bf4008	2326	Cirkovce
00050000-558d-4940-fe87-63c40697967b	2282	Cirkulane
00050000-558d-4940-f181-cb2a01278bb2	5273	Col
00050000-558d-4940-ff1b-7dca73d91312	8251	Čatež ob Savi
00050000-558d-4940-82a9-d569214b4db1	1413	Čemšenik
00050000-558d-4940-b6fa-20d6de6a5008	5253	Čepovan
00050000-558d-4941-e37f-2fe9d54c3083	9232	Črenšovci
00050000-558d-4941-82cc-1ca8a9c3e287	2393	Črna na Koroškem
00050000-558d-4941-eb36-21636ddd8868	6275	Črni Kal
00050000-558d-4941-9664-ba04bcad46eb	5274	Črni Vrh nad Idrijo
00050000-558d-4941-d3fa-e22a8923c7bd	5262	Črniče
00050000-558d-4941-16b7-b33d72e8da01	8340	Črnomelj
00050000-558d-4941-6f96-8cd9c600a3e3	6271	Dekani
00050000-558d-4941-2474-28bcf76428da	5210	Deskle
00050000-558d-4941-0a7f-c0695581bc8f	2253	Destrnik
00050000-558d-4941-aeb1-f327feb1d8ce	6215	Divača
00050000-558d-4941-e9bb-7636cdeae983	1233	Dob
00050000-558d-4941-9753-8f53b920be67	3224	Dobje pri Planini
00050000-558d-4941-c1f2-99a65bc52749	8257	Dobova
00050000-558d-4941-51c2-effc6687d04f	1423	Dobovec
00050000-558d-4941-05f7-712a4843c431	5263	Dobravlje
00050000-558d-4941-1e1e-c95980a0f041	3204	Dobrna
00050000-558d-4941-b405-0da641ef935b	8211	Dobrnič
00050000-558d-4941-98af-9601af276d06	1356	Dobrova
00050000-558d-4941-b331-04548f05b6a5	9223	Dobrovnik/Dobronak 
00050000-558d-4941-ee0a-aad5da908dc5	5212	Dobrovo v Brdih
00050000-558d-4941-fed1-e3a2a3305332	1431	Dol pri Hrastniku
00050000-558d-4941-a808-d6d83ec29078	1262	Dol pri Ljubljani
00050000-558d-4941-be15-67c4831c081e	1273	Dole pri Litiji
00050000-558d-4941-392e-8579f54a985e	1331	Dolenja vas
00050000-558d-4941-7a05-6769594e692a	8350	Dolenjske Toplice
00050000-558d-4941-e6b4-518d4cd12fac	1230	Domžale
00050000-558d-4941-7175-f60880e2f884	2252	Dornava
00050000-558d-4941-a5ca-563f30dfe40f	5294	Dornberk
00050000-558d-4941-7acc-ca4f3efcce94	1319	Draga
00050000-558d-4941-f136-d770a036f3ed	8343	Dragatuš
00050000-558d-4941-b44e-7512147134f3	3222	Dramlje
00050000-558d-4941-1074-e2eca3877471	2370	Dravograd
00050000-558d-4941-bf88-9dff8adac530	4203	Duplje
00050000-558d-4941-cddc-69f9e2e9e5f5	6221	Dutovlje
00050000-558d-4941-a472-822986f65311	8361	Dvor
00050000-558d-4941-42dd-2cb9d68ef4a1	2343	Fala
00050000-558d-4941-6637-1e43e453fc90	9208	Fokovci
00050000-558d-4941-fd96-4f9174bd1356	2313	Fram
00050000-558d-4941-e1e5-9a06898c6a53	3213	Frankolovo
00050000-558d-4941-4bdb-6ee94ece8a5a	1274	Gabrovka
00050000-558d-4941-55fa-e9fd3968cebe	8254	Globoko
00050000-558d-4941-a4ff-f592fadb35ec	5275	Godovič
00050000-558d-4941-4143-af4de3e3f731	4204	Golnik
00050000-558d-4941-b7c6-20196d1f9905	3303	Gomilsko
00050000-558d-4941-6d21-a326f19afedb	4224	Gorenja vas
00050000-558d-4941-45a4-751d4b95e324	3263	Gorica pri Slivnici
00050000-558d-4941-7ccf-675764b768fe	2272	Gorišnica
00050000-558d-4941-5cd1-58394bb54ab6	9250	Gornja Radgona
00050000-558d-4941-b5ce-667a9dd7b71a	3342	Gornji Grad
00050000-558d-4941-5a7f-92cf6198df72	4282	Gozd Martuljek
00050000-558d-4941-2a62-6a7c0f4c2e95	6272	Gračišče
00050000-558d-4941-7f6c-538f3cae1244	9264	Grad
00050000-558d-4941-5e7e-87cb85b40630	8332	Gradac
00050000-558d-4941-990c-9dda45f68284	1384	Grahovo
00050000-558d-4941-7f10-9e1e9a447ab4	5242	Grahovo ob Bači
00050000-558d-4941-eb77-4fe8d9088a7b	5251	Grgar
00050000-558d-4941-1960-ab5dd525f34e	3302	Griže
00050000-558d-4941-8be6-235517f1c58b	3231	Grobelno
00050000-558d-4941-fd8c-3d58f1dda4e7	1290	Grosuplje
00050000-558d-4941-f6a1-f5c9fc45572b	2288	Hajdina
00050000-558d-4941-7bc4-96432185133f	8362	Hinje
00050000-558d-4941-539a-9f3ab6e57c11	2311	Hoče
00050000-558d-4941-ff7c-c2d86712e582	9205	Hodoš/Hodos
00050000-558d-4941-9179-e7ffad6b680a	1354	Horjul
00050000-558d-4941-d76b-951a19bbfe54	1372	Hotedršica
00050000-558d-4941-b11f-5cb46894d84e	1430	Hrastnik
00050000-558d-4941-6b0f-d4bfc1b3398c	6225	Hruševje
00050000-558d-4941-06e3-6c98037ae5b5	4276	Hrušica
00050000-558d-4941-48af-84c09547f2a6	5280	Idrija
00050000-558d-4941-8343-d7d7db15ba3f	1292	Ig
00050000-558d-4941-a78f-ad22091b33ca	6250	Ilirska Bistrica
00050000-558d-4941-0fd1-53be34ccc43b	6251	Ilirska Bistrica-Trnovo
00050000-558d-4941-605f-e52cd39911b3	1295	Ivančna Gorica
00050000-558d-4941-f27a-460bf7ba328e	2259	Ivanjkovci
00050000-558d-4941-b6e0-e11861e27782	1411	Izlake
00050000-558d-4941-29d4-268e6351355a	6310	Izola/Isola
00050000-558d-4941-fe81-dc0c62729caf	2222	Jakobski Dol
00050000-558d-4941-a811-947e7ef7cd17	2221	Jarenina
00050000-558d-4941-baaa-07aad1565253	6254	Jelšane
00050000-558d-4941-7f82-2aee81e6d143	4270	Jesenice
00050000-558d-4941-4497-bd4b9b7ee12e	8261	Jesenice na Dolenjskem
00050000-558d-4941-179d-383c8bb19615	3273	Jurklošter
00050000-558d-4941-2bed-062a3687992c	2223	Jurovski Dol
00050000-558d-4941-602d-e92e826be970	2256	Juršinci
00050000-558d-4941-55f4-c66ae089a680	5214	Kal nad Kanalom
00050000-558d-4941-d4f3-62b0eb8fd0fa	3233	Kalobje
00050000-558d-4941-6b3c-44dc97280321	4246	Kamna Gorica
00050000-558d-4941-623b-93a39e6385fa	2351	Kamnica
00050000-558d-4941-b1cc-15745e119193	1241	Kamnik
00050000-558d-4941-9797-fcf610df0e64	5213	Kanal
00050000-558d-4941-9adf-6e2155b1f2d5	8258	Kapele
00050000-558d-4941-d08f-2e0376cae062	2362	Kapla
00050000-558d-4941-a337-fc1ad4263e6b	2325	Kidričevo
00050000-558d-4941-ca34-380c73ace5e5	1412	Kisovec
00050000-558d-4941-b281-8a5be6d0eaf6	6253	Knežak
00050000-558d-4941-5795-e4dd7129dcc3	5222	Kobarid
00050000-558d-4941-f75d-4a59530a4d48	9227	Kobilje
00050000-558d-4941-28e3-6c91249c1a0c	1330	Kočevje
00050000-558d-4941-3171-565f081db667	1338	Kočevska Reka
00050000-558d-4941-1dfb-0cfec0d17c27	2276	Kog
00050000-558d-4941-2643-c764d2567a1a	5211	Kojsko
00050000-558d-4941-335e-f3be0cc8f67f	6223	Komen
00050000-558d-4941-c7ec-3b6357efcf0a	1218	Komenda
00050000-558d-4941-6ebb-a127c1e1b518	6000	Koper/Capodistria 
00050000-558d-4941-d4d5-b0de9f673b55	6001	Koper/Capodistria - poštni predali
00050000-558d-4941-e84e-17d76813e2ce	8282	Koprivnica
00050000-558d-4941-473d-a64326ea7c79	5296	Kostanjevica na Krasu
00050000-558d-4941-ad25-7adf0fe4540d	8311	Kostanjevica na Krki
00050000-558d-4941-dd5f-07c543385440	1336	Kostel
00050000-558d-4941-cee1-f02e3cb25cbd	6256	Košana
00050000-558d-4941-629a-0c83aeeb82b6	2394	Kotlje
00050000-558d-4941-41cf-b161f28fa648	6240	Kozina
00050000-558d-4941-ff7e-b91a4e479d95	3260	Kozje
00050000-558d-4941-a5d2-0c74c1d6a3ef	4000	Kranj 
00050000-558d-4941-fae7-a756f5e96dfd	4001	Kranj - poštni predali
00050000-558d-4941-f436-07532a43911c	4280	Kranjska Gora
00050000-558d-4941-c2b5-74fe7e39eee6	1281	Kresnice
00050000-558d-4941-a7a0-a6d615942a01	4294	Križe
00050000-558d-4941-e9ee-985396e88e5c	9206	Križevci
00050000-558d-4941-9981-5705047fe22a	9242	Križevci pri Ljutomeru
00050000-558d-4941-8041-005c829b4bdb	1301	Krka
00050000-558d-4941-38b4-0d269c70221e	8296	Krmelj
00050000-558d-4941-bd35-ce3deae65649	4245	Kropa
00050000-558d-4941-2435-1754aa10cf4f	8262	Krška vas
00050000-558d-4941-e74a-0578c819a29e	8270	Krško
00050000-558d-4941-5582-c65fb208a4db	9263	Kuzma
00050000-558d-4941-4c4c-1141df2a3c37	2318	Laporje
00050000-558d-4941-4f5c-c808f53d03cb	3270	Laško
00050000-558d-4941-3a86-fe1273a62a06	1219	Laze v Tuhinju
00050000-558d-4941-043b-a226e0d9ba1b	2230	Lenart v Slovenskih goricah
00050000-558d-4941-2ea8-b373b2b77ed1	9220	Lendava/Lendva
00050000-558d-4941-3516-d3a9cba682cd	4248	Lesce
00050000-558d-4941-66d4-0fd1c4dca3a0	3261	Lesično
00050000-558d-4941-9c8c-f9887ed6a037	8273	Leskovec pri Krškem
00050000-558d-4941-067b-4522cfbd87ec	2372	Libeliče
00050000-558d-4941-b40c-9f7ceb40b266	2341	Limbuš
00050000-558d-4941-7ca7-419490475f02	1270	Litija
00050000-558d-4941-40ee-634b58efe3db	3202	Ljubečna
00050000-558d-4941-1594-c1b730cb72d4	1000	Ljubljana 
00050000-558d-4941-c00a-6cdc820b7d08	1001	Ljubljana - poštni predali
00050000-558d-4941-ec86-232e011494f4	1231	Ljubljana - Črnuče
00050000-558d-4941-ac42-d5baa114e7a3	1261	Ljubljana - Dobrunje
00050000-558d-4941-0ac3-99e1528305ef	1260	Ljubljana - Polje
00050000-558d-4941-f5c4-924c021c5b20	1210	Ljubljana - Šentvid
00050000-558d-4941-72fa-14a7bce9c9dc	1211	Ljubljana - Šmartno
00050000-558d-4941-d35d-bfa6d1cb77bf	3333	Ljubno ob Savinji
00050000-558d-4941-a049-6ea39829ef73	9240	Ljutomer
00050000-558d-4941-eaad-5adf6a2d9ff7	3215	Loče
00050000-558d-4941-68ff-f18bce3a709a	5231	Log pod Mangartom
00050000-558d-4941-fba4-c7167004fcf7	1358	Log pri Brezovici
00050000-558d-4941-592a-3b379d127a34	1370	Logatec
00050000-558d-4941-251d-1dfb7c3a6bc7	1371	Logatec
00050000-558d-4941-3179-c214289a0435	1434	Loka pri Zidanem Mostu
00050000-558d-4941-dddf-804e059f802a	3223	Loka pri Žusmu
00050000-558d-4941-dcf1-14a39e53140f	6219	Lokev
00050000-558d-4941-134d-a77f7f4b3c33	1318	Loški Potok
00050000-558d-4941-0111-ec5c8ecdcd0f	2324	Lovrenc na Dravskem polju
00050000-558d-4941-e8b7-521cc429a919	2344	Lovrenc na Pohorju
00050000-558d-4941-8931-3d79c99c62bc	3334	Luče
00050000-558d-4941-d3f1-d64e98560bce	1225	Lukovica
00050000-558d-4941-ccff-ee140ecc43ba	9202	Mačkovci
00050000-558d-4941-143c-51d02be9b343	2322	Majšperk
00050000-558d-4941-06f7-cfbacb9275ad	2321	Makole
00050000-558d-4941-398b-2ca4758334af	9243	Mala Nedelja
00050000-558d-4941-7196-109a9dacda2f	2229	Malečnik
00050000-558d-4941-7aa7-fd1ce76f3bcf	6273	Marezige
00050000-558d-4941-286c-c4f40a060fae	2000	Maribor 
00050000-558d-4941-099b-a57535f4ee26	2001	Maribor - poštni predali
00050000-558d-4941-08a3-fb8be5896069	2206	Marjeta na Dravskem polju
00050000-558d-4941-562e-f48d1c760de4	2281	Markovci
00050000-558d-4941-8da9-c47c66791a25	9221	Martjanci
00050000-558d-4941-50a7-e506ac637748	6242	Materija
00050000-558d-4941-8275-800d1342c290	4211	Mavčiče
00050000-558d-4941-07ea-c109b58b07ae	1215	Medvode
00050000-558d-4941-db66-5f136e8c19c7	1234	Mengeš
00050000-558d-4941-a511-c058dc800d32	8330	Metlika
00050000-558d-4941-15ad-78557fcebe9f	2392	Mežica
00050000-558d-4941-7457-9ca4a2d25b5c	2204	Miklavž na Dravskem polju
00050000-558d-4941-a8f7-fc3c54927398	2275	Miklavž pri Ormožu
00050000-558d-4941-3cd8-c5ec71557459	5291	Miren
00050000-558d-4941-a37a-e7b460e2716b	8233	Mirna
00050000-558d-4941-8d58-c091770fa637	8216	Mirna Peč
00050000-558d-4941-1b9f-16e82b9b7544	2382	Mislinja
00050000-558d-4941-b76f-79e5b0d46bf0	4281	Mojstrana
00050000-558d-4941-01aa-cdd7ed245493	8230	Mokronog
00050000-558d-4941-968f-fe0106c935c7	1251	Moravče
00050000-558d-4941-5f92-03d1eb772a23	9226	Moravske Toplice
00050000-558d-4941-f8fc-43b286b223a4	5216	Most na Soči
00050000-558d-4941-6e11-d5903a78a9ab	1221	Motnik
00050000-558d-4941-4956-6df01a9fd6fc	3330	Mozirje
00050000-558d-4941-dd34-c79e1000a47b	9000	Murska Sobota 
00050000-558d-4941-dbe6-bf734eeab095	9001	Murska Sobota - poštni predali
00050000-558d-4941-ddac-8f6e788b9679	2366	Muta
00050000-558d-4941-f268-0f7fc7a105d9	4202	Naklo
00050000-558d-4941-28a3-d809ead3498e	3331	Nazarje
00050000-558d-4941-14f5-debfe56254d5	1357	Notranje Gorice
00050000-558d-4941-b006-3138a03f343f	3203	Nova Cerkev
00050000-558d-4941-2ffb-add991766862	5000	Nova Gorica 
00050000-558d-4941-5ab9-667bb1ad037a	5001	Nova Gorica - poštni predali
00050000-558d-4941-33b4-9d524d4f0572	1385	Nova vas
00050000-558d-4941-e785-e54cfd7d1d4b	8000	Novo mesto
00050000-558d-4941-baeb-d3b446f5aeb4	8001	Novo mesto - poštni predali
00050000-558d-4941-34fc-9fd3d148c0a5	6243	Obrov
00050000-558d-4941-7de9-767093eb5e06	9233	Odranci
00050000-558d-4941-e4e7-f17a9070896e	2317	Oplotnica
00050000-558d-4941-9a43-24d467727a68	2312	Orehova vas
00050000-558d-4941-2f2b-54394a498097	2270	Ormož
00050000-558d-4941-67ce-9d738681fa8b	1316	Ortnek
00050000-558d-4941-5b0f-8b7f7343c4c9	1337	Osilnica
00050000-558d-4941-2d73-3134caac0015	8222	Otočec
00050000-558d-4941-08ac-1b51e51690e9	2361	Ožbalt
00050000-558d-4941-9d1b-595d73482d97	2231	Pernica
00050000-558d-4941-ae74-d4383b235d50	2211	Pesnica pri Mariboru
00050000-558d-4941-b5e8-9fe449aa271f	9203	Petrovci
00050000-558d-4941-1b4e-c219c55ce7d8	3301	Petrovče
00050000-558d-4941-2da0-091481b5e1e9	6330	Piran/Pirano
00050000-558d-4941-f2dc-3361c173ef8f	8255	Pišece
00050000-558d-4941-a94d-214de5962cde	6257	Pivka
00050000-558d-4941-df94-d597987db818	6232	Planina
00050000-558d-4941-dfa0-88ce4ec200e5	3225	Planina pri Sevnici
00050000-558d-4941-6242-180ac8eca089	6276	Pobegi
00050000-558d-4941-e00b-675f8b0e7e60	8312	Podbočje
00050000-558d-4941-e0bd-aff94a9ccb4b	5243	Podbrdo
00050000-558d-4941-bf52-92d71bc6c42a	3254	Podčetrtek
00050000-558d-4941-155b-75743b803bb4	2273	Podgorci
00050000-558d-4941-e0a5-a4031ea5b07d	6216	Podgorje
00050000-558d-4941-ee24-43a52f7c0a0b	2381	Podgorje pri Slovenj Gradcu
00050000-558d-4941-6aad-a67ccba48ba2	6244	Podgrad
00050000-558d-4941-2c21-39dd76fe2b28	1414	Podkum
00050000-558d-4941-d12b-99bfddcaced3	2286	Podlehnik
00050000-558d-4941-d81c-09d5ae0b8923	5272	Podnanos
00050000-558d-4941-04f4-be5fc47024b2	4244	Podnart
00050000-558d-4941-b1e1-0b311a32d7bc	3241	Podplat
00050000-558d-4941-a679-46f37388f264	3257	Podsreda
00050000-558d-4941-3516-851a9f857b62	2363	Podvelka
00050000-558d-4941-33f0-fd4d09f7fe1b	2208	Pohorje
00050000-558d-4941-9c19-79c77d9e0bcd	2257	Polenšak
00050000-558d-4941-2ca9-f965f3c3115e	1355	Polhov Gradec
00050000-558d-4941-9218-0c5083c3f7e8	4223	Poljane nad Škofjo Loko
00050000-558d-4941-2625-92bbe0688450	2319	Poljčane
00050000-558d-4941-786a-fdbeffcab9c5	1272	Polšnik
00050000-558d-4941-d267-9276bb1010a6	3313	Polzela
00050000-558d-4941-54a0-8e163155950a	3232	Ponikva
00050000-558d-4941-ef4a-5aae88ca2c8a	6320	Portorož/Portorose
00050000-558d-4941-0087-3007e246a837	6230	Postojna
00050000-558d-4941-181e-8af178d20e21	2331	Pragersko
00050000-558d-4941-5c93-f5620807e246	3312	Prebold
00050000-558d-4941-3780-38c771ee2c68	4205	Preddvor
00050000-558d-4941-5852-fea009382de3	6255	Prem
00050000-558d-4941-dbbd-31b81b84d6e6	1352	Preserje
00050000-558d-4941-549c-9bf97de47af9	6258	Prestranek
00050000-558d-4941-5b14-f0663c2c6920	2391	Prevalje
00050000-558d-4941-dbf0-8186295349e9	3262	Prevorje
00050000-558d-4941-93dd-5c69f912b1f4	1276	Primskovo 
00050000-558d-4941-c019-99871fe07095	3253	Pristava pri Mestinju
00050000-558d-4941-efd2-4affa3447fca	9207	Prosenjakovci/Partosfalva
00050000-558d-4941-8cc5-12d13d78cd93	5297	Prvačina
00050000-558d-4941-7863-a82d4e2ea7e3	2250	Ptuj
00050000-558d-4941-75c0-9a279488a736	2323	Ptujska Gora
00050000-558d-4941-729d-713e33ad80b1	9201	Puconci
00050000-558d-4941-dc0b-f49c5e738c45	2327	Rače
00050000-558d-4941-06de-3db325995171	1433	Radeče
00050000-558d-4941-e456-b11022ee969a	9252	Radenci
00050000-558d-4941-cd82-4b7d1882aaaf	2360	Radlje ob Dravi
00050000-558d-4941-e511-ca7a71b3fb62	1235	Radomlje
00050000-558d-4941-abc0-86f65923ce54	4240	Radovljica
00050000-558d-4941-8968-b0360e870c5a	8274	Raka
00050000-558d-4941-4375-b7c51f4ac04a	1381	Rakek
00050000-558d-4941-81c6-2f93a435f001	4283	Rateče - Planica
00050000-558d-4941-e3f5-9ce636058b5c	2390	Ravne na Koroškem
00050000-558d-4941-0308-61bc47f4ca0b	9246	Razkrižje
00050000-558d-4941-1ae1-669aeed23731	3332	Rečica ob Savinji
00050000-558d-4941-8994-978633140a62	5292	Renče
00050000-558d-4941-d3e5-bbc9d70f3a53	1310	Ribnica
00050000-558d-4941-554d-2fe09dd171b3	2364	Ribnica na Pohorju
00050000-558d-4941-f1a6-867293333ffb	3272	Rimske Toplice
00050000-558d-4941-5b69-bd3e58e28f4b	1314	Rob
00050000-558d-4941-01ea-77ed05e24312	5215	Ročinj
00050000-558d-4941-7649-20f467c4a2a2	3250	Rogaška Slatina
00050000-558d-4941-ab40-c4d0c5cb7f70	9262	Rogašovci
00050000-558d-4941-897c-64b6e7685504	3252	Rogatec
00050000-558d-4941-f8ff-3341a2c45081	1373	Rovte
00050000-558d-4941-ba60-b2d20e89ec28	2342	Ruše
00050000-558d-4941-5d30-4b999fb73cef	1282	Sava
00050000-558d-4941-7df8-da78de2bdc01	6333	Sečovlje/Sicciole
00050000-558d-4941-2a71-19486af7a549	4227	Selca
00050000-558d-4941-f1e7-50872e325ac7	2352	Selnica ob Dravi
00050000-558d-4941-f7ef-c59487f07fc0	8333	Semič
00050000-558d-4941-9131-f7e0a2a6350e	8281	Senovo
00050000-558d-4941-36da-211fd0957c1a	6224	Senožeče
00050000-558d-4941-a9da-f75df1f1cd0a	8290	Sevnica
00050000-558d-4941-bebe-4eb472803900	6210	Sežana
00050000-558d-4941-f33b-0871e31b86d2	2214	Sladki Vrh
00050000-558d-4941-cc6a-805cffbe8316	5283	Slap ob Idrijci
00050000-558d-4941-a46d-6aa09f59fe41	2380	Slovenj Gradec
00050000-558d-4941-bb64-c71c2bc0438a	2310	Slovenska Bistrica
00050000-558d-4941-27a4-ff6174d18ad8	3210	Slovenske Konjice
00050000-558d-4941-26fb-25df94d1e867	1216	Smlednik
00050000-558d-4941-71ff-36c85ae73439	5232	Soča
00050000-558d-4941-223a-411608ddcfb4	1317	Sodražica
00050000-558d-4941-df7f-338a2e0ed0ee	3335	Solčava
00050000-558d-4941-5a1b-225bba245964	5250	Solkan
00050000-558d-4941-9408-deafb18f19ac	4229	Sorica
00050000-558d-4941-94de-5222adf8de1c	4225	Sovodenj
00050000-558d-4941-25c8-03571d1e4be0	5281	Spodnja Idrija
00050000-558d-4941-c347-6d27582a7cf7	2241	Spodnji Duplek
00050000-558d-4941-41b1-fc235c03c88b	9245	Spodnji Ivanjci
00050000-558d-4941-9e5f-9c6bb4627c6f	2277	Središče ob Dravi
00050000-558d-4941-eb54-6b000401af6c	4267	Srednja vas v Bohinju
00050000-558d-4941-3799-c3599976c55b	8256	Sromlje 
00050000-558d-4941-0cb7-6880d8e87be5	5224	Srpenica
00050000-558d-4941-4373-7e4c4d4417ee	1242	Stahovica
00050000-558d-4941-9e38-07c8f1b5cb1e	1332	Stara Cerkev
00050000-558d-4941-9383-b32794b128c7	8342	Stari trg ob Kolpi
00050000-558d-4941-bb65-aca6adca8383	1386	Stari trg pri Ložu
00050000-558d-4941-3eb4-a996e4df265f	2205	Starše
00050000-558d-4941-e045-bf7137b005a1	2289	Stoperce
00050000-558d-4941-5731-fb89607fcded	8322	Stopiče
00050000-558d-4941-8332-789a6bf997e1	3206	Stranice
00050000-558d-4941-9f96-4dd268848de2	8351	Straža
00050000-558d-4941-84ba-d0cb08c5739c	1313	Struge
00050000-558d-4941-c01f-7a6e3f5aea42	8293	Studenec
00050000-558d-4941-7222-78e9efb9ca41	8331	Suhor
00050000-558d-4941-2760-ab1c2e0acd15	2233	Sv. Ana v Slovenskih goricah
00050000-558d-4941-9eef-bc412e9b8e23	2235	Sv. Trojica v Slovenskih goricah
00050000-558d-4941-e452-9e51389ef207	2353	Sveti Duh na Ostrem Vrhu
00050000-558d-4941-afa9-15cd1bd480d4	9244	Sveti Jurij ob Ščavnici
00050000-558d-4941-2453-c207c367fc66	3264	Sveti Štefan
00050000-558d-4941-4192-9bac1d6ea30f	2258	Sveti Tomaž
00050000-558d-4941-b26d-65db9b9378db	9204	Šalovci
00050000-558d-4941-7bca-c5428f1793f6	5261	Šempas
00050000-558d-4941-cd80-e686be62add5	5290	Šempeter pri Gorici
00050000-558d-4941-e29d-816e538c2a25	3311	Šempeter v Savinjski dolini
00050000-558d-4941-cab5-d5879d44adb4	4208	Šenčur
00050000-558d-4941-ee88-16245497fc4f	2212	Šentilj v Slovenskih goricah
00050000-558d-4941-69dc-dec6c1237490	8297	Šentjanž
00050000-558d-4941-2c74-eddd0c074135	2373	Šentjanž pri Dravogradu
00050000-558d-4941-847a-c69c9877d1c7	8310	Šentjernej
00050000-558d-4941-9113-853732f5b7ab	3230	Šentjur
00050000-558d-4941-4ad8-68bb3e974e3a	3271	Šentrupert
00050000-558d-4941-f961-6c60d5abcc67	8232	Šentrupert
00050000-558d-4941-b0ed-81a82586231f	1296	Šentvid pri Stični
00050000-558d-4941-196f-eb35197d31fc	8275	Škocjan
00050000-558d-4941-16e5-1d29ceed912b	6281	Škofije
00050000-558d-4941-42b1-0b214de45c6e	4220	Škofja Loka
00050000-558d-4941-226f-883f7ae421a6	3211	Škofja vas
00050000-558d-4941-e9b5-ba8327f1116d	1291	Škofljica
00050000-558d-4941-8a33-8ccc84ce9e2b	6274	Šmarje
00050000-558d-4941-47a1-5b3f899e8985	1293	Šmarje - Sap
00050000-558d-4941-075e-c20899291359	3240	Šmarje pri Jelšah
00050000-558d-4941-676a-2b5807d31dd8	8220	Šmarješke Toplice
00050000-558d-4941-ae70-7d407193f5b0	2315	Šmartno na Pohorju
00050000-558d-4941-d8ed-e6afeae09e3f	3341	Šmartno ob Dreti
00050000-558d-4941-4c21-a02f96b9411c	3327	Šmartno ob Paki
00050000-558d-4941-6afc-a70977dceebb	1275	Šmartno pri Litiji
00050000-558d-4941-c390-dada7e4e5eaf	2383	Šmartno pri Slovenj Gradcu
00050000-558d-4941-e2ae-ec4e7eeb51cf	3201	Šmartno v Rožni dolini
00050000-558d-4941-3d41-febe9a4cbb43	3325	Šoštanj
00050000-558d-4941-f57f-d256628e3565	6222	Štanjel
00050000-558d-4941-764f-7214ac040b66	3220	Štore
00050000-558d-4941-bc0a-a553fcf39d65	3304	Tabor
00050000-558d-4941-ad8f-53128fc6b6e9	3221	Teharje
00050000-558d-4941-bc99-3bd87c0f061b	9251	Tišina
00050000-558d-4941-1df3-7b9aa9ac8ebd	5220	Tolmin
00050000-558d-4941-5370-ce7880ede7e0	3326	Topolšica
00050000-558d-4941-ece5-0bcdf01d5382	2371	Trbonje
00050000-558d-4941-82c1-cade5d170434	1420	Trbovlje
00050000-558d-4941-5764-6b20b6ffbe35	8231	Trebelno 
00050000-558d-4941-16d4-43e8b9ff8b88	8210	Trebnje
00050000-558d-4941-3248-8862008b5404	5252	Trnovo pri Gorici
00050000-558d-4941-c617-d1f04d37d284	2254	Trnovska vas
00050000-558d-4941-2fba-9743cfa6113b	1222	Trojane
00050000-558d-4941-59aa-ff87196329a6	1236	Trzin
00050000-558d-4941-8cc7-0a1e2a53fe8f	4290	Tržič
00050000-558d-4941-70b6-8c34bec33b48	8295	Tržišče
00050000-558d-4941-3664-af37c3b35052	1311	Turjak
00050000-558d-4941-334e-e9d223a76481	9224	Turnišče
00050000-558d-4941-76ee-3157a10eb20a	8323	Uršna sela
00050000-558d-4941-6a4a-fc7e33b173ca	1252	Vače
00050000-558d-4941-90b4-f7b4c80e5e23	3320	Velenje 
00050000-558d-4941-5d67-23d9b2774b32	3322	Velenje - poštni predali
00050000-558d-4941-1b0a-a2d25577d88e	8212	Velika Loka
00050000-558d-4941-ad0b-2d4b9aadcfcc	2274	Velika Nedelja
00050000-558d-4941-937b-f183d9ca2e19	9225	Velika Polana
00050000-558d-4941-5f0f-6553eeb78395	1315	Velike Lašče
00050000-558d-4941-3355-a489bc6293b1	8213	Veliki Gaber
00050000-558d-4941-46e0-fad146dacc32	9241	Veržej
00050000-558d-4941-b98e-6941ee26bd2a	1312	Videm - Dobrepolje
00050000-558d-4941-fda4-773f41d87fe8	2284	Videm pri Ptuju
00050000-558d-4941-5d73-3bf4fa101ffe	8344	Vinica
00050000-558d-4941-8638-35126b6f155b	5271	Vipava
00050000-558d-4941-aa79-003b432acf56	4212	Visoko
00050000-558d-4941-f483-0696fa6cf68c	1294	Višnja Gora
00050000-558d-4941-b4c3-3ed75bac2274	3205	Vitanje
00050000-558d-4941-bb0d-f1626a80f948	2255	Vitomarci
00050000-558d-4941-4b55-e3f62454d533	1217	Vodice
00050000-558d-4941-5d3f-d99bc1685399	3212	Vojnik\t
00050000-558d-4941-cce9-7f80f2556401	5293	Volčja Draga
00050000-558d-4941-e7b8-3e6fa57a69e4	2232	Voličina
00050000-558d-4941-9bb2-1dd3a90e7603	3305	Vransko
00050000-558d-4941-60cd-f618cbb13f1c	6217	Vremski Britof
00050000-558d-4941-0613-569d5966a215	1360	Vrhnika
00050000-558d-4941-683b-6fec2d43f785	2365	Vuhred
00050000-558d-4941-3bfd-cb60be81a912	2367	Vuzenica
00050000-558d-4941-ac62-e2c80df48961	8292	Zabukovje 
00050000-558d-4941-1116-6b30528fa50b	1410	Zagorje ob Savi
00050000-558d-4941-640c-952d49053fb1	1303	Zagradec
00050000-558d-4941-27b0-7292bd486867	2283	Zavrč
00050000-558d-4941-c99a-b51e440d51ce	8272	Zdole 
00050000-558d-4941-785e-b54a269c91df	4201	Zgornja Besnica
00050000-558d-4941-29a0-894f6900dd24	2242	Zgornja Korena
00050000-558d-4941-d455-6edca5456879	2201	Zgornja Kungota
00050000-558d-4941-a352-432e64c1ed9d	2316	Zgornja Ložnica
00050000-558d-4941-1a7e-9c69793fe0d9	2314	Zgornja Polskava
00050000-558d-4941-16f0-693438a00702	2213	Zgornja Velka
00050000-558d-4941-457e-8b9c3500b568	4247	Zgornje Gorje
00050000-558d-4941-6d18-320f4342d0c3	4206	Zgornje Jezersko
00050000-558d-4941-b195-dc6a3f91b06b	2285	Zgornji Leskovec
00050000-558d-4941-e735-68f42a479857	1432	Zidani Most
00050000-558d-4941-8c46-c1a973b1bb42	3214	Zreče
00050000-558d-4941-2921-fd2a32871624	4209	Žabnica
00050000-558d-4941-0e2a-96d23fac813f	3310	Žalec
00050000-558d-4941-4ea0-5f44fdebc8bf	4228	Železniki
00050000-558d-4941-da0e-d38d1c01f382	2287	Žetale
00050000-558d-4941-4733-0435cbd03ea4	4226	Žiri
00050000-558d-4941-bc6d-f9cf9923898a	4274	Žirovnica
00050000-558d-4941-d6e5-779c6d69744d	8360	Žužemberk
\.


--
-- TOC entry 2871 (class 0 OID 8258164)
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
-- TOC entry 2853 (class 0 OID 8257975)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2859 (class 0 OID 8258053)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8258176)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2886 (class 0 OID 8258296)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8258345)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-558d-4942-d07a-2362468555e7	00080000-558d-4942-4cf0-ffb6cf673572	0900	AK
00190000-558d-4943-e38b-31a56c80a9a9	00080000-558d-4942-79d0-64ac0902b0d6	0987	A
00190000-558d-4943-4fba-2236efc6be0b	00080000-558d-4942-0005-df458e71afe9	0989	A
\.


--
-- TOC entry 2897 (class 0 OID 8258479)
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
-- TOC entry 2877 (class 0 OID 8258205)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-558d-4942-a460-80d2ae3454ce	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-558d-4942-c964-c08d378f49cc	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-558d-4942-60cf-5c2f3fc8bb9c	0003	Kazinska	t	84	Kazinska dvorana
00220000-558d-4942-53e4-49f9bc0fdbaa	0004	Mali oder	t	24	Mali oder 
00220000-558d-4942-c3e2-d44025d73f65	0005	Komorni oder	t	15	Komorni oder
00220000-558d-4942-2bc9-1014d9faf199	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-558d-4942-7fa2-3364c769e7ba	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2869 (class 0 OID 8258149)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 8258139)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8258334)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 8258273)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 8257847)
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
-- TOC entry 2878 (class 0 OID 8258215)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 8257885)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-558d-4940-f591-4e8526c9976c	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-558d-4940-85b8-9202f93528f1	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-558d-4940-c210-a71dc657c00d	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-558d-4940-e478-fff696bc10c5	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-558d-4940-623d-91743dab3fe7	planer	Planer dogodkov v koledarju	t
00020000-558d-4940-7e1e-448690ac6bbb	kadrovska	Kadrovska služba	t
00020000-558d-4940-4284-8bfc9eb72846	arhivar	Ažuriranje arhivalij	t
00020000-558d-4940-9f45-45b73b145d1c	igralec	Igralec	t
00020000-558d-4940-fab9-96e5e8f2c9db	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-558d-4942-1617-e6be4bd844c2	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2844 (class 0 OID 8257869)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-558d-4940-6ebc-61f6efbcc99d	00020000-558d-4940-c210-a71dc657c00d
00010000-558d-4940-9b18-a964548bc49e	00020000-558d-4940-c210-a71dc657c00d
00010000-558d-4942-a2a0-164cf499ab41	00020000-558d-4942-1617-e6be4bd844c2
\.


--
-- TOC entry 2880 (class 0 OID 8258229)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8258170)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 8258120)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 8258523)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-558d-4941-6bbf-1b830113f6a0	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-558d-4941-ed13-335d44fcc112	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-558d-4941-9198-4ad8409559f3	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-558d-4941-0c82-6cd376113434	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-558d-4941-1519-8e3dcd6926cc	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2901 (class 0 OID 8258515)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-558d-4941-bd57-ff50d35b948b	00230000-558d-4941-0c82-6cd376113434	popa
00240000-558d-4941-7961-b404312a734e	00230000-558d-4941-0c82-6cd376113434	oseba
00240000-558d-4941-7068-6e0b287cebea	00230000-558d-4941-ed13-335d44fcc112	prostor
00240000-558d-4941-68ca-1a854c4a0ae4	00230000-558d-4941-0c82-6cd376113434	besedilo
00240000-558d-4941-760e-d546cd79695e	00230000-558d-4941-0c82-6cd376113434	uprizoritev
00240000-558d-4941-6f5a-711c59e1d8e2	00230000-558d-4941-0c82-6cd376113434	funkcija
00240000-558d-4941-310c-d8bcaba1142a	00230000-558d-4941-0c82-6cd376113434	tipfunkcije
00240000-558d-4941-492f-004507844171	00230000-558d-4941-0c82-6cd376113434	alternacija
00240000-558d-4941-121d-d48fae482795	00230000-558d-4941-6bbf-1b830113f6a0	pogodba
00240000-558d-4941-5171-481aff1dc366	00230000-558d-4941-0c82-6cd376113434	zaposlitev
\.


--
-- TOC entry 2900 (class 0 OID 8258510)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8258283)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-558d-4943-57d4-6b1b3d5230d5	000e0000-558d-4943-9292-2936e40eaec5	00080000-558d-4942-b843-e3fd81cfcd0a	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-558d-4943-fcea-cf2a9b20f44d	000e0000-558d-4943-9292-2936e40eaec5	00080000-558d-4942-b843-e3fd81cfcd0a	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-558d-4943-ad79-244c45035f62	000e0000-558d-4943-9292-2936e40eaec5	00080000-558d-4942-74ae-67577b253b81	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2851 (class 0 OID 8257947)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 8258126)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-558d-4943-eac6-50de8f417b01	00180000-558d-4943-3360-948e04b72395	000c0000-558d-4943-ca33-b233906df754	00090000-558d-4942-bf6a-75daa8b33166	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558d-4943-6b31-4563108b41e1	00180000-558d-4943-3360-948e04b72395	000c0000-558d-4943-3871-7d777d8df9b5	00090000-558d-4942-ab1f-048987e0fc76	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558d-4943-9f4f-ce5dc7fc3532	00180000-558d-4943-3360-948e04b72395	000c0000-558d-4943-bb77-1cdefd9cf113	00090000-558d-4942-ceeb-e6a50e1e11d9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558d-4943-e91c-13e28b5144a1	00180000-558d-4943-3360-948e04b72395	000c0000-558d-4943-a71e-a34ac167daa9	00090000-558d-4942-52d5-9437b369b173	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558d-4943-729a-371c6bded7ae	00180000-558d-4943-3360-948e04b72395	000c0000-558d-4943-ecf6-b842dcc85316	00090000-558d-4942-dbc6-89443e5a72f8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558d-4943-8cc8-45d70917e52d	00180000-558d-4943-438c-6c2603c8b699	\N	00090000-558d-4942-dbc6-89443e5a72f8	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2888 (class 0 OID 8258323)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-558d-4941-cff5-3737272321e7	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-558d-4941-29aa-1d2a1c127cf4	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-558d-4941-44a5-6d923cf2df34	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-558d-4941-17c4-387dbfa8f9b2	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-558d-4941-3a11-47b0b768e50b	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-558d-4941-e477-c26f1d64d9b1	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-558d-4941-2313-86f8d3534ec7	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-558d-4941-d91f-207ba3587b1a	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-558d-4941-4e73-4437e54186ea	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-558d-4941-93d4-19ae2f72576c	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-558d-4941-9acd-6f8625079adb	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-558d-4941-93be-e407ee8c24af	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-558d-4941-6228-cf7c47b72425	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-558d-4941-e7b8-075d7c617acf	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-558d-4941-c395-356354ee1f26	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-558d-4941-3b39-b8f324e5b34a	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2898 (class 0 OID 8258492)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-558d-4941-6eb7-2e4529e4fa8e	01	Velika predstava	f	1.00	1.00
002b0000-558d-4941-5623-e1058566bfb0	02	Mala predstava	f	0.50	0.50
002b0000-558d-4941-032c-4684c67fa338	03	Mala koprodukcija	t	0.40	1.00
002b0000-558d-4941-8814-e1b026fe6668	04	Srednja koprodukcija	t	0.70	2.00
002b0000-558d-4941-3ab3-5f89a90032ec	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2856 (class 0 OID 8258010)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 8257856)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-558d-4940-9b18-a964548bc49e	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROoEkBLQj.kXF9T8np8sY10mYSfVOcrua	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-558d-4942-1ac9-599d024e5eb8	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-558d-4942-6a89-8000e349bb40	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-558d-4942-5586-cb164d7e3d33	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-558d-4942-aff9-47aa56652d05	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-558d-4942-e8e7-68f94c52fbdc	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-558d-4942-742e-38234173bdd8	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-558d-4942-e335-23beb9a5eba4	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-558d-4942-592d-a819fe306063	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-558d-4942-644f-196f08d77df7	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-558d-4942-a2a0-164cf499ab41	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-558d-4940-6ebc-61f6efbcc99d	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2893 (class 0 OID 8258380)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-558d-4943-f257-6f84503db682	00160000-558d-4942-3228-9a82aab32104	00150000-558d-4941-7902-c013d3dfd265	00140000-558d-4940-5290-12b054379e95	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-558d-4942-c3e2-d44025d73f65
000e0000-558d-4943-9292-2936e40eaec5	00160000-558d-4942-1c13-a136b490ef92	00150000-558d-4941-af7c-1fb3adc00d67	00140000-558d-4940-3687-56611d265c8e	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-558d-4942-2bc9-1014d9faf199
000e0000-558d-4943-994c-fa8bb50bac3a	\N	00150000-558d-4941-af7c-1fb3adc00d67	00140000-558d-4940-3687-56611d265c8e	00190000-558d-4943-e38b-31a56c80a9a9	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-558d-4942-c3e2-d44025d73f65
000e0000-558d-4943-6ec5-f338eae39fbf	\N	00150000-558d-4941-af7c-1fb3adc00d67	00140000-558d-4940-3687-56611d265c8e	00190000-558d-4943-e38b-31a56c80a9a9	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-558d-4942-c3e2-d44025d73f65
\.


--
-- TOC entry 2861 (class 0 OID 8258072)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-558d-4943-167d-420fc720e3b6	000e0000-558d-4943-9292-2936e40eaec5	1	
00200000-558d-4943-a30b-ea6da8898cec	000e0000-558d-4943-9292-2936e40eaec5	2	
\.


--
-- TOC entry 2876 (class 0 OID 8258197)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 8258266)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8258104)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8258370)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-558d-4940-5290-12b054379e95	01	Drama	drama (SURS 01)
00140000-558d-4940-1142-b060cd98e889	02	Opera	opera (SURS 02)
00140000-558d-4940-c4e4-6b0e04a66bc8	03	Balet	balet (SURS 03)
00140000-558d-4940-127b-af3b03334dd4	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-558d-4940-41b1-e92bd12c9ea0	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-558d-4940-3687-56611d265c8e	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-558d-4940-06dc-fb5ff44e5e7a	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2882 (class 0 OID 8258256)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-558d-4941-a06a-61ef5c6c3ff5	01	Opera	opera
00150000-558d-4941-2761-220b1b33d9ab	02	Opereta	opereta
00150000-558d-4941-edec-d7fbbac3b62d	03	Balet	balet
00150000-558d-4941-8d41-593ace680f43	04	Plesne prireditve	plesne prireditve
00150000-558d-4941-d146-e4cf032e86f6	05	Lutkovno gledališče	lutkovno gledališče
00150000-558d-4941-38e2-9fb47d789b79	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-558d-4941-1b86-095c2bda9221	07	Biografska drama	biografska drama
00150000-558d-4941-7902-c013d3dfd265	08	Komedija	komedija
00150000-558d-4941-5def-30fc3dcd71a7	09	Črna komedija	črna komedija
00150000-558d-4941-bf3f-d04496c20338	10	E-igra	E-igra
00150000-558d-4941-af7c-1fb3adc00d67	11	Kriminalka	kriminalka
00150000-558d-4941-4cfb-d3ae63adcf14	12	Musical	musical
\.


--
-- TOC entry 2435 (class 2606 OID 8257910)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8258427)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 8258417)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 8258322)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 8258094)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 8258119)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 8258508)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 8258036)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 8258474)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 8258252)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 8258070)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 8258113)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 8258050)
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
-- TOC entry 2527 (class 2606 OID 8258162)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 8258189)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 8258008)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 8257919)
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
-- TOC entry 2442 (class 2606 OID 8257943)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 8257899)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2426 (class 2606 OID 8257884)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 8258195)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 8258228)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 8258365)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2451 (class 2606 OID 8257972)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 8257996)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 8258168)
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
-- TOC entry 2457 (class 2606 OID 8257986)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 8258057)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8258180)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 8258304)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8258350)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 8258490)
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
-- TOC entry 2547 (class 2606 OID 8258212)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 8258153)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 8258144)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8258344)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 8258280)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 8257855)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 8258219)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8257873)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2428 (class 2606 OID 8257893)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 8258237)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 8258175)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 8258125)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 8258532)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 8258520)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 8258514)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 8258293)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 8257952)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 8258135)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 8258333)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 8258502)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 8258021)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 8257868)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 8258396)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8258079)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 8258203)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 8258271)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 8258108)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 8258378)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 8258264)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 1259 OID 8258101)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2575 (class 1259 OID 8258294)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2576 (class 1259 OID 8258295)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2449 (class 1259 OID 8257974)
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
-- TOC entry 2540 (class 1259 OID 8258196)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2534 (class 1259 OID 8258182)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2535 (class 1259 OID 8258181)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2486 (class 1259 OID 8258080)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2562 (class 1259 OID 8258253)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2563 (class 1259 OID 8258255)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2564 (class 1259 OID 8258254)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2474 (class 1259 OID 8258052)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2475 (class 1259 OID 8258051)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 8258367)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 8258368)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2595 (class 1259 OID 8258369)
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
-- TOC entry 2602 (class 1259 OID 8258401)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2603 (class 1259 OID 8258398)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2604 (class 1259 OID 8258402)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2605 (class 1259 OID 8258400)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2606 (class 1259 OID 8258399)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2464 (class 1259 OID 8258023)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 8258022)
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
-- TOC entry 2440 (class 1259 OID 8257946)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2550 (class 1259 OID 8258220)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2504 (class 1259 OID 8258114)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2430 (class 1259 OID 8257900)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2431 (class 1259 OID 8257901)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2555 (class 1259 OID 8258240)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2556 (class 1259 OID 8258239)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2557 (class 1259 OID 8258238)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2478 (class 1259 OID 8258058)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2479 (class 1259 OID 8258060)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2480 (class 1259 OID 8258059)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2637 (class 1259 OID 8258522)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2514 (class 1259 OID 8258148)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2515 (class 1259 OID 8258146)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2516 (class 1259 OID 8258145)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2517 (class 1259 OID 8258147)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2421 (class 1259 OID 8257874)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2422 (class 1259 OID 8257875)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2543 (class 1259 OID 8258204)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2529 (class 1259 OID 8258169)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2571 (class 1259 OID 8258281)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2572 (class 1259 OID 8258282)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2623 (class 1259 OID 8258478)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2624 (class 1259 OID 8258475)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2625 (class 1259 OID 8258476)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2626 (class 1259 OID 8258477)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2453 (class 1259 OID 8257988)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2454 (class 1259 OID 8257987)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2455 (class 1259 OID 8257989)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2414 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2579 (class 1259 OID 8258305)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2580 (class 1259 OID 8258306)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2616 (class 1259 OID 8258431)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2617 (class 1259 OID 8258432)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2618 (class 1259 OID 8258429)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2619 (class 1259 OID 8258430)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2568 (class 1259 OID 8258272)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 8258157)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2521 (class 1259 OID 8258156)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2522 (class 1259 OID 8258154)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2523 (class 1259 OID 8258155)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2392 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2612 (class 1259 OID 8258419)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2613 (class 1259 OID 8258418)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2627 (class 1259 OID 8258491)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2485 (class 1259 OID 8258071)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2634 (class 1259 OID 8258509)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2436 (class 1259 OID 8257921)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2437 (class 1259 OID 8257920)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2445 (class 1259 OID 8257953)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2446 (class 1259 OID 8257954)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2509 (class 1259 OID 8258138)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2510 (class 1259 OID 8258137)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2511 (class 1259 OID 8258136)
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
-- TOC entry 2492 (class 1259 OID 8258103)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2493 (class 1259 OID 8258099)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2494 (class 1259 OID 8258096)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2495 (class 1259 OID 8258097)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2496 (class 1259 OID 8258095)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2497 (class 1259 OID 8258100)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2498 (class 1259 OID 8258098)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2452 (class 1259 OID 8257973)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 8258037)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 8258039)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2472 (class 1259 OID 8258038)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2473 (class 1259 OID 8258040)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2528 (class 1259 OID 8258163)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2598 (class 1259 OID 8258366)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2607 (class 1259 OID 8258397)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2443 (class 1259 OID 8257944)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2444 (class 1259 OID 8257945)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2565 (class 1259 OID 8258265)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2643 (class 1259 OID 8258533)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2463 (class 1259 OID 8258009)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2640 (class 1259 OID 8258521)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2548 (class 1259 OID 8258214)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2549 (class 1259 OID 8258213)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 8258428)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2395 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2460 (class 1259 OID 8257997)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2599 (class 1259 OID 8258379)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 8258351)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 8258352)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2429 (class 1259 OID 8257894)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2499 (class 1259 OID 8258102)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2669 (class 2606 OID 8258669)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2672 (class 2606 OID 8258654)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2671 (class 2606 OID 8258659)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2667 (class 2606 OID 8258679)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2673 (class 2606 OID 8258649)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2668 (class 2606 OID 8258674)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2670 (class 2606 OID 8258664)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2703 (class 2606 OID 8258824)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2702 (class 2606 OID 8258829)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2654 (class 2606 OID 8258584)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2690 (class 2606 OID 8258764)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2688 (class 2606 OID 8258759)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2689 (class 2606 OID 8258754)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2666 (class 2606 OID 8258644)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2698 (class 2606 OID 8258794)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2696 (class 2606 OID 8258804)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2697 (class 2606 OID 8258799)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2660 (class 2606 OID 8258619)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2661 (class 2606 OID 8258614)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2686 (class 2606 OID 8258744)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2709 (class 2606 OID 8258849)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2708 (class 2606 OID 8258854)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2707 (class 2606 OID 8258859)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2711 (class 2606 OID 8258879)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2714 (class 2606 OID 8258864)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2710 (class 2606 OID 8258884)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2712 (class 2606 OID 8258874)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2713 (class 2606 OID 8258869)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2658 (class 2606 OID 8258609)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2659 (class 2606 OID 8258604)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2650 (class 2606 OID 8258569)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2651 (class 2606 OID 8258564)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2692 (class 2606 OID 8258774)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2674 (class 2606 OID 8258684)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2647 (class 2606 OID 8258544)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2646 (class 2606 OID 8258549)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2693 (class 2606 OID 8258789)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2694 (class 2606 OID 8258784)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2695 (class 2606 OID 8258779)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2664 (class 2606 OID 8258624)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2662 (class 2606 OID 8258634)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2663 (class 2606 OID 8258629)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2727 (class 2606 OID 8258949)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2678 (class 2606 OID 8258719)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2680 (class 2606 OID 8258709)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2681 (class 2606 OID 8258704)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2679 (class 2606 OID 8258714)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2645 (class 2606 OID 8258534)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2644 (class 2606 OID 8258539)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2691 (class 2606 OID 8258769)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2687 (class 2606 OID 8258749)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2701 (class 2606 OID 8258814)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2700 (class 2606 OID 8258819)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2721 (class 2606 OID 8258934)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2724 (class 2606 OID 8258919)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2723 (class 2606 OID 8258924)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2722 (class 2606 OID 8258929)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2656 (class 2606 OID 8258594)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2657 (class 2606 OID 8258589)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2655 (class 2606 OID 8258599)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2705 (class 2606 OID 8258834)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2704 (class 2606 OID 8258839)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2718 (class 2606 OID 8258909)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2717 (class 2606 OID 8258914)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2720 (class 2606 OID 8258899)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2719 (class 2606 OID 8258904)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2699 (class 2606 OID 8258809)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2682 (class 2606 OID 8258739)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2683 (class 2606 OID 8258734)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2685 (class 2606 OID 8258724)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2684 (class 2606 OID 8258729)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2715 (class 2606 OID 8258894)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2716 (class 2606 OID 8258889)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2725 (class 2606 OID 8258939)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2665 (class 2606 OID 8258639)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2706 (class 2606 OID 8258844)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2726 (class 2606 OID 8258944)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2648 (class 2606 OID 8258559)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2649 (class 2606 OID 8258554)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2653 (class 2606 OID 8258574)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2652 (class 2606 OID 8258579)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2675 (class 2606 OID 8258699)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2676 (class 2606 OID 8258694)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2677 (class 2606 OID 8258689)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-06-26 14:44:52 CEST

--
-- PostgreSQL database dump complete
--

