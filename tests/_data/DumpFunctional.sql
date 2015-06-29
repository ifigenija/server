--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-29 12:43:27 CEST

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
-- TOC entry 183 (class 1259 OID 8416549)
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
-- TOC entry 230 (class 1259 OID 8417067)
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
-- TOC entry 229 (class 1259 OID 8417050)
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
-- TOC entry 222 (class 1259 OID 8416954)
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
-- TOC entry 197 (class 1259 OID 8416728)
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
-- TOC entry 200 (class 1259 OID 8416762)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8417150)
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
-- TOC entry 192 (class 1259 OID 8416671)
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
-- TOC entry 231 (class 1259 OID 8417080)
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
-- TOC entry 216 (class 1259 OID 8416888)
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
-- TOC entry 195 (class 1259 OID 8416708)
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
-- TOC entry 199 (class 1259 OID 8416756)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8416688)
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
-- TOC entry 205 (class 1259 OID 8416805)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8416830)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8416645)
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
-- TOC entry 184 (class 1259 OID 8416558)
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
-- TOC entry 185 (class 1259 OID 8416569)
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
-- TOC entry 180 (class 1259 OID 8416523)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8416542)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8416837)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8416868)
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
-- TOC entry 226 (class 1259 OID 8417000)
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
-- TOC entry 187 (class 1259 OID 8416602)
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
-- TOC entry 189 (class 1259 OID 8416637)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8416811)
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
-- TOC entry 188 (class 1259 OID 8416622)
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
-- TOC entry 194 (class 1259 OID 8416700)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8416823)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8416943)
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
-- TOC entry 225 (class 1259 OID 8416992)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8417126)
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
-- TOC entry 212 (class 1259 OID 8416852)
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
-- TOC entry 204 (class 1259 OID 8416796)
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
-- TOC entry 203 (class 1259 OID 8416786)
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
-- TOC entry 224 (class 1259 OID 8416981)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8416920)
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
-- TOC entry 177 (class 1259 OID 8416494)
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
-- TOC entry 176 (class 1259 OID 8416492)
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
-- TOC entry 213 (class 1259 OID 8416862)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8416532)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8416516)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8416876)
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
-- TOC entry 207 (class 1259 OID 8416817)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8416767)
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
-- TOC entry 237 (class 1259 OID 8417170)
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
-- TOC entry 236 (class 1259 OID 8417162)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8417157)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8416930)
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
-- TOC entry 186 (class 1259 OID 8416594)
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
-- TOC entry 202 (class 1259 OID 8416773)
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
-- TOC entry 223 (class 1259 OID 8416970)
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
-- TOC entry 233 (class 1259 OID 8417139)
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
-- TOC entry 191 (class 1259 OID 8416657)
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
-- TOC entry 178 (class 1259 OID 8416503)
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
-- TOC entry 228 (class 1259 OID 8417027)
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
-- TOC entry 196 (class 1259 OID 8416719)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8416844)
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
-- TOC entry 218 (class 1259 OID 8416913)
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
-- TOC entry 198 (class 1259 OID 8416751)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8417017)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8416903)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8416497)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2848 (class 0 OID 8416549)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8417067)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5591-214e-c352-e48e849b0802	000d0000-5591-214e-05b1-25017ccfa370	\N	00090000-5591-214e-e20c-ee2e6f643847	000b0000-5591-214e-8564-897485a50cee	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5591-214e-102f-2400525e4d14	000d0000-5591-214e-7cb4-88ea29471191	\N	00090000-5591-214e-0d5d-ed2ec3bfeec9	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5591-214e-967b-053f9d16c272	000d0000-5591-214e-e3be-7e3685afc530	\N	00090000-5591-214e-d3b7-6f17c886f328	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5591-214e-0b37-5e0fa96036bb	000d0000-5591-214e-5cae-16d6fc13bc79	\N	00090000-5591-214e-6924-c375d3b9e2b6	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5591-214e-c446-1b06092822ec	000d0000-5591-214e-636b-8c28f64893ba	\N	00090000-5591-214e-f675-3fefb5883182	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5591-214e-f5b8-d33fa9b9cdc3	000d0000-5591-214e-f85f-95f72d6e1a55	\N	00090000-5591-214e-0d5d-ed2ec3bfeec9	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2894 (class 0 OID 8417050)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 8416954)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5591-214e-2d11-1ffb72458174	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5591-214e-de03-62d21fd01cf2	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5591-214e-e71c-e680b6132eb2	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2862 (class 0 OID 8416728)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5591-214e-06ad-68f39cdeab3a	\N	\N	00200000-5591-214e-0bc9-8a809e289d05	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5591-214e-0d07-47daa84d7857	\N	\N	00200000-5591-214e-abcd-9bda46a1b68f	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5591-214e-35b0-e8584c243b0a	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5591-214e-830c-8e96348910b8	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5591-214e-5c4f-17a98c98931e	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2865 (class 0 OID 8416762)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 8417150)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 8416671)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5591-214c-6f20-1a928b5bce4a	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5591-214c-0016-3517cbc7aff2	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5591-214c-cd72-c143ed718091	AL	ALB	008	Albania 	Albanija	\N
00040000-5591-214c-d502-282e19bb1e82	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5591-214c-2643-d270f14bb9aa	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5591-214c-5290-6204b44a7381	AD	AND	020	Andorra 	Andora	\N
00040000-5591-214c-4a57-8ffcc000cd65	AO	AGO	024	Angola 	Angola	\N
00040000-5591-214c-04eb-8491a588ca54	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5591-214c-8e83-b8df1cf0d2d4	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5591-214c-fdcb-bed8b7d36899	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5591-214c-186f-048d75d17c6b	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5591-214c-5acd-46b37884d6f5	AM	ARM	051	Armenia 	Armenija	\N
00040000-5591-214c-3a68-9f6fcb3fd056	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5591-214c-781d-7a69a5ad019f	AU	AUS	036	Australia 	Avstralija	\N
00040000-5591-214c-770b-86a9039d077e	AT	AUT	040	Austria 	Avstrija	\N
00040000-5591-214c-e795-f8e9d999c228	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5591-214c-c359-b022190544fb	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5591-214c-8ff4-dc31e641881a	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5591-214c-d3ec-e006440d2174	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5591-214c-dbfb-5d14979d0acc	BB	BRB	052	Barbados 	Barbados	\N
00040000-5591-214c-293f-b4d55cc945a3	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5591-214c-10b0-7d0a7f6a7b74	BE	BEL	056	Belgium 	Belgija	\N
00040000-5591-214c-7e34-f1461b96ce86	BZ	BLZ	084	Belize 	Belize	\N
00040000-5591-214c-f8fd-3b5be8008dd5	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5591-214c-430f-47fd5602af82	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5591-214c-a4c6-c8f24d0934ff	BT	BTN	064	Bhutan 	Butan	\N
00040000-5591-214c-918b-2f82b9816808	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5591-214c-c61e-c84d1900d1e4	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5591-214c-0772-55274e9aa0cd	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5591-214c-ee48-aaaa85ce0826	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5591-214c-fb3e-2ef91449ab3b	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5591-214c-63fb-fae0640e54ca	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5591-214c-143a-1da38b234c02	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5591-214c-89c7-875a3c69ce41	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5591-214c-63d0-558e4242b817	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5591-214c-7562-17255a4484a8	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5591-214c-fa64-017c8ff8b810	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5591-214c-83be-8615475cc878	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5591-214c-fd02-162d7f565147	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5591-214c-94ad-ce8e4ce176cf	CA	CAN	124	Canada 	Kanada	\N
00040000-5591-214c-3648-e814107c2c69	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5591-214c-ca84-9b54b18c2f37	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5591-214c-ae3c-5ba7a03099dd	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5591-214c-65f0-998412b0a9db	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5591-214c-60e7-258567d0365a	CL	CHL	152	Chile 	Čile	\N
00040000-5591-214c-22c1-59eb0fcbf63d	CN	CHN	156	China 	Kitajska	\N
00040000-5591-214c-39a2-99a541eb849f	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5591-214c-1f95-52342658a32d	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5591-214c-6a32-87a67bf17158	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5591-214c-7c8f-2dc21e24bbbc	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5591-214c-bf29-3d5cb67c93ab	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5591-214c-e893-2ef992984e48	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5591-214c-14c6-29ea8539a7e3	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5591-214c-a334-0c4169c422de	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5591-214c-fccf-731dace3c07e	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5591-214c-ee1a-b2a87da74c14	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5591-214c-3558-0d540f78bd2a	CU	CUB	192	Cuba 	Kuba	\N
00040000-5591-214c-4685-749dfd12d387	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5591-214c-4b5c-83fed8ee453e	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5591-214c-fdb0-9eed7d3889dc	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5591-214c-99d0-d3d305206d09	DK	DNK	208	Denmark 	Danska	\N
00040000-5591-214c-c09e-abaf098e514e	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5591-214c-feb8-817b1c51d12f	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5591-214c-b1d3-4858bd07a7e3	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5591-214c-6c62-9b8ca98b3b46	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5591-214c-a3c4-42dda267b6a1	EG	EGY	818	Egypt 	Egipt	\N
00040000-5591-214c-842a-56bf4b6287d4	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5591-214c-f7d6-9e930d48bb36	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5591-214c-0869-6415718f57a8	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5591-214c-25fa-5e5bf6190d0b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5591-214c-4c1f-396e254737e3	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5591-214c-2b4a-59856682faee	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5591-214c-20c4-d77a22093532	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5591-214c-e248-cb7d2c88cb65	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5591-214c-5e76-68c0d22d5b1e	FI	FIN	246	Finland 	Finska	\N
00040000-5591-214c-3b5f-3e8ad58b36a5	FR	FRA	250	France 	Francija	\N
00040000-5591-214c-d677-4ebed4a68788	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5591-214c-03ed-1622370a5812	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5591-214c-d04b-7e4607a04b8d	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5591-214c-f7ff-a39fafa4bd59	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5591-214c-f21d-e2bb29be6298	GA	GAB	266	Gabon 	Gabon	\N
00040000-5591-214c-3a9c-1161a7e56a2b	GM	GMB	270	Gambia 	Gambija	\N
00040000-5591-214c-1fb7-68abfda1bbf1	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5591-214c-bb22-14bf5943ec17	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5591-214c-282b-0e39ebe706fd	GH	GHA	288	Ghana 	Gana	\N
00040000-5591-214c-c0d6-2131683a8cee	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5591-214c-057e-7ac9303cc0ed	GR	GRC	300	Greece 	Grčija	\N
00040000-5591-214c-b6a0-71ce5c10b748	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5591-214c-1db1-d27019f02f77	GD	GRD	308	Grenada 	Grenada	\N
00040000-5591-214c-f516-181e541fcde2	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5591-214c-8925-80f54ced9c6d	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5591-214c-2110-a88e96248217	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5591-214c-5ac7-9dcafe4a2c6c	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5591-214c-902e-1a0c118ea243	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5591-214c-2e4b-42f39cbc5f1f	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5591-214c-a672-8fcda7405002	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5591-214c-0b31-13cfb181834f	HT	HTI	332	Haiti 	Haiti	\N
00040000-5591-214c-2758-cec3463982f4	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5591-214c-6aea-7beaa75d8c7f	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5591-214c-5e4f-6f30b804342a	HN	HND	340	Honduras 	Honduras	\N
00040000-5591-214c-5419-5960a59d8927	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5591-214c-ab9b-28993619e4ed	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5591-214c-8802-c2a1f2c3030b	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5591-214c-f8c2-814375081067	IN	IND	356	India 	Indija	\N
00040000-5591-214c-e26d-09280abdde6b	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5591-214c-5ee9-b8ac6a9bdb36	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5591-214c-ce3c-70a2ab6ed7fe	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5591-214c-1551-d9738dd53b24	IE	IRL	372	Ireland 	Irska	\N
00040000-5591-214c-09d6-ff8470d76f27	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5591-214c-7fdb-8d9327f70f30	IL	ISR	376	Israel 	Izrael	\N
00040000-5591-214c-e1b2-dc9aeeed0904	IT	ITA	380	Italy 	Italija	\N
00040000-5591-214c-2f72-fffcb1ced770	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5591-214c-987d-8fe8f967bca2	JP	JPN	392	Japan 	Japonska	\N
00040000-5591-214c-8d41-940fe2abe47b	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5591-214c-4692-0b7ec7a2b41d	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5591-214c-318a-cd8461ff5997	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5591-214c-333c-82022e8ced06	KE	KEN	404	Kenya 	Kenija	\N
00040000-5591-214c-0feb-ee124073e671	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5591-214c-592a-abb606fc044f	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5591-214c-f3e4-d5c29fc7a32b	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5591-214c-b4a8-02a63443206e	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5591-214c-b256-e185e66e7dcc	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5591-214c-9674-a56e17b7c4a3	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5591-214c-f5a6-66b2b6255b3d	LV	LVA	428	Latvia 	Latvija	\N
00040000-5591-214c-da9c-6b7b2957cfb1	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5591-214c-dbe6-e8ce0d15040f	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5591-214c-b610-3691705aad13	LR	LBR	430	Liberia 	Liberija	\N
00040000-5591-214c-12f8-3b5e3da2dc39	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5591-214c-a130-26e240a50cd3	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5591-214c-ed55-9728290d8afa	LT	LTU	440	Lithuania 	Litva	\N
00040000-5591-214c-6557-ad3263141468	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5591-214c-0879-319965305adf	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5591-214c-5532-8f718b394a57	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5591-214c-c21c-1714ddb9e466	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5591-214c-6a18-5ce46c902adf	MW	MWI	454	Malawi 	Malavi	\N
00040000-5591-214c-7c25-496fff4f20ff	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5591-214c-5ae4-b617df2c1d3c	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5591-214c-8066-87ac7459d26c	ML	MLI	466	Mali 	Mali	\N
00040000-5591-214c-505d-27efd0ad73e4	MT	MLT	470	Malta 	Malta	\N
00040000-5591-214c-9a66-3d573a392ad6	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5591-214c-cae6-f03ca0f44f27	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5591-214c-265b-ee87caf81879	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5591-214c-bb65-ef56802bc11b	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5591-214c-ce72-ed21c94d77af	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5591-214c-7898-1f71a81c2a2a	MX	MEX	484	Mexico 	Mehika	\N
00040000-5591-214c-851b-3f2a34d1da14	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5591-214c-33df-89826cc7593a	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5591-214c-d486-5ac16ac13da3	MC	MCO	492	Monaco 	Monako	\N
00040000-5591-214c-0e3c-c2ccb0f9b1ed	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5591-214c-2fea-7894fb8e3192	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5591-214c-a4a2-43d822d64644	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5591-214c-6976-f939b518137c	MA	MAR	504	Morocco 	Maroko	\N
00040000-5591-214c-3498-d6997fe562b7	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5591-214c-713f-ecf1658f479f	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5591-214c-33d2-80f98ff6f718	NA	NAM	516	Namibia 	Namibija	\N
00040000-5591-214c-95c3-30a83eafa877	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5591-214c-d48a-da46ce21f0c4	NP	NPL	524	Nepal 	Nepal	\N
00040000-5591-214c-617f-1d36fe770139	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5591-214c-6369-265aa5cb11f4	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5591-214c-8279-6182a924180b	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5591-214c-09a8-20277c4727c3	NE	NER	562	Niger 	Niger 	\N
00040000-5591-214c-1042-9023192efc19	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5591-214c-43c4-c3185849f51c	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5591-214c-07ad-5de0e316f965	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5591-214c-50f9-724226b8de48	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5591-214c-6fdd-97b45ddfdd97	NO	NOR	578	Norway 	Norveška	\N
00040000-5591-214c-04b8-0fa2f0497a0a	OM	OMN	512	Oman 	Oman	\N
00040000-5591-214c-75b7-9161aa65510a	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5591-214c-0d14-0ee3cab77171	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5591-214c-1379-da20774e0ad4	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5591-214c-fa5a-7e5f21390cf3	PA	PAN	591	Panama 	Panama	\N
00040000-5591-214c-a83e-a537e474e784	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5591-214c-06e8-b69f9d9d80d9	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5591-214c-a762-22dd23c21221	PE	PER	604	Peru 	Peru	\N
00040000-5591-214c-21ac-7a4ddc3adf4b	PH	PHL	608	Philippines 	Filipini	\N
00040000-5591-214c-991d-c3f360002e0e	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5591-214c-84dc-adc45222feb1	PL	POL	616	Poland 	Poljska	\N
00040000-5591-214c-6cf0-7601901a1043	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5591-214c-2071-57f3d82ce4b8	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5591-214c-6782-7fd45883de3e	QA	QAT	634	Qatar 	Katar	\N
00040000-5591-214c-1c65-c5e081b74c2d	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5591-214c-5b95-ffb14a9a486e	RO	ROU	642	Romania 	Romunija	\N
00040000-5591-214c-fd7e-96e4a455523e	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5591-214c-086a-774b21e50470	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5591-214c-0b13-eb139050a861	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5591-214c-d893-2dd6a4a48168	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5591-214c-0e21-bd8c402c5042	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5591-214c-d290-3ed600e9a066	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5591-214c-aa6b-99b1cd5073f9	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5591-214c-6273-95bd46e84c96	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5591-214c-80f3-08e5b7b984f3	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5591-214c-56fc-cd45cbeabeaa	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5591-214c-32bb-8e83cfa93e29	SM	SMR	674	San Marino 	San Marino	\N
00040000-5591-214c-e451-8092bae8b7b5	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5591-214c-44ee-6a30943f1594	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5591-214c-ceb9-b918bd06c1d1	SN	SEN	686	Senegal 	Senegal	\N
00040000-5591-214c-179b-ea03038357b4	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5591-214c-77be-4f67868ee22d	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5591-214c-f417-8a8ad1234f8c	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5591-214c-74ce-1cdc2e3d4a73	SG	SGP	702	Singapore 	Singapur	\N
00040000-5591-214c-9bd5-1c16edd8d5e4	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5591-214c-4a78-f8c1137d1b83	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5591-214c-a792-9ea87ee4fa8d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5591-214c-e8bb-641315875c14	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5591-214c-7d6d-34ccf745cba3	SO	SOM	706	Somalia 	Somalija	\N
00040000-5591-214c-e54a-16b7fd0c038b	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5591-214c-5357-92ee2c2219db	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5591-214c-8ebd-11b64b7f4c6a	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5591-214c-3afa-a8c3a8f411dc	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5591-214c-b902-5665ec8c8b42	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5591-214c-bd5d-eb988bebfeaf	SD	SDN	729	Sudan 	Sudan	\N
00040000-5591-214c-e0e7-99315978e1f0	SR	SUR	740	Suriname 	Surinam	\N
00040000-5591-214c-7b41-78ffaed1ff76	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5591-214c-5423-a9f39cb7e40b	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5591-214c-b5cc-f59174acefc3	SE	SWE	752	Sweden 	Švedska	\N
00040000-5591-214c-f61d-ac994cd02778	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5591-214c-6990-e3b40437e218	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5591-214c-5b97-80acecac1cc4	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5591-214c-d2b4-ed2ff3f2bc91	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5591-214c-58a1-365bfea7fd23	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5591-214c-1002-603173eae80b	TH	THA	764	Thailand 	Tajska	\N
00040000-5591-214c-2039-e495611d6334	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5591-214c-cdab-21acead2606d	TG	TGO	768	Togo 	Togo	\N
00040000-5591-214c-131a-b83bb8f11a52	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5591-214c-dc9a-967746e97c1b	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5591-214c-f162-c14a6d2a7af5	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5591-214c-a53a-a0d793199cd6	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5591-214c-3ce8-f83ce20d3d92	TR	TUR	792	Turkey 	Turčija	\N
00040000-5591-214c-a7f6-b56d5aad92b5	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5591-214c-158f-e9a928f40a3f	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5591-214c-14fd-c4e9a61e520c	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5591-214c-5e48-f5ae3dd349f2	UG	UGA	800	Uganda 	Uganda	\N
00040000-5591-214c-5d29-fbc73453b926	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5591-214c-57c6-bc50ab19b9af	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5591-214c-4879-878668271728	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5591-214c-d80a-2bd6cf11c004	US	USA	840	United States 	Združene države Amerike	\N
00040000-5591-214c-6edc-e8f7d5998880	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5591-214c-ccaf-50696aa279c8	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5591-214c-6726-3205432ef04f	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5591-214c-5369-4c7e97fabc86	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5591-214c-d462-7c8f5cbe5304	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5591-214c-053b-3162d5d20c83	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5591-214c-b039-12bf0b3b8e94	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5591-214c-a3b6-1f9a2797696d	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5591-214c-68da-f7d52f6a7585	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5591-214c-a8ca-8eb6a878a9c0	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5591-214c-596c-388f6f9a8131	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5591-214c-c210-4464393918bd	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5591-214c-9e20-b84cb8a1105c	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2896 (class 0 OID 8417080)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-5591-214e-467d-8581f71ca6be	000e0000-5591-214e-6fc5-51212c3252ae	\N	\N	10000.80	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-5591-214d-dc16-b7e4821e3f7a	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5591-214e-b76e-e6371ed8a2e3	000e0000-5591-214e-ca6b-f741ab101b2c	\N	\N	5000.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-5591-214d-359d-99349bfe92b6	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2881 (class 0 OID 8416888)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5591-214e-5b86-5c652c356aea	000e0000-5591-214e-ca6b-f741ab101b2c	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5591-214d-0d6f-f0017a770ffa
000d0000-5591-214e-05b1-25017ccfa370	000e0000-5591-214e-ca6b-f741ab101b2c	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5591-214d-0d6f-f0017a770ffa
000d0000-5591-214e-7cb4-88ea29471191	000e0000-5591-214e-ca6b-f741ab101b2c	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5591-214d-8365-dd9d1647c53e
000d0000-5591-214e-e3be-7e3685afc530	000e0000-5591-214e-ca6b-f741ab101b2c	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5591-214d-0e5c-664c754c8154
000d0000-5591-214e-5cae-16d6fc13bc79	000e0000-5591-214e-ca6b-f741ab101b2c	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5591-214d-0e5c-664c754c8154
000d0000-5591-214e-636b-8c28f64893ba	000e0000-5591-214e-ca6b-f741ab101b2c	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5591-214d-0e5c-664c754c8154
000d0000-5591-214e-f85f-95f72d6e1a55	000e0000-5591-214e-ca6b-f741ab101b2c	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5591-214d-0d6f-f0017a770ffa
\.


