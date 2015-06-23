--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-23 12:19:07 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 237 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2906 (class 0 OID 0)
-- Dependencies: 237
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 7990694)
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
-- TOC entry 230 (class 1259 OID 7991216)
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
-- TOC entry 229 (class 1259 OID 7991199)
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
-- TOC entry 222 (class 1259 OID 7991103)
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
-- TOC entry 197 (class 1259 OID 7990873)
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
-- TOC entry 200 (class 1259 OID 7990907)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 192 (class 1259 OID 7990816)
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
-- TOC entry 231 (class 1259 OID 7991230)
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
    drugiviri numeric(15,2) DEFAULT 0::numeric NOT NULL,
    opredelitevdrugiviri text,
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
-- TOC entry 216 (class 1259 OID 7991033)
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
-- TOC entry 195 (class 1259 OID 7990853)
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
-- TOC entry 199 (class 1259 OID 7990901)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 7990833)
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
-- TOC entry 205 (class 1259 OID 7990950)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 7990975)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 7990790)
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
-- TOC entry 184 (class 1259 OID 7990703)
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
-- TOC entry 185 (class 1259 OID 7990714)
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
-- TOC entry 180 (class 1259 OID 7990668)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 7990687)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 7990982)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 7991013)
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
-- TOC entry 226 (class 1259 OID 7991149)
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
    vrednostvaje numeric(12,2) DEFAULT NULL::numeric,
    vrednostpredstave numeric(12,2) DEFAULT NULL::numeric,
    vrednosture numeric(12,2) DEFAULT NULL::numeric,
    vrednostdopremiere numeric(12,2) DEFAULT NULL::numeric,
    aktivna boolean,
    zaposlenvdrjz boolean,
    opis text
);


--
-- TOC entry 187 (class 1259 OID 7990747)
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
-- TOC entry 189 (class 1259 OID 7990782)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 7990956)
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
-- TOC entry 188 (class 1259 OID 7990767)
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
-- TOC entry 194 (class 1259 OID 7990845)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 7990968)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 7991088)
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
-- TOC entry 225 (class 1259 OID 7991141)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 7991277)
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
-- TOC entry 212 (class 1259 OID 7990997)
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
-- TOC entry 204 (class 1259 OID 7990941)
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
-- TOC entry 203 (class 1259 OID 7990931)
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
-- TOC entry 224 (class 1259 OID 7991130)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 7991065)
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
-- TOC entry 177 (class 1259 OID 7990639)
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
-- TOC entry 176 (class 1259 OID 7990637)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2907 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 7991007)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 7990677)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 7990661)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 7991021)
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
-- TOC entry 207 (class 1259 OID 7990962)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 7990912)
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
-- TOC entry 236 (class 1259 OID 7991314)
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
-- TOC entry 235 (class 1259 OID 7991306)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 7991301)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 7991075)
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
-- TOC entry 186 (class 1259 OID 7990739)
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
-- TOC entry 202 (class 1259 OID 7990918)
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
-- TOC entry 223 (class 1259 OID 7991119)
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
-- TOC entry 233 (class 1259 OID 7991290)
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
-- TOC entry 191 (class 1259 OID 7990802)
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
-- TOC entry 178 (class 1259 OID 7990648)
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
-- TOC entry 228 (class 1259 OID 7991176)
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
-- TOC entry 196 (class 1259 OID 7990864)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 7990989)
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
-- TOC entry 218 (class 1259 OID 7991058)
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
-- TOC entry 198 (class 1259 OID 7990896)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 7991166)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 7991048)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2204 (class 2604 OID 7990642)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2846 (class 0 OID 7990694)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 7991216)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5589-329a-80f5-0f80113f0226	000d0000-5589-329a-0130-1990a84cbf8a	\N	00090000-5589-329a-5976-fe8b200dcfae	\N	000b0000-5589-329a-b778-0f96a9d94024	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5589-329a-2a19-d6a4cf07fbfa	000d0000-5589-329a-551c-f2164447533f	\N	00090000-5589-329a-26c9-181abbdb282c	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5589-329a-449f-f3050f94f8ca	000d0000-5589-329a-8124-237067c89a1d	\N	00090000-5589-329a-2909-fca6c3d55f3a	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5589-329a-449e-f5e8bd21f75e	000d0000-5589-329a-60dc-816112b37c19	\N	00090000-5589-329a-af08-e5fba2e8c95a	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5589-329a-05a9-bc14d16e3369	000d0000-5589-329a-af1c-51edb7ec6220	\N	00090000-5589-329a-f070-a8c6c0d6dc5b	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5589-329a-fee0-ccb6aa365f28	000d0000-5589-329a-2bdf-e41d9144e525	\N	00090000-5589-329a-26c9-181abbdb282c	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2892 (class 0 OID 7991199)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 7991103)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5589-3299-13a3-f7fd34dd9154	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5589-3299-3b1b-24ab2975f82f	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5589-3299-2147-cf169b610564	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2860 (class 0 OID 7990873)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5589-329a-160a-827e81c27952	\N	\N	00200000-5589-329a-57ef-9305644a444e	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5589-329a-fad3-f0e945b65cab	\N	\N	00200000-5589-329a-b75c-cd360c12d2dd	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5589-329a-eb9b-03405c8d8c9d	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5589-329a-5829-dfd59d6c5e05	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5589-329a-6f76-36864a80be64	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2863 (class 0 OID 7990907)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 7990816)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5589-3298-dc73-5f355e430d60	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5589-3298-98f6-b43262b81f6f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5589-3298-216d-c95248be5ed6	AL	ALB	008	Albania 	Albanija	\N
00040000-5589-3298-b7a8-36e40ddf054b	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5589-3298-dfd4-cd2a474f1872	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5589-3298-b283-415581feaff5	AD	AND	020	Andorra 	Andora	\N
00040000-5589-3298-f450-8724a71077fb	AO	AGO	024	Angola 	Angola	\N
00040000-5589-3298-3c78-8e21018e622f	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5589-3298-00b1-c930d65f7d14	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5589-3298-7acd-0fd7d7c177ed	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5589-3298-064b-ec503bf4eb86	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5589-3298-fa2a-093ccea87234	AM	ARM	051	Armenia 	Armenija	\N
00040000-5589-3298-e83a-7c80d245a21c	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5589-3298-9c29-27b8b95eeb05	AU	AUS	036	Australia 	Avstralija	\N
00040000-5589-3298-1522-0cc6f759c346	AT	AUT	040	Austria 	Avstrija	\N
00040000-5589-3298-6ac1-af8447b13ba5	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5589-3298-c315-e480676b3993	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5589-3298-f249-ac80a53f4e0c	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5589-3298-138d-7a4076ffd837	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5589-3298-69e4-8fd627cba4b2	BB	BRB	052	Barbados 	Barbados	\N
00040000-5589-3298-1106-4bc73e5322c2	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5589-3298-4c3d-996ea08c33f6	BE	BEL	056	Belgium 	Belgija	\N
00040000-5589-3298-7107-99207873c7c3	BZ	BLZ	084	Belize 	Belize	\N
00040000-5589-3298-f178-419b39beb62a	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5589-3298-b6be-cc1e0f202002	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5589-3298-a1f8-9fb478c236ef	BT	BTN	064	Bhutan 	Butan	\N
00040000-5589-3298-8fab-67cf3b3e8418	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5589-3298-b8e9-27380d90b8c8	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5589-3298-7c80-5ea61705913e	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5589-3298-72c4-3c5e6dd319e0	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5589-3298-ec86-95880373dd72	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5589-3298-82a2-efaa2b7e21eb	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5589-3298-82d2-0b2a9d69c752	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5589-3298-2bb7-c4f23b2cd6a6	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5589-3298-9d45-e2490b1961ee	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5589-3298-37d4-799fdc1ba6d5	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5589-3298-e404-eda6e7d751ff	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5589-3298-f915-1b0a2db509fd	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5589-3298-b396-2ff1b46fbb56	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5589-3298-656b-ab2fda916fae	CA	CAN	124	Canada 	Kanada	\N
00040000-5589-3298-5db9-877b687e8177	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5589-3298-6496-10a946b61bd1	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5589-3298-0752-9e9926c70947	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5589-3298-b963-42de01d815c2	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5589-3298-be0f-25db88a9bff0	CL	CHL	152	Chile 	Čile	\N
00040000-5589-3298-ecdf-64c7afe701ed	CN	CHN	156	China 	Kitajska	\N
00040000-5589-3298-1e54-1e055d4747e6	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5589-3298-4f1f-6868cd7af9d9	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5589-3298-1cce-bd385eea0b17	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5589-3298-a0b2-e9084b515962	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5589-3298-509b-da38994c8222	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5589-3298-a6a1-0e901f5e53b5	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5589-3298-0e31-fa7500f6fb7b	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5589-3298-0f1a-8fb88bd75218	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5589-3298-f23a-dc44b170022b	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5589-3298-786f-8235a5ec7f72	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5589-3298-0d73-6c57168e09d4	CU	CUB	192	Cuba 	Kuba	\N
00040000-5589-3298-8856-64f02ed25675	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5589-3298-72c7-d66a04e0ec3b	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5589-3298-5854-1a7d6be5e342	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5589-3298-1685-0f76471604ac	DK	DNK	208	Denmark 	Danska	\N
00040000-5589-3298-f6fb-0e545cf3a9a6	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5589-3298-c92b-67f7c6b54174	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5589-3298-b132-6622b2cff45c	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5589-3298-4a17-c51d6d3ee7de	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5589-3298-3d2d-83c0c9eeadd3	EG	EGY	818	Egypt 	Egipt	\N
00040000-5589-3298-ca14-bfdb15841f66	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5589-3298-de7e-8d9e47e4146e	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5589-3298-1dc9-4f11b6540609	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5589-3298-56e2-9c5dde601969	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5589-3298-8954-e6d34b98400c	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5589-3298-12b4-ff64885ebf36	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5589-3298-c789-8280401bd89a	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5589-3298-78a9-b8165ff670fa	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5589-3298-0e54-4f87e64bc541	FI	FIN	246	Finland 	Finska	\N
00040000-5589-3298-8c64-b22ac770673a	FR	FRA	250	France 	Francija	\N
00040000-5589-3298-15f1-87f7c0a83b61	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5589-3298-78f8-af48419eb35b	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5589-3298-e839-440af6d3c867	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5589-3298-ffc7-1eefdca6cad5	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5589-3298-fcee-b7f59003a7fc	GA	GAB	266	Gabon 	Gabon	\N
00040000-5589-3298-d3e0-11cbbea9f305	GM	GMB	270	Gambia 	Gambija	\N
00040000-5589-3298-2368-3a8f076abdba	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5589-3298-5c8f-b7947cf73429	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5589-3298-4109-f4707a8d812c	GH	GHA	288	Ghana 	Gana	\N
00040000-5589-3298-26a4-c590d2dac159	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5589-3298-a3c2-63e478c92973	GR	GRC	300	Greece 	Grčija	\N
00040000-5589-3298-f6fa-b2f6cfd39e73	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5589-3298-0e90-07d7874d92d9	GD	GRD	308	Grenada 	Grenada	\N
00040000-5589-3298-c0b8-b1e102c95c1b	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5589-3298-af4e-6a7c65c65c4e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5589-3298-46df-335ad6cac955	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5589-3298-4062-42698b758e38	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5589-3298-e263-ad6ff135dd55	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5589-3298-4a12-3f0b569a83ac	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5589-3298-1240-c53d935115bc	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5589-3298-9917-8e7c28e58fef	HT	HTI	332	Haiti 	Haiti	\N
00040000-5589-3298-95bc-46ac39fe6346	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5589-3298-edb7-e7688fbd9420	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5589-3298-31e4-5433d9ea9dad	HN	HND	340	Honduras 	Honduras	\N
00040000-5589-3298-1b8a-5a8d9ce15f8c	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5589-3298-56ad-3ca67eb6e9b4	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5589-3298-6f1b-7a7512a66392	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5589-3298-b93d-4e17bbeb4b0c	IN	IND	356	India 	Indija	\N
00040000-5589-3298-3882-1eb7f4c11c0d	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5589-3298-1533-f34c1f896d55	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5589-3298-29a7-985137dd8a3d	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5589-3298-ff35-06b9c87775d7	IE	IRL	372	Ireland 	Irska	\N
00040000-5589-3298-5b01-7a6b1d4f46e0	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5589-3298-7ea4-86a9d108ed5b	IL	ISR	376	Israel 	Izrael	\N
00040000-5589-3298-13d1-8af3212d9d7d	IT	ITA	380	Italy 	Italija	\N
00040000-5589-3298-5a36-849690ba0ef8	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5589-3298-10af-cf92cd375586	JP	JPN	392	Japan 	Japonska	\N
00040000-5589-3298-0113-c08ca50334f8	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5589-3298-4fb6-e8ea6a77ee2a	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5589-3298-ac13-f3030e2d9074	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5589-3298-9dc4-a5dfc9d0604c	KE	KEN	404	Kenya 	Kenija	\N
00040000-5589-3298-978d-731d516e6fd8	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5589-3298-f281-340073f8df76	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5589-3298-4ef6-6f53f0875902	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5589-3298-1cfe-543e7248c081	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5589-3298-0652-5d1643cbd3ab	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5589-3298-a9af-0af96b8d95f7	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5589-3298-b5d7-7072d5d067d6	LV	LVA	428	Latvia 	Latvija	\N
00040000-5589-3298-cf61-003b061e3540	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5589-3298-13f9-d322fe418084	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5589-3298-abbd-1a85177c5dde	LR	LBR	430	Liberia 	Liberija	\N
00040000-5589-3298-f83d-31191493c2fc	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5589-3298-d435-54f2c7cfa627	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5589-3298-d3f4-4f25764aa182	LT	LTU	440	Lithuania 	Litva	\N
00040000-5589-3298-3063-f2507e675089	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5589-3298-09dd-fbe634869bd0	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5589-3298-f8d3-25708a9845a8	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5589-3298-8786-6e1a58615e4a	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5589-3298-c0fc-041b12a5f8a8	MW	MWI	454	Malawi 	Malavi	\N
00040000-5589-3298-f653-08736bbbd941	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5589-3298-3be5-e3ad96ab6930	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5589-3298-49a2-03cc4a6c1358	ML	MLI	466	Mali 	Mali	\N
00040000-5589-3298-bd4f-ac99103cd407	MT	MLT	470	Malta 	Malta	\N
00040000-5589-3298-53a8-5fc155a09b45	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5589-3298-8156-919e0d94101a	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5589-3298-c438-49e46eff460b	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5589-3298-620f-8c2069ca4dd6	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5589-3298-1d89-ad7ae4995173	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5589-3298-bb78-115badc1689b	MX	MEX	484	Mexico 	Mehika	\N
00040000-5589-3298-6266-4eee81b6dbb3	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5589-3298-ad56-6c2345084c6f	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5589-3298-33cd-f1e18441c4b7	MC	MCO	492	Monaco 	Monako	\N
00040000-5589-3298-6f7f-674b968564fd	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5589-3298-966c-837aa02e6f8f	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5589-3298-05e2-40f0ae5ba9a7	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5589-3298-d8cb-c1d28c0374f4	MA	MAR	504	Morocco 	Maroko	\N
00040000-5589-3298-aece-b1725bb1b0ef	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5589-3298-1385-9869f9d2e5c9	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5589-3298-46c2-59b23137ab42	NA	NAM	516	Namibia 	Namibija	\N
00040000-5589-3298-942c-303bd2b44196	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5589-3298-b01c-9eccf6b4932f	NP	NPL	524	Nepal 	Nepal	\N
00040000-5589-3298-b876-30c21f7ea798	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5589-3298-1cd1-70ca09094956	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5589-3298-720f-cfd85a79b80e	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5589-3298-a8f7-ea5a7bc97ada	NE	NER	562	Niger 	Niger 	\N
00040000-5589-3298-a76d-2d09658b7a65	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5589-3298-e270-c62c6c8d78a7	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5589-3298-9cac-b01ac98760fa	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5589-3298-555f-42972bdc14e0	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5589-3298-2a7f-7fab31313194	NO	NOR	578	Norway 	Norveška	\N
00040000-5589-3298-ce02-13eb372adf6a	OM	OMN	512	Oman 	Oman	\N
00040000-5589-3298-0fe6-faa98d25d774	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5589-3298-0a87-464a1364ab30	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5589-3298-c100-8d2c951473cd	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5589-3298-efd2-44a6290fd52f	PA	PAN	591	Panama 	Panama	\N
00040000-5589-3298-1e69-1d6f251da755	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5589-3298-0a30-065e1c2f7666	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5589-3298-e302-b603a15faefb	PE	PER	604	Peru 	Peru	\N
00040000-5589-3298-67fd-e9f536265de3	PH	PHL	608	Philippines 	Filipini	\N
00040000-5589-3298-9385-2173ed98ff15	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5589-3298-e953-3651d8f7083f	PL	POL	616	Poland 	Poljska	\N
00040000-5589-3298-f8c4-7aa8da5e5050	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5589-3298-a057-1678698ab258	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5589-3298-0ddf-fa12711e6e08	QA	QAT	634	Qatar 	Katar	\N
00040000-5589-3298-0cd5-39c33f63db14	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5589-3298-d2e4-c21591cbca27	RO	ROU	642	Romania 	Romunija	\N
00040000-5589-3298-d9b3-5147a51c750e	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5589-3298-5a9e-a67202eea608	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5589-3298-624a-049aeea82f62	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5589-3298-5802-009d3b08dae6	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5589-3298-e821-26a0ba5f42b3	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5589-3298-aece-cb351f073531	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5589-3298-92b9-dc6385967f84	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5589-3298-4d73-b27e70b444ca	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5589-3298-3c93-836ec1c368a2	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5589-3298-72d0-2d955d7c6e38	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5589-3298-aa63-52a273dd090c	SM	SMR	674	San Marino 	San Marino	\N
00040000-5589-3298-c6ca-1e77a7f7c125	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5589-3298-f514-b4c572f69bc0	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5589-3298-6840-d79f4daf98e7	SN	SEN	686	Senegal 	Senegal	\N
00040000-5589-3298-760a-d4cddecc8631	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5589-3298-1d61-892a2142f840	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5589-3298-b72a-db28c500d2f4	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5589-3298-d79f-1646fa56e6b4	SG	SGP	702	Singapore 	Singapur	\N
00040000-5589-3298-0509-c80e11734f11	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5589-3298-61b8-923594746356	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5589-3298-b68d-0463c1568a9b	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5589-3298-0c4b-c1b77a55d44b	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5589-3298-193b-6ce21cbcd892	SO	SOM	706	Somalia 	Somalija	\N
00040000-5589-3298-8ee9-b06dc0d8bfdd	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5589-3298-9f2e-05c1f904441b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5589-3298-e570-def2d728001d	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5589-3298-a3a7-bb4fee109c67	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5589-3298-6e53-fa8767d6550e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5589-3298-24e1-f553db1ebd6f	SD	SDN	729	Sudan 	Sudan	\N
00040000-5589-3298-1fae-9fbfb088b79c	SR	SUR	740	Suriname 	Surinam	\N
00040000-5589-3298-56f6-8ed622d39b54	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5589-3298-ea8b-aa6d3113de03	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5589-3298-9155-0b6a7a22b42a	SE	SWE	752	Sweden 	Švedska	\N
00040000-5589-3298-bcdb-a1c18fe2565f	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5589-3298-9181-74b7591976c0	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5589-3298-dfd5-f7ef9ab64a94	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5589-3298-8ab5-d6b20e7efbb7	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5589-3298-fc3d-38329520aa1d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5589-3298-65fd-b69c561147e4	TH	THA	764	Thailand 	Tajska	\N
00040000-5589-3298-d5cd-ec2358ec89ab	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5589-3298-5041-510234e2327c	TG	TGO	768	Togo 	Togo	\N
00040000-5589-3298-7fe2-e06993bdf2e8	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5589-3298-3877-15bb8b73e3d1	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5589-3298-532b-780b3e3d6ffa	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5589-3298-744f-9927402615b4	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5589-3298-afe3-0f02872aab34	TR	TUR	792	Turkey 	Turčija	\N
00040000-5589-3298-7ca4-a6d283db8516	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5589-3298-519d-590556ea0318	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5589-3298-fd41-a8beb528adfc	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5589-3298-e54d-48ae20060af5	UG	UGA	800	Uganda 	Uganda	\N
00040000-5589-3298-9dd6-a4f734bef1a6	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5589-3298-ceeb-038cb7a064a4	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5589-3298-f09a-1f13e21f57d3	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5589-3298-98fb-199295346f35	US	USA	840	United States 	Združene države Amerike	\N
00040000-5589-3298-95b3-79cbcc210f74	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5589-3298-b030-c3edcdf4828f	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5589-3298-d0e7-543cc00f3c8a	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5589-3298-0acb-436c50b9ef80	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5589-3298-7983-eeb7993d33f8	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5589-3298-50f8-56ed94a13030	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5589-3298-a1b6-28e96cef7ab5	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5589-3298-2e16-0a6cafc90d18	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5589-3298-8341-8fc40568c2b6	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5589-3298-0bce-7456090c1ac1	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5589-3298-5c71-b568105632df	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5589-3298-364d-64dd6cf8515b	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5589-3298-6b43-2489aea0b6b6	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2894 (class 0 OID 7991230)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, opredelitevdrugiviri, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 7991033)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5589-329a-1244-4c7470ab4310	000e0000-5589-329a-1b07-fcc3ffcd5782	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5589-3299-2b46-b499e1f8dda5
000d0000-5589-329a-0130-1990a84cbf8a	000e0000-5589-329a-1b07-fcc3ffcd5782	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5589-3299-2b46-b499e1f8dda5
000d0000-5589-329a-551c-f2164447533f	000e0000-5589-329a-1b07-fcc3ffcd5782	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5589-3299-2cd7-2483185674b1
000d0000-5589-329a-8124-237067c89a1d	000e0000-5589-329a-1b07-fcc3ffcd5782	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5589-3299-2659-eaa73fa7ddb2
000d0000-5589-329a-60dc-816112b37c19	000e0000-5589-329a-1b07-fcc3ffcd5782	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5589-3299-2659-eaa73fa7ddb2
000d0000-5589-329a-af1c-51edb7ec6220	000e0000-5589-329a-1b07-fcc3ffcd5782	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5589-3299-2659-eaa73fa7ddb2
000d0000-5589-329a-2bdf-e41d9144e525	000e0000-5589-329a-1b07-fcc3ffcd5782	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5589-3299-2b46-b499e1f8dda5
\.


