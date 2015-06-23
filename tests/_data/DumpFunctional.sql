--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-23 16:19:23 CEST

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
-- TOC entry 183 (class 1259 OID 8090190)
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
-- TOC entry 230 (class 1259 OID 8090712)
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
-- TOC entry 229 (class 1259 OID 8090695)
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
-- TOC entry 222 (class 1259 OID 8090599)
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
-- TOC entry 197 (class 1259 OID 8090369)
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
-- TOC entry 200 (class 1259 OID 8090403)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8090796)
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
-- TOC entry 192 (class 1259 OID 8090312)
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
-- TOC entry 231 (class 1259 OID 8090726)
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
-- TOC entry 216 (class 1259 OID 8090529)
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
-- TOC entry 195 (class 1259 OID 8090349)
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
-- TOC entry 199 (class 1259 OID 8090397)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8090329)
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
-- TOC entry 205 (class 1259 OID 8090446)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8090471)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8090286)
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
-- TOC entry 184 (class 1259 OID 8090199)
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
-- TOC entry 185 (class 1259 OID 8090210)
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
-- TOC entry 180 (class 1259 OID 8090164)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8090183)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8090478)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8090509)
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
-- TOC entry 226 (class 1259 OID 8090645)
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
-- TOC entry 187 (class 1259 OID 8090243)
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
-- TOC entry 189 (class 1259 OID 8090278)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8090452)
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
-- TOC entry 188 (class 1259 OID 8090263)
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
-- TOC entry 194 (class 1259 OID 8090341)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8090464)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8090584)
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
-- TOC entry 225 (class 1259 OID 8090637)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8090772)
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
-- TOC entry 212 (class 1259 OID 8090493)
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
-- TOC entry 204 (class 1259 OID 8090437)
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
-- TOC entry 203 (class 1259 OID 8090427)
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
-- TOC entry 224 (class 1259 OID 8090626)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8090561)
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
-- TOC entry 177 (class 1259 OID 8090135)
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
-- TOC entry 176 (class 1259 OID 8090133)
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
-- TOC entry 213 (class 1259 OID 8090503)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8090173)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8090157)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8090517)
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
-- TOC entry 207 (class 1259 OID 8090458)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8090408)
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
-- TOC entry 237 (class 1259 OID 8090816)
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
-- TOC entry 236 (class 1259 OID 8090808)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8090803)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8090571)
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
-- TOC entry 186 (class 1259 OID 8090235)
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
-- TOC entry 202 (class 1259 OID 8090414)
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
-- TOC entry 223 (class 1259 OID 8090615)
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
-- TOC entry 233 (class 1259 OID 8090785)
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
-- TOC entry 191 (class 1259 OID 8090298)
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
-- TOC entry 178 (class 1259 OID 8090144)
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
-- TOC entry 228 (class 1259 OID 8090672)
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
-- TOC entry 196 (class 1259 OID 8090360)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8090485)
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
-- TOC entry 218 (class 1259 OID 8090554)
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
-- TOC entry 198 (class 1259 OID 8090392)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8090662)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8090544)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8090138)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2854 (class 0 OID 8090190)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 8090712)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5589-6aea-a574-aa0e4f43731c	000d0000-5589-6aea-0f2b-9c798c306f2d	\N	00090000-5589-6aea-9bd6-fbdadcdfab2c	\N	000b0000-5589-6aea-0ac6-c4c1432e1be5	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5589-6aea-5ddc-27cf76b25090	000d0000-5589-6aea-5c0d-8253eaa055dc	\N	00090000-5589-6aea-38f1-78bb3ba39147	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5589-6aea-81dc-339a03c8c91a	000d0000-5589-6aea-a95c-70d510b67b1f	\N	00090000-5589-6aea-a615-f3e5be25e7c2	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5589-6aea-feb1-ce13f25e7de3	000d0000-5589-6aea-d74c-93b9dfb90bb3	\N	00090000-5589-6aea-fb31-74d7dbc419c8	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5589-6aea-559e-71247ee8d4f8	000d0000-5589-6aea-d4a2-9231f557b3b5	\N	00090000-5589-6aea-0e77-a1eca2959303	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5589-6aea-6c28-33b50aba8dac	000d0000-5589-6aea-5ca4-736746f49386	\N	00090000-5589-6aea-38f1-78bb3ba39147	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2900 (class 0 OID 8090695)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 8090599)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5589-6aea-e83d-72884e2af08f	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5589-6aea-c290-c82e0b77ca73	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5589-6aea-0501-6d4f0f961392	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2868 (class 0 OID 8090369)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5589-6aea-49f6-c5414fbaeac1	\N	\N	00200000-5589-6aea-4ff2-a5a312127ada	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5589-6aea-7e20-4b67c5421cac	\N	\N	00200000-5589-6aea-10eb-62d8bf993dcc	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5589-6aea-3058-7ac6cb95cbe9	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5589-6aea-b9c3-aa7ca1a5ec28	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5589-6aea-3d3d-b5d0105747cd	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2871 (class 0 OID 8090403)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 8090796)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8090312)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5589-6ae9-3ab5-d30cbd883182	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5589-6ae9-4235-79a16c086339	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5589-6ae9-160e-a22c428d0986	AL	ALB	008	Albania 	Albanija	\N
00040000-5589-6ae9-e3cc-82499990b8a6	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5589-6ae9-b489-e5d5273c88d4	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5589-6ae9-37cd-a6ade8fcb708	AD	AND	020	Andorra 	Andora	\N
00040000-5589-6ae9-8c8f-5de718bfd556	AO	AGO	024	Angola 	Angola	\N
00040000-5589-6ae9-0ebe-274f92bb2398	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5589-6ae9-9031-cb1894c808d5	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5589-6ae9-e547-900dbefb9ffc	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5589-6ae9-6480-eb25d1bd9891	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5589-6ae9-3340-34be88f9a860	AM	ARM	051	Armenia 	Armenija	\N
00040000-5589-6ae9-6871-1a4e2360b47d	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5589-6ae9-27cb-c60aa5222459	AU	AUS	036	Australia 	Avstralija	\N
00040000-5589-6ae9-6890-8eac4846eb17	AT	AUT	040	Austria 	Avstrija	\N
00040000-5589-6ae9-373a-99ef764ce496	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5589-6ae9-6506-5e8e81bbfd96	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5589-6ae9-19cb-7df045f6b215	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5589-6ae9-dd3d-cd8591577700	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5589-6ae9-af39-86ad055f55d5	BB	BRB	052	Barbados 	Barbados	\N
00040000-5589-6ae9-1fd1-a554f2dfe282	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5589-6ae9-125f-5d37ac16ef2e	BE	BEL	056	Belgium 	Belgija	\N
00040000-5589-6ae9-9b6f-b8527f12ad5e	BZ	BLZ	084	Belize 	Belize	\N
00040000-5589-6ae9-26be-f054add32e1e	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5589-6ae9-4eaa-d3489c86b7b9	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5589-6ae9-8cf5-2e094fdf48d8	BT	BTN	064	Bhutan 	Butan	\N
00040000-5589-6ae9-9a0e-3f70e9d8dc8b	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5589-6ae9-541d-c65c78b002ef	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5589-6ae9-5a1d-67ec77c677f3	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5589-6ae9-e1af-5f4c185ad9e6	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5589-6ae9-0fc5-3f03cddd2727	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5589-6ae9-b219-a3e55644dc24	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5589-6ae9-7505-3a16a0efc1c0	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5589-6ae9-5bec-342b3c18b22d	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5589-6ae9-b042-45074cf6718a	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5589-6ae9-2a60-eaaa06843334	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5589-6ae9-649d-d4bf46b6efb1	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5589-6ae9-b49b-d39a454231ff	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5589-6ae9-69c4-d14f1ae87a86	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5589-6ae9-218f-ef521dc54fa5	CA	CAN	124	Canada 	Kanada	\N
00040000-5589-6ae9-f41c-61fef03e89b6	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5589-6ae9-9761-ed1d42f0899c	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5589-6ae9-5106-d67cd903c044	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5589-6ae9-cb33-9eece94df379	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5589-6ae9-71aa-ef8e432f3f35	CL	CHL	152	Chile 	Čile	\N
00040000-5589-6ae9-ac8c-ad88f749e72e	CN	CHN	156	China 	Kitajska	\N
00040000-5589-6ae9-3f57-72f769f7d4e1	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5589-6ae9-c75e-97492e7f23e3	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5589-6ae9-9867-433f2e547493	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5589-6ae9-d0f3-f1c3358d7bc1	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5589-6ae9-ce08-8f56c05d07aa	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5589-6ae9-72a3-075be118f797	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5589-6ae9-a60a-aece67a4c57e	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5589-6ae9-6f81-065f2d186c88	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5589-6ae9-c18c-edafe3068777	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5589-6ae9-cfd3-7c33423e7f01	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5589-6ae9-d6ad-86e32656729b	CU	CUB	192	Cuba 	Kuba	\N
00040000-5589-6ae9-0114-fc1180638265	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5589-6ae9-3600-b1c68de84b46	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5589-6ae9-4ef1-8091113d8842	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5589-6ae9-9e36-548f5c5e8371	DK	DNK	208	Denmark 	Danska	\N
00040000-5589-6ae9-492c-e212b07391b4	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5589-6ae9-9d69-be4c3dd98a2a	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5589-6ae9-3202-370b3897b909	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5589-6ae9-fc7c-82950b6bfe04	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5589-6ae9-a763-4f5944f0b409	EG	EGY	818	Egypt 	Egipt	\N
00040000-5589-6ae9-6dbd-9335d4dc6533	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5589-6ae9-002e-18a8d876cb03	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5589-6ae9-ac62-5b5cf7fde489	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5589-6ae9-7992-08a8db75716f	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5589-6ae9-90c9-9da2fd2e0ee0	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5589-6ae9-d4a1-f121e3b4bb6f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5589-6ae9-9138-695552aae01f	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5589-6ae9-09e9-4371feb8cef9	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5589-6ae9-47b5-8a920da9311d	FI	FIN	246	Finland 	Finska	\N
00040000-5589-6ae9-584d-1d5be9a1ad6d	FR	FRA	250	France 	Francija	\N
00040000-5589-6ae9-5231-db284eb19a45	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5589-6ae9-c23a-477c9013b7a7	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5589-6ae9-dfb6-415857143005	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5589-6ae9-81cf-13b86a63ffd4	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5589-6ae9-d038-6a7c6f5def55	GA	GAB	266	Gabon 	Gabon	\N
00040000-5589-6ae9-1217-c802823d77fd	GM	GMB	270	Gambia 	Gambija	\N
00040000-5589-6ae9-6f27-d7e784bd11a1	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5589-6ae9-ddfb-e0efefc6ffa3	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5589-6ae9-5b83-9b9f9d1b00c1	GH	GHA	288	Ghana 	Gana	\N
00040000-5589-6ae9-a912-74705752eea2	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5589-6ae9-09ab-f5b912acca86	GR	GRC	300	Greece 	Grčija	\N
00040000-5589-6ae9-b85d-94b46cdcd606	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5589-6ae9-7d70-cd5dda768de5	GD	GRD	308	Grenada 	Grenada	\N
00040000-5589-6ae9-c002-cab5cd336fa9	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5589-6ae9-91c8-98bece0bcc94	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5589-6ae9-0301-062cf3a4430a	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5589-6ae9-c04d-876f14c2b984	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5589-6ae9-f189-f2438025ea07	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5589-6ae9-129e-010dcb247dd0	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5589-6ae9-bf30-360a57519970	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5589-6ae9-bca5-d93e6809b757	HT	HTI	332	Haiti 	Haiti	\N
00040000-5589-6ae9-f297-bce3174e281c	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5589-6ae9-90fe-c1699d690783	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5589-6ae9-3b68-059eda8c3008	HN	HND	340	Honduras 	Honduras	\N
00040000-5589-6ae9-7f89-3c75545424c9	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5589-6ae9-e216-67e7ec11df8b	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5589-6ae9-bb27-3e04834cdda4	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5589-6ae9-34f2-e4b702d5be88	IN	IND	356	India 	Indija	\N
00040000-5589-6ae9-41a2-04345941c22f	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5589-6ae9-1c24-c2429884de81	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5589-6ae9-8ecf-2ce3ba64e917	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5589-6ae9-91e3-8fca510a88f1	IE	IRL	372	Ireland 	Irska	\N
00040000-5589-6ae9-74f7-f1982fda402c	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5589-6ae9-32c7-d81648c54941	IL	ISR	376	Israel 	Izrael	\N
00040000-5589-6ae9-b25a-d32c684e56e6	IT	ITA	380	Italy 	Italija	\N
00040000-5589-6ae9-dfe1-4abf86a484b8	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5589-6ae9-c796-98418eb502a2	JP	JPN	392	Japan 	Japonska	\N
00040000-5589-6ae9-d0b8-80cf12ba889b	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5589-6ae9-fee6-9c294e59d4c6	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5589-6ae9-aff3-2d531974ebde	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5589-6ae9-abf5-6cac62125f86	KE	KEN	404	Kenya 	Kenija	\N
00040000-5589-6ae9-1317-d061341cd0c2	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5589-6ae9-952a-9fdca0eb35ab	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5589-6ae9-4b7b-c14199f1640d	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5589-6ae9-cad9-2724ad5e0f38	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5589-6ae9-5858-65a1e0da5eee	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5589-6ae9-9d41-aafb49439041	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5589-6ae9-c549-c354b39addc2	LV	LVA	428	Latvia 	Latvija	\N
00040000-5589-6ae9-7aea-ffa978082ecb	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5589-6ae9-aba0-bef991ec646d	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5589-6ae9-ca16-e55ef153b06c	LR	LBR	430	Liberia 	Liberija	\N
00040000-5589-6ae9-7ae8-1269bec6c6c2	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5589-6ae9-f4ec-2ad55cdca658	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5589-6ae9-88d3-1f78168ffff4	LT	LTU	440	Lithuania 	Litva	\N
00040000-5589-6ae9-bd90-754970334c24	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5589-6ae9-4427-64468976efe5	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5589-6ae9-9143-55f6b116c099	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5589-6ae9-0ea1-abdb2577dfe6	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5589-6ae9-92a5-d2d7073f987a	MW	MWI	454	Malawi 	Malavi	\N
00040000-5589-6ae9-0b67-df6893a8167a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5589-6ae9-cac1-9d63b0d44de0	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5589-6ae9-45c6-30acd210b622	ML	MLI	466	Mali 	Mali	\N
00040000-5589-6ae9-3912-b67fb35c17bd	MT	MLT	470	Malta 	Malta	\N
00040000-5589-6ae9-6901-cca17708e60c	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5589-6ae9-4fdf-40665580002b	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5589-6ae9-5053-7712117f49d0	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5589-6ae9-6d73-e10cf5af610a	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5589-6ae9-c51f-7db9299463f2	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5589-6ae9-d56f-888125ada5bb	MX	MEX	484	Mexico 	Mehika	\N
00040000-5589-6ae9-6c02-a55024e30e65	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5589-6ae9-0a88-da2e9196e754	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5589-6ae9-3d38-b7497364cad4	MC	MCO	492	Monaco 	Monako	\N
00040000-5589-6ae9-8feb-f78944db00dc	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5589-6ae9-c81f-6bad92ab6dc7	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5589-6ae9-34a0-b6ea9c3fed31	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5589-6ae9-10ae-ab4718f61e86	MA	MAR	504	Morocco 	Maroko	\N
00040000-5589-6ae9-a868-4c2442b4cdb9	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5589-6ae9-182b-f0301fb8414d	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5589-6ae9-b2d9-4a7e50710935	NA	NAM	516	Namibia 	Namibija	\N
00040000-5589-6ae9-04f9-63d56f74dc0a	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5589-6ae9-81d1-a1920ed2ddf8	NP	NPL	524	Nepal 	Nepal	\N
00040000-5589-6ae9-4dc6-eda38f56ebb2	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5589-6ae9-b202-d55cdff3145c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5589-6ae9-50ca-3e589bc26694	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5589-6ae9-f691-250e3f712c55	NE	NER	562	Niger 	Niger 	\N
00040000-5589-6ae9-8e5b-63c0d4d8359a	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5589-6ae9-4eae-bab675ee9379	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5589-6ae9-810c-eb9edb9a1e4c	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5589-6ae9-94a6-96ac45e14ea9	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5589-6ae9-d5da-d857f35d3055	NO	NOR	578	Norway 	Norveška	\N
00040000-5589-6ae9-61ef-4cb9fe82680f	OM	OMN	512	Oman 	Oman	\N
00040000-5589-6ae9-0b6f-f50866209b12	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5589-6ae9-0a3f-783e8dba68dd	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5589-6ae9-d17d-4bd410ae7220	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5589-6ae9-f0e0-a00338fb725b	PA	PAN	591	Panama 	Panama	\N
00040000-5589-6ae9-f3f3-9549c2a8120e	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5589-6ae9-9d27-4489903681dd	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5589-6ae9-5185-aef2dc12e349	PE	PER	604	Peru 	Peru	\N
00040000-5589-6ae9-e747-3eff39f08831	PH	PHL	608	Philippines 	Filipini	\N
00040000-5589-6ae9-a313-ad9db7e20cda	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5589-6ae9-ea9a-aaa7a241f400	PL	POL	616	Poland 	Poljska	\N
00040000-5589-6ae9-5fe1-e8f18eab0e94	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5589-6ae9-b819-0d0b51bdd546	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5589-6ae9-b32c-9df33ae6145b	QA	QAT	634	Qatar 	Katar	\N
00040000-5589-6ae9-0643-55f184b62fd0	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5589-6ae9-81ab-a098df082c1c	RO	ROU	642	Romania 	Romunija	\N
00040000-5589-6ae9-e100-fc24b8f1c12f	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5589-6ae9-81fb-6c3bfe164bed	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5589-6ae9-6be3-052899993e3c	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5589-6ae9-3ec5-cea6a6ed20a4	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5589-6ae9-7484-976bbf0b9fbf	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5589-6ae9-93a3-50686c7ed940	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5589-6ae9-76b3-d86ed005e728	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5589-6ae9-57d0-23597e921b5f	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5589-6ae9-07cf-fcf85b548e91	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5589-6ae9-60b8-ac5d1f610293	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5589-6ae9-57ec-0ba53563569e	SM	SMR	674	San Marino 	San Marino	\N
00040000-5589-6ae9-d0a2-e77ed92f4fe2	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5589-6ae9-613a-80034ece7e86	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5589-6ae9-4e10-9cbe36e6a251	SN	SEN	686	Senegal 	Senegal	\N
00040000-5589-6ae9-ed2f-09db9b6f0135	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5589-6ae9-a053-9bdafd104244	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5589-6ae9-8b2d-ab3a22c3dab0	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5589-6ae9-7400-304474eacf62	SG	SGP	702	Singapore 	Singapur	\N
00040000-5589-6ae9-969f-3433b1766f91	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5589-6ae9-6169-fcb8c3afdd3a	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5589-6ae9-0d0b-330d70ffe15e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5589-6ae9-4f15-6d778d49087f	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5589-6ae9-ddc5-e3fc5a25f533	SO	SOM	706	Somalia 	Somalija	\N
00040000-5589-6ae9-320c-8aefad73f7e2	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5589-6ae9-fbca-1483feac2390	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5589-6ae9-5d28-9c9064710e3e	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5589-6ae9-0d72-e177ca1420b7	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5589-6ae9-92fb-25344f32f111	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5589-6ae9-da57-c20c25f9c302	SD	SDN	729	Sudan 	Sudan	\N
00040000-5589-6ae9-ce51-c6e27ad27ac9	SR	SUR	740	Suriname 	Surinam	\N
00040000-5589-6ae9-fd57-59fecf462722	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5589-6ae9-5d5e-dc322c5dff7e	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5589-6ae9-6625-2a05f684df7b	SE	SWE	752	Sweden 	Švedska	\N
00040000-5589-6ae9-95f5-fae9ca578143	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5589-6ae9-9073-7f905239831e	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5589-6ae9-9632-a51492062ac5	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5589-6ae9-6a62-2d1b086781e5	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5589-6ae9-d52a-556dc498b05c	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5589-6ae9-346a-2a7cad312436	TH	THA	764	Thailand 	Tajska	\N
00040000-5589-6ae9-0bd2-cb2d7308c83c	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5589-6ae9-4096-1b8e30f19271	TG	TGO	768	Togo 	Togo	\N
00040000-5589-6ae9-b020-2a5d3889429f	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5589-6ae9-0cfb-fcc3b63835e2	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5589-6ae9-50e9-4ad2e96287ce	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5589-6ae9-125e-763809fa9691	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5589-6ae9-280e-61f9c3d3caf3	TR	TUR	792	Turkey 	Turčija	\N
00040000-5589-6ae9-b683-cea4a79a3f3c	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5589-6ae9-1ed6-bb32cfd8a78d	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5589-6ae9-1203-e1c176612a68	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5589-6ae9-4042-0479283b2397	UG	UGA	800	Uganda 	Uganda	\N
00040000-5589-6ae9-8b43-663c8aa3ed84	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5589-6ae9-5355-8f60e04b14f7	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5589-6ae9-fd47-75e5a3ecb694	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5589-6ae9-4638-2e34106669ac	US	USA	840	United States 	Združene države Amerike	\N
00040000-5589-6ae9-703a-52d650ee2fc4	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5589-6ae9-627b-e16fba040d78	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5589-6ae9-2abc-f0bb70b7bc83	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5589-6ae9-3e93-2cef11721a23	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5589-6ae9-b09d-3afd92849c86	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5589-6ae9-593f-e564b14b69d8	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5589-6ae9-af7e-0e628ea0f98e	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5589-6ae9-3262-bec14f188ec7	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5589-6ae9-4842-9185dfee855c	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5589-6ae9-27a8-39c2afd086fc	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5589-6ae9-b855-ecfbd23627cc	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5589-6ae9-a642-9d64b4126dac	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5589-6ae9-8f6b-5212497bfb0a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2902 (class 0 OID 8090726)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 8090529)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5589-6aea-c17e-eaf18af6278e	000e0000-5589-6aea-92ad-b9a0cf631845	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5589-6ae9-9f06-8a7905e54054
000d0000-5589-6aea-0f2b-9c798c306f2d	000e0000-5589-6aea-92ad-b9a0cf631845	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5589-6ae9-9f06-8a7905e54054
000d0000-5589-6aea-5c0d-8253eaa055dc	000e0000-5589-6aea-92ad-b9a0cf631845	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5589-6ae9-4e86-20c27fbbb7f1
000d0000-5589-6aea-a95c-70d510b67b1f	000e0000-5589-6aea-92ad-b9a0cf631845	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5589-6ae9-881d-892650b748b3
000d0000-5589-6aea-d74c-93b9dfb90bb3	000e0000-5589-6aea-92ad-b9a0cf631845	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5589-6ae9-881d-892650b748b3
000d0000-5589-6aea-d4a2-9231f557b3b5	000e0000-5589-6aea-92ad-b9a0cf631845	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5589-6ae9-881d-892650b748b3
000d0000-5589-6aea-5ca4-736746f49386	000e0000-5589-6aea-92ad-b9a0cf631845	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5589-6ae9-9f06-8a7905e54054
\.