--
-- TOC entry 2860 (class 0 OID 8416708)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8416756)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 8416688)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5591-214e-2ff4-64256541ec3e	00080000-5591-214e-3308-770b82b64e69	00090000-5591-214e-e20c-ee2e6f643847	AK		
\.


--
-- TOC entry 2835 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8416805)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8416830)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 8416645)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5591-214d-bd39-2299a81175fd	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5591-214d-7814-8953a554c7d0	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5591-214d-b323-bf6231b57d5c	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5591-214d-a645-c242ad7f765c	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5591-214d-16c5-9c1645bad51b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5591-214d-9d56-b9efc46c4a19	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5591-214d-b672-feefaf2b1b8f	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5591-214d-87ce-9b5521fcc759	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5591-214d-9047-50442ed3dd35	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5591-214d-8340-6b155e5575c0	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5591-214d-1de3-5c54c7024b9c	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5591-214d-abe5-57eba78db7be	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5591-214d-71fa-126760669c6b	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5591-214e-225b-6ffcfa98f884	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5591-214e-1ede-09eb5b371fe5	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5591-214e-e7cb-53c2b822cd69	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5591-214e-04b3-0e8642bb83c5	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5591-214e-d432-0f71a3c35fa9	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5591-214e-6275-c9fffbe928dd	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2849 (class 0 OID 8416558)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5591-214e-92a5-f79cd663dead	00000000-5591-214e-1ede-09eb5b371fe5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5591-214e-17d8-36ea0ebef4c5	00000000-5591-214e-1ede-09eb5b371fe5	00010000-5591-214d-880c-c87b0190b46d	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5591-214e-a6e1-c8cfb78e9db2	00000000-5591-214e-e7cb-53c2b822cd69	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2850 (class 0 OID 8416569)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5591-214e-fb49-2719f1413bce	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5591-214e-6924-c375d3b9e2b6	00010000-5591-214e-ca89-058650a35b99	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5591-214e-d3b7-6f17c886f328	00010000-5591-214e-11da-6091fd8815da	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5591-214e-32d7-2f0815db1f7d	00010000-5591-214e-864f-81c824b380c1	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5591-214e-df3b-b9717fdcc921	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5591-214e-d301-41dfe1f62a2c	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5591-214e-e76a-a0f81ad1b516	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5591-214e-5bc9-7e94e7f0c747	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5591-214e-e20c-ee2e6f643847	00010000-5591-214e-990c-071277022e32	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5591-214e-0d5d-ed2ec3bfeec9	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5591-214e-f2e7-588307413ce9	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5591-214e-f675-3fefb5883182	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5591-214e-951a-62f85ef5a8e4	00010000-5591-214e-83c4-c61290811663	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2837 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 8416523)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5591-214c-9f55-e017eebb356e	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5591-214c-c5a6-4a328e97acaf	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5591-214c-a83d-3057762a317b	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5591-214c-8b68-92191170520a	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5591-214c-eea6-5e99dd667630	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5591-214c-23eb-cd26c1763956	Abonma-read	Abonma - branje	f
00030000-5591-214c-0015-6fa2561dd567	Abonma-write	Abonma - spreminjanje	f
00030000-5591-214c-bd3a-f2ec798ef554	Alternacija-read	Alternacija - branje	f
00030000-5591-214c-5266-ea6294c8bfb0	Alternacija-write	Alternacija - spreminjanje	f
00030000-5591-214c-f467-89572d874ab9	Arhivalija-read	Arhivalija - branje	f
00030000-5591-214c-133c-a76853e54ef6	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5591-214c-f6cf-80358751fc20	Besedilo-read	Besedilo - branje	f
00030000-5591-214c-748b-390e7f10b426	Besedilo-write	Besedilo - spreminjanje	f
00030000-5591-214c-ba6b-ea6f1e8ac7c5	DogodekIzven-read	DogodekIzven - branje	f
00030000-5591-214c-5955-4b93a72ffe66	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5591-214c-3202-2a276f4bb0d7	Dogodek-read	Dogodek - branje	f
00030000-5591-214c-68af-2ff0a6356b28	Dogodek-write	Dogodek - spreminjanje	f
00030000-5591-214c-e1f7-a06c094dc568	DrugiVir-read	DrugiVir - branje	f
00030000-5591-214c-c2e6-6a6781c3a1e2	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5591-214c-3085-5f9751ae8a12	Drzava-read	Drzava - branje	f
00030000-5591-214c-5fa8-ebda1214b05f	Drzava-write	Drzava - spreminjanje	f
00030000-5591-214c-e1a8-36a0fa25d3f0	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5591-214c-8d16-3cfa70f5eb49	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5591-214c-795c-64a1f2a57107	Funkcija-read	Funkcija - branje	f
00030000-5591-214c-4de3-5d8ad2ce5ec0	Funkcija-write	Funkcija - spreminjanje	f
00030000-5591-214c-fa7e-9c83b7195fc2	Gostovanje-read	Gostovanje - branje	f
00030000-5591-214c-f611-12a702515f8f	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5591-214c-d2a8-6561a7847d74	Gostujoca-read	Gostujoca - branje	f
00030000-5591-214c-cdeb-466adbd12117	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5591-214c-1f1c-a60af55b2b53	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5591-214c-5e4c-7a7ba1d94b32	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5591-214c-91b9-06371fb5ae4c	Kupec-read	Kupec - branje	f
00030000-5591-214c-b6a4-f6372da61ced	Kupec-write	Kupec - spreminjanje	f
00030000-5591-214c-980a-07d6777189f0	NacinPlacina-read	NacinPlacina - branje	f
00030000-5591-214c-3066-ed5bc77f1bd9	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5591-214c-a48d-d78c5609fd7b	Option-read	Option - branje	f
00030000-5591-214c-baf9-c0a697193262	Option-write	Option - spreminjanje	f
00030000-5591-214c-4f30-4f8050669707	OptionValue-read	OptionValue - branje	f
00030000-5591-214c-9297-d3b3836f8423	OptionValue-write	OptionValue - spreminjanje	f
00030000-5591-214c-8cc8-60d2a52e3205	Oseba-read	Oseba - branje	f
00030000-5591-214c-f6ea-bef59a3b767a	Oseba-write	Oseba - spreminjanje	f
00030000-5591-214c-94c2-654649241596	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5591-214c-eec7-7e01aa6562a9	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5591-214c-4a21-4ba4dd28855d	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5591-214c-8dfe-b2c7be1d9f92	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5591-214c-3e74-f78ead24829e	Pogodba-read	Pogodba - branje	f
00030000-5591-214c-5617-395a320bdde1	Pogodba-write	Pogodba - spreminjanje	f
00030000-5591-214c-fd06-630fc3370ee1	Popa-read	Popa - branje	f
00030000-5591-214c-f538-c753060d786f	Popa-write	Popa - spreminjanje	f
00030000-5591-214c-90a3-561d7a8c7404	Posta-read	Posta - branje	f
00030000-5591-214c-9cf5-9f5c17c6ef61	Posta-write	Posta - spreminjanje	f
00030000-5591-214c-7278-f5f53308678d	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5591-214c-4661-0a37157b3950	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5591-214c-838c-0de0ab8352d6	PostniNaslov-read	PostniNaslov - branje	f
00030000-5591-214c-9760-33f4a1a9bec2	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5591-214c-c27d-32a4fd4b5464	Predstava-read	Predstava - branje	f
00030000-5591-214c-ab97-9cda672aec5b	Predstava-write	Predstava - spreminjanje	f
00030000-5591-214c-40dd-932020e05a9c	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5591-214c-cc89-cf1493336271	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5591-214c-7cd0-f2e2d2c9429a	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5591-214c-347c-e82e96d16254	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5591-214c-cd9d-8608671c1d22	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5591-214c-ff57-e104b60ca57a	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5591-214c-8520-ba4324a616ba	ProgramDela-read	ProgramDela - branje	f
00030000-5591-214c-e3a0-df8bb6e6b8f6	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5591-214c-1e49-5fd34cb46bdb	ProgramFestival-read	ProgramFestival - branje	f
00030000-5591-214c-903f-a8c82589b21f	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5591-214c-7588-de5c98187993	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5591-214c-41bb-aee57013f58d	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5591-214c-6c5a-19aa9021cc2e	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5591-214c-c427-cf32fe277a08	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5591-214c-1457-440508a31eb8	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5591-214c-c65b-d60e90af484d	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5591-214c-b071-7cb918299189	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5591-214c-4765-6f0747156cf0	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5591-214c-d718-61f489cb9f2b	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5591-214c-8dc6-1b6776866d51	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5591-214c-9ef6-8e3fbba062f7	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5591-214c-71cf-b1460402938e	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5591-214c-e48a-ed01b9e3650a	ProgramRazno-read	ProgramRazno - branje	f
00030000-5591-214c-8ee7-74b20c9f3b1f	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5591-214c-2c48-378a5f13de95	Prostor-read	Prostor - branje	f
00030000-5591-214c-ffee-3baa84cc22a3	Prostor-write	Prostor - spreminjanje	f
00030000-5591-214c-4a07-1a521358adf0	Racun-read	Racun - branje	f
00030000-5591-214c-9918-606fd0fb3504	Racun-write	Racun - spreminjanje	f
00030000-5591-214c-de9b-82d87a975975	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5591-214c-b7e9-9b6916f8306e	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5591-214c-b48a-7e8894e8b2c6	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5591-214c-478d-879912ef5042	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5591-214c-8117-acad885663ed	Rekvizit-read	Rekvizit - branje	f
00030000-5591-214c-9f28-c708aac40bea	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5591-214c-fa25-af845b52d1d5	Revizija-read	Revizija - branje	f
00030000-5591-214c-f83d-462117638796	Revizija-write	Revizija - spreminjanje	f
00030000-5591-214c-901b-62c4fa26e5c4	Rezervacija-read	Rezervacija - branje	f
00030000-5591-214c-d356-c12dd75ba78a	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5591-214c-b474-a6e3dde49403	SedezniRed-read	SedezniRed - branje	f
00030000-5591-214c-32fd-7746f0419255	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5591-214c-bb84-f40a2315dff7	Sedez-read	Sedez - branje	f
00030000-5591-214c-9d9e-26f14fe009da	Sedez-write	Sedez - spreminjanje	f
00030000-5591-214c-6b8e-6e6bc29dc107	Sezona-read	Sezona - branje	f
00030000-5591-214c-3b19-e40def83bab4	Sezona-write	Sezona - spreminjanje	f
00030000-5591-214c-7f1a-563d00bb65c6	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5591-214c-294f-07ef227629c4	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5591-214c-f9fd-7debcc10f0e7	Stevilcenje-read	Stevilcenje - branje	f
00030000-5591-214c-13c3-b2a9b8e02a21	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5591-214c-6862-e4cef36c7243	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5591-214c-ab2f-e5cb08ff22e9	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5591-214c-28cd-961fa4e5c4cb	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5591-214c-cb43-f1241d051f2d	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5591-214c-1be8-ac373bed16a2	Telefonska-read	Telefonska - branje	f
00030000-5591-214c-92fc-1303095e211a	Telefonska-write	Telefonska - spreminjanje	f
00030000-5591-214c-903d-e24bb8538e0e	TerminStoritve-read	TerminStoritve - branje	f
00030000-5591-214c-5858-a054222e7741	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5591-214c-168e-a4b77a01832d	TipFunkcije-read	TipFunkcije - branje	f
00030000-5591-214c-8c37-ab91e834f73d	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5591-214c-2dfb-cbbd80134f25	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5591-214c-2845-4e3cd976c66a	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5591-214c-f95c-eddaadb05e68	Trr-read	Trr - branje	f
00030000-5591-214c-632a-9cec859d379f	Trr-write	Trr - spreminjanje	f
00030000-5591-214c-f610-30d917503349	Uprizoritev-read	Uprizoritev - branje	f
00030000-5591-214c-5dbb-7c5f45c74fbf	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5591-214c-2399-aace83b039a9	Vaja-read	Vaja - branje	f
00030000-5591-214c-f631-2ddf9e7c1939	Vaja-write	Vaja - spreminjanje	f
00030000-5591-214c-4e4c-41fea610ce00	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5591-214c-f468-5ad9c7517011	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5591-214c-8a0b-1d2e19a7dcec	Zaposlitev-read	Zaposlitev - branje	f
00030000-5591-214c-9cc8-13bc58fb9398	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5591-214c-120a-2057859cac70	Zasedenost-read	Zasedenost - branje	f
00030000-5591-214c-0cc2-f2863cdb4dcf	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5591-214c-69ca-a4d514062c7c	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5591-214c-6271-7fbaf7313732	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5591-214c-0202-1d70b5fdfc00	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5591-214c-5216-61cf3d32c4f8	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2847 (class 0 OID 8416542)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5591-214c-b01e-0691f34536e3	00030000-5591-214c-c5a6-4a328e97acaf
00020000-5591-214c-3850-087f829b4207	00030000-5591-214c-3085-5f9751ae8a12
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-23eb-cd26c1763956
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-0015-6fa2561dd567
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-bd3a-f2ec798ef554
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-5266-ea6294c8bfb0
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-f467-89572d874ab9
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-3202-2a276f4bb0d7
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-8b68-92191170520a
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-68af-2ff0a6356b28
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-3085-5f9751ae8a12
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-5fa8-ebda1214b05f
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-795c-64a1f2a57107
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-4de3-5d8ad2ce5ec0
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-fa7e-9c83b7195fc2
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-f611-12a702515f8f
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-d2a8-6561a7847d74
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-cdeb-466adbd12117
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-1f1c-a60af55b2b53
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-5e4c-7a7ba1d94b32
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-a48d-d78c5609fd7b
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-4f30-4f8050669707
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-8cc8-60d2a52e3205
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-f6ea-bef59a3b767a
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-fd06-630fc3370ee1
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-f538-c753060d786f
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-90a3-561d7a8c7404
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-9cf5-9f5c17c6ef61
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-838c-0de0ab8352d6
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-9760-33f4a1a9bec2
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-c27d-32a4fd4b5464
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-ab97-9cda672aec5b
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-cd9d-8608671c1d22
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-ff57-e104b60ca57a
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-2c48-378a5f13de95
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-ffee-3baa84cc22a3
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-b48a-7e8894e8b2c6
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-478d-879912ef5042
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-8117-acad885663ed
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-9f28-c708aac40bea
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-6b8e-6e6bc29dc107
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-3b19-e40def83bab4
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-168e-a4b77a01832d
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-f610-30d917503349
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-5dbb-7c5f45c74fbf
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-2399-aace83b039a9
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-f631-2ddf9e7c1939
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-120a-2057859cac70
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-0cc2-f2863cdb4dcf
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-69ca-a4d514062c7c
00020000-5591-214c-7548-77012ab7dad0	00030000-5591-214c-0202-1d70b5fdfc00
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-23eb-cd26c1763956
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-f467-89572d874ab9
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-3202-2a276f4bb0d7
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-3085-5f9751ae8a12
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-fa7e-9c83b7195fc2
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-d2a8-6561a7847d74
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-1f1c-a60af55b2b53
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-5e4c-7a7ba1d94b32
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-a48d-d78c5609fd7b
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-4f30-4f8050669707
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-8cc8-60d2a52e3205
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-f6ea-bef59a3b767a
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-fd06-630fc3370ee1
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-90a3-561d7a8c7404
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-838c-0de0ab8352d6
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-9760-33f4a1a9bec2
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-c27d-32a4fd4b5464
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-2c48-378a5f13de95
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-b48a-7e8894e8b2c6
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-8117-acad885663ed
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-6b8e-6e6bc29dc107
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-1be8-ac373bed16a2
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-92fc-1303095e211a
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-f95c-eddaadb05e68
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-632a-9cec859d379f
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-8a0b-1d2e19a7dcec
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-9cc8-13bc58fb9398
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-69ca-a4d514062c7c
00020000-5591-214c-e183-bff40e3e341e	00030000-5591-214c-0202-1d70b5fdfc00
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-23eb-cd26c1763956
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-bd3a-f2ec798ef554
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-f467-89572d874ab9
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-133c-a76853e54ef6
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-f6cf-80358751fc20
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-ba6b-ea6f1e8ac7c5
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-3202-2a276f4bb0d7
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-3085-5f9751ae8a12
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-795c-64a1f2a57107
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-fa7e-9c83b7195fc2
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-d2a8-6561a7847d74
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-1f1c-a60af55b2b53
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-a48d-d78c5609fd7b
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-4f30-4f8050669707
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-8cc8-60d2a52e3205
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-fd06-630fc3370ee1
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-90a3-561d7a8c7404
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-c27d-32a4fd4b5464
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-cd9d-8608671c1d22
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-2c48-378a5f13de95
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-b48a-7e8894e8b2c6
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-8117-acad885663ed
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-6b8e-6e6bc29dc107
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-168e-a4b77a01832d
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-2399-aace83b039a9
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-120a-2057859cac70
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-69ca-a4d514062c7c
00020000-5591-214c-5f44-fc650f2cdba0	00030000-5591-214c-0202-1d70b5fdfc00
00020000-5591-214c-e791-3c636f017a06	00030000-5591-214c-23eb-cd26c1763956
00020000-5591-214c-e791-3c636f017a06	00030000-5591-214c-0015-6fa2561dd567
00020000-5591-214c-e791-3c636f017a06	00030000-5591-214c-5266-ea6294c8bfb0
00020000-5591-214c-e791-3c636f017a06	00030000-5591-214c-f467-89572d874ab9
00020000-5591-214c-e791-3c636f017a06	00030000-5591-214c-3202-2a276f4bb0d7
00020000-5591-214c-e791-3c636f017a06	00030000-5591-214c-3085-5f9751ae8a12
00020000-5591-214c-e791-3c636f017a06	00030000-5591-214c-fa7e-9c83b7195fc2
00020000-5591-214c-e791-3c636f017a06	00030000-5591-214c-d2a8-6561a7847d74
00020000-5591-214c-e791-3c636f017a06	00030000-5591-214c-a48d-d78c5609fd7b
00020000-5591-214c-e791-3c636f017a06	00030000-5591-214c-4f30-4f8050669707
00020000-5591-214c-e791-3c636f017a06	00030000-5591-214c-fd06-630fc3370ee1
00020000-5591-214c-e791-3c636f017a06	00030000-5591-214c-90a3-561d7a8c7404
00020000-5591-214c-e791-3c636f017a06	00030000-5591-214c-c27d-32a4fd4b5464
00020000-5591-214c-e791-3c636f017a06	00030000-5591-214c-2c48-378a5f13de95
00020000-5591-214c-e791-3c636f017a06	00030000-5591-214c-b48a-7e8894e8b2c6
00020000-5591-214c-e791-3c636f017a06	00030000-5591-214c-8117-acad885663ed
00020000-5591-214c-e791-3c636f017a06	00030000-5591-214c-6b8e-6e6bc29dc107
00020000-5591-214c-e791-3c636f017a06	00030000-5591-214c-168e-a4b77a01832d
00020000-5591-214c-e791-3c636f017a06	00030000-5591-214c-69ca-a4d514062c7c
00020000-5591-214c-e791-3c636f017a06	00030000-5591-214c-0202-1d70b5fdfc00
00020000-5591-214d-e3fb-9aa076012984	00030000-5591-214c-23eb-cd26c1763956
00020000-5591-214d-e3fb-9aa076012984	00030000-5591-214c-f467-89572d874ab9
00020000-5591-214d-e3fb-9aa076012984	00030000-5591-214c-3202-2a276f4bb0d7
00020000-5591-214d-e3fb-9aa076012984	00030000-5591-214c-3085-5f9751ae8a12
00020000-5591-214d-e3fb-9aa076012984	00030000-5591-214c-fa7e-9c83b7195fc2
00020000-5591-214d-e3fb-9aa076012984	00030000-5591-214c-d2a8-6561a7847d74
00020000-5591-214d-e3fb-9aa076012984	00030000-5591-214c-a48d-d78c5609fd7b
00020000-5591-214d-e3fb-9aa076012984	00030000-5591-214c-4f30-4f8050669707
00020000-5591-214d-e3fb-9aa076012984	00030000-5591-214c-fd06-630fc3370ee1
00020000-5591-214d-e3fb-9aa076012984	00030000-5591-214c-90a3-561d7a8c7404
00020000-5591-214d-e3fb-9aa076012984	00030000-5591-214c-c27d-32a4fd4b5464
00020000-5591-214d-e3fb-9aa076012984	00030000-5591-214c-2c48-378a5f13de95
00020000-5591-214d-e3fb-9aa076012984	00030000-5591-214c-b48a-7e8894e8b2c6
00020000-5591-214d-e3fb-9aa076012984	00030000-5591-214c-8117-acad885663ed
00020000-5591-214d-e3fb-9aa076012984	00030000-5591-214c-6b8e-6e6bc29dc107
00020000-5591-214d-e3fb-9aa076012984	00030000-5591-214c-903d-e24bb8538e0e
00020000-5591-214d-e3fb-9aa076012984	00030000-5591-214c-a83d-3057762a317b
00020000-5591-214d-e3fb-9aa076012984	00030000-5591-214c-168e-a4b77a01832d
00020000-5591-214d-e3fb-9aa076012984	00030000-5591-214c-69ca-a4d514062c7c
00020000-5591-214d-e3fb-9aa076012984	00030000-5591-214c-0202-1d70b5fdfc00
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-9f55-e017eebb356e
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-c5a6-4a328e97acaf
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-a83d-3057762a317b
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-8b68-92191170520a
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-eea6-5e99dd667630
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-23eb-cd26c1763956
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-0015-6fa2561dd567
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-bd3a-f2ec798ef554
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-5266-ea6294c8bfb0
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-f467-89572d874ab9
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-133c-a76853e54ef6
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-f6cf-80358751fc20
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-748b-390e7f10b426
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-ba6b-ea6f1e8ac7c5
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-5955-4b93a72ffe66
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-3202-2a276f4bb0d7
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-68af-2ff0a6356b28
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-3085-5f9751ae8a12
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-5fa8-ebda1214b05f
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-e1a8-36a0fa25d3f0
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-8d16-3cfa70f5eb49
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-795c-64a1f2a57107
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-4de3-5d8ad2ce5ec0
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-fa7e-9c83b7195fc2
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-f611-12a702515f8f
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-d2a8-6561a7847d74
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-cdeb-466adbd12117
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-1f1c-a60af55b2b53
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-5e4c-7a7ba1d94b32
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-91b9-06371fb5ae4c
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-b6a4-f6372da61ced
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-980a-07d6777189f0
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-3066-ed5bc77f1bd9
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-a48d-d78c5609fd7b
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-baf9-c0a697193262
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-4f30-4f8050669707
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-9297-d3b3836f8423
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-8cc8-60d2a52e3205
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-f6ea-bef59a3b767a
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-94c2-654649241596
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-eec7-7e01aa6562a9
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-4a21-4ba4dd28855d
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-8dfe-b2c7be1d9f92
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-3e74-f78ead24829e
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-5617-395a320bdde1
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-fd06-630fc3370ee1
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-f538-c753060d786f
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-90a3-561d7a8c7404
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-9cf5-9f5c17c6ef61
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-7278-f5f53308678d
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-4661-0a37157b3950
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-838c-0de0ab8352d6
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-9760-33f4a1a9bec2
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-c27d-32a4fd4b5464
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-ab97-9cda672aec5b
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-40dd-932020e05a9c
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-cc89-cf1493336271
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-7cd0-f2e2d2c9429a
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-347c-e82e96d16254
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-cd9d-8608671c1d22
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-ff57-e104b60ca57a
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-8520-ba4324a616ba
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-e3a0-df8bb6e6b8f6
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-1e49-5fd34cb46bdb
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-903f-a8c82589b21f
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-7588-de5c98187993
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-41bb-aee57013f58d
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-6c5a-19aa9021cc2e
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-c427-cf32fe277a08
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-1457-440508a31eb8
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-c65b-d60e90af484d
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-b071-7cb918299189
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-4765-6f0747156cf0
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-d718-61f489cb9f2b
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-8dc6-1b6776866d51
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-9ef6-8e3fbba062f7
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-71cf-b1460402938e
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-e48a-ed01b9e3650a
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-8ee7-74b20c9f3b1f
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-2c48-378a5f13de95
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-ffee-3baa84cc22a3
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-4a07-1a521358adf0
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-9918-606fd0fb3504
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-de9b-82d87a975975
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-b7e9-9b6916f8306e
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-b48a-7e8894e8b2c6
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-478d-879912ef5042
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-8117-acad885663ed
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-9f28-c708aac40bea
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-fa25-af845b52d1d5
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-f83d-462117638796
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-901b-62c4fa26e5c4
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-d356-c12dd75ba78a
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-b474-a6e3dde49403
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-32fd-7746f0419255
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-bb84-f40a2315dff7
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-9d9e-26f14fe009da
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-6b8e-6e6bc29dc107
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-3b19-e40def83bab4
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-7f1a-563d00bb65c6
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-294f-07ef227629c4
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-f9fd-7debcc10f0e7
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-13c3-b2a9b8e02a21
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-6862-e4cef36c7243
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-ab2f-e5cb08ff22e9
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-28cd-961fa4e5c4cb
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-cb43-f1241d051f2d
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-1be8-ac373bed16a2
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-92fc-1303095e211a
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-903d-e24bb8538e0e
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-5858-a054222e7741
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-168e-a4b77a01832d
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-8c37-ab91e834f73d
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-2dfb-cbbd80134f25
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-2845-4e3cd976c66a
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-f95c-eddaadb05e68
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-632a-9cec859d379f
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-f610-30d917503349
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-5dbb-7c5f45c74fbf
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-2399-aace83b039a9
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-f631-2ddf9e7c1939
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-4e4c-41fea610ce00
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-f468-5ad9c7517011
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-8a0b-1d2e19a7dcec
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-9cc8-13bc58fb9398
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-120a-2057859cac70
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-0cc2-f2863cdb4dcf
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-69ca-a4d514062c7c
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-6271-7fbaf7313732
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-0202-1d70b5fdfc00
00020000-5591-214e-d0ee-8b207fb789ab	00030000-5591-214c-5216-61cf3d32c4f8
\.


