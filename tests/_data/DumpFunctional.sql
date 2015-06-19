--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-19 13:06:52 CEST

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
-- TOC entry 2894 (class 0 OID 0)
-- Dependencies: 237
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 7876883)
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
-- TOC entry 227 (class 1259 OID 7877405)
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
-- TOC entry 226 (class 1259 OID 7877388)
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
-- TOC entry 219 (class 1259 OID 7877292)
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
-- TOC entry 194 (class 1259 OID 7877062)
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
-- TOC entry 197 (class 1259 OID 7877096)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 7877005)
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
-- TOC entry 228 (class 1259 OID 7877419)
-- Name: enotaprograma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE enotaprograma (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    program_dela_id uuid,
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
    sort integer,
    tipprogramskeenote_id uuid,
    tip character varying(20) NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 7877222)
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
-- TOC entry 192 (class 1259 OID 7877042)
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
-- TOC entry 196 (class 1259 OID 7877090)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 7877022)
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
-- TOC entry 202 (class 1259 OID 7877139)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 7877164)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 7876979)
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
-- TOC entry 181 (class 1259 OID 7876892)
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
-- TOC entry 182 (class 1259 OID 7876903)
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
-- TOC entry 177 (class 1259 OID 7876857)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 7876876)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 7877171)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 7877202)
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
-- TOC entry 223 (class 1259 OID 7877338)
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
-- TOC entry 184 (class 1259 OID 7876936)
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
    zamejstvo boolean
);


--
-- TOC entry 186 (class 1259 OID 7876971)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 7877145)
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
-- TOC entry 185 (class 1259 OID 7876956)
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
-- TOC entry 191 (class 1259 OID 7877034)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 7877157)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 7877277)
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
-- TOC entry 222 (class 1259 OID 7877330)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 7877449)
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
-- TOC entry 233 (class 1259 OID 7877512)
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
-- TOC entry 230 (class 1259 OID 7877462)
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
-- TOC entry 231 (class 1259 OID 7877481)
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
-- TOC entry 209 (class 1259 OID 7877186)
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
-- TOC entry 201 (class 1259 OID 7877130)
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
-- TOC entry 200 (class 1259 OID 7877120)
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
-- TOC entry 221 (class 1259 OID 7877319)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 7877254)
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
-- TOC entry 174 (class 1259 OID 7876828)
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
-- TOC entry 173 (class 1259 OID 7876826)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 7877196)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 7876866)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 7876850)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 7877210)
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
-- TOC entry 204 (class 1259 OID 7877151)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 7877101)
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
-- TOC entry 236 (class 1259 OID 7877545)
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
-- TOC entry 235 (class 1259 OID 7877537)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 7877532)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 7877264)
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
-- TOC entry 183 (class 1259 OID 7876928)
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
-- TOC entry 199 (class 1259 OID 7877107)
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
-- TOC entry 220 (class 1259 OID 7877308)
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
-- TOC entry 232 (class 1259 OID 7877501)
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
-- TOC entry 188 (class 1259 OID 7876991)
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
-- TOC entry 175 (class 1259 OID 7876837)
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
-- TOC entry 225 (class 1259 OID 7877365)
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
-- TOC entry 193 (class 1259 OID 7877053)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 7877178)
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
-- TOC entry 215 (class 1259 OID 7877247)
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
-- TOC entry 195 (class 1259 OID 7877085)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 7877355)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 7877237)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 7876831)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2831 (class 0 OID 7876883)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 7877405)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5583-f7cc-2180-c07cf0ae521f	000d0000-5583-f7cc-0e71-51d4015582f3	\N	00090000-5583-f7cc-93ce-f99b912b6b8d	\N	000b0000-5583-f7cc-bb59-61fcbb576129	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5583-f7cc-bc4f-0da18f684286	000d0000-5583-f7cc-f6d1-b65c3882bf52	\N	00090000-5583-f7cc-5385-db412bd946b4	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5583-f7cc-0bb2-4773dd0bec38	000d0000-5583-f7cc-4832-0b8f9d761e23	\N	00090000-5583-f7cc-e015-fa5ee726a624	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5583-f7cc-74a8-aefad9410b92	000d0000-5583-f7cc-83d4-7cd8fe2df083	\N	00090000-5583-f7cc-5939-1b855540fad3	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5583-f7cc-2c74-56855f470d02	000d0000-5583-f7cc-b695-abeb5bdfd6a5	\N	00090000-5583-f7cc-3504-73526fb4ebf2	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5583-f7cc-6108-f1a9633c91fb	000d0000-5583-f7cc-123b-cc3f4e676113	\N	00090000-5583-f7cc-5385-db412bd946b4	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2877 (class 0 OID 7877388)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 7877292)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5583-f7cb-4c0d-eedda35fdd07	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5583-f7cb-f689-dea2dd0bc06d	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5583-f7cb-ae5a-e0112426206d	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2845 (class 0 OID 7877062)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5583-f7cc-f0ca-d9a156ab433f	\N	\N	00200000-5583-f7cc-981b-00b58e05a4c3	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5583-f7cc-50bc-204e2078d80e	\N	\N	00200000-5583-f7cc-07f7-e204e80650ad	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5583-f7cc-6e9c-80cbbb180cac	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5583-f7cc-bd32-b7a5050e6b4b	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5583-f7cc-b5d1-90bacdf94f16	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2848 (class 0 OID 7877096)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 7877005)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5583-f7ca-eca1-560a0ab0a538	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5583-f7ca-ce18-b97778c0a359	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5583-f7ca-a1e3-9966318d4532	AL	ALB	008	Albania 	Albanija	\N
00040000-5583-f7ca-fd61-4e70ed341d0c	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5583-f7ca-388a-7d5802b5c6ea	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5583-f7ca-e58f-8be77c1aefbe	AD	AND	020	Andorra 	Andora	\N
00040000-5583-f7ca-8073-8000fdda99a0	AO	AGO	024	Angola 	Angola	\N
00040000-5583-f7ca-ee27-b11c6dc015ad	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5583-f7ca-7d13-0246aba676e5	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5583-f7ca-f938-c618c621d8db	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5583-f7ca-9ac0-39dc9f3f6eee	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5583-f7ca-ba4f-eab2b067aa9d	AM	ARM	051	Armenia 	Armenija	\N
00040000-5583-f7ca-815b-26055a4b6912	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5583-f7ca-a493-e2e9de418d54	AU	AUS	036	Australia 	Avstralija	\N
00040000-5583-f7ca-c177-698bafad331b	AT	AUT	040	Austria 	Avstrija	\N
00040000-5583-f7ca-04bd-7f750d6a4783	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5583-f7ca-b7be-efa61dc03324	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5583-f7ca-c4e1-af8db271922c	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5583-f7ca-3518-bc5dbe51c1df	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5583-f7ca-377b-ec7e1c0d32b5	BB	BRB	052	Barbados 	Barbados	\N
00040000-5583-f7ca-600a-9cfc9d29ba7d	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5583-f7ca-2c9f-8242ac47f7ac	BE	BEL	056	Belgium 	Belgija	\N
00040000-5583-f7ca-1608-258a76d4a364	BZ	BLZ	084	Belize 	Belize	\N
00040000-5583-f7ca-7ec4-70e713dc445e	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5583-f7ca-0cf0-1423d558df18	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5583-f7ca-276e-e9a008c76016	BT	BTN	064	Bhutan 	Butan	\N
00040000-5583-f7ca-7ced-58da6138c586	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5583-f7ca-8be2-995d558f9647	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5583-f7ca-7b40-26b2c60d68b1	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5583-f7ca-e79e-7673b078ca13	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5583-f7ca-b834-c8bfc2c76fe2	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5583-f7ca-ff46-e97222f522ff	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5583-f7ca-952f-f4cea1241f12	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5583-f7ca-9157-70e7605a0c54	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5583-f7ca-e00e-51e94e40accd	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5583-f7ca-b47b-7b8b2a8706d9	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5583-f7ca-fa09-1a952b2e4fba	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5583-f7ca-8520-e0180717f2ba	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5583-f7ca-f4f7-7632c8d42249	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5583-f7ca-e352-b68f2244d4a6	CA	CAN	124	Canada 	Kanada	\N
00040000-5583-f7ca-2ef3-080648cd25ae	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5583-f7ca-3edd-a53c0db934b2	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5583-f7ca-fde6-35410d9a3e00	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5583-f7ca-edf8-63feed51c59a	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5583-f7ca-c960-42079374f7c5	CL	CHL	152	Chile 	Čile	\N
00040000-5583-f7ca-7638-4d7d12fabf1c	CN	CHN	156	China 	Kitajska	\N
00040000-5583-f7ca-8a43-dce2d215fccb	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5583-f7ca-fde8-10bf4f696a60	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5583-f7ca-6110-985c1dd07764	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5583-f7ca-a939-32eef8045545	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5583-f7ca-5e70-50cddea5f087	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5583-f7ca-21cd-e031344eceb7	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5583-f7ca-778d-f29c3fc9b42a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5583-f7ca-815f-88c219ca00d5	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5583-f7ca-b64e-64a87e8a0ddc	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5583-f7ca-1e3b-5ff2bbd51313	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5583-f7ca-70b8-0655493f693b	CU	CUB	192	Cuba 	Kuba	\N
00040000-5583-f7ca-1110-bfd6b17ae901	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5583-f7ca-b18a-0e6cac33554e	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5583-f7ca-000c-7f0a657753da	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5583-f7ca-1570-4f63a4e87422	DK	DNK	208	Denmark 	Danska	\N
00040000-5583-f7ca-60f9-dd2dc5411be5	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5583-f7ca-52e1-6eb4bcd36d85	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5583-f7ca-0be1-1a3ca7e931f8	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5583-f7ca-10b5-71a261226bba	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5583-f7ca-6133-f49097c3f0bd	EG	EGY	818	Egypt 	Egipt	\N
00040000-5583-f7ca-4659-e16d5ec794b9	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5583-f7ca-772e-f8ba206062b4	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5583-f7ca-5af1-2369607a9121	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5583-f7ca-754c-cdcecdc24655	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5583-f7ca-d8ce-bc3f843d2550	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5583-f7ca-3b56-3eebeb00fbf8	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5583-f7ca-c60a-8feba804033b	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5583-f7ca-9186-6d8fb691d7ee	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5583-f7ca-7979-912ef342088a	FI	FIN	246	Finland 	Finska	\N
00040000-5583-f7ca-d197-5cd566d6ec34	FR	FRA	250	France 	Francija	\N
00040000-5583-f7ca-9678-0613ba270cdb	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5583-f7ca-2e37-b1c1ce2b7800	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5583-f7ca-3713-091acf9195d0	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5583-f7ca-ff91-17e832aee804	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5583-f7ca-abab-89c2fadaa4d5	GA	GAB	266	Gabon 	Gabon	\N
00040000-5583-f7ca-fa66-f9a3ce61a840	GM	GMB	270	Gambia 	Gambija	\N
00040000-5583-f7ca-6844-86a16e5fc553	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5583-f7ca-c329-2b59355760e4	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5583-f7ca-f07e-522ecbc25e5b	GH	GHA	288	Ghana 	Gana	\N
00040000-5583-f7ca-1ac1-defa1d08b368	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5583-f7ca-66ab-4e8382e44acd	GR	GRC	300	Greece 	Grčija	\N
00040000-5583-f7ca-bf90-61801eb04af1	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5583-f7ca-aab8-132e5a75429d	GD	GRD	308	Grenada 	Grenada	\N
00040000-5583-f7ca-e195-bf15e7264bb6	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5583-f7ca-d1f8-64164646da50	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5583-f7ca-e53c-c493f1bd67b0	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5583-f7ca-1753-f0f3c6fd2603	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5583-f7ca-b1b8-0a3e2556193c	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5583-f7ca-8588-fc09b1531fa2	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5583-f7ca-46ba-f51948737427	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5583-f7ca-8d1d-57f686e73393	HT	HTI	332	Haiti 	Haiti	\N
00040000-5583-f7ca-f621-7a3773944bac	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5583-f7ca-bdfc-bcf650c7036c	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5583-f7ca-1642-093458d2fe60	HN	HND	340	Honduras 	Honduras	\N
00040000-5583-f7ca-93cf-85b6c2f84000	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5583-f7ca-5769-f3588c037cd3	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5583-f7ca-32e5-d67e1fc09dca	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5583-f7ca-be11-68da9831eb3d	IN	IND	356	India 	Indija	\N
00040000-5583-f7ca-cd54-cbe5f4ab5ba7	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5583-f7ca-c203-e6f1ca876795	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5583-f7ca-b452-b0f2942ef390	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5583-f7ca-f66b-328b5c6e8250	IE	IRL	372	Ireland 	Irska	\N
00040000-5583-f7ca-38f5-66cd9978ade1	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5583-f7ca-dca3-414127b3d629	IL	ISR	376	Israel 	Izrael	\N
00040000-5583-f7ca-4ad5-34b475b273ab	IT	ITA	380	Italy 	Italija	\N
00040000-5583-f7ca-5a1b-1fc45cc82fc4	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5583-f7ca-183e-8cf28ad5aa5d	JP	JPN	392	Japan 	Japonska	\N
00040000-5583-f7ca-4f19-d7c857bc4596	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5583-f7ca-df49-9f980ce9de99	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5583-f7ca-f566-d2d7ec767e4f	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5583-f7ca-b77f-0c22fbc3fa03	KE	KEN	404	Kenya 	Kenija	\N
00040000-5583-f7ca-abc6-1bed5016bc59	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5583-f7ca-c436-f2eabd9585d6	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5583-f7ca-5c35-2a5296e76ef7	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5583-f7ca-ed63-49036d61ba53	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5583-f7ca-c0c5-2fd596f2480b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5583-f7ca-b253-f936a60f183f	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5583-f7ca-2933-1ce6ca2d0ef4	LV	LVA	428	Latvia 	Latvija	\N
00040000-5583-f7ca-2e55-de6cd1aa2fc8	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5583-f7ca-e1c3-bdfff785f7ca	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5583-f7ca-4416-61545a40cf6b	LR	LBR	430	Liberia 	Liberija	\N
00040000-5583-f7ca-d509-db8acf851198	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5583-f7ca-349f-75a16b2639b9	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5583-f7ca-6938-6cb7d4fb97c9	LT	LTU	440	Lithuania 	Litva	\N
00040000-5583-f7ca-4638-7629d5b02a89	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5583-f7ca-a2a6-050cfc828481	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5583-f7ca-18cb-57a247c5487a	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5583-f7ca-0116-dea0c1c84260	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5583-f7ca-923b-d64a66c13af5	MW	MWI	454	Malawi 	Malavi	\N
00040000-5583-f7ca-a458-bddda262d559	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5583-f7ca-433e-6fba9b5e2d08	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5583-f7ca-73e6-2217411da624	ML	MLI	466	Mali 	Mali	\N
00040000-5583-f7ca-754a-bc282b3d69b7	MT	MLT	470	Malta 	Malta	\N
00040000-5583-f7ca-151f-ad423efd05a5	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5583-f7ca-d038-5bbb462384e6	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5583-f7ca-363c-005e211633bb	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5583-f7ca-8dc7-f7b5ea7829e4	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5583-f7ca-c99f-89ca8f0d9bd1	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5583-f7ca-7a27-0b0ee63a88b2	MX	MEX	484	Mexico 	Mehika	\N
00040000-5583-f7ca-02cd-0763b9c9633e	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5583-f7ca-8887-70f602200803	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5583-f7ca-f11a-f3034dcdfab1	MC	MCO	492	Monaco 	Monako	\N
00040000-5583-f7ca-247d-878cf73cf22b	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5583-f7ca-8877-91b149921863	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5583-f7ca-2320-185c2a47a421	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5583-f7ca-0c97-d9678296208b	MA	MAR	504	Morocco 	Maroko	\N
00040000-5583-f7ca-7e42-18aebea78e99	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5583-f7ca-8bda-5dd820b7effc	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5583-f7ca-06d9-95ed7e5fb41e	NA	NAM	516	Namibia 	Namibija	\N
00040000-5583-f7ca-e08e-67944e40c9e2	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5583-f7ca-450f-26297f62c9a4	NP	NPL	524	Nepal 	Nepal	\N
00040000-5583-f7ca-2dd2-65521e75c7b2	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5583-f7ca-10c7-d05b695a2008	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5583-f7ca-9a0c-c70bed5dd1d5	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5583-f7ca-3bc2-685cf9a6b02c	NE	NER	562	Niger 	Niger 	\N
00040000-5583-f7ca-a07a-8da0282714c4	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5583-f7ca-4b4a-f5e02767818e	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5583-f7ca-43aa-77624de36c26	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5583-f7ca-27c1-dfd8ee815bc6	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5583-f7ca-35b8-389bf8616cfc	NO	NOR	578	Norway 	Norveška	\N
00040000-5583-f7ca-88d6-2ad7f077c457	OM	OMN	512	Oman 	Oman	\N
00040000-5583-f7ca-ad43-667eea86d324	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5583-f7ca-acc9-742692aad984	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5583-f7ca-f891-b8bdd85453fb	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5583-f7ca-d5d5-6273e2ef2d70	PA	PAN	591	Panama 	Panama	\N
00040000-5583-f7ca-87df-ed4b19c75a45	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5583-f7ca-ec68-124df90d016b	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5583-f7ca-186c-4ce7857e0e6d	PE	PER	604	Peru 	Peru	\N
00040000-5583-f7ca-5ed3-f6aad8bdf4dd	PH	PHL	608	Philippines 	Filipini	\N
00040000-5583-f7ca-ccc3-f483f5e154f4	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5583-f7ca-aa8b-bac4a5f80947	PL	POL	616	Poland 	Poljska	\N
00040000-5583-f7ca-9667-8b3bf1c7cd22	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5583-f7ca-8a1f-1a5f47b6c6b3	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5583-f7ca-bff4-6f646c3f130f	QA	QAT	634	Qatar 	Katar	\N
00040000-5583-f7ca-a288-310bb0c9d46b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5583-f7ca-40f2-b893de65c7d2	RO	ROU	642	Romania 	Romunija	\N
00040000-5583-f7ca-975c-2ba2dc9257cb	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5583-f7ca-d75f-89170ae3f28d	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5583-f7ca-599c-f3c8f33fcbec	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5583-f7ca-6f94-5f850c9dd52f	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5583-f7ca-1538-7ab7cc5f90e3	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5583-f7ca-36d1-5d26afd24f6f	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5583-f7ca-7e95-6ce57a01970b	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5583-f7ca-0655-4ab4bcf89027	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5583-f7ca-6725-01cd73336446	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5583-f7ca-3117-9727e20973cc	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5583-f7ca-6cd5-c6b6ac805eb5	SM	SMR	674	San Marino 	San Marino	\N
00040000-5583-f7ca-90a2-ba903f1993e1	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5583-f7ca-d8eb-8bb683044173	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5583-f7ca-7616-1b68fc8614dd	SN	SEN	686	Senegal 	Senegal	\N
00040000-5583-f7ca-eeb2-473714b123a2	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5583-f7ca-42c9-a1e065dd19f9	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5583-f7ca-b8fb-4c452062a508	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5583-f7ca-375d-b23302af494f	SG	SGP	702	Singapore 	Singapur	\N
00040000-5583-f7ca-ac8a-464eac330549	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5583-f7ca-f980-b2d8ce83c15a	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5583-f7ca-b781-ed536779efdd	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5583-f7ca-d2b8-e9ccc98be0f5	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5583-f7ca-6cd8-f04e880c6a05	SO	SOM	706	Somalia 	Somalija	\N
00040000-5583-f7ca-9e4e-485e814bf54e	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5583-f7ca-ef43-436242b374b6	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5583-f7ca-bbd4-7c1957839f21	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5583-f7ca-2fef-6956f34db69f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5583-f7ca-9bbc-de6d904c7953	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5583-f7ca-3ea6-e803d8f5bd82	SD	SDN	729	Sudan 	Sudan	\N
00040000-5583-f7ca-5311-313aed2736ac	SR	SUR	740	Suriname 	Surinam	\N
00040000-5583-f7ca-ec95-a5daed65df04	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5583-f7ca-8315-b2e8a3d0c514	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5583-f7ca-7d8a-2dd5c45c350f	SE	SWE	752	Sweden 	Švedska	\N
00040000-5583-f7ca-4e97-a47a913f6bd1	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5583-f7ca-381e-16ae49f29a6e	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5583-f7ca-2d14-c7722a7c41ae	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5583-f7ca-71d7-1a9ce25ec114	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5583-f7ca-949e-1a9e4ebbfc69	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5583-f7ca-6df2-40a1dd2bd75d	TH	THA	764	Thailand 	Tajska	\N
00040000-5583-f7ca-1ffb-66e42be918dc	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5583-f7ca-20c8-1a1fe734fae0	TG	TGO	768	Togo 	Togo	\N
00040000-5583-f7ca-d6b1-22b6471a9c71	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5583-f7ca-0243-944d54a5e41a	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5583-f7ca-3e08-43a68ac52fd1	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5583-f7ca-1a1d-1add2a31d77e	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5583-f7ca-8206-92a0c4ffd167	TR	TUR	792	Turkey 	Turčija	\N
00040000-5583-f7ca-8ce8-7477eaf45ded	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5583-f7ca-b26a-e1f9c1dd592e	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5583-f7ca-56c8-fc78da6246d9	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5583-f7ca-0dc1-4ec8de612f8e	UG	UGA	800	Uganda 	Uganda	\N
00040000-5583-f7ca-a58c-6cfeda4a2fb8	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5583-f7ca-2c34-9a1d3acf153b	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5583-f7ca-c006-097782fdc0b4	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5583-f7ca-c8d0-0a8fed648714	US	USA	840	United States 	Združene države Amerike	\N
00040000-5583-f7ca-5dd1-a03125eacad1	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5583-f7ca-d696-1aa6a46a38ce	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5583-f7ca-3075-71f75d077d42	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5583-f7ca-d22a-603f9a2c0445	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5583-f7ca-38db-9ec2bafb552c	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5583-f7ca-373a-c977f997cd60	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5583-f7ca-127b-6e194b80a84c	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5583-f7ca-3b60-2f5ad7bbc759	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5583-f7ca-9071-35810b67faea	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5583-f7ca-2559-db0719306083	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5583-f7ca-08b6-345b398deb55	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5583-f7ca-734e-234684775ddd	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5583-f7ca-3657-cddacdc22936	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2879 (class 0 OID 7877419)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, opredelitevdrugiviri, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, sort, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 7877222)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5583-f7cc-d402-0d6ddc2f08a9	000e0000-5583-f7cc-b3c3-b5e0e18795b9	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5583-f7ca-bdfe-8c3789fdeedb
000d0000-5583-f7cc-0e71-51d4015582f3	000e0000-5583-f7cc-b3c3-b5e0e18795b9	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5583-f7ca-bdfe-8c3789fdeedb
000d0000-5583-f7cc-f6d1-b65c3882bf52	000e0000-5583-f7cc-b3c3-b5e0e18795b9	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5583-f7ca-89bf-7d52f5b1d729
000d0000-5583-f7cc-4832-0b8f9d761e23	000e0000-5583-f7cc-b3c3-b5e0e18795b9	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5583-f7ca-d037-5ad4a1fcdb91
000d0000-5583-f7cc-83d4-7cd8fe2df083	000e0000-5583-f7cc-b3c3-b5e0e18795b9	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5583-f7ca-d037-5ad4a1fcdb91
000d0000-5583-f7cc-b695-abeb5bdfd6a5	000e0000-5583-f7cc-b3c3-b5e0e18795b9	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5583-f7ca-d037-5ad4a1fcdb91
000d0000-5583-f7cc-123b-cc3f4e676113	000e0000-5583-f7cc-b3c3-b5e0e18795b9	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5583-f7ca-bdfe-8c3789fdeedb
\.