--
-- TOC entry 2858 (class 0 OID 7990853)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 7990901)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 7990833)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5589-329a-2cc1-be1928deb319	00080000-5589-329a-9550-c59bce52fedc	00090000-5589-329a-5976-fe8b200dcfae	AK		
\.


--
-- TOC entry 2833 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 7990950)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 7990975)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 7990790)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5589-3298-4d37-3289985c3af0	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5589-3298-718f-ce133c3150c9	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5589-3298-dc99-fde888f9f469	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5589-3298-4c8d-9e4dc85a72fd	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5589-3298-3c22-6f97dd20556d	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5589-3298-c181-f0a2b64b4740	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5589-3298-604b-e15ab47ace08	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5589-3298-88a7-aa90fdfc02f3	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5589-3298-4087-a620cc5449b6	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5589-3298-818d-f2e5f8e7b001	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5589-3298-2227-9054b8f9b6a7	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5589-3298-3675-fa921d405232	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5589-3298-fd99-d607a3ef7a07	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5589-329a-443a-945c391cafbe	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5589-329a-68e5-8efae2ce9222	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5589-329a-fa8c-9e70c980b266	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5589-329a-fb2a-d06602fe43aa	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5589-329a-9b83-2a6fbb27a540	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5589-329a-a312-f9f1719561cb	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2847 (class 0 OID 7990703)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5589-329a-e36c-cbf9232ecf42	00000000-5589-329a-68e5-8efae2ce9222	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5589-329a-0c65-7fbf86cb1936	00000000-5589-329a-68e5-8efae2ce9222	00010000-5589-3298-6dc5-6ffc8e97b906	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5589-329a-aafb-6ed6f719db9c	00000000-5589-329a-fa8c-9e70c980b266	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2848 (class 0 OID 7990714)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5589-329a-111d-2dbd6734c3c9	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5589-329a-af08-e5fba2e8c95a	00010000-5589-329a-2e60-95a93c010343	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5589-329a-2909-fca6c3d55f3a	00010000-5589-329a-f3cd-150c44cb36e9	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5589-329a-1510-ec1383f81594	00010000-5589-329a-6165-be5937f1b15c	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5589-329a-26fd-ffc4ae1ebf77	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5589-329a-1e50-9f0aad40bfc2	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5589-329a-9028-90301863b0ef	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5589-329a-08cb-d9fb90b33e15	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5589-329a-5976-fe8b200dcfae	00010000-5589-329a-7d6b-c324ffaf2de7	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5589-329a-26c9-181abbdb282c	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5589-329a-718b-4855d68d9e33	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5589-329a-f070-a8c6c0d6dc5b	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5589-329a-f00c-6569c61ab762	00010000-5589-329a-5c1e-a1140e803a95	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2835 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 7990668)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5589-3298-fcba-0b0c4f33d4ed	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5589-3298-8de4-c4b94c5607ec	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5589-3298-b900-e76e019d2534	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5589-3298-7cfe-7502756c38e8	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5589-3298-aa24-623a3a5addd9	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5589-3298-a5f0-bbde6b700339	Abonma-read	Abonma - branje	f
00030000-5589-3298-a2a3-d1d826cd9ce3	Abonma-write	Abonma - spreminjanje	f
00030000-5589-3298-7e76-bc78c42811fa	Alternacija-read	Alternacija - branje	f
00030000-5589-3298-8cc9-2b21eaf93353	Alternacija-write	Alternacija - spreminjanje	f
00030000-5589-3298-34cd-861256d73802	Arhivalija-read	Arhivalija - branje	f
00030000-5589-3298-794f-167ee2bf244d	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5589-3298-260f-a2998124f5a3	Besedilo-read	Besedilo - branje	f
00030000-5589-3298-bad3-fc7dfce725ef	Besedilo-write	Besedilo - spreminjanje	f
00030000-5589-3298-ce35-99b6ee53949d	DogodekIzven-read	DogodekIzven - branje	f
00030000-5589-3298-882b-f29fcf39c1c6	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5589-3298-bd2a-dc2e95e647c3	Dogodek-read	Dogodek - branje	f
00030000-5589-3298-44b1-44302d4f03a5	Dogodek-write	Dogodek - spreminjanje	f
00030000-5589-3298-f73e-a116e2069a36	Drzava-read	Drzava - branje	f
00030000-5589-3298-033e-795a21e0e2ca	Drzava-write	Drzava - spreminjanje	f
00030000-5589-3298-b995-8d1377d618f3	Funkcija-read	Funkcija - branje	f
00030000-5589-3298-db54-42b482e4f166	Funkcija-write	Funkcija - spreminjanje	f
00030000-5589-3298-02e4-1c597ea92baf	Gostovanje-read	Gostovanje - branje	f
00030000-5589-3298-169d-bae3b5e3f8b2	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5589-3298-40dd-23240d244bea	Gostujoca-read	Gostujoca - branje	f
00030000-5589-3298-6ba4-db0e5a882867	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5589-3298-87c6-2730324d6944	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5589-3298-2793-58edecc1a1ee	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5589-3298-8b2b-6affcb596bd8	Kupec-read	Kupec - branje	f
00030000-5589-3298-551f-f5d3dc9854aa	Kupec-write	Kupec - spreminjanje	f
00030000-5589-3298-a289-0ddfffdfe4e0	NacinPlacina-read	NacinPlacina - branje	f
00030000-5589-3298-375b-5f3ae35ff575	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5589-3298-b15c-fc037379f09e	Option-read	Option - branje	f
00030000-5589-3298-fffb-a5f023502177	Option-write	Option - spreminjanje	f
00030000-5589-3298-1c74-4b0edfc35ebd	OptionValue-read	OptionValue - branje	f
00030000-5589-3298-1981-c2276ecf723a	OptionValue-write	OptionValue - spreminjanje	f
00030000-5589-3298-c071-8174ceb3cfb1	Oseba-read	Oseba - branje	f
00030000-5589-3298-e25c-1c5836a9c778	Oseba-write	Oseba - spreminjanje	f
00030000-5589-3298-16c7-b571aba9987e	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5589-3298-92cf-02c962f41c1f	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5589-3298-b9df-42239fa48c51	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5589-3298-4618-c46755fa7ac9	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5589-3298-00be-cdd8e34e3ebb	Pogodba-read	Pogodba - branje	f
00030000-5589-3298-90c7-0ca40bc9ae4e	Pogodba-write	Pogodba - spreminjanje	f
00030000-5589-3298-cc8b-2653556fa2ec	Popa-read	Popa - branje	f
00030000-5589-3298-7391-72dc6381e32e	Popa-write	Popa - spreminjanje	f
00030000-5589-3298-d2e8-e1677c9753ee	Posta-read	Posta - branje	f
00030000-5589-3298-a800-8614892be6ab	Posta-write	Posta - spreminjanje	f
00030000-5589-3298-5278-faaf9dee92db	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5589-3298-d671-00d760f5e7cc	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5589-3298-664d-fa756b52ad8a	PostniNaslov-read	PostniNaslov - branje	f
00030000-5589-3298-0cb6-3b6559580fb8	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5589-3298-5909-5c2944467b7a	Predstava-read	Predstava - branje	f
00030000-5589-3298-39a1-6c183b76f33a	Predstava-write	Predstava - spreminjanje	f
00030000-5589-3298-1bd7-20a19db7634c	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5589-3298-1052-5ff8c29aaa6e	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5589-3298-497c-4858c4eb0ce3	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5589-3298-ca42-2e6b4bf4d05c	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5589-3298-2095-6ab53e11d449	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5589-3298-6063-639f72f5afa7	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5589-3298-f0fe-fe47cfa06897	ProgramDela-read	ProgramDela - branje	f
00030000-5589-3298-0a00-8644f60257d3	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5589-3298-67e3-27f31451ff9b	ProgramFestival-read	ProgramFestival - branje	f
00030000-5589-3298-d15e-198d5b707193	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5589-3298-7af8-e139be8adfcb	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5589-3298-f459-4078a8a9e559	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5589-3298-4940-ac7bb12221a1	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5589-3298-7cc2-8ee1dc59d0ac	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5589-3298-cf41-a5abf0adc131	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5589-3298-6f95-b49c5c88ddc2	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5589-3298-e981-ac4dd2ed0e18	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5589-3298-d65f-f072c3df1684	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5589-3298-239c-f8d92f7f0897	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5589-3298-5eb5-1cf7606c6cb7	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5589-3298-fd40-4bd4927d65d2	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5589-3298-4133-92f529865507	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5589-3298-f04b-36e9996e5ac6	ProgramRazno-read	ProgramRazno - branje	f
00030000-5589-3298-f82c-9c78ab48c7e1	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5589-3298-a4ee-b061938c43a9	Prostor-read	Prostor - branje	f
00030000-5589-3298-b4f1-4cb6037e9999	Prostor-write	Prostor - spreminjanje	f
00030000-5589-3298-1f73-0c86e1be65bc	Racun-read	Racun - branje	f
00030000-5589-3298-646b-df28c04985cf	Racun-write	Racun - spreminjanje	f
00030000-5589-3298-ce6d-2a702ac445a2	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5589-3298-fb6d-7b81e6833ba9	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5589-3298-eb0c-f88cf169c5cd	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5589-3298-947d-e9a05cd1717e	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5589-3298-d97f-2bf7d965c820	Rekvizit-read	Rekvizit - branje	f
00030000-5589-3298-4729-9f39c419fa3b	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5589-3298-664a-bc3cb3455403	Revizija-read	Revizija - branje	f
00030000-5589-3298-f60b-fbaf9083e4c7	Revizija-write	Revizija - spreminjanje	f
00030000-5589-3298-72f8-07f51eed3b37	Rezervacija-read	Rezervacija - branje	f
00030000-5589-3298-f72d-505e123be889	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5589-3298-9087-3f252cd8c4c9	SedezniRed-read	SedezniRed - branje	f
00030000-5589-3298-c534-f9d250470c60	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5589-3298-caec-61d7bcaa6950	Sedez-read	Sedez - branje	f
00030000-5589-3298-13d5-ab9d277d2d96	Sedez-write	Sedez - spreminjanje	f
00030000-5589-3298-e10f-dd98b333d1d5	Sezona-read	Sezona - branje	f
00030000-5589-3298-f037-38d31b31e9db	Sezona-write	Sezona - spreminjanje	f
00030000-5589-3298-3592-521cff5db498	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5589-3298-08be-f6fb0c7c6d45	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5589-3298-dd34-19e87d279fd2	Stevilcenje-read	Stevilcenje - branje	f
00030000-5589-3298-1a38-bd160f76a545	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5589-3298-846b-35d196e1eae1	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5589-3298-d00b-c6d4f440cfe1	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5589-3298-59ef-737dff11a5aa	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5589-3298-0cca-3f27bd8d4a97	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5589-3298-7a0f-b809cb5b4609	Telefonska-read	Telefonska - branje	f
00030000-5589-3298-2cb4-fca11604c8b8	Telefonska-write	Telefonska - spreminjanje	f
00030000-5589-3298-0297-e1f405d710e3	TerminStoritve-read	TerminStoritve - branje	f
00030000-5589-3298-18d8-1d1be4c72964	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5589-3298-74e4-ddaf22bc0dd9	TipFunkcije-read	TipFunkcije - branje	f
00030000-5589-3298-547e-df1bdff5e90d	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5589-3298-aba6-06d699e3516b	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5589-3298-e6ef-5a48eb074cba	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5589-3298-5dcf-c27b71b47696	Trr-read	Trr - branje	f
00030000-5589-3298-772f-edb8aeafc5ef	Trr-write	Trr - spreminjanje	f
00030000-5589-3298-bbd2-15f14559612d	Uprizoritev-read	Uprizoritev - branje	f
00030000-5589-3298-7290-1d4430d3a645	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5589-3298-c231-e4fc67c3277e	Vaja-read	Vaja - branje	f
00030000-5589-3298-e8ef-47189418ea45	Vaja-write	Vaja - spreminjanje	f
00030000-5589-3298-0bfe-2c6361835c11	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5589-3298-e116-1bee2f20d3ad	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5589-3298-5406-adf1e41874d3	Zaposlitev-read	Zaposlitev - branje	f
00030000-5589-3298-f8a4-40a28b75b988	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5589-3298-3294-a5515c30b611	Zasedenost-read	Zasedenost - branje	f
00030000-5589-3298-4c8b-a19a8b34b6cf	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5589-3298-7463-b32a05d7ed2d	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5589-3298-683e-0c2e524a8c32	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5589-3298-2e4e-7e39500cd2fc	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5589-3298-fd3b-019c3cadd2c0	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2845 (class 0 OID 7990687)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5589-3298-b469-958113b8baad	00030000-5589-3298-8de4-c4b94c5607ec
00020000-5589-3298-e842-22631ecf075c	00030000-5589-3298-f73e-a116e2069a36
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-a5f0-bbde6b700339
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-a2a3-d1d826cd9ce3
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-7e76-bc78c42811fa
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-8cc9-2b21eaf93353
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-34cd-861256d73802
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-bd2a-dc2e95e647c3
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-7cfe-7502756c38e8
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-44b1-44302d4f03a5
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-f73e-a116e2069a36
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-033e-795a21e0e2ca
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-b995-8d1377d618f3
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-db54-42b482e4f166
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-02e4-1c597ea92baf
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-169d-bae3b5e3f8b2
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-40dd-23240d244bea
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-6ba4-db0e5a882867
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-87c6-2730324d6944
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-2793-58edecc1a1ee
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-b15c-fc037379f09e
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-1c74-4b0edfc35ebd
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-c071-8174ceb3cfb1
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-e25c-1c5836a9c778
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-cc8b-2653556fa2ec
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-7391-72dc6381e32e
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-d2e8-e1677c9753ee
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-a800-8614892be6ab
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-664d-fa756b52ad8a
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-0cb6-3b6559580fb8
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-5909-5c2944467b7a
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-39a1-6c183b76f33a
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-2095-6ab53e11d449
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-6063-639f72f5afa7
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-a4ee-b061938c43a9
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-b4f1-4cb6037e9999
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-eb0c-f88cf169c5cd
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-947d-e9a05cd1717e
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-d97f-2bf7d965c820
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-4729-9f39c419fa3b
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-e10f-dd98b333d1d5
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-f037-38d31b31e9db
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-74e4-ddaf22bc0dd9
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-bbd2-15f14559612d
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-7290-1d4430d3a645
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-c231-e4fc67c3277e
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-e8ef-47189418ea45
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-3294-a5515c30b611
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-4c8b-a19a8b34b6cf
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-7463-b32a05d7ed2d
00020000-5589-3298-c65a-772e30c3a839	00030000-5589-3298-2e4e-7e39500cd2fc
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-a5f0-bbde6b700339
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-34cd-861256d73802
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-bd2a-dc2e95e647c3
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-f73e-a116e2069a36
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-02e4-1c597ea92baf
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-40dd-23240d244bea
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-87c6-2730324d6944
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-2793-58edecc1a1ee
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-b15c-fc037379f09e
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-1c74-4b0edfc35ebd
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-c071-8174ceb3cfb1
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-e25c-1c5836a9c778
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-cc8b-2653556fa2ec
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-d2e8-e1677c9753ee
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-664d-fa756b52ad8a
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-0cb6-3b6559580fb8
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-5909-5c2944467b7a
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-a4ee-b061938c43a9
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-eb0c-f88cf169c5cd
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-d97f-2bf7d965c820
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-e10f-dd98b333d1d5
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-7a0f-b809cb5b4609
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-2cb4-fca11604c8b8
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-5dcf-c27b71b47696
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-772f-edb8aeafc5ef
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-5406-adf1e41874d3
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-f8a4-40a28b75b988
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-7463-b32a05d7ed2d
00020000-5589-3298-9e9f-1fe0a9f47683	00030000-5589-3298-2e4e-7e39500cd2fc
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-a5f0-bbde6b700339
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-7e76-bc78c42811fa
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-34cd-861256d73802
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-794f-167ee2bf244d
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-260f-a2998124f5a3
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-ce35-99b6ee53949d
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-bd2a-dc2e95e647c3
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-f73e-a116e2069a36
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-b995-8d1377d618f3
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-02e4-1c597ea92baf
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-40dd-23240d244bea
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-87c6-2730324d6944
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-b15c-fc037379f09e
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-1c74-4b0edfc35ebd
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-c071-8174ceb3cfb1
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-cc8b-2653556fa2ec
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-d2e8-e1677c9753ee
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-5909-5c2944467b7a
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-2095-6ab53e11d449
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-a4ee-b061938c43a9
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-eb0c-f88cf169c5cd
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-d97f-2bf7d965c820
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-e10f-dd98b333d1d5
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-74e4-ddaf22bc0dd9
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-c231-e4fc67c3277e
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-3294-a5515c30b611
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-7463-b32a05d7ed2d
00020000-5589-3298-e4f2-931f7e310c37	00030000-5589-3298-2e4e-7e39500cd2fc
00020000-5589-3298-94a9-ea8a0bed9444	00030000-5589-3298-a5f0-bbde6b700339
00020000-5589-3298-94a9-ea8a0bed9444	00030000-5589-3298-a2a3-d1d826cd9ce3
00020000-5589-3298-94a9-ea8a0bed9444	00030000-5589-3298-8cc9-2b21eaf93353
00020000-5589-3298-94a9-ea8a0bed9444	00030000-5589-3298-34cd-861256d73802
00020000-5589-3298-94a9-ea8a0bed9444	00030000-5589-3298-bd2a-dc2e95e647c3
00020000-5589-3298-94a9-ea8a0bed9444	00030000-5589-3298-f73e-a116e2069a36
00020000-5589-3298-94a9-ea8a0bed9444	00030000-5589-3298-02e4-1c597ea92baf
00020000-5589-3298-94a9-ea8a0bed9444	00030000-5589-3298-40dd-23240d244bea
00020000-5589-3298-94a9-ea8a0bed9444	00030000-5589-3298-b15c-fc037379f09e
00020000-5589-3298-94a9-ea8a0bed9444	00030000-5589-3298-1c74-4b0edfc35ebd
00020000-5589-3298-94a9-ea8a0bed9444	00030000-5589-3298-cc8b-2653556fa2ec
00020000-5589-3298-94a9-ea8a0bed9444	00030000-5589-3298-d2e8-e1677c9753ee
00020000-5589-3298-94a9-ea8a0bed9444	00030000-5589-3298-5909-5c2944467b7a
00020000-5589-3298-94a9-ea8a0bed9444	00030000-5589-3298-a4ee-b061938c43a9
00020000-5589-3298-94a9-ea8a0bed9444	00030000-5589-3298-eb0c-f88cf169c5cd
00020000-5589-3298-94a9-ea8a0bed9444	00030000-5589-3298-d97f-2bf7d965c820
00020000-5589-3298-94a9-ea8a0bed9444	00030000-5589-3298-e10f-dd98b333d1d5
00020000-5589-3298-94a9-ea8a0bed9444	00030000-5589-3298-74e4-ddaf22bc0dd9
00020000-5589-3298-94a9-ea8a0bed9444	00030000-5589-3298-7463-b32a05d7ed2d
00020000-5589-3298-94a9-ea8a0bed9444	00030000-5589-3298-2e4e-7e39500cd2fc
00020000-5589-3298-d5e6-747c34fcfe13	00030000-5589-3298-a5f0-bbde6b700339
00020000-5589-3298-d5e6-747c34fcfe13	00030000-5589-3298-34cd-861256d73802
00020000-5589-3298-d5e6-747c34fcfe13	00030000-5589-3298-bd2a-dc2e95e647c3
00020000-5589-3298-d5e6-747c34fcfe13	00030000-5589-3298-f73e-a116e2069a36
00020000-5589-3298-d5e6-747c34fcfe13	00030000-5589-3298-02e4-1c597ea92baf
00020000-5589-3298-d5e6-747c34fcfe13	00030000-5589-3298-40dd-23240d244bea
00020000-5589-3298-d5e6-747c34fcfe13	00030000-5589-3298-b15c-fc037379f09e
00020000-5589-3298-d5e6-747c34fcfe13	00030000-5589-3298-1c74-4b0edfc35ebd
00020000-5589-3298-d5e6-747c34fcfe13	00030000-5589-3298-cc8b-2653556fa2ec
00020000-5589-3298-d5e6-747c34fcfe13	00030000-5589-3298-d2e8-e1677c9753ee
00020000-5589-3298-d5e6-747c34fcfe13	00030000-5589-3298-5909-5c2944467b7a
00020000-5589-3298-d5e6-747c34fcfe13	00030000-5589-3298-a4ee-b061938c43a9
00020000-5589-3298-d5e6-747c34fcfe13	00030000-5589-3298-eb0c-f88cf169c5cd
00020000-5589-3298-d5e6-747c34fcfe13	00030000-5589-3298-d97f-2bf7d965c820
00020000-5589-3298-d5e6-747c34fcfe13	00030000-5589-3298-e10f-dd98b333d1d5
00020000-5589-3298-d5e6-747c34fcfe13	00030000-5589-3298-0297-e1f405d710e3
00020000-5589-3298-d5e6-747c34fcfe13	00030000-5589-3298-b900-e76e019d2534
00020000-5589-3298-d5e6-747c34fcfe13	00030000-5589-3298-74e4-ddaf22bc0dd9
00020000-5589-3298-d5e6-747c34fcfe13	00030000-5589-3298-7463-b32a05d7ed2d
00020000-5589-3298-d5e6-747c34fcfe13	00030000-5589-3298-2e4e-7e39500cd2fc
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-fcba-0b0c4f33d4ed
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-8de4-c4b94c5607ec
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-b900-e76e019d2534
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-7cfe-7502756c38e8
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-aa24-623a3a5addd9
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-a5f0-bbde6b700339
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-a2a3-d1d826cd9ce3
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-7e76-bc78c42811fa
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-8cc9-2b21eaf93353
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-34cd-861256d73802
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-794f-167ee2bf244d
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-260f-a2998124f5a3
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-bad3-fc7dfce725ef
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-ce35-99b6ee53949d
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-882b-f29fcf39c1c6
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-bd2a-dc2e95e647c3
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-44b1-44302d4f03a5
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-f73e-a116e2069a36
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-033e-795a21e0e2ca
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-b995-8d1377d618f3
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-db54-42b482e4f166
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-02e4-1c597ea92baf
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-169d-bae3b5e3f8b2
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-40dd-23240d244bea
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-6ba4-db0e5a882867
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-87c6-2730324d6944
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-2793-58edecc1a1ee
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-8b2b-6affcb596bd8
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-551f-f5d3dc9854aa
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-a289-0ddfffdfe4e0
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-375b-5f3ae35ff575
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-b15c-fc037379f09e
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-fffb-a5f023502177
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-1c74-4b0edfc35ebd
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-1981-c2276ecf723a
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-c071-8174ceb3cfb1
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-e25c-1c5836a9c778
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-16c7-b571aba9987e
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-92cf-02c962f41c1f
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-b9df-42239fa48c51
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-4618-c46755fa7ac9
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-00be-cdd8e34e3ebb
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-90c7-0ca40bc9ae4e
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-cc8b-2653556fa2ec
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-7391-72dc6381e32e
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-d2e8-e1677c9753ee
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-a800-8614892be6ab
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-5278-faaf9dee92db
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-d671-00d760f5e7cc
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-664d-fa756b52ad8a
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-0cb6-3b6559580fb8
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-5909-5c2944467b7a
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-39a1-6c183b76f33a
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-1bd7-20a19db7634c
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-1052-5ff8c29aaa6e
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-497c-4858c4eb0ce3
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-ca42-2e6b4bf4d05c
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-2095-6ab53e11d449
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-6063-639f72f5afa7
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-f0fe-fe47cfa06897
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-0a00-8644f60257d3
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-67e3-27f31451ff9b
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-d15e-198d5b707193
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-7af8-e139be8adfcb
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-f459-4078a8a9e559
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-4940-ac7bb12221a1
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-7cc2-8ee1dc59d0ac
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-cf41-a5abf0adc131
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-6f95-b49c5c88ddc2
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-e981-ac4dd2ed0e18
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-d65f-f072c3df1684
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-239c-f8d92f7f0897
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-5eb5-1cf7606c6cb7
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-fd40-4bd4927d65d2
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-4133-92f529865507
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-f04b-36e9996e5ac6
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-f82c-9c78ab48c7e1
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-a4ee-b061938c43a9
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-b4f1-4cb6037e9999
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-1f73-0c86e1be65bc
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-646b-df28c04985cf
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-ce6d-2a702ac445a2
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-fb6d-7b81e6833ba9
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-eb0c-f88cf169c5cd
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-947d-e9a05cd1717e
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-d97f-2bf7d965c820
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-4729-9f39c419fa3b
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-664a-bc3cb3455403
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-f60b-fbaf9083e4c7
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-72f8-07f51eed3b37
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-f72d-505e123be889
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-9087-3f252cd8c4c9
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-c534-f9d250470c60
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-caec-61d7bcaa6950
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-13d5-ab9d277d2d96
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-e10f-dd98b333d1d5
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-f037-38d31b31e9db
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-3592-521cff5db498
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-08be-f6fb0c7c6d45
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-dd34-19e87d279fd2
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-1a38-bd160f76a545
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-846b-35d196e1eae1
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-d00b-c6d4f440cfe1
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-59ef-737dff11a5aa
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-0cca-3f27bd8d4a97
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-7a0f-b809cb5b4609
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-2cb4-fca11604c8b8
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-0297-e1f405d710e3
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-18d8-1d1be4c72964
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-74e4-ddaf22bc0dd9
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-547e-df1bdff5e90d
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-aba6-06d699e3516b
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-e6ef-5a48eb074cba
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-5dcf-c27b71b47696
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-772f-edb8aeafc5ef
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-bbd2-15f14559612d
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-7290-1d4430d3a645
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-c231-e4fc67c3277e
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-e8ef-47189418ea45
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-0bfe-2c6361835c11
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-e116-1bee2f20d3ad
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-5406-adf1e41874d3
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-f8a4-40a28b75b988
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-3294-a5515c30b611
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-4c8b-a19a8b34b6cf
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-7463-b32a05d7ed2d
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-683e-0c2e524a8c32
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-2e4e-7e39500cd2fc
00020000-5589-329a-8d44-15cfbfec4c73	00030000-5589-3298-fd3b-019c3cadd2c0
\.


