--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-19 10:13:33 CEST

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
-- TOC entry 180 (class 1259 OID 7825536)
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
-- TOC entry 227 (class 1259 OID 7826058)
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
-- TOC entry 226 (class 1259 OID 7826041)
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
-- TOC entry 219 (class 1259 OID 7825945)
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
-- TOC entry 194 (class 1259 OID 7825715)
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
-- TOC entry 197 (class 1259 OID 7825749)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 7825658)
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
-- TOC entry 228 (class 1259 OID 7826072)
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
-- TOC entry 213 (class 1259 OID 7825875)
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
-- TOC entry 192 (class 1259 OID 7825695)
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
-- TOC entry 196 (class 1259 OID 7825743)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 7825675)
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
-- TOC entry 202 (class 1259 OID 7825792)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 7825817)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 7825632)
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
-- TOC entry 181 (class 1259 OID 7825545)
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
-- TOC entry 182 (class 1259 OID 7825556)
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
-- TOC entry 177 (class 1259 OID 7825510)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 7825529)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 7825824)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 7825855)
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
-- TOC entry 223 (class 1259 OID 7825991)
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
-- TOC entry 184 (class 1259 OID 7825589)
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
-- TOC entry 186 (class 1259 OID 7825624)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 7825798)
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
-- TOC entry 185 (class 1259 OID 7825609)
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
-- TOC entry 191 (class 1259 OID 7825687)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 7825810)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 7825930)
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
    tantiemi numeric(15,2) DEFAULT NULL::numeric,
    skupnistrosek numeric(15,2) DEFAULT NULL::numeric,
    zaprosenprocent numeric(6,2) DEFAULT NULL::numeric
);


--
-- TOC entry 222 (class 1259 OID 7825983)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 7826102)
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
-- TOC entry 233 (class 1259 OID 7826165)
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
-- TOC entry 230 (class 1259 OID 7826115)
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
-- TOC entry 231 (class 1259 OID 7826134)
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
-- TOC entry 209 (class 1259 OID 7825839)
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
-- TOC entry 201 (class 1259 OID 7825783)
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
-- TOC entry 200 (class 1259 OID 7825773)
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
-- TOC entry 221 (class 1259 OID 7825972)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 7825907)
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
-- TOC entry 174 (class 1259 OID 7825481)
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
-- TOC entry 173 (class 1259 OID 7825479)
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
-- TOC entry 210 (class 1259 OID 7825849)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 7825519)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 7825503)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 7825863)
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
-- TOC entry 204 (class 1259 OID 7825804)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 7825754)
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
-- TOC entry 236 (class 1259 OID 7826198)
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
-- TOC entry 235 (class 1259 OID 7826190)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 7826185)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 7825917)
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
    sort integer
);


--
-- TOC entry 183 (class 1259 OID 7825581)
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
-- TOC entry 199 (class 1259 OID 7825760)
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
-- TOC entry 220 (class 1259 OID 7825961)
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
-- TOC entry 232 (class 1259 OID 7826154)
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
-- TOC entry 188 (class 1259 OID 7825644)
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
-- TOC entry 175 (class 1259 OID 7825490)
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
-- TOC entry 225 (class 1259 OID 7826018)
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
-- TOC entry 193 (class 1259 OID 7825706)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 7825831)
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
-- TOC entry 215 (class 1259 OID 7825900)
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
-- TOC entry 195 (class 1259 OID 7825738)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 7826008)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 7825890)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 7825484)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2831 (class 0 OID 7825536)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 7826058)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5583-cf2a-0380-374ef3b286b6	000d0000-5583-cf2a-ebc5-fc481ec0c2a0	\N	00090000-5583-cf2a-069b-626d9951c672	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5583-cf2a-9788-e1dea43151bc	000d0000-5583-cf2a-5382-9df6e13cdeb0	\N	00090000-5583-cf2a-e024-1fdabee85e96	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5583-cf2a-5870-60607aa4fa6b	000d0000-5583-cf2a-f10d-583451fe0846	\N	00090000-5583-cf2a-0fe9-5787c193f375	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5583-cf2a-13d6-dc231fecf1fd	000d0000-5583-cf2a-aff2-c5f67e50124d	\N	00090000-5583-cf2a-ccfd-2aff1e7f8934	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5583-cf2a-a0ac-0c62eae63056	000d0000-5583-cf2a-ad4a-a1f0a03694de	\N	00090000-5583-cf2a-510e-f59733eafe33	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5583-cf2a-6750-39ad520e7da2	000d0000-5583-cf2a-15f2-ee5171d5b60a	\N	00090000-5583-cf2a-e024-1fdabee85e96	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2877 (class 0 OID 7826041)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 7825945)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5583-cf29-5d1d-e93bff93e22d	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5583-cf29-a589-aecaa837f6d5	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5583-cf29-45ab-37235d3be88a	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2845 (class 0 OID 7825715)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5583-cf2a-0621-d91509896e91	\N	\N	00200000-5583-cf2a-5732-7362cbd6b2fb	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5583-cf2a-f7e1-dd2471264b27	\N	\N	00200000-5583-cf2a-c5a1-fe7fee45c108	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5583-cf2a-64bb-b96a3fd887fb	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5583-cf2a-31f9-2da60c29db9d	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5583-cf2a-18ac-dd0585e7f30a	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2848 (class 0 OID 7825749)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 7825658)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5583-cf24-7ff9-8b578d56ce0e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5583-cf24-6cd1-2236c98252ad	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5583-cf24-63c5-c8ea72e16d0f	AL	ALB	008	Albania 	Albanija	\N
00040000-5583-cf24-7869-99ab0e1c2a0a	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5583-cf24-541f-1cfcc3342053	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5583-cf24-4c65-c5a8c775a9d5	AD	AND	020	Andorra 	Andora	\N
00040000-5583-cf24-c40f-294be4592e64	AO	AGO	024	Angola 	Angola	\N
00040000-5583-cf24-288a-75d2d357c0de	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5583-cf24-310f-564658c1a1d6	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5583-cf24-ef83-f436ecdfaa87	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5583-cf24-d59f-275dc95585cf	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5583-cf24-7058-0c7b9f46278b	AM	ARM	051	Armenia 	Armenija	\N
00040000-5583-cf24-dfbe-65dde0618ce2	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5583-cf24-e1fc-f6b4ca7224d4	AU	AUS	036	Australia 	Avstralija	\N
00040000-5583-cf24-79b3-48aef204becd	AT	AUT	040	Austria 	Avstrija	\N
00040000-5583-cf24-f68b-84c5e7fbbb26	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5583-cf24-0ffb-c0539c19e4cb	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5583-cf24-b8de-c17e238b3079	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5583-cf24-901c-2db48feaa982	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5583-cf24-3bca-251959c33cbe	BB	BRB	052	Barbados 	Barbados	\N
00040000-5583-cf24-7299-6c81269e7cd7	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5583-cf24-ec0b-29576247e09d	BE	BEL	056	Belgium 	Belgija	\N
00040000-5583-cf24-383b-a64308076702	BZ	BLZ	084	Belize 	Belize	\N
00040000-5583-cf24-c0de-b2b24df1177b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5583-cf24-0822-64b8f42cbee4	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5583-cf24-72ed-c8888492bcce	BT	BTN	064	Bhutan 	Butan	\N
00040000-5583-cf24-d831-ce99be9eb1d7	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5583-cf24-86bf-747035fdbcf0	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5583-cf24-a69c-d06a2e1106af	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5583-cf24-2be0-6c1469ca9550	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5583-cf24-063e-39a1dd5b116a	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5583-cf24-7fbb-f2b18cdb8f1a	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5583-cf24-0815-6972b2d10bac	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5583-cf24-a718-a60f53be29a0	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5583-cf24-34ec-3681aebe66e4	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5583-cf24-5eec-c9a93d324f11	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5583-cf24-73b0-76e44fdb34f1	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5583-cf24-d2db-eaab14cfa595	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5583-cf24-a424-ca9c42a1d707	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5583-cf24-062d-107aec0a913e	CA	CAN	124	Canada 	Kanada	\N
00040000-5583-cf24-74fd-e5521d746e9d	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5583-cf24-85f6-2f96fb58fa4b	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5583-cf24-39e6-7605e0313204	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5583-cf24-ad51-bef372410fa4	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5583-cf24-c975-19160bd18aa1	CL	CHL	152	Chile 	Čile	\N
00040000-5583-cf24-d209-ce8f4177a8e8	CN	CHN	156	China 	Kitajska	\N
00040000-5583-cf24-a252-5c16faa43701	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5583-cf24-d0ee-69a0e1ae094d	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5583-cf24-b656-7eaaa5239462	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5583-cf24-fc4b-fece876333cf	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5583-cf24-f6cd-6cd850331446	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5583-cf24-ec69-d92d6cd94975	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5583-cf24-c046-2109d65f53c5	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5583-cf24-81d8-3cb38557c495	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5583-cf24-d502-af3d14f2772b	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5583-cf24-f9f9-77f72acaefb2	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5583-cf24-fe8f-0d33d104a40a	CU	CUB	192	Cuba 	Kuba	\N
00040000-5583-cf24-2d7b-e2f1f923cb81	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5583-cf24-78de-3febe786ecc3	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5583-cf24-ecd1-a9c1b5b11741	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5583-cf24-2118-f5ba84b96a69	DK	DNK	208	Denmark 	Danska	\N
00040000-5583-cf24-3c73-4914a55ba1fd	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5583-cf24-1e83-c49a507a9ade	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5583-cf24-d377-d32a0786912e	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5583-cf24-7509-77c736a0bf3c	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5583-cf24-5432-1e5e251c1fc4	EG	EGY	818	Egypt 	Egipt	\N
00040000-5583-cf24-585a-50c8fc884752	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5583-cf24-a021-14236407a67e	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5583-cf24-4584-e69af6271240	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5583-cf24-958c-c4c33968411a	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5583-cf24-d800-6e586a30839f	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5583-cf24-94bd-c8e6f79f0ee1	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5583-cf24-6a43-c79448a8eb99	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5583-cf24-644d-f5da292d77fc	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5583-cf24-a1c4-76889b104748	FI	FIN	246	Finland 	Finska	\N
00040000-5583-cf24-051f-deb2529e96cc	FR	FRA	250	France 	Francija	\N
00040000-5583-cf24-9e76-dd935564a175	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5583-cf24-0903-2752d6dfdf2b	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5583-cf24-d30a-d36a1005f047	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5583-cf24-6f8f-f525426f3dc3	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5583-cf24-8558-20130e7ba063	GA	GAB	266	Gabon 	Gabon	\N
00040000-5583-cf24-117e-603784b209a4	GM	GMB	270	Gambia 	Gambija	\N
00040000-5583-cf24-6099-df69cf390731	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5583-cf24-12ed-89d8d0f60a2e	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5583-cf24-063f-27b48acced5a	GH	GHA	288	Ghana 	Gana	\N
00040000-5583-cf24-0a19-f9271ec5e387	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5583-cf24-b5c4-7ebe5743690a	GR	GRC	300	Greece 	Grčija	\N
00040000-5583-cf24-a0fc-43b6cdf13cab	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5583-cf24-871c-cf3ca454fdd6	GD	GRD	308	Grenada 	Grenada	\N
00040000-5583-cf24-cdb7-c8d3ca0810b6	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5583-cf24-b161-ff545af09a76	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5583-cf24-fc24-4ab3e8066a51	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5583-cf24-599a-e9b5e6e76f6f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5583-cf24-cf14-9cd3abd40900	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5583-cf24-0287-56a98d126c28	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5583-cf24-094e-c2027ca39726	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5583-cf24-ad41-7e6a69aab1c8	HT	HTI	332	Haiti 	Haiti	\N
00040000-5583-cf24-987b-ef50772f9979	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5583-cf24-9cfa-5e2f8ea45b8b	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5583-cf24-6492-b829b5e1af89	HN	HND	340	Honduras 	Honduras	\N
00040000-5583-cf24-af32-8d263dcf5dde	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5583-cf24-6ba0-4b63f86ee60e	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5583-cf24-d8f1-f121b93ce7be	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5583-cf24-afe6-8d4e3dd4f540	IN	IND	356	India 	Indija	\N
00040000-5583-cf24-13c9-387cef229d2c	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5583-cf24-f83a-a3760a59732c	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5583-cf24-7101-cec57a41da13	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5583-cf24-aabd-6186fd25c1c4	IE	IRL	372	Ireland 	Irska	\N
00040000-5583-cf24-f15f-b5b18a9fa34f	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5583-cf24-b7f0-83d5eb195f36	IL	ISR	376	Israel 	Izrael	\N
00040000-5583-cf24-5f95-bf10fbdf6394	IT	ITA	380	Italy 	Italija	\N
00040000-5583-cf24-79f9-27fe63e94a5e	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5583-cf24-842f-0f7a353bd4fd	JP	JPN	392	Japan 	Japonska	\N
00040000-5583-cf24-94e3-a3af0fb9b833	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5583-cf24-5c0b-a3a897973627	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5583-cf24-e5bd-a20b0897e74c	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5583-cf24-676e-df95cf0fc569	KE	KEN	404	Kenya 	Kenija	\N
00040000-5583-cf24-2294-e3ef1e497d63	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5583-cf24-f3ca-3c8e5cb1a524	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5583-cf24-23f3-6e78fd94f619	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5583-cf24-7c81-92656041a4fa	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5583-cf24-c8c1-55912628bdab	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5583-cf24-a173-638909b64668	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5583-cf24-fd63-f5891715b809	LV	LVA	428	Latvia 	Latvija	\N
00040000-5583-cf24-1602-1e1201bf7d3d	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5583-cf24-8711-666985ff5017	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5583-cf24-bf0e-7990ac6228a1	LR	LBR	430	Liberia 	Liberija	\N
00040000-5583-cf24-26d1-ce2c6ea33f52	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5583-cf24-3dd3-bf6f32a3ddc4	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5583-cf24-df83-a58b09eb072d	LT	LTU	440	Lithuania 	Litva	\N
00040000-5583-cf24-3ee3-fbd8324ce6b6	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5583-cf24-2f06-13b6c808d2f4	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5583-cf24-d045-0747f4deab0f	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5583-cf24-81f5-e0de2b55883a	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5583-cf24-1ac8-563a71b1925e	MW	MWI	454	Malawi 	Malavi	\N
00040000-5583-cf24-e8b6-b899d8aa78d1	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5583-cf24-8af3-a0425997c690	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5583-cf24-bed7-5f1561d450ab	ML	MLI	466	Mali 	Mali	\N
00040000-5583-cf24-cb97-9c101cc6fb84	MT	MLT	470	Malta 	Malta	\N
00040000-5583-cf24-7211-353f32ea8fa6	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5583-cf24-a40b-60529839071e	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5583-cf24-6257-67e3e2d36c7e	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5583-cf24-2f8b-ca36a0548fec	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5583-cf24-26fb-7124e4aad45e	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5583-cf24-a1b4-fb44490941d5	MX	MEX	484	Mexico 	Mehika	\N
00040000-5583-cf24-c9a9-b37512d0d842	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5583-cf24-1b86-8ce237504e3f	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5583-cf24-0816-31f1f45015fb	MC	MCO	492	Monaco 	Monako	\N
00040000-5583-cf24-7d63-d2eb8d1a0079	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5583-cf24-bb08-bf44a802a397	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5583-cf24-b9f6-134b871b5fbd	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5583-cf24-3300-c2eac4745617	MA	MAR	504	Morocco 	Maroko	\N
00040000-5583-cf24-60b9-9dd6afc05ea6	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5583-cf24-0e1c-770083895e7f	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5583-cf24-0ca6-a59df33e3ce7	NA	NAM	516	Namibia 	Namibija	\N
00040000-5583-cf24-9067-ea12cf51ec56	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5583-cf24-421d-44629ab75a34	NP	NPL	524	Nepal 	Nepal	\N
00040000-5583-cf24-9c47-cf48ee69f14f	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5583-cf24-ed4c-14375fd6cb09	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5583-cf24-a686-22055600537e	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5583-cf24-76b5-73916dac671d	NE	NER	562	Niger 	Niger 	\N
00040000-5583-cf24-d6de-4a6b5a7aa91e	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5583-cf24-8198-94d63af2fc30	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5583-cf24-00f9-7586674bcf18	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5583-cf24-b4c8-0bbc9a616d05	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5583-cf24-8ef0-0d1867898995	NO	NOR	578	Norway 	Norveška	\N
00040000-5583-cf24-7f60-0942cfb2d4bc	OM	OMN	512	Oman 	Oman	\N
00040000-5583-cf24-655b-af5c1c1a80d2	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5583-cf24-a506-548b85e87cf1	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5583-cf24-ef5e-32e1dccfd807	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5583-cf24-a449-f568f09f6214	PA	PAN	591	Panama 	Panama	\N
00040000-5583-cf24-11db-45f83f57ac8d	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5583-cf24-2a0e-27845038e683	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5583-cf24-564f-3ab0e8229621	PE	PER	604	Peru 	Peru	\N
00040000-5583-cf24-3935-96fba1bcf8cb	PH	PHL	608	Philippines 	Filipini	\N
00040000-5583-cf24-0d00-0631e36a196b	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5583-cf24-4177-b804c783fee0	PL	POL	616	Poland 	Poljska	\N
00040000-5583-cf24-f2ae-7831e3923aea	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5583-cf24-f220-3078d2183c3e	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5583-cf24-abb2-249d61984aa3	QA	QAT	634	Qatar 	Katar	\N
00040000-5583-cf24-268f-42720b7ee9b5	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5583-cf24-c38d-0fe619d45eea	RO	ROU	642	Romania 	Romunija	\N
00040000-5583-cf24-a7fa-f452d153cd6a	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5583-cf24-5fd3-97cb9156f520	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5583-cf24-e543-baad8e7e66e0	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5583-cf24-b8a8-11d8cd85fa35	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5583-cf24-dcec-ddfc17de9664	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5583-cf24-3841-3090c4d49e00	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5583-cf24-c192-f51cee4616a9	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5583-cf24-6bbe-1e69ff761428	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5583-cf24-ef0f-065de1d7ba06	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5583-cf24-451d-77d43ddbb857	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5583-cf24-6a82-4bd000a179a0	SM	SMR	674	San Marino 	San Marino	\N
00040000-5583-cf24-3a4c-f298a4233818	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5583-cf24-6787-f016712ff2e0	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5583-cf24-fae5-2974cd94bd0f	SN	SEN	686	Senegal 	Senegal	\N
00040000-5583-cf24-421b-8a56e1465707	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5583-cf24-0124-c4248756f041	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5583-cf24-a7fd-a6df437f0034	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5583-cf24-8ef5-c2bf13318843	SG	SGP	702	Singapore 	Singapur	\N
00040000-5583-cf24-e366-f6cd48e96c20	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5583-cf24-055e-523aee8f3e3a	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5583-cf24-08e5-2e02037dc0d0	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5583-cf24-017f-e8a4961c69da	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5583-cf24-d111-4da63e56bb15	SO	SOM	706	Somalia 	Somalija	\N
00040000-5583-cf24-a3e9-666c90270749	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5583-cf24-ebdf-2f1b187a8409	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5583-cf24-d2a5-2ce4afff13c9	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5583-cf24-0b65-59930a05716a	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5583-cf24-0c30-df67145df6e2	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5583-cf24-035e-96199b298004	SD	SDN	729	Sudan 	Sudan	\N
00040000-5583-cf24-b967-785126c53b61	SR	SUR	740	Suriname 	Surinam	\N
00040000-5583-cf24-5360-5eb69ace6552	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5583-cf24-cbd3-d2f84a6f6d37	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5583-cf24-c4ca-9d6066b3e06f	SE	SWE	752	Sweden 	Švedska	\N
00040000-5583-cf24-a458-c5e51bc4b62d	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5583-cf24-e086-6937572240c2	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5583-cf24-1ed7-6a2c7604971d	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5583-cf24-08ea-0558de1d440b	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5583-cf24-6123-b57d25baf8d1	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5583-cf24-2872-0468c5377975	TH	THA	764	Thailand 	Tajska	\N
00040000-5583-cf24-48d5-d32672069885	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5583-cf24-d3d3-3b0c573acef8	TG	TGO	768	Togo 	Togo	\N
00040000-5583-cf24-ca4b-a229ecaa2510	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5583-cf24-e132-478187327b7d	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5583-cf24-37f8-7556fe966eaf	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5583-cf24-a64c-40f8c6b4783b	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5583-cf24-625a-625c4be50514	TR	TUR	792	Turkey 	Turčija	\N
00040000-5583-cf24-325d-84206b7e3e03	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5583-cf24-981f-ca856bfbf625	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5583-cf24-e698-3e803e90c161	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5583-cf24-2d57-fb672e6710f6	UG	UGA	800	Uganda 	Uganda	\N
00040000-5583-cf24-406b-b8817c53b811	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5583-cf24-1808-067df0187f87	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5583-cf24-842d-bf19345fa9ef	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5583-cf24-6a6a-e6867bf3697b	US	USA	840	United States 	Združene države Amerike	\N
00040000-5583-cf24-abcc-90442d403fa4	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5583-cf24-1821-230d0dbb1ab6	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5583-cf24-b460-7ceb5c1893b2	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5583-cf24-9164-94e25b10443a	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5583-cf24-f0bd-04da3e0e0ff6	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5583-cf24-6aca-9fec68d361d5	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5583-cf24-d591-66f2a39ea82c	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5583-cf24-0660-620224aae68a	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5583-cf24-dd5f-0b6d41f65760	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5583-cf24-73c6-2d3d4e87c705	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5583-cf24-f32a-264b9b1be896	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5583-cf24-eb53-91391ffec908	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5583-cf24-e3c7-0106d991f3f5	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2879 (class 0 OID 7826072)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, opredelitevdrugiviri, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, sort, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 7825875)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5583-cf2a-2c90-671376a434bd	000e0000-5583-cf2a-986f-a27ab0d311d9	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5583-cf26-f4b0-5d8bc59ff10d
000d0000-5583-cf2a-ebc5-fc481ec0c2a0	000e0000-5583-cf2a-986f-a27ab0d311d9	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5583-cf26-f4b0-5d8bc59ff10d
000d0000-5583-cf2a-5382-9df6e13cdeb0	000e0000-5583-cf2a-986f-a27ab0d311d9	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5583-cf26-5bf8-ddf635a4bc5c
000d0000-5583-cf2a-f10d-583451fe0846	000e0000-5583-cf2a-986f-a27ab0d311d9	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5583-cf26-7c0f-9e2f459e5a81
000d0000-5583-cf2a-aff2-c5f67e50124d	000e0000-5583-cf2a-986f-a27ab0d311d9	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5583-cf26-7c0f-9e2f459e5a81
000d0000-5583-cf2a-ad4a-a1f0a03694de	000e0000-5583-cf2a-986f-a27ab0d311d9	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5583-cf26-7c0f-9e2f459e5a81
000d0000-5583-cf2a-15f2-ee5171d5b60a	000e0000-5583-cf2a-986f-a27ab0d311d9	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5583-cf26-f4b0-5d8bc59ff10d
\.