--
-- TOC entry 2843 (class 0 OID 7877042)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 7877090)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 7877022)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5583-f7cc-d223-c2ff1e0a4531	00080000-5583-f7cb-c165-f549ba4930a3	00090000-5583-f7cc-93ce-f99b912b6b8d	AK		
\.


--
-- TOC entry 2821 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 7877139)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 7877164)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 7876979)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5583-f7ca-fa85-4fd45c1c9b32	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5583-f7ca-7aa1-5bb885804630	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5583-f7ca-3f2a-7ea825e4b79c	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5583-f7ca-be7f-511b3a72efe8	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5583-f7ca-e86a-a9798bebfbe6	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5583-f7ca-8287-b1f02312c954	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5583-f7ca-1f6b-6a1236721be5	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5583-f7ca-f723-7f8d0853ee95	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5583-f7ca-b8bf-bf91eb562473	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5583-f7ca-313e-49f03a8b1238	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5583-f7ca-9126-d2d8c7d184d0	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5583-f7ca-fba6-71d1a4706742	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5583-f7ca-3213-f8b7bfc2abc4	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5583-f7cb-2dbb-87ea78e7eb1c	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5583-f7cb-78d7-ab82e41120bd	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5583-f7cb-7c4f-24533ce6b217	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5583-f7cb-6b07-380b1c82cf50	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5583-f7cb-42d7-621dcf3d563c	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5583-f7cb-9fd9-3874c45a0cfe	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2832 (class 0 OID 7876892)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5583-f7cb-3884-d38bcf868edc	00000000-5583-f7cb-78d7-ab82e41120bd	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5583-f7cb-cd6d-f55fcf48c3d5	00000000-5583-f7cb-78d7-ab82e41120bd	00010000-5583-f7ca-bb4d-3c4f84278d88	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5583-f7cb-078a-36369752992e	00000000-5583-f7cb-7c4f-24533ce6b217	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2833 (class 0 OID 7876903)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5583-f7cc-0d6b-7086c5f569ac	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5583-f7cc-5939-1b855540fad3	00010000-5583-f7cc-c1b3-16df326f6281	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5583-f7cc-e015-fa5ee726a624	00010000-5583-f7cc-2f0d-c6c923e2586b	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5583-f7cc-6a18-f4b55a7aad9c	00010000-5583-f7cc-5381-1852f473e13d	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5583-f7cc-39db-3b89bbc6da0f	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5583-f7cc-2c1b-2f195847d16c	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5583-f7cc-2b28-a91f0c96a5e3	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5583-f7cc-ae0f-51b15743a4e9	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5583-f7cc-93ce-f99b912b6b8d	00010000-5583-f7cc-4ec8-2eabd3bdc02e	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5583-f7cc-5385-db412bd946b4	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5583-f7cc-ce39-3122c5d7ad96	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5583-f7cc-3504-73526fb4ebf2	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5583-f7cc-3774-f5778577e467	00010000-5583-f7cc-23b7-85d01ad15011	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2823 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 7876857)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5583-f7ca-a73e-5a7668cb8ba1	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5583-f7ca-dbef-8109e686fe02	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5583-f7ca-0286-62874e4ac8cd	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5583-f7ca-4fad-a98c1d247fce	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5583-f7ca-0893-e9a4b7d25eda	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5583-f7ca-6b38-f6f00057038a	Abonma-read	Abonma - branje	f
00030000-5583-f7ca-1e64-1043eee5c207	Abonma-write	Abonma - spreminjanje	f
00030000-5583-f7ca-4a96-caa4ee9b13ea	Alternacija-read	Alternacija - branje	f
00030000-5583-f7ca-f86c-0e18d6a6feae	Alternacija-write	Alternacija - spreminjanje	f
00030000-5583-f7ca-6e69-4882a0af9fa1	Arhivalija-read	Arhivalija - branje	f
00030000-5583-f7ca-d38a-bd42c96c515a	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5583-f7ca-c1a9-db45d4f34f12	Besedilo-read	Besedilo - branje	f
00030000-5583-f7ca-f4a5-9c9886032755	Besedilo-write	Besedilo - spreminjanje	f
00030000-5583-f7ca-9747-14c1575d0597	DogodekIzven-read	DogodekIzven - branje	f
00030000-5583-f7ca-e338-71aa8ae3b696	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5583-f7ca-9938-b6127d11a3e3	Dogodek-read	Dogodek - branje	f
00030000-5583-f7ca-5da4-d4272a83b268	Dogodek-write	Dogodek - spreminjanje	f
00030000-5583-f7ca-2aa8-67082d1ce7a0	Drzava-read	Drzava - branje	f
00030000-5583-f7ca-deae-bee815ccc83c	Drzava-write	Drzava - spreminjanje	f
00030000-5583-f7ca-4cce-1d592f32b264	Funkcija-read	Funkcija - branje	f
00030000-5583-f7ca-e4f8-f47f66e9c57b	Funkcija-write	Funkcija - spreminjanje	f
00030000-5583-f7ca-5b68-f584fd7b5cc0	Gostovanje-read	Gostovanje - branje	f
00030000-5583-f7ca-6984-6f8cc98f521e	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5583-f7ca-fc0d-39fd91a8c186	Gostujoca-read	Gostujoca - branje	f
00030000-5583-f7ca-dfd2-eea4238a26cd	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5583-f7ca-d144-2578bcd3e422	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5583-f7ca-fe57-3be7d6195001	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5583-f7ca-ae6e-f40059337e49	Kupec-read	Kupec - branje	f
00030000-5583-f7ca-8212-0318bef33a53	Kupec-write	Kupec - spreminjanje	f
00030000-5583-f7ca-9176-3e1078fcd4eb	NacinPlacina-read	NacinPlacina - branje	f
00030000-5583-f7ca-b82a-4196cd96a647	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5583-f7ca-e114-5998b5d3e624	Option-read	Option - branje	f
00030000-5583-f7ca-d585-bcd0445f21cf	Option-write	Option - spreminjanje	f
00030000-5583-f7ca-2470-c4dcd3a7edda	OptionValue-read	OptionValue - branje	f
00030000-5583-f7ca-5860-cd36c623aad1	OptionValue-write	OptionValue - spreminjanje	f
00030000-5583-f7ca-5717-53a147b14402	Oseba-read	Oseba - branje	f
00030000-5583-f7ca-a48c-a0b21cd0417a	Oseba-write	Oseba - spreminjanje	f
00030000-5583-f7ca-1787-60e30c94798c	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5583-f7ca-947a-677a4887744c	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5583-f7ca-200e-ac6111cfe3f5	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5583-f7ca-6dc5-05dab50c5ab4	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5583-f7ca-12cc-685b1d13a605	Pogodba-read	Pogodba - branje	f
00030000-5583-f7ca-fa40-40b791a980ec	Pogodba-write	Pogodba - spreminjanje	f
00030000-5583-f7ca-f41b-8150ca5d3513	Popa-read	Popa - branje	f
00030000-5583-f7ca-f418-2bd054755f1a	Popa-write	Popa - spreminjanje	f
00030000-5583-f7ca-186b-66cf45d39aa4	Posta-read	Posta - branje	f
00030000-5583-f7ca-0256-fba9e60b4710	Posta-write	Posta - spreminjanje	f
00030000-5583-f7ca-00e0-b8397a791344	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5583-f7ca-6009-001de946d897	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5583-f7ca-8d70-9e09c34824bb	PostniNaslov-read	PostniNaslov - branje	f
00030000-5583-f7ca-2791-93f53791f0ab	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5583-f7ca-cbea-b48c2e78bc5a	Predstava-read	Predstava - branje	f
00030000-5583-f7ca-f322-40efba156d95	Predstava-write	Predstava - spreminjanje	f
00030000-5583-f7ca-7890-5e4dda660a2e	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5583-f7ca-0939-3b775538ef25	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5583-f7ca-fe06-7dec33d9066a	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5583-f7ca-a62e-42f7cf3e5bf3	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5583-f7ca-32c6-cc5234e8675e	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5583-f7ca-9e51-c377663bd8a2	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5583-f7ca-dd20-c1915b4e6b08	ProgramDela-read	ProgramDela - branje	f
00030000-5583-f7ca-f93c-495b2c30b9b7	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5583-f7ca-83fc-630640a93381	ProgramFestival-read	ProgramFestival - branje	f
00030000-5583-f7ca-d20b-6ed529841c81	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5583-f7ca-f0a8-4b812f85e85f	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5583-f7ca-4ac1-210ba320c2c2	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5583-f7ca-f7bf-e485800614df	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5583-f7ca-a7e7-f984ea6e14d0	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5583-f7ca-48ad-47ad572055d5	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5583-f7ca-9a70-bcb4fddbc4ec	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5583-f7ca-d566-b3364cb6afee	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5583-f7ca-b924-97c812c0cc7c	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5583-f7ca-4242-ff95d77e7643	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5583-f7ca-9a17-74b53da4e497	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5583-f7ca-defd-8917e7190d19	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5583-f7ca-a1d2-22d4df42ff57	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5583-f7ca-8302-f81355498663	ProgramRazno-read	ProgramRazno - branje	f
00030000-5583-f7ca-02d7-abffca5cd977	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5583-f7ca-5f9c-0f524e0c2b27	Prostor-read	Prostor - branje	f
00030000-5583-f7ca-1457-48c19fd8823e	Prostor-write	Prostor - spreminjanje	f
00030000-5583-f7ca-7e0f-d6d752c2f875	Racun-read	Racun - branje	f
00030000-5583-f7ca-7b57-ad36e29be473	Racun-write	Racun - spreminjanje	f
00030000-5583-f7ca-b592-1fc8175a9db1	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5583-f7ca-116c-80371186d087	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5583-f7ca-1778-4af80a16402d	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5583-f7ca-dbcf-5183d781b820	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5583-f7ca-148f-bfd3e6d93ae6	Rekvizit-read	Rekvizit - branje	f
00030000-5583-f7ca-fee3-1204c7406482	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5583-f7ca-2536-4cc24cd50502	Revizija-read	Revizija - branje	f
00030000-5583-f7ca-6297-b33c737c27e5	Revizija-write	Revizija - spreminjanje	f
00030000-5583-f7ca-5963-f71dd8eac78e	Rezervacija-read	Rezervacija - branje	f
00030000-5583-f7ca-b230-4c3f3a60088f	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5583-f7ca-0938-06cdbbe9a5f5	SedezniRed-read	SedezniRed - branje	f
00030000-5583-f7ca-c06f-22631dbb1da9	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5583-f7ca-1938-0309b4733463	Sedez-read	Sedez - branje	f
00030000-5583-f7ca-74ef-464d51af9391	Sedez-write	Sedez - spreminjanje	f
00030000-5583-f7ca-2280-fb64cee71fb4	Sezona-read	Sezona - branje	f
00030000-5583-f7ca-3640-4ea33f248a7d	Sezona-write	Sezona - spreminjanje	f
00030000-5583-f7ca-88c6-7a2d351455f5	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5583-f7ca-2126-8d0443b2cabe	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5583-f7ca-57a7-e2f4d5e25647	Stevilcenje-read	Stevilcenje - branje	f
00030000-5583-f7ca-6bed-a1c1fa05dbfe	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5583-f7ca-4d1f-cf0fa9ffe9b4	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5583-f7ca-8d87-a1b8c2a5f190	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5583-f7ca-c929-3cf81daaf3af	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5583-f7ca-e571-586bf2197c35	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5583-f7ca-0bf3-533fbe98abc9	Telefonska-read	Telefonska - branje	f
00030000-5583-f7ca-25fd-8e2b04b59bb7	Telefonska-write	Telefonska - spreminjanje	f
00030000-5583-f7ca-c0fc-5fd4624a2bfe	TerminStoritve-read	TerminStoritve - branje	f
00030000-5583-f7ca-6ec7-a870b1167bdd	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5583-f7ca-779a-ccfefc5a6ee9	TipFunkcije-read	TipFunkcije - branje	f
00030000-5583-f7ca-9d99-f012c4517a6b	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5583-f7ca-b4fd-8942680e4da7	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5583-f7ca-e540-e28442f66b1e	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5583-f7ca-bb0c-99a4308c8616	Trr-read	Trr - branje	f
00030000-5583-f7ca-2bb4-823857e436f7	Trr-write	Trr - spreminjanje	f
00030000-5583-f7ca-ac02-9d3a50079727	Uprizoritev-read	Uprizoritev - branje	f
00030000-5583-f7ca-4312-ece02f913f72	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5583-f7ca-c8b3-35d7c3afe592	Vaja-read	Vaja - branje	f
00030000-5583-f7ca-5bbd-a745becd565f	Vaja-write	Vaja - spreminjanje	f
00030000-5583-f7ca-1f83-8aafeacbae88	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5583-f7ca-3fd3-8cc82cc0e635	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5583-f7ca-a71e-f40ddf476d64	Zaposlitev-read	Zaposlitev - branje	f
00030000-5583-f7ca-73f6-088ac255023a	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5583-f7ca-1270-9342df898d07	Zasedenost-read	Zasedenost - branje	f
00030000-5583-f7ca-4793-cb04102cc3a6	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5583-f7ca-4b90-1e41ef7f222f	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5583-f7ca-803a-a368a5211e05	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5583-f7ca-0328-693b8ed620f7	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5583-f7ca-d2f4-0ad9440dad1c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2830 (class 0 OID 7876876)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5583-f7ca-bf99-6567d6e6a21d	00030000-5583-f7ca-dbef-8109e686fe02
00020000-5583-f7ca-aed4-11babaa48314	00030000-5583-f7ca-2aa8-67082d1ce7a0
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-6b38-f6f00057038a
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-1e64-1043eee5c207
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-4a96-caa4ee9b13ea
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-f86c-0e18d6a6feae
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-6e69-4882a0af9fa1
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-9938-b6127d11a3e3
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-4fad-a98c1d247fce
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-5da4-d4272a83b268
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-2aa8-67082d1ce7a0
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-deae-bee815ccc83c
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-4cce-1d592f32b264
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-e4f8-f47f66e9c57b
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-5b68-f584fd7b5cc0
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-6984-6f8cc98f521e
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-fc0d-39fd91a8c186
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-dfd2-eea4238a26cd
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-d144-2578bcd3e422
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-fe57-3be7d6195001
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-e114-5998b5d3e624
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-2470-c4dcd3a7edda
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-5717-53a147b14402
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-a48c-a0b21cd0417a
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-f41b-8150ca5d3513
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-f418-2bd054755f1a
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-186b-66cf45d39aa4
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-0256-fba9e60b4710
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-8d70-9e09c34824bb
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-2791-93f53791f0ab
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-cbea-b48c2e78bc5a
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-f322-40efba156d95
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-32c6-cc5234e8675e
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-9e51-c377663bd8a2
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-5f9c-0f524e0c2b27
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-1457-48c19fd8823e
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-1778-4af80a16402d
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-dbcf-5183d781b820
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-148f-bfd3e6d93ae6
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-fee3-1204c7406482
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-2280-fb64cee71fb4
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-3640-4ea33f248a7d
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-779a-ccfefc5a6ee9
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-ac02-9d3a50079727
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-4312-ece02f913f72
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-c8b3-35d7c3afe592
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-5bbd-a745becd565f
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-1270-9342df898d07
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-4793-cb04102cc3a6
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-4b90-1e41ef7f222f
00020000-5583-f7ca-3bdc-d51b56e9858e	00030000-5583-f7ca-0328-693b8ed620f7
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-6b38-f6f00057038a
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-6e69-4882a0af9fa1
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-9938-b6127d11a3e3
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-2aa8-67082d1ce7a0
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-5b68-f584fd7b5cc0
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-fc0d-39fd91a8c186
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-d144-2578bcd3e422
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-fe57-3be7d6195001
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-e114-5998b5d3e624
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-2470-c4dcd3a7edda
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-5717-53a147b14402
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-a48c-a0b21cd0417a
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-f41b-8150ca5d3513
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-186b-66cf45d39aa4
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-8d70-9e09c34824bb
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-2791-93f53791f0ab
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-cbea-b48c2e78bc5a
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-5f9c-0f524e0c2b27
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-1778-4af80a16402d
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-148f-bfd3e6d93ae6
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-2280-fb64cee71fb4
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-0bf3-533fbe98abc9
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-25fd-8e2b04b59bb7
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-bb0c-99a4308c8616
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-2bb4-823857e436f7
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-a71e-f40ddf476d64
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-73f6-088ac255023a
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-4b90-1e41ef7f222f
00020000-5583-f7ca-c961-4d5b29ce552c	00030000-5583-f7ca-0328-693b8ed620f7
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-6b38-f6f00057038a
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-4a96-caa4ee9b13ea
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-6e69-4882a0af9fa1
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-d38a-bd42c96c515a
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-c1a9-db45d4f34f12
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-9747-14c1575d0597
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-9938-b6127d11a3e3
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-2aa8-67082d1ce7a0
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-4cce-1d592f32b264
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-5b68-f584fd7b5cc0
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-fc0d-39fd91a8c186
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-d144-2578bcd3e422
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-e114-5998b5d3e624
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-2470-c4dcd3a7edda
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-5717-53a147b14402
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-f41b-8150ca5d3513
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-186b-66cf45d39aa4
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-cbea-b48c2e78bc5a
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-32c6-cc5234e8675e
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-5f9c-0f524e0c2b27
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-1778-4af80a16402d
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-148f-bfd3e6d93ae6
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-2280-fb64cee71fb4
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-779a-ccfefc5a6ee9
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-c8b3-35d7c3afe592
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-1270-9342df898d07
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-4b90-1e41ef7f222f
00020000-5583-f7ca-9bc7-8d473e8f5406	00030000-5583-f7ca-0328-693b8ed620f7
00020000-5583-f7ca-eb99-615bc3cea97f	00030000-5583-f7ca-6b38-f6f00057038a
00020000-5583-f7ca-eb99-615bc3cea97f	00030000-5583-f7ca-1e64-1043eee5c207
00020000-5583-f7ca-eb99-615bc3cea97f	00030000-5583-f7ca-f86c-0e18d6a6feae
00020000-5583-f7ca-eb99-615bc3cea97f	00030000-5583-f7ca-6e69-4882a0af9fa1
00020000-5583-f7ca-eb99-615bc3cea97f	00030000-5583-f7ca-9938-b6127d11a3e3
00020000-5583-f7ca-eb99-615bc3cea97f	00030000-5583-f7ca-2aa8-67082d1ce7a0
00020000-5583-f7ca-eb99-615bc3cea97f	00030000-5583-f7ca-5b68-f584fd7b5cc0
00020000-5583-f7ca-eb99-615bc3cea97f	00030000-5583-f7ca-fc0d-39fd91a8c186
00020000-5583-f7ca-eb99-615bc3cea97f	00030000-5583-f7ca-e114-5998b5d3e624
00020000-5583-f7ca-eb99-615bc3cea97f	00030000-5583-f7ca-2470-c4dcd3a7edda
00020000-5583-f7ca-eb99-615bc3cea97f	00030000-5583-f7ca-f41b-8150ca5d3513
00020000-5583-f7ca-eb99-615bc3cea97f	00030000-5583-f7ca-186b-66cf45d39aa4
00020000-5583-f7ca-eb99-615bc3cea97f	00030000-5583-f7ca-cbea-b48c2e78bc5a
00020000-5583-f7ca-eb99-615bc3cea97f	00030000-5583-f7ca-5f9c-0f524e0c2b27
00020000-5583-f7ca-eb99-615bc3cea97f	00030000-5583-f7ca-1778-4af80a16402d
00020000-5583-f7ca-eb99-615bc3cea97f	00030000-5583-f7ca-148f-bfd3e6d93ae6
00020000-5583-f7ca-eb99-615bc3cea97f	00030000-5583-f7ca-2280-fb64cee71fb4
00020000-5583-f7ca-eb99-615bc3cea97f	00030000-5583-f7ca-779a-ccfefc5a6ee9
00020000-5583-f7ca-eb99-615bc3cea97f	00030000-5583-f7ca-4b90-1e41ef7f222f
00020000-5583-f7ca-eb99-615bc3cea97f	00030000-5583-f7ca-0328-693b8ed620f7
00020000-5583-f7ca-90fc-e5e46fbd7966	00030000-5583-f7ca-6b38-f6f00057038a
00020000-5583-f7ca-90fc-e5e46fbd7966	00030000-5583-f7ca-6e69-4882a0af9fa1
00020000-5583-f7ca-90fc-e5e46fbd7966	00030000-5583-f7ca-9938-b6127d11a3e3
00020000-5583-f7ca-90fc-e5e46fbd7966	00030000-5583-f7ca-2aa8-67082d1ce7a0
00020000-5583-f7ca-90fc-e5e46fbd7966	00030000-5583-f7ca-5b68-f584fd7b5cc0
00020000-5583-f7ca-90fc-e5e46fbd7966	00030000-5583-f7ca-fc0d-39fd91a8c186
00020000-5583-f7ca-90fc-e5e46fbd7966	00030000-5583-f7ca-e114-5998b5d3e624
00020000-5583-f7ca-90fc-e5e46fbd7966	00030000-5583-f7ca-2470-c4dcd3a7edda
00020000-5583-f7ca-90fc-e5e46fbd7966	00030000-5583-f7ca-f41b-8150ca5d3513
00020000-5583-f7ca-90fc-e5e46fbd7966	00030000-5583-f7ca-186b-66cf45d39aa4
00020000-5583-f7ca-90fc-e5e46fbd7966	00030000-5583-f7ca-cbea-b48c2e78bc5a
00020000-5583-f7ca-90fc-e5e46fbd7966	00030000-5583-f7ca-5f9c-0f524e0c2b27
00020000-5583-f7ca-90fc-e5e46fbd7966	00030000-5583-f7ca-1778-4af80a16402d
00020000-5583-f7ca-90fc-e5e46fbd7966	00030000-5583-f7ca-148f-bfd3e6d93ae6
00020000-5583-f7ca-90fc-e5e46fbd7966	00030000-5583-f7ca-2280-fb64cee71fb4
00020000-5583-f7ca-90fc-e5e46fbd7966	00030000-5583-f7ca-c0fc-5fd4624a2bfe
00020000-5583-f7ca-90fc-e5e46fbd7966	00030000-5583-f7ca-0286-62874e4ac8cd
00020000-5583-f7ca-90fc-e5e46fbd7966	00030000-5583-f7ca-779a-ccfefc5a6ee9
00020000-5583-f7ca-90fc-e5e46fbd7966	00030000-5583-f7ca-4b90-1e41ef7f222f
00020000-5583-f7ca-90fc-e5e46fbd7966	00030000-5583-f7ca-0328-693b8ed620f7
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-a73e-5a7668cb8ba1
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-dbef-8109e686fe02
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-0286-62874e4ac8cd
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-4fad-a98c1d247fce
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-0893-e9a4b7d25eda
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-6b38-f6f00057038a
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-1e64-1043eee5c207
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-4a96-caa4ee9b13ea
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-f86c-0e18d6a6feae
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-6e69-4882a0af9fa1
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-d38a-bd42c96c515a
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-c1a9-db45d4f34f12
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-f4a5-9c9886032755
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-9747-14c1575d0597
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-e338-71aa8ae3b696
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-9938-b6127d11a3e3
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-5da4-d4272a83b268
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-2aa8-67082d1ce7a0
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-deae-bee815ccc83c
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-4cce-1d592f32b264
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-e4f8-f47f66e9c57b
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-5b68-f584fd7b5cc0
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-6984-6f8cc98f521e
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-fc0d-39fd91a8c186
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-dfd2-eea4238a26cd
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-d144-2578bcd3e422
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-fe57-3be7d6195001
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-ae6e-f40059337e49
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-8212-0318bef33a53
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-9176-3e1078fcd4eb
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-b82a-4196cd96a647
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-e114-5998b5d3e624
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-d585-bcd0445f21cf
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-2470-c4dcd3a7edda
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-5860-cd36c623aad1
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-5717-53a147b14402
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-a48c-a0b21cd0417a
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-1787-60e30c94798c
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-947a-677a4887744c
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-200e-ac6111cfe3f5
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-6dc5-05dab50c5ab4
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-12cc-685b1d13a605
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-fa40-40b791a980ec
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-f41b-8150ca5d3513
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-f418-2bd054755f1a
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-186b-66cf45d39aa4
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-0256-fba9e60b4710
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-00e0-b8397a791344
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-6009-001de946d897
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-8d70-9e09c34824bb
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-2791-93f53791f0ab
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-cbea-b48c2e78bc5a
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-f322-40efba156d95
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-7890-5e4dda660a2e
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-0939-3b775538ef25
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-fe06-7dec33d9066a
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-a62e-42f7cf3e5bf3
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-32c6-cc5234e8675e
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-9e51-c377663bd8a2
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-dd20-c1915b4e6b08
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-f93c-495b2c30b9b7
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-83fc-630640a93381
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-d20b-6ed529841c81
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-f0a8-4b812f85e85f
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-4ac1-210ba320c2c2
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-f7bf-e485800614df
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-a7e7-f984ea6e14d0
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-48ad-47ad572055d5
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-9a70-bcb4fddbc4ec
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-d566-b3364cb6afee
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-b924-97c812c0cc7c
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-4242-ff95d77e7643
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-9a17-74b53da4e497
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-defd-8917e7190d19
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-a1d2-22d4df42ff57
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-8302-f81355498663
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-02d7-abffca5cd977
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-5f9c-0f524e0c2b27
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-1457-48c19fd8823e
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-7e0f-d6d752c2f875
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-7b57-ad36e29be473
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-b592-1fc8175a9db1
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-116c-80371186d087
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-1778-4af80a16402d
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-dbcf-5183d781b820
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-148f-bfd3e6d93ae6
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-fee3-1204c7406482
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-2536-4cc24cd50502
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-6297-b33c737c27e5
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-5963-f71dd8eac78e
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-b230-4c3f3a60088f
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-0938-06cdbbe9a5f5
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-c06f-22631dbb1da9
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-1938-0309b4733463
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-74ef-464d51af9391
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-2280-fb64cee71fb4
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-3640-4ea33f248a7d
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-88c6-7a2d351455f5
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-2126-8d0443b2cabe
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-57a7-e2f4d5e25647
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-6bed-a1c1fa05dbfe
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-4d1f-cf0fa9ffe9b4
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-8d87-a1b8c2a5f190
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-c929-3cf81daaf3af
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-e571-586bf2197c35
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-0bf3-533fbe98abc9
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-25fd-8e2b04b59bb7
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-c0fc-5fd4624a2bfe
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-6ec7-a870b1167bdd
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-779a-ccfefc5a6ee9
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-9d99-f012c4517a6b
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-b4fd-8942680e4da7
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-e540-e28442f66b1e
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-bb0c-99a4308c8616
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-2bb4-823857e436f7
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-ac02-9d3a50079727
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-4312-ece02f913f72
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-c8b3-35d7c3afe592
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-5bbd-a745becd565f
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-1f83-8aafeacbae88
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-3fd3-8cc82cc0e635
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-a71e-f40ddf476d64
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-73f6-088ac255023a
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-1270-9342df898d07
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-4793-cb04102cc3a6
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-4b90-1e41ef7f222f
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-803a-a368a5211e05
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-0328-693b8ed620f7
00020000-5583-f7cb-9185-50f5e9222193	00030000-5583-f7ca-d2f4-0ad9440dad1c
\.