--
-- TOC entry 2875 (class 0 OID 8416837)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8416868)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8417000)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5591-214e-8564-897485a50cee	00090000-5591-214e-fb49-2719f1413bce	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2852 (class 0 OID 8416602)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5591-214e-3308-770b82b64e69	00040000-5591-214c-6f20-1a928b5bce4a	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5591-214e-691d-0ab47a350470	00040000-5591-214c-6f20-1a928b5bce4a	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5591-214e-5b37-46cd5101cb60	00040000-5591-214c-6f20-1a928b5bce4a	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5591-214e-6cd4-cb18966b337a	00040000-5591-214c-6f20-1a928b5bce4a	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5591-214e-81c3-d663ccc4ea1e	00040000-5591-214c-6f20-1a928b5bce4a	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5591-214e-5536-b2b98e411bca	00040000-5591-214c-a792-9ea87ee4fa8d	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2854 (class 0 OID 8416637)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5591-214d-84c7-4fce09fa3ed8	8341	Adlešiči
00050000-5591-214d-8a6c-77c9069bd08a	5270	Ajdovščina
00050000-5591-214d-60d7-3671f1c701d1	6280	Ankaran/Ancarano
00050000-5591-214d-f474-7bc2388399c3	9253	Apače
00050000-5591-214d-4db5-e002f3f7fe6a	8253	Artiče
00050000-5591-214d-12ba-f450251ec4a6	4275	Begunje na Gorenjskem
00050000-5591-214d-a665-e1d02e9b9b77	1382	Begunje pri Cerknici
00050000-5591-214d-c577-df81224e0e87	9231	Beltinci
00050000-5591-214d-1d62-6009098694ea	2234	Benedikt
00050000-5591-214d-5775-2d749cd927cf	2345	Bistrica ob Dravi
00050000-5591-214d-3c3c-71fb6e9a7a3d	3256	Bistrica ob Sotli
00050000-5591-214d-f4b9-dc687a043542	8259	Bizeljsko
00050000-5591-214d-c843-1076eb7a37d6	1223	Blagovica
00050000-5591-214d-7b6a-34b4e44773c8	8283	Blanca
00050000-5591-214d-cb02-75a605081890	4260	Bled
00050000-5591-214d-c897-a0d2279afa8a	4273	Blejska Dobrava
00050000-5591-214d-d3bc-8aa9b43c6f61	9265	Bodonci
00050000-5591-214d-5d31-6e5725a0c783	9222	Bogojina
00050000-5591-214d-7164-9689b2af4d32	4263	Bohinjska Bela
00050000-5591-214d-6702-b3695fe32757	4264	Bohinjska Bistrica
00050000-5591-214d-50b3-37589f4db4f5	4265	Bohinjsko jezero
00050000-5591-214d-0945-c0140d8351b2	1353	Borovnica
00050000-5591-214d-06cd-339b3e8a014b	8294	Boštanj
00050000-5591-214d-d266-c7959c854936	5230	Bovec
00050000-5591-214d-4834-6b8f14887d49	5295	Branik
00050000-5591-214d-7cd9-2cafa1de0526	3314	Braslovče
00050000-5591-214d-c39a-c52d6609c758	5223	Breginj
00050000-5591-214d-f357-9f09e68b6d6a	8280	Brestanica
00050000-5591-214d-64cf-84a58375abed	2354	Bresternica
00050000-5591-214d-0492-acaf48abad0f	4243	Brezje
00050000-5591-214d-34f9-a26d93568e7e	1351	Brezovica pri Ljubljani
00050000-5591-214d-670a-38426159102c	8250	Brežice
00050000-5591-214d-6501-943ab5a1ea1c	4210	Brnik - Aerodrom
00050000-5591-214d-089f-14807f468628	8321	Brusnice
00050000-5591-214d-a6a6-453aabce5192	3255	Buče
00050000-5591-214d-c43f-720ccc5cfa3f	8276	Bučka 
00050000-5591-214d-3b3f-4464ab001456	9261	Cankova
00050000-5591-214d-340f-474ebfa3476e	3000	Celje 
00050000-5591-214d-43a5-9e87b5ebdd61	3001	Celje - poštni predali
00050000-5591-214d-c2de-1e4c6a36ddb3	4207	Cerklje na Gorenjskem
00050000-5591-214d-24c5-a09b88d21137	8263	Cerklje ob Krki
00050000-5591-214d-6d88-30a2666defc6	1380	Cerknica
00050000-5591-214d-31d4-6f56c81b6d5c	5282	Cerkno
00050000-5591-214d-36f3-bfc27745c280	2236	Cerkvenjak
00050000-5591-214d-9054-e574d1212405	2215	Ceršak
00050000-5591-214d-89e1-760be9b5232a	2326	Cirkovce
00050000-5591-214d-0c36-ca3fa99bd5bc	2282	Cirkulane
00050000-5591-214d-60b0-96fcbc29ceb4	5273	Col
00050000-5591-214d-2145-a44876faf3c9	8251	Čatež ob Savi
00050000-5591-214d-ed28-a48ff923c634	1413	Čemšenik
00050000-5591-214d-6f3d-6a340950387e	5253	Čepovan
00050000-5591-214d-6d91-89d8457f00c3	9232	Črenšovci
00050000-5591-214d-19f6-8f87cc67f32d	2393	Črna na Koroškem
00050000-5591-214d-d842-bf3dc7cd36d7	6275	Črni Kal
00050000-5591-214d-7586-f638373cadeb	5274	Črni Vrh nad Idrijo
00050000-5591-214d-5bb3-55c6f2c56b93	5262	Črniče
00050000-5591-214d-c62d-ff5fd3bf8af9	8340	Črnomelj
00050000-5591-214d-1626-2d2a55501ed6	6271	Dekani
00050000-5591-214d-9247-e508cb364b1e	5210	Deskle
00050000-5591-214d-823c-c363b2a9014c	2253	Destrnik
00050000-5591-214d-4b09-3d43cd38826c	6215	Divača
00050000-5591-214d-e353-1222ceccebf8	1233	Dob
00050000-5591-214d-0c08-a6824246db9f	3224	Dobje pri Planini
00050000-5591-214d-a614-b70d77218a7e	8257	Dobova
00050000-5591-214d-84f8-f705cb6305fd	1423	Dobovec
00050000-5591-214d-420d-f4b380fc0a86	5263	Dobravlje
00050000-5591-214d-583a-0a665b6614a5	3204	Dobrna
00050000-5591-214d-e121-1dd00d6c94a6	8211	Dobrnič
00050000-5591-214d-897f-6702f5688da6	1356	Dobrova
00050000-5591-214d-0e44-43b3b6c66f96	9223	Dobrovnik/Dobronak 
00050000-5591-214d-c409-26ead4fcf74c	5212	Dobrovo v Brdih
00050000-5591-214d-f5ab-a4f82b74b28f	1431	Dol pri Hrastniku
00050000-5591-214d-400c-82693000cc31	1262	Dol pri Ljubljani
00050000-5591-214d-bbe1-ccdfe1adf3ad	1273	Dole pri Litiji
00050000-5591-214d-8874-beda19782010	1331	Dolenja vas
00050000-5591-214d-3b3a-fe83434fa97e	8350	Dolenjske Toplice
00050000-5591-214d-04e1-0f1821f118ed	1230	Domžale
00050000-5591-214d-22be-c6fba7b56cd0	2252	Dornava
00050000-5591-214d-c67b-50b9e461ddeb	5294	Dornberk
00050000-5591-214d-fbcf-19b4c899f2cb	1319	Draga
00050000-5591-214d-8511-2698af771543	8343	Dragatuš
00050000-5591-214d-cd33-758ba23334c7	3222	Dramlje
00050000-5591-214d-8bcc-968ded79185c	2370	Dravograd
00050000-5591-214d-17a8-7ac975d775f2	4203	Duplje
00050000-5591-214d-f8ee-d86fc748bf84	6221	Dutovlje
00050000-5591-214d-d8df-331e34d1a75a	8361	Dvor
00050000-5591-214d-de9d-8660437e745b	2343	Fala
00050000-5591-214d-6331-90f29fcb6cf4	9208	Fokovci
00050000-5591-214d-8409-496a72fa701d	2313	Fram
00050000-5591-214d-8d03-065995dd395c	3213	Frankolovo
00050000-5591-214d-39b0-8c06e8d84370	1274	Gabrovka
00050000-5591-214d-8d3a-9dff718ff37d	8254	Globoko
00050000-5591-214d-3dab-b6abc8d158de	5275	Godovič
00050000-5591-214d-8cd2-a7827f897222	4204	Golnik
00050000-5591-214d-2260-1cec75d9706d	3303	Gomilsko
00050000-5591-214d-14a8-901f9237a6bc	4224	Gorenja vas
00050000-5591-214d-2383-ab613ac2b311	3263	Gorica pri Slivnici
00050000-5591-214d-85be-6325591c6e69	2272	Gorišnica
00050000-5591-214d-69fb-0404508a3f3b	9250	Gornja Radgona
00050000-5591-214d-7f5c-1e8473866e73	3342	Gornji Grad
00050000-5591-214d-c055-1d245508c914	4282	Gozd Martuljek
00050000-5591-214d-43b4-23b170a62a8a	6272	Gračišče
00050000-5591-214d-0983-5c460f2f9b83	9264	Grad
00050000-5591-214d-8e2c-e2b48716230a	8332	Gradac
00050000-5591-214d-8dd8-4845086a6a92	1384	Grahovo
00050000-5591-214d-b4c6-b5f66eb3ea81	5242	Grahovo ob Bači
00050000-5591-214d-5e6c-a047dfa8d7e3	5251	Grgar
00050000-5591-214d-5559-4de16130bab9	3302	Griže
00050000-5591-214d-91c9-dbb832f0b6d8	3231	Grobelno
00050000-5591-214d-ffbc-0c993f22ad4e	1290	Grosuplje
00050000-5591-214d-9f0d-2bfa054994ee	2288	Hajdina
00050000-5591-214d-e2b7-c8f45ea2714a	8362	Hinje
00050000-5591-214d-ebcb-c4ffe17747c3	2311	Hoče
00050000-5591-214d-91ec-5ce424596ebb	9205	Hodoš/Hodos
00050000-5591-214d-a057-9b94d741ef1d	1354	Horjul
00050000-5591-214d-b9d4-b3455389532c	1372	Hotedršica
00050000-5591-214d-52e5-326d5b18739e	1430	Hrastnik
00050000-5591-214d-07d7-d24fffe448ac	6225	Hruševje
00050000-5591-214d-a52c-8fbbc7d35a31	4276	Hrušica
00050000-5591-214d-66df-91765d6dfc98	5280	Idrija
00050000-5591-214d-b80a-0d277fd6f528	1292	Ig
00050000-5591-214d-c9b2-e1a956a52b6e	6250	Ilirska Bistrica
00050000-5591-214d-c359-ba035ba2a7e1	6251	Ilirska Bistrica-Trnovo
00050000-5591-214d-b413-f4427a19360c	1295	Ivančna Gorica
00050000-5591-214d-0fa9-211cf33068d0	2259	Ivanjkovci
00050000-5591-214d-d8f0-f759c11caefb	1411	Izlake
00050000-5591-214d-a4b6-eff6adb2c243	6310	Izola/Isola
00050000-5591-214d-c678-6d4ab4f2a575	2222	Jakobski Dol
00050000-5591-214d-29ac-6fc73282536b	2221	Jarenina
00050000-5591-214d-dff4-a6b13e4b56f9	6254	Jelšane
00050000-5591-214d-6bce-5024e375a186	4270	Jesenice
00050000-5591-214d-7ae6-13d888a8786f	8261	Jesenice na Dolenjskem
00050000-5591-214d-52a4-b50b92d3a130	3273	Jurklošter
00050000-5591-214d-6913-018a4f7e86e8	2223	Jurovski Dol
00050000-5591-214d-aaa3-4a8f871fba3d	2256	Juršinci
00050000-5591-214d-f2e7-6d2cd68f013a	5214	Kal nad Kanalom
00050000-5591-214d-1f31-24eecefd6385	3233	Kalobje
00050000-5591-214d-16a5-c5a378727c5b	4246	Kamna Gorica
00050000-5591-214d-1bc2-1661c8d2ff56	2351	Kamnica
00050000-5591-214d-fe56-82312bad65c8	1241	Kamnik
00050000-5591-214d-1e4d-905ab79ece73	5213	Kanal
00050000-5591-214d-f871-280befc5e886	8258	Kapele
00050000-5591-214d-d37f-a39f6637cbee	2362	Kapla
00050000-5591-214d-5ad9-8f9199b48d2d	2325	Kidričevo
00050000-5591-214d-2d22-84d5210a017f	1412	Kisovec
00050000-5591-214d-ca85-1b09f787b3e4	6253	Knežak
00050000-5591-214d-1284-bb1ffeb1ec2d	5222	Kobarid
00050000-5591-214d-e987-326836348b61	9227	Kobilje
00050000-5591-214d-090b-7e2c644f856d	1330	Kočevje
00050000-5591-214d-db42-7ca9fe6b2bc5	1338	Kočevska Reka
00050000-5591-214d-98db-28b7c056cddc	2276	Kog
00050000-5591-214d-b62b-ad248efd9c36	5211	Kojsko
00050000-5591-214d-4823-359f1de57792	6223	Komen
00050000-5591-214d-fba4-8b71fb50aa1e	1218	Komenda
00050000-5591-214d-a889-ffc574fe60fe	6000	Koper/Capodistria 
00050000-5591-214d-f6d6-ddfada2a9d5c	6001	Koper/Capodistria - poštni predali
00050000-5591-214d-fefa-0a6cb144c328	8282	Koprivnica
00050000-5591-214d-71d3-0294feec1865	5296	Kostanjevica na Krasu
00050000-5591-214d-86ac-6b7ebd50d360	8311	Kostanjevica na Krki
00050000-5591-214d-6c76-839e8d6d3e71	1336	Kostel
00050000-5591-214d-69f1-b4e0269af202	6256	Košana
00050000-5591-214d-8fad-ae3d337a82d8	2394	Kotlje
00050000-5591-214d-1644-22b9efa9e8a3	6240	Kozina
00050000-5591-214d-763d-d4aee3b2c7e4	3260	Kozje
00050000-5591-214d-7920-ab1726c69f2e	4000	Kranj 
00050000-5591-214d-f15c-4d1bada9f257	4001	Kranj - poštni predali
00050000-5591-214d-6ce3-161246c8c8e6	4280	Kranjska Gora
00050000-5591-214d-e657-b9f32297864f	1281	Kresnice
00050000-5591-214d-1ba3-2455074baefa	4294	Križe
00050000-5591-214d-7be1-6e01b1d40592	9206	Križevci
00050000-5591-214d-0b7b-3982ffe58adc	9242	Križevci pri Ljutomeru
00050000-5591-214d-5a12-d2d0077b3c8c	1301	Krka
00050000-5591-214d-e91d-8850937a8f05	8296	Krmelj
00050000-5591-214d-193c-87191df7361b	4245	Kropa
00050000-5591-214d-df78-606e3d26bf29	8262	Krška vas
00050000-5591-214d-3232-beeb6ef1501b	8270	Krško
00050000-5591-214d-f5b0-a14a96d1e750	9263	Kuzma
00050000-5591-214d-b61c-b7111df7bc8f	2318	Laporje
00050000-5591-214d-262a-05c78ebf6e67	3270	Laško
00050000-5591-214d-c297-1655103b143e	1219	Laze v Tuhinju
00050000-5591-214d-60a1-df97788a322b	2230	Lenart v Slovenskih goricah
00050000-5591-214d-c57f-c067dff1d156	9220	Lendava/Lendva
00050000-5591-214d-eb85-2ebe42b8a98d	4248	Lesce
00050000-5591-214d-dd7e-43b2a4e3e2be	3261	Lesično
00050000-5591-214d-c185-99293cd5f004	8273	Leskovec pri Krškem
00050000-5591-214d-905c-b5808a5ad78b	2372	Libeliče
00050000-5591-214d-9240-459d2fde2de0	2341	Limbuš
00050000-5591-214d-0518-416e2ff73ab7	1270	Litija
00050000-5591-214d-941c-4a03ffa96dd8	3202	Ljubečna
00050000-5591-214d-00e2-b1e66252732d	1000	Ljubljana 
00050000-5591-214d-9ba7-cedc2f593171	1001	Ljubljana - poštni predali
00050000-5591-214d-db0b-4b61b3564733	1231	Ljubljana - Črnuče
00050000-5591-214d-ba58-eba048ead6c6	1261	Ljubljana - Dobrunje
00050000-5591-214d-4383-ff99e4dbc662	1260	Ljubljana - Polje
00050000-5591-214d-45f7-de2de863447b	1210	Ljubljana - Šentvid
00050000-5591-214d-8115-09469659a4f5	1211	Ljubljana - Šmartno
00050000-5591-214d-4d9d-8a19a336cd79	3333	Ljubno ob Savinji
00050000-5591-214d-0729-92825c4a6b4f	9240	Ljutomer
00050000-5591-214d-3607-a84769d99b1c	3215	Loče
00050000-5591-214d-c5a1-a57a1deff9cb	5231	Log pod Mangartom
00050000-5591-214d-cdf8-f0d1f6f4dd3b	1358	Log pri Brezovici
00050000-5591-214d-87a4-887617374998	1370	Logatec
00050000-5591-214d-2e06-105cc505573a	1371	Logatec
00050000-5591-214d-5313-f59829f5d8eb	1434	Loka pri Zidanem Mostu
00050000-5591-214d-43fd-242b434c2460	3223	Loka pri Žusmu
00050000-5591-214d-528e-6a9b7b3a09c4	6219	Lokev
00050000-5591-214d-ea47-bbe0fbfcea95	1318	Loški Potok
00050000-5591-214d-64d3-0172520dc114	2324	Lovrenc na Dravskem polju
00050000-5591-214d-38ba-90eb3c9eb708	2344	Lovrenc na Pohorju
00050000-5591-214d-dbd7-38f05931b76c	3334	Luče
00050000-5591-214d-f0ad-e49986e6ff16	1225	Lukovica
00050000-5591-214d-5989-40ac3406ea5f	9202	Mačkovci
00050000-5591-214d-a6fe-fd3f1cf0b372	2322	Majšperk
00050000-5591-214d-0b5d-b8c0e7494814	2321	Makole
00050000-5591-214d-7adc-ed19f3cb8df4	9243	Mala Nedelja
00050000-5591-214d-8e9a-400091513e2f	2229	Malečnik
00050000-5591-214d-8346-829bb7a5420e	6273	Marezige
00050000-5591-214d-ec7a-e4f90a3d44ca	2000	Maribor 
00050000-5591-214d-70cf-0a3cd639d090	2001	Maribor - poštni predali
00050000-5591-214d-4806-6b1cbe0759f3	2206	Marjeta na Dravskem polju
00050000-5591-214d-16f7-2d81953e2564	2281	Markovci
00050000-5591-214d-4a11-be82c7510839	9221	Martjanci
00050000-5591-214d-b0b4-9ad568bddb0b	6242	Materija
00050000-5591-214d-cd18-91c2f04139db	4211	Mavčiče
00050000-5591-214d-7af7-ecd676705919	1215	Medvode
00050000-5591-214d-c74a-daea3b6e4a0f	1234	Mengeš
00050000-5591-214d-da25-ce5bae5eb719	8330	Metlika
00050000-5591-214d-2f6b-fc1980c2221f	2392	Mežica
00050000-5591-214d-ba92-06c7a3cb10b3	2204	Miklavž na Dravskem polju
00050000-5591-214d-902e-7f21ff3b0655	2275	Miklavž pri Ormožu
00050000-5591-214d-ded4-092623bb62c5	5291	Miren
00050000-5591-214d-fd7d-8222378f432f	8233	Mirna
00050000-5591-214d-6bfd-371da4a842a1	8216	Mirna Peč
00050000-5591-214d-9572-6d7e4df9dbb6	2382	Mislinja
00050000-5591-214d-d310-3d2aa3a7e929	4281	Mojstrana
00050000-5591-214d-0f99-f60702a529fc	8230	Mokronog
00050000-5591-214d-1118-8423258efe08	1251	Moravče
00050000-5591-214d-a0c5-121364351573	9226	Moravske Toplice
00050000-5591-214d-8e88-aec438bb5d90	5216	Most na Soči
00050000-5591-214d-90b3-f25bd9c3b5a1	1221	Motnik
00050000-5591-214d-f4bd-a83bacfe7039	3330	Mozirje
00050000-5591-214d-e4b6-cf78d9354d76	9000	Murska Sobota 
00050000-5591-214d-ca7f-3da6799ca572	9001	Murska Sobota - poštni predali
00050000-5591-214d-9c4a-2318eca80455	2366	Muta
00050000-5591-214d-7517-0fc68faa9373	4202	Naklo
00050000-5591-214d-de33-896fba468453	3331	Nazarje
00050000-5591-214d-6219-9772e53bf89d	1357	Notranje Gorice
00050000-5591-214d-2e77-826857369547	3203	Nova Cerkev
00050000-5591-214d-d64b-584e987021fc	5000	Nova Gorica 
00050000-5591-214d-644d-1c3743f6d656	5001	Nova Gorica - poštni predali
00050000-5591-214d-be5e-c749890ebf89	1385	Nova vas
00050000-5591-214d-45d2-03656b912f2e	8000	Novo mesto
00050000-5591-214d-f574-f6c2a12500c7	8001	Novo mesto - poštni predali
00050000-5591-214d-2716-3c78c5cef00e	6243	Obrov
00050000-5591-214d-4252-fb90fa41620a	9233	Odranci
00050000-5591-214d-8165-a420ab113cee	2317	Oplotnica
00050000-5591-214d-a3d7-c0a173b3456a	2312	Orehova vas
00050000-5591-214d-6397-c389dc385a15	2270	Ormož
00050000-5591-214d-2c50-183e259986c8	1316	Ortnek
00050000-5591-214d-84fc-255a1630069f	1337	Osilnica
00050000-5591-214d-a2f5-bdb22fb80110	8222	Otočec
00050000-5591-214d-2c25-fe75a85e1e62	2361	Ožbalt
00050000-5591-214d-f0d0-ca59a6355d3b	2231	Pernica
00050000-5591-214d-8fc2-c23909bf6b47	2211	Pesnica pri Mariboru
00050000-5591-214d-1c52-ea93babe1336	9203	Petrovci
00050000-5591-214d-4cbb-36ba803d10af	3301	Petrovče
00050000-5591-214d-3c3c-80befe258e23	6330	Piran/Pirano
00050000-5591-214d-e475-992c7a4319bc	8255	Pišece
00050000-5591-214d-ba51-0e02247ee7de	6257	Pivka
00050000-5591-214d-8e51-69a69bc1605a	6232	Planina
00050000-5591-214d-0cfd-dfb109512faa	3225	Planina pri Sevnici
00050000-5591-214d-fe6c-a719ddcfc0b7	6276	Pobegi
00050000-5591-214d-bfa5-32cac27d321c	8312	Podbočje
00050000-5591-214d-ba61-7c8ed3b842df	5243	Podbrdo
00050000-5591-214d-a21a-b119551a91f9	3254	Podčetrtek
00050000-5591-214d-ee83-f0b3541fccda	2273	Podgorci
00050000-5591-214d-bc6f-4dd587017907	6216	Podgorje
00050000-5591-214d-0316-3602ff6e3069	2381	Podgorje pri Slovenj Gradcu
00050000-5591-214d-003e-b3135b9383c3	6244	Podgrad
00050000-5591-214d-79cb-57efca0ca416	1414	Podkum
00050000-5591-214d-0a33-e7da279e3022	2286	Podlehnik
00050000-5591-214d-896f-61a247527783	5272	Podnanos
00050000-5591-214d-0f36-2869bac7583f	4244	Podnart
00050000-5591-214d-88f3-c865e5b23d9a	3241	Podplat
00050000-5591-214d-48a0-9905a15ca34f	3257	Podsreda
00050000-5591-214d-e6e9-69f2f1ac5363	2363	Podvelka
00050000-5591-214d-e74a-902699b3c9fa	2208	Pohorje
00050000-5591-214d-94be-ec2c9b250c16	2257	Polenšak
00050000-5591-214d-d6c3-654ae2c6bf2c	1355	Polhov Gradec
00050000-5591-214d-f109-ec45ed707d51	4223	Poljane nad Škofjo Loko
00050000-5591-214d-be33-3a77254c9722	2319	Poljčane
00050000-5591-214d-a97e-533635bde9c2	1272	Polšnik
00050000-5591-214d-c757-594d05438643	3313	Polzela
00050000-5591-214d-3b8d-2c5fb36adce7	3232	Ponikva
00050000-5591-214d-98e7-df987423e13e	6320	Portorož/Portorose
00050000-5591-214d-aa83-050f4cde25a6	6230	Postojna
00050000-5591-214d-f243-76e63d967980	2331	Pragersko
00050000-5591-214d-e87e-344b199a59b3	3312	Prebold
00050000-5591-214d-ffea-bbe29af1b2dc	4205	Preddvor
00050000-5591-214d-9ba7-509cd5d5dd4d	6255	Prem
00050000-5591-214d-e986-8d2d20649777	1352	Preserje
00050000-5591-214d-89c6-96d2924bb5fd	6258	Prestranek
00050000-5591-214d-35e3-5a21e2aa8009	2391	Prevalje
00050000-5591-214d-741f-624598a4aa02	3262	Prevorje
00050000-5591-214d-9329-22f859b035ab	1276	Primskovo 
00050000-5591-214d-a10d-6792f9d3af23	3253	Pristava pri Mestinju
00050000-5591-214d-d00b-85aa220c60cd	9207	Prosenjakovci/Partosfalva
00050000-5591-214d-3607-299de436adfa	5297	Prvačina
00050000-5591-214d-9dce-45c774909ba6	2250	Ptuj
00050000-5591-214d-1f42-df6e0b6f03e0	2323	Ptujska Gora
00050000-5591-214d-ab1f-9ac17f2f9a1d	9201	Puconci
00050000-5591-214d-9265-71997b3ab92f	2327	Rače
00050000-5591-214d-2a16-aa604dfc266a	1433	Radeče
00050000-5591-214d-50f8-96ff0f0fec98	9252	Radenci
00050000-5591-214d-8485-e9f37459761f	2360	Radlje ob Dravi
00050000-5591-214d-4563-e24bc0924f31	1235	Radomlje
00050000-5591-214d-aa42-470bc80d3cbb	4240	Radovljica
00050000-5591-214d-965d-3be33df7865c	8274	Raka
00050000-5591-214d-0d49-0e170c37a563	1381	Rakek
00050000-5591-214d-a331-02be36d1f40a	4283	Rateče - Planica
00050000-5591-214d-1ad5-3b7a08c56f9d	2390	Ravne na Koroškem
00050000-5591-214d-c8fa-4d9cb673ef2b	9246	Razkrižje
00050000-5591-214d-6eaa-85bcc5b7bb16	3332	Rečica ob Savinji
00050000-5591-214d-5d2a-3a44ee99e940	5292	Renče
00050000-5591-214d-fce7-8e8c5cb22822	1310	Ribnica
00050000-5591-214d-a416-ac625513d3b4	2364	Ribnica na Pohorju
00050000-5591-214d-a4eb-1a47cb9fd976	3272	Rimske Toplice
00050000-5591-214d-f379-d82f1d1d1e1a	1314	Rob
00050000-5591-214d-b117-a9a56349d376	5215	Ročinj
00050000-5591-214d-42e5-f1b1f80867dd	3250	Rogaška Slatina
00050000-5591-214d-8aab-bdd3bac01975	9262	Rogašovci
00050000-5591-214d-ff70-890be95ecf4c	3252	Rogatec
00050000-5591-214d-3dab-39775a607147	1373	Rovte
00050000-5591-214d-3e07-b4c5bb093c11	2342	Ruše
00050000-5591-214d-8990-fa7fbb10a65a	1282	Sava
00050000-5591-214d-a907-96e8ade41be2	6333	Sečovlje/Sicciole
00050000-5591-214d-19b7-4e54711afda6	4227	Selca
00050000-5591-214d-24dd-dc7232253584	2352	Selnica ob Dravi
00050000-5591-214d-ca55-e787e552b63c	8333	Semič
00050000-5591-214d-61ed-304e8bbfe027	8281	Senovo
00050000-5591-214d-a04e-a4c5b0d8d4f3	6224	Senožeče
00050000-5591-214d-456b-b8b4afcf0118	8290	Sevnica
00050000-5591-214d-dcb4-25d48b4454a1	6210	Sežana
00050000-5591-214d-b617-4d809bc7a824	2214	Sladki Vrh
00050000-5591-214d-4e33-e2f625c323e8	5283	Slap ob Idrijci
00050000-5591-214d-6790-15a035d662ba	2380	Slovenj Gradec
00050000-5591-214d-1fc9-c40d5773f1db	2310	Slovenska Bistrica
00050000-5591-214d-0443-16fb3bd19718	3210	Slovenske Konjice
00050000-5591-214d-0211-b2b6d6fe4d10	1216	Smlednik
00050000-5591-214d-805f-b4848636c0a2	5232	Soča
00050000-5591-214d-d2bd-3fc0030b2197	1317	Sodražica
00050000-5591-214d-6d9d-cd6c7349f85f	3335	Solčava
00050000-5591-214d-112a-7e7b2df84a39	5250	Solkan
00050000-5591-214d-3c75-7ea4895ce456	4229	Sorica
00050000-5591-214d-8df9-910fc360a9a5	4225	Sovodenj
00050000-5591-214d-21b4-bbbae04c528b	5281	Spodnja Idrija
00050000-5591-214d-7028-2cbaaa6bf542	2241	Spodnji Duplek
00050000-5591-214d-397c-e91239cfd134	9245	Spodnji Ivanjci
00050000-5591-214d-4c17-dfc487bcf278	2277	Središče ob Dravi
00050000-5591-214d-822c-3dc86546e00f	4267	Srednja vas v Bohinju
00050000-5591-214d-b06c-64b5b4757ac2	8256	Sromlje 
00050000-5591-214d-4c7d-1b96df82d1e4	5224	Srpenica
00050000-5591-214d-8069-68b5a4944c5a	1242	Stahovica
00050000-5591-214d-2c21-401657459f9d	1332	Stara Cerkev
00050000-5591-214d-e39f-56e8ab8489a6	8342	Stari trg ob Kolpi
00050000-5591-214d-da1e-2cd782a4fbc4	1386	Stari trg pri Ložu
00050000-5591-214d-13b5-743f64b62283	2205	Starše
00050000-5591-214d-715b-aaedf214a278	2289	Stoperce
00050000-5591-214d-425c-6e93be741828	8322	Stopiče
00050000-5591-214d-5361-bb2ff01c9671	3206	Stranice
00050000-5591-214d-f614-8935a0154e74	8351	Straža
00050000-5591-214d-2d8c-870645cdb9c6	1313	Struge
00050000-5591-214d-d0fc-ecd607c3bf48	8293	Studenec
00050000-5591-214d-d0f1-7227d33f2c07	8331	Suhor
00050000-5591-214d-702a-9038562dd7fc	2233	Sv. Ana v Slovenskih goricah
00050000-5591-214d-cc41-6cee5bcc8dc2	2235	Sv. Trojica v Slovenskih goricah
00050000-5591-214d-10b6-6ff74d4482a4	2353	Sveti Duh na Ostrem Vrhu
00050000-5591-214d-e38f-1ca3948675e3	9244	Sveti Jurij ob Ščavnici
00050000-5591-214d-3970-403cdecb8bce	3264	Sveti Štefan
00050000-5591-214d-727d-bc796a51e852	2258	Sveti Tomaž
00050000-5591-214d-8608-18a50576223e	9204	Šalovci
00050000-5591-214d-afb5-cfe811e83993	5261	Šempas
00050000-5591-214d-e98d-7891aa8f2fdf	5290	Šempeter pri Gorici
00050000-5591-214d-9894-aa5bb8b5b4ab	3311	Šempeter v Savinjski dolini
00050000-5591-214d-18c1-cd681b938aaa	4208	Šenčur
00050000-5591-214d-5c5a-cef4d1f1533c	2212	Šentilj v Slovenskih goricah
00050000-5591-214d-e1f6-420b86c4cbf5	8297	Šentjanž
00050000-5591-214d-8756-4a12447afac9	2373	Šentjanž pri Dravogradu
00050000-5591-214d-06cb-561497c3aea5	8310	Šentjernej
00050000-5591-214d-90a8-39abe25d700e	3230	Šentjur
00050000-5591-214d-577e-5d61beb713ed	3271	Šentrupert
00050000-5591-214d-d8e0-dde009ad10ef	8232	Šentrupert
00050000-5591-214d-4ee8-f082c4dae135	1296	Šentvid pri Stični
00050000-5591-214d-4ad0-a8978adc2c81	8275	Škocjan
00050000-5591-214d-8228-04ca46f84be9	6281	Škofije
00050000-5591-214d-28d1-2575875d6a03	4220	Škofja Loka
00050000-5591-214d-e2bc-15d81af944c3	3211	Škofja vas
00050000-5591-214d-4b5e-8f20ec86517c	1291	Škofljica
00050000-5591-214d-3518-723146192400	6274	Šmarje
00050000-5591-214d-ea7e-f077d83e95a9	1293	Šmarje - Sap
00050000-5591-214d-1458-d313041cc61f	3240	Šmarje pri Jelšah
00050000-5591-214d-c252-fac282ffb30b	8220	Šmarješke Toplice
00050000-5591-214d-df67-88c66bffee6d	2315	Šmartno na Pohorju
00050000-5591-214d-74fd-13ff87f03a68	3341	Šmartno ob Dreti
00050000-5591-214d-a740-90e3ab50f500	3327	Šmartno ob Paki
00050000-5591-214d-ae96-c56b9815e63b	1275	Šmartno pri Litiji
00050000-5591-214d-b199-3acc2a019cbf	2383	Šmartno pri Slovenj Gradcu
00050000-5591-214d-56e2-5465004cdd44	3201	Šmartno v Rožni dolini
00050000-5591-214d-a47d-154d5a6bcc26	3325	Šoštanj
00050000-5591-214d-fe37-2a6494d7e7e1	6222	Štanjel
00050000-5591-214d-7cb9-c8fe8d4c81c2	3220	Štore
00050000-5591-214d-d90f-6dc5c88751fe	3304	Tabor
00050000-5591-214d-7104-caa78fe12540	3221	Teharje
00050000-5591-214d-9eb6-f2247f0a7fa2	9251	Tišina
00050000-5591-214d-86c4-4d42c8eff4c2	5220	Tolmin
00050000-5591-214d-4263-b8b9800029e2	3326	Topolšica
00050000-5591-214d-3463-8472c467dcab	2371	Trbonje
00050000-5591-214d-cd7b-9b3c88138607	1420	Trbovlje
00050000-5591-214d-6787-8c3a34669845	8231	Trebelno 
00050000-5591-214d-24d5-2e1ddcdc1467	8210	Trebnje
00050000-5591-214d-231f-92d499604308	5252	Trnovo pri Gorici
00050000-5591-214d-7a7b-9cc81f2b5334	2254	Trnovska vas
00050000-5591-214d-55bf-5b4cf4c5ca67	1222	Trojane
00050000-5591-214d-9aec-d755a7bdf599	1236	Trzin
00050000-5591-214d-fc51-db38dd1a9bac	4290	Tržič
00050000-5591-214d-5829-5df01bc7d5ff	8295	Tržišče
00050000-5591-214d-8893-dfed0d941f50	1311	Turjak
00050000-5591-214d-0075-8d305b756fab	9224	Turnišče
00050000-5591-214d-1fc0-9b7da082397d	8323	Uršna sela
00050000-5591-214d-d91c-43a283622b97	1252	Vače
00050000-5591-214d-7846-eeb1c146ac42	3320	Velenje 
00050000-5591-214d-5303-578bbdd25d3e	3322	Velenje - poštni predali
00050000-5591-214d-57d5-a714bbcb0e38	8212	Velika Loka
00050000-5591-214d-be4d-9d467720ec65	2274	Velika Nedelja
00050000-5591-214d-ccaf-9c4692bec317	9225	Velika Polana
00050000-5591-214d-b1ca-9e7de5d140a0	1315	Velike Lašče
00050000-5591-214d-938d-e6543c61a8fe	8213	Veliki Gaber
00050000-5591-214d-8f79-5f1f952640c0	9241	Veržej
00050000-5591-214d-6497-4290603c5c94	1312	Videm - Dobrepolje
00050000-5591-214d-a041-b2874fc55545	2284	Videm pri Ptuju
00050000-5591-214d-3074-206841744684	8344	Vinica
00050000-5591-214d-2dea-b958d381c55d	5271	Vipava
00050000-5591-214d-b0f6-2e1cff65fcce	4212	Visoko
00050000-5591-214d-1a66-b06c3c409373	1294	Višnja Gora
00050000-5591-214d-2d8b-115ba3757961	3205	Vitanje
00050000-5591-214d-9464-e39d2b5be50f	2255	Vitomarci
00050000-5591-214d-a53d-88c518309131	1217	Vodice
00050000-5591-214d-3b42-e8dbce9706f9	3212	Vojnik\t
00050000-5591-214d-a932-9fd3a2dc4c33	5293	Volčja Draga
00050000-5591-214d-c382-b3e491ed34ef	2232	Voličina
00050000-5591-214d-c0f5-446034cdc508	3305	Vransko
00050000-5591-214d-88cd-00d6418fb205	6217	Vremski Britof
00050000-5591-214d-c2ce-4ee2beaf4a2f	1360	Vrhnika
00050000-5591-214d-1d80-dcc56ef665b6	2365	Vuhred
00050000-5591-214d-f4ae-0ae802208d9c	2367	Vuzenica
00050000-5591-214d-398c-dc0de82c2351	8292	Zabukovje 
00050000-5591-214d-dd7b-73a1fa87c6f2	1410	Zagorje ob Savi
00050000-5591-214d-90ae-f24e1b388abe	1303	Zagradec
00050000-5591-214d-bd00-1f02cb5d1fcd	2283	Zavrč
00050000-5591-214d-0fda-b4b6cb628ae3	8272	Zdole 
00050000-5591-214d-0cd7-5ee24c179cbc	4201	Zgornja Besnica
00050000-5591-214d-91fd-0e1b2c881524	2242	Zgornja Korena
00050000-5591-214d-e756-99fb88baa2fa	2201	Zgornja Kungota
00050000-5591-214d-92d0-50e32613254d	2316	Zgornja Ložnica
00050000-5591-214d-69fe-395d1b6ac1b0	2314	Zgornja Polskava
00050000-5591-214d-594c-3dc55d0882d1	2213	Zgornja Velka
00050000-5591-214d-dc2f-55ff2eafdb06	4247	Zgornje Gorje
00050000-5591-214d-0c7d-9a038fcce388	4206	Zgornje Jezersko
00050000-5591-214d-abe0-12773a1891c3	2285	Zgornji Leskovec
00050000-5591-214d-9171-636247c3fec7	1432	Zidani Most
00050000-5591-214d-35cf-ae9fc71a9d39	3214	Zreče
00050000-5591-214d-a3b6-ba1e533bfe7d	4209	Žabnica
00050000-5591-214d-c1cb-e04485e4989d	3310	Žalec
00050000-5591-214d-2c44-5c5cd386e60b	4228	Železniki
00050000-5591-214d-94ea-af32e63afb30	2287	Žetale
00050000-5591-214d-e126-00804435e5d5	4226	Žiri
00050000-5591-214d-90cd-b0a0d0a9e6b1	4274	Žirovnica
00050000-5591-214d-87ba-4ae7b00ec1ea	8360	Žužemberk
\.