--
-- TOC entry 2843 (class 0 OID 7825695)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 7825743)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 7825675)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5583-cf2a-45ec-9f4831ecf37e	00080000-5583-cf29-ccd5-3233f6e2286e	00090000-5583-cf2a-069b-626d9951c672	AK		
\.


--
-- TOC entry 2821 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 7825792)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 7825817)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 7825632)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5583-cf25-f1e7-981c6699d9a6	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5583-cf25-687f-1ada90cef03e	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5583-cf25-51e4-d72bbfb05683	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5583-cf25-8a60-7fe7d6838f41	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5583-cf25-c580-bfc3291d09f2	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5583-cf25-f4f1-c3a1a2eaea01	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5583-cf25-cbdc-f36fe285380b	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5583-cf25-799e-e6da34cdd87e	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5583-cf25-644a-2af520695919	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5583-cf25-25e8-c782b6981f77	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5583-cf25-4012-33f7db187109	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5583-cf25-fe74-fe3d59a766b6	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5583-cf29-a3be-9b7f9f9fbef9	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5583-cf29-d146-9ce318dc0a73	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5583-cf29-b3a8-572710422842	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5583-cf29-1a50-1bf716162bfa	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5583-cf29-e5ad-a6cd600ee057	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5583-cf29-4752-8d7d74236208	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2832 (class 0 OID 7825545)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5583-cf29-3d23-e4d8859ed6f2	00000000-5583-cf29-d146-9ce318dc0a73	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5583-cf29-7e1f-058fad99640a	00000000-5583-cf29-d146-9ce318dc0a73	00010000-5583-cf25-0ffe-c3fd6a0866e5	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5583-cf29-bc6c-fcbea7f372a0	00000000-5583-cf29-b3a8-572710422842	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2833 (class 0 OID 7825556)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5583-cf2a-ad5c-0da2e53e4c2b	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5583-cf2a-ccfd-2aff1e7f8934	00010000-5583-cf2a-b952-b11d0177c59c	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5583-cf2a-0fe9-5787c193f375	00010000-5583-cf2a-fda3-3593e28d24f5	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5583-cf2a-4b09-96dbf7f528b6	00010000-5583-cf2a-a09e-73075cb6d85c	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5583-cf2a-f8d2-0f61176130c8	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5583-cf2a-dadf-f8a230e0e809	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5583-cf2a-b336-743fd9c76cd7	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5583-cf2a-67c0-0106c30ccf36	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5583-cf2a-069b-626d9951c672	00010000-5583-cf2a-dff4-378ce08cf5fe	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5583-cf2a-e024-1fdabee85e96	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5583-cf2a-0a31-1233118a8c79	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5583-cf2a-510e-f59733eafe33	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5583-cf2a-2831-29fec6665c00	00010000-5583-cf2a-00c8-128682f605d8	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2823 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 7825510)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5583-cf25-8eac-5ac19aadb23d	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5583-cf25-2db6-f466df4cd7ec	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5583-cf25-9e0e-7bc858d4603b	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5583-cf25-a429-52e183781d7c	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5583-cf25-579e-9e2da59f5e42	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5583-cf25-28a5-8d790c384f8a	Abonma-read	Abonma - branje	f
00030000-5583-cf25-8abe-d1521a54ea99	Abonma-write	Abonma - spreminjanje	f
00030000-5583-cf25-3c93-5157ff9562d3	Alternacija-read	Alternacija - branje	f
00030000-5583-cf25-6777-9fd1158788bb	Alternacija-write	Alternacija - spreminjanje	f
00030000-5583-cf25-18b8-f2c97a69d4d2	Arhivalija-read	Arhivalija - branje	f
00030000-5583-cf25-156c-a0d14326f249	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5583-cf25-411a-e0a7f0c11e11	Besedilo-read	Besedilo - branje	f
00030000-5583-cf25-325d-a1b2d8878129	Besedilo-write	Besedilo - spreminjanje	f
00030000-5583-cf25-d279-e201d4f07718	DogodekIzven-read	DogodekIzven - branje	f
00030000-5583-cf25-bfa7-585376e7617b	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5583-cf25-34ad-a6f3f555151b	Dogodek-read	Dogodek - branje	f
00030000-5583-cf25-2d93-e0ba91a2ee36	Dogodek-write	Dogodek - spreminjanje	f
00030000-5583-cf25-5658-04c5b5f10843	Drzava-read	Drzava - branje	f
00030000-5583-cf25-2566-259493fb245b	Drzava-write	Drzava - spreminjanje	f
00030000-5583-cf25-4d20-a3001ae3b07b	Funkcija-read	Funkcija - branje	f
00030000-5583-cf25-a59b-2a9ea4bda799	Funkcija-write	Funkcija - spreminjanje	f
00030000-5583-cf25-64bc-35cb9b4477ea	Gostovanje-read	Gostovanje - branje	f
00030000-5583-cf25-438e-8934af7a48ad	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5583-cf25-2199-5f3c24846e73	Gostujoca-read	Gostujoca - branje	f
00030000-5583-cf25-120f-7d823aba8c4e	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5583-cf25-409d-899288084de2	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5583-cf25-9687-8d5b0e50c416	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5583-cf25-ceb8-f5cd49be9e4c	Kupec-read	Kupec - branje	f
00030000-5583-cf25-e954-d689e6e0e457	Kupec-write	Kupec - spreminjanje	f
00030000-5583-cf25-8e3c-d0552a6015fc	NacinPlacina-read	NacinPlacina - branje	f
00030000-5583-cf25-e371-1b4a69366511	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5583-cf25-52ce-8db54d0ad2a1	Option-read	Option - branje	f
00030000-5583-cf25-18f4-e6c502a60f83	Option-write	Option - spreminjanje	f
00030000-5583-cf25-a362-d368858ab3a0	OptionValue-read	OptionValue - branje	f
00030000-5583-cf25-2a4e-39a4ad15894b	OptionValue-write	OptionValue - spreminjanje	f
00030000-5583-cf25-4a84-370479f04dc5	Oseba-read	Oseba - branje	f
00030000-5583-cf25-de68-dc1cd6a0530a	Oseba-write	Oseba - spreminjanje	f
00030000-5583-cf25-42ad-ec54bd93010a	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5583-cf25-9fda-574790488c77	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5583-cf25-8066-a494a86c4343	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5583-cf25-370c-c2b524d72ab3	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5583-cf25-42bd-7593d4890e56	Pogodba-read	Pogodba - branje	f
00030000-5583-cf25-60b1-065d654f5b08	Pogodba-write	Pogodba - spreminjanje	f
00030000-5583-cf25-5ada-f017179009f6	Popa-read	Popa - branje	f
00030000-5583-cf25-e37f-3cfcaff018df	Popa-write	Popa - spreminjanje	f
00030000-5583-cf25-594e-4b6e07b37d6d	Posta-read	Posta - branje	f
00030000-5583-cf25-4ab1-e5fdb2248c1e	Posta-write	Posta - spreminjanje	f
00030000-5583-cf25-a3b6-dea4233283b9	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5583-cf25-4303-8c0219144f05	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5583-cf25-493a-047eeebb6738	PostniNaslov-read	PostniNaslov - branje	f
00030000-5583-cf25-8a09-b7add614151b	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5583-cf25-3e14-55766563d303	Predstava-read	Predstava - branje	f
00030000-5583-cf25-44d1-2b5dd477da16	Predstava-write	Predstava - spreminjanje	f
00030000-5583-cf25-624e-5fb7697762d4	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5583-cf25-338a-42b81ee425cb	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5583-cf25-cb1c-a9f3bae55b4f	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5583-cf25-48db-de436c5adf75	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5583-cf25-32d3-11450d5437f0	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5583-cf25-1e56-26591f286635	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5583-cf25-1007-204008621512	ProgramDela-read	ProgramDela - branje	f
00030000-5583-cf25-3a2b-5603b8cca5ca	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5583-cf25-e187-08984ee8a9ec	ProgramFestival-read	ProgramFestival - branje	f
00030000-5583-cf25-9141-c8daa42d0fe6	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5583-cf25-4ded-545eeda9cfbb	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5583-cf25-405e-54baa0b55e13	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5583-cf25-3a3e-6242fbb399c8	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5583-cf25-98c5-8b02c1b814fc	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5583-cf25-775f-3c5335b1e45f	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5583-cf25-d351-0ca602599d9a	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5583-cf25-8b24-66f4e710845f	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5583-cf25-8c34-43202f49cef8	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5583-cf25-c084-65df30954481	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5583-cf25-c925-343485153576	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5583-cf25-bb2b-7c982862321b	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5583-cf25-0ccc-97bb4a40dd54	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5583-cf25-4389-86e662826317	ProgramRazno-read	ProgramRazno - branje	f
00030000-5583-cf25-b8d7-b7edae00256d	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5583-cf25-b99f-fddde33f85db	Prostor-read	Prostor - branje	f
00030000-5583-cf25-c149-9fae34c7498a	Prostor-write	Prostor - spreminjanje	f
00030000-5583-cf25-3e60-ec856a36ecb6	Racun-read	Racun - branje	f
00030000-5583-cf25-2efc-85dc7165f804	Racun-write	Racun - spreminjanje	f
00030000-5583-cf25-9f5c-8824492d2e7b	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5583-cf25-f58e-ab7b7ff33cf2	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5583-cf25-73f8-3754bdcd3872	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5583-cf25-036f-73bfc599bf09	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5583-cf25-30b5-1e85ec929353	Rekvizit-read	Rekvizit - branje	f
00030000-5583-cf25-e950-523a03144463	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5583-cf25-cede-03be46414485	Revizija-read	Revizija - branje	f
00030000-5583-cf25-6bc3-276ff49e3b3c	Revizija-write	Revizija - spreminjanje	f
00030000-5583-cf25-3b14-57921d8845ab	Rezervacija-read	Rezervacija - branje	f
00030000-5583-cf25-3070-fc38d8aaa0df	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5583-cf25-d08c-7833ac57fb37	SedezniRed-read	SedezniRed - branje	f
00030000-5583-cf25-3c75-74d7a9c6e94d	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5583-cf25-7915-63f6bc4539da	Sedez-read	Sedez - branje	f
00030000-5583-cf25-4956-5a7423fa9d38	Sedez-write	Sedez - spreminjanje	f
00030000-5583-cf25-c88d-385330192fda	Sezona-read	Sezona - branje	f
00030000-5583-cf25-1a00-6dbf805ac6ec	Sezona-write	Sezona - spreminjanje	f
00030000-5583-cf25-a75c-037f4a083e2b	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5583-cf25-3ef6-14577b4e0e01	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5583-cf25-99e6-a02020194153	Stevilcenje-read	Stevilcenje - branje	f
00030000-5583-cf25-60ec-a6115fb4042b	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5583-cf25-dd44-e4bb46d4640a	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5583-cf25-a69e-297c6d48456c	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5583-cf25-e206-c7af483cb6f1	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5583-cf25-1518-850e644c35a1	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5583-cf25-18d9-ab2aca529487	Telefonska-read	Telefonska - branje	f
00030000-5583-cf25-91b0-33f8e8a04a22	Telefonska-write	Telefonska - spreminjanje	f
00030000-5583-cf25-867c-33b01912dcde	TerminStoritve-read	TerminStoritve - branje	f
00030000-5583-cf25-626b-60dd36f3c79e	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5583-cf25-f971-f2130742c056	TipFunkcije-read	TipFunkcije - branje	f
00030000-5583-cf25-0859-33a94aee4ec0	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5583-cf25-2f60-5877f41c60e1	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5583-cf25-d580-5cffce0ba6ba	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5583-cf25-9bb0-4ba84c552c48	Trr-read	Trr - branje	f
00030000-5583-cf25-9835-305b7fb351d8	Trr-write	Trr - spreminjanje	f
00030000-5583-cf25-c73f-91c6c2df1668	Uprizoritev-read	Uprizoritev - branje	f
00030000-5583-cf25-7cb8-590076eeb27c	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5583-cf25-7922-b69e4a3f2c99	Vaja-read	Vaja - branje	f
00030000-5583-cf25-5c9b-d3c601ad968b	Vaja-write	Vaja - spreminjanje	f
00030000-5583-cf25-fc1d-d5876aa0d18d	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5583-cf25-05d0-716c37bc5995	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5583-cf25-ce29-ec76d087d074	Zaposlitev-read	Zaposlitev - branje	f
00030000-5583-cf25-f495-ac949dab3c40	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5583-cf25-379b-66cb13363f0a	Zasedenost-read	Zasedenost - branje	f
00030000-5583-cf25-b9ce-65d9ce408af3	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5583-cf25-2d7c-2f5a384853b0	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5583-cf25-fcae-2efa2e12447d	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5583-cf25-cdb0-dc134fc74201	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5583-cf25-0f6a-3cc1acd63b2c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2830 (class 0 OID 7825529)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5583-cf25-208d-f530e1170fc9	00030000-5583-cf25-2db6-f466df4cd7ec
00020000-5583-cf25-14dd-a31b89443dce	00030000-5583-cf25-5658-04c5b5f10843
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-28a5-8d790c384f8a
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-8abe-d1521a54ea99
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-3c93-5157ff9562d3
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-6777-9fd1158788bb
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-18b8-f2c97a69d4d2
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-34ad-a6f3f555151b
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-a429-52e183781d7c
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-2d93-e0ba91a2ee36
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-5658-04c5b5f10843
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-2566-259493fb245b
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-4d20-a3001ae3b07b
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-a59b-2a9ea4bda799
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-64bc-35cb9b4477ea
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-438e-8934af7a48ad
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-2199-5f3c24846e73
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-120f-7d823aba8c4e
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-409d-899288084de2
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-9687-8d5b0e50c416
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-52ce-8db54d0ad2a1
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-a362-d368858ab3a0
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-4a84-370479f04dc5
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-de68-dc1cd6a0530a
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-5ada-f017179009f6
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-e37f-3cfcaff018df
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-594e-4b6e07b37d6d
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-4ab1-e5fdb2248c1e
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-493a-047eeebb6738
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-8a09-b7add614151b
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-3e14-55766563d303
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-44d1-2b5dd477da16
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-32d3-11450d5437f0
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-1e56-26591f286635
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-b99f-fddde33f85db
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-c149-9fae34c7498a
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-73f8-3754bdcd3872
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-036f-73bfc599bf09
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-30b5-1e85ec929353
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-e950-523a03144463
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-c88d-385330192fda
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-1a00-6dbf805ac6ec
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-f971-f2130742c056
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-c73f-91c6c2df1668
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-7cb8-590076eeb27c
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-7922-b69e4a3f2c99
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-5c9b-d3c601ad968b
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-379b-66cb13363f0a
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-b9ce-65d9ce408af3
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-2d7c-2f5a384853b0
00020000-5583-cf25-7d95-5fe9998e1c94	00030000-5583-cf25-cdb0-dc134fc74201
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-28a5-8d790c384f8a
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-18b8-f2c97a69d4d2
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-34ad-a6f3f555151b
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-5658-04c5b5f10843
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-64bc-35cb9b4477ea
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-2199-5f3c24846e73
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-409d-899288084de2
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-9687-8d5b0e50c416
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-52ce-8db54d0ad2a1
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-a362-d368858ab3a0
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-4a84-370479f04dc5
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-de68-dc1cd6a0530a
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-5ada-f017179009f6
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-594e-4b6e07b37d6d
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-493a-047eeebb6738
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-8a09-b7add614151b
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-3e14-55766563d303
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-b99f-fddde33f85db
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-73f8-3754bdcd3872
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-30b5-1e85ec929353
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-c88d-385330192fda
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-18d9-ab2aca529487
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-91b0-33f8e8a04a22
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-9bb0-4ba84c552c48
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-9835-305b7fb351d8
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-ce29-ec76d087d074
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-f495-ac949dab3c40
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-2d7c-2f5a384853b0
00020000-5583-cf25-0a11-847e31e639fc	00030000-5583-cf25-cdb0-dc134fc74201
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-28a5-8d790c384f8a
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-3c93-5157ff9562d3
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-18b8-f2c97a69d4d2
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-156c-a0d14326f249
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-411a-e0a7f0c11e11
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-d279-e201d4f07718
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-34ad-a6f3f555151b
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-5658-04c5b5f10843
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-4d20-a3001ae3b07b
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-64bc-35cb9b4477ea
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-2199-5f3c24846e73
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-409d-899288084de2
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-52ce-8db54d0ad2a1
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-a362-d368858ab3a0
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-4a84-370479f04dc5
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-5ada-f017179009f6
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-594e-4b6e07b37d6d
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-3e14-55766563d303
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-32d3-11450d5437f0
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-b99f-fddde33f85db
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-73f8-3754bdcd3872
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-30b5-1e85ec929353
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-c88d-385330192fda
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-f971-f2130742c056
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-7922-b69e4a3f2c99
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-379b-66cb13363f0a
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-2d7c-2f5a384853b0
00020000-5583-cf25-b7bc-784b684b0987	00030000-5583-cf25-cdb0-dc134fc74201
00020000-5583-cf25-9558-6e728fd71337	00030000-5583-cf25-28a5-8d790c384f8a
00020000-5583-cf25-9558-6e728fd71337	00030000-5583-cf25-8abe-d1521a54ea99
00020000-5583-cf25-9558-6e728fd71337	00030000-5583-cf25-6777-9fd1158788bb
00020000-5583-cf25-9558-6e728fd71337	00030000-5583-cf25-18b8-f2c97a69d4d2
00020000-5583-cf25-9558-6e728fd71337	00030000-5583-cf25-34ad-a6f3f555151b
00020000-5583-cf25-9558-6e728fd71337	00030000-5583-cf25-5658-04c5b5f10843
00020000-5583-cf25-9558-6e728fd71337	00030000-5583-cf25-64bc-35cb9b4477ea
00020000-5583-cf25-9558-6e728fd71337	00030000-5583-cf25-2199-5f3c24846e73
00020000-5583-cf25-9558-6e728fd71337	00030000-5583-cf25-52ce-8db54d0ad2a1
00020000-5583-cf25-9558-6e728fd71337	00030000-5583-cf25-a362-d368858ab3a0
00020000-5583-cf25-9558-6e728fd71337	00030000-5583-cf25-5ada-f017179009f6
00020000-5583-cf25-9558-6e728fd71337	00030000-5583-cf25-594e-4b6e07b37d6d
00020000-5583-cf25-9558-6e728fd71337	00030000-5583-cf25-3e14-55766563d303
00020000-5583-cf25-9558-6e728fd71337	00030000-5583-cf25-b99f-fddde33f85db
00020000-5583-cf25-9558-6e728fd71337	00030000-5583-cf25-73f8-3754bdcd3872
00020000-5583-cf25-9558-6e728fd71337	00030000-5583-cf25-30b5-1e85ec929353
00020000-5583-cf25-9558-6e728fd71337	00030000-5583-cf25-c88d-385330192fda
00020000-5583-cf25-9558-6e728fd71337	00030000-5583-cf25-f971-f2130742c056
00020000-5583-cf25-9558-6e728fd71337	00030000-5583-cf25-2d7c-2f5a384853b0
00020000-5583-cf25-9558-6e728fd71337	00030000-5583-cf25-cdb0-dc134fc74201
00020000-5583-cf25-9043-f0e763ca4d2e	00030000-5583-cf25-28a5-8d790c384f8a
00020000-5583-cf25-9043-f0e763ca4d2e	00030000-5583-cf25-18b8-f2c97a69d4d2
00020000-5583-cf25-9043-f0e763ca4d2e	00030000-5583-cf25-34ad-a6f3f555151b
00020000-5583-cf25-9043-f0e763ca4d2e	00030000-5583-cf25-5658-04c5b5f10843
00020000-5583-cf25-9043-f0e763ca4d2e	00030000-5583-cf25-64bc-35cb9b4477ea
00020000-5583-cf25-9043-f0e763ca4d2e	00030000-5583-cf25-2199-5f3c24846e73
00020000-5583-cf25-9043-f0e763ca4d2e	00030000-5583-cf25-52ce-8db54d0ad2a1
00020000-5583-cf25-9043-f0e763ca4d2e	00030000-5583-cf25-a362-d368858ab3a0
00020000-5583-cf25-9043-f0e763ca4d2e	00030000-5583-cf25-5ada-f017179009f6
00020000-5583-cf25-9043-f0e763ca4d2e	00030000-5583-cf25-594e-4b6e07b37d6d
00020000-5583-cf25-9043-f0e763ca4d2e	00030000-5583-cf25-3e14-55766563d303
00020000-5583-cf25-9043-f0e763ca4d2e	00030000-5583-cf25-b99f-fddde33f85db
00020000-5583-cf25-9043-f0e763ca4d2e	00030000-5583-cf25-73f8-3754bdcd3872
00020000-5583-cf25-9043-f0e763ca4d2e	00030000-5583-cf25-30b5-1e85ec929353
00020000-5583-cf25-9043-f0e763ca4d2e	00030000-5583-cf25-c88d-385330192fda
00020000-5583-cf25-9043-f0e763ca4d2e	00030000-5583-cf25-867c-33b01912dcde
00020000-5583-cf25-9043-f0e763ca4d2e	00030000-5583-cf25-9e0e-7bc858d4603b
00020000-5583-cf25-9043-f0e763ca4d2e	00030000-5583-cf25-f971-f2130742c056
00020000-5583-cf25-9043-f0e763ca4d2e	00030000-5583-cf25-2d7c-2f5a384853b0
00020000-5583-cf25-9043-f0e763ca4d2e	00030000-5583-cf25-cdb0-dc134fc74201
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-8eac-5ac19aadb23d
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-2db6-f466df4cd7ec
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-9e0e-7bc858d4603b
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-a429-52e183781d7c
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-579e-9e2da59f5e42
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-28a5-8d790c384f8a
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-8abe-d1521a54ea99
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-3c93-5157ff9562d3
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-6777-9fd1158788bb
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-18b8-f2c97a69d4d2
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-156c-a0d14326f249
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-411a-e0a7f0c11e11
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-325d-a1b2d8878129
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-d279-e201d4f07718
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-bfa7-585376e7617b
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-34ad-a6f3f555151b
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-2d93-e0ba91a2ee36
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-5658-04c5b5f10843
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-2566-259493fb245b
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-4d20-a3001ae3b07b
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-a59b-2a9ea4bda799
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-64bc-35cb9b4477ea
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-438e-8934af7a48ad
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-2199-5f3c24846e73
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-120f-7d823aba8c4e
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-409d-899288084de2
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-9687-8d5b0e50c416
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-ceb8-f5cd49be9e4c
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-e954-d689e6e0e457
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-8e3c-d0552a6015fc
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-e371-1b4a69366511
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-52ce-8db54d0ad2a1
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-18f4-e6c502a60f83
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-a362-d368858ab3a0
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-2a4e-39a4ad15894b
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-4a84-370479f04dc5
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-de68-dc1cd6a0530a
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-42ad-ec54bd93010a
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-9fda-574790488c77
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-8066-a494a86c4343
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-370c-c2b524d72ab3
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-42bd-7593d4890e56
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-60b1-065d654f5b08
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-5ada-f017179009f6
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-e37f-3cfcaff018df
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-594e-4b6e07b37d6d
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-4ab1-e5fdb2248c1e
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-a3b6-dea4233283b9
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-4303-8c0219144f05
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-493a-047eeebb6738
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-8a09-b7add614151b
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-3e14-55766563d303
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-44d1-2b5dd477da16
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-624e-5fb7697762d4
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-338a-42b81ee425cb
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-cb1c-a9f3bae55b4f
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-48db-de436c5adf75
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-32d3-11450d5437f0
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-1e56-26591f286635
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-1007-204008621512
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-3a2b-5603b8cca5ca
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-e187-08984ee8a9ec
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-9141-c8daa42d0fe6
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-4ded-545eeda9cfbb
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-405e-54baa0b55e13
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-3a3e-6242fbb399c8
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-98c5-8b02c1b814fc
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-775f-3c5335b1e45f
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-d351-0ca602599d9a
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-8b24-66f4e710845f
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-8c34-43202f49cef8
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-c084-65df30954481
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-c925-343485153576
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-bb2b-7c982862321b
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-0ccc-97bb4a40dd54
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-4389-86e662826317
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-b8d7-b7edae00256d
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-b99f-fddde33f85db
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-c149-9fae34c7498a
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-3e60-ec856a36ecb6
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-2efc-85dc7165f804
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-9f5c-8824492d2e7b
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-f58e-ab7b7ff33cf2
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-73f8-3754bdcd3872
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-036f-73bfc599bf09
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-30b5-1e85ec929353
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-e950-523a03144463
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-cede-03be46414485
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-6bc3-276ff49e3b3c
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-3b14-57921d8845ab
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-3070-fc38d8aaa0df
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-d08c-7833ac57fb37
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-3c75-74d7a9c6e94d
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-7915-63f6bc4539da
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-4956-5a7423fa9d38
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-c88d-385330192fda
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-1a00-6dbf805ac6ec
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-a75c-037f4a083e2b
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-3ef6-14577b4e0e01
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-99e6-a02020194153
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-60ec-a6115fb4042b
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-dd44-e4bb46d4640a
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-a69e-297c6d48456c
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-e206-c7af483cb6f1
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-1518-850e644c35a1
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-18d9-ab2aca529487
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-91b0-33f8e8a04a22
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-867c-33b01912dcde
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-626b-60dd36f3c79e
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-f971-f2130742c056
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-0859-33a94aee4ec0
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-2f60-5877f41c60e1
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-d580-5cffce0ba6ba
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-9bb0-4ba84c552c48
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-9835-305b7fb351d8
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-c73f-91c6c2df1668
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-7cb8-590076eeb27c
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-7922-b69e4a3f2c99
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-5c9b-d3c601ad968b
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-fc1d-d5876aa0d18d
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-05d0-716c37bc5995
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-ce29-ec76d087d074
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-f495-ac949dab3c40
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-379b-66cb13363f0a
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-b9ce-65d9ce408af3
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-2d7c-2f5a384853b0
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-fcae-2efa2e12447d
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-cdb0-dc134fc74201
00020000-5583-cf2a-52d6-5d7cf99d84e7	00030000-5583-cf25-0f6a-3cc1acd63b2c
\.