--
-- TOC entry 2858 (class 0 OID 7877171)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 7877202)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 7877338)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5583-f7cc-bb59-61fcbb576129	00090000-5583-f7cc-0d6b-7086c5f569ac	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2835 (class 0 OID 7876936)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5583-f7cb-c165-f549ba4930a3	00040000-5583-f7ca-eca1-560a0ab0a538	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5583-f7cb-5eda-0bb20d977e03	00040000-5583-f7ca-eca1-560a0ab0a538	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5583-f7cb-7837-6008bf7b870e	00040000-5583-f7ca-eca1-560a0ab0a538	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5583-f7cb-af3a-267f0156ee7a	00040000-5583-f7ca-eca1-560a0ab0a538	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5583-f7cb-4805-7105fea52652	00040000-5583-f7ca-eca1-560a0ab0a538	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5583-f7cc-4803-0c185660de14	00040000-5583-f7ca-b781-ed536779efdd	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2837 (class 0 OID 7876971)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5583-f7ca-44fc-9a1824315700	8341	Adlešiči
00050000-5583-f7ca-08f4-bbe2590c45e2	5270	Ajdovščina
00050000-5583-f7ca-0e2b-5ef680f87201	6280	Ankaran/Ancarano
00050000-5583-f7ca-b4f1-ea3df4d158f9	9253	Apače
00050000-5583-f7ca-f0e9-f3e6b297a81a	8253	Artiče
00050000-5583-f7ca-311b-ad8c0f102d09	4275	Begunje na Gorenjskem
00050000-5583-f7ca-8d11-63b707a8518f	1382	Begunje pri Cerknici
00050000-5583-f7ca-ed5c-44d7d7ad22ec	9231	Beltinci
00050000-5583-f7ca-8fbf-83f42f34a5b6	2234	Benedikt
00050000-5583-f7ca-9e2f-3971e9171000	2345	Bistrica ob Dravi
00050000-5583-f7ca-ea38-2eb53b3fe7fa	3256	Bistrica ob Sotli
00050000-5583-f7ca-b419-9d1433c6a75b	8259	Bizeljsko
00050000-5583-f7ca-0c91-b2757e713c7f	1223	Blagovica
00050000-5583-f7ca-5ee8-3500ca1dc681	8283	Blanca
00050000-5583-f7ca-9756-2cfcca04f59f	4260	Bled
00050000-5583-f7ca-36b1-74c528f68ab0	4273	Blejska Dobrava
00050000-5583-f7ca-b379-d48d3f050a78	9265	Bodonci
00050000-5583-f7ca-0a90-79c2ab739e7d	9222	Bogojina
00050000-5583-f7ca-0b4b-a37b1764f4e8	4263	Bohinjska Bela
00050000-5583-f7ca-7fd9-be5cf5943f82	4264	Bohinjska Bistrica
00050000-5583-f7ca-60fb-1dbaebbbbb98	4265	Bohinjsko jezero
00050000-5583-f7ca-7143-c3b5b8ea16ec	1353	Borovnica
00050000-5583-f7ca-25c0-b748be955ab2	8294	Boštanj
00050000-5583-f7ca-2114-a3d54ecb2f86	5230	Bovec
00050000-5583-f7ca-b3a8-8d226a14acd3	5295	Branik
00050000-5583-f7ca-59eb-24ff999f6a11	3314	Braslovče
00050000-5583-f7ca-f68e-a20c887c1f9a	5223	Breginj
00050000-5583-f7ca-ec91-349de57d1237	8280	Brestanica
00050000-5583-f7ca-abb5-a38576751a19	2354	Bresternica
00050000-5583-f7ca-b8cf-a51b6c9bf649	4243	Brezje
00050000-5583-f7ca-65ec-ca4d79d9bde0	1351	Brezovica pri Ljubljani
00050000-5583-f7ca-ba2c-2c7de69e5e17	8250	Brežice
00050000-5583-f7ca-7234-1b504fc4afec	4210	Brnik - Aerodrom
00050000-5583-f7ca-66d8-6d5d55b77557	8321	Brusnice
00050000-5583-f7ca-a6e4-e3fdd19aaabe	3255	Buče
00050000-5583-f7ca-9807-0c78848414e7	8276	Bučka 
00050000-5583-f7ca-0cf2-9e3dd32d0150	9261	Cankova
00050000-5583-f7ca-ad42-2debe7186339	3000	Celje 
00050000-5583-f7ca-13b3-3869b2f90680	3001	Celje - poštni predali
00050000-5583-f7ca-bf9a-6e718007033e	4207	Cerklje na Gorenjskem
00050000-5583-f7ca-7a6b-b56fd36ad0c1	8263	Cerklje ob Krki
00050000-5583-f7ca-8dcf-4a43323a6d6c	1380	Cerknica
00050000-5583-f7ca-5a25-5365d6029c4c	5282	Cerkno
00050000-5583-f7ca-f82b-73125955a861	2236	Cerkvenjak
00050000-5583-f7ca-a719-e26a5058ea28	2215	Ceršak
00050000-5583-f7ca-a8d1-63a2e5debcc0	2326	Cirkovce
00050000-5583-f7ca-b63f-49b7d6208846	2282	Cirkulane
00050000-5583-f7ca-882d-4372b45f76cf	5273	Col
00050000-5583-f7ca-d195-4b33bb47aeaf	8251	Čatež ob Savi
00050000-5583-f7ca-f55a-208e59f25f6a	1413	Čemšenik
00050000-5583-f7ca-e14f-3f62a29363ba	5253	Čepovan
00050000-5583-f7ca-606d-9cd9adb29461	9232	Črenšovci
00050000-5583-f7ca-d23a-95b3f8cf2db6	2393	Črna na Koroškem
00050000-5583-f7ca-8ecd-ac4abafcce5b	6275	Črni Kal
00050000-5583-f7ca-2649-e5700e1a3218	5274	Črni Vrh nad Idrijo
00050000-5583-f7ca-c524-46fe04f190c8	5262	Črniče
00050000-5583-f7ca-415b-54712ae2aeec	8340	Črnomelj
00050000-5583-f7ca-1b56-ca034ea4667e	6271	Dekani
00050000-5583-f7ca-e3bb-36f2c29541be	5210	Deskle
00050000-5583-f7ca-f44d-33bef5426889	2253	Destrnik
00050000-5583-f7ca-cbbb-4d26022564ec	6215	Divača
00050000-5583-f7ca-61e7-452ab3eb023a	1233	Dob
00050000-5583-f7ca-1137-ada8b4723b69	3224	Dobje pri Planini
00050000-5583-f7ca-c9e0-aa9dfd992517	8257	Dobova
00050000-5583-f7ca-b513-f12963f1c0ad	1423	Dobovec
00050000-5583-f7ca-e34e-2fd20f828b9b	5263	Dobravlje
00050000-5583-f7ca-b527-3b5684e42815	3204	Dobrna
00050000-5583-f7ca-1518-ec559156fb32	8211	Dobrnič
00050000-5583-f7ca-494b-c84e047dcf5f	1356	Dobrova
00050000-5583-f7ca-dd14-5cd051e828aa	9223	Dobrovnik/Dobronak 
00050000-5583-f7ca-f259-c9f8ab80c2b4	5212	Dobrovo v Brdih
00050000-5583-f7ca-6b90-b5b183f0e78a	1431	Dol pri Hrastniku
00050000-5583-f7ca-1c94-76321af76217	1262	Dol pri Ljubljani
00050000-5583-f7ca-2252-0fe9216237db	1273	Dole pri Litiji
00050000-5583-f7ca-ec09-fa64ff27a645	1331	Dolenja vas
00050000-5583-f7ca-3c64-932396d50736	8350	Dolenjske Toplice
00050000-5583-f7ca-4bac-f4e1a60dd8d2	1230	Domžale
00050000-5583-f7ca-3117-5d3c58c21a57	2252	Dornava
00050000-5583-f7ca-03e7-d491a0510dc4	5294	Dornberk
00050000-5583-f7ca-b3b0-df895980c0c1	1319	Draga
00050000-5583-f7ca-0b93-e684a46842ee	8343	Dragatuš
00050000-5583-f7ca-eaa8-5e2881026560	3222	Dramlje
00050000-5583-f7ca-808d-c39224f26da1	2370	Dravograd
00050000-5583-f7ca-073d-ef6ddfa0aa4b	4203	Duplje
00050000-5583-f7ca-061d-90c6d9e97303	6221	Dutovlje
00050000-5583-f7ca-f47e-838f9cabbf12	8361	Dvor
00050000-5583-f7ca-6559-458de1f6876b	2343	Fala
00050000-5583-f7ca-7948-3f40eeb6f145	9208	Fokovci
00050000-5583-f7ca-091c-2b4ce72c2be5	2313	Fram
00050000-5583-f7ca-0aa2-0ab81c26bc2e	3213	Frankolovo
00050000-5583-f7ca-ecec-2ea5997dee53	1274	Gabrovka
00050000-5583-f7ca-fae3-0a497e2d111e	8254	Globoko
00050000-5583-f7ca-c320-2ca6b06a9c30	5275	Godovič
00050000-5583-f7ca-85da-e87a3f501f5c	4204	Golnik
00050000-5583-f7ca-bc29-28dc4e1b81ac	3303	Gomilsko
00050000-5583-f7ca-db6f-0f39347103c0	4224	Gorenja vas
00050000-5583-f7ca-665a-b8fe43b3d9aa	3263	Gorica pri Slivnici
00050000-5583-f7ca-7079-6d5b8f1e1ac2	2272	Gorišnica
00050000-5583-f7ca-9351-4dee92d77e8b	9250	Gornja Radgona
00050000-5583-f7ca-8d8e-49e4d4cd43ed	3342	Gornji Grad
00050000-5583-f7ca-9ff3-4db63c36fdf9	4282	Gozd Martuljek
00050000-5583-f7ca-ca4a-c31228b5febe	6272	Gračišče
00050000-5583-f7ca-edca-109df4b2cff6	9264	Grad
00050000-5583-f7ca-1eaf-2ac748786212	8332	Gradac
00050000-5583-f7ca-fa39-fccb88b77401	1384	Grahovo
00050000-5583-f7ca-7a97-d1b8cc280a88	5242	Grahovo ob Bači
00050000-5583-f7ca-10d3-ef21e1b21869	5251	Grgar
00050000-5583-f7ca-8e3c-975549a57f02	3302	Griže
00050000-5583-f7ca-72b3-25bb92b6529c	3231	Grobelno
00050000-5583-f7ca-1a1f-880c783a3b9a	1290	Grosuplje
00050000-5583-f7ca-544f-1a04ccc42bb4	2288	Hajdina
00050000-5583-f7ca-d8e1-a0bad5a647e3	8362	Hinje
00050000-5583-f7ca-f2cd-fce3e94c9ce7	2311	Hoče
00050000-5583-f7ca-3190-1abd74cdc9a8	9205	Hodoš/Hodos
00050000-5583-f7ca-93b5-4bc5d600ed45	1354	Horjul
00050000-5583-f7ca-bda9-e4958f768aff	1372	Hotedršica
00050000-5583-f7ca-90dc-9c69dcbc571d	1430	Hrastnik
00050000-5583-f7ca-998d-ddb95f071cea	6225	Hruševje
00050000-5583-f7ca-99b7-65d269a13b48	4276	Hrušica
00050000-5583-f7ca-85a9-f783a1329d3a	5280	Idrija
00050000-5583-f7ca-52c4-40503c3db9f1	1292	Ig
00050000-5583-f7ca-77de-c35a551a88b3	6250	Ilirska Bistrica
00050000-5583-f7ca-6808-de6abac23673	6251	Ilirska Bistrica-Trnovo
00050000-5583-f7ca-aa84-96aa3fcc443b	1295	Ivančna Gorica
00050000-5583-f7ca-5645-9e5c99e0f758	2259	Ivanjkovci
00050000-5583-f7ca-2720-a5234c60617a	1411	Izlake
00050000-5583-f7ca-b50b-2d339fb37978	6310	Izola/Isola
00050000-5583-f7ca-2883-d18ec02a86e1	2222	Jakobski Dol
00050000-5583-f7ca-1381-5d0bbae6385e	2221	Jarenina
00050000-5583-f7ca-b365-e96d544fe0a0	6254	Jelšane
00050000-5583-f7ca-3535-0226912be424	4270	Jesenice
00050000-5583-f7ca-596b-e4687a1c87dc	8261	Jesenice na Dolenjskem
00050000-5583-f7ca-a0d3-5014e0c70c0a	3273	Jurklošter
00050000-5583-f7ca-5d83-b35615708938	2223	Jurovski Dol
00050000-5583-f7ca-b3e1-469a96357dc0	2256	Juršinci
00050000-5583-f7ca-f4dc-805c4b9bf68d	5214	Kal nad Kanalom
00050000-5583-f7ca-6bef-2f5c498ed9a1	3233	Kalobje
00050000-5583-f7ca-ef20-d116f74c372e	4246	Kamna Gorica
00050000-5583-f7ca-c7d2-604652025ebf	2351	Kamnica
00050000-5583-f7ca-8600-4788d404e881	1241	Kamnik
00050000-5583-f7ca-2b1b-40a3c858196c	5213	Kanal
00050000-5583-f7ca-d799-c3c77ecb84df	8258	Kapele
00050000-5583-f7ca-b4b2-7ea0d20dfd4e	2362	Kapla
00050000-5583-f7ca-0908-c2e0ce1f3095	2325	Kidričevo
00050000-5583-f7ca-8280-a75c33f769b3	1412	Kisovec
00050000-5583-f7ca-d322-6bd9c21a9194	6253	Knežak
00050000-5583-f7ca-af78-655d76d685c3	5222	Kobarid
00050000-5583-f7ca-1a9f-5cb2c019ef76	9227	Kobilje
00050000-5583-f7ca-1fc7-a01198e36ecd	1330	Kočevje
00050000-5583-f7ca-f3a2-22eaa01f562b	1338	Kočevska Reka
00050000-5583-f7ca-c3f9-a03e4efbcd09	2276	Kog
00050000-5583-f7ca-536c-30914b2891a5	5211	Kojsko
00050000-5583-f7ca-32fe-d5bf2555317b	6223	Komen
00050000-5583-f7ca-2408-c15621b3d45c	1218	Komenda
00050000-5583-f7ca-1620-71bc3bb89943	6000	Koper/Capodistria 
00050000-5583-f7ca-50d6-fe76ab84d213	6001	Koper/Capodistria - poštni predali
00050000-5583-f7ca-a0fa-c936c6c7df3c	8282	Koprivnica
00050000-5583-f7ca-ed76-f053fb99036b	5296	Kostanjevica na Krasu
00050000-5583-f7ca-469f-fff64d299447	8311	Kostanjevica na Krki
00050000-5583-f7ca-a916-59a86e666853	1336	Kostel
00050000-5583-f7ca-db6a-350681f03e78	6256	Košana
00050000-5583-f7ca-0aa1-f6470e422823	2394	Kotlje
00050000-5583-f7ca-faaa-e8d2d0de55d4	6240	Kozina
00050000-5583-f7ca-af44-094b977aeb7c	3260	Kozje
00050000-5583-f7ca-c7dd-f09bec97f2ea	4000	Kranj 
00050000-5583-f7ca-8e43-4dfe9fca4b4e	4001	Kranj - poštni predali
00050000-5583-f7ca-58db-44e20a596daf	4280	Kranjska Gora
00050000-5583-f7ca-2c5a-084d41da359f	1281	Kresnice
00050000-5583-f7ca-15d7-d0da29b3ac32	4294	Križe
00050000-5583-f7ca-d11e-c68198a9ab8a	9206	Križevci
00050000-5583-f7ca-4633-6e6f74fe54d0	9242	Križevci pri Ljutomeru
00050000-5583-f7ca-575f-89fd74f51e2c	1301	Krka
00050000-5583-f7ca-9e8e-6a2028034769	8296	Krmelj
00050000-5583-f7ca-14c8-5a56e60aa265	4245	Kropa
00050000-5583-f7ca-229b-b8c5dcb65a51	8262	Krška vas
00050000-5583-f7ca-8f8a-dd5b6a37f381	8270	Krško
00050000-5583-f7ca-90cf-78f9751a65bf	9263	Kuzma
00050000-5583-f7ca-0162-123173d1aa92	2318	Laporje
00050000-5583-f7ca-65e9-0809c989c5bb	3270	Laško
00050000-5583-f7ca-8abc-27a2430f303d	1219	Laze v Tuhinju
00050000-5583-f7ca-9e01-334f6a9bf333	2230	Lenart v Slovenskih goricah
00050000-5583-f7ca-4807-1a787c9a883d	9220	Lendava/Lendva
00050000-5583-f7ca-77fb-86814c532136	4248	Lesce
00050000-5583-f7ca-47b1-f68e813b27d2	3261	Lesično
00050000-5583-f7ca-ca75-7d7cbe422e5b	8273	Leskovec pri Krškem
00050000-5583-f7ca-367a-200a64f70e1b	2372	Libeliče
00050000-5583-f7ca-ff14-33257479a37d	2341	Limbuš
00050000-5583-f7ca-a093-a52eee8c2089	1270	Litija
00050000-5583-f7ca-43e4-824d8cba1c39	3202	Ljubečna
00050000-5583-f7ca-717a-f22ae3086487	1000	Ljubljana 
00050000-5583-f7ca-fb05-7c6ae8482ca5	1001	Ljubljana - poštni predali
00050000-5583-f7ca-4887-1de3ad6b7a6f	1231	Ljubljana - Črnuče
00050000-5583-f7ca-f656-3af00a20729b	1261	Ljubljana - Dobrunje
00050000-5583-f7ca-40bd-a17b026d1c7c	1260	Ljubljana - Polje
00050000-5583-f7ca-24c5-70a813cff3e1	1210	Ljubljana - Šentvid
00050000-5583-f7ca-a9b1-18d31eb859b3	1211	Ljubljana - Šmartno
00050000-5583-f7ca-25bf-a91d207a61ea	3333	Ljubno ob Savinji
00050000-5583-f7ca-0e22-1ffa11c905d5	9240	Ljutomer
00050000-5583-f7ca-4cae-cd697e1b736d	3215	Loče
00050000-5583-f7ca-09d9-a70ef17fa376	5231	Log pod Mangartom
00050000-5583-f7ca-5d22-e0dc65ab7f05	1358	Log pri Brezovici
00050000-5583-f7ca-2f55-8957531150d8	1370	Logatec
00050000-5583-f7ca-504e-f7a4de7d37d9	1371	Logatec
00050000-5583-f7ca-ad02-279c629a2fb6	1434	Loka pri Zidanem Mostu
00050000-5583-f7ca-408d-06a0b0db072f	3223	Loka pri Žusmu
00050000-5583-f7ca-293a-83f96ddf585d	6219	Lokev
00050000-5583-f7ca-df61-ebd6fa107143	1318	Loški Potok
00050000-5583-f7ca-5da9-48b52a4c5a9f	2324	Lovrenc na Dravskem polju
00050000-5583-f7ca-6e10-7035783c3e31	2344	Lovrenc na Pohorju
00050000-5583-f7ca-0b7c-f15fbcc0e0b9	3334	Luče
00050000-5583-f7ca-ffd7-efb59b93d91f	1225	Lukovica
00050000-5583-f7ca-069c-e14cf3a2be45	9202	Mačkovci
00050000-5583-f7ca-ee06-ba050a4aa480	2322	Majšperk
00050000-5583-f7ca-4200-1d2b5ee53fa9	2321	Makole
00050000-5583-f7ca-84df-84a0c78e735e	9243	Mala Nedelja
00050000-5583-f7ca-476a-8a902b790211	2229	Malečnik
00050000-5583-f7ca-9df8-349ac453e8c8	6273	Marezige
00050000-5583-f7ca-a390-fe4e4b366a43	2000	Maribor 
00050000-5583-f7ca-83e1-a1bba3d4fd02	2001	Maribor - poštni predali
00050000-5583-f7ca-4240-79f3537b446b	2206	Marjeta na Dravskem polju
00050000-5583-f7ca-09a5-b5e0a1a07edf	2281	Markovci
00050000-5583-f7ca-64ca-6926ea3fe653	9221	Martjanci
00050000-5583-f7ca-c329-500723eb2a19	6242	Materija
00050000-5583-f7ca-f2fe-ceb53a672465	4211	Mavčiče
00050000-5583-f7ca-6477-34848cb43204	1215	Medvode
00050000-5583-f7ca-c2f1-6b3677cc3c4a	1234	Mengeš
00050000-5583-f7ca-fde8-35f617168c8f	8330	Metlika
00050000-5583-f7ca-0559-9ecf629a31ec	2392	Mežica
00050000-5583-f7ca-5e1c-f06d6c76790c	2204	Miklavž na Dravskem polju
00050000-5583-f7ca-4cf5-a46d74997bd0	2275	Miklavž pri Ormožu
00050000-5583-f7ca-5911-24ad64905fc8	5291	Miren
00050000-5583-f7ca-b1a8-7424def6d79d	8233	Mirna
00050000-5583-f7ca-5e3a-3a67dba9da40	8216	Mirna Peč
00050000-5583-f7ca-a7ba-a6d19db13e56	2382	Mislinja
00050000-5583-f7ca-0892-05a4c0fa1a1e	4281	Mojstrana
00050000-5583-f7ca-4715-5e7badaab41a	8230	Mokronog
00050000-5583-f7ca-7511-e38f321d44a0	1251	Moravče
00050000-5583-f7ca-2415-955c10b6e349	9226	Moravske Toplice
00050000-5583-f7ca-18ae-a508fca90a0b	5216	Most na Soči
00050000-5583-f7ca-13a3-6c7adee629f9	1221	Motnik
00050000-5583-f7ca-2f13-152d384f7d72	3330	Mozirje
00050000-5583-f7ca-7c7a-7a5bc81dc886	9000	Murska Sobota 
00050000-5583-f7ca-23d3-040c7f7854f2	9001	Murska Sobota - poštni predali
00050000-5583-f7ca-397a-3138bb62d90b	2366	Muta
00050000-5583-f7ca-419f-10f2981e3afe	4202	Naklo
00050000-5583-f7ca-5c74-6ef14899f7db	3331	Nazarje
00050000-5583-f7ca-d9d6-b5fc0e76b50f	1357	Notranje Gorice
00050000-5583-f7ca-f8d1-b2348fff3ed8	3203	Nova Cerkev
00050000-5583-f7ca-cd84-54fe92486b8a	5000	Nova Gorica 
00050000-5583-f7ca-7272-61ae2b0c0dd4	5001	Nova Gorica - poštni predali
00050000-5583-f7ca-934c-b04c5be7e682	1385	Nova vas
00050000-5583-f7ca-6129-fb9dc63fe5ea	8000	Novo mesto
00050000-5583-f7ca-6550-7452cecd9c1d	8001	Novo mesto - poštni predali
00050000-5583-f7ca-db99-d904907e5eca	6243	Obrov
00050000-5583-f7ca-cc5b-ec6095ac86a5	9233	Odranci
00050000-5583-f7ca-6487-55b34fa985c8	2317	Oplotnica
00050000-5583-f7ca-0b04-1fe5614b318f	2312	Orehova vas
00050000-5583-f7ca-a44d-225dbcbed7c4	2270	Ormož
00050000-5583-f7ca-b05f-f02122319988	1316	Ortnek
00050000-5583-f7ca-1f71-4d4152cc6de8	1337	Osilnica
00050000-5583-f7ca-e68b-2f27f4615ce0	8222	Otočec
00050000-5583-f7ca-3dc3-ba4f0cacc95f	2361	Ožbalt
00050000-5583-f7ca-6a6a-2f9f15d05cde	2231	Pernica
00050000-5583-f7ca-6a32-56dbd864c152	2211	Pesnica pri Mariboru
00050000-5583-f7ca-0e8c-e91d9a21a73d	9203	Petrovci
00050000-5583-f7ca-e250-2af7761c259d	3301	Petrovče
00050000-5583-f7ca-685c-9f5216f635aa	6330	Piran/Pirano
00050000-5583-f7ca-9d5b-0816dda42bc8	8255	Pišece
00050000-5583-f7ca-b5b0-0443b51d2ca3	6257	Pivka
00050000-5583-f7ca-3fe5-c3ce676f0a7a	6232	Planina
00050000-5583-f7ca-8fac-31ea8f01ce96	3225	Planina pri Sevnici
00050000-5583-f7ca-8f30-9c8273e3f9bc	6276	Pobegi
00050000-5583-f7ca-aef3-98b63e6060f7	8312	Podbočje
00050000-5583-f7ca-82b6-ab2b9588c686	5243	Podbrdo
00050000-5583-f7ca-bdaf-a76df3b97bae	3254	Podčetrtek
00050000-5583-f7ca-1d51-1b3d949127f4	2273	Podgorci
00050000-5583-f7ca-5bc4-f81896bdf5ea	6216	Podgorje
00050000-5583-f7ca-c188-dc325feb5d0a	2381	Podgorje pri Slovenj Gradcu
00050000-5583-f7ca-7b27-203c6810d3c8	6244	Podgrad
00050000-5583-f7ca-5d72-1487e2d10655	1414	Podkum
00050000-5583-f7ca-b10d-0cf0986274dc	2286	Podlehnik
00050000-5583-f7ca-aee6-73d0ce66ce6c	5272	Podnanos
00050000-5583-f7ca-9328-43a7d43d4a17	4244	Podnart
00050000-5583-f7ca-aa88-d4d3bc0dcbe1	3241	Podplat
00050000-5583-f7ca-7af1-806118ef51f4	3257	Podsreda
00050000-5583-f7ca-91a4-6bae8b41c64b	2363	Podvelka
00050000-5583-f7ca-1e0d-ffcc31061a34	2208	Pohorje
00050000-5583-f7ca-79dc-38e55e77e3aa	2257	Polenšak
00050000-5583-f7ca-b364-99861120f48d	1355	Polhov Gradec
00050000-5583-f7ca-345f-0342560bece7	4223	Poljane nad Škofjo Loko
00050000-5583-f7ca-0d23-2b581a744a1d	2319	Poljčane
00050000-5583-f7ca-1cd7-0d2ba55c0960	1272	Polšnik
00050000-5583-f7ca-1a06-48804af4c26c	3313	Polzela
00050000-5583-f7ca-43d1-d6f1e3d712a2	3232	Ponikva
00050000-5583-f7ca-9130-9a2bef7ed920	6320	Portorož/Portorose
00050000-5583-f7ca-cf77-eca5957da4d5	6230	Postojna
00050000-5583-f7ca-4072-79334a95f5f2	2331	Pragersko
00050000-5583-f7ca-d98a-93ba0d7ff8cd	3312	Prebold
00050000-5583-f7ca-7e66-8bb4eb10f00d	4205	Preddvor
00050000-5583-f7ca-b771-595010fd0c56	6255	Prem
00050000-5583-f7ca-ab8d-3cc165a6201e	1352	Preserje
00050000-5583-f7ca-4421-bd0cd2dd3b32	6258	Prestranek
00050000-5583-f7ca-f65c-ea6c2f367578	2391	Prevalje
00050000-5583-f7ca-9b9a-367496d52180	3262	Prevorje
00050000-5583-f7ca-b188-fd04e59b7c5c	1276	Primskovo 
00050000-5583-f7ca-24ed-25d347c334f8	3253	Pristava pri Mestinju
00050000-5583-f7ca-1716-34674f9e8200	9207	Prosenjakovci/Partosfalva
00050000-5583-f7ca-d438-88cbdd89d189	5297	Prvačina
00050000-5583-f7ca-85fb-570ce7a1ccd4	2250	Ptuj
00050000-5583-f7ca-7a16-f876fe92859c	2323	Ptujska Gora
00050000-5583-f7ca-5bdb-4e23ac94a1dd	9201	Puconci
00050000-5583-f7ca-4450-96ec11f90155	2327	Rače
00050000-5583-f7ca-0961-aa16a838615a	1433	Radeče
00050000-5583-f7ca-5352-a4b19bcd1299	9252	Radenci
00050000-5583-f7ca-d047-966631b3fea1	2360	Radlje ob Dravi
00050000-5583-f7ca-040e-83d3805d1886	1235	Radomlje
00050000-5583-f7ca-ebc7-a46598b1ebde	4240	Radovljica
00050000-5583-f7ca-1be3-e13334e54a69	8274	Raka
00050000-5583-f7ca-e297-754ad0187315	1381	Rakek
00050000-5583-f7ca-e1c8-013321181f3c	4283	Rateče - Planica
00050000-5583-f7ca-427f-9964115c0472	2390	Ravne na Koroškem
00050000-5583-f7ca-4008-210d9bec18fb	9246	Razkrižje
00050000-5583-f7ca-73ff-380251f66b25	3332	Rečica ob Savinji
00050000-5583-f7ca-4e7b-1764b563986d	5292	Renče
00050000-5583-f7ca-e19a-4d06915c2b60	1310	Ribnica
00050000-5583-f7ca-b745-8c6dc9c397aa	2364	Ribnica na Pohorju
00050000-5583-f7ca-6ce0-77dbee4b2898	3272	Rimske Toplice
00050000-5583-f7ca-6b12-f597264926e7	1314	Rob
00050000-5583-f7ca-69c9-1b6c7281b49d	5215	Ročinj
00050000-5583-f7ca-0518-0b436cb81d5f	3250	Rogaška Slatina
00050000-5583-f7ca-713f-f5c2b6e018fc	9262	Rogašovci
00050000-5583-f7ca-68c0-38714e691ee9	3252	Rogatec
00050000-5583-f7ca-106a-944e30fc6f9e	1373	Rovte
00050000-5583-f7ca-73ef-ded9254343da	2342	Ruše
00050000-5583-f7ca-2675-344530709064	1282	Sava
00050000-5583-f7ca-648c-660e3612491f	6333	Sečovlje/Sicciole
00050000-5583-f7ca-4590-0da60230986c	4227	Selca
00050000-5583-f7ca-a53e-a6fdbb19b319	2352	Selnica ob Dravi
00050000-5583-f7ca-2df7-868e2a979714	8333	Semič
00050000-5583-f7ca-8ee9-be8ac97ba5e8	8281	Senovo
00050000-5583-f7ca-a93c-9fcc90e7544a	6224	Senožeče
00050000-5583-f7ca-d3aa-bf2db77a25a5	8290	Sevnica
00050000-5583-f7ca-9ba7-7e3a7feac530	6210	Sežana
00050000-5583-f7ca-6ff3-aeddbd8babd4	2214	Sladki Vrh
00050000-5583-f7ca-cd21-98b95b02894a	5283	Slap ob Idrijci
00050000-5583-f7ca-b240-766752b4934c	2380	Slovenj Gradec
00050000-5583-f7ca-04d0-d7c9ec04f906	2310	Slovenska Bistrica
00050000-5583-f7ca-e706-038093ed8d3d	3210	Slovenske Konjice
00050000-5583-f7ca-f754-67a541c66a40	1216	Smlednik
00050000-5583-f7ca-02a5-f85356fb08c7	5232	Soča
00050000-5583-f7ca-f08a-03695a1dfd13	1317	Sodražica
00050000-5583-f7ca-30d8-19d419736c84	3335	Solčava
00050000-5583-f7ca-1531-e2fa81ae88b2	5250	Solkan
00050000-5583-f7ca-41ec-2c40d28f75a2	4229	Sorica
00050000-5583-f7ca-9fc0-5a5328aeb4d9	4225	Sovodenj
00050000-5583-f7ca-3029-caf2b81313b9	5281	Spodnja Idrija
00050000-5583-f7ca-5a3c-aed6609a9529	2241	Spodnji Duplek
00050000-5583-f7ca-eb90-aa92c128077b	9245	Spodnji Ivanjci
00050000-5583-f7ca-f409-94251b19f144	2277	Središče ob Dravi
00050000-5583-f7ca-b03c-6f1219d93869	4267	Srednja vas v Bohinju
00050000-5583-f7ca-d840-7c48b03551cf	8256	Sromlje 
00050000-5583-f7ca-47ac-a0a45721254a	5224	Srpenica
00050000-5583-f7ca-1496-a83353cd9643	1242	Stahovica
00050000-5583-f7ca-316f-f9191ab77741	1332	Stara Cerkev
00050000-5583-f7ca-dd39-fb04e6e78bc2	8342	Stari trg ob Kolpi
00050000-5583-f7ca-0505-b5ac093609d1	1386	Stari trg pri Ložu
00050000-5583-f7ca-6359-78c5a52a1fa1	2205	Starše
00050000-5583-f7ca-e67f-4391b16761f1	2289	Stoperce
00050000-5583-f7ca-35d3-5ccae8522827	8322	Stopiče
00050000-5583-f7ca-63bb-71bd1f3951e2	3206	Stranice
00050000-5583-f7ca-ed1e-1911d6344409	8351	Straža
00050000-5583-f7ca-b516-f35cd451734b	1313	Struge
00050000-5583-f7ca-e598-3329cdace637	8293	Studenec
00050000-5583-f7ca-1aaf-494e4ed95460	8331	Suhor
00050000-5583-f7ca-611b-1edadd8b07ed	2233	Sv. Ana v Slovenskih goricah
00050000-5583-f7ca-9d32-c7f29af4af43	2235	Sv. Trojica v Slovenskih goricah
00050000-5583-f7ca-4188-a2668f6ab7ec	2353	Sveti Duh na Ostrem Vrhu
00050000-5583-f7ca-b7d7-87ddcbda0c8f	9244	Sveti Jurij ob Ščavnici
00050000-5583-f7ca-7846-a66414b8b6d7	3264	Sveti Štefan
00050000-5583-f7ca-afce-f97a204710c3	2258	Sveti Tomaž
00050000-5583-f7ca-e5f1-f18c2add8f55	9204	Šalovci
00050000-5583-f7ca-d739-47605587ddfd	5261	Šempas
00050000-5583-f7ca-b604-3d0034291331	5290	Šempeter pri Gorici
00050000-5583-f7ca-6569-629394fa6889	3311	Šempeter v Savinjski dolini
00050000-5583-f7ca-a31c-e434ed0ec3bf	4208	Šenčur
00050000-5583-f7ca-88ac-eb49545ed3dc	2212	Šentilj v Slovenskih goricah
00050000-5583-f7ca-d0e8-548f01c58014	8297	Šentjanž
00050000-5583-f7ca-022a-f8103f2bb298	2373	Šentjanž pri Dravogradu
00050000-5583-f7ca-678e-679b3aee930d	8310	Šentjernej
00050000-5583-f7ca-22da-e4f7aa266d7a	3230	Šentjur
00050000-5583-f7ca-5b74-eebb5e8e7bd7	3271	Šentrupert
00050000-5583-f7ca-a5b0-dbcd7ec1df73	8232	Šentrupert
00050000-5583-f7ca-62b0-9adae230cab3	1296	Šentvid pri Stični
00050000-5583-f7ca-bfe7-a2c473ad3326	8275	Škocjan
00050000-5583-f7ca-c745-20019038230c	6281	Škofije
00050000-5583-f7ca-6d44-6f7143aaae56	4220	Škofja Loka
00050000-5583-f7ca-b457-6b8c434f461c	3211	Škofja vas
00050000-5583-f7ca-98c1-6d9b0b02c8d0	1291	Škofljica
00050000-5583-f7ca-6a56-8b61e570cbb9	6274	Šmarje
00050000-5583-f7ca-1a96-9941f3f4d66e	1293	Šmarje - Sap
00050000-5583-f7ca-ee49-1195f3c56711	3240	Šmarje pri Jelšah
00050000-5583-f7ca-6709-a1b893bab5a4	8220	Šmarješke Toplice
00050000-5583-f7ca-a3c5-637b646680aa	2315	Šmartno na Pohorju
00050000-5583-f7ca-911a-8517b63a4f28	3341	Šmartno ob Dreti
00050000-5583-f7ca-6412-32e341a6ba18	3327	Šmartno ob Paki
00050000-5583-f7ca-ffbb-547260e98c56	1275	Šmartno pri Litiji
00050000-5583-f7ca-6407-774bffcd165b	2383	Šmartno pri Slovenj Gradcu
00050000-5583-f7ca-9eda-d165a95571ed	3201	Šmartno v Rožni dolini
00050000-5583-f7ca-af37-2777684f25cc	3325	Šoštanj
00050000-5583-f7ca-0e80-3f45ce07cd3c	6222	Štanjel
00050000-5583-f7ca-26ea-550731b1bcc3	3220	Štore
00050000-5583-f7ca-11eb-9c88b37948d9	3304	Tabor
00050000-5583-f7ca-a82b-cba711386df3	3221	Teharje
00050000-5583-f7ca-376c-de85932d19eb	9251	Tišina
00050000-5583-f7ca-ac89-9d2ad1a0a8fe	5220	Tolmin
00050000-5583-f7ca-24f1-0e60f95fdd12	3326	Topolšica
00050000-5583-f7ca-7060-f3afe071d7d5	2371	Trbonje
00050000-5583-f7ca-61f4-befbcc76b8b1	1420	Trbovlje
00050000-5583-f7ca-bd56-5023672f8dae	8231	Trebelno 
00050000-5583-f7ca-e3cc-a06d45eb7e6f	8210	Trebnje
00050000-5583-f7ca-1561-6c9c50d16416	5252	Trnovo pri Gorici
00050000-5583-f7ca-cef4-fb2fbb0ccbdb	2254	Trnovska vas
00050000-5583-f7ca-f085-71566160fae8	1222	Trojane
00050000-5583-f7ca-a60a-a82e9753f819	1236	Trzin
00050000-5583-f7ca-db03-1e45b1e9a365	4290	Tržič
00050000-5583-f7ca-a6c0-65d187b9e32e	8295	Tržišče
00050000-5583-f7ca-beff-08bfc3cc958e	1311	Turjak
00050000-5583-f7ca-819a-b4579c53b4a4	9224	Turnišče
00050000-5583-f7ca-9e4c-749fae325a82	8323	Uršna sela
00050000-5583-f7ca-2136-d09f6821dfe5	1252	Vače
00050000-5583-f7ca-1e24-4e050ccbb0e9	3320	Velenje 
00050000-5583-f7ca-36d0-f65ba33e3403	3322	Velenje - poštni predali
00050000-5583-f7ca-3c51-cedfc8ece0f1	8212	Velika Loka
00050000-5583-f7ca-45dd-840f0df7c987	2274	Velika Nedelja
00050000-5583-f7ca-7d31-610198e7ce79	9225	Velika Polana
00050000-5583-f7ca-36a6-246e788a2e2c	1315	Velike Lašče
00050000-5583-f7ca-08e7-e22453f8d01b	8213	Veliki Gaber
00050000-5583-f7ca-d16d-b3a57e3a2dd0	9241	Veržej
00050000-5583-f7ca-3e60-097aa82e882a	1312	Videm - Dobrepolje
00050000-5583-f7ca-ad2c-be1410bb2eae	2284	Videm pri Ptuju
00050000-5583-f7ca-ac90-a77fed630e3a	8344	Vinica
00050000-5583-f7ca-e04f-5399a9b255d5	5271	Vipava
00050000-5583-f7ca-90a1-72a7cd0c952b	4212	Visoko
00050000-5583-f7ca-ee4a-9cfa67a8cdfa	1294	Višnja Gora
00050000-5583-f7ca-c8c5-712348c618a9	3205	Vitanje
00050000-5583-f7ca-5f60-4f60df6a80e1	2255	Vitomarci
00050000-5583-f7ca-0533-b8653ea1c994	1217	Vodice
00050000-5583-f7ca-1e71-0fd212c96153	3212	Vojnik\t
00050000-5583-f7ca-b98e-27aef886a9d6	5293	Volčja Draga
00050000-5583-f7ca-0345-5ea0dda7be18	2232	Voličina
00050000-5583-f7ca-59c8-971533b21f45	3305	Vransko
00050000-5583-f7ca-fb33-66ad1da18e97	6217	Vremski Britof
00050000-5583-f7ca-2e5d-9f652cc4cf2a	1360	Vrhnika
00050000-5583-f7ca-72b7-528f594df187	2365	Vuhred
00050000-5583-f7ca-97a3-3f02f3622c44	2367	Vuzenica
00050000-5583-f7ca-59cd-a67dc8a0a13b	8292	Zabukovje 
00050000-5583-f7ca-4366-aeb6b1e13370	1410	Zagorje ob Savi
00050000-5583-f7ca-9e8e-ad5946c7fd24	1303	Zagradec
00050000-5583-f7ca-e3e0-6559a46aceda	2283	Zavrč
00050000-5583-f7ca-390c-061571d9647b	8272	Zdole 
00050000-5583-f7ca-e2f6-79f1fbeb7cc7	4201	Zgornja Besnica
00050000-5583-f7ca-d635-ed539ca3c88b	2242	Zgornja Korena
00050000-5583-f7ca-95ab-a09dca50c1f8	2201	Zgornja Kungota
00050000-5583-f7ca-0e83-fa62179b5622	2316	Zgornja Ložnica
00050000-5583-f7ca-892f-90329d7a1c3d	2314	Zgornja Polskava
00050000-5583-f7ca-4bcc-eb494fe7e2e3	2213	Zgornja Velka
00050000-5583-f7ca-f594-a5eb62c9d3cd	4247	Zgornje Gorje
00050000-5583-f7ca-46f7-1a3970c16ebe	4206	Zgornje Jezersko
00050000-5583-f7ca-b8e4-88072ce59136	2285	Zgornji Leskovec
00050000-5583-f7ca-8963-1a621bbe9b2f	1432	Zidani Most
00050000-5583-f7ca-4ee2-1b7b78ccf2a4	3214	Zreče
00050000-5583-f7ca-6cad-72ae6cb1dccc	4209	Žabnica
00050000-5583-f7ca-950b-35ba9d63eb25	3310	Žalec
00050000-5583-f7ca-5449-8f3807669adf	4228	Železniki
00050000-5583-f7ca-3a04-33c9f1b77c9d	2287	Žetale
00050000-5583-f7ca-532c-651a1fc1fe0f	4226	Žiri
00050000-5583-f7ca-7a6b-fec75fd2bcb6	4274	Žirovnica
00050000-5583-f7ca-9563-88519264a019	8360	Žužemberk
\.