--
-- TOC entry 2873 (class 0 OID 7990982)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 7991013)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 7991149)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5589-329a-b778-0f96a9d94024	00090000-5589-329a-111d-2dbd6734c3c9	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2850 (class 0 OID 7990747)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5589-329a-9550-c59bce52fedc	00040000-5589-3298-dc73-5f355e430d60	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5589-329a-352a-dea3bbcf52c0	00040000-5589-3298-dc73-5f355e430d60	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5589-329a-111e-1f71f9cc8c66	00040000-5589-3298-dc73-5f355e430d60	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5589-329a-e813-9f604029ea31	00040000-5589-3298-dc73-5f355e430d60	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5589-329a-38a0-b7abbcb42312	00040000-5589-3298-dc73-5f355e430d60	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5589-329a-13fe-f4483af8ab1a	00040000-5589-3298-b68d-0463c1568a9b	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2852 (class 0 OID 7990782)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5589-3298-54b5-b1016b27fd17	8341	Adlešiči
00050000-5589-3298-d4b3-a25a44c0b4b6	5270	Ajdovščina
00050000-5589-3298-74ff-a3e9d1a26876	6280	Ankaran/Ancarano
00050000-5589-3298-ab29-e2f0e154e05a	9253	Apače
00050000-5589-3298-2cbb-94ce1bce0198	8253	Artiče
00050000-5589-3298-eb82-742bc102b704	4275	Begunje na Gorenjskem
00050000-5589-3298-7219-7fe749f50e15	1382	Begunje pri Cerknici
00050000-5589-3298-de43-3b551c934d05	9231	Beltinci
00050000-5589-3298-1ba5-269c71fc1111	2234	Benedikt
00050000-5589-3298-07f6-41e6dd7eabe9	2345	Bistrica ob Dravi
00050000-5589-3298-8bc2-78f8e434c026	3256	Bistrica ob Sotli
00050000-5589-3298-cf59-9bc68228fd0c	8259	Bizeljsko
00050000-5589-3298-280a-f66dfe536cb7	1223	Blagovica
00050000-5589-3298-b058-b6bff78a73f0	8283	Blanca
00050000-5589-3298-f467-edc9f6270d15	4260	Bled
00050000-5589-3298-ea3a-14b4a79254ea	4273	Blejska Dobrava
00050000-5589-3298-ddf7-b81e06db2973	9265	Bodonci
00050000-5589-3298-81c0-b158c8bc1a14	9222	Bogojina
00050000-5589-3298-d26b-bac0dd98482e	4263	Bohinjska Bela
00050000-5589-3298-d3aa-437531fa99a0	4264	Bohinjska Bistrica
00050000-5589-3298-1e0d-540f08696e71	4265	Bohinjsko jezero
00050000-5589-3298-5a7e-b350c2a9f4d6	1353	Borovnica
00050000-5589-3298-bbd4-a53d85578284	8294	Boštanj
00050000-5589-3298-fc0b-8b319e0d2d1d	5230	Bovec
00050000-5589-3298-6c8c-2be1dd06836e	5295	Branik
00050000-5589-3298-4632-20a9c55e5e82	3314	Braslovče
00050000-5589-3298-2b70-9dacc83d8127	5223	Breginj
00050000-5589-3298-12d3-63685e6d509c	8280	Brestanica
00050000-5589-3298-3f2b-41b799d35e42	2354	Bresternica
00050000-5589-3298-9ff1-a0fd2ac35dc8	4243	Brezje
00050000-5589-3298-bafe-ac5bbc552519	1351	Brezovica pri Ljubljani
00050000-5589-3298-b481-2859499f04f0	8250	Brežice
00050000-5589-3298-4069-4aea9d9e993f	4210	Brnik - Aerodrom
00050000-5589-3298-5443-3da5b554be7c	8321	Brusnice
00050000-5589-3298-285c-83bdd422f255	3255	Buče
00050000-5589-3298-3dac-f383ac6d2eeb	8276	Bučka 
00050000-5589-3298-6497-eda353913879	9261	Cankova
00050000-5589-3298-3dee-fc2f366e536c	3000	Celje 
00050000-5589-3298-4a24-003605276d89	3001	Celje - poštni predali
00050000-5589-3298-942a-83481b7d785a	4207	Cerklje na Gorenjskem
00050000-5589-3298-1660-773a57bc828a	8263	Cerklje ob Krki
00050000-5589-3298-dd92-bf9869a42824	1380	Cerknica
00050000-5589-3298-15b6-ab5583ba7849	5282	Cerkno
00050000-5589-3298-7468-558df0aefe29	2236	Cerkvenjak
00050000-5589-3298-f6b9-4f9a8cf46fd5	2215	Ceršak
00050000-5589-3298-0c38-0b141cdb124a	2326	Cirkovce
00050000-5589-3298-7b27-094586b3d92e	2282	Cirkulane
00050000-5589-3298-50f5-e245b896f810	5273	Col
00050000-5589-3298-c870-14c27480977c	8251	Čatež ob Savi
00050000-5589-3298-7122-ff3e2a619829	1413	Čemšenik
00050000-5589-3298-4369-340806962eed	5253	Čepovan
00050000-5589-3298-d167-d8049367c746	9232	Črenšovci
00050000-5589-3298-ebc5-2e9eaffba9d9	2393	Črna na Koroškem
00050000-5589-3298-1591-48b79977ec89	6275	Črni Kal
00050000-5589-3298-a0fb-dab3b8f4c9e0	5274	Črni Vrh nad Idrijo
00050000-5589-3298-53b3-db31c57e6f80	5262	Črniče
00050000-5589-3298-2176-c1760304d236	8340	Črnomelj
00050000-5589-3298-e9b7-841e9bce6736	6271	Dekani
00050000-5589-3298-4cee-50e84d7e3a8f	5210	Deskle
00050000-5589-3298-bc83-fb3853a4735a	2253	Destrnik
00050000-5589-3298-71bf-cb6889c213fb	6215	Divača
00050000-5589-3298-aff0-64b9ff77827f	1233	Dob
00050000-5589-3298-901c-03adc3cac034	3224	Dobje pri Planini
00050000-5589-3298-9c08-7933cc89589c	8257	Dobova
00050000-5589-3298-cb5f-39f1f5870927	1423	Dobovec
00050000-5589-3298-697a-d3a60d1786ec	5263	Dobravlje
00050000-5589-3298-db12-c9021fca98d4	3204	Dobrna
00050000-5589-3298-ee53-96bf0daed08b	8211	Dobrnič
00050000-5589-3298-fa2d-ba526ace1ff5	1356	Dobrova
00050000-5589-3298-0add-de91c88529de	9223	Dobrovnik/Dobronak 
00050000-5589-3298-c853-9e47c93318e5	5212	Dobrovo v Brdih
00050000-5589-3298-b33f-01ea4d785dee	1431	Dol pri Hrastniku
00050000-5589-3298-434c-2b6dbf1a9d9b	1262	Dol pri Ljubljani
00050000-5589-3298-b531-7ba004d1c412	1273	Dole pri Litiji
00050000-5589-3298-6ef9-6d481968a714	1331	Dolenja vas
00050000-5589-3298-ee9c-5ae0c7c7f805	8350	Dolenjske Toplice
00050000-5589-3298-29f1-695de277a701	1230	Domžale
00050000-5589-3298-95da-7f1e2c63ae84	2252	Dornava
00050000-5589-3298-4b54-b40bd67ef03e	5294	Dornberk
00050000-5589-3298-a8e2-8b53ad6b2351	1319	Draga
00050000-5589-3298-ad0b-f2630073ef26	8343	Dragatuš
00050000-5589-3298-a4ad-eca2b70b9b57	3222	Dramlje
00050000-5589-3298-afc6-2c740ebb5a44	2370	Dravograd
00050000-5589-3298-c11f-6dd4e40cfff6	4203	Duplje
00050000-5589-3298-1513-233bc756ec39	6221	Dutovlje
00050000-5589-3298-0ae7-e6df16348e68	8361	Dvor
00050000-5589-3298-1ca6-2b4ea92e4f98	2343	Fala
00050000-5589-3298-b586-c2e1328cb50f	9208	Fokovci
00050000-5589-3298-34b4-ca3e610686a0	2313	Fram
00050000-5589-3298-1a7c-f49ad1e62f60	3213	Frankolovo
00050000-5589-3298-4c90-f8485532a460	1274	Gabrovka
00050000-5589-3298-861e-84383d67e18d	8254	Globoko
00050000-5589-3298-f837-45f5d2c32f84	5275	Godovič
00050000-5589-3298-970a-85410bd73102	4204	Golnik
00050000-5589-3298-0ecc-996a0e34d277	3303	Gomilsko
00050000-5589-3298-14d0-cb16cbdc2f33	4224	Gorenja vas
00050000-5589-3298-7499-b4a65fe9efe1	3263	Gorica pri Slivnici
00050000-5589-3298-a19e-4358348784d6	2272	Gorišnica
00050000-5589-3298-3a29-967162b42751	9250	Gornja Radgona
00050000-5589-3298-cb63-ef0159e61d54	3342	Gornji Grad
00050000-5589-3298-1ab4-a165ea86d45c	4282	Gozd Martuljek
00050000-5589-3298-776c-35bb939b2008	6272	Gračišče
00050000-5589-3298-b980-7347c4404c2a	9264	Grad
00050000-5589-3298-755d-9e97def9283f	8332	Gradac
00050000-5589-3298-1a4c-b772a0e1d851	1384	Grahovo
00050000-5589-3298-613b-38d553d2fe51	5242	Grahovo ob Bači
00050000-5589-3298-f1e2-fc7b51891b60	5251	Grgar
00050000-5589-3298-444d-778043ea9b54	3302	Griže
00050000-5589-3298-718a-711bc14b81e6	3231	Grobelno
00050000-5589-3298-d6b5-9518aaf1adf8	1290	Grosuplje
00050000-5589-3298-8929-b08933f5f23c	2288	Hajdina
00050000-5589-3298-e4a9-bf83c5a8c837	8362	Hinje
00050000-5589-3298-81d0-9a2e08bb8705	2311	Hoče
00050000-5589-3298-eae1-3ceee63b4d29	9205	Hodoš/Hodos
00050000-5589-3298-6092-fa7783787a95	1354	Horjul
00050000-5589-3298-2d98-cd5a8c24a997	1372	Hotedršica
00050000-5589-3298-a697-76c5f480f175	1430	Hrastnik
00050000-5589-3298-a9e8-b45e555e9ee3	6225	Hruševje
00050000-5589-3298-1b5a-c193e043e949	4276	Hrušica
00050000-5589-3298-1dc5-88f98663a1e5	5280	Idrija
00050000-5589-3298-7503-48479d6d7685	1292	Ig
00050000-5589-3298-1be3-0705125b2f64	6250	Ilirska Bistrica
00050000-5589-3298-ad10-5d4984a9a71f	6251	Ilirska Bistrica-Trnovo
00050000-5589-3298-1438-3299b4114a31	1295	Ivančna Gorica
00050000-5589-3298-c68d-c0f07f26c646	2259	Ivanjkovci
00050000-5589-3298-95e7-0a25145a1aad	1411	Izlake
00050000-5589-3298-7938-38a9a710d66d	6310	Izola/Isola
00050000-5589-3298-fc70-a03c06eccd81	2222	Jakobski Dol
00050000-5589-3298-f60b-0aaf5f217af2	2221	Jarenina
00050000-5589-3298-6495-a3d8584991b4	6254	Jelšane
00050000-5589-3298-d67b-26a5fb91ee5b	4270	Jesenice
00050000-5589-3298-69d4-69f0e1a85d86	8261	Jesenice na Dolenjskem
00050000-5589-3298-1fcc-aa506fa449d4	3273	Jurklošter
00050000-5589-3298-c71e-35464ff2d85f	2223	Jurovski Dol
00050000-5589-3298-3dee-dc87eafc5580	2256	Juršinci
00050000-5589-3298-ed8c-51acc2160bc3	5214	Kal nad Kanalom
00050000-5589-3298-da69-1b53900e1b5a	3233	Kalobje
00050000-5589-3298-91d9-a6b0a7082df7	4246	Kamna Gorica
00050000-5589-3298-c21b-d60d5e4bbb30	2351	Kamnica
00050000-5589-3298-08cf-c1bcf75c7d1a	1241	Kamnik
00050000-5589-3298-6b81-4ba6772c1f38	5213	Kanal
00050000-5589-3298-8c7e-f55efe8f981c	8258	Kapele
00050000-5589-3298-8574-c8b2716371f9	2362	Kapla
00050000-5589-3298-65a8-ea950c8078f8	2325	Kidričevo
00050000-5589-3298-17d2-a9a8b48ce78d	1412	Kisovec
00050000-5589-3298-1fb5-b7688507681c	6253	Knežak
00050000-5589-3298-2109-9280479627d6	5222	Kobarid
00050000-5589-3298-d882-91aef14a82ba	9227	Kobilje
00050000-5589-3298-7bd0-0d7d6c8fa95e	1330	Kočevje
00050000-5589-3298-6e27-2462a589664b	1338	Kočevska Reka
00050000-5589-3298-709e-9843c7f8c432	2276	Kog
00050000-5589-3298-e76b-2eaae246aed2	5211	Kojsko
00050000-5589-3298-c13c-344562d0c240	6223	Komen
00050000-5589-3298-4092-2cdd78b688c0	1218	Komenda
00050000-5589-3298-06b3-63a4b704965c	6000	Koper/Capodistria 
00050000-5589-3298-f9cf-da8ba0beec2d	6001	Koper/Capodistria - poštni predali
00050000-5589-3298-f595-8a56eb8df674	8282	Koprivnica
00050000-5589-3298-d5f9-abce8e5bd69a	5296	Kostanjevica na Krasu
00050000-5589-3298-2caa-5516a802242b	8311	Kostanjevica na Krki
00050000-5589-3298-1245-21485a61a6b7	1336	Kostel
00050000-5589-3298-8d8d-db20cc77c86b	6256	Košana
00050000-5589-3298-9b70-71be890c5a4e	2394	Kotlje
00050000-5589-3298-ab26-1146fb2d253f	6240	Kozina
00050000-5589-3298-28fa-bca33bc9f35b	3260	Kozje
00050000-5589-3298-7cb6-a5facac7aca8	4000	Kranj 
00050000-5589-3298-b0b0-17855324d86c	4001	Kranj - poštni predali
00050000-5589-3298-3ef2-fb9c3bc8e3b0	4280	Kranjska Gora
00050000-5589-3298-be8f-162ff951c148	1281	Kresnice
00050000-5589-3298-e74d-6425d83f9c5b	4294	Križe
00050000-5589-3298-8a96-a9db846663c0	9206	Križevci
00050000-5589-3298-8e7f-c1c0d7d31d31	9242	Križevci pri Ljutomeru
00050000-5589-3298-4b3b-f7037c8b5b55	1301	Krka
00050000-5589-3298-eca7-7a405c08b45e	8296	Krmelj
00050000-5589-3298-daff-e3bc41030531	4245	Kropa
00050000-5589-3298-abeb-35df2d787b49	8262	Krška vas
00050000-5589-3298-dc07-31751ed0cd2e	8270	Krško
00050000-5589-3298-5ecb-e90a8deee8e4	9263	Kuzma
00050000-5589-3298-8eba-acec335af9be	2318	Laporje
00050000-5589-3298-d739-b9093107b1a7	3270	Laško
00050000-5589-3298-099d-739ad568c903	1219	Laze v Tuhinju
00050000-5589-3298-51a4-e5d1d24c1a52	2230	Lenart v Slovenskih goricah
00050000-5589-3298-b226-1be98a2c3e2c	9220	Lendava/Lendva
00050000-5589-3298-eb45-bbdb76782345	4248	Lesce
00050000-5589-3298-4da8-32d71a7bdd5e	3261	Lesično
00050000-5589-3298-14d5-95a88c1208b0	8273	Leskovec pri Krškem
00050000-5589-3298-ece4-8707778aa4e9	2372	Libeliče
00050000-5589-3298-622c-53b4b2383a56	2341	Limbuš
00050000-5589-3298-c738-56d94f8058c6	1270	Litija
00050000-5589-3298-f662-830db759769f	3202	Ljubečna
00050000-5589-3298-877b-0388a736ff80	1000	Ljubljana 
00050000-5589-3298-8d36-fd0b5d1d2903	1001	Ljubljana - poštni predali
00050000-5589-3298-291d-e4af370f1898	1231	Ljubljana - Črnuče
00050000-5589-3298-61d7-cc220cc64f50	1261	Ljubljana - Dobrunje
00050000-5589-3298-58df-c1ab975b31a6	1260	Ljubljana - Polje
00050000-5589-3298-a179-fbeab94ebd63	1210	Ljubljana - Šentvid
00050000-5589-3298-ad62-cbb91e294539	1211	Ljubljana - Šmartno
00050000-5589-3298-8691-a948ed8c4b7a	3333	Ljubno ob Savinji
00050000-5589-3298-f51d-96870a10190a	9240	Ljutomer
00050000-5589-3298-8414-1ebfc869c718	3215	Loče
00050000-5589-3298-296b-c1e712b80596	5231	Log pod Mangartom
00050000-5589-3298-4d55-2aac550d6505	1358	Log pri Brezovici
00050000-5589-3298-d02b-151678cf84db	1370	Logatec
00050000-5589-3298-60cc-a5b16ec3150b	1371	Logatec
00050000-5589-3298-cc68-96c72b9efff5	1434	Loka pri Zidanem Mostu
00050000-5589-3298-628e-a64a9141ad24	3223	Loka pri Žusmu
00050000-5589-3298-4941-3156fd3574a8	6219	Lokev
00050000-5589-3298-d6a2-0515e2208cb5	1318	Loški Potok
00050000-5589-3298-015b-125f148e90ab	2324	Lovrenc na Dravskem polju
00050000-5589-3298-1869-797bc65c28c1	2344	Lovrenc na Pohorju
00050000-5589-3298-3685-14e3025781ce	3334	Luče
00050000-5589-3298-be60-04c5b0a2cd1c	1225	Lukovica
00050000-5589-3298-2e0f-1628ca2e0c1d	9202	Mačkovci
00050000-5589-3298-d51a-74cbc9a9145d	2322	Majšperk
00050000-5589-3298-c092-c4b008bc3562	2321	Makole
00050000-5589-3298-3aa1-37ff8bdd210d	9243	Mala Nedelja
00050000-5589-3298-2deb-599d8f5cccaa	2229	Malečnik
00050000-5589-3298-5051-488cdb7c7ccd	6273	Marezige
00050000-5589-3298-a1b3-3800fe3ee994	2000	Maribor 
00050000-5589-3298-8664-71d5a658b223	2001	Maribor - poštni predali
00050000-5589-3298-51ca-a2a2f946711f	2206	Marjeta na Dravskem polju
00050000-5589-3298-6e9a-6121f12129df	2281	Markovci
00050000-5589-3298-01a3-f8ac509609d6	9221	Martjanci
00050000-5589-3298-5a69-d5ea832356f7	6242	Materija
00050000-5589-3298-2d02-e3332b4a8655	4211	Mavčiče
00050000-5589-3298-599a-6e77bac838a9	1215	Medvode
00050000-5589-3298-b913-1d978396d1c4	1234	Mengeš
00050000-5589-3298-caec-a9b3472261c8	8330	Metlika
00050000-5589-3298-d5d7-f333eb511654	2392	Mežica
00050000-5589-3298-d11b-e8bf6e927a2a	2204	Miklavž na Dravskem polju
00050000-5589-3298-1f28-4a1345eb4da0	2275	Miklavž pri Ormožu
00050000-5589-3298-3557-9cebe33d4ac6	5291	Miren
00050000-5589-3298-ce7e-b58d6d4f0273	8233	Mirna
00050000-5589-3298-3ebb-29f652300db3	8216	Mirna Peč
00050000-5589-3298-257c-3c359a2423eb	2382	Mislinja
00050000-5589-3298-5415-98be6a5ec8d0	4281	Mojstrana
00050000-5589-3298-aa92-9b600538eb58	8230	Mokronog
00050000-5589-3298-046d-b9cdcb3c5619	1251	Moravče
00050000-5589-3298-bc67-4e1c88bcd017	9226	Moravske Toplice
00050000-5589-3298-3c57-80596841a492	5216	Most na Soči
00050000-5589-3298-61be-cc01a6c6f046	1221	Motnik
00050000-5589-3298-ca97-b5a6bf234ad7	3330	Mozirje
00050000-5589-3298-a0f6-75c2fda323c8	9000	Murska Sobota 
00050000-5589-3298-552f-6b34211dc045	9001	Murska Sobota - poštni predali
00050000-5589-3298-becb-d585d8a89fa1	2366	Muta
00050000-5589-3298-4d12-5d57d1c5681f	4202	Naklo
00050000-5589-3298-560b-10cfdb9d87b7	3331	Nazarje
00050000-5589-3298-88d6-ef7f0a1054f0	1357	Notranje Gorice
00050000-5589-3298-6dfc-8577cc3c9cc8	3203	Nova Cerkev
00050000-5589-3298-3ad0-21d14f163061	5000	Nova Gorica 
00050000-5589-3298-9fae-81c1a3756cce	5001	Nova Gorica - poštni predali
00050000-5589-3298-9d8f-0bfd20f125ea	1385	Nova vas
00050000-5589-3298-5dd0-2387ff62d21c	8000	Novo mesto
00050000-5589-3298-500e-57330ce88f7c	8001	Novo mesto - poštni predali
00050000-5589-3298-f427-53995b50d1b6	6243	Obrov
00050000-5589-3298-20b3-7546c7941e7c	9233	Odranci
00050000-5589-3298-de0a-2a8b212cc5c3	2317	Oplotnica
00050000-5589-3298-9965-548d71ead51a	2312	Orehova vas
00050000-5589-3298-0778-ce0b1806896d	2270	Ormož
00050000-5589-3298-58e3-d4e3ef5fd09d	1316	Ortnek
00050000-5589-3298-354c-9c2d09932f20	1337	Osilnica
00050000-5589-3298-1313-a5a241dff4c2	8222	Otočec
00050000-5589-3298-6530-38415a7c5da1	2361	Ožbalt
00050000-5589-3298-d54b-2b2f2acf7ce6	2231	Pernica
00050000-5589-3298-22fb-299101c7ee5f	2211	Pesnica pri Mariboru
00050000-5589-3298-8797-7fe41ea317e3	9203	Petrovci
00050000-5589-3298-6d31-4b519f485714	3301	Petrovče
00050000-5589-3298-44b6-13c29eea2682	6330	Piran/Pirano
00050000-5589-3298-6255-8c16a8b0d185	8255	Pišece
00050000-5589-3298-6ca2-ee6c0d8d3d21	6257	Pivka
00050000-5589-3298-ab69-e08f70c2744d	6232	Planina
00050000-5589-3298-d3b2-dc033d318ec1	3225	Planina pri Sevnici
00050000-5589-3298-ef8d-1a621f4d45dd	6276	Pobegi
00050000-5589-3298-e6ae-39a4369b97bb	8312	Podbočje
00050000-5589-3298-d5cf-0d0d3991f29e	5243	Podbrdo
00050000-5589-3298-7303-ec1014984aef	3254	Podčetrtek
00050000-5589-3298-f5c1-083440db7b40	2273	Podgorci
00050000-5589-3298-6fdb-0bb863ff40f4	6216	Podgorje
00050000-5589-3298-e170-ee56504d0f72	2381	Podgorje pri Slovenj Gradcu
00050000-5589-3298-f327-127b2d37726e	6244	Podgrad
00050000-5589-3298-a01b-3eee0b713a4f	1414	Podkum
00050000-5589-3298-b264-397522e41957	2286	Podlehnik
00050000-5589-3298-39d8-0b6bc968d133	5272	Podnanos
00050000-5589-3298-9eb6-a2ffdd3bb755	4244	Podnart
00050000-5589-3298-a3cc-779c7acf7ee8	3241	Podplat
00050000-5589-3298-b35c-b2b539a1030d	3257	Podsreda
00050000-5589-3298-1bad-624a97c4d0ac	2363	Podvelka
00050000-5589-3298-2016-05b648ab29c0	2208	Pohorje
00050000-5589-3298-99af-cc2b3169c39e	2257	Polenšak
00050000-5589-3298-af78-8486bdd94724	1355	Polhov Gradec
00050000-5589-3298-4a9a-cb81deae694b	4223	Poljane nad Škofjo Loko
00050000-5589-3298-f438-2a3ad5749336	2319	Poljčane
00050000-5589-3298-55a5-b0183b63597b	1272	Polšnik
00050000-5589-3298-a534-29e07dfd20de	3313	Polzela
00050000-5589-3298-c371-8f36dc253058	3232	Ponikva
00050000-5589-3298-aa6e-96ec5bb55a97	6320	Portorož/Portorose
00050000-5589-3298-5437-53978f6bd4b3	6230	Postojna
00050000-5589-3298-06e3-b05d689ed1e1	2331	Pragersko
00050000-5589-3298-eb53-4802ad2b3332	3312	Prebold
00050000-5589-3298-b4e4-d7cc80dfc116	4205	Preddvor
00050000-5589-3298-1447-a6d828ce6864	6255	Prem
00050000-5589-3298-4a99-19b5bd424e55	1352	Preserje
00050000-5589-3298-771e-530d1c7ab7e9	6258	Prestranek
00050000-5589-3298-ade0-9c1ff54b04d5	2391	Prevalje
00050000-5589-3298-7940-2159485ac1a4	3262	Prevorje
00050000-5589-3298-e98b-dc6818c597f1	1276	Primskovo 
00050000-5589-3298-1d6f-bd7a0f2be97b	3253	Pristava pri Mestinju
00050000-5589-3298-2f94-e5ebbffab8c6	9207	Prosenjakovci/Partosfalva
00050000-5589-3298-f55f-b992949aab59	5297	Prvačina
00050000-5589-3298-4f95-3784f3a6320e	2250	Ptuj
00050000-5589-3298-2686-cbf35c975918	2323	Ptujska Gora
00050000-5589-3298-0a88-2568a40a102c	9201	Puconci
00050000-5589-3298-103a-7a5c1a0d13dd	2327	Rače
00050000-5589-3298-dab2-d225acee5bc6	1433	Radeče
00050000-5589-3298-a33b-95e870d505a6	9252	Radenci
00050000-5589-3298-4c1e-e7373598872a	2360	Radlje ob Dravi
00050000-5589-3298-4e1f-2720ce4ec316	1235	Radomlje
00050000-5589-3298-557e-20c5c7e360ff	4240	Radovljica
00050000-5589-3298-5020-65f536f787f4	8274	Raka
00050000-5589-3298-4423-6711ed816563	1381	Rakek
00050000-5589-3298-d817-f3861f5a28ba	4283	Rateče - Planica
00050000-5589-3298-a7dc-681f223138c0	2390	Ravne na Koroškem
00050000-5589-3298-1bf8-15ff7e4b284d	9246	Razkrižje
00050000-5589-3298-60ab-14fea2ac8704	3332	Rečica ob Savinji
00050000-5589-3298-3f6a-32764b1aa55f	5292	Renče
00050000-5589-3298-145c-40378d53e03b	1310	Ribnica
00050000-5589-3298-ac5f-52161e5f7ac7	2364	Ribnica na Pohorju
00050000-5589-3298-18d1-5b2a57497e2b	3272	Rimske Toplice
00050000-5589-3298-6b2f-ea78b6b41b12	1314	Rob
00050000-5589-3298-526a-6e8e81d17a6c	5215	Ročinj
00050000-5589-3298-954c-179cffafd1ec	3250	Rogaška Slatina
00050000-5589-3298-7b56-4905a29d07dc	9262	Rogašovci
00050000-5589-3298-f457-558cdc922d48	3252	Rogatec
00050000-5589-3298-ff0c-315fe321a732	1373	Rovte
00050000-5589-3298-ca08-4f501798ae42	2342	Ruše
00050000-5589-3298-a66c-752cfa651b42	1282	Sava
00050000-5589-3298-0ac2-0ac0aeb19e41	6333	Sečovlje/Sicciole
00050000-5589-3298-164e-a471d7f9c788	4227	Selca
00050000-5589-3298-14d5-0f48833f162a	2352	Selnica ob Dravi
00050000-5589-3298-41bd-fb2fc8da4e81	8333	Semič
00050000-5589-3298-b4d5-9f5865a2b12d	8281	Senovo
00050000-5589-3298-4c7a-442d186a424a	6224	Senožeče
00050000-5589-3298-ae46-ba0d77a83110	8290	Sevnica
00050000-5589-3298-c0f5-39f3c34e7c40	6210	Sežana
00050000-5589-3298-8026-f86d22f52fe1	2214	Sladki Vrh
00050000-5589-3298-be28-ea41d3041aaf	5283	Slap ob Idrijci
00050000-5589-3298-2f30-3c545612f282	2380	Slovenj Gradec
00050000-5589-3298-eb60-fd24f24662f7	2310	Slovenska Bistrica
00050000-5589-3298-90c0-0e81f2870738	3210	Slovenske Konjice
00050000-5589-3298-fd38-06b0603dd26a	1216	Smlednik
00050000-5589-3298-f8f2-3a74f93b6712	5232	Soča
00050000-5589-3298-d2c7-d83334db7a33	1317	Sodražica
00050000-5589-3299-65cc-7f544040d97a	3335	Solčava
00050000-5589-3299-d319-d43f469af088	5250	Solkan
00050000-5589-3299-827c-eecb746c4374	4229	Sorica
00050000-5589-3299-e866-ce00fb596bd2	4225	Sovodenj
00050000-5589-3299-718b-a3b3a82343c5	5281	Spodnja Idrija
00050000-5589-3299-179a-80d339a1032e	2241	Spodnji Duplek
00050000-5589-3299-821c-2aa22e4452a0	9245	Spodnji Ivanjci
00050000-5589-3299-476e-7c33108f98cd	2277	Središče ob Dravi
00050000-5589-3299-31f2-091cf58d0878	4267	Srednja vas v Bohinju
00050000-5589-3299-890e-e47ba214e400	8256	Sromlje 
00050000-5589-3299-4846-69af1cdccb73	5224	Srpenica
00050000-5589-3299-8d1d-bc2de7168764	1242	Stahovica
00050000-5589-3299-84df-6a232dd2c338	1332	Stara Cerkev
00050000-5589-3299-f56d-4b8d176333ad	8342	Stari trg ob Kolpi
00050000-5589-3299-e17f-0dfe3c01ce40	1386	Stari trg pri Ložu
00050000-5589-3299-8ab7-0d95a5873d0a	2205	Starše
00050000-5589-3299-8608-ea702850e3e0	2289	Stoperce
00050000-5589-3299-629c-75ec1851ab00	8322	Stopiče
00050000-5589-3299-53aa-8c0cf904d643	3206	Stranice
00050000-5589-3299-9ab7-e7478d330202	8351	Straža
00050000-5589-3299-c53e-01ec44cf7362	1313	Struge
00050000-5589-3299-dc70-192b488bdc7b	8293	Studenec
00050000-5589-3299-2530-0fed7d2cc4c0	8331	Suhor
00050000-5589-3299-ee6c-c5c55864a50c	2233	Sv. Ana v Slovenskih goricah
00050000-5589-3299-6102-a27a29da75af	2235	Sv. Trojica v Slovenskih goricah
00050000-5589-3299-a931-ae045f5275ac	2353	Sveti Duh na Ostrem Vrhu
00050000-5589-3299-26c0-7fd040547c00	9244	Sveti Jurij ob Ščavnici
00050000-5589-3299-3fcc-be98e3d018d0	3264	Sveti Štefan
00050000-5589-3299-b770-0aa8530ef09f	2258	Sveti Tomaž
00050000-5589-3299-00e9-81e5ac4132af	9204	Šalovci
00050000-5589-3299-7897-a3b8423f26b6	5261	Šempas
00050000-5589-3299-2c29-5b80316e92ac	5290	Šempeter pri Gorici
00050000-5589-3299-0e1b-de31490049d6	3311	Šempeter v Savinjski dolini
00050000-5589-3299-c07a-c3f3c1a9f208	4208	Šenčur
00050000-5589-3299-f612-031ebfc23997	2212	Šentilj v Slovenskih goricah
00050000-5589-3299-2152-5f5c5431d3f6	8297	Šentjanž
00050000-5589-3299-4f3c-8104b0db42dc	2373	Šentjanž pri Dravogradu
00050000-5589-3299-0bb3-ae96f1ab6f40	8310	Šentjernej
00050000-5589-3299-0384-02c3eb526171	3230	Šentjur
00050000-5589-3299-86f0-5b5f4918a265	3271	Šentrupert
00050000-5589-3299-815e-0a643c22658a	8232	Šentrupert
00050000-5589-3299-34ec-8cc761c3166e	1296	Šentvid pri Stični
00050000-5589-3299-fd85-a3bdebee7bce	8275	Škocjan
00050000-5589-3299-2fb0-0e3873ceab72	6281	Škofije
00050000-5589-3299-a3a7-7abf54e8ddba	4220	Škofja Loka
00050000-5589-3299-1bba-3e31bd56d604	3211	Škofja vas
00050000-5589-3299-7feb-9219bde00f79	1291	Škofljica
00050000-5589-3299-d5eb-844062a90f12	6274	Šmarje
00050000-5589-3299-e317-f7f655e2c257	1293	Šmarje - Sap
00050000-5589-3299-cb9f-9ca2b37705aa	3240	Šmarje pri Jelšah
00050000-5589-3299-268c-2cf957634ea9	8220	Šmarješke Toplice
00050000-5589-3299-def3-341d0990eecd	2315	Šmartno na Pohorju
00050000-5589-3299-43cf-bd5f974e4087	3341	Šmartno ob Dreti
00050000-5589-3299-7e48-91460e7554f1	3327	Šmartno ob Paki
00050000-5589-3299-08e4-56dc43731fa8	1275	Šmartno pri Litiji
00050000-5589-3299-a3e0-939f9e090d7e	2383	Šmartno pri Slovenj Gradcu
00050000-5589-3299-6ba1-83e2356f6691	3201	Šmartno v Rožni dolini
00050000-5589-3299-bb59-7925f404edaa	3325	Šoštanj
00050000-5589-3299-ed91-a71c43b0a8cf	6222	Štanjel
00050000-5589-3299-43b4-39831f9bf482	3220	Štore
00050000-5589-3299-d557-df4fecf47dab	3304	Tabor
00050000-5589-3299-ff9d-c49b377e5d3e	3221	Teharje
00050000-5589-3299-5e84-9505077a2c28	9251	Tišina
00050000-5589-3299-9fcb-59dcc7aad346	5220	Tolmin
00050000-5589-3299-5f71-c2dd2652c053	3326	Topolšica
00050000-5589-3299-62de-38633189354a	2371	Trbonje
00050000-5589-3299-52aa-40142b55d50b	1420	Trbovlje
00050000-5589-3299-c13e-886392d41d0a	8231	Trebelno 
00050000-5589-3299-62b0-b526bde8e23f	8210	Trebnje
00050000-5589-3299-de95-8cac90f10dda	5252	Trnovo pri Gorici
00050000-5589-3299-154a-9d43e28f8947	2254	Trnovska vas
00050000-5589-3299-ac2a-ee27c4ba721c	1222	Trojane
00050000-5589-3299-ef76-fcb16e4c8ad7	1236	Trzin
00050000-5589-3299-adb3-f1c2ac70e861	4290	Tržič
00050000-5589-3299-8522-b86ba942763e	8295	Tržišče
00050000-5589-3299-a27f-65a4176c0381	1311	Turjak
00050000-5589-3299-e80c-6dcca43f98fc	9224	Turnišče
00050000-5589-3299-84ad-7f8ae3ff7d62	8323	Uršna sela
00050000-5589-3299-4072-419d1f67d6e6	1252	Vače
00050000-5589-3299-6e64-7084a52d8b6e	3320	Velenje 
00050000-5589-3299-447c-3915975161dd	3322	Velenje - poštni predali
00050000-5589-3299-3251-22d4abf482a0	8212	Velika Loka
00050000-5589-3299-0525-955f4ed8ec99	2274	Velika Nedelja
00050000-5589-3299-15fb-9ada4e991c9d	9225	Velika Polana
00050000-5589-3299-7081-794851432134	1315	Velike Lašče
00050000-5589-3299-8692-e247b9e6f396	8213	Veliki Gaber
00050000-5589-3299-c975-cea2d509d3e0	9241	Veržej
00050000-5589-3299-1473-a37a159d3643	1312	Videm - Dobrepolje
00050000-5589-3299-4146-827839ac337d	2284	Videm pri Ptuju
00050000-5589-3299-a58f-07c18b186d2f	8344	Vinica
00050000-5589-3299-5da9-74472f7102e3	5271	Vipava
00050000-5589-3299-e8f1-98b010d02240	4212	Visoko
00050000-5589-3299-f95e-57c0db3fbc57	1294	Višnja Gora
00050000-5589-3299-cbbc-2fab55d71961	3205	Vitanje
00050000-5589-3299-778e-a5961229573c	2255	Vitomarci
00050000-5589-3299-cd03-9d01f68b94c3	1217	Vodice
00050000-5589-3299-06b5-a869918b9c73	3212	Vojnik\t
00050000-5589-3299-d751-4354396a5e5f	5293	Volčja Draga
00050000-5589-3299-4a6b-8892b20dc4de	2232	Voličina
00050000-5589-3299-61fd-83de5170fb02	3305	Vransko
00050000-5589-3299-9ef4-eeaa04a3537a	6217	Vremski Britof
00050000-5589-3299-9aec-b05995d98c65	1360	Vrhnika
00050000-5589-3299-2dec-599716abed31	2365	Vuhred
00050000-5589-3299-a9d8-7ac72a552643	2367	Vuzenica
00050000-5589-3299-9148-28f5ee4d9596	8292	Zabukovje 
00050000-5589-3299-e6b1-80c522ac4859	1410	Zagorje ob Savi
00050000-5589-3299-7798-652a17698311	1303	Zagradec
00050000-5589-3299-5445-9664776e7e71	2283	Zavrč
00050000-5589-3299-af95-552f7304fee5	8272	Zdole 
00050000-5589-3299-4175-cefb95b8a4a0	4201	Zgornja Besnica
00050000-5589-3299-a575-2d9611d58374	2242	Zgornja Korena
00050000-5589-3299-8be8-70c2584018ed	2201	Zgornja Kungota
00050000-5589-3299-57d9-368987463b22	2316	Zgornja Ložnica
00050000-5589-3299-974b-48b9b3e7b43d	2314	Zgornja Polskava
00050000-5589-3299-8e85-7304ed6e9e3d	2213	Zgornja Velka
00050000-5589-3299-6561-fdb0666272d1	4247	Zgornje Gorje
00050000-5589-3299-9fe9-1d3a54c6ba60	4206	Zgornje Jezersko
00050000-5589-3299-9e41-9b87b323d367	2285	Zgornji Leskovec
00050000-5589-3299-aa2e-d8bfd6a55ae3	1432	Zidani Most
00050000-5589-3299-4743-3678f6ffd2ec	3214	Zreče
00050000-5589-3299-271e-ebea8b1cf602	4209	Žabnica
00050000-5589-3299-50ad-4daaee8b2e60	3310	Žalec
00050000-5589-3299-0260-4c953cff9883	4228	Železniki
00050000-5589-3299-44a9-b652e14bd89c	2287	Žetale
00050000-5589-3299-55d6-d71f84581b1d	4226	Žiri
00050000-5589-3299-5d82-ea493503da45	4274	Žirovnica
00050000-5589-3299-1ab2-2cac15deec70	8360	Žužemberk
\.