--
-- TOC entry 2858 (class 0 OID 7825824)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 7825855)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 7825991)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2835 (class 0 OID 7825589)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5583-cf29-ccd5-3233f6e2286e	00040000-5583-cf24-7ff9-8b578d56ce0e	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5583-cf29-bf43-8e9d3991d225	00040000-5583-cf24-7ff9-8b578d56ce0e	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5583-cf29-d28f-5228d7083580	00040000-5583-cf24-7ff9-8b578d56ce0e	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5583-cf29-aef5-2fffab513460	00040000-5583-cf24-7ff9-8b578d56ce0e	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5583-cf2a-0077-6d55ec119343	00040000-5583-cf24-08e5-2e02037dc0d0	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2837 (class 0 OID 7825624)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5583-cf25-e816-4b785922ce42	8341	Adlešiči
00050000-5583-cf25-e103-4319ea9ea3e1	5270	Ajdovščina
00050000-5583-cf25-9ad7-f6dbf69716db	6280	Ankaran/Ancarano
00050000-5583-cf25-9b07-67a0777367fb	9253	Apače
00050000-5583-cf25-c81b-de52f749afa3	8253	Artiče
00050000-5583-cf25-4364-dd16c26f086f	4275	Begunje na Gorenjskem
00050000-5583-cf25-a963-d090e77b6d5a	1382	Begunje pri Cerknici
00050000-5583-cf25-3a33-cb65c7c5bf6f	9231	Beltinci
00050000-5583-cf25-a3ef-3b5c1b3daf72	2234	Benedikt
00050000-5583-cf25-6520-770431374b2c	2345	Bistrica ob Dravi
00050000-5583-cf25-8887-31d67e42c719	3256	Bistrica ob Sotli
00050000-5583-cf25-4414-9e30dfe5cfec	8259	Bizeljsko
00050000-5583-cf25-3d59-fcbf24b7e13c	1223	Blagovica
00050000-5583-cf25-b598-903bb6daa1fd	8283	Blanca
00050000-5583-cf25-d6ae-6fd4c650a0d6	4260	Bled
00050000-5583-cf25-7cbd-dff5adc7dde5	4273	Blejska Dobrava
00050000-5583-cf25-abfc-69f508a1665c	9265	Bodonci
00050000-5583-cf25-5a9b-1943165ef282	9222	Bogojina
00050000-5583-cf25-a50e-83bbe087b5c2	4263	Bohinjska Bela
00050000-5583-cf25-b71e-6fa0102931a4	4264	Bohinjska Bistrica
00050000-5583-cf25-37a6-1048ea4f0b62	4265	Bohinjsko jezero
00050000-5583-cf25-110b-9ee6abcbadb4	1353	Borovnica
00050000-5583-cf25-9956-96aa77822d2c	8294	Boštanj
00050000-5583-cf25-2372-4f7629b6645d	5230	Bovec
00050000-5583-cf25-01c5-350b0db10044	5295	Branik
00050000-5583-cf25-8412-f1bc6a19f45b	3314	Braslovče
00050000-5583-cf25-bd07-8910b176c090	5223	Breginj
00050000-5583-cf25-dd95-32c9624ce58e	8280	Brestanica
00050000-5583-cf25-e23e-558d45494294	2354	Bresternica
00050000-5583-cf25-e1c8-cd1848f665dd	4243	Brezje
00050000-5583-cf25-a9d5-7377667e46f6	1351	Brezovica pri Ljubljani
00050000-5583-cf25-a6cb-01e33fee9172	8250	Brežice
00050000-5583-cf25-1ca8-7f1d0f677322	4210	Brnik - Aerodrom
00050000-5583-cf25-0f09-fecaf5f9f2fd	8321	Brusnice
00050000-5583-cf25-04d2-ca989c6a457a	3255	Buče
00050000-5583-cf25-55d6-f23d1af1f0a6	8276	Bučka 
00050000-5583-cf25-c427-83384476cb58	9261	Cankova
00050000-5583-cf25-5c8c-e930980132ba	3000	Celje 
00050000-5583-cf25-72a7-6b37e48465ba	3001	Celje - poštni predali
00050000-5583-cf25-be89-f88c6ae5ec7f	4207	Cerklje na Gorenjskem
00050000-5583-cf25-bf6a-68f63667286b	8263	Cerklje ob Krki
00050000-5583-cf25-b040-5932a8512a05	1380	Cerknica
00050000-5583-cf25-7885-793381a05149	5282	Cerkno
00050000-5583-cf25-b301-3fd310ab8e10	2236	Cerkvenjak
00050000-5583-cf25-e039-40e0970644c2	2215	Ceršak
00050000-5583-cf25-f01b-efe2efb53324	2326	Cirkovce
00050000-5583-cf25-9fcc-f69c658e0078	2282	Cirkulane
00050000-5583-cf25-61de-5e8dc18375d8	5273	Col
00050000-5583-cf25-6334-ef27fbc1dfbd	8251	Čatež ob Savi
00050000-5583-cf25-1e2a-ecbcae3175f4	1413	Čemšenik
00050000-5583-cf25-645a-bad0979a0346	5253	Čepovan
00050000-5583-cf25-b628-7533db9880c2	9232	Črenšovci
00050000-5583-cf25-9d1b-e0b5c57155dd	2393	Črna na Koroškem
00050000-5583-cf25-e92d-d817f8e09a56	6275	Črni Kal
00050000-5583-cf25-08c0-5591b0a0fe95	5274	Črni Vrh nad Idrijo
00050000-5583-cf25-915b-c9b680a23a5e	5262	Črniče
00050000-5583-cf25-16cc-8ef68434e65d	8340	Črnomelj
00050000-5583-cf25-ebb6-8122ac5ad85f	6271	Dekani
00050000-5583-cf26-7c48-c7e9ee9897ec	5210	Deskle
00050000-5583-cf26-bff4-7707dea3da6d	2253	Destrnik
00050000-5583-cf26-b533-51b2d566eb1f	6215	Divača
00050000-5583-cf26-fbad-4eaac4d9b351	1233	Dob
00050000-5583-cf26-47b4-08bb9da738bb	3224	Dobje pri Planini
00050000-5583-cf26-faa1-806421dcdb86	8257	Dobova
00050000-5583-cf26-6cf7-7ac76709afa5	1423	Dobovec
00050000-5583-cf26-ea9c-d74f56dc9c35	5263	Dobravlje
00050000-5583-cf26-a0cd-be79da34872b	3204	Dobrna
00050000-5583-cf26-08fe-00c0e4b347d0	8211	Dobrnič
00050000-5583-cf26-e7c4-346385aecb60	1356	Dobrova
00050000-5583-cf26-f5a3-872165571dd6	9223	Dobrovnik/Dobronak 
00050000-5583-cf26-2d26-50f66ace0979	5212	Dobrovo v Brdih
00050000-5583-cf26-1279-1a9ac3aa8f1c	1431	Dol pri Hrastniku
00050000-5583-cf26-dca5-3b9c0fe066e3	1262	Dol pri Ljubljani
00050000-5583-cf26-04c2-0b26f70aa4df	1273	Dole pri Litiji
00050000-5583-cf26-285d-8a84747c8311	1331	Dolenja vas
00050000-5583-cf26-dafb-c898b02e63bd	8350	Dolenjske Toplice
00050000-5583-cf26-4597-6a821b9fe740	1230	Domžale
00050000-5583-cf26-d13e-e7e7f88d9916	2252	Dornava
00050000-5583-cf26-54c0-8c87ea5f5fcb	5294	Dornberk
00050000-5583-cf26-350e-99ec7512e01e	1319	Draga
00050000-5583-cf26-3020-1040cb21b3b4	8343	Dragatuš
00050000-5583-cf26-778f-9a2537fd9501	3222	Dramlje
00050000-5583-cf26-5cd9-ce488abc34bb	2370	Dravograd
00050000-5583-cf26-8876-59b9a9c63296	4203	Duplje
00050000-5583-cf26-572f-3ae31997a56e	6221	Dutovlje
00050000-5583-cf26-5b7b-1ef963329155	8361	Dvor
00050000-5583-cf26-e5c9-ddfdd642133e	2343	Fala
00050000-5583-cf26-f886-94cb310d0a41	9208	Fokovci
00050000-5583-cf26-deaa-5c14da4c5239	2313	Fram
00050000-5583-cf26-6f05-b35fbcd55726	3213	Frankolovo
00050000-5583-cf26-55b4-9b88da2fd417	1274	Gabrovka
00050000-5583-cf26-f869-d70bb177af49	8254	Globoko
00050000-5583-cf26-b2d4-9a2e7a60e5a8	5275	Godovič
00050000-5583-cf26-c08d-84f3281bd496	4204	Golnik
00050000-5583-cf26-e733-21a9c098dede	3303	Gomilsko
00050000-5583-cf26-6216-e822fd49e943	4224	Gorenja vas
00050000-5583-cf26-3fd8-7b8a7c417672	3263	Gorica pri Slivnici
00050000-5583-cf26-ed86-5deb3c987c67	2272	Gorišnica
00050000-5583-cf26-ab34-780fc688f80d	9250	Gornja Radgona
00050000-5583-cf26-ac0c-e61a231180f9	3342	Gornji Grad
00050000-5583-cf26-6b3b-04a7dbd665e5	4282	Gozd Martuljek
00050000-5583-cf26-9801-557820865e8d	6272	Gračišče
00050000-5583-cf26-51c1-6fb9ccc7844b	9264	Grad
00050000-5583-cf26-4d97-aa9030bc8a64	8332	Gradac
00050000-5583-cf26-3a63-e3153eb04d76	1384	Grahovo
00050000-5583-cf26-3b88-910df218af3e	5242	Grahovo ob Bači
00050000-5583-cf26-4dbd-eec42a270bf7	5251	Grgar
00050000-5583-cf26-4eee-07da9ed093cf	3302	Griže
00050000-5583-cf26-a0e8-e1ed79e8428e	3231	Grobelno
00050000-5583-cf26-1226-a327148164c5	1290	Grosuplje
00050000-5583-cf26-2cd7-e52103d679c6	2288	Hajdina
00050000-5583-cf26-4c08-f2967ee79130	8362	Hinje
00050000-5583-cf26-9036-3f24ebbcaeae	2311	Hoče
00050000-5583-cf26-7176-0d2bb9dbec62	9205	Hodoš/Hodos
00050000-5583-cf26-32ba-afbec363ca68	1354	Horjul
00050000-5583-cf26-fb43-56d14679be14	1372	Hotedršica
00050000-5583-cf26-521c-7b20789f0f83	1430	Hrastnik
00050000-5583-cf26-3654-0dc9a8f5ade1	6225	Hruševje
00050000-5583-cf26-8677-88a4de954c53	4276	Hrušica
00050000-5583-cf26-61c9-9729ff24d7de	5280	Idrija
00050000-5583-cf26-6bc3-51f2d8b695b5	1292	Ig
00050000-5583-cf26-36ac-9295cc8a290f	6250	Ilirska Bistrica
00050000-5583-cf26-4dac-417a1952cd7c	6251	Ilirska Bistrica-Trnovo
00050000-5583-cf26-5ca0-33ecee65abcb	1295	Ivančna Gorica
00050000-5583-cf26-7c07-fd3088433f3b	2259	Ivanjkovci
00050000-5583-cf26-9c1e-2165617a9007	1411	Izlake
00050000-5583-cf26-9113-fddfe4eca685	6310	Izola/Isola
00050000-5583-cf26-afce-d77dd06b13b2	2222	Jakobski Dol
00050000-5583-cf26-bf7b-3dc5bf9c5186	2221	Jarenina
00050000-5583-cf26-a332-8b4516b52b04	6254	Jelšane
00050000-5583-cf26-0c50-7302e05597d1	4270	Jesenice
00050000-5583-cf26-613b-61192465703e	8261	Jesenice na Dolenjskem
00050000-5583-cf26-3dab-f0a92f8e4e36	3273	Jurklošter
00050000-5583-cf26-d322-4dff76842a82	2223	Jurovski Dol
00050000-5583-cf26-d204-195e95dd7a64	2256	Juršinci
00050000-5583-cf26-cc44-3eaac4bf5a6e	5214	Kal nad Kanalom
00050000-5583-cf26-e1f3-48585f12d2e3	3233	Kalobje
00050000-5583-cf26-10ce-51ada8035f80	4246	Kamna Gorica
00050000-5583-cf26-ddb1-2e7b40cd041e	2351	Kamnica
00050000-5583-cf26-4e65-d78503d3fed5	1241	Kamnik
00050000-5583-cf26-5503-77eb41753ca2	5213	Kanal
00050000-5583-cf26-b777-7e5a67ca2d45	8258	Kapele
00050000-5583-cf26-70ff-d6fa260de801	2362	Kapla
00050000-5583-cf26-6e07-aeffbcf91710	2325	Kidričevo
00050000-5583-cf26-49b6-a7c916aaab88	1412	Kisovec
00050000-5583-cf26-070d-75c78b5dd84b	6253	Knežak
00050000-5583-cf26-9ff0-8c00da9038c9	5222	Kobarid
00050000-5583-cf26-dcd8-9f1331395ce1	9227	Kobilje
00050000-5583-cf26-4c08-bdee622db783	1330	Kočevje
00050000-5583-cf26-fbb0-095869b72118	1338	Kočevska Reka
00050000-5583-cf26-9f6a-9ed335ebf203	2276	Kog
00050000-5583-cf26-9a31-e3591ba1b91d	5211	Kojsko
00050000-5583-cf26-8c2e-ced8d843044c	6223	Komen
00050000-5583-cf26-4229-32b5b84c5964	1218	Komenda
00050000-5583-cf26-c4d9-20ca1f711cf9	6000	Koper/Capodistria 
00050000-5583-cf26-71c2-5435fab57a8f	6001	Koper/Capodistria - poštni predali
00050000-5583-cf26-64ea-52a3e07bbee4	8282	Koprivnica
00050000-5583-cf26-d589-a6b117a20b15	5296	Kostanjevica na Krasu
00050000-5583-cf26-df98-f02d310ab5b6	8311	Kostanjevica na Krki
00050000-5583-cf26-f241-c7fee61abc4d	1336	Kostel
00050000-5583-cf26-a265-416485e78247	6256	Košana
00050000-5583-cf26-edf9-16173fecd268	2394	Kotlje
00050000-5583-cf26-6ac3-0c67850961ca	6240	Kozina
00050000-5583-cf26-c00b-077706dcf24c	3260	Kozje
00050000-5583-cf26-4ffc-8dd4d6153e6f	4000	Kranj 
00050000-5583-cf26-dd9a-65837b7ad5b4	4001	Kranj - poštni predali
00050000-5583-cf26-3cce-b70482e2ebf5	4280	Kranjska Gora
00050000-5583-cf26-ef3a-fd226998549c	1281	Kresnice
00050000-5583-cf26-9681-b9731d2c4bc5	4294	Križe
00050000-5583-cf26-ed0f-50e431097d83	9206	Križevci
00050000-5583-cf26-fde4-f045cfb02a07	9242	Križevci pri Ljutomeru
00050000-5583-cf26-52b0-d288920abb68	1301	Krka
00050000-5583-cf26-f065-2ab561436c8f	8296	Krmelj
00050000-5583-cf26-d53e-712e6cdaf010	4245	Kropa
00050000-5583-cf26-d94a-eb0194485c7b	8262	Krška vas
00050000-5583-cf26-ff52-adef5a1d990b	8270	Krško
00050000-5583-cf26-3c00-386d20bc4b39	9263	Kuzma
00050000-5583-cf26-c020-50ff0aaba91a	2318	Laporje
00050000-5583-cf26-8501-6f5a4c9be23a	3270	Laško
00050000-5583-cf26-bc03-e6ff9804b7d9	1219	Laze v Tuhinju
00050000-5583-cf26-82f7-40757f68a33c	2230	Lenart v Slovenskih goricah
00050000-5583-cf26-56f1-58b2d4a870eb	9220	Lendava/Lendva
00050000-5583-cf26-da2a-8c658b82a3a2	4248	Lesce
00050000-5583-cf26-e2c9-a5de8558d2e9	3261	Lesično
00050000-5583-cf26-7f3d-ad1fd57676aa	8273	Leskovec pri Krškem
00050000-5583-cf26-583d-f91499e688be	2372	Libeliče
00050000-5583-cf26-592b-92675a7c8d92	2341	Limbuš
00050000-5583-cf26-cab8-a2b29e227a66	1270	Litija
00050000-5583-cf26-0dde-d10b0ad8b4a9	3202	Ljubečna
00050000-5583-cf26-633d-088177cdfb68	1000	Ljubljana 
00050000-5583-cf26-8e89-44596fed1bdf	1001	Ljubljana - poštni predali
00050000-5583-cf26-c09b-96cb4cfb222d	1231	Ljubljana - Črnuče
00050000-5583-cf26-c933-da49b96224de	1261	Ljubljana - Dobrunje
00050000-5583-cf26-c3fc-272f40f85314	1260	Ljubljana - Polje
00050000-5583-cf26-38be-fe67576bcc1b	1210	Ljubljana - Šentvid
00050000-5583-cf26-d122-12a92c3bfaa1	1211	Ljubljana - Šmartno
00050000-5583-cf26-0461-9be70522fc09	3333	Ljubno ob Savinji
00050000-5583-cf26-1340-f6fdcafe51b7	9240	Ljutomer
00050000-5583-cf26-a247-45cc36a134fa	3215	Loče
00050000-5583-cf26-5872-3e295aebc2af	5231	Log pod Mangartom
00050000-5583-cf26-f470-64a3565604da	1358	Log pri Brezovici
00050000-5583-cf26-c97a-b536824e81a1	1370	Logatec
00050000-5583-cf26-dab8-3f4abd02442d	1371	Logatec
00050000-5583-cf26-a4c1-454610cccdfc	1434	Loka pri Zidanem Mostu
00050000-5583-cf26-02e9-13b068c86601	3223	Loka pri Žusmu
00050000-5583-cf26-5c63-f3ef81bf6423	6219	Lokev
00050000-5583-cf26-187e-89db4e6136b1	1318	Loški Potok
00050000-5583-cf26-8354-4fa456d35648	2324	Lovrenc na Dravskem polju
00050000-5583-cf26-7cc9-ae5684916820	2344	Lovrenc na Pohorju
00050000-5583-cf26-2e54-b95235cfd54c	3334	Luče
00050000-5583-cf26-951e-91769ffdb3be	1225	Lukovica
00050000-5583-cf26-36da-f45a6c9ea91e	9202	Mačkovci
00050000-5583-cf26-1540-b4928b79484b	2322	Majšperk
00050000-5583-cf26-29d6-d04d8578a5ce	2321	Makole
00050000-5583-cf26-158c-0d627d241efe	9243	Mala Nedelja
00050000-5583-cf26-7098-adc0dcf1ec74	2229	Malečnik
00050000-5583-cf26-6a14-0af1b4b3550a	6273	Marezige
00050000-5583-cf26-331c-43aa8e096b3a	2000	Maribor 
00050000-5583-cf26-61e1-eaed9da6a7f8	2001	Maribor - poštni predali
00050000-5583-cf26-9572-07625b6dffe4	2206	Marjeta na Dravskem polju
00050000-5583-cf26-3932-5c82a89d267e	2281	Markovci
00050000-5583-cf26-a6c4-eb01e56c7422	9221	Martjanci
00050000-5583-cf26-8e52-e9704b5c31a1	6242	Materija
00050000-5583-cf26-3cc6-dc98ea78568a	4211	Mavčiče
00050000-5583-cf26-426f-4ecd497e372b	1215	Medvode
00050000-5583-cf26-a7a0-9e89b51d2e07	1234	Mengeš
00050000-5583-cf26-4dd7-28cf9663c363	8330	Metlika
00050000-5583-cf26-c492-4bd68804f281	2392	Mežica
00050000-5583-cf26-3a1f-1f48eec91624	2204	Miklavž na Dravskem polju
00050000-5583-cf26-9049-0d365cabb8ee	2275	Miklavž pri Ormožu
00050000-5583-cf26-6ce7-821ff139b72e	5291	Miren
00050000-5583-cf26-a592-a15790f724cb	8233	Mirna
00050000-5583-cf26-0501-417ca9a6e632	8216	Mirna Peč
00050000-5583-cf26-59b9-a188a4b1f23b	2382	Mislinja
00050000-5583-cf26-0db3-02135a9ffc8a	4281	Mojstrana
00050000-5583-cf26-f93c-ac51483a7e9c	8230	Mokronog
00050000-5583-cf26-bdea-10bc3b1dd41f	1251	Moravče
00050000-5583-cf26-c8be-ebe00f8ca835	9226	Moravske Toplice
00050000-5583-cf26-7520-e307b41e575a	5216	Most na Soči
00050000-5583-cf26-24a7-a8297fd4a81b	1221	Motnik
00050000-5583-cf26-3964-60d5031f7279	3330	Mozirje
00050000-5583-cf26-7d3f-82a8b8cf28d1	9000	Murska Sobota 
00050000-5583-cf26-1aae-3dcfc48df0c5	9001	Murska Sobota - poštni predali
00050000-5583-cf26-8b12-fb7fef1b1637	2366	Muta
00050000-5583-cf26-3093-7a3389ffc885	4202	Naklo
00050000-5583-cf26-cbc1-1596ea95bebe	3331	Nazarje
00050000-5583-cf26-5f27-4503866536e5	1357	Notranje Gorice
00050000-5583-cf26-05cb-52d49592ad68	3203	Nova Cerkev
00050000-5583-cf26-8e13-52abcff3482b	5000	Nova Gorica 
00050000-5583-cf26-d395-1a6789f8b8a0	5001	Nova Gorica - poštni predali
00050000-5583-cf26-8e38-f9403db67be6	1385	Nova vas
00050000-5583-cf26-b22a-930c84918250	8000	Novo mesto
00050000-5583-cf26-9573-2edf12adc7d2	8001	Novo mesto - poštni predali
00050000-5583-cf26-3147-e378222cfe74	6243	Obrov
00050000-5583-cf26-5b98-4d8852d131b5	9233	Odranci
00050000-5583-cf26-c253-f91ce258740e	2317	Oplotnica
00050000-5583-cf26-aa93-73959dd98f54	2312	Orehova vas
00050000-5583-cf26-88d5-840abd274c18	2270	Ormož
00050000-5583-cf26-8250-f8cd802bcda0	1316	Ortnek
00050000-5583-cf26-017e-5f2e72d6b00d	1337	Osilnica
00050000-5583-cf26-0261-7ae6c586f676	8222	Otočec
00050000-5583-cf26-c59e-d52ad38ff2c9	2361	Ožbalt
00050000-5583-cf26-bb84-57ae1276a483	2231	Pernica
00050000-5583-cf26-6c9b-1303b845f2c5	2211	Pesnica pri Mariboru
00050000-5583-cf26-1ca7-db69a2ebd4eb	9203	Petrovci
00050000-5583-cf26-663b-bf148c4c0312	3301	Petrovče
00050000-5583-cf26-168b-46ecb780968a	6330	Piran/Pirano
00050000-5583-cf26-319a-ede3b78af376	8255	Pišece
00050000-5583-cf26-2bc6-b2ae53b4740c	6257	Pivka
00050000-5583-cf26-7c30-c1bcb2cfe5d6	6232	Planina
00050000-5583-cf26-dae5-9c60f6f50496	3225	Planina pri Sevnici
00050000-5583-cf26-4de0-66fd06435ef4	6276	Pobegi
00050000-5583-cf26-e5e3-55a8de1aed84	8312	Podbočje
00050000-5583-cf26-fc4e-08d6a5c4c987	5243	Podbrdo
00050000-5583-cf26-f5dc-04a62ef018c9	3254	Podčetrtek
00050000-5583-cf26-094f-65a2a937b1f3	2273	Podgorci
00050000-5583-cf26-34b3-a25c1cc5a706	6216	Podgorje
00050000-5583-cf26-f278-d5ba038d1fd5	2381	Podgorje pri Slovenj Gradcu
00050000-5583-cf26-70d1-d73887f38a19	6244	Podgrad
00050000-5583-cf26-e35c-ff6b8652ab84	1414	Podkum
00050000-5583-cf26-60d8-414588f4e165	2286	Podlehnik
00050000-5583-cf26-b7c3-3881fe8050db	5272	Podnanos
00050000-5583-cf26-8377-de7d130e3869	4244	Podnart
00050000-5583-cf26-2728-d14a7047345d	3241	Podplat
00050000-5583-cf26-b165-ae2ad83961d1	3257	Podsreda
00050000-5583-cf26-bc43-aa0b87500f88	2363	Podvelka
00050000-5583-cf26-8459-788b11dbefdc	2208	Pohorje
00050000-5583-cf26-c8ff-f1b658e132e9	2257	Polenšak
00050000-5583-cf26-74ba-2be7fa8c84ab	1355	Polhov Gradec
00050000-5583-cf26-a6d8-4c4a61332760	4223	Poljane nad Škofjo Loko
00050000-5583-cf26-ae81-bd8e95330f2c	2319	Poljčane
00050000-5583-cf26-053b-3404375fd089	1272	Polšnik
00050000-5583-cf26-d2de-bc8dd30c2b83	3313	Polzela
00050000-5583-cf26-44f4-3ba1f1b9dfe8	3232	Ponikva
00050000-5583-cf26-9483-3d5ea95ee864	6320	Portorož/Portorose
00050000-5583-cf26-e770-5c93da0d534d	6230	Postojna
00050000-5583-cf26-cf83-b32eb585e2e0	2331	Pragersko
00050000-5583-cf26-59ff-570b32e8bbd5	3312	Prebold
00050000-5583-cf26-06ef-c1bdac67d549	4205	Preddvor
00050000-5583-cf26-e60a-6b13b87986ae	6255	Prem
00050000-5583-cf26-7158-45849798835d	1352	Preserje
00050000-5583-cf26-e5fe-54ce3a3b022a	6258	Prestranek
00050000-5583-cf26-22db-908f4652cdfa	2391	Prevalje
00050000-5583-cf26-ff7a-6ba01570c5ca	3262	Prevorje
00050000-5583-cf26-1ed9-1e3606e09387	1276	Primskovo 
00050000-5583-cf26-9be3-91f02993dd55	3253	Pristava pri Mestinju
00050000-5583-cf26-7d78-a606f0a2cb0c	9207	Prosenjakovci/Partosfalva
00050000-5583-cf26-040c-cb64e651d5c5	5297	Prvačina
00050000-5583-cf26-86b5-a9f398e7d78a	2250	Ptuj
00050000-5583-cf26-b594-325478766f38	2323	Ptujska Gora
00050000-5583-cf26-8cd6-0c778795572a	9201	Puconci
00050000-5583-cf26-45c9-6421b436f0a3	2327	Rače
00050000-5583-cf26-e26a-7b655be102f3	1433	Radeče
00050000-5583-cf26-7682-e31d0def8e8e	9252	Radenci
00050000-5583-cf26-99b1-67beb6eb426f	2360	Radlje ob Dravi
00050000-5583-cf26-8751-b13fad1e91ba	1235	Radomlje
00050000-5583-cf26-3df4-133451855bb8	4240	Radovljica
00050000-5583-cf26-4ebe-38f58435788a	8274	Raka
00050000-5583-cf26-39fe-3395672ca2cb	1381	Rakek
00050000-5583-cf26-caef-fe01cf019b84	4283	Rateče - Planica
00050000-5583-cf26-dc05-cbf213e43326	2390	Ravne na Koroškem
00050000-5583-cf26-8ef0-0a134aceb273	9246	Razkrižje
00050000-5583-cf26-8249-4117a7eaba1c	3332	Rečica ob Savinji
00050000-5583-cf26-0782-4a92e060ecbd	5292	Renče
00050000-5583-cf26-d96c-cf5420e3d536	1310	Ribnica
00050000-5583-cf26-d090-871d6c1bf835	2364	Ribnica na Pohorju
00050000-5583-cf26-47cd-fcd7363ac28d	3272	Rimske Toplice
00050000-5583-cf26-0262-ca39d2bbf420	1314	Rob
00050000-5583-cf26-ea0d-6b05f7dcfc85	5215	Ročinj
00050000-5583-cf26-50a4-f6141f48c97d	3250	Rogaška Slatina
00050000-5583-cf26-dd1c-bc88c0413b41	9262	Rogašovci
00050000-5583-cf26-b312-805646b0b591	3252	Rogatec
00050000-5583-cf26-4265-231962347040	1373	Rovte
00050000-5583-cf26-3c7c-891b06efa922	2342	Ruše
00050000-5583-cf26-d3ff-bf1ad738b414	1282	Sava
00050000-5583-cf26-b4f6-703a9467b7fc	6333	Sečovlje/Sicciole
00050000-5583-cf26-fe31-cbffbb8af73f	4227	Selca
00050000-5583-cf26-833c-74f7007c77f7	2352	Selnica ob Dravi
00050000-5583-cf26-6a4f-d0ed542b9a9f	8333	Semič
00050000-5583-cf26-2c3d-11244f869a03	8281	Senovo
00050000-5583-cf26-5f9d-5afac10b5301	6224	Senožeče
00050000-5583-cf26-b80a-cce6b5777e10	8290	Sevnica
00050000-5583-cf26-d876-6f1ce847114e	6210	Sežana
00050000-5583-cf26-8588-a2fe9d8163ac	2214	Sladki Vrh
00050000-5583-cf26-89e0-aae02d6e9c5c	5283	Slap ob Idrijci
00050000-5583-cf26-4ffb-4d09140dfbe1	2380	Slovenj Gradec
00050000-5583-cf26-5eca-6f8ababff9ca	2310	Slovenska Bistrica
00050000-5583-cf26-ab24-87c540ced732	3210	Slovenske Konjice
00050000-5583-cf26-7423-a6dec2e7cf29	1216	Smlednik
00050000-5583-cf26-69f9-3572a74b8e13	5232	Soča
00050000-5583-cf26-9319-4c176c221e9c	1317	Sodražica
00050000-5583-cf26-04a3-515a8656ae84	3335	Solčava
00050000-5583-cf26-0020-f91d1c828237	5250	Solkan
00050000-5583-cf26-135e-cf001b77d5c5	4229	Sorica
00050000-5583-cf26-8ac0-e4351c0b3577	4225	Sovodenj
00050000-5583-cf26-ecce-07eee58b8018	5281	Spodnja Idrija
00050000-5583-cf26-e3c1-74c77d8a8e48	2241	Spodnji Duplek
00050000-5583-cf26-07df-55c84d617bc4	9245	Spodnji Ivanjci
00050000-5583-cf26-fc4d-a77819539fcc	2277	Središče ob Dravi
00050000-5583-cf26-b3eb-819110c61254	4267	Srednja vas v Bohinju
00050000-5583-cf26-4aed-306c612c89b5	8256	Sromlje 
00050000-5583-cf26-48b5-7b1942f9a11c	5224	Srpenica
00050000-5583-cf26-8623-0c89616d7af2	1242	Stahovica
00050000-5583-cf26-ffd1-023b7a1e73ee	1332	Stara Cerkev
00050000-5583-cf26-a781-a2b280d700a7	8342	Stari trg ob Kolpi
00050000-5583-cf26-b0ef-d2348c031b5d	1386	Stari trg pri Ložu
00050000-5583-cf26-16b4-f02171cfcf22	2205	Starše
00050000-5583-cf26-e666-5a8ce0259fe8	2289	Stoperce
00050000-5583-cf26-9e82-f00514e05cbf	8322	Stopiče
00050000-5583-cf26-7ffb-5a3249416c8f	3206	Stranice
00050000-5583-cf26-af42-9744b231d697	8351	Straža
00050000-5583-cf26-2803-e0e7e06c2432	1313	Struge
00050000-5583-cf26-4b3b-05684dfe439d	8293	Studenec
00050000-5583-cf26-3b29-d17e29f4cecd	8331	Suhor
00050000-5583-cf26-aa1d-acfed165ee70	2233	Sv. Ana v Slovenskih goricah
00050000-5583-cf26-56bb-51633bd50cec	2235	Sv. Trojica v Slovenskih goricah
00050000-5583-cf26-293d-c5110b29dfff	2353	Sveti Duh na Ostrem Vrhu
00050000-5583-cf26-3be3-8bb89503352b	9244	Sveti Jurij ob Ščavnici
00050000-5583-cf26-da58-54832ccc7b3a	3264	Sveti Štefan
00050000-5583-cf26-f7ed-ad8c71fe48a7	2258	Sveti Tomaž
00050000-5583-cf26-f482-e2653cd4aac5	9204	Šalovci
00050000-5583-cf26-1f89-9e2be0077cf2	5261	Šempas
00050000-5583-cf26-cb3f-3744587d03f2	5290	Šempeter pri Gorici
00050000-5583-cf26-5081-c7f18f249262	3311	Šempeter v Savinjski dolini
00050000-5583-cf26-719e-316080b52d8b	4208	Šenčur
00050000-5583-cf26-9358-0b40d2f8d345	2212	Šentilj v Slovenskih goricah
00050000-5583-cf26-2fcc-cf299c4c738a	8297	Šentjanž
00050000-5583-cf26-15b4-93e21278259c	2373	Šentjanž pri Dravogradu
00050000-5583-cf26-cb72-68da3aa55d6d	8310	Šentjernej
00050000-5583-cf26-1909-15110d4b3cce	3230	Šentjur
00050000-5583-cf26-274b-aa1424c13b49	3271	Šentrupert
00050000-5583-cf26-12d5-f0de2f914ee3	8232	Šentrupert
00050000-5583-cf26-35be-cbe7c72c6d8b	1296	Šentvid pri Stični
00050000-5583-cf26-9a96-5055f1dd3f5a	8275	Škocjan
00050000-5583-cf26-ee34-14b055c8bbc2	6281	Škofije
00050000-5583-cf26-4a15-13674ba3a8e8	4220	Škofja Loka
00050000-5583-cf26-faba-f12bb97b2fd2	3211	Škofja vas
00050000-5583-cf26-29ab-8f620eace0f0	1291	Škofljica
00050000-5583-cf26-097f-acc7a76267dd	6274	Šmarje
00050000-5583-cf26-6cdf-f351af8af37c	1293	Šmarje - Sap
00050000-5583-cf26-180d-b0272967d0cf	3240	Šmarje pri Jelšah
00050000-5583-cf26-b8fc-228087b52d85	8220	Šmarješke Toplice
00050000-5583-cf26-f037-a4cad0e8601d	2315	Šmartno na Pohorju
00050000-5583-cf26-77a6-86d780c87a8f	3341	Šmartno ob Dreti
00050000-5583-cf26-599b-fcd04e09fc18	3327	Šmartno ob Paki
00050000-5583-cf26-991e-5420b42ae0a5	1275	Šmartno pri Litiji
00050000-5583-cf26-acb4-db2e66477a53	2383	Šmartno pri Slovenj Gradcu
00050000-5583-cf26-9cb1-1931aa693096	3201	Šmartno v Rožni dolini
00050000-5583-cf26-1dc0-64e1d878dc51	3325	Šoštanj
00050000-5583-cf26-1281-8114966691d2	6222	Štanjel
00050000-5583-cf26-f48d-2270d7fbbee4	3220	Štore
00050000-5583-cf26-755e-144e2c0dd823	3304	Tabor
00050000-5583-cf26-db84-4925fb12264f	3221	Teharje
00050000-5583-cf26-afc5-e7e6ffa734d1	9251	Tišina
00050000-5583-cf26-3450-077ab6982b4e	5220	Tolmin
00050000-5583-cf26-daa2-9247ab79df8c	3326	Topolšica
00050000-5583-cf26-5d50-1e937378f357	2371	Trbonje
00050000-5583-cf26-7269-563e8c9ae9e5	1420	Trbovlje
00050000-5583-cf26-261d-7423d098f1b1	8231	Trebelno 
00050000-5583-cf26-5222-7107823fe9a3	8210	Trebnje
00050000-5583-cf26-23f3-447e94a48cd6	5252	Trnovo pri Gorici
00050000-5583-cf26-32b5-8dcf7810a842	2254	Trnovska vas
00050000-5583-cf26-8c66-70f938afd56d	1222	Trojane
00050000-5583-cf26-daea-4efea1c07c28	1236	Trzin
00050000-5583-cf26-4048-95bb3c8366ca	4290	Tržič
00050000-5583-cf26-feba-6c2413d10701	8295	Tržišče
00050000-5583-cf26-3b25-131edcc23a28	1311	Turjak
00050000-5583-cf26-3f2a-1ad45bbaef91	9224	Turnišče
00050000-5583-cf26-c594-08965e53a697	8323	Uršna sela
00050000-5583-cf26-ec62-79d76e39de29	1252	Vače
00050000-5583-cf26-bd71-02a3b9ede0a5	3320	Velenje 
00050000-5583-cf26-d0ec-67127d610137	3322	Velenje - poštni predali
00050000-5583-cf26-47c8-197bfd5d3e20	8212	Velika Loka
00050000-5583-cf26-36f8-a08c6aa7da97	2274	Velika Nedelja
00050000-5583-cf26-8409-5bbf9fbd54fe	9225	Velika Polana
00050000-5583-cf26-4029-414423d63044	1315	Velike Lašče
00050000-5583-cf26-2c34-b96a83a6f941	8213	Veliki Gaber
00050000-5583-cf26-e670-78d03f6fb0b5	9241	Veržej
00050000-5583-cf26-5c42-e247c3c7f69e	1312	Videm - Dobrepolje
00050000-5583-cf26-6f56-93e3f0d07b6f	2284	Videm pri Ptuju
00050000-5583-cf26-dd7d-a2e203b68ab5	8344	Vinica
00050000-5583-cf26-0d29-9be9c7d5acba	5271	Vipava
00050000-5583-cf26-836b-02369530c956	4212	Visoko
00050000-5583-cf26-1930-f33e69869ef7	1294	Višnja Gora
00050000-5583-cf26-e80a-153ea9e48311	3205	Vitanje
00050000-5583-cf26-d08c-d9fd18bc3a86	2255	Vitomarci
00050000-5583-cf26-6fa5-36d6b40ecbae	1217	Vodice
00050000-5583-cf26-242b-f3d8bc735d56	3212	Vojnik\t
00050000-5583-cf26-67b2-f4905d81155f	5293	Volčja Draga
00050000-5583-cf26-6b4b-7f09da59b139	2232	Voličina
00050000-5583-cf26-d211-c965f9aa1c41	3305	Vransko
00050000-5583-cf26-1754-cb9dfb2bde2b	6217	Vremski Britof
00050000-5583-cf26-3afb-04b48ec08fac	1360	Vrhnika
00050000-5583-cf26-485a-8fb2aaa4c3a3	2365	Vuhred
00050000-5583-cf26-0d01-86139e526fbd	2367	Vuzenica
00050000-5583-cf26-2c5b-0c5f75aaf290	8292	Zabukovje 
00050000-5583-cf26-ab05-fb6aea5f30c9	1410	Zagorje ob Savi
00050000-5583-cf26-5eaf-010270de6011	1303	Zagradec
00050000-5583-cf26-775a-70fe1021b693	2283	Zavrč
00050000-5583-cf26-f690-f7ba2633a8b0	8272	Zdole 
00050000-5583-cf26-aa20-fab49063b601	4201	Zgornja Besnica
00050000-5583-cf26-1aef-e4c73cf8f434	2242	Zgornja Korena
00050000-5583-cf26-3397-55265edae504	2201	Zgornja Kungota
00050000-5583-cf26-61ac-b0b52ae37e57	2316	Zgornja Ložnica
00050000-5583-cf26-1a0a-7dd66366358b	2314	Zgornja Polskava
00050000-5583-cf26-c127-cd4747c49f8d	2213	Zgornja Velka
00050000-5583-cf26-2399-9ec52d108ac1	4247	Zgornje Gorje
00050000-5583-cf26-69ea-52b94c7faf8d	4206	Zgornje Jezersko
00050000-5583-cf26-aedf-2722ee0201bc	2285	Zgornji Leskovec
00050000-5583-cf26-4dd7-4a247dd25983	1432	Zidani Most
00050000-5583-cf26-8606-c74aa2025a31	3214	Zreče
00050000-5583-cf26-e069-385fdbfa57be	4209	Žabnica
00050000-5583-cf26-8429-b1d715d74010	3310	Žalec
00050000-5583-cf26-6052-e114e97884ed	4228	Železniki
00050000-5583-cf26-65ef-29299a7e0628	2287	Žetale
00050000-5583-cf26-a92a-8c1bcd950e66	4226	Žiri
00050000-5583-cf26-a997-bea64b7d9385	4274	Žirovnica
00050000-5583-cf26-235a-276cedae8a19	8360	Žužemberk
\.