--
-- TOC entry 2854 (class 0 OID 7877145)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 7876956)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 7877034)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 7877157)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 7877277)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantieme, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 7877330)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5583-f7cc-fb5f-016fb7dd9d68	00080000-5583-f7cc-4803-0c185660de14	0900	AK
00190000-5583-f7cc-6ca4-75b65c3ef21d	00080000-5583-f7cb-7837-6008bf7b870e	0987	A
00190000-5583-f7cc-1c4c-fb147b6d08cc	00080000-5583-f7cb-5eda-0bb20d977e03	0989	A
\.


--
-- TOC entry 2880 (class 0 OID 7877449)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 7877512)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 7877462)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 7877481)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 7877186)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5583-f7cb-221e-768431dc15d6	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5583-f7cb-cb12-8148d9e86c0f	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5583-f7cb-3de1-2ac10be1ed94	0003	Kazinska	t	84	Kazinska dvorana
00220000-5583-f7cb-54c6-d41a0062f0b6	0004	Mali oder	t	24	Mali oder 
00220000-5583-f7cb-6035-d8b30c659704	0005	Komorni oder	t	15	Komorni oder
00220000-5583-f7cb-5256-b5105193c04f	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5583-f7cb-5979-8630aeb7d85e	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2852 (class 0 OID 7877130)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 7877120)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 7877319)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 7877254)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 7876828)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2861 (class 0 OID 7877196)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2829 (class 0 OID 7876866)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5583-f7ca-bf99-6567d6e6a21d	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5583-f7ca-aed4-11babaa48314	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5583-f7ca-8ace-bb1fd48bffaf	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5583-f7ca-070b-716b6f4c2fca	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5583-f7ca-3bdc-d51b56e9858e	planer	Planer dogodkov v koledarju	t
00020000-5583-f7ca-c961-4d5b29ce552c	kadrovska	Kadrovska služba	t
00020000-5583-f7ca-9bc7-8d473e8f5406	arhivar	Ažuriranje arhivalij	t
00020000-5583-f7ca-eb99-615bc3cea97f	igralec	Igralec	t
00020000-5583-f7ca-90fc-e5e46fbd7966	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5583-f7cb-9185-50f5e9222193	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2827 (class 0 OID 7876850)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5583-f7ca-bb4d-3c4f84278d88	00020000-5583-f7ca-8ace-bb1fd48bffaf
00010000-5583-f7ca-1fa2-6729dbe6d827	00020000-5583-f7ca-8ace-bb1fd48bffaf
00010000-5583-f7cc-8d04-3c129793fbbc	00020000-5583-f7cb-9185-50f5e9222193
\.