--
-- TOC entry 2866 (class 0 OID 8090349)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8090397)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8090329)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5589-6aea-3005-ad6676d8679e	00080000-5589-6aea-c3df-528d65cfdf9b	00090000-5589-6aea-9bd6-fbdadcdfab2c	AK		
\.


--
-- TOC entry 2841 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 8090446)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 8090471)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 8090286)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5589-6ae9-f549-a1812da58f71	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5589-6ae9-e174-57507996981d	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5589-6ae9-c19c-ad5a6cca9461	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5589-6ae9-2965-b424e2c41ac9	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5589-6ae9-44d8-12e271c9cd22	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5589-6ae9-8e11-faef361d5ba9	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5589-6ae9-09f7-8bdc2e7ce67e	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5589-6ae9-f02e-1d55fed99681	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5589-6ae9-3b2b-705aa13312c5	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5589-6ae9-d772-beb7ee7795a3	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5589-6ae9-3ad8-cf76a4b5f3b6	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5589-6ae9-d940-72832b5762c1	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5589-6ae9-8d49-fca0ff327282	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5589-6aea-2034-0c070a8d41cf	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5589-6aea-dddf-a52b32b5a4bf	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5589-6aea-13c7-b9c14880d951	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5589-6aea-63ab-8c5d006c33fa	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5589-6aea-c7ef-c131df68003a	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5589-6aea-d64f-ed15725fc953	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2855 (class 0 OID 8090199)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5589-6aea-d837-33487084c47d	00000000-5589-6aea-dddf-a52b32b5a4bf	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5589-6aea-4ba6-3b940b742097	00000000-5589-6aea-dddf-a52b32b5a4bf	00010000-5589-6ae9-d5c0-ab0ddfe790b3	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5589-6aea-7082-07cae83709fb	00000000-5589-6aea-13c7-b9c14880d951	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2856 (class 0 OID 8090210)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5589-6aea-a826-ccbbe9941492	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5589-6aea-fb31-74d7dbc419c8	00010000-5589-6aea-1d7d-2e183cdf7698	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5589-6aea-a615-f3e5be25e7c2	00010000-5589-6aea-c7c3-bc6b7bde2779	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5589-6aea-9fb5-9f910d034f10	00010000-5589-6aea-34b2-b99cd62b642e	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5589-6aea-d875-7d40614e5ada	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5589-6aea-f6b0-8ddb6c2b42cc	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5589-6aea-9c1d-316ce66a23a5	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5589-6aea-656e-6bb618142d15	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5589-6aea-9bd6-fbdadcdfab2c	00010000-5589-6aea-c0c2-36bff7f5d8b1	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5589-6aea-38f1-78bb3ba39147	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5589-6aea-9b55-957b63500291	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5589-6aea-0e77-a1eca2959303	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5589-6aea-286b-9fe89400bffd	00010000-5589-6aea-4df6-d56f7b82666b	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2843 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 8090164)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5589-6ae9-e17e-e67d4a625af3	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5589-6ae9-0427-860e340a8420	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5589-6ae9-6452-35b3b7456681	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5589-6ae9-7e44-17296620235b	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5589-6ae9-cee7-f24e04a7725c	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5589-6ae9-34cf-93577315e3ad	Abonma-read	Abonma - branje	f
00030000-5589-6ae9-bc3f-96dad0a9d812	Abonma-write	Abonma - spreminjanje	f
00030000-5589-6ae9-cff1-afa02fa42f42	Alternacija-read	Alternacija - branje	f
00030000-5589-6ae9-22a8-ba05811d3829	Alternacija-write	Alternacija - spreminjanje	f
00030000-5589-6ae9-cd31-25258bd061d0	Arhivalija-read	Arhivalija - branje	f
00030000-5589-6ae9-bc10-7ea213144bac	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5589-6ae9-b053-a670ae409959	Besedilo-read	Besedilo - branje	f
00030000-5589-6ae9-4d73-eb556f275191	Besedilo-write	Besedilo - spreminjanje	f
00030000-5589-6ae9-e745-041908e928f4	DogodekIzven-read	DogodekIzven - branje	f
00030000-5589-6ae9-b731-85aa937265f1	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5589-6ae9-631e-8cda0f488dc9	Dogodek-read	Dogodek - branje	f
00030000-5589-6ae9-462d-cceaa83460be	Dogodek-write	Dogodek - spreminjanje	f
00030000-5589-6ae9-b2ab-827dbf333c1e	DrugiVir-read	DrugiVir - branje	f
00030000-5589-6ae9-bf5e-0f2ce011f30a	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5589-6ae9-c501-931d90d79ad5	Drzava-read	Drzava - branje	f
00030000-5589-6ae9-1cd0-36aa87cb4b89	Drzava-write	Drzava - spreminjanje	f
00030000-5589-6ae9-12e2-5c7af84cb5e2	Funkcija-read	Funkcija - branje	f
00030000-5589-6ae9-0e76-fe6faef102c5	Funkcija-write	Funkcija - spreminjanje	f
00030000-5589-6ae9-8574-139195003f2f	Gostovanje-read	Gostovanje - branje	f
00030000-5589-6ae9-bdd2-f19382002432	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5589-6ae9-e68a-15684a10b930	Gostujoca-read	Gostujoca - branje	f
00030000-5589-6ae9-1406-ddf0d8d47d76	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5589-6ae9-1133-0ecb4ce8088a	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5589-6ae9-4bdd-696231f90842	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5589-6ae9-ef8a-8327a0fac2e8	Kupec-read	Kupec - branje	f
00030000-5589-6ae9-4d2a-514c777a060c	Kupec-write	Kupec - spreminjanje	f
00030000-5589-6ae9-0c65-12d560cf8b86	NacinPlacina-read	NacinPlacina - branje	f
00030000-5589-6ae9-60e9-d0d49922e3a2	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5589-6ae9-751b-9b9173281fbf	Option-read	Option - branje	f
00030000-5589-6ae9-e23d-ac16d7204600	Option-write	Option - spreminjanje	f
00030000-5589-6ae9-8693-ede01356454d	OptionValue-read	OptionValue - branje	f
00030000-5589-6ae9-5d28-0a3b859c96d0	OptionValue-write	OptionValue - spreminjanje	f
00030000-5589-6ae9-a093-10e340df4d42	Oseba-read	Oseba - branje	f
00030000-5589-6ae9-2660-b1ace9bea4e2	Oseba-write	Oseba - spreminjanje	f
00030000-5589-6ae9-9fcf-68a1e7cd1db8	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5589-6ae9-dab7-e22d64706e3e	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5589-6ae9-73d2-b3bd789f2c6b	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5589-6ae9-92d2-b96470b8ac2c	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5589-6ae9-e141-eb910be60c0b	Pogodba-read	Pogodba - branje	f
00030000-5589-6ae9-46e2-ccbb1a9ce506	Pogodba-write	Pogodba - spreminjanje	f
00030000-5589-6ae9-047a-f944a923a2a7	Popa-read	Popa - branje	f
00030000-5589-6ae9-baa2-1fde93c4f749	Popa-write	Popa - spreminjanje	f
00030000-5589-6ae9-2d71-130e3d1bf193	Posta-read	Posta - branje	f
00030000-5589-6ae9-913b-eae2a724c425	Posta-write	Posta - spreminjanje	f
00030000-5589-6ae9-6ec5-4f8f085a4b85	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5589-6ae9-1bf7-edd0cbf45471	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5589-6ae9-8315-1a04b2e202f6	PostniNaslov-read	PostniNaslov - branje	f
00030000-5589-6ae9-e22c-bc377edfba34	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5589-6ae9-ac95-6425a0583b31	Predstava-read	Predstava - branje	f
00030000-5589-6ae9-0cf0-a2a785f7f8ad	Predstava-write	Predstava - spreminjanje	f
00030000-5589-6ae9-9d95-3c0d5026a818	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5589-6ae9-6a1c-a3db85738ce5	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5589-6ae9-6358-860d0217b8ef	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5589-6ae9-871d-ddf15a259f09	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5589-6ae9-bb29-e9c7c8ca1c5a	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5589-6ae9-b239-fddbdd93828f	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5589-6ae9-15bd-9661927d017f	ProgramDela-read	ProgramDela - branje	f
00030000-5589-6ae9-210b-d8982b5e293f	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5589-6ae9-02b8-067dd2c540d4	ProgramFestival-read	ProgramFestival - branje	f
00030000-5589-6ae9-6053-4563315f9cbe	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5589-6ae9-46d6-2427271fda7a	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5589-6ae9-dc38-5f22c832f51d	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5589-6ae9-41c2-a0575da40fa7	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5589-6ae9-df71-0aecb4baa77f	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5589-6ae9-f3b9-d097202aaf1b	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5589-6ae9-cf54-ce42f51dd8da	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5589-6ae9-6920-fa40b5c276a7	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5589-6ae9-a0e6-41e1b1baa3c8	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5589-6ae9-9898-b597e10a878f	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5589-6ae9-5388-c1a50352a482	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5589-6ae9-7bdd-f5bb0f62ced0	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5589-6ae9-c69d-c32cd4d6152b	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5589-6ae9-cb4a-8a0f1112edf6	ProgramRazno-read	ProgramRazno - branje	f
00030000-5589-6ae9-f3b5-0fcf01b8a86b	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5589-6ae9-e3ac-3aa7acadb22a	Prostor-read	Prostor - branje	f
00030000-5589-6ae9-e48a-3de84655a689	Prostor-write	Prostor - spreminjanje	f
00030000-5589-6ae9-17d8-e2a890c49b26	Racun-read	Racun - branje	f
00030000-5589-6ae9-2d50-f0f46d616b40	Racun-write	Racun - spreminjanje	f
00030000-5589-6ae9-df95-1793ecb50009	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5589-6ae9-73c8-5df842c1ac61	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5589-6ae9-0452-d7635aa73931	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5589-6ae9-48af-c98df6f726de	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5589-6ae9-85b1-07caafb5b05d	Rekvizit-read	Rekvizit - branje	f
00030000-5589-6ae9-894b-f0ff55ca1c11	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5589-6ae9-48b3-f81bd10e04eb	Revizija-read	Revizija - branje	f
00030000-5589-6ae9-32a6-fbff013fb1e0	Revizija-write	Revizija - spreminjanje	f
00030000-5589-6ae9-b7b2-09107e1e38e4	Rezervacija-read	Rezervacija - branje	f
00030000-5589-6ae9-1a82-d8767ad36c1f	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5589-6ae9-29c1-edab0571e417	SedezniRed-read	SedezniRed - branje	f
00030000-5589-6ae9-4ffe-2a76cd0b4c2a	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5589-6ae9-9bc5-c73023ea50a2	Sedez-read	Sedez - branje	f
00030000-5589-6ae9-55b3-558c6dd1a17c	Sedez-write	Sedez - spreminjanje	f
00030000-5589-6ae9-76de-7dd382cbfcd6	Sezona-read	Sezona - branje	f
00030000-5589-6ae9-389a-f46527ed789a	Sezona-write	Sezona - spreminjanje	f
00030000-5589-6ae9-f815-5994122b8e5a	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5589-6ae9-72a2-7d9488dbae41	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5589-6ae9-12a4-49954a75ec43	Stevilcenje-read	Stevilcenje - branje	f
00030000-5589-6ae9-b6fe-b2837b2d670a	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5589-6ae9-49dd-e960c46bd2e4	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5589-6ae9-be20-a5fc498e58b4	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5589-6ae9-c187-d2fb3ebf3504	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5589-6ae9-a415-76172b68cf30	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5589-6ae9-beed-49b9029100ee	Telefonska-read	Telefonska - branje	f
00030000-5589-6ae9-1111-ac337bb81272	Telefonska-write	Telefonska - spreminjanje	f
00030000-5589-6ae9-bdfe-f2bb32c08494	TerminStoritve-read	TerminStoritve - branje	f
00030000-5589-6ae9-2b20-976bfbf65a90	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5589-6ae9-60c1-c8a89ddae74b	TipFunkcije-read	TipFunkcije - branje	f
00030000-5589-6ae9-a3ca-c442355fdbc4	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5589-6ae9-29f9-46bff2ea45f0	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5589-6ae9-3a14-12f8f59b37b2	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5589-6ae9-5ba9-991b320ddf66	Trr-read	Trr - branje	f
00030000-5589-6ae9-0e25-15518d04a390	Trr-write	Trr - spreminjanje	f
00030000-5589-6ae9-0317-bd01fbceaae9	Uprizoritev-read	Uprizoritev - branje	f
00030000-5589-6ae9-16ab-93aa6ad4c318	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5589-6ae9-1b13-cb815c5815c1	Vaja-read	Vaja - branje	f
00030000-5589-6ae9-4a53-1c358ac9b859	Vaja-write	Vaja - spreminjanje	f
00030000-5589-6ae9-85b6-1ead5762ec40	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5589-6ae9-e259-f0719660bb77	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5589-6ae9-534b-7ec1520da7a2	Zaposlitev-read	Zaposlitev - branje	f
00030000-5589-6ae9-3877-23b88112caf0	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5589-6ae9-fcf8-2122efa73e88	Zasedenost-read	Zasedenost - branje	f
00030000-5589-6ae9-7fdf-70a563deab8a	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5589-6ae9-1c2b-60bb066f44e5	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5589-6ae9-f173-9fb8926deaf7	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5589-6ae9-0338-7b9aec99c530	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5589-6ae9-cf57-35f96d2c7b69	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2853 (class 0 OID 8090183)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5589-6ae9-8b0d-980d847b7f6a	00030000-5589-6ae9-0427-860e340a8420
00020000-5589-6ae9-6251-a59950ce12fc	00030000-5589-6ae9-c501-931d90d79ad5
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-34cf-93577315e3ad
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-bc3f-96dad0a9d812
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-cff1-afa02fa42f42
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-22a8-ba05811d3829
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-cd31-25258bd061d0
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-631e-8cda0f488dc9
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-7e44-17296620235b
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-462d-cceaa83460be
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-c501-931d90d79ad5
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-1cd0-36aa87cb4b89
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-12e2-5c7af84cb5e2
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-0e76-fe6faef102c5
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-8574-139195003f2f
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-bdd2-f19382002432
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-e68a-15684a10b930
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-1406-ddf0d8d47d76
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-1133-0ecb4ce8088a
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-4bdd-696231f90842
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-751b-9b9173281fbf
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-8693-ede01356454d
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-a093-10e340df4d42
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-2660-b1ace9bea4e2
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-047a-f944a923a2a7
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-baa2-1fde93c4f749
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-2d71-130e3d1bf193
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-913b-eae2a724c425
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-8315-1a04b2e202f6
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-e22c-bc377edfba34
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-ac95-6425a0583b31
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-0cf0-a2a785f7f8ad
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-bb29-e9c7c8ca1c5a
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-b239-fddbdd93828f
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-e3ac-3aa7acadb22a
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-e48a-3de84655a689
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-0452-d7635aa73931
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-48af-c98df6f726de
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-85b1-07caafb5b05d
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-894b-f0ff55ca1c11
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-76de-7dd382cbfcd6
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-389a-f46527ed789a
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-60c1-c8a89ddae74b
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-0317-bd01fbceaae9
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-16ab-93aa6ad4c318
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-1b13-cb815c5815c1
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-4a53-1c358ac9b859
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-fcf8-2122efa73e88
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-7fdf-70a563deab8a
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-1c2b-60bb066f44e5
00020000-5589-6ae9-5840-d35b234aede9	00030000-5589-6ae9-0338-7b9aec99c530
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-34cf-93577315e3ad
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-cd31-25258bd061d0
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-631e-8cda0f488dc9
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-c501-931d90d79ad5
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-8574-139195003f2f
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-e68a-15684a10b930
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-1133-0ecb4ce8088a
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-4bdd-696231f90842
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-751b-9b9173281fbf
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-8693-ede01356454d
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-a093-10e340df4d42
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-2660-b1ace9bea4e2
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-047a-f944a923a2a7
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-2d71-130e3d1bf193
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-8315-1a04b2e202f6
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-e22c-bc377edfba34
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-ac95-6425a0583b31
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-e3ac-3aa7acadb22a
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-0452-d7635aa73931
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-85b1-07caafb5b05d
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-76de-7dd382cbfcd6
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-beed-49b9029100ee
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-1111-ac337bb81272
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-5ba9-991b320ddf66
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-0e25-15518d04a390
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-534b-7ec1520da7a2
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-3877-23b88112caf0
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-1c2b-60bb066f44e5
00020000-5589-6ae9-4355-b52f123ca7dc	00030000-5589-6ae9-0338-7b9aec99c530
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-34cf-93577315e3ad
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-cff1-afa02fa42f42
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-cd31-25258bd061d0
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-bc10-7ea213144bac
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-b053-a670ae409959
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-e745-041908e928f4
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-631e-8cda0f488dc9
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-c501-931d90d79ad5
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-12e2-5c7af84cb5e2
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-8574-139195003f2f
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-e68a-15684a10b930
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-1133-0ecb4ce8088a
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-751b-9b9173281fbf
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-8693-ede01356454d
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-a093-10e340df4d42
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-047a-f944a923a2a7
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-2d71-130e3d1bf193
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-ac95-6425a0583b31
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-bb29-e9c7c8ca1c5a
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-e3ac-3aa7acadb22a
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-0452-d7635aa73931
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-85b1-07caafb5b05d
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-76de-7dd382cbfcd6
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-60c1-c8a89ddae74b
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-1b13-cb815c5815c1
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-fcf8-2122efa73e88
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-1c2b-60bb066f44e5
00020000-5589-6ae9-4b3f-6e5c0f9b2492	00030000-5589-6ae9-0338-7b9aec99c530
00020000-5589-6ae9-2c81-b2edb18ee7ab	00030000-5589-6ae9-34cf-93577315e3ad
00020000-5589-6ae9-2c81-b2edb18ee7ab	00030000-5589-6ae9-bc3f-96dad0a9d812
00020000-5589-6ae9-2c81-b2edb18ee7ab	00030000-5589-6ae9-22a8-ba05811d3829
00020000-5589-6ae9-2c81-b2edb18ee7ab	00030000-5589-6ae9-cd31-25258bd061d0
00020000-5589-6ae9-2c81-b2edb18ee7ab	00030000-5589-6ae9-631e-8cda0f488dc9
00020000-5589-6ae9-2c81-b2edb18ee7ab	00030000-5589-6ae9-c501-931d90d79ad5
00020000-5589-6ae9-2c81-b2edb18ee7ab	00030000-5589-6ae9-8574-139195003f2f
00020000-5589-6ae9-2c81-b2edb18ee7ab	00030000-5589-6ae9-e68a-15684a10b930
00020000-5589-6ae9-2c81-b2edb18ee7ab	00030000-5589-6ae9-751b-9b9173281fbf
00020000-5589-6ae9-2c81-b2edb18ee7ab	00030000-5589-6ae9-8693-ede01356454d
00020000-5589-6ae9-2c81-b2edb18ee7ab	00030000-5589-6ae9-047a-f944a923a2a7
00020000-5589-6ae9-2c81-b2edb18ee7ab	00030000-5589-6ae9-2d71-130e3d1bf193
00020000-5589-6ae9-2c81-b2edb18ee7ab	00030000-5589-6ae9-ac95-6425a0583b31
00020000-5589-6ae9-2c81-b2edb18ee7ab	00030000-5589-6ae9-e3ac-3aa7acadb22a
00020000-5589-6ae9-2c81-b2edb18ee7ab	00030000-5589-6ae9-0452-d7635aa73931
00020000-5589-6ae9-2c81-b2edb18ee7ab	00030000-5589-6ae9-85b1-07caafb5b05d
00020000-5589-6ae9-2c81-b2edb18ee7ab	00030000-5589-6ae9-76de-7dd382cbfcd6
00020000-5589-6ae9-2c81-b2edb18ee7ab	00030000-5589-6ae9-60c1-c8a89ddae74b
00020000-5589-6ae9-2c81-b2edb18ee7ab	00030000-5589-6ae9-1c2b-60bb066f44e5
00020000-5589-6ae9-2c81-b2edb18ee7ab	00030000-5589-6ae9-0338-7b9aec99c530
00020000-5589-6ae9-acb8-334b044e62a1	00030000-5589-6ae9-34cf-93577315e3ad
00020000-5589-6ae9-acb8-334b044e62a1	00030000-5589-6ae9-cd31-25258bd061d0
00020000-5589-6ae9-acb8-334b044e62a1	00030000-5589-6ae9-631e-8cda0f488dc9
00020000-5589-6ae9-acb8-334b044e62a1	00030000-5589-6ae9-c501-931d90d79ad5
00020000-5589-6ae9-acb8-334b044e62a1	00030000-5589-6ae9-8574-139195003f2f
00020000-5589-6ae9-acb8-334b044e62a1	00030000-5589-6ae9-e68a-15684a10b930
00020000-5589-6ae9-acb8-334b044e62a1	00030000-5589-6ae9-751b-9b9173281fbf
00020000-5589-6ae9-acb8-334b044e62a1	00030000-5589-6ae9-8693-ede01356454d
00020000-5589-6ae9-acb8-334b044e62a1	00030000-5589-6ae9-047a-f944a923a2a7
00020000-5589-6ae9-acb8-334b044e62a1	00030000-5589-6ae9-2d71-130e3d1bf193
00020000-5589-6ae9-acb8-334b044e62a1	00030000-5589-6ae9-ac95-6425a0583b31
00020000-5589-6ae9-acb8-334b044e62a1	00030000-5589-6ae9-e3ac-3aa7acadb22a
00020000-5589-6ae9-acb8-334b044e62a1	00030000-5589-6ae9-0452-d7635aa73931
00020000-5589-6ae9-acb8-334b044e62a1	00030000-5589-6ae9-85b1-07caafb5b05d
00020000-5589-6ae9-acb8-334b044e62a1	00030000-5589-6ae9-76de-7dd382cbfcd6
00020000-5589-6ae9-acb8-334b044e62a1	00030000-5589-6ae9-bdfe-f2bb32c08494
00020000-5589-6ae9-acb8-334b044e62a1	00030000-5589-6ae9-6452-35b3b7456681
00020000-5589-6ae9-acb8-334b044e62a1	00030000-5589-6ae9-60c1-c8a89ddae74b
00020000-5589-6ae9-acb8-334b044e62a1	00030000-5589-6ae9-1c2b-60bb066f44e5
00020000-5589-6ae9-acb8-334b044e62a1	00030000-5589-6ae9-0338-7b9aec99c530
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-e17e-e67d4a625af3
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-0427-860e340a8420
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-6452-35b3b7456681
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-7e44-17296620235b
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-cee7-f24e04a7725c
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-34cf-93577315e3ad
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-bc3f-96dad0a9d812
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-cff1-afa02fa42f42
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-22a8-ba05811d3829
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-cd31-25258bd061d0
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-bc10-7ea213144bac
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-b053-a670ae409959
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-4d73-eb556f275191
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-e745-041908e928f4
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-b731-85aa937265f1
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-631e-8cda0f488dc9
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-462d-cceaa83460be
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-c501-931d90d79ad5
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-1cd0-36aa87cb4b89
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-12e2-5c7af84cb5e2
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-0e76-fe6faef102c5
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-8574-139195003f2f
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-bdd2-f19382002432
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-e68a-15684a10b930
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-1406-ddf0d8d47d76
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-1133-0ecb4ce8088a
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-4bdd-696231f90842
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-ef8a-8327a0fac2e8
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-4d2a-514c777a060c
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-0c65-12d560cf8b86
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-60e9-d0d49922e3a2
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-751b-9b9173281fbf
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-e23d-ac16d7204600
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-8693-ede01356454d
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-5d28-0a3b859c96d0
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-a093-10e340df4d42
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-2660-b1ace9bea4e2
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-9fcf-68a1e7cd1db8
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-dab7-e22d64706e3e
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-73d2-b3bd789f2c6b
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-92d2-b96470b8ac2c
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-e141-eb910be60c0b
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-46e2-ccbb1a9ce506
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-047a-f944a923a2a7
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-baa2-1fde93c4f749
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-2d71-130e3d1bf193
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-913b-eae2a724c425
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-6ec5-4f8f085a4b85
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-1bf7-edd0cbf45471
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-8315-1a04b2e202f6
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-e22c-bc377edfba34
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-ac95-6425a0583b31
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-0cf0-a2a785f7f8ad
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-9d95-3c0d5026a818
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-6a1c-a3db85738ce5
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-6358-860d0217b8ef
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-871d-ddf15a259f09
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-bb29-e9c7c8ca1c5a
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-b239-fddbdd93828f
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-15bd-9661927d017f
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-210b-d8982b5e293f
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-02b8-067dd2c540d4
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-6053-4563315f9cbe
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-46d6-2427271fda7a
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-dc38-5f22c832f51d
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-41c2-a0575da40fa7
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-df71-0aecb4baa77f
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-f3b9-d097202aaf1b
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-cf54-ce42f51dd8da
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-6920-fa40b5c276a7
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-a0e6-41e1b1baa3c8
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-9898-b597e10a878f
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-5388-c1a50352a482
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-7bdd-f5bb0f62ced0
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-c69d-c32cd4d6152b
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-cb4a-8a0f1112edf6
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-f3b5-0fcf01b8a86b
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-e3ac-3aa7acadb22a
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-e48a-3de84655a689
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-17d8-e2a890c49b26
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-2d50-f0f46d616b40
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-df95-1793ecb50009
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-73c8-5df842c1ac61
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-0452-d7635aa73931
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-48af-c98df6f726de
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-85b1-07caafb5b05d
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-894b-f0ff55ca1c11
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-48b3-f81bd10e04eb
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-32a6-fbff013fb1e0
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-b7b2-09107e1e38e4
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-1a82-d8767ad36c1f
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-29c1-edab0571e417
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-4ffe-2a76cd0b4c2a
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-9bc5-c73023ea50a2
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-55b3-558c6dd1a17c
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-76de-7dd382cbfcd6
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-389a-f46527ed789a
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-f815-5994122b8e5a
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-72a2-7d9488dbae41
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-12a4-49954a75ec43
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-b6fe-b2837b2d670a
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-49dd-e960c46bd2e4
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-be20-a5fc498e58b4
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-c187-d2fb3ebf3504
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-a415-76172b68cf30
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-beed-49b9029100ee
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-1111-ac337bb81272
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-bdfe-f2bb32c08494
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-2b20-976bfbf65a90
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-60c1-c8a89ddae74b
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-a3ca-c442355fdbc4
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-29f9-46bff2ea45f0
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-3a14-12f8f59b37b2
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-5ba9-991b320ddf66
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-0e25-15518d04a390
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-0317-bd01fbceaae9
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-16ab-93aa6ad4c318
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-1b13-cb815c5815c1
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-4a53-1c358ac9b859
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-85b6-1ead5762ec40
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-e259-f0719660bb77
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-534b-7ec1520da7a2
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-3877-23b88112caf0
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-fcf8-2122efa73e88
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-7fdf-70a563deab8a
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-1c2b-60bb066f44e5
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-f173-9fb8926deaf7
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-0338-7b9aec99c530
00020000-5589-6aea-093c-7d9ffeda06b6	00030000-5589-6ae9-cf57-35f96d2c7b69
\.