--
-- TOC entry 2854 (class 0 OID 7825798)
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
-- TOC entry 2836 (class 0 OID 7825609)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 7825687)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 7825810)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 7825930)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 7825983)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5583-cf2a-4934-2082dff3a314	00080000-5583-cf2a-0077-6d55ec119343	0900	AK
00190000-5583-cf2a-2a23-1ce5c468715b	00080000-5583-cf29-d28f-5228d7083580	0987	A
00190000-5583-cf2a-419c-70e860800b99	00080000-5583-cf29-bf43-8e9d3991d225	0989	A
\.


--
-- TOC entry 2880 (class 0 OID 7826102)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 7826165)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 7826115)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 7826134)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 7825839)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5583-cf29-dcaa-e1afc1f552b0	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5583-cf29-d724-e0f6856b56f0	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5583-cf29-935d-9e55641b4960	0003	Kazinska	t	84	Kazinska dvorana
00220000-5583-cf29-1311-2761acb41a9c	0004	Mali oder	t	24	Mali oder 
00220000-5583-cf29-b075-5ff3dea53233	0005	Komorni oder	t	15	Komorni oder
00220000-5583-cf29-b53d-9559e50b4beb	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5583-cf29-cddb-311f45ba35f3	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2852 (class 0 OID 7825783)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 7825773)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 7825972)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 7825907)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 7825481)
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
-- TOC entry 2861 (class 0 OID 7825849)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2829 (class 0 OID 7825519)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5583-cf25-208d-f530e1170fc9	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5583-cf25-14dd-a31b89443dce	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5583-cf25-fa36-4e4315cf5e4f	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5583-cf25-a788-56fdb3d00a6e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5583-cf25-7d95-5fe9998e1c94	planer	Planer dogodkov v koledarju	t
00020000-5583-cf25-0a11-847e31e639fc	kadrovska	Kadrovska služba	t
00020000-5583-cf25-b7bc-784b684b0987	arhivar	Ažuriranje arhivalij	t
00020000-5583-cf25-9558-6e728fd71337	igralec	Igralec	t
00020000-5583-cf25-9043-f0e763ca4d2e	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5583-cf2a-52d6-5d7cf99d84e7	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2827 (class 0 OID 7825503)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5583-cf25-0ffe-c3fd6a0866e5	00020000-5583-cf25-fa36-4e4315cf5e4f
00010000-5583-cf25-f925-572eac5c0102	00020000-5583-cf25-fa36-4e4315cf5e4f
00010000-5583-cf2a-59a9-7ec6c1284fdb	00020000-5583-cf2a-52d6-5d7cf99d84e7
\.