--
-- TOC entry 2863 (class 0 OID 7877210)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 7877151)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 7877101)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 7877545)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5583-f7ca-3a58-7148c9c5fcd6	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5583-f7ca-b266-c1592516da64	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5583-f7ca-df64-7b91551c590e	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5583-f7ca-604d-fe35d739597c	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5583-f7ca-ddc3-85d6a2dc2a64	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2886 (class 0 OID 7877537)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5583-f7ca-39a0-3083d244e359	00230000-5583-f7ca-604d-fe35d739597c	popa
00240000-5583-f7ca-4f73-a180e8aa7a6c	00230000-5583-f7ca-604d-fe35d739597c	oseba
00240000-5583-f7ca-8c12-bc2daa5e8c2f	00230000-5583-f7ca-b266-c1592516da64	prostor
00240000-5583-f7ca-d803-3b8a44b9f65d	00230000-5583-f7ca-604d-fe35d739597c	besedilo
00240000-5583-f7ca-1e4f-ffe3788c3822	00230000-5583-f7ca-604d-fe35d739597c	uprizoritev
00240000-5583-f7ca-0228-7d08f74d3889	00230000-5583-f7ca-604d-fe35d739597c	funkcija
00240000-5583-f7ca-031f-e1a9e965b4a8	00230000-5583-f7ca-604d-fe35d739597c	tipfunkcije
00240000-5583-f7ca-0139-39b3f69dc424	00230000-5583-f7ca-604d-fe35d739597c	alternacija
00240000-5583-f7ca-7586-fd14723d28c7	00230000-5583-f7ca-3a58-7148c9c5fcd6	pogodba
00240000-5583-f7ca-8668-4b511fade3cc	00230000-5583-f7ca-604d-fe35d739597c	zaposlitev
\.