--
-- TOC entry 2871 (class 0 OID 8416811)
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
-- TOC entry 2853 (class 0 OID 8416622)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2859 (class 0 OID 8416700)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8416823)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2886 (class 0 OID 8416943)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8416992)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5591-214e-1f7b-2e285a0668ec	00080000-5591-214e-5536-b2b98e411bca	0900	AK
00190000-5591-214e-1b63-4543fe6ef9dc	00080000-5591-214e-5b37-46cd5101cb60	0987	A
00190000-5591-214e-a329-f1597be23890	00080000-5591-214e-691d-0ab47a350470	0989	A
\.


--
-- TOC entry 2897 (class 0 OID 8417126)
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
-- TOC entry 2877 (class 0 OID 8416852)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5591-214e-3d77-efd1a906343e	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5591-214e-ea1e-5a81e421ffdf	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5591-214e-10b3-b809809b7633	0003	Kazinska	t	84	Kazinska dvorana
00220000-5591-214e-a591-f1d5d6a33f76	0004	Mali oder	t	24	Mali oder 
00220000-5591-214e-d0a7-abb99d1eb69e	0005	Komorni oder	t	15	Komorni oder
00220000-5591-214e-f345-a9476dba9cc4	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5591-214e-a684-1ce77b9ab57f	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2869 (class 0 OID 8416796)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 8416786)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8416981)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 8416920)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 8416494)
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
-- TOC entry 2878 (class 0 OID 8416862)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 8416532)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5591-214c-b01e-0691f34536e3	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5591-214c-3850-087f829b4207	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5591-214c-6bd9-044b79677b92	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5591-214c-f56c-fee69b1c5c0c	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5591-214c-7548-77012ab7dad0	planer	Planer dogodkov v koledarju	t
00020000-5591-214c-e183-bff40e3e341e	kadrovska	Kadrovska služba	t
00020000-5591-214c-5f44-fc650f2cdba0	arhivar	Ažuriranje arhivalij	t
00020000-5591-214c-e791-3c636f017a06	igralec	Igralec	t
00020000-5591-214d-e3fb-9aa076012984	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5591-214e-d0ee-8b207fb789ab	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2844 (class 0 OID 8416516)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5591-214d-880c-c87b0190b46d	00020000-5591-214c-6bd9-044b79677b92
00010000-5591-214d-0529-311168c5ae88	00020000-5591-214c-6bd9-044b79677b92
00010000-5591-214e-0943-1a6d0e06a01c	00020000-5591-214e-d0ee-8b207fb789ab
\.