--
-- TOC entry 2863 (class 0 OID 7825863)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 7825804)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 7825754)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 7826198)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5583-cf26-3ca6-a2753be60853	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5583-cf26-3167-59f0d07db9ac	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5583-cf26-3a39-0090ba84cda9	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5583-cf26-3d01-d95e360a0ac8	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5583-cf26-f32f-419207616fb5	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2886 (class 0 OID 7826190)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5583-cf26-d960-d812dff629c7	00230000-5583-cf26-3d01-d95e360a0ac8	popa
00240000-5583-cf26-91cb-600121f7cc0a	00230000-5583-cf26-3d01-d95e360a0ac8	oseba
00240000-5583-cf26-65df-572916a5933c	00230000-5583-cf26-3167-59f0d07db9ac	prostor
00240000-5583-cf26-c87d-b801df193e9a	00230000-5583-cf26-3d01-d95e360a0ac8	besedilo
00240000-5583-cf26-654a-c5f784baa6b8	00230000-5583-cf26-3d01-d95e360a0ac8	uprizoritev
00240000-5583-cf26-1fc3-8a7eae429a54	00230000-5583-cf26-3d01-d95e360a0ac8	funkcija
00240000-5583-cf26-d1c1-6d58dc5116ab	00230000-5583-cf26-3d01-d95e360a0ac8	tipfunkcije
00240000-5583-cf26-086c-21961306fe23	00230000-5583-cf26-3d01-d95e360a0ac8	alternacija
00240000-5583-cf26-77e1-1070bc59ce9e	00230000-5583-cf26-3ca6-a2753be60853	pogodba
00240000-5583-cf26-5762-23719f1bdf48	00230000-5583-cf26-3d01-d95e360a0ac8	zaposlitev
\.