--
-- TOC entry 2885 (class 0 OID 7877532)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 7877264)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5583-f7cc-bf66-67c6e5a47a9b	000e0000-5583-f7cc-b3c3-b5e0e18795b9	00080000-5583-f7cb-c165-f549ba4930a3	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5583-f7cc-c2dc-45059962478b	000e0000-5583-f7cc-b3c3-b5e0e18795b9	00080000-5583-f7cb-c165-f549ba4930a3	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5583-f7cc-ccd8-6cdef4a6509b	000e0000-5583-f7cc-b3c3-b5e0e18795b9	00080000-5583-f7cb-4805-7105fea52652	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2834 (class 0 OID 7876928)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 7877107)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5583-f7cc-6158-f92fbca394e1	00180000-5583-f7cc-f0ca-d9a156ab433f	000c0000-5583-f7cc-2180-c07cf0ae521f	00090000-5583-f7cc-93ce-f99b912b6b8d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5583-f7cc-5e0c-bddc0d5e94f9	00180000-5583-f7cc-f0ca-d9a156ab433f	000c0000-5583-f7cc-bc4f-0da18f684286	00090000-5583-f7cc-5385-db412bd946b4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5583-f7cc-2ca7-fabe5fa6f4fe	00180000-5583-f7cc-f0ca-d9a156ab433f	000c0000-5583-f7cc-0bb2-4773dd0bec38	00090000-5583-f7cc-e015-fa5ee726a624	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5583-f7cc-b491-951f3f8205fa	00180000-5583-f7cc-f0ca-d9a156ab433f	000c0000-5583-f7cc-74a8-aefad9410b92	00090000-5583-f7cc-5939-1b855540fad3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5583-f7cc-15c2-941d28889839	00180000-5583-f7cc-f0ca-d9a156ab433f	000c0000-5583-f7cc-2c74-56855f470d02	00090000-5583-f7cc-3504-73526fb4ebf2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5583-f7cc-df6d-57c4c0e13a64	00180000-5583-f7cc-6e9c-80cbbb180cac	\N	00090000-5583-f7cc-3504-73526fb4ebf2	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2871 (class 0 OID 7877308)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5583-f7ca-bdfe-8c3789fdeedb	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5583-f7ca-060b-43a2ea39b006	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5583-f7ca-96e2-0c0b50fce41a	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5583-f7ca-89bf-7d52f5b1d729	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5583-f7ca-434d-a8ca398354b6	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5583-f7ca-ff5b-e869784671f3	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5583-f7ca-00d0-157ea33825e7	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5583-f7ca-121b-0837a6a981b3	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5583-f7ca-5ec4-6312734a4cb9	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5583-f7ca-89b2-591509695cc8	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5583-f7ca-5243-3ca630dc1efb	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5583-f7ca-fb94-f0e60ce7f3dc	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5583-f7ca-5451-538c984f243e	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5583-f7ca-5062-4192b38e59fa	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5583-f7ca-1dfc-55daec4441f6	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5583-f7ca-d037-5ad4a1fcdb91	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2883 (class 0 OID 7877501)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5583-f7ca-cb28-3ebe9851d541	01	Velika predstava	f	1.00	1.00
002b0000-5583-f7ca-e548-337fa15fc8ec	02	Mala predstava	f	0.50	0.50
002b0000-5583-f7ca-4304-49829a9e0a9c	03	Mala koprodukcija	t	0.40	1.00
002b0000-5583-f7ca-294e-12048d0be953	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5583-f7ca-87e3-039ff20a0ab7	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2839 (class 0 OID 7876991)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2826 (class 0 OID 7876837)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5583-f7ca-1fa2-6729dbe6d827	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROwr0ruZW41rUtM38kTlnrE03KNztSdva	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5583-f7cc-2f0d-c6c923e2586b	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5583-f7cc-c1b3-16df326f6281	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5583-f7cc-4ec8-2eabd3bdc02e	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5583-f7cc-23b7-85d01ad15011	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5583-f7cc-5381-1852f473e13d	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5583-f7cc-5a80-52485b306697	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5583-f7cc-275a-5160f9d43697	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5583-f7cc-faac-5f62db314d81	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5583-f7cc-065a-ab10c77715a8	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5583-f7cc-8d04-3c129793fbbc	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5583-f7ca-bb4d-3c4f84278d88	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2876 (class 0 OID 7877365)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5583-f7cc-b572-a516dedfb04c	00160000-5583-f7cb-4c0d-eedda35fdd07	00150000-5583-f7ca-d335-2842af2a1f56	00140000-5583-f7c9-90a6-8bb4966a638c	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5583-f7cb-6035-d8b30c659704
000e0000-5583-f7cc-b3c3-b5e0e18795b9	00160000-5583-f7cb-ae5a-e0112426206d	00150000-5583-f7ca-8867-348cda784736	00140000-5583-f7c9-08d3-b4cf8e86806f	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5583-f7cb-5256-b5105193c04f
000e0000-5583-f7cc-b97b-3d1956de06dc	\N	00150000-5583-f7ca-8867-348cda784736	00140000-5583-f7c9-08d3-b4cf8e86806f	00190000-5583-f7cc-6ca4-75b65c3ef21d	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5583-f7cb-6035-d8b30c659704
000e0000-5583-f7cc-bd07-b9b194f844b0	\N	00150000-5583-f7ca-8867-348cda784736	00140000-5583-f7c9-08d3-b4cf8e86806f	00190000-5583-f7cc-6ca4-75b65c3ef21d	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5583-f7cb-6035-d8b30c659704
\.