--
-- TOC entry 2869 (class 0 OID 7990956)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 7990767)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 7990845)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2871 (class 0 OID 7990968)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 7991088)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantieme, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2888 (class 0 OID 7991141)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5589-329a-6dbf-91fd96a28a3f	00080000-5589-329a-13fe-f4483af8ab1a	0900	AK
00190000-5589-329a-7ca0-4938d71e2a8c	00080000-5589-329a-111e-1f71f9cc8c66	0987	A
00190000-5589-329a-1093-d14be38e8d45	00080000-5589-329a-352a-dea3bbcf52c0	0989	A
\.


--
-- TOC entry 2895 (class 0 OID 7991277)
-- Dependencies: 232
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 7936450)
-- Dependencies: 175
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2837 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2875 (class 0 OID 7990997)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5589-329a-92e9-e98192c8d745	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5589-329a-b5ff-3792b9dfd51c	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5589-329a-7f93-f2ae2f58faf0	0003	Kazinska	t	84	Kazinska dvorana
00220000-5589-329a-32fc-ac0723bd5246	0004	Mali oder	t	24	Mali oder 
00220000-5589-329a-f030-eb1b5e647138	0005	Komorni oder	t	15	Komorni oder
00220000-5589-329a-5367-817d9657cb08	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5589-329a-545d-8af7943565ad	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2867 (class 0 OID 7990941)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 7990931)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 7991130)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 7991065)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 7990639)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2876 (class 0 OID 7991007)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2844 (class 0 OID 7990677)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5589-3298-b469-958113b8baad	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5589-3298-e842-22631ecf075c	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5589-3298-1e07-87c90b052b36	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5589-3298-e7ac-1062bff8bcc3	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5589-3298-c65a-772e30c3a839	planer	Planer dogodkov v koledarju	t
00020000-5589-3298-9e9f-1fe0a9f47683	kadrovska	Kadrovska služba	t
00020000-5589-3298-e4f2-931f7e310c37	arhivar	Ažuriranje arhivalij	t
00020000-5589-3298-94a9-ea8a0bed9444	igralec	Igralec	t
00020000-5589-3298-d5e6-747c34fcfe13	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5589-329a-8d44-15cfbfec4c73	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2842 (class 0 OID 7990661)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5589-3298-6dc5-6ffc8e97b906	00020000-5589-3298-1e07-87c90b052b36
00010000-5589-3298-c89b-f5e98959c6f4	00020000-5589-3298-1e07-87c90b052b36
00010000-5589-329a-7be8-2eea34749fcb	00020000-5589-329a-8d44-15cfbfec4c73
\.