--
-- TOC entry 2881 (class 0 OID 8090478)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8090509)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 8090645)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5589-6aea-0ac6-c4c1432e1be5	00090000-5589-6aea-a826-ccbbe9941492	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2858 (class 0 OID 8090243)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5589-6aea-c3df-528d65cfdf9b	00040000-5589-6ae9-3ab5-d30cbd883182	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5589-6aea-c67e-f48af959b575	00040000-5589-6ae9-3ab5-d30cbd883182	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5589-6aea-5591-f58f463cc188	00040000-5589-6ae9-3ab5-d30cbd883182	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5589-6aea-cab8-baf76d468071	00040000-5589-6ae9-3ab5-d30cbd883182	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5589-6aea-5c5d-120f713cc4be	00040000-5589-6ae9-3ab5-d30cbd883182	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5589-6aea-5a1d-83217e639f66	00040000-5589-6ae9-0d0b-330d70ffe15e	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2860 (class 0 OID 8090278)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5589-6ae9-ccfa-cc7edec03275	8341	Adlešiči
00050000-5589-6ae9-9940-86e1845d1deb	5270	Ajdovščina
00050000-5589-6ae9-b47f-8e6b2f4e81a7	6280	Ankaran/Ancarano
00050000-5589-6ae9-8eec-78a63627c6e8	9253	Apače
00050000-5589-6ae9-e800-9feb721ab99f	8253	Artiče
00050000-5589-6ae9-5bd5-32026d60b487	4275	Begunje na Gorenjskem
00050000-5589-6ae9-7ffc-4af583686088	1382	Begunje pri Cerknici
00050000-5589-6ae9-aaf5-66f6e045ff1a	9231	Beltinci
00050000-5589-6ae9-3fc0-4053f6f1149f	2234	Benedikt
00050000-5589-6ae9-d6eb-ae01ea380dd3	2345	Bistrica ob Dravi
00050000-5589-6ae9-62c7-644e8c1e4461	3256	Bistrica ob Sotli
00050000-5589-6ae9-d74f-7b9617c2470b	8259	Bizeljsko
00050000-5589-6ae9-3297-6df0d974684f	1223	Blagovica
00050000-5589-6ae9-0f5f-4dfbaebcb8c1	8283	Blanca
00050000-5589-6ae9-8d7b-8af4f030c0a4	4260	Bled
00050000-5589-6ae9-6eb0-0578a9b2130a	4273	Blejska Dobrava
00050000-5589-6ae9-78c6-5fa7de53e0aa	9265	Bodonci
00050000-5589-6ae9-b89b-56d66d2145b1	9222	Bogojina
00050000-5589-6ae9-da27-44616d0c2d5d	4263	Bohinjska Bela
00050000-5589-6ae9-95ef-6c5b92d8b1a5	4264	Bohinjska Bistrica
00050000-5589-6ae9-6c21-f75f28a8d7a3	4265	Bohinjsko jezero
00050000-5589-6ae9-06ed-5ad64a30e304	1353	Borovnica
00050000-5589-6ae9-99f3-318e3d5d790e	8294	Boštanj
00050000-5589-6ae9-53aa-abddeeaf1f5a	5230	Bovec
00050000-5589-6ae9-dc15-8020b1c90551	5295	Branik
00050000-5589-6ae9-6f82-ec52e8b95b87	3314	Braslovče
00050000-5589-6ae9-8a6d-585becdca4c4	5223	Breginj
00050000-5589-6ae9-f323-07fc6132d87c	8280	Brestanica
00050000-5589-6ae9-97f1-3abfec12f529	2354	Bresternica
00050000-5589-6ae9-c90a-0dba89ed7f46	4243	Brezje
00050000-5589-6ae9-11d4-644084f30a80	1351	Brezovica pri Ljubljani
00050000-5589-6ae9-4f7a-7f2453daab35	8250	Brežice
00050000-5589-6ae9-17c6-5baf50e81b4b	4210	Brnik - Aerodrom
00050000-5589-6ae9-3c35-0f20f4bf9070	8321	Brusnice
00050000-5589-6ae9-ea38-5e77dcd0bce2	3255	Buče
00050000-5589-6ae9-0be7-7d67c4729ce9	8276	Bučka 
00050000-5589-6ae9-95fe-07f71973c08d	9261	Cankova
00050000-5589-6ae9-f345-8776172b5ddd	3000	Celje 
00050000-5589-6ae9-3a25-ebe422a2f670	3001	Celje - poštni predali
00050000-5589-6ae9-a748-ba30eceaa6f7	4207	Cerklje na Gorenjskem
00050000-5589-6ae9-d737-b672870d6a2d	8263	Cerklje ob Krki
00050000-5589-6ae9-caaf-7d4681898948	1380	Cerknica
00050000-5589-6ae9-2a5c-d0a06ef707e5	5282	Cerkno
00050000-5589-6ae9-48e6-1ca3d82ad90f	2236	Cerkvenjak
00050000-5589-6ae9-4f67-2e0260831834	2215	Ceršak
00050000-5589-6ae9-d4eb-5439c8bc3919	2326	Cirkovce
00050000-5589-6ae9-9350-ac92e5fc8494	2282	Cirkulane
00050000-5589-6ae9-7066-5ed40ebae678	5273	Col
00050000-5589-6ae9-65ef-e68a0072053b	8251	Čatež ob Savi
00050000-5589-6ae9-e666-56312f6ee1bd	1413	Čemšenik
00050000-5589-6ae9-09cf-828d9231dbbe	5253	Čepovan
00050000-5589-6ae9-f0b0-b6ff42048b50	9232	Črenšovci
00050000-5589-6ae9-29ff-5e40874f89b0	2393	Črna na Koroškem
00050000-5589-6ae9-f90a-15a12e1a3e17	6275	Črni Kal
00050000-5589-6ae9-64df-6d94aa67b11a	5274	Črni Vrh nad Idrijo
00050000-5589-6ae9-291c-0c2d9a0caaea	5262	Črniče
00050000-5589-6ae9-da13-d90b635cc9eb	8340	Črnomelj
00050000-5589-6ae9-216a-473423c3f8a7	6271	Dekani
00050000-5589-6ae9-2541-74651f08e2e3	5210	Deskle
00050000-5589-6ae9-eeb6-d1f335e2d5b5	2253	Destrnik
00050000-5589-6ae9-1a90-89e460454d9d	6215	Divača
00050000-5589-6ae9-f96f-f5cb35400f76	1233	Dob
00050000-5589-6ae9-7096-c624ae4e683d	3224	Dobje pri Planini
00050000-5589-6ae9-155a-002aa8b96a8a	8257	Dobova
00050000-5589-6ae9-9f16-271f9e88a93f	1423	Dobovec
00050000-5589-6ae9-8bc0-b0b455c839b0	5263	Dobravlje
00050000-5589-6ae9-93db-c9788ec0775a	3204	Dobrna
00050000-5589-6ae9-97cf-83ce1f0004c9	8211	Dobrnič
00050000-5589-6ae9-7fcd-c9b88aa42d4d	1356	Dobrova
00050000-5589-6ae9-80c9-f09e7562c30a	9223	Dobrovnik/Dobronak 
00050000-5589-6ae9-ad26-e44f6d98c4dc	5212	Dobrovo v Brdih
00050000-5589-6ae9-58cd-f90b18bc4a25	1431	Dol pri Hrastniku
00050000-5589-6ae9-abb8-0194708643d1	1262	Dol pri Ljubljani
00050000-5589-6ae9-2c13-65662f35d9b9	1273	Dole pri Litiji
00050000-5589-6ae9-3fcc-fdf38cedecf6	1331	Dolenja vas
00050000-5589-6ae9-858c-10fd23bd2ade	8350	Dolenjske Toplice
00050000-5589-6ae9-9137-2d76abb7c1ed	1230	Domžale
00050000-5589-6ae9-6d3c-0ff7475f2308	2252	Dornava
00050000-5589-6ae9-d8c5-62165d89f120	5294	Dornberk
00050000-5589-6ae9-b921-3b7217b6facb	1319	Draga
00050000-5589-6ae9-4260-2b2fe9800bb7	8343	Dragatuš
00050000-5589-6ae9-15e9-a6161cc08229	3222	Dramlje
00050000-5589-6ae9-0e49-48bc1d294bd3	2370	Dravograd
00050000-5589-6ae9-4d52-8c18bcc7c0f7	4203	Duplje
00050000-5589-6ae9-985a-816d762f58e4	6221	Dutovlje
00050000-5589-6ae9-c551-58e4e22ac0f7	8361	Dvor
00050000-5589-6ae9-39b5-7a538a7760e7	2343	Fala
00050000-5589-6ae9-392c-afbf99274723	9208	Fokovci
00050000-5589-6ae9-5f97-80a67a3f614c	2313	Fram
00050000-5589-6ae9-3756-2e75bb598064	3213	Frankolovo
00050000-5589-6ae9-6082-898225b184eb	1274	Gabrovka
00050000-5589-6ae9-7825-3987f63e7e92	8254	Globoko
00050000-5589-6ae9-6640-1204c9fc8365	5275	Godovič
00050000-5589-6ae9-9d82-678cbebc7b02	4204	Golnik
00050000-5589-6ae9-08c5-dfe322154f5b	3303	Gomilsko
00050000-5589-6ae9-1cf3-ede9a8af3b98	4224	Gorenja vas
00050000-5589-6ae9-4e30-5873f88b1b27	3263	Gorica pri Slivnici
00050000-5589-6ae9-4e65-bc31f8993398	2272	Gorišnica
00050000-5589-6ae9-f2e1-dc54ab4328ff	9250	Gornja Radgona
00050000-5589-6ae9-129f-03b5093c77e0	3342	Gornji Grad
00050000-5589-6ae9-4bea-1bf49fb8fd24	4282	Gozd Martuljek
00050000-5589-6ae9-2e4b-302b3872faab	6272	Gračišče
00050000-5589-6ae9-e74f-d5f7a250f3e4	9264	Grad
00050000-5589-6ae9-6566-2e40ffb301aa	8332	Gradac
00050000-5589-6ae9-8e1d-8e08df175831	1384	Grahovo
00050000-5589-6ae9-317f-18672ebee8d6	5242	Grahovo ob Bači
00050000-5589-6ae9-5b7d-1190ee8cdfe6	5251	Grgar
00050000-5589-6ae9-9319-cc68bd72313e	3302	Griže
00050000-5589-6ae9-ab48-61737a30f700	3231	Grobelno
00050000-5589-6ae9-fc0d-a1058233eb07	1290	Grosuplje
00050000-5589-6ae9-8ecd-a55de5652170	2288	Hajdina
00050000-5589-6ae9-eea1-11d1f2312845	8362	Hinje
00050000-5589-6ae9-ac13-6e695f7872f2	2311	Hoče
00050000-5589-6ae9-99cb-d41f531b5b74	9205	Hodoš/Hodos
00050000-5589-6ae9-a955-f36c1983fbb7	1354	Horjul
00050000-5589-6ae9-d686-c078465f06ae	1372	Hotedršica
00050000-5589-6ae9-c4ff-fc8c9c08d140	1430	Hrastnik
00050000-5589-6ae9-e70c-21b4a25bdd6a	6225	Hruševje
00050000-5589-6ae9-da7b-d10fadf63f9d	4276	Hrušica
00050000-5589-6ae9-d6a7-a5533cc78ffb	5280	Idrija
00050000-5589-6ae9-9df2-b63de6404659	1292	Ig
00050000-5589-6ae9-ceef-94b8964b8323	6250	Ilirska Bistrica
00050000-5589-6ae9-1fd8-1bcd528820aa	6251	Ilirska Bistrica-Trnovo
00050000-5589-6ae9-d72f-c93f3d99e150	1295	Ivančna Gorica
00050000-5589-6ae9-7d7b-af9ff8738ccd	2259	Ivanjkovci
00050000-5589-6ae9-b46b-bec21c773233	1411	Izlake
00050000-5589-6ae9-c3cd-d807b9737507	6310	Izola/Isola
00050000-5589-6ae9-f7e0-dc1b68c9cbaf	2222	Jakobski Dol
00050000-5589-6ae9-6c5b-3ee879b6d8e8	2221	Jarenina
00050000-5589-6ae9-e86c-ee9ba41e4099	6254	Jelšane
00050000-5589-6ae9-0841-fcd32c031fdc	4270	Jesenice
00050000-5589-6ae9-b46f-2ce9f4da31d6	8261	Jesenice na Dolenjskem
00050000-5589-6ae9-d8d3-4052e3892c51	3273	Jurklošter
00050000-5589-6ae9-36c4-c04c69e683ac	2223	Jurovski Dol
00050000-5589-6ae9-5fad-6d5912f53be2	2256	Juršinci
00050000-5589-6ae9-21a7-3061088813cf	5214	Kal nad Kanalom
00050000-5589-6ae9-3be5-330853c257bc	3233	Kalobje
00050000-5589-6ae9-bee1-a2b8efb9cf2d	4246	Kamna Gorica
00050000-5589-6ae9-aa25-c4ee1113e222	2351	Kamnica
00050000-5589-6ae9-91f6-b1e928c30f68	1241	Kamnik
00050000-5589-6ae9-4642-982b7a5d76fb	5213	Kanal
00050000-5589-6ae9-5e3e-6665e4c07556	8258	Kapele
00050000-5589-6ae9-bc0b-e252ee4e580b	2362	Kapla
00050000-5589-6ae9-c254-43859bfb0a35	2325	Kidričevo
00050000-5589-6ae9-961d-e7e2eb69ebfe	1412	Kisovec
00050000-5589-6ae9-b81c-c83486fadc92	6253	Knežak
00050000-5589-6ae9-9172-712f67366341	5222	Kobarid
00050000-5589-6ae9-a9e6-84f2f215ccc5	9227	Kobilje
00050000-5589-6ae9-52c8-4498de4b81c9	1330	Kočevje
00050000-5589-6ae9-5526-f9b78890d8c5	1338	Kočevska Reka
00050000-5589-6ae9-35e5-2a461be62ef9	2276	Kog
00050000-5589-6ae9-0724-d1c13c49e09f	5211	Kojsko
00050000-5589-6ae9-7953-17de982b50fc	6223	Komen
00050000-5589-6ae9-b8b5-bfafc8f251cb	1218	Komenda
00050000-5589-6ae9-0d36-2c12526116b0	6000	Koper/Capodistria 
00050000-5589-6ae9-de6c-7e9d6ab20361	6001	Koper/Capodistria - poštni predali
00050000-5589-6ae9-e95e-baa9ef9cf93e	8282	Koprivnica
00050000-5589-6ae9-a29f-84f108249a48	5296	Kostanjevica na Krasu
00050000-5589-6ae9-5c87-c06f179b9d3b	8311	Kostanjevica na Krki
00050000-5589-6ae9-4fae-953c5744c83b	1336	Kostel
00050000-5589-6ae9-4972-a9ffc7e8f29b	6256	Košana
00050000-5589-6ae9-73c7-b0e3e823ba7e	2394	Kotlje
00050000-5589-6ae9-08f6-a34a2b28fb2c	6240	Kozina
00050000-5589-6ae9-7c8d-0d4d95faa0bf	3260	Kozje
00050000-5589-6ae9-bfbf-0e8677a0fe5a	4000	Kranj 
00050000-5589-6ae9-4d50-635cd42918bb	4001	Kranj - poštni predali
00050000-5589-6ae9-3e39-707449741194	4280	Kranjska Gora
00050000-5589-6ae9-5fdc-c044e60251b0	1281	Kresnice
00050000-5589-6ae9-e0ea-7b6ec744f3a0	4294	Križe
00050000-5589-6ae9-c103-51dbf9853173	9206	Križevci
00050000-5589-6ae9-fea5-98798fedfea2	9242	Križevci pri Ljutomeru
00050000-5589-6ae9-c32b-3f70631db763	1301	Krka
00050000-5589-6ae9-5070-c858644dcb4c	8296	Krmelj
00050000-5589-6ae9-9f88-4b56249527da	4245	Kropa
00050000-5589-6ae9-4278-a21abb1d5220	8262	Krška vas
00050000-5589-6ae9-ca82-d8e874f217ad	8270	Krško
00050000-5589-6ae9-601f-748a4075831a	9263	Kuzma
00050000-5589-6ae9-aff2-8fa328d8a4bb	2318	Laporje
00050000-5589-6ae9-f8df-5753aaeff7eb	3270	Laško
00050000-5589-6ae9-23b9-4efdf67e8a14	1219	Laze v Tuhinju
00050000-5589-6ae9-9d0a-e22d08a4c5fb	2230	Lenart v Slovenskih goricah
00050000-5589-6ae9-6ae3-c3910761fe90	9220	Lendava/Lendva
00050000-5589-6ae9-ca44-14220245519b	4248	Lesce
00050000-5589-6ae9-9709-28e5e1b70bf2	3261	Lesično
00050000-5589-6ae9-8dd8-8dec0b0b7f9b	8273	Leskovec pri Krškem
00050000-5589-6ae9-1a2b-0232a0b508eb	2372	Libeliče
00050000-5589-6ae9-784a-c17116e9202e	2341	Limbuš
00050000-5589-6ae9-061b-3d31a2ddd483	1270	Litija
00050000-5589-6ae9-1bbc-60e26538405a	3202	Ljubečna
00050000-5589-6ae9-e5b2-67559f1fedf4	1000	Ljubljana 
00050000-5589-6ae9-b41b-60a4c1d7bec1	1001	Ljubljana - poštni predali
00050000-5589-6ae9-12f4-c5a9aa869321	1231	Ljubljana - Črnuče
00050000-5589-6ae9-0274-e6223c8c27ea	1261	Ljubljana - Dobrunje
00050000-5589-6ae9-f4fd-d7d4a07e75b6	1260	Ljubljana - Polje
00050000-5589-6ae9-f09a-7b5749838efe	1210	Ljubljana - Šentvid
00050000-5589-6ae9-f363-e71e75944ea4	1211	Ljubljana - Šmartno
00050000-5589-6ae9-aa56-208ec6aad232	3333	Ljubno ob Savinji
00050000-5589-6ae9-5f54-9efd4a06707f	9240	Ljutomer
00050000-5589-6ae9-98c2-8bf5bcadea1e	3215	Loče
00050000-5589-6ae9-cdcf-a78a745c1f8c	5231	Log pod Mangartom
00050000-5589-6ae9-1bdf-1efe2c87abde	1358	Log pri Brezovici
00050000-5589-6ae9-07f5-ce086cf5d0f6	1370	Logatec
00050000-5589-6ae9-f6d8-ca27558a3e96	1371	Logatec
00050000-5589-6ae9-8b1d-d27d6f4127b7	1434	Loka pri Zidanem Mostu
00050000-5589-6ae9-af13-e49d6b4e014d	3223	Loka pri Žusmu
00050000-5589-6ae9-a8d7-18f27758fcb5	6219	Lokev
00050000-5589-6ae9-ee1f-c8f1f5754333	1318	Loški Potok
00050000-5589-6ae9-71e7-d15560dadc2a	2324	Lovrenc na Dravskem polju
00050000-5589-6ae9-ccd1-c7eca5590b9b	2344	Lovrenc na Pohorju
00050000-5589-6ae9-c328-7b63faeb1b00	3334	Luče
00050000-5589-6ae9-e746-578f157c3bec	1225	Lukovica
00050000-5589-6ae9-cbf0-d1c5dbdc5802	9202	Mačkovci
00050000-5589-6ae9-7983-96700367d3c6	2322	Majšperk
00050000-5589-6ae9-2fd2-c361c5e69765	2321	Makole
00050000-5589-6ae9-1727-3461b53a2eb2	9243	Mala Nedelja
00050000-5589-6ae9-b18b-45b1c4fcb229	2229	Malečnik
00050000-5589-6ae9-f923-168037bff709	6273	Marezige
00050000-5589-6ae9-008c-ad775087c4b3	2000	Maribor 
00050000-5589-6ae9-7306-8b1aacd5b03d	2001	Maribor - poštni predali
00050000-5589-6ae9-9967-91fe19903b0b	2206	Marjeta na Dravskem polju
00050000-5589-6ae9-fc21-8b412cd32170	2281	Markovci
00050000-5589-6ae9-4dcb-0ec3dea666e7	9221	Martjanci
00050000-5589-6ae9-0277-266b71fbc403	6242	Materija
00050000-5589-6ae9-fe84-6300d3935d37	4211	Mavčiče
00050000-5589-6ae9-d027-b373b7f56219	1215	Medvode
00050000-5589-6ae9-aebd-2d78423fb7b6	1234	Mengeš
00050000-5589-6ae9-82b6-a64069e975fc	8330	Metlika
00050000-5589-6ae9-a786-9a79ccc61fe9	2392	Mežica
00050000-5589-6ae9-7959-89a8d55bcb2c	2204	Miklavž na Dravskem polju
00050000-5589-6ae9-18d0-a41b49ee9168	2275	Miklavž pri Ormožu
00050000-5589-6ae9-99f9-208efcbcfc09	5291	Miren
00050000-5589-6ae9-0a6d-1046cd6bf05f	8233	Mirna
00050000-5589-6ae9-f91c-d600a7a3de62	8216	Mirna Peč
00050000-5589-6ae9-7438-f68c69fc21d7	2382	Mislinja
00050000-5589-6ae9-7b3b-9a74bef981bd	4281	Mojstrana
00050000-5589-6ae9-9cf8-f4317271e6ae	8230	Mokronog
00050000-5589-6ae9-f806-9b8e1da95517	1251	Moravče
00050000-5589-6ae9-77cc-970cb1e6e674	9226	Moravske Toplice
00050000-5589-6ae9-7bb4-0b036c24d81b	5216	Most na Soči
00050000-5589-6ae9-7c8a-ae14dd925256	1221	Motnik
00050000-5589-6ae9-d732-6642c1f0effd	3330	Mozirje
00050000-5589-6ae9-d55d-58da3a9814d0	9000	Murska Sobota 
00050000-5589-6ae9-6eb8-206429ab9877	9001	Murska Sobota - poštni predali
00050000-5589-6ae9-9818-ebf191d9604d	2366	Muta
00050000-5589-6ae9-d4c2-50f537a837a9	4202	Naklo
00050000-5589-6ae9-ff6c-26dbac9ed7ea	3331	Nazarje
00050000-5589-6ae9-658f-aa39bc8cb314	1357	Notranje Gorice
00050000-5589-6ae9-9bef-645543a42c5f	3203	Nova Cerkev
00050000-5589-6ae9-5b5d-7a9009d32b99	5000	Nova Gorica 
00050000-5589-6ae9-1543-35390c7c153c	5001	Nova Gorica - poštni predali
00050000-5589-6ae9-ca33-f0096d0c3140	1385	Nova vas
00050000-5589-6ae9-0f37-a8c17ee79937	8000	Novo mesto
00050000-5589-6ae9-ca94-69b2de80c44e	8001	Novo mesto - poštni predali
00050000-5589-6ae9-dc1f-b3ad2d258407	6243	Obrov
00050000-5589-6ae9-4e91-970af3d0dc2a	9233	Odranci
00050000-5589-6ae9-78af-968bc7ab1ec0	2317	Oplotnica
00050000-5589-6ae9-48eb-735dc02dd69e	2312	Orehova vas
00050000-5589-6ae9-8460-8ca60a028023	2270	Ormož
00050000-5589-6ae9-35be-903edb0bbb23	1316	Ortnek
00050000-5589-6ae9-9834-571173303f07	1337	Osilnica
00050000-5589-6ae9-53b8-b62983cd2b53	8222	Otočec
00050000-5589-6ae9-0415-b92b26a33a29	2361	Ožbalt
00050000-5589-6ae9-4169-b6da565aef21	2231	Pernica
00050000-5589-6ae9-ad09-0c801eea0a67	2211	Pesnica pri Mariboru
00050000-5589-6ae9-f090-9765b48e431f	9203	Petrovci
00050000-5589-6ae9-9f38-decdfaec77e2	3301	Petrovče
00050000-5589-6ae9-3d55-894a213eb490	6330	Piran/Pirano
00050000-5589-6ae9-1f0e-4991edc7a6ae	8255	Pišece
00050000-5589-6ae9-c5e4-26c315e723a7	6257	Pivka
00050000-5589-6ae9-7234-b9322f267e6e	6232	Planina
00050000-5589-6ae9-39ca-dfd0530559a4	3225	Planina pri Sevnici
00050000-5589-6ae9-3c5a-8c16cd441c96	6276	Pobegi
00050000-5589-6ae9-f128-db90c29cb4f7	8312	Podbočje
00050000-5589-6ae9-04c3-477d8667a63e	5243	Podbrdo
00050000-5589-6ae9-efce-75a5d7823543	3254	Podčetrtek
00050000-5589-6ae9-51ed-f30c6cd01721	2273	Podgorci
00050000-5589-6ae9-a21d-16f615d8a658	6216	Podgorje
00050000-5589-6ae9-8c62-6ebbc8105922	2381	Podgorje pri Slovenj Gradcu
00050000-5589-6ae9-4d1a-c9cb22b2b486	6244	Podgrad
00050000-5589-6ae9-1060-3c09ba97de3c	1414	Podkum
00050000-5589-6ae9-330b-bad1b35ed754	2286	Podlehnik
00050000-5589-6ae9-c1e6-3b0b705325ce	5272	Podnanos
00050000-5589-6ae9-5b49-eb621134b4a5	4244	Podnart
00050000-5589-6ae9-b83b-876ac09d0d4e	3241	Podplat
00050000-5589-6ae9-6aed-0d6181dcabba	3257	Podsreda
00050000-5589-6ae9-41f5-c2391d0ef6ff	2363	Podvelka
00050000-5589-6ae9-27fa-7298686c361a	2208	Pohorje
00050000-5589-6ae9-b3ca-c99e19a0d4b2	2257	Polenšak
00050000-5589-6ae9-bad3-7b89c5a6d6a9	1355	Polhov Gradec
00050000-5589-6ae9-a191-50609fe83fee	4223	Poljane nad Škofjo Loko
00050000-5589-6ae9-78b4-04bb0640b9d4	2319	Poljčane
00050000-5589-6ae9-f2bb-2f0db1cba35c	1272	Polšnik
00050000-5589-6ae9-d607-c96986f22d00	3313	Polzela
00050000-5589-6ae9-ff6b-cb4197dbe2d6	3232	Ponikva
00050000-5589-6ae9-3573-42cff10db81e	6320	Portorož/Portorose
00050000-5589-6ae9-f8a3-ae4446e81dc5	6230	Postojna
00050000-5589-6ae9-bf77-e105f8b273c2	2331	Pragersko
00050000-5589-6ae9-3250-524895637bf9	3312	Prebold
00050000-5589-6ae9-de5f-9be80b5c5b97	4205	Preddvor
00050000-5589-6ae9-6bf6-0826cadcd8ac	6255	Prem
00050000-5589-6ae9-155d-3725453ea759	1352	Preserje
00050000-5589-6ae9-1830-9897647ba09b	6258	Prestranek
00050000-5589-6ae9-f0af-e37c5d612255	2391	Prevalje
00050000-5589-6ae9-c094-e1a279013c60	3262	Prevorje
00050000-5589-6ae9-5cd8-81d000dd94c6	1276	Primskovo 
00050000-5589-6ae9-48f2-325e048f058c	3253	Pristava pri Mestinju
00050000-5589-6ae9-06a5-a143a2aadbb3	9207	Prosenjakovci/Partosfalva
00050000-5589-6ae9-cd33-8988cec1345b	5297	Prvačina
00050000-5589-6ae9-eaf9-ed5979ca615b	2250	Ptuj
00050000-5589-6ae9-e186-5bbcfd399f48	2323	Ptujska Gora
00050000-5589-6ae9-bc85-c2eb1bd88f6a	9201	Puconci
00050000-5589-6ae9-90ea-dd35e1d5d32d	2327	Rače
00050000-5589-6ae9-34db-eba8e6bd52e4	1433	Radeče
00050000-5589-6ae9-d43a-e7f0c904f9fd	9252	Radenci
00050000-5589-6ae9-b127-59b04a6f66c4	2360	Radlje ob Dravi
00050000-5589-6ae9-4ae3-76573382645f	1235	Radomlje
00050000-5589-6ae9-8d2b-5b4c8ed84d9a	4240	Radovljica
00050000-5589-6ae9-070b-060427961a6a	8274	Raka
00050000-5589-6ae9-c11d-b94ba4b65e09	1381	Rakek
00050000-5589-6ae9-dbb6-b1d8505ba782	4283	Rateče - Planica
00050000-5589-6ae9-216f-94bf8b5bda9a	2390	Ravne na Koroškem
00050000-5589-6ae9-6466-4f082fc7a8cb	9246	Razkrižje
00050000-5589-6ae9-00b4-f0ece12ba341	3332	Rečica ob Savinji
00050000-5589-6ae9-0de2-93549da55ead	5292	Renče
00050000-5589-6ae9-e2df-f285354a8580	1310	Ribnica
00050000-5589-6ae9-c1b7-4f590b4ff2f6	2364	Ribnica na Pohorju
00050000-5589-6ae9-d940-c91c75149e51	3272	Rimske Toplice
00050000-5589-6ae9-ed61-b42ab4da030e	1314	Rob
00050000-5589-6ae9-d9ea-ab40dccc2d87	5215	Ročinj
00050000-5589-6ae9-642f-76293c2d6cbf	3250	Rogaška Slatina
00050000-5589-6ae9-0994-b013528ddca6	9262	Rogašovci
00050000-5589-6ae9-ee97-21adde8218cc	3252	Rogatec
00050000-5589-6ae9-eaad-3454d173c631	1373	Rovte
00050000-5589-6ae9-0f5a-7d971fccd7c5	2342	Ruše
00050000-5589-6ae9-6ea2-893bf86e1ab3	1282	Sava
00050000-5589-6ae9-2747-33ab973ceb33	6333	Sečovlje/Sicciole
00050000-5589-6ae9-83ab-ded441e2c92d	4227	Selca
00050000-5589-6ae9-ba91-b6cca9525fcb	2352	Selnica ob Dravi
00050000-5589-6ae9-b424-fe9fa772aa11	8333	Semič
00050000-5589-6ae9-7fdc-ca830fc71b04	8281	Senovo
00050000-5589-6ae9-cbb8-10aaf2e3487d	6224	Senožeče
00050000-5589-6ae9-d0b2-236d644e50c9	8290	Sevnica
00050000-5589-6ae9-533d-a903654fc5c1	6210	Sežana
00050000-5589-6ae9-ac29-a3729f300608	2214	Sladki Vrh
00050000-5589-6ae9-bf37-3c6a8b1ab527	5283	Slap ob Idrijci
00050000-5589-6ae9-88d2-e374dca28afa	2380	Slovenj Gradec
00050000-5589-6ae9-342b-7b18fd4b6ea7	2310	Slovenska Bistrica
00050000-5589-6ae9-7ddb-3cc736619855	3210	Slovenske Konjice
00050000-5589-6ae9-aa32-18e6dd6c6aa4	1216	Smlednik
00050000-5589-6ae9-0f82-46ef49ff67c3	5232	Soča
00050000-5589-6ae9-c81c-47afd3733864	1317	Sodražica
00050000-5589-6ae9-e804-6ef33e7fcd5f	3335	Solčava
00050000-5589-6ae9-fb85-dd8997ba0c2d	5250	Solkan
00050000-5589-6ae9-b261-f2f574c6412a	4229	Sorica
00050000-5589-6ae9-4d31-306c121600a8	4225	Sovodenj
00050000-5589-6ae9-a425-9ce7c567a57d	5281	Spodnja Idrija
00050000-5589-6ae9-3857-54c03c5b200b	2241	Spodnji Duplek
00050000-5589-6ae9-7c20-dfec4cbc6cf5	9245	Spodnji Ivanjci
00050000-5589-6ae9-2e21-040e0870c9e9	2277	Središče ob Dravi
00050000-5589-6ae9-f8d1-7f4e81b7eac9	4267	Srednja vas v Bohinju
00050000-5589-6ae9-e011-339bd58caaae	8256	Sromlje 
00050000-5589-6ae9-f33b-a759f6ea6d98	5224	Srpenica
00050000-5589-6ae9-6521-c8f7eae0456e	1242	Stahovica
00050000-5589-6ae9-548a-8da268e7d3af	1332	Stara Cerkev
00050000-5589-6ae9-1c89-dc353c60d017	8342	Stari trg ob Kolpi
00050000-5589-6ae9-b0c5-09eb715d5a23	1386	Stari trg pri Ložu
00050000-5589-6ae9-effc-94507b62c726	2205	Starše
00050000-5589-6ae9-73ba-c6b62b1f7145	2289	Stoperce
00050000-5589-6ae9-2a92-90516dd48db8	8322	Stopiče
00050000-5589-6ae9-1414-3643bf3b2dd2	3206	Stranice
00050000-5589-6ae9-a180-828db01415f5	8351	Straža
00050000-5589-6ae9-7bf2-ca1864fb3fab	1313	Struge
00050000-5589-6ae9-2283-8079151dab12	8293	Studenec
00050000-5589-6ae9-af90-137a5c1eec5b	8331	Suhor
00050000-5589-6ae9-e7b7-e4131eaed3db	2233	Sv. Ana v Slovenskih goricah
00050000-5589-6ae9-8493-7c16693ca387	2235	Sv. Trojica v Slovenskih goricah
00050000-5589-6ae9-24ba-2f51c6baa9fc	2353	Sveti Duh na Ostrem Vrhu
00050000-5589-6ae9-045b-f3277430d8f2	9244	Sveti Jurij ob Ščavnici
00050000-5589-6ae9-4b13-fdd90bd90928	3264	Sveti Štefan
00050000-5589-6ae9-2c80-b8b93173dcc3	2258	Sveti Tomaž
00050000-5589-6ae9-9fce-1d1670524ecc	9204	Šalovci
00050000-5589-6ae9-fd9b-802cb942b71b	5261	Šempas
00050000-5589-6ae9-eeed-5bb741db9983	5290	Šempeter pri Gorici
00050000-5589-6ae9-8d05-dfce66a07764	3311	Šempeter v Savinjski dolini
00050000-5589-6ae9-14f8-5fe226716961	4208	Šenčur
00050000-5589-6ae9-b5a6-03e3fb4dd9aa	2212	Šentilj v Slovenskih goricah
00050000-5589-6ae9-545e-f26c7e5d7599	8297	Šentjanž
00050000-5589-6ae9-3fcf-49d668c99153	2373	Šentjanž pri Dravogradu
00050000-5589-6ae9-a770-a701ae6f3ade	8310	Šentjernej
00050000-5589-6ae9-b87f-055d457fd260	3230	Šentjur
00050000-5589-6ae9-a698-44200cb166bc	3271	Šentrupert
00050000-5589-6ae9-d067-060ecef52a55	8232	Šentrupert
00050000-5589-6ae9-3ed8-bf9e116783c3	1296	Šentvid pri Stični
00050000-5589-6ae9-9523-6e7d60ed2ab5	8275	Škocjan
00050000-5589-6ae9-6b26-063ea3c975bb	6281	Škofije
00050000-5589-6ae9-eb3c-452cb596db61	4220	Škofja Loka
00050000-5589-6ae9-6cf8-c4acd20acfb8	3211	Škofja vas
00050000-5589-6ae9-2bf8-2da100e80dd0	1291	Škofljica
00050000-5589-6ae9-f9a5-6da11957eebb	6274	Šmarje
00050000-5589-6ae9-37d3-405721b0bac1	1293	Šmarje - Sap
00050000-5589-6ae9-7146-6997cb623730	3240	Šmarje pri Jelšah
00050000-5589-6ae9-7a19-c98fa47f3d62	8220	Šmarješke Toplice
00050000-5589-6ae9-0bc0-60ac0ad2e4d4	2315	Šmartno na Pohorju
00050000-5589-6ae9-e361-0d9a1fef79a5	3341	Šmartno ob Dreti
00050000-5589-6ae9-8402-f527b439bfb4	3327	Šmartno ob Paki
00050000-5589-6ae9-f2bf-7007e4ebe35e	1275	Šmartno pri Litiji
00050000-5589-6ae9-9d1b-b5d6b27c410e	2383	Šmartno pri Slovenj Gradcu
00050000-5589-6ae9-ecff-ffde1be152e6	3201	Šmartno v Rožni dolini
00050000-5589-6ae9-4bac-576fad0dfb1f	3325	Šoštanj
00050000-5589-6ae9-6aa1-81415d8617a4	6222	Štanjel
00050000-5589-6ae9-6b42-d90ab15506a4	3220	Štore
00050000-5589-6ae9-bf13-19ccb44139e4	3304	Tabor
00050000-5589-6ae9-f16e-d82677966480	3221	Teharje
00050000-5589-6ae9-b2b5-4cbf90080bf2	9251	Tišina
00050000-5589-6ae9-8d55-2adfe90acdc9	5220	Tolmin
00050000-5589-6ae9-89d7-367862a7acab	3326	Topolšica
00050000-5589-6ae9-7638-407e116bad3d	2371	Trbonje
00050000-5589-6ae9-62ee-c54b9684d3f1	1420	Trbovlje
00050000-5589-6ae9-96ca-16668a9ba65b	8231	Trebelno 
00050000-5589-6ae9-203d-ba0c83d8f6ff	8210	Trebnje
00050000-5589-6ae9-1fed-b7fcf6333a77	5252	Trnovo pri Gorici
00050000-5589-6ae9-c15b-21e8f85ffc23	2254	Trnovska vas
00050000-5589-6ae9-2ef8-dab0d534b727	1222	Trojane
00050000-5589-6ae9-b671-df35ca10e0bc	1236	Trzin
00050000-5589-6ae9-dad7-1cbaf42f5e16	4290	Tržič
00050000-5589-6ae9-0969-29f76fb9dcb0	8295	Tržišče
00050000-5589-6ae9-a3f8-4699a5fb729b	1311	Turjak
00050000-5589-6ae9-a034-30e9387a5bcf	9224	Turnišče
00050000-5589-6ae9-ff61-bbd43d92bcfc	8323	Uršna sela
00050000-5589-6ae9-cc0f-47146a0778cc	1252	Vače
00050000-5589-6ae9-779b-911f076b763a	3320	Velenje 
00050000-5589-6ae9-bc5f-31f3cb6ac306	3322	Velenje - poštni predali
00050000-5589-6ae9-589a-da6a1341aba9	8212	Velika Loka
00050000-5589-6ae9-f47f-25c545487f2d	2274	Velika Nedelja
00050000-5589-6ae9-4b99-aae36852a03d	9225	Velika Polana
00050000-5589-6ae9-4507-8b9984cb0ee4	1315	Velike Lašče
00050000-5589-6ae9-2b80-f7aa658ee78e	8213	Veliki Gaber
00050000-5589-6ae9-0d0f-1e90d3f41e7d	9241	Veržej
00050000-5589-6ae9-ce48-cae27c13f384	1312	Videm - Dobrepolje
00050000-5589-6ae9-9480-23f123e3b091	2284	Videm pri Ptuju
00050000-5589-6ae9-8e93-24035c19c7d3	8344	Vinica
00050000-5589-6ae9-42c6-3e373a282026	5271	Vipava
00050000-5589-6ae9-e6cc-02df0aed75b4	4212	Visoko
00050000-5589-6ae9-920b-98a466ede355	1294	Višnja Gora
00050000-5589-6ae9-6f4e-2160bccd0467	3205	Vitanje
00050000-5589-6ae9-0227-f5bc45d1e282	2255	Vitomarci
00050000-5589-6ae9-9494-ffb9e84e8ec1	1217	Vodice
00050000-5589-6ae9-2fe3-1f3c2fdfef4e	3212	Vojnik\t
00050000-5589-6ae9-c217-d34ea3d2c5f3	5293	Volčja Draga
00050000-5589-6ae9-bdde-487e4b003f39	2232	Voličina
00050000-5589-6ae9-6769-21c62e74adac	3305	Vransko
00050000-5589-6ae9-2f45-694a2ef09b78	6217	Vremski Britof
00050000-5589-6ae9-e91d-1793c7c76708	1360	Vrhnika
00050000-5589-6ae9-1643-934ec233e3d9	2365	Vuhred
00050000-5589-6ae9-0ee7-12e6cd656d98	2367	Vuzenica
00050000-5589-6ae9-34e7-542fee807d73	8292	Zabukovje 
00050000-5589-6ae9-f5bb-de6ea7c8b617	1410	Zagorje ob Savi
00050000-5589-6ae9-7ef2-f701dc3d9abb	1303	Zagradec
00050000-5589-6ae9-3867-39ac9aacd134	2283	Zavrč
00050000-5589-6ae9-63a2-5c9a644c7463	8272	Zdole 
00050000-5589-6ae9-a653-e9c8ee743e96	4201	Zgornja Besnica
00050000-5589-6ae9-c7a7-85c976b841c3	2242	Zgornja Korena
00050000-5589-6ae9-f0f7-6f99ea409c38	2201	Zgornja Kungota
00050000-5589-6ae9-3ee4-ae8fa378a74d	2316	Zgornja Ložnica
00050000-5589-6ae9-7d4c-fe0d6d761da4	2314	Zgornja Polskava
00050000-5589-6ae9-2ff7-dd562798ec19	2213	Zgornja Velka
00050000-5589-6ae9-4a8d-54db0c16c8df	4247	Zgornje Gorje
00050000-5589-6ae9-e9a1-dab506f425dc	4206	Zgornje Jezersko
00050000-5589-6ae9-b027-723bd2f3ae82	2285	Zgornji Leskovec
00050000-5589-6ae9-640a-6e625c1b9d3d	1432	Zidani Most
00050000-5589-6ae9-8a1a-fd7f627880f0	3214	Zreče
00050000-5589-6ae9-6c7b-1b36343ef757	4209	Žabnica
00050000-5589-6ae9-738d-bd32d0325766	3310	Žalec
00050000-5589-6ae9-d1e1-9e9489ea9df1	4228	Železniki
00050000-5589-6ae9-f252-c405030db49f	2287	Žetale
00050000-5589-6ae9-98ba-5c292b2246ad	4226	Žiri
00050000-5589-6ae9-1efc-ea46ebd49ab9	4274	Žirovnica
00050000-5589-6ae9-5350-d40ce0c0de47	8360	Žužemberk
\.