--
-- TOC entry 2885 (class 0 OID 7826185)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 7825917)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
00270000-5583-cf2a-c40c-c0c6289a0e6f	000e0000-5583-cf2a-039c-8373be345f44	00080000-5583-cf29-ccd5-3233f6e2286e	Nabava kostumov	600.50	20.00	Krila in maske	1
00270000-5583-cf2a-99e6-f59ff380a66d	000e0000-5583-cf2a-039c-8373be345f44	00080000-5583-cf29-ccd5-3233f6e2286e	Zavese	125.70	3.10	Modra in zelena zavesa	2
\.


--
-- TOC entry 2834 (class 0 OID 7825581)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 7825760)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5583-cf2a-6e05-f4d120df5a4d	00180000-5583-cf2a-0621-d91509896e91	000c0000-5583-cf2a-0380-374ef3b286b6	00090000-5583-cf2a-069b-626d9951c672	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5583-cf2a-834d-59bffd187518	00180000-5583-cf2a-0621-d91509896e91	000c0000-5583-cf2a-9788-e1dea43151bc	00090000-5583-cf2a-e024-1fdabee85e96	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5583-cf2a-7fbd-de68f39b1937	00180000-5583-cf2a-0621-d91509896e91	000c0000-5583-cf2a-5870-60607aa4fa6b	00090000-5583-cf2a-0fe9-5787c193f375	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5583-cf2a-2684-e7cecc22afef	00180000-5583-cf2a-0621-d91509896e91	000c0000-5583-cf2a-13d6-dc231fecf1fd	00090000-5583-cf2a-ccfd-2aff1e7f8934	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5583-cf2a-a1d7-edfcd5f513ad	00180000-5583-cf2a-0621-d91509896e91	000c0000-5583-cf2a-a0ac-0c62eae63056	00090000-5583-cf2a-510e-f59733eafe33	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5583-cf2a-f71a-433535df4612	00180000-5583-cf2a-64bb-b96a3fd887fb	\N	00090000-5583-cf2a-510e-f59733eafe33	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2871 (class 0 OID 7825961)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5583-cf26-f4b0-5d8bc59ff10d	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5583-cf26-1a8a-e413515647dd	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5583-cf26-651f-86d201c228d2	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5583-cf26-5bf8-ddf635a4bc5c	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5583-cf26-ca13-dbef0677b71f	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5583-cf26-28e7-f7668349e0c5	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5583-cf26-da49-e0e410d1abb3	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5583-cf26-e7a8-aa01dd501a5f	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5583-cf26-94c0-1da685afd23f	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5583-cf26-424d-075a081d64b7	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5583-cf26-3c3d-a605454e4feb	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5583-cf26-97dc-c7f0e885d930	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5583-cf26-b3b4-dcc3c7b33fbf	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5583-cf26-93f1-1feed474156d	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5583-cf26-5342-82da9d1cc64e	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5583-cf26-7c0f-9e2f459e5a81	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2883 (class 0 OID 7826154)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5583-cf26-af8f-ebfc12a6b4c4	01	Velika predstava	f	1.00	1.00
002b0000-5583-cf26-b3cf-2eb93cb36c73	02	Mala predstava	f	0.50	0.50
002b0000-5583-cf26-62c6-7cb1959b547a	03	Mala koprodukcija	t	0.40	1.00
002b0000-5583-cf26-ce78-0446d6242911	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5583-cf26-3095-f6c66c839ebd	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2839 (class 0 OID 7825644)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2826 (class 0 OID 7825490)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5583-cf25-f925-572eac5c0102	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROwXjRLTxjvKxrNYVAuaBP1Q.7iCmHBdu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5583-cf2a-fda3-3593e28d24f5	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5583-cf2a-b952-b11d0177c59c	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5583-cf2a-dff4-378ce08cf5fe	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5583-cf2a-00c8-128682f605d8	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5583-cf2a-a09e-73075cb6d85c	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5583-cf2a-b638-dce5163ca02f	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5583-cf2a-e7b1-1d453aea034a	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5583-cf2a-b763-77f115b11cd2	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5583-cf2a-b8fa-e05ee92d47f0	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5583-cf2a-59a9-7ec6c1284fdb	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5583-cf25-0ffe-c3fd6a0866e5	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2876 (class 0 OID 7826018)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5583-cf2a-039c-8373be345f44	00160000-5583-cf29-5d1d-e93bff93e22d	00150000-5583-cf26-187b-caac1d62ae94	00140000-5583-cf24-4a69-8f150dea3164	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5583-cf29-b075-5ff3dea53233
000e0000-5583-cf2a-986f-a27ab0d311d9	00160000-5583-cf29-45ab-37235d3be88a	00150000-5583-cf26-ecc0-99092ed278d3	00140000-5583-cf24-5a3e-02c9899e5613	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5583-cf29-b53d-9559e50b4beb
000e0000-5583-cf2a-1f60-f38d7163529e	\N	00150000-5583-cf26-ecc0-99092ed278d3	00140000-5583-cf24-5a3e-02c9899e5613	00190000-5583-cf2a-2a23-1ce5c468715b	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5583-cf29-b075-5ff3dea53233
000e0000-5583-cf2a-65f0-2262beeae046	\N	00150000-5583-cf26-ecc0-99092ed278d3	00140000-5583-cf24-5a3e-02c9899e5613	00190000-5583-cf2a-2a23-1ce5c468715b	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5583-cf29-b075-5ff3dea53233
\.