--
-- TOC entry 2878 (class 0 OID 7991021)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 7990962)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 7990912)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 7991314)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5589-3299-1d01-0d41cb7fadf5	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5589-3299-b975-3d068ee28690	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5589-3299-13ec-423f28fa23f2	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5589-3299-8b9e-7297c929600d	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5589-3299-e388-a947ea1ff8f4	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2898 (class 0 OID 7991306)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5589-3299-c977-7b7b34755172	00230000-5589-3299-8b9e-7297c929600d	popa
00240000-5589-3299-b5e6-fd09ac8ba691	00230000-5589-3299-8b9e-7297c929600d	oseba
00240000-5589-3299-6b79-33aaa962738f	00230000-5589-3299-b975-3d068ee28690	prostor
00240000-5589-3299-75e5-e178555936c3	00230000-5589-3299-8b9e-7297c929600d	besedilo
00240000-5589-3299-8d86-b3ec469c4e06	00230000-5589-3299-8b9e-7297c929600d	uprizoritev
00240000-5589-3299-8d29-c9cb056d24c4	00230000-5589-3299-8b9e-7297c929600d	funkcija
00240000-5589-3299-cde1-857833681f7e	00230000-5589-3299-8b9e-7297c929600d	tipfunkcije
00240000-5589-3299-73db-2495daf1be4b	00230000-5589-3299-8b9e-7297c929600d	alternacija
00240000-5589-3299-03d2-139135bcc1d6	00230000-5589-3299-1d01-0d41cb7fadf5	pogodba
00240000-5589-3299-8cc5-df77bed85bc7	00230000-5589-3299-8b9e-7297c929600d	zaposlitev
\.