--
-- TOC entry 2877 (class 0 OID 8090452)
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
-- TOC entry 2859 (class 0 OID 8090263)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 8090341)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8090464)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8090584)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantieme, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 8090637)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5589-6aea-2bcc-46fbb29462f3	00080000-5589-6aea-5a1d-83217e639f66	0900	AK
00190000-5589-6aea-387d-75e717d756b2	00080000-5589-6aea-5591-f58f463cc188	0987	A
00190000-5589-6aea-a919-18ceff514d6b	00080000-5589-6aea-c67e-f48af959b575	0989	A
\.


--
-- TOC entry 2903 (class 0 OID 8090772)
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
-- TOC entry 2883 (class 0 OID 8090493)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5589-6aea-af8e-abaabf4d102a	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5589-6aea-4711-4374052a1580	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5589-6aea-1f3a-7ecb09af3f9c	0003	Kazinska	t	84	Kazinska dvorana
00220000-5589-6aea-b182-f58fd7f266c6	0004	Mali oder	t	24	Mali oder 
00220000-5589-6aea-af7a-96b828626a7a	0005	Komorni oder	t	15	Komorni oder
00220000-5589-6aea-93c4-a0e4e4a2cc07	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5589-6aea-580a-a5c8a9cf2d4e	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2875 (class 0 OID 8090437)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8090427)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8090626)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8090561)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 8090135)
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
-- TOC entry 2884 (class 0 OID 8090503)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 8090173)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5589-6ae9-8b0d-980d847b7f6a	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5589-6ae9-6251-a59950ce12fc	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5589-6ae9-9d95-3747b5841134	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5589-6ae9-d59e-e6cfb381c696	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5589-6ae9-5840-d35b234aede9	planer	Planer dogodkov v koledarju	t
00020000-5589-6ae9-4355-b52f123ca7dc	kadrovska	Kadrovska služba	t
00020000-5589-6ae9-4b3f-6e5c0f9b2492	arhivar	Ažuriranje arhivalij	t
00020000-5589-6ae9-2c81-b2edb18ee7ab	igralec	Igralec	t
00020000-5589-6ae9-acb8-334b044e62a1	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5589-6aea-093c-7d9ffeda06b6	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2850 (class 0 OID 8090157)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5589-6ae9-d5c0-ab0ddfe790b3	00020000-5589-6ae9-9d95-3747b5841134
00010000-5589-6ae9-0540-3ff6f9baaa97	00020000-5589-6ae9-9d95-3747b5841134
00010000-5589-6aea-1c85-b54915348498	00020000-5589-6aea-093c-7d9ffeda06b6
\.