--
-- TOC entry 2880 (class 0 OID 8416876)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8416817)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 8416767)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 8417170)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5591-214d-edcc-d336cf80a794	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5591-214d-7a6f-61d8cc2d41ee	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5591-214d-a7bb-efa0f7ed9247	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5591-214d-03e2-52f6bc6e692e	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5591-214d-201a-8a6ceb1dd798	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2901 (class 0 OID 8417162)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5591-214d-fde9-bf3792e950af	00230000-5591-214d-03e2-52f6bc6e692e	popa
00240000-5591-214d-07fc-50243aa3f080	00230000-5591-214d-03e2-52f6bc6e692e	oseba
00240000-5591-214d-cfba-206d43994e0e	00230000-5591-214d-7a6f-61d8cc2d41ee	prostor
00240000-5591-214d-9077-ecd69505c863	00230000-5591-214d-03e2-52f6bc6e692e	besedilo
00240000-5591-214d-acdb-cee77c867f7a	00230000-5591-214d-03e2-52f6bc6e692e	uprizoritev
00240000-5591-214d-799f-8e9e28509129	00230000-5591-214d-03e2-52f6bc6e692e	funkcija
00240000-5591-214d-6f20-a4c8e744228f	00230000-5591-214d-03e2-52f6bc6e692e	tipfunkcije
00240000-5591-214d-ab04-4fe68481bc0d	00230000-5591-214d-03e2-52f6bc6e692e	alternacija
00240000-5591-214d-956d-1891a13637da	00230000-5591-214d-edcc-d336cf80a794	pogodba
00240000-5591-214d-75ca-ef7b375aebbc	00230000-5591-214d-03e2-52f6bc6e692e	zaposlitev
\.