--
-- TOC entry 2897 (class 0 OID 7991301)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 7991075)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5589-329a-a974-208f046f6e51	000e0000-5589-329a-1b07-fcc3ffcd5782	00080000-5589-329a-9550-c59bce52fedc	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5589-329a-113f-10280e774d8c	000e0000-5589-329a-1b07-fcc3ffcd5782	00080000-5589-329a-9550-c59bce52fedc	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5589-329a-9a26-af6d2e8a389d	000e0000-5589-329a-1b07-fcc3ffcd5782	00080000-5589-329a-38a0-b7abbcb42312	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2849 (class 0 OID 7990739)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 7990918)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5589-329a-11ba-70782374d757	00180000-5589-329a-160a-827e81c27952	000c0000-5589-329a-80f5-0f80113f0226	00090000-5589-329a-5976-fe8b200dcfae	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5589-329a-bdaa-9daa5daa95b9	00180000-5589-329a-160a-827e81c27952	000c0000-5589-329a-2a19-d6a4cf07fbfa	00090000-5589-329a-26c9-181abbdb282c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5589-329a-5ae5-474e11d8952b	00180000-5589-329a-160a-827e81c27952	000c0000-5589-329a-449f-f3050f94f8ca	00090000-5589-329a-2909-fca6c3d55f3a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5589-329a-e4ad-c38ec652619a	00180000-5589-329a-160a-827e81c27952	000c0000-5589-329a-449e-f5e8bd21f75e	00090000-5589-329a-af08-e5fba2e8c95a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5589-329a-0630-237f44604f7f	00180000-5589-329a-160a-827e81c27952	000c0000-5589-329a-05a9-bc14d16e3369	00090000-5589-329a-f070-a8c6c0d6dc5b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5589-329a-2949-7235965756cb	00180000-5589-329a-eb9b-03405c8d8c9d	\N	00090000-5589-329a-f070-a8c6c0d6dc5b	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2886 (class 0 OID 7991119)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5589-3299-2b46-b499e1f8dda5	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5589-3299-6539-a8d28b51c2c2	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5589-3299-1ed8-8d5da837c95a	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5589-3299-2cd7-2483185674b1	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5589-3299-01c2-a0e3eb22f8c8	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5589-3299-7c64-58adcb58626e	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5589-3299-ca57-60a12bc73d86	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5589-3299-8804-fc2e2f6d3742	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5589-3299-0b0b-2b42a9107ce5	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5589-3299-233b-a6d907e17e6f	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5589-3299-1e89-e4c2d9061d54	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5589-3299-0f30-dd99a140f99c	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5589-3299-9e35-ea317b1bd793	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5589-3299-e9ed-fdfe0e3df1db	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5589-3299-9b9a-bb89935a2866	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5589-3299-2659-eaa73fa7ddb2	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2896 (class 0 OID 7991290)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5589-3299-2724-8a9a741c1533	01	Velika predstava	f	1.00	1.00
002b0000-5589-3299-f103-f21f758b1bb5	02	Mala predstava	f	0.50	0.50
002b0000-5589-3299-a55e-9b0fc5f36c46	03	Mala koprodukcija	t	0.40	1.00
002b0000-5589-3299-d249-ba3744381b97	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5589-3299-8cd9-64b59abb7054	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2854 (class 0 OID 7990802)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 7990648)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5589-3298-c89b-f5e98959c6f4	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRODki99NXYjtXDWOkSaUYq0sh76yHnhdG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5589-329a-f3cd-150c44cb36e9	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5589-329a-2e60-95a93c010343	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5589-329a-7d6b-c324ffaf2de7	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5589-329a-5c1e-a1140e803a95	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5589-329a-6165-be5937f1b15c	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5589-329a-0302-850cf713ded7	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5589-329a-2ad7-a750cbf3bef3	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5589-329a-4efb-8280a6754857	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5589-329a-02b8-9cfe67d962ec	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5589-329a-7be8-2eea34749fcb	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5589-3298-6dc5-6ffc8e97b906	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2891 (class 0 OID 7991176)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5589-329a-8d4f-234990ac1a48	00160000-5589-3299-13a3-f7fd34dd9154	00150000-5589-3299-55ea-28ac0de3b5be	00140000-5589-3298-204d-242a7367f12e	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5589-329a-f030-eb1b5e647138
000e0000-5589-329a-1b07-fcc3ffcd5782	00160000-5589-3299-2147-cf169b610564	00150000-5589-3299-3287-5f3679e93d05	00140000-5589-3298-5703-6c5832a10def	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5589-329a-5367-817d9657cb08
000e0000-5589-329a-cf59-4f32f0637fec	\N	00150000-5589-3299-3287-5f3679e93d05	00140000-5589-3298-5703-6c5832a10def	00190000-5589-329a-7ca0-4938d71e2a8c	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5589-329a-f030-eb1b5e647138
000e0000-5589-329a-86e0-1ba230252a18	\N	00150000-5589-3299-3287-5f3679e93d05	00140000-5589-3298-5703-6c5832a10def	00190000-5589-329a-7ca0-4938d71e2a8c	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5589-329a-f030-eb1b5e647138
\.