--
-- TOC entry 2886 (class 0 OID 8090517)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 8090458)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8090408)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 8090816)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5589-6ae9-d298-de291181e9c6	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5589-6ae9-4e52-9b00b82ed489	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5589-6ae9-2880-96f4c2fa2ae6	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5589-6ae9-de6a-898bd9203756	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5589-6ae9-f32c-082eb533c1f5	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2907 (class 0 OID 8090808)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5589-6ae9-9f8f-59802a1fdcba	00230000-5589-6ae9-de6a-898bd9203756	popa
00240000-5589-6ae9-13af-c092644da70f	00230000-5589-6ae9-de6a-898bd9203756	oseba
00240000-5589-6ae9-4a94-17c6fc967f3e	00230000-5589-6ae9-4e52-9b00b82ed489	prostor
00240000-5589-6ae9-8d5b-9fd6493b707d	00230000-5589-6ae9-de6a-898bd9203756	besedilo
00240000-5589-6ae9-b2f3-8e7834670e5b	00230000-5589-6ae9-de6a-898bd9203756	uprizoritev
00240000-5589-6ae9-11b3-b01498d8085a	00230000-5589-6ae9-de6a-898bd9203756	funkcija
00240000-5589-6ae9-fde4-f6bfae5e0ed1	00230000-5589-6ae9-de6a-898bd9203756	tipfunkcije
00240000-5589-6ae9-19f7-f82eb54284a8	00230000-5589-6ae9-de6a-898bd9203756	alternacija
00240000-5589-6ae9-9044-2cdd5d3ae0f6	00230000-5589-6ae9-d298-de291181e9c6	pogodba
00240000-5589-6ae9-d78a-9650818146c1	00230000-5589-6ae9-de6a-898bd9203756	zaposlitev
\.