--
-- TOC entry 2900 (class 0 OID 8417157)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8416930)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5591-214e-a091-38c63bd3e216	000e0000-5591-214e-ca6b-f741ab101b2c	00080000-5591-214e-3308-770b82b64e69	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5591-214e-5e13-976df90ae21f	000e0000-5591-214e-ca6b-f741ab101b2c	00080000-5591-214e-3308-770b82b64e69	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5591-214e-427d-9b92906faa30	000e0000-5591-214e-ca6b-f741ab101b2c	00080000-5591-214e-81c3-d663ccc4ea1e	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2851 (class 0 OID 8416594)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 8416773)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5591-214e-38a2-f06c633d4704	00180000-5591-214e-06ad-68f39cdeab3a	000c0000-5591-214e-c352-e48e849b0802	00090000-5591-214e-e20c-ee2e6f643847	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5591-214e-c651-256d83e3a048	00180000-5591-214e-06ad-68f39cdeab3a	000c0000-5591-214e-102f-2400525e4d14	00090000-5591-214e-0d5d-ed2ec3bfeec9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5591-214e-bd4f-d1198343345c	00180000-5591-214e-06ad-68f39cdeab3a	000c0000-5591-214e-967b-053f9d16c272	00090000-5591-214e-d3b7-6f17c886f328	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5591-214e-6964-eea275ddb28a	00180000-5591-214e-06ad-68f39cdeab3a	000c0000-5591-214e-0b37-5e0fa96036bb	00090000-5591-214e-6924-c375d3b9e2b6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5591-214e-b5f2-67261f62bbaf	00180000-5591-214e-06ad-68f39cdeab3a	000c0000-5591-214e-c446-1b06092822ec	00090000-5591-214e-f675-3fefb5883182	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5591-214e-e9b7-d1318d65ae2f	00180000-5591-214e-35b0-e8584c243b0a	\N	00090000-5591-214e-f675-3fefb5883182	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2888 (class 0 OID 8416970)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5591-214d-0d6f-f0017a770ffa	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5591-214d-c6e9-c8f5275d79f5	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5591-214d-94d2-265239897c62	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5591-214d-8365-dd9d1647c53e	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5591-214d-4ccb-f466d367145e	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5591-214d-f976-9d3ba3c5226c	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5591-214d-85e5-cf5033dccd93	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5591-214d-1af6-8a12fce9a0a9	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5591-214d-c4cd-2c2ba28303ad	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5591-214d-9b1d-7e5d8f5c0e3c	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5591-214d-e345-60b9e407771d	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5591-214d-63fe-e2ecb3862542	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5591-214d-a45e-b950abf73e73	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5591-214d-b6bd-a48ce0de47af	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5591-214d-26ec-63eea082ee89	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5591-214d-0e5c-664c754c8154	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2898 (class 0 OID 8417139)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5591-214d-dc16-b7e4821e3f7a	01	Velika predstava	f	1.00	1.00
002b0000-5591-214d-359d-99349bfe92b6	02	Mala predstava	f	0.50	0.50
002b0000-5591-214d-90bc-821dd4d91708	03	Mala koprodukcija	t	0.40	1.00
002b0000-5591-214d-4047-657d7b504c2b	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5591-214d-8bba-6e5ea82ae4b1	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2856 (class 0 OID 8416657)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 8416503)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5591-214d-0529-311168c5ae88	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROatvqCIy9jQLbOxC/ayD9ZcQjee5omxm	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5591-214e-11da-6091fd8815da	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5591-214e-ca89-058650a35b99	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5591-214e-990c-071277022e32	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5591-214e-83c4-c61290811663	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5591-214e-864f-81c824b380c1	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5591-214e-337a-953e300b20e2	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5591-214e-4939-395b42cc9b00	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5591-214e-c433-a3bea9f4a997	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5591-214e-e6f6-0b384c411e37	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5591-214e-0943-1a6d0e06a01c	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5591-214d-880c-c87b0190b46d	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2893 (class 0 OID 8417027)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5591-214e-6fc5-51212c3252ae	00160000-5591-214e-2d11-1ffb72458174	00150000-5591-214d-2ddd-fb94226bf921	00140000-5591-214c-9e0c-b0f7733860bb	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5591-214e-d0a7-abb99d1eb69e
000e0000-5591-214e-ca6b-f741ab101b2c	00160000-5591-214e-e71c-e680b6132eb2	00150000-5591-214d-38aa-5557cdcd058b	00140000-5591-214c-8d76-48724d15b828	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5591-214e-f345-a9476dba9cc4
000e0000-5591-214e-d760-c108a03653a5	\N	00150000-5591-214d-38aa-5557cdcd058b	00140000-5591-214c-8d76-48724d15b828	00190000-5591-214e-1b63-4543fe6ef9dc	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5591-214e-d0a7-abb99d1eb69e
000e0000-5591-214e-399a-09e66ef78297	\N	00150000-5591-214d-38aa-5557cdcd058b	00140000-5591-214c-8d76-48724d15b828	00190000-5591-214e-1b63-4543fe6ef9dc	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5591-214e-d0a7-abb99d1eb69e
\.