--
-- TOC entry 2859 (class 0 OID 7990864)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5589-329a-57ef-9305644a444e	000e0000-5589-329a-1b07-fcc3ffcd5782	1	
00200000-5589-329a-b75c-cd360c12d2dd	000e0000-5589-329a-1b07-fcc3ffcd5782	2	
\.


--
-- TOC entry 2874 (class 0 OID 7990989)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 7991058)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 7990896)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 7991166)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5589-3298-204d-242a7367f12e	01	Drama	drama (SURS 01)
00140000-5589-3298-f1c1-3b20436deb10	02	Opera	opera (SURS 02)
00140000-5589-3298-0d21-43f43d86f7e7	03	Balet	balet (SURS 03)
00140000-5589-3298-411d-f00e4278dd6a	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5589-3298-c48a-264800e16789	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5589-3298-5703-6c5832a10def	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5589-3298-cea4-29cd7ed05cf5	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2880 (class 0 OID 7991048)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5589-3299-1029-f8f303c07c1b	01	Opera	opera
00150000-5589-3299-9be2-09f5935e1df7	02	Opereta	opereta
00150000-5589-3299-3d9d-dfbfff59f80c	03	Balet	balet
00150000-5589-3299-d0b3-5552e65423c9	04	Plesne prireditve	plesne prireditve
00150000-5589-3299-d773-88a9bba5a051	05	Lutkovno gledališče	lutkovno gledališče
00150000-5589-3299-d39c-bf2447a55f16	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5589-3299-dbe2-afce8c15c62e	07	Biografska drama	biografska drama
00150000-5589-3299-55ea-28ac0de3b5be	08	Komedija	komedija
00150000-5589-3299-3aab-f824f3955d23	09	Črna komedija	črna komedija
00150000-5589-3299-f80e-b75641f0032a	10	E-igra	E-igra
00150000-5589-3299-3287-5f3679e93d05	11	Kriminalka	kriminalka
00150000-5589-3299-cbf2-085a853d1b93	12	Musical	musical
\.