--
-- TOC entry 2906 (class 0 OID 8090803)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8090571)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5589-6aea-3035-fa7c959dbee6	000e0000-5589-6aea-92ad-b9a0cf631845	00080000-5589-6aea-c3df-528d65cfdf9b	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5589-6aea-b8fc-7087e4ffb602	000e0000-5589-6aea-92ad-b9a0cf631845	00080000-5589-6aea-c3df-528d65cfdf9b	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5589-6aea-01e7-c152c25460a5	000e0000-5589-6aea-92ad-b9a0cf631845	00080000-5589-6aea-5c5d-120f713cc4be	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2857 (class 0 OID 8090235)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8090414)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5589-6aea-bfbd-3201aecf26c4	00180000-5589-6aea-49f6-c5414fbaeac1	000c0000-5589-6aea-a574-aa0e4f43731c	00090000-5589-6aea-9bd6-fbdadcdfab2c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5589-6aea-b4ff-f2681e7374b6	00180000-5589-6aea-49f6-c5414fbaeac1	000c0000-5589-6aea-5ddc-27cf76b25090	00090000-5589-6aea-38f1-78bb3ba39147	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5589-6aea-bf96-2a774b2c6048	00180000-5589-6aea-49f6-c5414fbaeac1	000c0000-5589-6aea-81dc-339a03c8c91a	00090000-5589-6aea-a615-f3e5be25e7c2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5589-6aea-77c4-04693492a9a0	00180000-5589-6aea-49f6-c5414fbaeac1	000c0000-5589-6aea-feb1-ce13f25e7de3	00090000-5589-6aea-fb31-74d7dbc419c8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5589-6aea-6f64-dec6df6d3852	00180000-5589-6aea-49f6-c5414fbaeac1	000c0000-5589-6aea-559e-71247ee8d4f8	00090000-5589-6aea-0e77-a1eca2959303	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5589-6aea-5888-8afbad78bba4	00180000-5589-6aea-3058-7ac6cb95cbe9	\N	00090000-5589-6aea-0e77-a1eca2959303	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2894 (class 0 OID 8090615)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5589-6ae9-9f06-8a7905e54054	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5589-6ae9-414b-d8a86b8d2a02	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5589-6ae9-0695-de2a99173c6c	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5589-6ae9-4e86-20c27fbbb7f1	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5589-6ae9-eea9-42156c1bc710	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5589-6ae9-eeb4-454d11367053	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5589-6ae9-c9e9-2462f82fdf14	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5589-6ae9-0cac-5e652f47a88f	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5589-6ae9-9203-8c9e06b8a0f9	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5589-6ae9-6c23-176b5e96014c	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5589-6ae9-0d93-6e492e75e22b	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5589-6ae9-6270-25e354610abc	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5589-6ae9-7d6d-796fc04d6abb	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5589-6ae9-4807-b52adaa00b60	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5589-6ae9-0dc9-a0b00733dbaf	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5589-6ae9-881d-892650b748b3	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2904 (class 0 OID 8090785)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5589-6ae9-d415-36e1323aa7c9	01	Velika predstava	f	1.00	1.00
002b0000-5589-6ae9-dfeb-5e24e3c3992e	02	Mala predstava	f	0.50	0.50
002b0000-5589-6ae9-c0e7-25ded17eb141	03	Mala koprodukcija	t	0.40	1.00
002b0000-5589-6ae9-377a-b28580950596	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5589-6ae9-ee48-35e364cf2822	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2862 (class 0 OID 8090298)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 8090144)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5589-6ae9-0540-3ff6f9baaa97	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROenTDcDT.LteCbHZ60rh4zc72laTT//S	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5589-6aea-c7c3-bc6b7bde2779	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5589-6aea-1d7d-2e183cdf7698	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5589-6aea-c0c2-36bff7f5d8b1	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5589-6aea-4df6-d56f7b82666b	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5589-6aea-34b2-b99cd62b642e	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5589-6aea-e333-a5872c7a6693	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5589-6aea-fe55-afd0e5b0b14a	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5589-6aea-3d35-880b2de3fbba	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5589-6aea-3ff0-3412c4ad8fd1	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5589-6aea-1c85-b54915348498	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5589-6ae9-d5c0-ab0ddfe790b3	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2899 (class 0 OID 8090672)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5589-6aea-fd5a-da61771d5b2f	00160000-5589-6aea-e83d-72884e2af08f	00150000-5589-6ae9-10a1-a12e11a655a3	00140000-5589-6ae9-2420-d25138830fb4	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5589-6aea-af7a-96b828626a7a
000e0000-5589-6aea-92ad-b9a0cf631845	00160000-5589-6aea-0501-6d4f0f961392	00150000-5589-6ae9-f490-9e9e261dfaa1	00140000-5589-6ae9-77ff-87625fb5ae1b	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5589-6aea-93c4-a0e4e4a2cc07
000e0000-5589-6aea-faa0-be51760a72e2	\N	00150000-5589-6ae9-f490-9e9e261dfaa1	00140000-5589-6ae9-77ff-87625fb5ae1b	00190000-5589-6aea-387d-75e717d756b2	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5589-6aea-af7a-96b828626a7a
000e0000-5589-6aea-bb07-2184d5a14c51	\N	00150000-5589-6ae9-f490-9e9e261dfaa1	00140000-5589-6ae9-77ff-87625fb5ae1b	00190000-5589-6aea-387d-75e717d756b2	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5589-6aea-af7a-96b828626a7a
\.