--
-- TOC entry 2861 (class 0 OID 8416719)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5591-214e-0bc9-8a809e289d05	000e0000-5591-214e-ca6b-f741ab101b2c	1	
00200000-5591-214e-abcd-9bda46a1b68f	000e0000-5591-214e-ca6b-f741ab101b2c	2	
\.


--
-- TOC entry 2876 (class 0 OID 8416844)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 8416913)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8416751)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8417017)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5591-214c-9e0c-b0f7733860bb	01	Drama	drama (SURS 01)
00140000-5591-214c-b386-fe621c5ea1b6	02	Opera	opera (SURS 02)
00140000-5591-214c-ac87-3f9094adf3fc	03	Balet	balet (SURS 03)
00140000-5591-214c-67ed-b58a2f19b92c	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5591-214c-0ec3-af47436a83de	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5591-214c-8d76-48724d15b828	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5591-214c-447f-c73ed7c781ab	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2882 (class 0 OID 8416903)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5591-214d-fa80-d6954ec6d5cd	01	Opera	opera
00150000-5591-214d-042e-995f00136224	02	Opereta	opereta
00150000-5591-214d-d6e7-56ada19dbd3f	03	Balet	balet
00150000-5591-214d-3b1b-bae8892d347a	04	Plesne prireditve	plesne prireditve
00150000-5591-214d-698a-32fc5f6e19d8	05	Lutkovno gledališče	lutkovno gledališče
00150000-5591-214d-ab3d-8a6fde1365d0	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5591-214d-191a-ebec368f009f	07	Biografska drama	biografska drama
00150000-5591-214d-2ddd-fb94226bf921	08	Komedija	komedija
00150000-5591-214d-d579-b06e68d2835a	09	Črna komedija	črna komedija
00150000-5591-214d-9b5f-369547ffbfcd	10	E-igra	E-igra
00150000-5591-214d-38aa-5557cdcd058b	11	Kriminalka	kriminalka
00150000-5591-214d-52a1-86df3c46e209	12	Musical	musical
\.