--
-- TOC entry 2844 (class 0 OID 7825706)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5583-cf2a-5732-7362cbd6b2fb	000e0000-5583-cf2a-986f-a27ab0d311d9	1	
00200000-5583-cf2a-c5a1-fe7fee45c108	000e0000-5583-cf2a-986f-a27ab0d311d9	2	
\.


--
-- TOC entry 2859 (class 0 OID 7825831)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 7825900)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 7825738)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2875 (class 0 OID 7826008)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5583-cf24-4a69-8f150dea3164	01	Drama	drama (SURS 01)
00140000-5583-cf24-67cc-9b7625e86d82	02	Opera	opera (SURS 02)
00140000-5583-cf24-7bbc-da0b44c27f72	03	Balet	balet (SURS 03)
00140000-5583-cf24-2d06-88fd10791362	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5583-cf24-c480-391e38497104	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5583-cf24-5a3e-02c9899e5613	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5583-cf24-af38-79a5777a488f	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2865 (class 0 OID 7825890)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5583-cf26-3e78-84026c8fc4c6	01	Opera	opera
00150000-5583-cf26-5ac7-7847fa847747	02	Opereta	opereta
00150000-5583-cf26-e4d2-062853a5d1e2	03	Balet	balet
00150000-5583-cf26-276c-b689e169a5c2	04	Plesne prireditve	plesne prireditve
00150000-5583-cf26-9d2f-b9a0274864ad	05	Lutkovno gledališče	lutkovno gledališče
00150000-5583-cf26-cb7f-c8b34437add2	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5583-cf26-9184-086677b708e4	07	Biografska drama	biografska drama
00150000-5583-cf26-187b-caac1d62ae94	08	Komedija	komedija
00150000-5583-cf26-61ee-047427bad341	09	Črna komedija	črna komedija
00150000-5583-cf26-22bc-b5edd30b3db8	10	E-igra	E-igra
00150000-5583-cf26-ecc0-99092ed278d3	11	Kriminalka	kriminalka
00150000-5583-cf26-b61e-5c53e6bd9130	12	Musical	musical
\.