--
-- TOC entry 2867 (class 0 OID 8090360)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5589-6aea-4ff2-a5a312127ada	000e0000-5589-6aea-92ad-b9a0cf631845	1	
00200000-5589-6aea-10eb-62d8bf993dcc	000e0000-5589-6aea-92ad-b9a0cf631845	2	
\.


--
-- TOC entry 2882 (class 0 OID 8090485)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8090554)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 8090392)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 8090662)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5589-6ae9-2420-d25138830fb4	01	Drama	drama (SURS 01)
00140000-5589-6ae9-add2-48296103e21c	02	Opera	opera (SURS 02)
00140000-5589-6ae9-ec94-9432df34e4e4	03	Balet	balet (SURS 03)
00140000-5589-6ae9-4ad1-2360c03cce58	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5589-6ae9-ad19-85caafb92bd6	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5589-6ae9-77ff-87625fb5ae1b	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5589-6ae9-c077-b13948d98f6f	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2888 (class 0 OID 8090544)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5589-6ae9-a254-346498df15db	01	Opera	opera
00150000-5589-6ae9-7854-34848bdde05d	02	Opereta	opereta
00150000-5589-6ae9-d13c-b80d0841195c	03	Balet	balet
00150000-5589-6ae9-5abc-3b3ae2b6f444	04	Plesne prireditve	plesne prireditve
00150000-5589-6ae9-1f72-22c56006b83d	05	Lutkovno gledališče	lutkovno gledališče
00150000-5589-6ae9-a1da-625dc526a945	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5589-6ae9-6914-a48b4c348290	07	Biografska drama	biografska drama
00150000-5589-6ae9-10a1-a12e11a655a3	08	Komedija	komedija
00150000-5589-6ae9-43b7-4e4cb8042b52	09	Črna komedija	črna komedija
00150000-5589-6ae9-d75c-426ec04ab5f8	10	E-igra	E-igra
00150000-5589-6ae9-f490-9e9e261dfaa1	11	Kriminalka	kriminalka
00150000-5589-6ae9-189a-89e244a1e785	12	Musical	musical
\.