--
-- TOC entry 2435 (class 2606 OID 8416557)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8417074)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 8417064)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 8416969)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 8416741)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 8416766)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 8417155)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 8416683)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 8417121)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 8416899)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 8416717)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 8416760)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 8416697)
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
-- TOC entry 2527 (class 2606 OID 8416809)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 8416836)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 8416655)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 8416566)
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
-- TOC entry 2442 (class 2606 OID 8416590)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 8416546)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2426 (class 2606 OID 8416531)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 8416842)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 8416875)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 8417012)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2451 (class 2606 OID 8416619)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 8416643)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 8416815)
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
-- TOC entry 2457 (class 2606 OID 8416633)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 8416704)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8416827)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 8416951)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8416997)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 8417137)
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
-- TOC entry 2547 (class 2606 OID 8416859)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 8416800)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 8416791)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8416991)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 8416927)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 8416502)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 8416866)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8416520)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2428 (class 2606 OID 8416540)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 8416884)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 8416822)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 8416772)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 8417179)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 8417167)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 8417161)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 8416940)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 8416599)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 8416782)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 8416980)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 8417149)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 8416668)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 8416515)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 8417043)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8416726)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 8416850)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 8416918)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 8416755)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 8417025)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 8416911)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 1259 OID 8416748)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2575 (class 1259 OID 8416941)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2576 (class 1259 OID 8416942)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2449 (class 1259 OID 8416621)
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
-- TOC entry 2540 (class 1259 OID 8416843)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2534 (class 1259 OID 8416829)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2535 (class 1259 OID 8416828)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2486 (class 1259 OID 8416727)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2562 (class 1259 OID 8416900)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2563 (class 1259 OID 8416902)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2564 (class 1259 OID 8416901)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2474 (class 1259 OID 8416699)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2475 (class 1259 OID 8416698)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 8417014)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 8417015)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2595 (class 1259 OID 8417016)
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
-- TOC entry 2602 (class 1259 OID 8417048)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2603 (class 1259 OID 8417045)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2604 (class 1259 OID 8417049)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2605 (class 1259 OID 8417047)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2606 (class 1259 OID 8417046)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2464 (class 1259 OID 8416670)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 8416669)
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
-- TOC entry 2440 (class 1259 OID 8416593)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2550 (class 1259 OID 8416867)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2504 (class 1259 OID 8416761)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2430 (class 1259 OID 8416547)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2431 (class 1259 OID 8416548)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2555 (class 1259 OID 8416887)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2556 (class 1259 OID 8416886)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2557 (class 1259 OID 8416885)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2478 (class 1259 OID 8416705)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2479 (class 1259 OID 8416707)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2480 (class 1259 OID 8416706)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2637 (class 1259 OID 8417169)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2514 (class 1259 OID 8416795)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2515 (class 1259 OID 8416793)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2516 (class 1259 OID 8416792)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2517 (class 1259 OID 8416794)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2421 (class 1259 OID 8416521)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2422 (class 1259 OID 8416522)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2543 (class 1259 OID 8416851)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2529 (class 1259 OID 8416816)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2571 (class 1259 OID 8416928)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2572 (class 1259 OID 8416929)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2623 (class 1259 OID 8417125)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2624 (class 1259 OID 8417122)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2625 (class 1259 OID 8417123)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2626 (class 1259 OID 8417124)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2453 (class 1259 OID 8416635)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2454 (class 1259 OID 8416634)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2455 (class 1259 OID 8416636)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2414 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2579 (class 1259 OID 8416952)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2580 (class 1259 OID 8416953)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2616 (class 1259 OID 8417078)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2617 (class 1259 OID 8417079)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2618 (class 1259 OID 8417076)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2619 (class 1259 OID 8417077)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2568 (class 1259 OID 8416919)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 8416804)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2521 (class 1259 OID 8416803)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2522 (class 1259 OID 8416801)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2523 (class 1259 OID 8416802)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2392 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2612 (class 1259 OID 8417066)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2613 (class 1259 OID 8417065)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2627 (class 1259 OID 8417138)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2485 (class 1259 OID 8416718)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2634 (class 1259 OID 8417156)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2436 (class 1259 OID 8416568)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2437 (class 1259 OID 8416567)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2445 (class 1259 OID 8416600)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2446 (class 1259 OID 8416601)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2509 (class 1259 OID 8416785)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2510 (class 1259 OID 8416784)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2511 (class 1259 OID 8416783)
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
-- TOC entry 2492 (class 1259 OID 8416750)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2493 (class 1259 OID 8416746)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2494 (class 1259 OID 8416743)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2495 (class 1259 OID 8416744)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2496 (class 1259 OID 8416742)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2497 (class 1259 OID 8416747)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2498 (class 1259 OID 8416745)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2452 (class 1259 OID 8416620)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 8416684)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 8416686)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2472 (class 1259 OID 8416685)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2473 (class 1259 OID 8416687)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2528 (class 1259 OID 8416810)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2598 (class 1259 OID 8417013)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2607 (class 1259 OID 8417044)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2443 (class 1259 OID 8416591)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2444 (class 1259 OID 8416592)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2565 (class 1259 OID 8416912)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2643 (class 1259 OID 8417180)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2463 (class 1259 OID 8416656)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2640 (class 1259 OID 8417168)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2548 (class 1259 OID 8416861)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2549 (class 1259 OID 8416860)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 8417075)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2395 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2460 (class 1259 OID 8416644)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2599 (class 1259 OID 8417026)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 8416998)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 8416999)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2429 (class 1259 OID 8416541)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2499 (class 1259 OID 8416749)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2669 (class 2606 OID 8417316)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2672 (class 2606 OID 8417301)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2671 (class 2606 OID 8417306)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2667 (class 2606 OID 8417326)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2673 (class 2606 OID 8417296)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2668 (class 2606 OID 8417321)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2670 (class 2606 OID 8417311)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2703 (class 2606 OID 8417471)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2702 (class 2606 OID 8417476)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2654 (class 2606 OID 8417231)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2690 (class 2606 OID 8417411)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2688 (class 2606 OID 8417406)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2689 (class 2606 OID 8417401)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2666 (class 2606 OID 8417291)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2698 (class 2606 OID 8417441)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2696 (class 2606 OID 8417451)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2697 (class 2606 OID 8417446)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2660 (class 2606 OID 8417266)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2661 (class 2606 OID 8417261)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2686 (class 2606 OID 8417391)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2709 (class 2606 OID 8417496)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2708 (class 2606 OID 8417501)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2707 (class 2606 OID 8417506)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2711 (class 2606 OID 8417526)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2714 (class 2606 OID 8417511)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2710 (class 2606 OID 8417531)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2712 (class 2606 OID 8417521)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2713 (class 2606 OID 8417516)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2658 (class 2606 OID 8417256)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2659 (class 2606 OID 8417251)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2650 (class 2606 OID 8417216)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2651 (class 2606 OID 8417211)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2692 (class 2606 OID 8417421)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2674 (class 2606 OID 8417331)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2647 (class 2606 OID 8417191)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2646 (class 2606 OID 8417196)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2693 (class 2606 OID 8417436)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2694 (class 2606 OID 8417431)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2695 (class 2606 OID 8417426)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2664 (class 2606 OID 8417271)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2662 (class 2606 OID 8417281)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2663 (class 2606 OID 8417276)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2727 (class 2606 OID 8417596)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2678 (class 2606 OID 8417366)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2680 (class 2606 OID 8417356)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2681 (class 2606 OID 8417351)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2679 (class 2606 OID 8417361)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2645 (class 2606 OID 8417181)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2644 (class 2606 OID 8417186)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2691 (class 2606 OID 8417416)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2687 (class 2606 OID 8417396)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2701 (class 2606 OID 8417461)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2700 (class 2606 OID 8417466)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2721 (class 2606 OID 8417581)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2724 (class 2606 OID 8417566)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2723 (class 2606 OID 8417571)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2722 (class 2606 OID 8417576)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2656 (class 2606 OID 8417241)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2657 (class 2606 OID 8417236)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2655 (class 2606 OID 8417246)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2705 (class 2606 OID 8417481)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2704 (class 2606 OID 8417486)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2718 (class 2606 OID 8417556)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2717 (class 2606 OID 8417561)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2720 (class 2606 OID 8417546)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2719 (class 2606 OID 8417551)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2699 (class 2606 OID 8417456)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2682 (class 2606 OID 8417386)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2683 (class 2606 OID 8417381)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2685 (class 2606 OID 8417371)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2684 (class 2606 OID 8417376)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2715 (class 2606 OID 8417541)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2716 (class 2606 OID 8417536)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2725 (class 2606 OID 8417586)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2665 (class 2606 OID 8417286)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2706 (class 2606 OID 8417491)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2726 (class 2606 OID 8417591)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2648 (class 2606 OID 8417206)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2649 (class 2606 OID 8417201)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2653 (class 2606 OID 8417221)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2652 (class 2606 OID 8417226)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2675 (class 2606 OID 8417346)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2676 (class 2606 OID 8417341)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2677 (class 2606 OID 8417336)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-06-29 12:43:27 CEST

--
-- PostgreSQL database dump complete
--