--
-- TOC entry 2844 (class 0 OID 7877053)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5583-f7cc-981b-00b58e05a4c3	000e0000-5583-f7cc-b3c3-b5e0e18795b9	1	
00200000-5583-f7cc-07f7-e204e80650ad	000e0000-5583-f7cc-b3c3-b5e0e18795b9	2	
\.


--
-- TOC entry 2859 (class 0 OID 7877178)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 7877247)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 7877085)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2875 (class 0 OID 7877355)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5583-f7c9-90a6-8bb4966a638c	01	Drama	drama (SURS 01)
00140000-5583-f7c9-d694-e57cf5d38f80	02	Opera	opera (SURS 02)
00140000-5583-f7c9-ca97-7653d003261a	03	Balet	balet (SURS 03)
00140000-5583-f7c9-dd82-68e4775643cb	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5583-f7c9-84fb-cf80653179a9	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5583-f7c9-08d3-b4cf8e86806f	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5583-f7c9-01e4-468fe2bd42d9	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2865 (class 0 OID 7877237)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5583-f7ca-4956-cdbb14d48fdc	01	Opera	opera
00150000-5583-f7ca-8f31-a4b2028f937a	02	Opereta	opereta
00150000-5583-f7ca-aa00-838611aed4fb	03	Balet	balet
00150000-5583-f7ca-4309-6d4cf09fb9c0	04	Plesne prireditve	plesne prireditve
00150000-5583-f7ca-e131-33b7240518c7	05	Lutkovno gledališče	lutkovno gledališče
00150000-5583-f7ca-d498-f22891d303d4	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5583-f7ca-f78e-c64f3d53a0f8	07	Biografska drama	biografska drama
00150000-5583-f7ca-d335-2842af2a1f56	08	Komedija	komedija
00150000-5583-f7ca-61d0-cfbeb6bcab14	09	Črna komedija	črna komedija
00150000-5583-f7ca-dbb5-7e8a73b3fcc6	10	E-igra	E-igra
00150000-5583-f7ca-8867-348cda784736	11	Kriminalka	kriminalka
00150000-5583-f7ca-b19a-84fa4e271bc9	12	Musical	musical
\.