--
-- TOC entry 2439 (class 2606 OID 8090198)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 8090719)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8090709)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8090614)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 8090382)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 8090407)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 8090801)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 8090324)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 8090767)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 8090540)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8090358)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 8090401)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 8090338)
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
-- TOC entry 2531 (class 2606 OID 8090450)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 8090477)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 8090296)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 8090207)
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
-- TOC entry 2446 (class 2606 OID 8090231)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 8090187)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2430 (class 2606 OID 8090172)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 8090483)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 8090516)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 8090657)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 8090260)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 8090284)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 8090456)
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
-- TOC entry 2461 (class 2606 OID 8090274)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 8090345)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 8090468)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 8090596)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 8090642)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 8090783)
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
-- TOC entry 2551 (class 2606 OID 8090500)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 8090441)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 8090432)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 8090636)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 8090568)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 8090143)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 8090507)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 8090161)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2432 (class 2606 OID 8090181)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 8090525)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8090463)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 8090413)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 8090825)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 8090813)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 8090807)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 8090581)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 8090240)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 8090423)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8090625)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 8090795)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 8090309)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8090156)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 8090688)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 8090367)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 8090491)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 8090559)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 8090396)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 8090670)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 8090552)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 1259 OID 8090389)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2579 (class 1259 OID 8090582)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2580 (class 1259 OID 8090583)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2453 (class 1259 OID 8090262)
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
-- TOC entry 2544 (class 1259 OID 8090484)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2538 (class 1259 OID 8090470)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2539 (class 1259 OID 8090469)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2490 (class 1259 OID 8090368)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2566 (class 1259 OID 8090541)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2567 (class 1259 OID 8090543)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2568 (class 1259 OID 8090542)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2478 (class 1259 OID 8090340)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2479 (class 1259 OID 8090339)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 8090659)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2598 (class 1259 OID 8090660)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 8090661)
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
-- TOC entry 2606 (class 1259 OID 8090693)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2607 (class 1259 OID 8090690)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2608 (class 1259 OID 8090694)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2609 (class 1259 OID 8090692)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2610 (class 1259 OID 8090691)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2468 (class 1259 OID 8090311)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2469 (class 1259 OID 8090310)
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
-- TOC entry 2444 (class 1259 OID 8090234)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2554 (class 1259 OID 8090508)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2508 (class 1259 OID 8090402)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2434 (class 1259 OID 8090188)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2435 (class 1259 OID 8090189)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2559 (class 1259 OID 8090528)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2560 (class 1259 OID 8090527)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2561 (class 1259 OID 8090526)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2482 (class 1259 OID 8090346)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2483 (class 1259 OID 8090348)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2484 (class 1259 OID 8090347)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2642 (class 1259 OID 8090815)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2518 (class 1259 OID 8090436)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2519 (class 1259 OID 8090434)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2520 (class 1259 OID 8090433)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2521 (class 1259 OID 8090435)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2425 (class 1259 OID 8090162)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2426 (class 1259 OID 8090163)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2547 (class 1259 OID 8090492)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2533 (class 1259 OID 8090457)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2575 (class 1259 OID 8090569)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2576 (class 1259 OID 8090570)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2628 (class 1259 OID 8090771)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2629 (class 1259 OID 8090768)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2630 (class 1259 OID 8090769)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2631 (class 1259 OID 8090770)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2457 (class 1259 OID 8090276)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2458 (class 1259 OID 8090275)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2459 (class 1259 OID 8090277)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2418 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2583 (class 1259 OID 8090597)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2584 (class 1259 OID 8090598)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2620 (class 1259 OID 8090723)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2621 (class 1259 OID 8090725)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2622 (class 1259 OID 8090721)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2623 (class 1259 OID 8090724)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2624 (class 1259 OID 8090722)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2572 (class 1259 OID 8090560)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 8090445)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2525 (class 1259 OID 8090444)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2526 (class 1259 OID 8090442)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2527 (class 1259 OID 8090443)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2396 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2616 (class 1259 OID 8090711)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2617 (class 1259 OID 8090710)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2632 (class 1259 OID 8090784)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2489 (class 1259 OID 8090359)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2639 (class 1259 OID 8090802)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2440 (class 1259 OID 8090209)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2441 (class 1259 OID 8090208)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2449 (class 1259 OID 8090241)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2450 (class 1259 OID 8090242)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2513 (class 1259 OID 8090426)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2514 (class 1259 OID 8090425)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2515 (class 1259 OID 8090424)
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
-- TOC entry 2496 (class 1259 OID 8090391)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2497 (class 1259 OID 8090387)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2498 (class 1259 OID 8090384)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2499 (class 1259 OID 8090385)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2500 (class 1259 OID 8090383)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2501 (class 1259 OID 8090388)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2502 (class 1259 OID 8090386)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2456 (class 1259 OID 8090261)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2474 (class 1259 OID 8090325)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2475 (class 1259 OID 8090327)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2476 (class 1259 OID 8090326)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2477 (class 1259 OID 8090328)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2532 (class 1259 OID 8090451)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2602 (class 1259 OID 8090658)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2611 (class 1259 OID 8090689)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2447 (class 1259 OID 8090232)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2448 (class 1259 OID 8090233)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2569 (class 1259 OID 8090553)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 8090826)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2467 (class 1259 OID 8090297)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2645 (class 1259 OID 8090814)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2552 (class 1259 OID 8090502)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2553 (class 1259 OID 8090501)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 8090720)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2399 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2464 (class 1259 OID 8090285)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 8090671)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2595 (class 1259 OID 8090643)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2596 (class 1259 OID 8090644)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2433 (class 1259 OID 8090182)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2503 (class 1259 OID 8090390)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2674 (class 2606 OID 8090962)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2677 (class 2606 OID 8090947)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2676 (class 2606 OID 8090952)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2672 (class 2606 OID 8090972)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2678 (class 2606 OID 8090942)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2673 (class 2606 OID 8090967)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2675 (class 2606 OID 8090957)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2708 (class 2606 OID 8091117)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2707 (class 2606 OID 8091122)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2659 (class 2606 OID 8090877)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2695 (class 2606 OID 8091057)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2693 (class 2606 OID 8091052)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2694 (class 2606 OID 8091047)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2671 (class 2606 OID 8090937)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2703 (class 2606 OID 8091087)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2701 (class 2606 OID 8091097)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2702 (class 2606 OID 8091092)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2665 (class 2606 OID 8090912)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2666 (class 2606 OID 8090907)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2691 (class 2606 OID 8091037)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2714 (class 2606 OID 8091142)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2713 (class 2606 OID 8091147)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2712 (class 2606 OID 8091152)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2716 (class 2606 OID 8091172)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2719 (class 2606 OID 8091157)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2715 (class 2606 OID 8091177)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2717 (class 2606 OID 8091167)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2718 (class 2606 OID 8091162)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2663 (class 2606 OID 8090902)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2664 (class 2606 OID 8090897)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2655 (class 2606 OID 8090862)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2656 (class 2606 OID 8090857)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2697 (class 2606 OID 8091067)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2679 (class 2606 OID 8090977)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2652 (class 2606 OID 8090837)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2651 (class 2606 OID 8090842)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2698 (class 2606 OID 8091082)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2699 (class 2606 OID 8091077)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2700 (class 2606 OID 8091072)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2669 (class 2606 OID 8090917)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2667 (class 2606 OID 8090927)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2668 (class 2606 OID 8090922)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2733 (class 2606 OID 8091247)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2683 (class 2606 OID 8091012)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2685 (class 2606 OID 8091002)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2686 (class 2606 OID 8090997)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2684 (class 2606 OID 8091007)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2650 (class 2606 OID 8090827)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2649 (class 2606 OID 8090832)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2696 (class 2606 OID 8091062)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2692 (class 2606 OID 8091042)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2706 (class 2606 OID 8091107)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2705 (class 2606 OID 8091112)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2727 (class 2606 OID 8091232)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2730 (class 2606 OID 8091217)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 8091222)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2728 (class 2606 OID 8091227)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2661 (class 2606 OID 8090887)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2662 (class 2606 OID 8090882)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 8090892)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2710 (class 2606 OID 8091127)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2709 (class 2606 OID 8091132)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2724 (class 2606 OID 8091202)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2722 (class 2606 OID 8091212)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2726 (class 2606 OID 8091192)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2723 (class 2606 OID 8091207)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2725 (class 2606 OID 8091197)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2704 (class 2606 OID 8091102)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2687 (class 2606 OID 8091032)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2688 (class 2606 OID 8091027)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2690 (class 2606 OID 8091017)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2689 (class 2606 OID 8091022)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2720 (class 2606 OID 8091187)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2721 (class 2606 OID 8091182)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2731 (class 2606 OID 8091237)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2670 (class 2606 OID 8090932)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2711 (class 2606 OID 8091137)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 8091242)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2653 (class 2606 OID 8090852)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2654 (class 2606 OID 8090847)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2658 (class 2606 OID 8090867)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2657 (class 2606 OID 8090872)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2680 (class 2606 OID 8090992)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2681 (class 2606 OID 8090987)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2682 (class 2606 OID 8090982)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-06-23 16:19:23 CEST

--
-- PostgreSQL database dump complete
--