--
-- TOC entry 2435 (class 2606 OID 7990702)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 7991223)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 7991213)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 7991118)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 7990886)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 7990911)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 7990828)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 7991272)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 7991044)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 7990862)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 7990905)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 7990842)
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
-- TOC entry 2527 (class 2606 OID 7990954)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 7990981)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 7990800)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 7990711)
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
-- TOC entry 2442 (class 2606 OID 7990735)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 7990691)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2426 (class 2606 OID 7990676)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 7990987)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 7991020)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 7991161)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2451 (class 2606 OID 7990764)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 7990788)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 7990960)
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
-- TOC entry 2457 (class 2606 OID 7990778)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 7990849)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 7990972)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 7991100)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 7991146)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 7991288)
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
-- TOC entry 2547 (class 2606 OID 7991004)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 7990945)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 7990936)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 7991140)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 7991072)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 7990647)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 7991011)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 7990665)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2428 (class 2606 OID 7990685)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 7991029)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 7990967)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 7990917)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 7991323)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 7991311)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 7991305)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 7991085)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 7990744)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 7990927)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 7991129)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 7991300)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 7990813)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 7990660)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 7991192)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 7990871)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 7990995)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 7991063)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 7990900)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 7991174)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 7991056)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 1259 OID 7990893)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2575 (class 1259 OID 7991086)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2576 (class 1259 OID 7991087)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2449 (class 1259 OID 7990766)
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
-- TOC entry 2540 (class 1259 OID 7990988)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2534 (class 1259 OID 7990974)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2535 (class 1259 OID 7990973)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2486 (class 1259 OID 7990872)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2562 (class 1259 OID 7991045)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2563 (class 1259 OID 7991047)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2564 (class 1259 OID 7991046)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2474 (class 1259 OID 7990844)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2475 (class 1259 OID 7990843)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 7991163)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 7991164)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2595 (class 1259 OID 7991165)
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
-- TOC entry 2602 (class 1259 OID 7991197)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2603 (class 1259 OID 7991194)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2604 (class 1259 OID 7991198)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2605 (class 1259 OID 7991196)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2606 (class 1259 OID 7991195)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2464 (class 1259 OID 7990815)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 7990814)
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
-- TOC entry 2440 (class 1259 OID 7990738)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2550 (class 1259 OID 7991012)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2504 (class 1259 OID 7990906)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2430 (class 1259 OID 7990692)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2431 (class 1259 OID 7990693)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2555 (class 1259 OID 7991032)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2556 (class 1259 OID 7991031)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2557 (class 1259 OID 7991030)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2478 (class 1259 OID 7990850)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2479 (class 1259 OID 7990852)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2480 (class 1259 OID 7990851)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2635 (class 1259 OID 7991313)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2514 (class 1259 OID 7990940)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2515 (class 1259 OID 7990938)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2516 (class 1259 OID 7990937)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2517 (class 1259 OID 7990939)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2421 (class 1259 OID 7990666)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2422 (class 1259 OID 7990667)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2543 (class 1259 OID 7990996)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2529 (class 1259 OID 7990961)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2571 (class 1259 OID 7991073)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2572 (class 1259 OID 7991074)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2624 (class 1259 OID 7991276)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2625 (class 1259 OID 7991273)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2626 (class 1259 OID 7991274)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2627 (class 1259 OID 7991275)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2453 (class 1259 OID 7990780)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2454 (class 1259 OID 7990779)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2455 (class 1259 OID 7990781)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2414 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2579 (class 1259 OID 7991101)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2580 (class 1259 OID 7991102)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2616 (class 1259 OID 7991227)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2617 (class 1259 OID 7991229)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2618 (class 1259 OID 7991225)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2619 (class 1259 OID 7991228)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2620 (class 1259 OID 7991226)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2568 (class 1259 OID 7991064)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 7990949)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2521 (class 1259 OID 7990948)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2522 (class 1259 OID 7990946)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2523 (class 1259 OID 7990947)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2392 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2612 (class 1259 OID 7991215)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2613 (class 1259 OID 7991214)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2628 (class 1259 OID 7991289)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2485 (class 1259 OID 7990863)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2436 (class 1259 OID 7990713)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2437 (class 1259 OID 7990712)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2445 (class 1259 OID 7990745)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2446 (class 1259 OID 7990746)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2509 (class 1259 OID 7990930)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2510 (class 1259 OID 7990929)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2511 (class 1259 OID 7990928)
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
-- TOC entry 2492 (class 1259 OID 7990895)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2493 (class 1259 OID 7990891)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2494 (class 1259 OID 7990888)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2495 (class 1259 OID 7990889)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2496 (class 1259 OID 7990887)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2497 (class 1259 OID 7990892)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2498 (class 1259 OID 7990890)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2452 (class 1259 OID 7990765)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 7990829)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 7990831)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2472 (class 1259 OID 7990830)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2473 (class 1259 OID 7990832)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2528 (class 1259 OID 7990955)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2598 (class 1259 OID 7991162)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2607 (class 1259 OID 7991193)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2443 (class 1259 OID 7990736)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2444 (class 1259 OID 7990737)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2565 (class 1259 OID 7991057)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2641 (class 1259 OID 7991324)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2463 (class 1259 OID 7990801)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2638 (class 1259 OID 7991312)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2548 (class 1259 OID 7991006)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2549 (class 1259 OID 7991005)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 7991224)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2395 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2460 (class 1259 OID 7990789)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2599 (class 1259 OID 7991175)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 7991147)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 7991148)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2429 (class 1259 OID 7990686)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2499 (class 1259 OID 7990894)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2667 (class 2606 OID 7991460)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2670 (class 2606 OID 7991445)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2669 (class 2606 OID 7991450)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2665 (class 2606 OID 7991470)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2671 (class 2606 OID 7991440)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2666 (class 2606 OID 7991465)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2668 (class 2606 OID 7991455)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2701 (class 2606 OID 7991615)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2700 (class 2606 OID 7991620)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2652 (class 2606 OID 7991375)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2688 (class 2606 OID 7991555)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2686 (class 2606 OID 7991550)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2687 (class 2606 OID 7991545)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2664 (class 2606 OID 7991435)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2696 (class 2606 OID 7991585)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2694 (class 2606 OID 7991595)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2695 (class 2606 OID 7991590)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2658 (class 2606 OID 7991410)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2659 (class 2606 OID 7991405)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2684 (class 2606 OID 7991535)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2707 (class 2606 OID 7991640)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2706 (class 2606 OID 7991645)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2705 (class 2606 OID 7991650)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2709 (class 2606 OID 7991670)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2712 (class 2606 OID 7991655)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2708 (class 2606 OID 7991675)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2710 (class 2606 OID 7991665)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2711 (class 2606 OID 7991660)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2656 (class 2606 OID 7991400)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2657 (class 2606 OID 7991395)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2648 (class 2606 OID 7991360)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2649 (class 2606 OID 7991355)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2690 (class 2606 OID 7991565)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2672 (class 2606 OID 7991475)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2645 (class 2606 OID 7991335)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2644 (class 2606 OID 7991340)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2691 (class 2606 OID 7991580)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2692 (class 2606 OID 7991575)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2693 (class 2606 OID 7991570)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2662 (class 2606 OID 7991415)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2660 (class 2606 OID 7991425)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2661 (class 2606 OID 7991420)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2725 (class 2606 OID 7991740)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2676 (class 2606 OID 7991510)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2678 (class 2606 OID 7991500)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2679 (class 2606 OID 7991495)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2677 (class 2606 OID 7991505)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2643 (class 2606 OID 7991325)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2642 (class 2606 OID 7991330)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2689 (class 2606 OID 7991560)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2685 (class 2606 OID 7991540)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2699 (class 2606 OID 7991605)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2698 (class 2606 OID 7991610)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2720 (class 2606 OID 7991730)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2723 (class 2606 OID 7991715)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2722 (class 2606 OID 7991720)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2721 (class 2606 OID 7991725)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2654 (class 2606 OID 7991385)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2655 (class 2606 OID 7991380)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2653 (class 2606 OID 7991390)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2703 (class 2606 OID 7991625)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2702 (class 2606 OID 7991630)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2717 (class 2606 OID 7991700)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2715 (class 2606 OID 7991710)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2719 (class 2606 OID 7991690)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2716 (class 2606 OID 7991705)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2718 (class 2606 OID 7991695)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2697 (class 2606 OID 7991600)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2680 (class 2606 OID 7991530)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2681 (class 2606 OID 7991525)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2683 (class 2606 OID 7991515)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2682 (class 2606 OID 7991520)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2713 (class 2606 OID 7991685)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2714 (class 2606 OID 7991680)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2724 (class 2606 OID 7991735)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2663 (class 2606 OID 7991430)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2704 (class 2606 OID 7991635)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2646 (class 2606 OID 7991350)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2647 (class 2606 OID 7991345)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2651 (class 2606 OID 7991365)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2650 (class 2606 OID 7991370)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2673 (class 2606 OID 7991490)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2674 (class 2606 OID 7991485)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2675 (class 2606 OID 7991480)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-06-23 12:19:07 CEST

--
-- PostgreSQL database dump complete
--