--
-- TOC entry 2407 (class 2606 OID 7876891)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 7877412)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 7877402)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 7877307)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 7877075)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 7877100)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 7877017)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 7877445)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 7877233)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 7877051)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 7877094)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 7877031)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 7877143)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 7877170)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 7876989)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 7876900)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2414 (class 2606 OID 7876924)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 7876880)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2398 (class 2606 OID 7876865)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 7877176)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 7877209)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 7877350)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 7876953)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 7876977)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 7877149)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 7876967)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 7877038)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 7877161)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 7877289)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 7877335)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 7877460)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 7877530)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 7877477)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 7877498)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 7877193)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 7877134)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 7877125)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 7877329)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 7877261)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 7876836)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 7877200)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 7876854)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2400 (class 2606 OID 7876874)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 7877218)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 7877156)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 7877106)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 7877554)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 7877542)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 7877536)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 7877274)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 7876933)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 7877116)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 7877318)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 7877511)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 7877002)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 7876849)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 7877381)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 7877060)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 7877184)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 7877252)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 7877089)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 7877363)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 7877245)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 1259 OID 7877082)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2547 (class 1259 OID 7877275)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2548 (class 1259 OID 7877276)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2421 (class 1259 OID 7876955)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2380 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2381 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2382 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2512 (class 1259 OID 7877177)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2506 (class 1259 OID 7877163)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2507 (class 1259 OID 7877162)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2458 (class 1259 OID 7877061)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2534 (class 1259 OID 7877234)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2535 (class 1259 OID 7877236)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2536 (class 1259 OID 7877235)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2446 (class 1259 OID 7877033)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 7877032)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2565 (class 1259 OID 7877352)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2566 (class 1259 OID 7877353)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2567 (class 1259 OID 7877354)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2607 (class 1259 OID 7877500)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2608 (class 1259 OID 7877499)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2574 (class 1259 OID 7877386)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2575 (class 1259 OID 7877383)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2576 (class 1259 OID 7877387)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2577 (class 1259 OID 7877385)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2578 (class 1259 OID 7877384)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2436 (class 1259 OID 7877004)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2437 (class 1259 OID 7877003)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2385 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2386 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2412 (class 1259 OID 7876927)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2522 (class 1259 OID 7877201)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2476 (class 1259 OID 7877095)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 7876881)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2403 (class 1259 OID 7876882)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2527 (class 1259 OID 7877221)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2528 (class 1259 OID 7877220)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2529 (class 1259 OID 7877219)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2450 (class 1259 OID 7877039)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2451 (class 1259 OID 7877041)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2452 (class 1259 OID 7877040)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2618 (class 1259 OID 7877544)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2486 (class 1259 OID 7877129)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2487 (class 1259 OID 7877127)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2488 (class 1259 OID 7877126)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2489 (class 1259 OID 7877128)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2393 (class 1259 OID 7876855)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2394 (class 1259 OID 7876856)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2515 (class 1259 OID 7877185)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2501 (class 1259 OID 7877150)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2543 (class 1259 OID 7877262)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2544 (class 1259 OID 7877263)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2596 (class 1259 OID 7877446)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2597 (class 1259 OID 7877447)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2598 (class 1259 OID 7877448)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2425 (class 1259 OID 7876969)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2426 (class 1259 OID 7876968)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2427 (class 1259 OID 7876970)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2613 (class 1259 OID 7877531)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2551 (class 1259 OID 7877290)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2552 (class 1259 OID 7877291)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2588 (class 1259 OID 7877416)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2589 (class 1259 OID 7877418)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2590 (class 1259 OID 7877414)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2591 (class 1259 OID 7877417)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2592 (class 1259 OID 7877415)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2540 (class 1259 OID 7877253)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2492 (class 1259 OID 7877138)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2493 (class 1259 OID 7877137)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2494 (class 1259 OID 7877135)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2495 (class 1259 OID 7877136)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2376 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2584 (class 1259 OID 7877404)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2585 (class 1259 OID 7877403)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2599 (class 1259 OID 7877461)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2457 (class 1259 OID 7877052)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2408 (class 1259 OID 7876902)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2409 (class 1259 OID 7876901)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2417 (class 1259 OID 7876934)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2418 (class 1259 OID 7876935)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2481 (class 1259 OID 7877119)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2482 (class 1259 OID 7877118)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2483 (class 1259 OID 7877117)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2602 (class 1259 OID 7877480)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2603 (class 1259 OID 7877478)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2604 (class 1259 OID 7877479)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2464 (class 1259 OID 7877084)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2465 (class 1259 OID 7877080)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2466 (class 1259 OID 7877077)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2467 (class 1259 OID 7877078)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2468 (class 1259 OID 7877076)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2469 (class 1259 OID 7877081)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2470 (class 1259 OID 7877079)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2424 (class 1259 OID 7876954)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2442 (class 1259 OID 7877018)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2443 (class 1259 OID 7877020)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2444 (class 1259 OID 7877019)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2445 (class 1259 OID 7877021)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2500 (class 1259 OID 7877144)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2570 (class 1259 OID 7877351)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2579 (class 1259 OID 7877382)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2415 (class 1259 OID 7876925)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2416 (class 1259 OID 7876926)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2537 (class 1259 OID 7877246)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 7877555)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2435 (class 1259 OID 7876990)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2621 (class 1259 OID 7877543)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2520 (class 1259 OID 7877195)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2521 (class 1259 OID 7877194)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 7877413)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2379 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2432 (class 1259 OID 7876978)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2571 (class 1259 OID 7877364)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 7877336)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 7877337)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2401 (class 1259 OID 7876875)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2471 (class 1259 OID 7877083)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2650 (class 2606 OID 7877691)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2653 (class 2606 OID 7877676)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2652 (class 2606 OID 7877681)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2648 (class 2606 OID 7877701)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2654 (class 2606 OID 7877671)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2649 (class 2606 OID 7877696)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2651 (class 2606 OID 7877686)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2684 (class 2606 OID 7877846)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2683 (class 2606 OID 7877851)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2635 (class 2606 OID 7877606)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2671 (class 2606 OID 7877786)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2669 (class 2606 OID 7877781)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2670 (class 2606 OID 7877776)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2647 (class 2606 OID 7877666)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2679 (class 2606 OID 7877816)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2677 (class 2606 OID 7877826)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2678 (class 2606 OID 7877821)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2641 (class 2606 OID 7877641)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2642 (class 2606 OID 7877636)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2667 (class 2606 OID 7877766)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2690 (class 2606 OID 7877871)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2689 (class 2606 OID 7877876)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2688 (class 2606 OID 7877881)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2710 (class 2606 OID 7877986)
-- Name: fk_308cd2524ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd2524ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2711 (class 2606 OID 7877981)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2692 (class 2606 OID 7877901)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2695 (class 2606 OID 7877886)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2691 (class 2606 OID 7877906)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2693 (class 2606 OID 7877896)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2694 (class 2606 OID 7877891)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2639 (class 2606 OID 7877631)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2640 (class 2606 OID 7877626)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2631 (class 2606 OID 7877591)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2632 (class 2606 OID 7877586)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2673 (class 2606 OID 7877796)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2655 (class 2606 OID 7877706)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2628 (class 2606 OID 7877566)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2627 (class 2606 OID 7877571)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2674 (class 2606 OID 7877811)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2675 (class 2606 OID 7877806)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2676 (class 2606 OID 7877801)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2645 (class 2606 OID 7877646)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2643 (class 2606 OID 7877656)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2644 (class 2606 OID 7877651)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2713 (class 2606 OID 7877996)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2659 (class 2606 OID 7877741)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2661 (class 2606 OID 7877731)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2662 (class 2606 OID 7877726)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2660 (class 2606 OID 7877736)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2626 (class 2606 OID 7877556)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2625 (class 2606 OID 7877561)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2672 (class 2606 OID 7877791)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2668 (class 2606 OID 7877771)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2682 (class 2606 OID 7877836)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2681 (class 2606 OID 7877841)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2705 (class 2606 OID 7877946)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 7877951)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2703 (class 2606 OID 7877956)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2637 (class 2606 OID 7877616)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2638 (class 2606 OID 7877611)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2636 (class 2606 OID 7877621)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2712 (class 2606 OID 7877991)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2686 (class 2606 OID 7877856)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2685 (class 2606 OID 7877861)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2700 (class 2606 OID 7877931)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2698 (class 2606 OID 7877941)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2702 (class 2606 OID 7877921)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2699 (class 2606 OID 7877936)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2701 (class 2606 OID 7877926)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2680 (class 2606 OID 7877831)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 7877761)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2664 (class 2606 OID 7877756)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2666 (class 2606 OID 7877746)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2665 (class 2606 OID 7877751)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2696 (class 2606 OID 7877916)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2697 (class 2606 OID 7877911)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2706 (class 2606 OID 7877961)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2646 (class 2606 OID 7877661)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2687 (class 2606 OID 7877866)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2629 (class 2606 OID 7877581)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2630 (class 2606 OID 7877576)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2634 (class 2606 OID 7877596)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2633 (class 2606 OID 7877601)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 7877721)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2657 (class 2606 OID 7877716)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2658 (class 2606 OID 7877711)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2707 (class 2606 OID 7877976)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2709 (class 2606 OID 7877966)
-- Name: fk_ffeaf2ff62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 7877971)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-19 13:06:53 CEST

--
-- PostgreSQL database dump complete
--