--
-- TOC entry 2407 (class 2606 OID 7825544)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 7826065)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 7826055)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 7825960)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 7825728)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 7825753)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 7825670)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 7826098)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 7825886)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 7825704)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 7825747)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 7825684)
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
-- TOC entry 2499 (class 2606 OID 7825796)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 7825823)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 7825642)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 7825553)
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
-- TOC entry 2414 (class 2606 OID 7825577)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 7825533)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2398 (class 2606 OID 7825518)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 7825829)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 7825862)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 7826003)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 7825606)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 7825630)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 7825802)
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
-- TOC entry 2429 (class 2606 OID 7825620)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 7825691)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 7825814)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 7825942)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 7825988)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 7826113)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 7826183)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 7826130)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 7826151)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 7825846)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 7825787)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 7825778)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 7825982)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 7825914)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 7825489)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 7825853)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 7825507)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2400 (class 2606 OID 7825527)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 7825871)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 7825809)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 7825759)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 7826207)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 7826195)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 7826189)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 7825927)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 7825586)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 7825769)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 7825971)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 7826164)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 7825655)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 7825502)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 7826034)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 7825713)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 7825837)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 7825905)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 7825742)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 7826016)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 7825898)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 1259 OID 7825735)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2547 (class 1259 OID 7825928)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2548 (class 1259 OID 7825929)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2421 (class 1259 OID 7825608)
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
-- TOC entry 2512 (class 1259 OID 7825830)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2506 (class 1259 OID 7825816)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2507 (class 1259 OID 7825815)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2458 (class 1259 OID 7825714)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2534 (class 1259 OID 7825887)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2535 (class 1259 OID 7825889)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2536 (class 1259 OID 7825888)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2446 (class 1259 OID 7825686)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 7825685)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2565 (class 1259 OID 7826005)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2566 (class 1259 OID 7826006)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2567 (class 1259 OID 7826007)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2607 (class 1259 OID 7826153)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2608 (class 1259 OID 7826152)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2574 (class 1259 OID 7826039)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2575 (class 1259 OID 7826036)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2576 (class 1259 OID 7826040)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2577 (class 1259 OID 7826038)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2578 (class 1259 OID 7826037)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2436 (class 1259 OID 7825657)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2437 (class 1259 OID 7825656)
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
-- TOC entry 2412 (class 1259 OID 7825580)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2522 (class 1259 OID 7825854)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2476 (class 1259 OID 7825748)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 7825534)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2403 (class 1259 OID 7825535)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2527 (class 1259 OID 7825874)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2528 (class 1259 OID 7825873)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2529 (class 1259 OID 7825872)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2450 (class 1259 OID 7825692)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2451 (class 1259 OID 7825694)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2452 (class 1259 OID 7825693)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2618 (class 1259 OID 7826197)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2486 (class 1259 OID 7825782)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2487 (class 1259 OID 7825780)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2488 (class 1259 OID 7825779)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2489 (class 1259 OID 7825781)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2393 (class 1259 OID 7825508)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2394 (class 1259 OID 7825509)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2515 (class 1259 OID 7825838)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2501 (class 1259 OID 7825803)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2543 (class 1259 OID 7825915)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2544 (class 1259 OID 7825916)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2596 (class 1259 OID 7826099)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2597 (class 1259 OID 7826100)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2598 (class 1259 OID 7826101)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2425 (class 1259 OID 7825622)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2426 (class 1259 OID 7825621)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2427 (class 1259 OID 7825623)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2613 (class 1259 OID 7826184)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2551 (class 1259 OID 7825943)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2552 (class 1259 OID 7825944)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2588 (class 1259 OID 7826069)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2589 (class 1259 OID 7826071)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2590 (class 1259 OID 7826067)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2591 (class 1259 OID 7826070)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2592 (class 1259 OID 7826068)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2540 (class 1259 OID 7825906)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2492 (class 1259 OID 7825791)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2493 (class 1259 OID 7825790)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2494 (class 1259 OID 7825788)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2495 (class 1259 OID 7825789)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2376 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2584 (class 1259 OID 7826057)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2585 (class 1259 OID 7826056)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2599 (class 1259 OID 7826114)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2457 (class 1259 OID 7825705)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2408 (class 1259 OID 7825555)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2409 (class 1259 OID 7825554)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2417 (class 1259 OID 7825587)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2418 (class 1259 OID 7825588)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2481 (class 1259 OID 7825772)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2482 (class 1259 OID 7825771)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2483 (class 1259 OID 7825770)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2602 (class 1259 OID 7826133)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2603 (class 1259 OID 7826131)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2604 (class 1259 OID 7826132)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2464 (class 1259 OID 7825737)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2465 (class 1259 OID 7825733)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2466 (class 1259 OID 7825730)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2467 (class 1259 OID 7825731)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2468 (class 1259 OID 7825729)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2469 (class 1259 OID 7825734)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2470 (class 1259 OID 7825732)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2424 (class 1259 OID 7825607)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2442 (class 1259 OID 7825671)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2443 (class 1259 OID 7825673)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2444 (class 1259 OID 7825672)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2445 (class 1259 OID 7825674)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2500 (class 1259 OID 7825797)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2570 (class 1259 OID 7826004)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2579 (class 1259 OID 7826035)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2415 (class 1259 OID 7825578)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2416 (class 1259 OID 7825579)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2537 (class 1259 OID 7825899)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 7826208)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2435 (class 1259 OID 7825643)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2621 (class 1259 OID 7826196)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2520 (class 1259 OID 7825848)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2521 (class 1259 OID 7825847)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 7826066)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2379 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2432 (class 1259 OID 7825631)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2571 (class 1259 OID 7826017)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 7825989)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 7825990)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2401 (class 1259 OID 7825528)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2471 (class 1259 OID 7825736)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2652 (class 2606 OID 7826344)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2649 (class 2606 OID 7826329)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2650 (class 2606 OID 7826334)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2654 (class 2606 OID 7826354)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2648 (class 2606 OID 7826324)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2653 (class 2606 OID 7826349)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2651 (class 2606 OID 7826339)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2683 (class 2606 OID 7826499)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2684 (class 2606 OID 7826504)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2635 (class 2606 OID 7826259)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2671 (class 2606 OID 7826439)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2670 (class 2606 OID 7826434)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2669 (class 2606 OID 7826429)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2647 (class 2606 OID 7826319)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2677 (class 2606 OID 7826469)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2679 (class 2606 OID 7826479)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2678 (class 2606 OID 7826474)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2642 (class 2606 OID 7826294)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2641 (class 2606 OID 7826289)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2667 (class 2606 OID 7826419)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2688 (class 2606 OID 7826524)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2689 (class 2606 OID 7826529)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2690 (class 2606 OID 7826534)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2711 (class 2606 OID 7826639)
-- Name: fk_308cd2524ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd2524ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2710 (class 2606 OID 7826634)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2694 (class 2606 OID 7826554)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2691 (class 2606 OID 7826539)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2695 (class 2606 OID 7826559)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2693 (class 2606 OID 7826549)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2692 (class 2606 OID 7826544)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2640 (class 2606 OID 7826284)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2639 (class 2606 OID 7826279)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2632 (class 2606 OID 7826244)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2631 (class 2606 OID 7826239)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2673 (class 2606 OID 7826449)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2655 (class 2606 OID 7826359)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2627 (class 2606 OID 7826219)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2628 (class 2606 OID 7826224)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2676 (class 2606 OID 7826464)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2675 (class 2606 OID 7826459)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2674 (class 2606 OID 7826454)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2643 (class 2606 OID 7826299)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2645 (class 2606 OID 7826309)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2644 (class 2606 OID 7826304)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2713 (class 2606 OID 7826649)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2662 (class 2606 OID 7826394)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2660 (class 2606 OID 7826384)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2659 (class 2606 OID 7826379)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2661 (class 2606 OID 7826389)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2625 (class 2606 OID 7826209)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2626 (class 2606 OID 7826214)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2672 (class 2606 OID 7826444)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2668 (class 2606 OID 7826424)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2681 (class 2606 OID 7826489)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2682 (class 2606 OID 7826494)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2703 (class 2606 OID 7826599)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 7826604)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2705 (class 2606 OID 7826609)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2637 (class 2606 OID 7826269)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2636 (class 2606 OID 7826264)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2638 (class 2606 OID 7826274)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2712 (class 2606 OID 7826644)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2685 (class 2606 OID 7826509)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2686 (class 2606 OID 7826514)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2700 (class 2606 OID 7826584)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2702 (class 2606 OID 7826594)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2698 (class 2606 OID 7826574)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2701 (class 2606 OID 7826589)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2699 (class 2606 OID 7826579)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2680 (class 2606 OID 7826484)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2666 (class 2606 OID 7826414)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2665 (class 2606 OID 7826409)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2663 (class 2606 OID 7826399)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2664 (class 2606 OID 7826404)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2697 (class 2606 OID 7826569)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2696 (class 2606 OID 7826564)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2706 (class 2606 OID 7826614)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2646 (class 2606 OID 7826314)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2687 (class 2606 OID 7826519)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2630 (class 2606 OID 7826234)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2629 (class 2606 OID 7826229)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2633 (class 2606 OID 7826249)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2634 (class 2606 OID 7826254)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2658 (class 2606 OID 7826374)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2657 (class 2606 OID 7826369)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2656 (class 2606 OID 7826364)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2709 (class 2606 OID 7826629)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2707 (class 2606 OID 7826619)
-- Name: fk_ffeaf2ff62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 7826624)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-19 10:13:33 CEST

--
-- PostgreSQL database dump complete
--

