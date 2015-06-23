--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-23 08:41:45 CEST

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
-- TOC entry 183 (class 1259 OID 7981537)
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
-- TOC entry 230 (class 1259 OID 7982059)
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
-- TOC entry 229 (class 1259 OID 7982042)
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
-- TOC entry 222 (class 1259 OID 7981946)
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
-- TOC entry 197 (class 1259 OID 7981716)
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
-- TOC entry 200 (class 1259 OID 7981750)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 192 (class 1259 OID 7981659)
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
-- TOC entry 231 (class 1259 OID 7982073)
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
-- TOC entry 216 (class 1259 OID 7981876)
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
-- TOC entry 195 (class 1259 OID 7981696)
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
-- TOC entry 199 (class 1259 OID 7981744)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 7981676)
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
-- TOC entry 205 (class 1259 OID 7981793)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 7981818)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 7981633)
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
-- TOC entry 184 (class 1259 OID 7981546)
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
-- TOC entry 185 (class 1259 OID 7981557)
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
-- TOC entry 180 (class 1259 OID 7981511)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 7981530)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 7981825)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 7981856)
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
-- TOC entry 226 (class 1259 OID 7981992)
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
-- TOC entry 187 (class 1259 OID 7981590)
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
-- TOC entry 189 (class 1259 OID 7981625)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 7981799)
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
-- TOC entry 188 (class 1259 OID 7981610)
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
-- TOC entry 194 (class 1259 OID 7981688)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 7981811)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 7981931)
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
-- TOC entry 225 (class 1259 OID 7981984)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 7982120)
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
-- TOC entry 212 (class 1259 OID 7981840)
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
-- TOC entry 204 (class 1259 OID 7981784)
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
-- TOC entry 203 (class 1259 OID 7981774)
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
-- TOC entry 224 (class 1259 OID 7981973)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 7981908)
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
-- TOC entry 177 (class 1259 OID 7981482)
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
-- TOC entry 176 (class 1259 OID 7981480)
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
-- TOC entry 213 (class 1259 OID 7981850)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 7981520)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 7981504)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 7981864)
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
-- TOC entry 207 (class 1259 OID 7981805)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 7981755)
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
-- TOC entry 236 (class 1259 OID 7982157)
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
-- TOC entry 235 (class 1259 OID 7982149)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 7982144)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 7981918)
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
-- TOC entry 186 (class 1259 OID 7981582)
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
-- TOC entry 202 (class 1259 OID 7981761)
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
-- TOC entry 223 (class 1259 OID 7981962)
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
-- TOC entry 233 (class 1259 OID 7982133)
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
-- TOC entry 191 (class 1259 OID 7981645)
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
-- TOC entry 178 (class 1259 OID 7981491)
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
-- TOC entry 228 (class 1259 OID 7982019)
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
-- TOC entry 196 (class 1259 OID 7981707)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 7981832)
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
-- TOC entry 218 (class 1259 OID 7981901)
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
-- TOC entry 198 (class 1259 OID 7981739)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 7982009)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 7981891)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2204 (class 2604 OID 7981485)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2846 (class 0 OID 7981537)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 7982059)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5588-ffa9-29af-eff752060cff	000d0000-5588-ffa9-daf5-852bdae56298	\N	00090000-5588-ffa8-1b09-0a8864eac1a4	\N	000b0000-5588-ffa9-9378-24aafd65f8f9	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5588-ffa9-898a-0a31842ba559	000d0000-5588-ffa9-0811-c2a84f90ecbd	\N	00090000-5588-ffa8-6c34-69c38888520f	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5588-ffa9-1c76-5f8fff255d63	000d0000-5588-ffa9-e8a8-435ecb61467d	\N	00090000-5588-ffa8-64b8-a9ce73d6e3a7	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5588-ffa9-e7d9-90d383eb31f8	000d0000-5588-ffa9-513b-2b3c5c0b0c8e	\N	00090000-5588-ffa8-b7fb-dbb0ac6fa315	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5588-ffa9-94a9-20e08ddd0394	000d0000-5588-ffa9-15e6-2618af232508	\N	00090000-5588-ffa8-daed-8772cebada11	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5588-ffa9-718d-ba54eb57b4f2	000d0000-5588-ffa9-fbde-cc42929c544c	\N	00090000-5588-ffa8-6c34-69c38888520f	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2892 (class 0 OID 7982042)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 7981946)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5588-ffa8-b3af-47a9778f6be8	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5588-ffa8-9f51-d873ae4bbd4f	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5588-ffa8-bf95-0f3a9bcb6f8e	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2860 (class 0 OID 7981716)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5588-ffa9-2308-bd5b7794d97e	\N	\N	00200000-5588-ffa9-3980-3b55ee9c047d	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5588-ffa9-ab90-9a7903023839	\N	\N	00200000-5588-ffa9-4965-404a846f1152	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5588-ffa9-28f5-16b526f53093	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5588-ffa9-1d59-20d2c9232b16	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5588-ffa9-e453-5b6b122f5892	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2863 (class 0 OID 7981750)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 7981659)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5588-ffa6-8084-6a21304f0d50	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5588-ffa6-d37c-9f45cd8957c7	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5588-ffa6-0aa2-63637c153ccf	AL	ALB	008	Albania 	Albanija	\N
00040000-5588-ffa6-5712-1640c8a991be	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5588-ffa6-f533-3061af6779e9	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5588-ffa6-46fd-6ca86c0dafc8	AD	AND	020	Andorra 	Andora	\N
00040000-5588-ffa6-8191-3c42afd9de92	AO	AGO	024	Angola 	Angola	\N
00040000-5588-ffa6-b08f-4f7c0366e847	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5588-ffa6-5bdb-84a9f2963b8c	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5588-ffa6-eebe-b2571877df59	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5588-ffa6-4289-2330a64f9043	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5588-ffa6-dc10-2bc7c4589dc0	AM	ARM	051	Armenia 	Armenija	\N
00040000-5588-ffa6-24a4-30f21900da85	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5588-ffa6-7ad0-16b615815377	AU	AUS	036	Australia 	Avstralija	\N
00040000-5588-ffa6-e4d7-e785fbbdd3d3	AT	AUT	040	Austria 	Avstrija	\N
00040000-5588-ffa6-db84-0967de6cb9d8	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5588-ffa6-b103-6df2950ab730	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5588-ffa6-aa45-150957aa83ba	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5588-ffa6-df98-e92becb9b3a2	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5588-ffa6-2e81-495e82c5e273	BB	BRB	052	Barbados 	Barbados	\N
00040000-5588-ffa6-a538-39b4eb016e68	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5588-ffa6-1b04-4c4c629fc984	BE	BEL	056	Belgium 	Belgija	\N
00040000-5588-ffa6-3d78-d1c95332837b	BZ	BLZ	084	Belize 	Belize	\N
00040000-5588-ffa6-d44c-fe2b0c55ad48	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5588-ffa6-27b6-dfd3190b25e5	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5588-ffa6-c83a-ce37f76506f6	BT	BTN	064	Bhutan 	Butan	\N
00040000-5588-ffa6-034d-8c702bb11998	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5588-ffa6-1cbc-990991954e41	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5588-ffa6-32ab-376f89432ec3	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5588-ffa6-230f-7f094f2daeed	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5588-ffa6-bf30-e0ebef521571	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5588-ffa6-c568-0cacf560b539	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5588-ffa6-9ae2-8af144fcad71	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5588-ffa6-2296-562dadd6788c	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5588-ffa6-9b70-512bbbcab455	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5588-ffa6-434d-59df61b63657	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5588-ffa6-6355-70e551330ad4	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5588-ffa6-ce3f-468e0ee4a689	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5588-ffa6-7cbc-2fbd39a9cd94	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5588-ffa6-6065-926bdc31ec60	CA	CAN	124	Canada 	Kanada	\N
00040000-5588-ffa6-a8f9-37f808f198c7	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5588-ffa6-c224-5c9c41c216ef	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5588-ffa6-c9c4-ee236e32ce22	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5588-ffa6-98a5-5404066adc74	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5588-ffa6-10f6-28541dee81ab	CL	CHL	152	Chile 	Čile	\N
00040000-5588-ffa6-2db4-ee62a929be8e	CN	CHN	156	China 	Kitajska	\N
00040000-5588-ffa6-642b-519b49b16157	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5588-ffa6-c6d8-cf87a9a31a24	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5588-ffa6-11da-7b296c5d18f3	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5588-ffa6-2d1f-ff7a27fe09c7	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5588-ffa6-d676-bac76d94f13c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5588-ffa6-0fea-adb632cea8a5	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5588-ffa6-e359-dcac6939ac95	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5588-ffa6-3ec3-636b6d71af77	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5588-ffa6-48c4-3ec6ee8cc7e2	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5588-ffa6-d7f7-e73c982f97cd	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5588-ffa6-2596-557e7398b8f4	CU	CUB	192	Cuba 	Kuba	\N
00040000-5588-ffa6-168f-a8330f5dc9c2	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5588-ffa6-bece-ce4500ea8824	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5588-ffa6-102a-31a4065e1d33	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5588-ffa6-db58-eab418d3a140	DK	DNK	208	Denmark 	Danska	\N
00040000-5588-ffa6-a1ab-3dfdf5108075	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5588-ffa6-44bf-77740e128abe	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5588-ffa6-508d-3d3390f1e6d1	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5588-ffa6-f54f-c3e4c64acbc4	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5588-ffa6-0530-83309139aa07	EG	EGY	818	Egypt 	Egipt	\N
00040000-5588-ffa6-938d-649bd464dd66	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5588-ffa6-6758-abcdc380b16c	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5588-ffa6-c730-b79239b37f24	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5588-ffa6-7ce6-fee6dea758d0	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5588-ffa6-0c07-78d63c4628bb	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5588-ffa6-f96c-3a939d807867	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5588-ffa6-6284-018aa01287c7	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5588-ffa6-820e-8a1b1a84da69	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5588-ffa6-2704-ad79031d6c9e	FI	FIN	246	Finland 	Finska	\N
00040000-5588-ffa6-7d4c-bbe86770c09c	FR	FRA	250	France 	Francija	\N
00040000-5588-ffa6-46d2-43c56dfe6081	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5588-ffa6-30bf-0afdd31f7374	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5588-ffa6-a456-b2c289886d86	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5588-ffa6-cda9-bf7ffa361a7a	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5588-ffa6-e09f-65a9e99fdd49	GA	GAB	266	Gabon 	Gabon	\N
00040000-5588-ffa6-4a61-9a58431e7dfa	GM	GMB	270	Gambia 	Gambija	\N
00040000-5588-ffa6-f3b4-688c922bff68	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5588-ffa6-c45f-cbcb58e42d36	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5588-ffa6-3af5-1ac8945f7979	GH	GHA	288	Ghana 	Gana	\N
00040000-5588-ffa6-434c-fd33bd0a5b34	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5588-ffa6-f386-415a525bb44b	GR	GRC	300	Greece 	Grčija	\N
00040000-5588-ffa6-ee5a-ebd77f96d6d1	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5588-ffa6-b677-d29478e1b482	GD	GRD	308	Grenada 	Grenada	\N
00040000-5588-ffa6-b006-4035f48437b4	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5588-ffa6-5106-2c558bbfef45	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5588-ffa6-c5f1-9225fdfc1125	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5588-ffa6-78ac-3bf8c0a0ea93	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5588-ffa6-cbea-8396cb2fa02d	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5588-ffa6-4956-f3db6cd4d522	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5588-ffa6-dff7-a5ce7254247f	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5588-ffa6-aee6-d8ee4afec2c3	HT	HTI	332	Haiti 	Haiti	\N
00040000-5588-ffa6-a7b7-779ce35a95cd	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5588-ffa6-683d-56d78739c962	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5588-ffa6-dec7-6927144c4886	HN	HND	340	Honduras 	Honduras	\N
00040000-5588-ffa6-8afa-d5f2c29a1b7d	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5588-ffa6-0f29-e6ab6940c729	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5588-ffa6-4334-0c83ae6898e4	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5588-ffa6-0a5c-9d26fdc2b8bc	IN	IND	356	India 	Indija	\N
00040000-5588-ffa6-f1f6-85ad891ab8d2	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5588-ffa6-c6bc-24a065c2fbd4	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5588-ffa6-3fb6-4879210f1b40	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5588-ffa6-aef4-8eb808717d2b	IE	IRL	372	Ireland 	Irska	\N
00040000-5588-ffa6-c59d-1bfd040fa132	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5588-ffa6-c26b-19b1365542fe	IL	ISR	376	Israel 	Izrael	\N
00040000-5588-ffa6-abb1-a0417750c0da	IT	ITA	380	Italy 	Italija	\N
00040000-5588-ffa6-31f2-b57273f7305a	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5588-ffa6-80f7-defd3cae1f44	JP	JPN	392	Japan 	Japonska	\N
00040000-5588-ffa6-e7e2-7e875a19a730	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5588-ffa6-70c1-705782efb8f4	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5588-ffa6-05f0-0d142250efd2	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5588-ffa6-b766-7534237a9b63	KE	KEN	404	Kenya 	Kenija	\N
00040000-5588-ffa6-55d2-090d048f82f0	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5588-ffa6-9fe4-f11698851948	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5588-ffa6-dfe7-10d7d6682bde	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5588-ffa6-a7ad-18ba5f70d2aa	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5588-ffa6-4cde-8b296ecb6304	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5588-ffa6-4c5e-19a70e5e8ca5	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5588-ffa6-6502-9abed8940644	LV	LVA	428	Latvia 	Latvija	\N
00040000-5588-ffa6-e2fe-9c6e6d8907f9	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5588-ffa6-a6d0-18ce4a5feab1	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5588-ffa6-c369-f5ca30cd3bff	LR	LBR	430	Liberia 	Liberija	\N
00040000-5588-ffa6-c63e-305cca15cd34	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5588-ffa6-77ca-aed94c2165a8	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5588-ffa6-d415-8b3e212f17a7	LT	LTU	440	Lithuania 	Litva	\N
00040000-5588-ffa6-9a63-613bf1aea9ce	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5588-ffa6-8a04-cdb5c1a873b8	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5588-ffa6-f234-4933dca22559	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5588-ffa6-666d-dceb61dcb18f	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5588-ffa6-0a46-768651a67824	MW	MWI	454	Malawi 	Malavi	\N
00040000-5588-ffa6-b98f-d10561277d1e	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5588-ffa6-e020-0ce35038db17	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5588-ffa6-3b70-4d09abfae17e	ML	MLI	466	Mali 	Mali	\N
00040000-5588-ffa6-c238-d667d28014f4	MT	MLT	470	Malta 	Malta	\N
00040000-5588-ffa6-7cd0-d84d7da79cd8	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5588-ffa6-381a-1386fc00b07f	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5588-ffa6-6e07-c66cd7e79b76	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5588-ffa6-8139-8dccd2c058f4	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5588-ffa6-a312-223c40f70611	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5588-ffa6-3d7d-254fd308a2fd	MX	MEX	484	Mexico 	Mehika	\N
00040000-5588-ffa6-2ccc-b8d7a8ce9719	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5588-ffa6-dda6-de1fe5433c86	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5588-ffa6-0364-14e9513e8419	MC	MCO	492	Monaco 	Monako	\N
00040000-5588-ffa6-64bb-d1ff41c130d1	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5588-ffa6-dba7-dc45bf4a8577	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5588-ffa6-326a-87bfc76e854b	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5588-ffa6-bd06-fa2fe888e08a	MA	MAR	504	Morocco 	Maroko	\N
00040000-5588-ffa6-ec5d-4fb67af20f75	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5588-ffa6-672f-d4582f102e0a	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5588-ffa6-63c5-589c1d7cdd8e	NA	NAM	516	Namibia 	Namibija	\N
00040000-5588-ffa6-2ff6-eb82f1a8f68b	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5588-ffa6-7713-458e5c3ec1b1	NP	NPL	524	Nepal 	Nepal	\N
00040000-5588-ffa6-cb9d-70a40dee4f9b	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5588-ffa6-7e00-f14b5d46a827	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5588-ffa6-a284-da0bd70a9567	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5588-ffa6-2f47-261671f43df3	NE	NER	562	Niger 	Niger 	\N
00040000-5588-ffa6-9fb3-3ac0368560b9	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5588-ffa6-6d75-b0d6b793ad10	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5588-ffa6-b4cf-9daf7e5dc180	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5588-ffa6-a49d-b82951e0e988	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5588-ffa6-e07b-a121f21c263c	NO	NOR	578	Norway 	Norveška	\N
00040000-5588-ffa6-9121-a01ea87dd2c2	OM	OMN	512	Oman 	Oman	\N
00040000-5588-ffa6-0b3e-59a0798ba963	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5588-ffa6-4ed0-3b1a5bd57549	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5588-ffa6-9975-824e09efd887	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5588-ffa6-eed6-05f0ef81eea8	PA	PAN	591	Panama 	Panama	\N
00040000-5588-ffa6-ef90-ab7a8581d617	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5588-ffa6-7e46-f063b3c61896	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5588-ffa6-10b0-0e76a5111bab	PE	PER	604	Peru 	Peru	\N
00040000-5588-ffa6-be54-f346ace272b6	PH	PHL	608	Philippines 	Filipini	\N
00040000-5588-ffa6-7a6f-2718717b443c	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5588-ffa6-4693-5206561c4198	PL	POL	616	Poland 	Poljska	\N
00040000-5588-ffa6-3dd4-9af78fccb1ac	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5588-ffa6-db6f-6abdc98eee93	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5588-ffa6-4247-143581cb6dd0	QA	QAT	634	Qatar 	Katar	\N
00040000-5588-ffa6-0e06-ee8054492539	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5588-ffa6-a36a-2045f17f4ed3	RO	ROU	642	Romania 	Romunija	\N
00040000-5588-ffa6-f0b0-a6d103f9772b	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5588-ffa6-7a35-6ba17279ce79	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5588-ffa6-76c2-b4842120e017	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5588-ffa6-8ab9-e578864d4af6	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5588-ffa6-93ae-be6894e4b6ad	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5588-ffa6-dc04-163c0d80b9c0	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5588-ffa6-e5b7-28cbf064f2c5	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5588-ffa6-3cd8-f650b56e333b	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5588-ffa6-df80-8b0229d81262	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5588-ffa6-df41-7e12a92f76a5	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5588-ffa6-fcee-3efa5c25369e	SM	SMR	674	San Marino 	San Marino	\N
00040000-5588-ffa6-0b08-aee2d2f2c03d	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5588-ffa6-0be9-d9947f5b57dd	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5588-ffa6-c736-eb4faafaa93e	SN	SEN	686	Senegal 	Senegal	\N
00040000-5588-ffa6-902f-a68f562e0074	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5588-ffa6-7cdf-13de932a2ff6	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5588-ffa6-b0fc-14d2aba66579	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5588-ffa6-0588-18a0254e7494	SG	SGP	702	Singapore 	Singapur	\N
00040000-5588-ffa6-fc85-29ada892702e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5588-ffa6-db9d-ae276db9bdfa	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5588-ffa6-e80a-f12955c7091b	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5588-ffa6-9d45-584887e10dd6	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5588-ffa6-77ff-281ed44211c9	SO	SOM	706	Somalia 	Somalija	\N
00040000-5588-ffa6-dd38-ec5a60eb0fa9	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5588-ffa6-f370-00a59a29338f	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5588-ffa6-633d-bed19a686101	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5588-ffa6-c117-3ea2dea4b3e9	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5588-ffa6-e6b2-e268f4446328	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5588-ffa6-9561-e66d903639f7	SD	SDN	729	Sudan 	Sudan	\N
00040000-5588-ffa6-037e-dc7e29f07707	SR	SUR	740	Suriname 	Surinam	\N
00040000-5588-ffa6-0fa8-13709fae5f5b	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5588-ffa6-e544-31fb05f33036	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5588-ffa6-1fd0-a75cd35290d0	SE	SWE	752	Sweden 	Švedska	\N
00040000-5588-ffa6-3445-c0c974cbdd92	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5588-ffa6-3314-99354136b19e	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5588-ffa6-4591-003622949daa	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5588-ffa6-a773-b2074b165807	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5588-ffa6-7584-fd45e9a03d22	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5588-ffa6-dc6e-eb977679b718	TH	THA	764	Thailand 	Tajska	\N
00040000-5588-ffa6-3c0d-05fa874b8986	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5588-ffa6-bfd7-20eb264fc656	TG	TGO	768	Togo 	Togo	\N
00040000-5588-ffa6-6dab-aa2a42e6cec6	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5588-ffa6-f612-6f744151ed25	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5588-ffa6-bc2f-d51a472b4ca2	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5588-ffa6-958a-18812ce2d32f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5588-ffa6-21ae-4afaf4b2c030	TR	TUR	792	Turkey 	Turčija	\N
00040000-5588-ffa6-b764-aaf941d7f90d	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5588-ffa6-c18e-c41b22c732f2	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5588-ffa6-3ddc-7507db955f05	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5588-ffa6-e045-59fdf216e79d	UG	UGA	800	Uganda 	Uganda	\N
00040000-5588-ffa6-bdff-db667e7855cb	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5588-ffa6-5076-be86d39695c5	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5588-ffa6-59a9-41b2f7c5da5e	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5588-ffa6-8ff4-3494238080d9	US	USA	840	United States 	Združene države Amerike	\N
00040000-5588-ffa6-7d63-7076778f92b6	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5588-ffa6-c858-7770fa1f63d9	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5588-ffa6-02fb-873f758c3a15	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5588-ffa6-5441-674f63a1e328	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5588-ffa6-0ff3-b0c99a8f0849	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5588-ffa6-f533-b5d4bd585bae	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5588-ffa6-95b8-b34b902e4e95	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5588-ffa6-b91f-4462fea49a31	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5588-ffa6-aaae-29b82bcadc9c	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5588-ffa6-b104-149e38c64188	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5588-ffa6-9aa9-0149f6eaf615	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5588-ffa6-7547-170a9ff28308	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5588-ffa6-1e14-0d75ddee7af3	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2894 (class 0 OID 7982073)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, opredelitevdrugiviri, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 7981876)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5588-ffa9-f865-9e8410edaf44	000e0000-5588-ffa9-e3d3-df052744cbb9	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5588-ffa7-5160-7f37760d5e15
000d0000-5588-ffa9-daf5-852bdae56298	000e0000-5588-ffa9-e3d3-df052744cbb9	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5588-ffa7-5160-7f37760d5e15
000d0000-5588-ffa9-0811-c2a84f90ecbd	000e0000-5588-ffa9-e3d3-df052744cbb9	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5588-ffa7-21b8-2e3b830be6a4
000d0000-5588-ffa9-e8a8-435ecb61467d	000e0000-5588-ffa9-e3d3-df052744cbb9	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5588-ffa7-412a-c184831a814a
000d0000-5588-ffa9-513b-2b3c5c0b0c8e	000e0000-5588-ffa9-e3d3-df052744cbb9	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5588-ffa7-412a-c184831a814a
000d0000-5588-ffa9-15e6-2618af232508	000e0000-5588-ffa9-e3d3-df052744cbb9	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5588-ffa7-412a-c184831a814a
000d0000-5588-ffa9-fbde-cc42929c544c	000e0000-5588-ffa9-e3d3-df052744cbb9	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5588-ffa7-5160-7f37760d5e15
\.


--
-- TOC entry 2858 (class 0 OID 7981696)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 7981744)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 7981676)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5588-ffa9-b0fd-b7de751169aa	00080000-5588-ffa8-6eaf-f848786e916f	00090000-5588-ffa8-1b09-0a8864eac1a4	AK		
\.


--
-- TOC entry 2833 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 7981793)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 7981818)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 7981633)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5588-ffa7-34aa-871882ba9cb7	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5588-ffa7-5a9f-c0a185990ec1	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5588-ffa7-bd54-2ad6152749ee	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5588-ffa7-c9c4-165063f43d28	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5588-ffa7-2cdd-4249e88aab8d	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5588-ffa7-db09-11acb5c6f98d	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5588-ffa7-c88c-f4742a78783f	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5588-ffa7-f64e-742be71a3312	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5588-ffa7-fa6a-944d8fa4b394	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5588-ffa7-a894-6ba194a74c05	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5588-ffa7-e294-00c11b5cc9d0	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5588-ffa7-55a4-b3fc14f5e903	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5588-ffa7-575b-1747c14a1aa8	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5588-ffa8-2688-7d976f0a5af9	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5588-ffa8-fe12-a75079d0c144	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5588-ffa8-136a-a66bff0b5787	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5588-ffa8-f07c-cc7a37edde96	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5588-ffa8-b972-58a4705d6de4	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5588-ffa8-001b-964a21949cae	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2847 (class 0 OID 7981546)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5588-ffa8-f3b3-e73f48454fe6	00000000-5588-ffa8-fe12-a75079d0c144	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5588-ffa8-2012-625497ce946a	00000000-5588-ffa8-fe12-a75079d0c144	00010000-5588-ffa7-e3ca-46ea7d94ff52	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5588-ffa8-fec2-9bcc223e1914	00000000-5588-ffa8-136a-a66bff0b5787	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2848 (class 0 OID 7981557)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5588-ffa8-451d-9c9c2cc1847c	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5588-ffa8-b7fb-dbb0ac6fa315	00010000-5588-ffa8-0112-c3a73fccdeec	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5588-ffa8-64b8-a9ce73d6e3a7	00010000-5588-ffa8-a1a6-c844f69b408b	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5588-ffa8-ec86-8e42cc9186d7	00010000-5588-ffa8-7767-c5c5b273a5ef	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5588-ffa8-898f-687cc2e16bc7	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5588-ffa8-10f9-4ff2e432ebe8	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5588-ffa8-8b1e-03ab9f8c3957	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5588-ffa8-06bd-6d8bf05504ed	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5588-ffa8-1b09-0a8864eac1a4	00010000-5588-ffa8-52ef-7b93c76a0ac5	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5588-ffa8-6c34-69c38888520f	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5588-ffa8-b58e-d374cccc6fd0	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5588-ffa8-daed-8772cebada11	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5588-ffa8-7e01-a847528c29ec	00010000-5588-ffa8-c9ab-b9276cd2b2c1	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2835 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 7981511)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5588-ffa7-36f7-82ccd3fd6d3b	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5588-ffa7-3333-61e5386733dc	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5588-ffa7-b2a1-2744bed35226	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5588-ffa7-32e9-252c27c64730	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5588-ffa7-59b5-6411281a8f12	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5588-ffa7-f5cb-59cd7c318d49	Abonma-read	Abonma - branje	f
00030000-5588-ffa7-8d67-6c90ca270a6c	Abonma-write	Abonma - spreminjanje	f
00030000-5588-ffa7-6a74-1393849c34ca	Alternacija-read	Alternacija - branje	f
00030000-5588-ffa7-ced1-0703b0f132c8	Alternacija-write	Alternacija - spreminjanje	f
00030000-5588-ffa7-2ab0-1a3d5919a3ff	Arhivalija-read	Arhivalija - branje	f
00030000-5588-ffa7-3b15-0c1ad64ddd67	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5588-ffa7-a143-1de72552d9e9	Besedilo-read	Besedilo - branje	f
00030000-5588-ffa7-da85-619b21b9e00a	Besedilo-write	Besedilo - spreminjanje	f
00030000-5588-ffa7-44d9-353f85faa93a	DogodekIzven-read	DogodekIzven - branje	f
00030000-5588-ffa7-ff7b-e880c55dbf15	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5588-ffa7-fb7b-57b090580dc8	Dogodek-read	Dogodek - branje	f
00030000-5588-ffa7-d58b-0e7b3599d8e0	Dogodek-write	Dogodek - spreminjanje	f
00030000-5588-ffa7-3238-792ba37f09ec	Drzava-read	Drzava - branje	f
00030000-5588-ffa7-601d-f9c581f69502	Drzava-write	Drzava - spreminjanje	f
00030000-5588-ffa7-56cd-0fd32e00f11d	Funkcija-read	Funkcija - branje	f
00030000-5588-ffa7-124b-6ee9804b8a48	Funkcija-write	Funkcija - spreminjanje	f
00030000-5588-ffa7-eb81-868a2ccf528f	Gostovanje-read	Gostovanje - branje	f
00030000-5588-ffa7-d0dc-26e913aad08e	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5588-ffa7-3aa4-d62b461d4544	Gostujoca-read	Gostujoca - branje	f
00030000-5588-ffa7-d8e0-c62b175e11e3	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5588-ffa7-4409-c4621fda44fa	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5588-ffa7-e8b5-de4d53667f5f	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5588-ffa7-48a1-9350cf2561e3	Kupec-read	Kupec - branje	f
00030000-5588-ffa7-2261-f4c4f41de4c0	Kupec-write	Kupec - spreminjanje	f
00030000-5588-ffa7-5eb1-6751e5d2f147	NacinPlacina-read	NacinPlacina - branje	f
00030000-5588-ffa7-b32a-6088391e092c	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5588-ffa7-6250-294fbd2ff591	Option-read	Option - branje	f
00030000-5588-ffa7-361f-2a87ab06272f	Option-write	Option - spreminjanje	f
00030000-5588-ffa7-1c5a-9dcde41b25ce	OptionValue-read	OptionValue - branje	f
00030000-5588-ffa7-612b-ebad0c6717b8	OptionValue-write	OptionValue - spreminjanje	f
00030000-5588-ffa7-d44c-095fa67d5491	Oseba-read	Oseba - branje	f
00030000-5588-ffa7-bbc4-b1d8d12915ba	Oseba-write	Oseba - spreminjanje	f
00030000-5588-ffa7-7490-8b718c8a4687	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5588-ffa7-90f8-8d71cc2c08cf	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5588-ffa7-ec1f-36fc5a0aa6bf	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5588-ffa7-de89-e74ca1ddd3f4	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5588-ffa7-ecc8-10869908ebe3	Pogodba-read	Pogodba - branje	f
00030000-5588-ffa7-6a32-2e24911f5343	Pogodba-write	Pogodba - spreminjanje	f
00030000-5588-ffa7-4732-2223b3a989f1	Popa-read	Popa - branje	f
00030000-5588-ffa7-e4f1-d4b7e7df3739	Popa-write	Popa - spreminjanje	f
00030000-5588-ffa7-ebc9-05f5b363881a	Posta-read	Posta - branje	f
00030000-5588-ffa7-5195-827f9b74d903	Posta-write	Posta - spreminjanje	f
00030000-5588-ffa7-2890-fb07e715701b	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5588-ffa7-0fb0-5c24cebb9b45	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5588-ffa7-11fe-877fbe702a5b	PostniNaslov-read	PostniNaslov - branje	f
00030000-5588-ffa7-ad0d-6b63732406b3	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5588-ffa7-35d4-218600a765e0	Predstava-read	Predstava - branje	f
00030000-5588-ffa7-e889-7c25c91e2fae	Predstava-write	Predstava - spreminjanje	f
00030000-5588-ffa7-814f-033f518bcbd3	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5588-ffa7-e8f7-4e4b5e12623f	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5588-ffa7-974d-d102380db052	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5588-ffa7-7b2c-37c8248d3b9f	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5588-ffa7-2c8b-bfbb8644a5df	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5588-ffa7-1273-1cea76c4ab11	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5588-ffa7-0ad1-3f87a9b8dbed	ProgramDela-read	ProgramDela - branje	f
00030000-5588-ffa7-e30a-6dd236ea4950	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5588-ffa7-eed5-eb7d582f9ce4	ProgramFestival-read	ProgramFestival - branje	f
00030000-5588-ffa7-df3d-2dbb1e08f72a	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5588-ffa7-e347-84b21f9cf6fb	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5588-ffa7-1c36-94349de33b90	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5588-ffa7-4b4c-a0bade9b7985	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5588-ffa7-38fc-ffbc05aa6f29	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5588-ffa7-4984-0b6702110a35	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5588-ffa7-15f0-05f270f15ea4	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5588-ffa7-925b-742e49ab6745	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5588-ffa7-95aa-e4a7635da818	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5588-ffa7-8999-9ac13f515e42	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5588-ffa7-9fc2-7f7da1f65c57	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5588-ffa7-238d-9625df27c90b	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5588-ffa7-bf90-ac9f0def9f8f	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5588-ffa7-b96e-5f937d37336a	ProgramRazno-read	ProgramRazno - branje	f
00030000-5588-ffa7-7163-122617a454ce	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5588-ffa7-ad12-8662d3a7d2bc	Prostor-read	Prostor - branje	f
00030000-5588-ffa7-1556-f1a549ce1605	Prostor-write	Prostor - spreminjanje	f
00030000-5588-ffa7-17d3-dafbdd66297e	Racun-read	Racun - branje	f
00030000-5588-ffa7-a4c3-e601e80dd272	Racun-write	Racun - spreminjanje	f
00030000-5588-ffa7-dbf9-bb5c88f86fe6	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5588-ffa7-28ab-66e5a34930bb	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5588-ffa7-c6d8-f126785eee0c	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5588-ffa7-9fbc-19c9ae960466	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5588-ffa7-c276-5aab6cedd93a	Rekvizit-read	Rekvizit - branje	f
00030000-5588-ffa7-80af-e40c6f2cfb1d	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5588-ffa7-c1e8-91088054d011	Revizija-read	Revizija - branje	f
00030000-5588-ffa7-898d-84f66776466b	Revizija-write	Revizija - spreminjanje	f
00030000-5588-ffa7-cc1f-25f885fc70ba	Rezervacija-read	Rezervacija - branje	f
00030000-5588-ffa7-90c2-1a46d4f68abd	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5588-ffa7-1d60-0c24c6fc437b	SedezniRed-read	SedezniRed - branje	f
00030000-5588-ffa7-ddaf-06239f6762b3	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5588-ffa7-e5a2-6ccc6588f076	Sedez-read	Sedez - branje	f
00030000-5588-ffa7-14b5-34afa4e982a8	Sedez-write	Sedez - spreminjanje	f
00030000-5588-ffa7-d5e7-33ab967c2102	Sezona-read	Sezona - branje	f
00030000-5588-ffa7-2461-0247344a4984	Sezona-write	Sezona - spreminjanje	f
00030000-5588-ffa7-8299-bf618e4f7477	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5588-ffa7-b81d-0030a835d26d	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5588-ffa7-37ad-3e70446954d4	Stevilcenje-read	Stevilcenje - branje	f
00030000-5588-ffa7-16a1-dbff78374938	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5588-ffa7-7d41-069f5734ae0f	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5588-ffa7-030e-304d8a723300	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5588-ffa7-b443-287a96013fbe	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5588-ffa7-5fbd-24a5f2ca55f1	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5588-ffa7-9dbc-a9cf89668550	Telefonska-read	Telefonska - branje	f
00030000-5588-ffa7-7609-296cd751cdc8	Telefonska-write	Telefonska - spreminjanje	f
00030000-5588-ffa7-51ac-6e134e66777b	TerminStoritve-read	TerminStoritve - branje	f
00030000-5588-ffa7-1b15-843479126d35	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5588-ffa7-9b23-de25ac56f8ea	TipFunkcije-read	TipFunkcije - branje	f
00030000-5588-ffa7-3104-43072c2074b4	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5588-ffa7-a117-ac620a204ea4	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5588-ffa7-190a-30ec11427a84	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5588-ffa7-5a7c-e989765463bb	Trr-read	Trr - branje	f
00030000-5588-ffa7-7818-bf8caf7d2d37	Trr-write	Trr - spreminjanje	f
00030000-5588-ffa7-27a5-2602503af82d	Uprizoritev-read	Uprizoritev - branje	f
00030000-5588-ffa7-6f05-7c447dbcf555	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5588-ffa7-0fa1-56fbee9091c9	Vaja-read	Vaja - branje	f
00030000-5588-ffa7-5894-05846d22f631	Vaja-write	Vaja - spreminjanje	f
00030000-5588-ffa7-6e62-88bba0d3c2d8	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5588-ffa7-7772-2358482857b4	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5588-ffa7-0902-c2837d74c8e8	Zaposlitev-read	Zaposlitev - branje	f
00030000-5588-ffa7-5538-92a7ac7cb75d	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5588-ffa7-6e59-bff6f4951d2b	Zasedenost-read	Zasedenost - branje	f
00030000-5588-ffa7-d51e-0e0cbdbdc446	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5588-ffa7-18c1-cb201513aa73	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5588-ffa7-8236-d9a34d579dab	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5588-ffa7-99c8-010b25e6094f	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5588-ffa7-543b-b9cef14cba97	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2845 (class 0 OID 7981530)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5588-ffa7-1232-c0f9443d4270	00030000-5588-ffa7-3333-61e5386733dc
00020000-5588-ffa7-8a88-10a5835d90e9	00030000-5588-ffa7-3238-792ba37f09ec
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-f5cb-59cd7c318d49
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-8d67-6c90ca270a6c
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-6a74-1393849c34ca
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-ced1-0703b0f132c8
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-2ab0-1a3d5919a3ff
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-fb7b-57b090580dc8
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-32e9-252c27c64730
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-d58b-0e7b3599d8e0
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-3238-792ba37f09ec
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-601d-f9c581f69502
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-56cd-0fd32e00f11d
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-124b-6ee9804b8a48
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-eb81-868a2ccf528f
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-d0dc-26e913aad08e
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-3aa4-d62b461d4544
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-d8e0-c62b175e11e3
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-4409-c4621fda44fa
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-e8b5-de4d53667f5f
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-6250-294fbd2ff591
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-1c5a-9dcde41b25ce
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-d44c-095fa67d5491
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-bbc4-b1d8d12915ba
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-4732-2223b3a989f1
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-e4f1-d4b7e7df3739
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-ebc9-05f5b363881a
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-5195-827f9b74d903
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-11fe-877fbe702a5b
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-ad0d-6b63732406b3
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-35d4-218600a765e0
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-e889-7c25c91e2fae
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-2c8b-bfbb8644a5df
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-1273-1cea76c4ab11
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-ad12-8662d3a7d2bc
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-1556-f1a549ce1605
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-c6d8-f126785eee0c
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-9fbc-19c9ae960466
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-c276-5aab6cedd93a
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-80af-e40c6f2cfb1d
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-d5e7-33ab967c2102
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-2461-0247344a4984
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-9b23-de25ac56f8ea
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-27a5-2602503af82d
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-6f05-7c447dbcf555
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-0fa1-56fbee9091c9
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-5894-05846d22f631
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-6e59-bff6f4951d2b
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-d51e-0e0cbdbdc446
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-18c1-cb201513aa73
00020000-5588-ffa7-1c16-03eb7b4911ca	00030000-5588-ffa7-99c8-010b25e6094f
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-f5cb-59cd7c318d49
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-2ab0-1a3d5919a3ff
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-fb7b-57b090580dc8
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-3238-792ba37f09ec
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-eb81-868a2ccf528f
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-3aa4-d62b461d4544
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-4409-c4621fda44fa
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-e8b5-de4d53667f5f
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-6250-294fbd2ff591
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-1c5a-9dcde41b25ce
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-d44c-095fa67d5491
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-bbc4-b1d8d12915ba
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-4732-2223b3a989f1
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-ebc9-05f5b363881a
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-11fe-877fbe702a5b
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-ad0d-6b63732406b3
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-35d4-218600a765e0
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-ad12-8662d3a7d2bc
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-c6d8-f126785eee0c
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-c276-5aab6cedd93a
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-d5e7-33ab967c2102
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-9dbc-a9cf89668550
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-7609-296cd751cdc8
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-5a7c-e989765463bb
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-7818-bf8caf7d2d37
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-0902-c2837d74c8e8
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-5538-92a7ac7cb75d
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-18c1-cb201513aa73
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	00030000-5588-ffa7-99c8-010b25e6094f
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-f5cb-59cd7c318d49
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-6a74-1393849c34ca
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-2ab0-1a3d5919a3ff
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-3b15-0c1ad64ddd67
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-a143-1de72552d9e9
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-44d9-353f85faa93a
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-fb7b-57b090580dc8
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-3238-792ba37f09ec
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-56cd-0fd32e00f11d
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-eb81-868a2ccf528f
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-3aa4-d62b461d4544
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-4409-c4621fda44fa
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-6250-294fbd2ff591
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-1c5a-9dcde41b25ce
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-d44c-095fa67d5491
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-4732-2223b3a989f1
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-ebc9-05f5b363881a
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-35d4-218600a765e0
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-2c8b-bfbb8644a5df
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-ad12-8662d3a7d2bc
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-c6d8-f126785eee0c
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-c276-5aab6cedd93a
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-d5e7-33ab967c2102
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-9b23-de25ac56f8ea
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-0fa1-56fbee9091c9
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-6e59-bff6f4951d2b
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-18c1-cb201513aa73
00020000-5588-ffa7-ecfa-f5c527140625	00030000-5588-ffa7-99c8-010b25e6094f
00020000-5588-ffa7-1afa-7bf913409a6a	00030000-5588-ffa7-f5cb-59cd7c318d49
00020000-5588-ffa7-1afa-7bf913409a6a	00030000-5588-ffa7-8d67-6c90ca270a6c
00020000-5588-ffa7-1afa-7bf913409a6a	00030000-5588-ffa7-ced1-0703b0f132c8
00020000-5588-ffa7-1afa-7bf913409a6a	00030000-5588-ffa7-2ab0-1a3d5919a3ff
00020000-5588-ffa7-1afa-7bf913409a6a	00030000-5588-ffa7-fb7b-57b090580dc8
00020000-5588-ffa7-1afa-7bf913409a6a	00030000-5588-ffa7-3238-792ba37f09ec
00020000-5588-ffa7-1afa-7bf913409a6a	00030000-5588-ffa7-eb81-868a2ccf528f
00020000-5588-ffa7-1afa-7bf913409a6a	00030000-5588-ffa7-3aa4-d62b461d4544
00020000-5588-ffa7-1afa-7bf913409a6a	00030000-5588-ffa7-6250-294fbd2ff591
00020000-5588-ffa7-1afa-7bf913409a6a	00030000-5588-ffa7-1c5a-9dcde41b25ce
00020000-5588-ffa7-1afa-7bf913409a6a	00030000-5588-ffa7-4732-2223b3a989f1
00020000-5588-ffa7-1afa-7bf913409a6a	00030000-5588-ffa7-ebc9-05f5b363881a
00020000-5588-ffa7-1afa-7bf913409a6a	00030000-5588-ffa7-35d4-218600a765e0
00020000-5588-ffa7-1afa-7bf913409a6a	00030000-5588-ffa7-ad12-8662d3a7d2bc
00020000-5588-ffa7-1afa-7bf913409a6a	00030000-5588-ffa7-c6d8-f126785eee0c
00020000-5588-ffa7-1afa-7bf913409a6a	00030000-5588-ffa7-c276-5aab6cedd93a
00020000-5588-ffa7-1afa-7bf913409a6a	00030000-5588-ffa7-d5e7-33ab967c2102
00020000-5588-ffa7-1afa-7bf913409a6a	00030000-5588-ffa7-9b23-de25ac56f8ea
00020000-5588-ffa7-1afa-7bf913409a6a	00030000-5588-ffa7-18c1-cb201513aa73
00020000-5588-ffa7-1afa-7bf913409a6a	00030000-5588-ffa7-99c8-010b25e6094f
00020000-5588-ffa7-2a6a-c65ca8f9711c	00030000-5588-ffa7-f5cb-59cd7c318d49
00020000-5588-ffa7-2a6a-c65ca8f9711c	00030000-5588-ffa7-2ab0-1a3d5919a3ff
00020000-5588-ffa7-2a6a-c65ca8f9711c	00030000-5588-ffa7-fb7b-57b090580dc8
00020000-5588-ffa7-2a6a-c65ca8f9711c	00030000-5588-ffa7-3238-792ba37f09ec
00020000-5588-ffa7-2a6a-c65ca8f9711c	00030000-5588-ffa7-eb81-868a2ccf528f
00020000-5588-ffa7-2a6a-c65ca8f9711c	00030000-5588-ffa7-3aa4-d62b461d4544
00020000-5588-ffa7-2a6a-c65ca8f9711c	00030000-5588-ffa7-6250-294fbd2ff591
00020000-5588-ffa7-2a6a-c65ca8f9711c	00030000-5588-ffa7-1c5a-9dcde41b25ce
00020000-5588-ffa7-2a6a-c65ca8f9711c	00030000-5588-ffa7-4732-2223b3a989f1
00020000-5588-ffa7-2a6a-c65ca8f9711c	00030000-5588-ffa7-ebc9-05f5b363881a
00020000-5588-ffa7-2a6a-c65ca8f9711c	00030000-5588-ffa7-35d4-218600a765e0
00020000-5588-ffa7-2a6a-c65ca8f9711c	00030000-5588-ffa7-ad12-8662d3a7d2bc
00020000-5588-ffa7-2a6a-c65ca8f9711c	00030000-5588-ffa7-c6d8-f126785eee0c
00020000-5588-ffa7-2a6a-c65ca8f9711c	00030000-5588-ffa7-c276-5aab6cedd93a
00020000-5588-ffa7-2a6a-c65ca8f9711c	00030000-5588-ffa7-d5e7-33ab967c2102
00020000-5588-ffa7-2a6a-c65ca8f9711c	00030000-5588-ffa7-51ac-6e134e66777b
00020000-5588-ffa7-2a6a-c65ca8f9711c	00030000-5588-ffa7-b2a1-2744bed35226
00020000-5588-ffa7-2a6a-c65ca8f9711c	00030000-5588-ffa7-9b23-de25ac56f8ea
00020000-5588-ffa7-2a6a-c65ca8f9711c	00030000-5588-ffa7-18c1-cb201513aa73
00020000-5588-ffa7-2a6a-c65ca8f9711c	00030000-5588-ffa7-99c8-010b25e6094f
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-36f7-82ccd3fd6d3b
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-3333-61e5386733dc
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-b2a1-2744bed35226
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-32e9-252c27c64730
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-59b5-6411281a8f12
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-f5cb-59cd7c318d49
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-8d67-6c90ca270a6c
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-6a74-1393849c34ca
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-ced1-0703b0f132c8
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-2ab0-1a3d5919a3ff
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-3b15-0c1ad64ddd67
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-a143-1de72552d9e9
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-da85-619b21b9e00a
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-44d9-353f85faa93a
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-ff7b-e880c55dbf15
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-fb7b-57b090580dc8
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-d58b-0e7b3599d8e0
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-3238-792ba37f09ec
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-601d-f9c581f69502
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-56cd-0fd32e00f11d
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-124b-6ee9804b8a48
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-eb81-868a2ccf528f
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-d0dc-26e913aad08e
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-3aa4-d62b461d4544
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-d8e0-c62b175e11e3
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-4409-c4621fda44fa
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-e8b5-de4d53667f5f
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-48a1-9350cf2561e3
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-2261-f4c4f41de4c0
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-5eb1-6751e5d2f147
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-b32a-6088391e092c
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-6250-294fbd2ff591
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-361f-2a87ab06272f
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-1c5a-9dcde41b25ce
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-612b-ebad0c6717b8
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-d44c-095fa67d5491
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-bbc4-b1d8d12915ba
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-7490-8b718c8a4687
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-90f8-8d71cc2c08cf
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-ec1f-36fc5a0aa6bf
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-de89-e74ca1ddd3f4
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-ecc8-10869908ebe3
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-6a32-2e24911f5343
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-4732-2223b3a989f1
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-e4f1-d4b7e7df3739
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-ebc9-05f5b363881a
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-5195-827f9b74d903
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-2890-fb07e715701b
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-0fb0-5c24cebb9b45
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-11fe-877fbe702a5b
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-ad0d-6b63732406b3
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-35d4-218600a765e0
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-e889-7c25c91e2fae
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-814f-033f518bcbd3
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-e8f7-4e4b5e12623f
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-974d-d102380db052
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-7b2c-37c8248d3b9f
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-2c8b-bfbb8644a5df
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-1273-1cea76c4ab11
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-0ad1-3f87a9b8dbed
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-e30a-6dd236ea4950
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-eed5-eb7d582f9ce4
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-df3d-2dbb1e08f72a
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-e347-84b21f9cf6fb
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-1c36-94349de33b90
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-4b4c-a0bade9b7985
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-38fc-ffbc05aa6f29
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-4984-0b6702110a35
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-15f0-05f270f15ea4
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-925b-742e49ab6745
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-95aa-e4a7635da818
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-8999-9ac13f515e42
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-9fc2-7f7da1f65c57
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-238d-9625df27c90b
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-bf90-ac9f0def9f8f
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-b96e-5f937d37336a
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-7163-122617a454ce
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-ad12-8662d3a7d2bc
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-1556-f1a549ce1605
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-17d3-dafbdd66297e
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-a4c3-e601e80dd272
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-dbf9-bb5c88f86fe6
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-28ab-66e5a34930bb
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-c6d8-f126785eee0c
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-9fbc-19c9ae960466
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-c276-5aab6cedd93a
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-80af-e40c6f2cfb1d
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-c1e8-91088054d011
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-898d-84f66776466b
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-cc1f-25f885fc70ba
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-90c2-1a46d4f68abd
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-1d60-0c24c6fc437b
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-ddaf-06239f6762b3
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-e5a2-6ccc6588f076
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-14b5-34afa4e982a8
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-d5e7-33ab967c2102
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-2461-0247344a4984
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-8299-bf618e4f7477
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-b81d-0030a835d26d
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-37ad-3e70446954d4
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-16a1-dbff78374938
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-7d41-069f5734ae0f
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-030e-304d8a723300
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-b443-287a96013fbe
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-5fbd-24a5f2ca55f1
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-9dbc-a9cf89668550
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-7609-296cd751cdc8
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-51ac-6e134e66777b
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-1b15-843479126d35
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-9b23-de25ac56f8ea
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-3104-43072c2074b4
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-a117-ac620a204ea4
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-190a-30ec11427a84
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-5a7c-e989765463bb
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-7818-bf8caf7d2d37
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-27a5-2602503af82d
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-6f05-7c447dbcf555
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-0fa1-56fbee9091c9
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-5894-05846d22f631
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-6e62-88bba0d3c2d8
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-7772-2358482857b4
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-0902-c2837d74c8e8
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-5538-92a7ac7cb75d
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-6e59-bff6f4951d2b
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-d51e-0e0cbdbdc446
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-18c1-cb201513aa73
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-8236-d9a34d579dab
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-99c8-010b25e6094f
00020000-5588-ffa8-acc1-fd45f20a658c	00030000-5588-ffa7-543b-b9cef14cba97
\.


--
-- TOC entry 2873 (class 0 OID 7981825)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 7981856)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 7981992)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5588-ffa9-9378-24aafd65f8f9	00090000-5588-ffa8-451d-9c9c2cc1847c	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2850 (class 0 OID 7981590)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5588-ffa8-6eaf-f848786e916f	00040000-5588-ffa6-8084-6a21304f0d50	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5588-ffa8-1ba9-082498caacfa	00040000-5588-ffa6-8084-6a21304f0d50	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5588-ffa8-dda0-e8d5784b4999	00040000-5588-ffa6-8084-6a21304f0d50	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5588-ffa8-c7b5-711ff05c56f0	00040000-5588-ffa6-8084-6a21304f0d50	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5588-ffa8-ae1d-4fa364b649c6	00040000-5588-ffa6-8084-6a21304f0d50	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5588-ffa8-3889-6323413f7b4c	00040000-5588-ffa6-e80a-f12955c7091b	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2852 (class 0 OID 7981625)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5588-ffa7-6bb9-a21e5af201d9	8341	Adlešiči
00050000-5588-ffa7-cd6e-8b5c7d423747	5270	Ajdovščina
00050000-5588-ffa7-aee5-cc3f69971282	6280	Ankaran/Ancarano
00050000-5588-ffa7-f44a-564012bfee85	9253	Apače
00050000-5588-ffa7-90f7-3b6ab020a8c2	8253	Artiče
00050000-5588-ffa7-671f-7e20f688c830	4275	Begunje na Gorenjskem
00050000-5588-ffa7-6b87-7046db59e7f9	1382	Begunje pri Cerknici
00050000-5588-ffa7-14e4-a2d3f240383d	9231	Beltinci
00050000-5588-ffa7-06d4-fb40676c0aae	2234	Benedikt
00050000-5588-ffa7-6227-a195da0a8e76	2345	Bistrica ob Dravi
00050000-5588-ffa7-fd62-f4a2582e6f4c	3256	Bistrica ob Sotli
00050000-5588-ffa7-8752-7bc5a5380d9a	8259	Bizeljsko
00050000-5588-ffa7-e25b-36b2eb1b1170	1223	Blagovica
00050000-5588-ffa7-8305-4684054b6a74	8283	Blanca
00050000-5588-ffa7-c94b-5aa6baadb3b0	4260	Bled
00050000-5588-ffa7-0d0d-b453ca4b25c8	4273	Blejska Dobrava
00050000-5588-ffa7-71b9-22c65dc9d7ae	9265	Bodonci
00050000-5588-ffa7-d8d9-d7f7b71c1d7d	9222	Bogojina
00050000-5588-ffa7-3de7-923e71615429	4263	Bohinjska Bela
00050000-5588-ffa7-9863-80069e84f24a	4264	Bohinjska Bistrica
00050000-5588-ffa7-4294-e3abf44ab36c	4265	Bohinjsko jezero
00050000-5588-ffa7-48a5-f4e13a807a0f	1353	Borovnica
00050000-5588-ffa7-c35f-1878f272bbe7	8294	Boštanj
00050000-5588-ffa7-f4fa-c90aaf1c796f	5230	Bovec
00050000-5588-ffa7-5bc1-17e94ea3ed7a	5295	Branik
00050000-5588-ffa7-fada-8f71b8ef8aa5	3314	Braslovče
00050000-5588-ffa7-2ab3-beeaf3a86414	5223	Breginj
00050000-5588-ffa7-e8f6-405b2cec2631	8280	Brestanica
00050000-5588-ffa7-1516-435ae54842db	2354	Bresternica
00050000-5588-ffa7-635d-95f07c0052e2	4243	Brezje
00050000-5588-ffa7-1529-68448461cffb	1351	Brezovica pri Ljubljani
00050000-5588-ffa7-ce04-3c52ab2da7b2	8250	Brežice
00050000-5588-ffa7-47e9-d675bcd939b0	4210	Brnik - Aerodrom
00050000-5588-ffa7-18d5-ac398157870f	8321	Brusnice
00050000-5588-ffa7-b84e-df5322825c88	3255	Buče
00050000-5588-ffa7-cb5a-3608d1546e8d	8276	Bučka 
00050000-5588-ffa7-0226-ae782693f882	9261	Cankova
00050000-5588-ffa7-0df1-2291c3ae442b	3000	Celje 
00050000-5588-ffa7-f737-280a901b2b28	3001	Celje - poštni predali
00050000-5588-ffa7-1d76-6ec2bcc241e2	4207	Cerklje na Gorenjskem
00050000-5588-ffa7-179c-609706953729	8263	Cerklje ob Krki
00050000-5588-ffa7-9619-fa51935b97c8	1380	Cerknica
00050000-5588-ffa7-1f2c-afd27a24d2bf	5282	Cerkno
00050000-5588-ffa7-0284-9327ab197e7e	2236	Cerkvenjak
00050000-5588-ffa7-8889-0f3bc33e0670	2215	Ceršak
00050000-5588-ffa7-0bfd-1cfce16c3b4d	2326	Cirkovce
00050000-5588-ffa7-d347-aae91b33d8df	2282	Cirkulane
00050000-5588-ffa7-1d09-5241429a28da	5273	Col
00050000-5588-ffa7-0d97-46394a548c00	8251	Čatež ob Savi
00050000-5588-ffa7-22ad-2738ab00721a	1413	Čemšenik
00050000-5588-ffa7-0b8d-3f28d18a8655	5253	Čepovan
00050000-5588-ffa7-6038-7a3eb40c1f9d	9232	Črenšovci
00050000-5588-ffa7-63b0-1d6471aeabc3	2393	Črna na Koroškem
00050000-5588-ffa7-47f4-93c1eca929f1	6275	Črni Kal
00050000-5588-ffa7-daaa-d118586f8afb	5274	Črni Vrh nad Idrijo
00050000-5588-ffa7-b0f1-87141fbbadf2	5262	Črniče
00050000-5588-ffa7-9dee-1bf878cc1e90	8340	Črnomelj
00050000-5588-ffa7-fed5-1a74a0778334	6271	Dekani
00050000-5588-ffa7-040f-a07128a30215	5210	Deskle
00050000-5588-ffa7-adf8-191a147a4c8a	2253	Destrnik
00050000-5588-ffa7-6842-80a6853f7509	6215	Divača
00050000-5588-ffa7-8bc1-2240f305a155	1233	Dob
00050000-5588-ffa7-b7ef-33a03acb3644	3224	Dobje pri Planini
00050000-5588-ffa7-45ac-9ffd347105b3	8257	Dobova
00050000-5588-ffa7-3213-86576987acf4	1423	Dobovec
00050000-5588-ffa7-aefd-375b7d4c159c	5263	Dobravlje
00050000-5588-ffa7-fdef-a127a6ac6cb6	3204	Dobrna
00050000-5588-ffa7-63b1-a7d5d4fd9e83	8211	Dobrnič
00050000-5588-ffa7-cf47-c321b6ff4b43	1356	Dobrova
00050000-5588-ffa7-1402-07a2c7c74833	9223	Dobrovnik/Dobronak 
00050000-5588-ffa7-0a0a-6e38bd7c7a65	5212	Dobrovo v Brdih
00050000-5588-ffa7-e385-1f35700c7af9	1431	Dol pri Hrastniku
00050000-5588-ffa7-a2a0-fb1facbbc7c7	1262	Dol pri Ljubljani
00050000-5588-ffa7-6e2f-5594f03150c3	1273	Dole pri Litiji
00050000-5588-ffa7-2118-ab79bd6f6b79	1331	Dolenja vas
00050000-5588-ffa7-5b20-9a88fcdbb037	8350	Dolenjske Toplice
00050000-5588-ffa7-1623-b3f0323b3ace	1230	Domžale
00050000-5588-ffa7-c65e-99761a84fb73	2252	Dornava
00050000-5588-ffa7-c3ae-8ce2799104a3	5294	Dornberk
00050000-5588-ffa7-43de-8073d4a45782	1319	Draga
00050000-5588-ffa7-1974-a30ce3cdc78f	8343	Dragatuš
00050000-5588-ffa7-c3f5-7c6d9a7be6bf	3222	Dramlje
00050000-5588-ffa7-e1d8-36de35954b92	2370	Dravograd
00050000-5588-ffa7-1a2b-ce6e4fc9c79f	4203	Duplje
00050000-5588-ffa7-2b12-2f7a9dfbb6ac	6221	Dutovlje
00050000-5588-ffa7-1517-c89dc27f8cce	8361	Dvor
00050000-5588-ffa7-2316-8f72062e44be	2343	Fala
00050000-5588-ffa7-ee36-7d1569e8a881	9208	Fokovci
00050000-5588-ffa7-018a-31250ae60bc6	2313	Fram
00050000-5588-ffa7-5387-a31a34f88343	3213	Frankolovo
00050000-5588-ffa7-f59b-689a2fbbe6b7	1274	Gabrovka
00050000-5588-ffa7-14e9-568381d4379d	8254	Globoko
00050000-5588-ffa7-a42b-b137b5a0b695	5275	Godovič
00050000-5588-ffa7-36dd-8eea72b5392d	4204	Golnik
00050000-5588-ffa7-214b-34d183073032	3303	Gomilsko
00050000-5588-ffa7-d02e-b1ef90c2575a	4224	Gorenja vas
00050000-5588-ffa7-ffca-4292bc5d3468	3263	Gorica pri Slivnici
00050000-5588-ffa7-895f-8f366d1e7cd8	2272	Gorišnica
00050000-5588-ffa7-bb24-75e27a25a09a	9250	Gornja Radgona
00050000-5588-ffa7-f496-6fefaeec0cd2	3342	Gornji Grad
00050000-5588-ffa7-a34f-90acc22d3858	4282	Gozd Martuljek
00050000-5588-ffa7-c3c4-888a9feba2d0	6272	Gračišče
00050000-5588-ffa7-b963-0cf0cb1adfca	9264	Grad
00050000-5588-ffa7-a28f-b3da4e641f25	8332	Gradac
00050000-5588-ffa7-c706-6e2ec6aed5d7	1384	Grahovo
00050000-5588-ffa7-762e-4edf8f43461b	5242	Grahovo ob Bači
00050000-5588-ffa7-48d7-7909372f93bc	5251	Grgar
00050000-5588-ffa7-912c-0f88afabc38c	3302	Griže
00050000-5588-ffa7-9e53-dd9fc1132744	3231	Grobelno
00050000-5588-ffa7-c0e6-da3030503f94	1290	Grosuplje
00050000-5588-ffa7-51d3-3ef67ca4a59b	2288	Hajdina
00050000-5588-ffa7-8171-cd2bb31d3f96	8362	Hinje
00050000-5588-ffa7-35d8-9672cdc40e16	2311	Hoče
00050000-5588-ffa7-8f94-9d2f490aec3b	9205	Hodoš/Hodos
00050000-5588-ffa7-b7eb-4be7e1d9d1f8	1354	Horjul
00050000-5588-ffa7-f426-9dbcd0059704	1372	Hotedršica
00050000-5588-ffa7-2f33-3d00e11e731d	1430	Hrastnik
00050000-5588-ffa7-f51a-924fbf001bb4	6225	Hruševje
00050000-5588-ffa7-0831-25e1852edf9c	4276	Hrušica
00050000-5588-ffa7-d8a5-5926ff22c4b7	5280	Idrija
00050000-5588-ffa7-ffb3-f99c80853c89	1292	Ig
00050000-5588-ffa7-64fa-b45a8b84a751	6250	Ilirska Bistrica
00050000-5588-ffa7-89d0-2e235e2c1e7f	6251	Ilirska Bistrica-Trnovo
00050000-5588-ffa7-f6fe-14942a81e3f1	1295	Ivančna Gorica
00050000-5588-ffa7-92d4-bae80d7d684a	2259	Ivanjkovci
00050000-5588-ffa7-e403-5a970646259c	1411	Izlake
00050000-5588-ffa7-4441-6d11bdbfc24c	6310	Izola/Isola
00050000-5588-ffa7-be26-262b79bf6edb	2222	Jakobski Dol
00050000-5588-ffa7-9e22-24fb42e91dbd	2221	Jarenina
00050000-5588-ffa7-a40a-bcaffd419fca	6254	Jelšane
00050000-5588-ffa7-de70-48ec39edff85	4270	Jesenice
00050000-5588-ffa7-f827-24a1b3c2ee52	8261	Jesenice na Dolenjskem
00050000-5588-ffa7-a6bd-6d14c976d8c0	3273	Jurklošter
00050000-5588-ffa7-ec09-54ce3fded17f	2223	Jurovski Dol
00050000-5588-ffa7-999d-2f2e218fafbe	2256	Juršinci
00050000-5588-ffa7-43d1-ec82092a24e5	5214	Kal nad Kanalom
00050000-5588-ffa7-5e1a-d947adbfa88c	3233	Kalobje
00050000-5588-ffa7-d473-57531950efa5	4246	Kamna Gorica
00050000-5588-ffa7-3037-06de0e96fbb9	2351	Kamnica
00050000-5588-ffa7-1104-67ac6c2819ff	1241	Kamnik
00050000-5588-ffa7-c529-53bd1191d238	5213	Kanal
00050000-5588-ffa7-364e-c0c911821f6c	8258	Kapele
00050000-5588-ffa7-3e64-fccf32d5cb5e	2362	Kapla
00050000-5588-ffa7-6372-2083b4843b07	2325	Kidričevo
00050000-5588-ffa7-6ce5-0500503cf216	1412	Kisovec
00050000-5588-ffa7-ed14-6f6d6ee1166b	6253	Knežak
00050000-5588-ffa7-db88-814a5b57c82c	5222	Kobarid
00050000-5588-ffa7-a386-f2112b647876	9227	Kobilje
00050000-5588-ffa7-4e6a-43cc6cf70571	1330	Kočevje
00050000-5588-ffa7-3f1b-7f76989b6754	1338	Kočevska Reka
00050000-5588-ffa7-8275-4c415e01e6c7	2276	Kog
00050000-5588-ffa7-1d21-86a393355203	5211	Kojsko
00050000-5588-ffa7-1a2c-d1be27f59fe7	6223	Komen
00050000-5588-ffa7-2f30-7df8cd71dd93	1218	Komenda
00050000-5588-ffa7-66a8-5a7d59fe2ed0	6000	Koper/Capodistria 
00050000-5588-ffa7-abbc-66a14ec9150c	6001	Koper/Capodistria - poštni predali
00050000-5588-ffa7-89bb-4a3069c26686	8282	Koprivnica
00050000-5588-ffa7-6627-e4688b0605a4	5296	Kostanjevica na Krasu
00050000-5588-ffa7-9f47-f8f9c1963fd0	8311	Kostanjevica na Krki
00050000-5588-ffa7-50c1-bfd9fc0a0603	1336	Kostel
00050000-5588-ffa7-18c1-619553cf8baf	6256	Košana
00050000-5588-ffa7-fe3d-d3a8398df264	2394	Kotlje
00050000-5588-ffa7-8886-771a42ce358f	6240	Kozina
00050000-5588-ffa7-cab8-765d29d68433	3260	Kozje
00050000-5588-ffa7-ac88-0d4d7f4547be	4000	Kranj 
00050000-5588-ffa7-32e9-e604166db6b1	4001	Kranj - poštni predali
00050000-5588-ffa7-4d79-dafc847760cc	4280	Kranjska Gora
00050000-5588-ffa7-5c52-d69daf54c9cf	1281	Kresnice
00050000-5588-ffa7-cda8-8434c853db8e	4294	Križe
00050000-5588-ffa7-0180-5cd73b96adb4	9206	Križevci
00050000-5588-ffa7-d229-25a7693bc6fa	9242	Križevci pri Ljutomeru
00050000-5588-ffa7-4fdc-fd5bec1b93c6	1301	Krka
00050000-5588-ffa7-c5fc-26a295b73534	8296	Krmelj
00050000-5588-ffa7-90da-eabe24ee4b3a	4245	Kropa
00050000-5588-ffa7-3252-f2ea3c8a5087	8262	Krška vas
00050000-5588-ffa7-b45a-1f26db2800db	8270	Krško
00050000-5588-ffa7-106c-ec7c2d46c806	9263	Kuzma
00050000-5588-ffa7-0e43-6c06c6d703df	2318	Laporje
00050000-5588-ffa7-702a-89e28e118387	3270	Laško
00050000-5588-ffa7-3099-2f29b4467bfb	1219	Laze v Tuhinju
00050000-5588-ffa7-c47d-ca5008890d3d	2230	Lenart v Slovenskih goricah
00050000-5588-ffa7-5275-2ce1a6231a17	9220	Lendava/Lendva
00050000-5588-ffa7-d967-43795b5c172b	4248	Lesce
00050000-5588-ffa7-deba-c10749e43993	3261	Lesično
00050000-5588-ffa7-fa73-d7d43b237c56	8273	Leskovec pri Krškem
00050000-5588-ffa7-7623-da6421897b55	2372	Libeliče
00050000-5588-ffa7-ef94-7130d6cc6f56	2341	Limbuš
00050000-5588-ffa7-c3a7-f7f80a42adc5	1270	Litija
00050000-5588-ffa7-4045-5aabf64fd284	3202	Ljubečna
00050000-5588-ffa7-58ab-ee29315e306d	1000	Ljubljana 
00050000-5588-ffa7-5ddd-514b22266b24	1001	Ljubljana - poštni predali
00050000-5588-ffa7-7027-a4b9812e3dc7	1231	Ljubljana - Črnuče
00050000-5588-ffa7-cc8e-7a448934b506	1261	Ljubljana - Dobrunje
00050000-5588-ffa7-b707-40ea818a6cb6	1260	Ljubljana - Polje
00050000-5588-ffa7-0ec6-6c3cff1803e9	1210	Ljubljana - Šentvid
00050000-5588-ffa7-44a1-5ba544c28555	1211	Ljubljana - Šmartno
00050000-5588-ffa7-545f-f5e2d552d8c6	3333	Ljubno ob Savinji
00050000-5588-ffa7-6f6f-97f3c7b99eca	9240	Ljutomer
00050000-5588-ffa7-91c6-c9abe9cf388f	3215	Loče
00050000-5588-ffa7-9c79-77548817c10a	5231	Log pod Mangartom
00050000-5588-ffa7-832c-b20553d30d0a	1358	Log pri Brezovici
00050000-5588-ffa7-0359-dd2206ab937e	1370	Logatec
00050000-5588-ffa7-d81f-7ec8ea6b7ce2	1371	Logatec
00050000-5588-ffa7-9f77-6d0741a89edb	1434	Loka pri Zidanem Mostu
00050000-5588-ffa7-f735-f35ed64bcd54	3223	Loka pri Žusmu
00050000-5588-ffa7-6c03-a21d8337550f	6219	Lokev
00050000-5588-ffa7-527f-daffa1d48d08	1318	Loški Potok
00050000-5588-ffa7-671a-90d19b5fe5d3	2324	Lovrenc na Dravskem polju
00050000-5588-ffa7-0090-870f0d85b6de	2344	Lovrenc na Pohorju
00050000-5588-ffa7-a5b9-05795ffdd22c	3334	Luče
00050000-5588-ffa7-2146-62f8adabc5ff	1225	Lukovica
00050000-5588-ffa7-2cb8-f41bc8ac56c4	9202	Mačkovci
00050000-5588-ffa7-7159-75d166cdf134	2322	Majšperk
00050000-5588-ffa7-e8cc-c079f128ce14	2321	Makole
00050000-5588-ffa7-7bcb-bbcfb61e9b1f	9243	Mala Nedelja
00050000-5588-ffa7-7e9c-2109574dfe8a	2229	Malečnik
00050000-5588-ffa7-ecdc-51ae3f183f87	6273	Marezige
00050000-5588-ffa7-c365-ca139502983d	2000	Maribor 
00050000-5588-ffa7-7dc9-5a44331b1ba5	2001	Maribor - poštni predali
00050000-5588-ffa7-7e74-66f8b4b1f444	2206	Marjeta na Dravskem polju
00050000-5588-ffa7-6dd6-9a0d1fdf8a1a	2281	Markovci
00050000-5588-ffa7-9860-5bc1fceff4af	9221	Martjanci
00050000-5588-ffa7-dc8a-d1d7606963ee	6242	Materija
00050000-5588-ffa7-f77c-9b0a32770d6e	4211	Mavčiče
00050000-5588-ffa7-6a67-8e11ae7733c1	1215	Medvode
00050000-5588-ffa7-6f02-8017ba8e0711	1234	Mengeš
00050000-5588-ffa7-3119-d42b6b5f963c	8330	Metlika
00050000-5588-ffa7-d786-3abe6975130f	2392	Mežica
00050000-5588-ffa7-4710-b8ff7f71ae41	2204	Miklavž na Dravskem polju
00050000-5588-ffa7-7096-f9edb06d26fe	2275	Miklavž pri Ormožu
00050000-5588-ffa7-f124-d2144961319b	5291	Miren
00050000-5588-ffa7-d301-bc991451f303	8233	Mirna
00050000-5588-ffa7-6147-d20ff977824e	8216	Mirna Peč
00050000-5588-ffa7-f0dd-24d36b467990	2382	Mislinja
00050000-5588-ffa7-096d-c245b12cf94c	4281	Mojstrana
00050000-5588-ffa7-6698-e9ae02be8ead	8230	Mokronog
00050000-5588-ffa7-d0de-6f720820fb7e	1251	Moravče
00050000-5588-ffa7-c47a-28ae0a409130	9226	Moravske Toplice
00050000-5588-ffa7-84c2-a72209e1efed	5216	Most na Soči
00050000-5588-ffa7-f07a-365aff5dd8aa	1221	Motnik
00050000-5588-ffa7-a30a-01391f964656	3330	Mozirje
00050000-5588-ffa7-c7bc-8650aac0612c	9000	Murska Sobota 
00050000-5588-ffa7-4174-429395281378	9001	Murska Sobota - poštni predali
00050000-5588-ffa7-91ce-3a2b2bb0f370	2366	Muta
00050000-5588-ffa7-6546-8dcfb4fa8a08	4202	Naklo
00050000-5588-ffa7-6375-eb834eea3ad6	3331	Nazarje
00050000-5588-ffa7-2a96-d17aad844ff3	1357	Notranje Gorice
00050000-5588-ffa7-60d1-2673ac731300	3203	Nova Cerkev
00050000-5588-ffa7-a308-6beb2d8ac154	5000	Nova Gorica 
00050000-5588-ffa7-28c6-2026d060d65b	5001	Nova Gorica - poštni predali
00050000-5588-ffa7-c04c-3a46e1594359	1385	Nova vas
00050000-5588-ffa7-a910-91a3387f804d	8000	Novo mesto
00050000-5588-ffa7-12f3-2a6bed3f759c	8001	Novo mesto - poštni predali
00050000-5588-ffa7-56e5-5b9b9420a5aa	6243	Obrov
00050000-5588-ffa7-67fd-2d13b0dd1162	9233	Odranci
00050000-5588-ffa7-5b4e-51dd0e68a502	2317	Oplotnica
00050000-5588-ffa7-f79a-b8a54e3b1b52	2312	Orehova vas
00050000-5588-ffa7-f922-8e4603c5ebe4	2270	Ormož
00050000-5588-ffa7-6f0d-50f877c98b88	1316	Ortnek
00050000-5588-ffa7-400a-0142f1cda201	1337	Osilnica
00050000-5588-ffa7-6783-532898587442	8222	Otočec
00050000-5588-ffa7-4fad-386522e07130	2361	Ožbalt
00050000-5588-ffa7-3186-f0cff3259756	2231	Pernica
00050000-5588-ffa7-a90d-b117f53fb265	2211	Pesnica pri Mariboru
00050000-5588-ffa7-66ba-de9876a4e9e2	9203	Petrovci
00050000-5588-ffa7-3945-e681fdc2eab5	3301	Petrovče
00050000-5588-ffa7-7396-4af25fb7f6aa	6330	Piran/Pirano
00050000-5588-ffa7-e094-177b530186c6	8255	Pišece
00050000-5588-ffa7-5435-a0798de0cff4	6257	Pivka
00050000-5588-ffa7-f320-a09f00d72ec0	6232	Planina
00050000-5588-ffa7-15fe-64e2402fc098	3225	Planina pri Sevnici
00050000-5588-ffa7-7e23-83b3375d1575	6276	Pobegi
00050000-5588-ffa7-740f-21190239180b	8312	Podbočje
00050000-5588-ffa7-9660-f5b4dcdbba7e	5243	Podbrdo
00050000-5588-ffa7-a5e9-6043e318d175	3254	Podčetrtek
00050000-5588-ffa7-3ab3-dc261795c61b	2273	Podgorci
00050000-5588-ffa7-1882-59d3f4a4e255	6216	Podgorje
00050000-5588-ffa7-4b68-5783d0a13234	2381	Podgorje pri Slovenj Gradcu
00050000-5588-ffa7-0003-caa6c138ed8a	6244	Podgrad
00050000-5588-ffa7-1167-a2be13256cba	1414	Podkum
00050000-5588-ffa7-1466-744d43c2cc2d	2286	Podlehnik
00050000-5588-ffa7-db62-d0ef18972105	5272	Podnanos
00050000-5588-ffa7-6c4d-045c98fde740	4244	Podnart
00050000-5588-ffa7-6a8e-c89d412c6e9e	3241	Podplat
00050000-5588-ffa7-5384-cc790ab88c7b	3257	Podsreda
00050000-5588-ffa7-2ade-7ebc6b65fcd7	2363	Podvelka
00050000-5588-ffa7-4f37-ef6d4b86f4d9	2208	Pohorje
00050000-5588-ffa7-4a0c-5d68986bfcba	2257	Polenšak
00050000-5588-ffa7-2d43-6643053fb7f4	1355	Polhov Gradec
00050000-5588-ffa7-6533-1152c8b03a38	4223	Poljane nad Škofjo Loko
00050000-5588-ffa7-ec47-37c00c12f68b	2319	Poljčane
00050000-5588-ffa7-b2ad-5ab7054aca62	1272	Polšnik
00050000-5588-ffa7-e901-53814be89a51	3313	Polzela
00050000-5588-ffa7-f629-c72a1c5aa3bb	3232	Ponikva
00050000-5588-ffa7-5401-7466a31fe1a3	6320	Portorož/Portorose
00050000-5588-ffa7-c621-23a673e9669a	6230	Postojna
00050000-5588-ffa7-adc7-95d84151d48c	2331	Pragersko
00050000-5588-ffa7-4a3d-f5db7a2a1441	3312	Prebold
00050000-5588-ffa7-06f1-0a2730bf7e89	4205	Preddvor
00050000-5588-ffa7-13ce-987de66d7b03	6255	Prem
00050000-5588-ffa7-3cb2-d7a741ddb788	1352	Preserje
00050000-5588-ffa7-8f44-3be40503bf8a	6258	Prestranek
00050000-5588-ffa7-8c2b-edcfc9d5f434	2391	Prevalje
00050000-5588-ffa7-7cd8-15faf1eff2e4	3262	Prevorje
00050000-5588-ffa7-fdc5-cc56f589fc16	1276	Primskovo 
00050000-5588-ffa7-05b4-17e7c0608b9e	3253	Pristava pri Mestinju
00050000-5588-ffa7-48e3-e6fce73a0afb	9207	Prosenjakovci/Partosfalva
00050000-5588-ffa7-05eb-13b5793f0632	5297	Prvačina
00050000-5588-ffa7-7782-6f91e3dcbd02	2250	Ptuj
00050000-5588-ffa7-32cd-8f62380dfbae	2323	Ptujska Gora
00050000-5588-ffa7-9e2f-4fb3923b771e	9201	Puconci
00050000-5588-ffa7-efc8-a11d5e09638d	2327	Rače
00050000-5588-ffa7-88ea-2b6bf4483868	1433	Radeče
00050000-5588-ffa7-f213-fd4af2b6b14b	9252	Radenci
00050000-5588-ffa7-b917-469abfb1cac6	2360	Radlje ob Dravi
00050000-5588-ffa7-7d56-94eb59bc81e6	1235	Radomlje
00050000-5588-ffa7-9681-48d997f27ef0	4240	Radovljica
00050000-5588-ffa7-c0ba-c8d0b343af3d	8274	Raka
00050000-5588-ffa7-29f0-a8e475988268	1381	Rakek
00050000-5588-ffa7-3f17-64915a8e6828	4283	Rateče - Planica
00050000-5588-ffa7-2a92-725526c2e124	2390	Ravne na Koroškem
00050000-5588-ffa7-9910-6824a200cec3	9246	Razkrižje
00050000-5588-ffa7-4f83-c4ca2908e0ad	3332	Rečica ob Savinji
00050000-5588-ffa7-1dc4-0d127fcb2507	5292	Renče
00050000-5588-ffa7-3a9a-c8c7b56a3902	1310	Ribnica
00050000-5588-ffa7-5497-24de3233905d	2364	Ribnica na Pohorju
00050000-5588-ffa7-ae2a-bfd572527782	3272	Rimske Toplice
00050000-5588-ffa7-f422-c88426838bfb	1314	Rob
00050000-5588-ffa7-5f05-891490e1e8d1	5215	Ročinj
00050000-5588-ffa7-8985-2aa70d23cd55	3250	Rogaška Slatina
00050000-5588-ffa7-675d-82ba324ee0c1	9262	Rogašovci
00050000-5588-ffa7-2623-380c5a48bdbb	3252	Rogatec
00050000-5588-ffa7-aa3b-c89619be7eb8	1373	Rovte
00050000-5588-ffa7-8a79-407995eb0b05	2342	Ruše
00050000-5588-ffa7-f2f6-78eecbbd7aa9	1282	Sava
00050000-5588-ffa7-5140-a11ec5b8edc0	6333	Sečovlje/Sicciole
00050000-5588-ffa7-a722-ef235c3d0982	4227	Selca
00050000-5588-ffa7-fa5d-d735eb5d2232	2352	Selnica ob Dravi
00050000-5588-ffa7-88ed-60d8f1877deb	8333	Semič
00050000-5588-ffa7-4a12-ecb42f816dd5	8281	Senovo
00050000-5588-ffa7-93de-ab0771f00f5d	6224	Senožeče
00050000-5588-ffa7-4d85-8cb814b3a294	8290	Sevnica
00050000-5588-ffa7-320b-033f08031cb9	6210	Sežana
00050000-5588-ffa7-f4d8-04eda956baad	2214	Sladki Vrh
00050000-5588-ffa7-b309-1e35a5ea1f40	5283	Slap ob Idrijci
00050000-5588-ffa7-45dd-ea5469c96f11	2380	Slovenj Gradec
00050000-5588-ffa7-1030-822cdb48ce9c	2310	Slovenska Bistrica
00050000-5588-ffa7-4c22-3f8ceccfe5f5	3210	Slovenske Konjice
00050000-5588-ffa7-c19e-b1260ce79f95	1216	Smlednik
00050000-5588-ffa7-3881-af8342ec3f28	5232	Soča
00050000-5588-ffa7-4437-83fc9a85ecf5	1317	Sodražica
00050000-5588-ffa7-efb9-db8066e0b96d	3335	Solčava
00050000-5588-ffa7-0ae2-4ade171d8065	5250	Solkan
00050000-5588-ffa7-5221-0c0c4ef6878c	4229	Sorica
00050000-5588-ffa7-61fb-571a6dcdcb80	4225	Sovodenj
00050000-5588-ffa7-2368-a1d5165ac90d	5281	Spodnja Idrija
00050000-5588-ffa7-820e-515ea5ee2cc4	2241	Spodnji Duplek
00050000-5588-ffa7-755f-c56d61a136e5	9245	Spodnji Ivanjci
00050000-5588-ffa7-8654-a71931397ec8	2277	Središče ob Dravi
00050000-5588-ffa7-3b4b-e67f0cb6dee4	4267	Srednja vas v Bohinju
00050000-5588-ffa7-ffa6-eb14d0cb614f	8256	Sromlje 
00050000-5588-ffa7-d433-a9a2556223cf	5224	Srpenica
00050000-5588-ffa7-d5d0-4a601221717d	1242	Stahovica
00050000-5588-ffa7-2869-7436fea50758	1332	Stara Cerkev
00050000-5588-ffa7-108d-2a9d7ef37817	8342	Stari trg ob Kolpi
00050000-5588-ffa7-e77e-ae0b60561e04	1386	Stari trg pri Ložu
00050000-5588-ffa7-9ed0-92379f0131aa	2205	Starše
00050000-5588-ffa7-0f1c-d9ee17b1f66a	2289	Stoperce
00050000-5588-ffa7-bb7e-02207b9018eb	8322	Stopiče
00050000-5588-ffa7-a429-50cf1f4d36c3	3206	Stranice
00050000-5588-ffa7-bec8-ad5509553e48	8351	Straža
00050000-5588-ffa7-0abc-72113dda4d0e	1313	Struge
00050000-5588-ffa7-040b-d9354df65d6c	8293	Studenec
00050000-5588-ffa7-4296-a3b077fafda1	8331	Suhor
00050000-5588-ffa7-6d21-52936532aba1	2233	Sv. Ana v Slovenskih goricah
00050000-5588-ffa7-8ae1-15f886950fbf	2235	Sv. Trojica v Slovenskih goricah
00050000-5588-ffa7-9137-d7e66dbd683e	2353	Sveti Duh na Ostrem Vrhu
00050000-5588-ffa7-6e79-e4e59d5a15d4	9244	Sveti Jurij ob Ščavnici
00050000-5588-ffa7-d412-8cf656ca7177	3264	Sveti Štefan
00050000-5588-ffa7-263f-cff361508c98	2258	Sveti Tomaž
00050000-5588-ffa7-5ecb-00458f6aff2f	9204	Šalovci
00050000-5588-ffa7-df76-066af37ef3e1	5261	Šempas
00050000-5588-ffa7-fad2-9d2e988f298b	5290	Šempeter pri Gorici
00050000-5588-ffa7-7ebe-c8141d1a07da	3311	Šempeter v Savinjski dolini
00050000-5588-ffa7-6921-62994dd3cf65	4208	Šenčur
00050000-5588-ffa7-d5ed-2f0296740afc	2212	Šentilj v Slovenskih goricah
00050000-5588-ffa7-fa73-258dea515472	8297	Šentjanž
00050000-5588-ffa7-c820-51de700090d6	2373	Šentjanž pri Dravogradu
00050000-5588-ffa7-97ee-c97abc1786b4	8310	Šentjernej
00050000-5588-ffa7-0c6c-e06e71b97e95	3230	Šentjur
00050000-5588-ffa7-eecb-492e692c1f1e	3271	Šentrupert
00050000-5588-ffa7-9242-ed29b16cb81f	8232	Šentrupert
00050000-5588-ffa7-c1cf-071059f726a9	1296	Šentvid pri Stični
00050000-5588-ffa7-a56a-735fc47b7e87	8275	Škocjan
00050000-5588-ffa7-4848-e3f1ace58ab6	6281	Škofije
00050000-5588-ffa7-d3cc-cadeba9da3e2	4220	Škofja Loka
00050000-5588-ffa7-d9f6-8c8628882b3e	3211	Škofja vas
00050000-5588-ffa7-aa51-7bb5e61171a5	1291	Škofljica
00050000-5588-ffa7-2e91-718dc2dd08cd	6274	Šmarje
00050000-5588-ffa7-774a-c752dbba4818	1293	Šmarje - Sap
00050000-5588-ffa7-a478-2be9c1b8f709	3240	Šmarje pri Jelšah
00050000-5588-ffa7-b54a-cfd0f643b293	8220	Šmarješke Toplice
00050000-5588-ffa7-bc54-82899a284ec3	2315	Šmartno na Pohorju
00050000-5588-ffa7-6916-95314d17a576	3341	Šmartno ob Dreti
00050000-5588-ffa7-fa85-d25fe6390c12	3327	Šmartno ob Paki
00050000-5588-ffa7-0f42-483acf5baf81	1275	Šmartno pri Litiji
00050000-5588-ffa7-b233-1d041244cbe7	2383	Šmartno pri Slovenj Gradcu
00050000-5588-ffa7-b20f-84fa55dc336f	3201	Šmartno v Rožni dolini
00050000-5588-ffa7-e5c1-6f865db63786	3325	Šoštanj
00050000-5588-ffa7-8fcc-9f11bed063a1	6222	Štanjel
00050000-5588-ffa7-5bff-14d4e2b0d064	3220	Štore
00050000-5588-ffa7-f22a-dc950d72169a	3304	Tabor
00050000-5588-ffa7-451b-c746c48dcc94	3221	Teharje
00050000-5588-ffa7-c5ea-4cfd41346763	9251	Tišina
00050000-5588-ffa7-007a-2eb9370a1836	5220	Tolmin
00050000-5588-ffa7-dc50-5da16865a065	3326	Topolšica
00050000-5588-ffa7-d9dc-d5162b2ae7b2	2371	Trbonje
00050000-5588-ffa7-d72a-5540d33205da	1420	Trbovlje
00050000-5588-ffa7-7550-03c4bc24c5af	8231	Trebelno 
00050000-5588-ffa7-2aea-2b368a0b0ce3	8210	Trebnje
00050000-5588-ffa7-f6bd-fc65c1cf21b1	5252	Trnovo pri Gorici
00050000-5588-ffa7-de88-544066ea49cf	2254	Trnovska vas
00050000-5588-ffa7-4704-a99327addead	1222	Trojane
00050000-5588-ffa7-c5c9-81c9f5e66386	1236	Trzin
00050000-5588-ffa7-4e86-35181d426334	4290	Tržič
00050000-5588-ffa7-4370-517595a716d1	8295	Tržišče
00050000-5588-ffa7-3331-efe7e3477e2e	1311	Turjak
00050000-5588-ffa7-d9c1-8e36fe0198d0	9224	Turnišče
00050000-5588-ffa7-e1fb-5ff48ec59242	8323	Uršna sela
00050000-5588-ffa7-196e-cabe82c03733	1252	Vače
00050000-5588-ffa7-4359-c1c6413c99d2	3320	Velenje 
00050000-5588-ffa7-b9c3-e285ad675b90	3322	Velenje - poštni predali
00050000-5588-ffa7-99a5-1c6b1d4249d0	8212	Velika Loka
00050000-5588-ffa7-7f65-d38103c51d71	2274	Velika Nedelja
00050000-5588-ffa7-b60c-76e9413c6598	9225	Velika Polana
00050000-5588-ffa7-7759-1ad5ae27f0ff	1315	Velike Lašče
00050000-5588-ffa7-f776-2697caf2dff8	8213	Veliki Gaber
00050000-5588-ffa7-96f2-d8c07cd55d30	9241	Veržej
00050000-5588-ffa7-ed8b-65b9efd3d308	1312	Videm - Dobrepolje
00050000-5588-ffa7-8f7d-f8f00f0a51f7	2284	Videm pri Ptuju
00050000-5588-ffa7-32d2-4c1eb8629046	8344	Vinica
00050000-5588-ffa7-2808-900d827a6028	5271	Vipava
00050000-5588-ffa7-e337-d98d1640ed3a	4212	Visoko
00050000-5588-ffa7-1385-c0d30d30ad52	1294	Višnja Gora
00050000-5588-ffa7-7817-2d70cce63b27	3205	Vitanje
00050000-5588-ffa7-b9d0-c1e3ae35094f	2255	Vitomarci
00050000-5588-ffa7-7173-786845239dd8	1217	Vodice
00050000-5588-ffa7-d2c5-c7a3b0f69b6b	3212	Vojnik\t
00050000-5588-ffa7-42ba-244cab985a0c	5293	Volčja Draga
00050000-5588-ffa7-ab69-f996db66de63	2232	Voličina
00050000-5588-ffa7-1e3e-8104d2e57302	3305	Vransko
00050000-5588-ffa7-361a-b27a66363272	6217	Vremski Britof
00050000-5588-ffa7-5026-fc058f2ae003	1360	Vrhnika
00050000-5588-ffa7-8800-62ab210f856d	2365	Vuhred
00050000-5588-ffa7-3a14-7cf7b4857fe3	2367	Vuzenica
00050000-5588-ffa7-b44c-3f97d0529e23	8292	Zabukovje 
00050000-5588-ffa7-66db-917dfc380ce3	1410	Zagorje ob Savi
00050000-5588-ffa7-ede9-6ec491807140	1303	Zagradec
00050000-5588-ffa7-2044-d01b83a8ceee	2283	Zavrč
00050000-5588-ffa7-0a3d-78852f406666	8272	Zdole 
00050000-5588-ffa7-7580-799c9bd52182	4201	Zgornja Besnica
00050000-5588-ffa7-14bc-970a519fb1c6	2242	Zgornja Korena
00050000-5588-ffa7-3458-f4ddb63121f8	2201	Zgornja Kungota
00050000-5588-ffa7-45a3-129ec59654d6	2316	Zgornja Ložnica
00050000-5588-ffa7-724e-a748a09e564a	2314	Zgornja Polskava
00050000-5588-ffa7-c04a-38c72684ee57	2213	Zgornja Velka
00050000-5588-ffa7-b61b-25bc81171b77	4247	Zgornje Gorje
00050000-5588-ffa7-885d-dd178ac9627a	4206	Zgornje Jezersko
00050000-5588-ffa7-27ec-fe9320fb8878	2285	Zgornji Leskovec
00050000-5588-ffa7-0ce0-a355d529a085	1432	Zidani Most
00050000-5588-ffa7-f2eb-ba75a390c690	3214	Zreče
00050000-5588-ffa7-a532-d2c92f4f9d36	4209	Žabnica
00050000-5588-ffa7-777a-4776a3098da2	3310	Žalec
00050000-5588-ffa7-0be2-b20a65b25634	4228	Železniki
00050000-5588-ffa7-ee56-e79356938db8	2287	Žetale
00050000-5588-ffa7-2888-c06826278dc1	4226	Žiri
00050000-5588-ffa7-63f3-c6fb82e90d9b	4274	Žirovnica
00050000-5588-ffa7-7416-5c591f7b6d36	8360	Žužemberk
\.


--
-- TOC entry 2869 (class 0 OID 7981799)
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
-- TOC entry 2851 (class 0 OID 7981610)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 7981688)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2871 (class 0 OID 7981811)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 7981931)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantieme, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2888 (class 0 OID 7981984)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5588-ffa8-c9b1-345f470c6eec	00080000-5588-ffa8-3889-6323413f7b4c	0900	AK
00190000-5588-ffa9-cf04-604b97ab6a13	00080000-5588-ffa8-dda0-e8d5784b4999	0987	A
00190000-5588-ffa9-6ead-50b25c19b13b	00080000-5588-ffa8-1ba9-082498caacfa	0989	A
\.


--
-- TOC entry 2895 (class 0 OID 7982120)
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
-- TOC entry 2875 (class 0 OID 7981840)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5588-ffa8-604d-0f5386f5769c	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5588-ffa8-4c5f-93d2c96d2cff	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5588-ffa8-7f5f-dca11ab01f48	0003	Kazinska	t	84	Kazinska dvorana
00220000-5588-ffa8-464d-63b4d1c1d4d7	0004	Mali oder	t	24	Mali oder 
00220000-5588-ffa8-5fad-760726dc7586	0005	Komorni oder	t	15	Komorni oder
00220000-5588-ffa8-27e4-e70e0e1bdfcc	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5588-ffa8-f282-95b32fbcb14b	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2867 (class 0 OID 7981784)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 7981774)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 7981973)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 7981908)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 7981482)
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
-- TOC entry 2876 (class 0 OID 7981850)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2844 (class 0 OID 7981520)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5588-ffa7-1232-c0f9443d4270	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5588-ffa7-8a88-10a5835d90e9	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5588-ffa7-dc7b-0cb9806b2708	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5588-ffa7-2b07-632334aef4d3	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5588-ffa7-1c16-03eb7b4911ca	planer	Planer dogodkov v koledarju	t
00020000-5588-ffa7-5dd2-b64c9b3e8cf1	kadrovska	Kadrovska služba	t
00020000-5588-ffa7-ecfa-f5c527140625	arhivar	Ažuriranje arhivalij	t
00020000-5588-ffa7-1afa-7bf913409a6a	igralec	Igralec	t
00020000-5588-ffa7-2a6a-c65ca8f9711c	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5588-ffa8-acc1-fd45f20a658c	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2842 (class 0 OID 7981504)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5588-ffa7-e3ca-46ea7d94ff52	00020000-5588-ffa7-dc7b-0cb9806b2708
00010000-5588-ffa7-6ae6-ab7f95b278f4	00020000-5588-ffa7-dc7b-0cb9806b2708
00010000-5588-ffa8-e0ee-68c27a780341	00020000-5588-ffa8-acc1-fd45f20a658c
\.


--
-- TOC entry 2878 (class 0 OID 7981864)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 7981805)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 7981755)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 7982157)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5588-ffa7-7d79-c4d9849193b4	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5588-ffa7-3c53-03364cdbfdcd	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5588-ffa7-2099-3749b2042960	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5588-ffa7-5062-8675438018aa	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5588-ffa7-dc64-54f71d5d8880	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2898 (class 0 OID 7982149)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5588-ffa7-fd10-564024331dea	00230000-5588-ffa7-5062-8675438018aa	popa
00240000-5588-ffa7-5269-94879c1c7a38	00230000-5588-ffa7-5062-8675438018aa	oseba
00240000-5588-ffa7-eec3-3a65894b4c62	00230000-5588-ffa7-3c53-03364cdbfdcd	prostor
00240000-5588-ffa7-cd04-53d6ca9bb272	00230000-5588-ffa7-5062-8675438018aa	besedilo
00240000-5588-ffa7-0796-2dec14b6d548	00230000-5588-ffa7-5062-8675438018aa	uprizoritev
00240000-5588-ffa7-c8b4-e052c3f69046	00230000-5588-ffa7-5062-8675438018aa	funkcija
00240000-5588-ffa7-a251-4f5b5bd122e4	00230000-5588-ffa7-5062-8675438018aa	tipfunkcije
00240000-5588-ffa7-63e9-9c9f5b45a795	00230000-5588-ffa7-5062-8675438018aa	alternacija
00240000-5588-ffa7-3de9-3686bbe9454b	00230000-5588-ffa7-7d79-c4d9849193b4	pogodba
00240000-5588-ffa7-b466-38ede735ee64	00230000-5588-ffa7-5062-8675438018aa	zaposlitev
\.


--
-- TOC entry 2897 (class 0 OID 7982144)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 7981918)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5588-ffa9-a45c-9cd3eff1d326	000e0000-5588-ffa9-e3d3-df052744cbb9	00080000-5588-ffa8-6eaf-f848786e916f	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5588-ffa9-28f9-fe0b760d47b4	000e0000-5588-ffa9-e3d3-df052744cbb9	00080000-5588-ffa8-6eaf-f848786e916f	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5588-ffa9-aa41-e4ec16b85e20	000e0000-5588-ffa9-e3d3-df052744cbb9	00080000-5588-ffa8-ae1d-4fa364b649c6	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2849 (class 0 OID 7981582)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 7981761)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5588-ffa9-ed75-456534f6ca89	00180000-5588-ffa9-2308-bd5b7794d97e	000c0000-5588-ffa9-29af-eff752060cff	00090000-5588-ffa8-1b09-0a8864eac1a4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5588-ffa9-dd1c-3ea240d87788	00180000-5588-ffa9-2308-bd5b7794d97e	000c0000-5588-ffa9-898a-0a31842ba559	00090000-5588-ffa8-6c34-69c38888520f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5588-ffa9-299b-3ca98149db3e	00180000-5588-ffa9-2308-bd5b7794d97e	000c0000-5588-ffa9-1c76-5f8fff255d63	00090000-5588-ffa8-64b8-a9ce73d6e3a7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5588-ffa9-48a3-d41819edaf6b	00180000-5588-ffa9-2308-bd5b7794d97e	000c0000-5588-ffa9-e7d9-90d383eb31f8	00090000-5588-ffa8-b7fb-dbb0ac6fa315	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5588-ffa9-f3b3-30a9cd440a7a	00180000-5588-ffa9-2308-bd5b7794d97e	000c0000-5588-ffa9-94a9-20e08ddd0394	00090000-5588-ffa8-daed-8772cebada11	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5588-ffa9-f4d7-a14cb37ad539	00180000-5588-ffa9-28f5-16b526f53093	\N	00090000-5588-ffa8-daed-8772cebada11	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2886 (class 0 OID 7981962)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5588-ffa7-5160-7f37760d5e15	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5588-ffa7-e827-34f73206badf	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5588-ffa7-93d9-7e6927fbf878	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5588-ffa7-21b8-2e3b830be6a4	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5588-ffa7-ad0c-00694e1dce42	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5588-ffa7-11db-665ae84b6bd0	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5588-ffa7-4451-7d842099249b	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5588-ffa7-6663-f451c4ab7466	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5588-ffa7-4097-9ad04569a2fa	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5588-ffa7-9c89-15b371779302	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5588-ffa7-9475-f1c78b209fdc	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5588-ffa7-43ad-d14a33cd6be6	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5588-ffa7-49da-198ffebeb1b2	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5588-ffa7-c4ba-96ab5585157e	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5588-ffa7-accf-294b31a22807	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5588-ffa7-412a-c184831a814a	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2896 (class 0 OID 7982133)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5588-ffa7-9dbb-5a98f6bd6d1a	01	Velika predstava	f	1.00	1.00
002b0000-5588-ffa7-f575-0bcdfcf7c52f	02	Mala predstava	f	0.50	0.50
002b0000-5588-ffa7-2153-3d6b0416fca4	03	Mala koprodukcija	t	0.40	1.00
002b0000-5588-ffa7-3208-a1af117e312a	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5588-ffa7-aac2-8914e0e7a3aa	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2854 (class 0 OID 7981645)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 7981491)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5588-ffa7-6ae6-ab7f95b278f4	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO06Xg3zfx8t4e7LCuUjGjxQhOo9LjYvG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5588-ffa8-a1a6-c844f69b408b	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5588-ffa8-0112-c3a73fccdeec	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5588-ffa8-52ef-7b93c76a0ac5	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5588-ffa8-c9ab-b9276cd2b2c1	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5588-ffa8-7767-c5c5b273a5ef	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5588-ffa8-15e0-d7f58bc6555e	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5588-ffa8-0da6-29d09112d406	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5588-ffa8-5b5d-3b29ae0e2425	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5588-ffa8-f4e4-92f16cd336fd	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5588-ffa8-e0ee-68c27a780341	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5588-ffa7-e3ca-46ea7d94ff52	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2891 (class 0 OID 7982019)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5588-ffa9-74c6-9eb3bb254d34	00160000-5588-ffa8-b3af-47a9778f6be8	00150000-5588-ffa7-e675-8fd3cf632c93	00140000-5588-ffa6-0c6a-af9656fe8cb5	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5588-ffa8-5fad-760726dc7586
000e0000-5588-ffa9-e3d3-df052744cbb9	00160000-5588-ffa8-bf95-0f3a9bcb6f8e	00150000-5588-ffa7-56cf-ab49e9623919	00140000-5588-ffa6-9e5b-8e67460b3e31	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5588-ffa8-27e4-e70e0e1bdfcc
000e0000-5588-ffa9-e74d-b96e654e81ec	\N	00150000-5588-ffa7-56cf-ab49e9623919	00140000-5588-ffa6-9e5b-8e67460b3e31	00190000-5588-ffa9-cf04-604b97ab6a13	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5588-ffa8-5fad-760726dc7586
000e0000-5588-ffa9-d457-746aed57a793	\N	00150000-5588-ffa7-56cf-ab49e9623919	00140000-5588-ffa6-9e5b-8e67460b3e31	00190000-5588-ffa9-cf04-604b97ab6a13	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5588-ffa8-5fad-760726dc7586
\.


--
-- TOC entry 2859 (class 0 OID 7981707)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5588-ffa9-3980-3b55ee9c047d	000e0000-5588-ffa9-e3d3-df052744cbb9	1	
00200000-5588-ffa9-4965-404a846f1152	000e0000-5588-ffa9-e3d3-df052744cbb9	2	
\.


--
-- TOC entry 2874 (class 0 OID 7981832)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 7981901)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 7981739)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 7982009)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5588-ffa6-0c6a-af9656fe8cb5	01	Drama	drama (SURS 01)
00140000-5588-ffa6-2443-062b8121200a	02	Opera	opera (SURS 02)
00140000-5588-ffa6-b2b2-51dd14dcdc23	03	Balet	balet (SURS 03)
00140000-5588-ffa6-693d-079a9046d62a	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5588-ffa6-77b4-83924bc28e8a	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5588-ffa6-9e5b-8e67460b3e31	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5588-ffa6-bf26-0ae29cff53b4	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2880 (class 0 OID 7981891)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5588-ffa7-7489-065a22453599	01	Opera	opera
00150000-5588-ffa7-8720-cca39e288651	02	Opereta	opereta
00150000-5588-ffa7-2c6a-1e46641fd744	03	Balet	balet
00150000-5588-ffa7-9bba-9c81cfe8dead	04	Plesne prireditve	plesne prireditve
00150000-5588-ffa7-76c5-c58a84017761	05	Lutkovno gledališče	lutkovno gledališče
00150000-5588-ffa7-93a5-a1470253377b	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5588-ffa7-0d15-01a40b05b5d7	07	Biografska drama	biografska drama
00150000-5588-ffa7-e675-8fd3cf632c93	08	Komedija	komedija
00150000-5588-ffa7-41d1-aa9eaa1c1ccf	09	Črna komedija	črna komedija
00150000-5588-ffa7-ba9d-434f98a289f6	10	E-igra	E-igra
00150000-5588-ffa7-56cf-ab49e9623919	11	Kriminalka	kriminalka
00150000-5588-ffa7-3779-28c9acf8b41d	12	Musical	musical
\.


--
-- TOC entry 2435 (class 2606 OID 7981545)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 7982066)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 7982056)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 7981961)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 7981729)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 7981754)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 7981671)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 7982115)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 7981887)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 7981705)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 7981748)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 7981685)
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
-- TOC entry 2527 (class 2606 OID 7981797)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 7981824)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 7981643)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 7981554)
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
-- TOC entry 2442 (class 2606 OID 7981578)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 7981534)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2426 (class 2606 OID 7981519)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 7981830)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 7981863)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 7982004)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2451 (class 2606 OID 7981607)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 7981631)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 7981803)
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
-- TOC entry 2457 (class 2606 OID 7981621)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 7981692)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 7981815)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 7981943)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 7981989)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 7982131)
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
-- TOC entry 2547 (class 2606 OID 7981847)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 7981788)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 7981779)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 7981983)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 7981915)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 7981490)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 7981854)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 7981508)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2428 (class 2606 OID 7981528)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 7981872)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 7981810)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 7981760)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 7982166)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 7982154)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 7982148)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 7981928)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 7981587)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 7981770)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 7981972)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 7982143)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 7981656)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 7981503)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 7982035)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 7981714)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 7981838)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 7981906)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 7981743)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 7982017)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 7981899)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 1259 OID 7981736)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2575 (class 1259 OID 7981929)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2576 (class 1259 OID 7981930)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2449 (class 1259 OID 7981609)
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
-- TOC entry 2540 (class 1259 OID 7981831)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2534 (class 1259 OID 7981817)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2535 (class 1259 OID 7981816)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2486 (class 1259 OID 7981715)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2562 (class 1259 OID 7981888)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2563 (class 1259 OID 7981890)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2564 (class 1259 OID 7981889)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2474 (class 1259 OID 7981687)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2475 (class 1259 OID 7981686)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 7982006)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 7982007)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2595 (class 1259 OID 7982008)
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
-- TOC entry 2602 (class 1259 OID 7982040)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2603 (class 1259 OID 7982037)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2604 (class 1259 OID 7982041)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2605 (class 1259 OID 7982039)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2606 (class 1259 OID 7982038)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2464 (class 1259 OID 7981658)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 7981657)
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
-- TOC entry 2440 (class 1259 OID 7981581)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2550 (class 1259 OID 7981855)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2504 (class 1259 OID 7981749)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2430 (class 1259 OID 7981535)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2431 (class 1259 OID 7981536)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2555 (class 1259 OID 7981875)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2556 (class 1259 OID 7981874)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2557 (class 1259 OID 7981873)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2478 (class 1259 OID 7981693)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2479 (class 1259 OID 7981695)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2480 (class 1259 OID 7981694)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2635 (class 1259 OID 7982156)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2514 (class 1259 OID 7981783)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2515 (class 1259 OID 7981781)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2516 (class 1259 OID 7981780)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2517 (class 1259 OID 7981782)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2421 (class 1259 OID 7981509)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2422 (class 1259 OID 7981510)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2543 (class 1259 OID 7981839)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2529 (class 1259 OID 7981804)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2571 (class 1259 OID 7981916)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2572 (class 1259 OID 7981917)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2624 (class 1259 OID 7982119)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2625 (class 1259 OID 7982116)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2626 (class 1259 OID 7982117)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2627 (class 1259 OID 7982118)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2453 (class 1259 OID 7981623)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2454 (class 1259 OID 7981622)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2455 (class 1259 OID 7981624)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2414 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2579 (class 1259 OID 7981944)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2580 (class 1259 OID 7981945)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2616 (class 1259 OID 7982070)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2617 (class 1259 OID 7982072)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2618 (class 1259 OID 7982068)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2619 (class 1259 OID 7982071)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2620 (class 1259 OID 7982069)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2568 (class 1259 OID 7981907)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 7981792)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2521 (class 1259 OID 7981791)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2522 (class 1259 OID 7981789)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2523 (class 1259 OID 7981790)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2392 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2612 (class 1259 OID 7982058)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2613 (class 1259 OID 7982057)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2628 (class 1259 OID 7982132)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2485 (class 1259 OID 7981706)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2436 (class 1259 OID 7981556)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2437 (class 1259 OID 7981555)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2445 (class 1259 OID 7981588)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2446 (class 1259 OID 7981589)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2509 (class 1259 OID 7981773)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2510 (class 1259 OID 7981772)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2511 (class 1259 OID 7981771)
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
-- TOC entry 2492 (class 1259 OID 7981738)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2493 (class 1259 OID 7981734)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2494 (class 1259 OID 7981731)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2495 (class 1259 OID 7981732)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2496 (class 1259 OID 7981730)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2497 (class 1259 OID 7981735)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2498 (class 1259 OID 7981733)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2452 (class 1259 OID 7981608)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 7981672)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 7981674)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2472 (class 1259 OID 7981673)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2473 (class 1259 OID 7981675)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2528 (class 1259 OID 7981798)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2598 (class 1259 OID 7982005)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2607 (class 1259 OID 7982036)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2443 (class 1259 OID 7981579)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2444 (class 1259 OID 7981580)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2565 (class 1259 OID 7981900)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2641 (class 1259 OID 7982167)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2463 (class 1259 OID 7981644)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2638 (class 1259 OID 7982155)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2548 (class 1259 OID 7981849)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2549 (class 1259 OID 7981848)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 7982067)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2395 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2460 (class 1259 OID 7981632)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2599 (class 1259 OID 7982018)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 7981990)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 7981991)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2429 (class 1259 OID 7981529)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2499 (class 1259 OID 7981737)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2667 (class 2606 OID 7982303)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2670 (class 2606 OID 7982288)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2669 (class 2606 OID 7982293)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2665 (class 2606 OID 7982313)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2671 (class 2606 OID 7982283)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2666 (class 2606 OID 7982308)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2668 (class 2606 OID 7982298)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2701 (class 2606 OID 7982458)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2700 (class 2606 OID 7982463)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2652 (class 2606 OID 7982218)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2688 (class 2606 OID 7982398)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2686 (class 2606 OID 7982393)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2687 (class 2606 OID 7982388)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2664 (class 2606 OID 7982278)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2696 (class 2606 OID 7982428)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2694 (class 2606 OID 7982438)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2695 (class 2606 OID 7982433)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2658 (class 2606 OID 7982253)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2659 (class 2606 OID 7982248)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2684 (class 2606 OID 7982378)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2707 (class 2606 OID 7982483)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2706 (class 2606 OID 7982488)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2705 (class 2606 OID 7982493)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2709 (class 2606 OID 7982513)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2712 (class 2606 OID 7982498)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2708 (class 2606 OID 7982518)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2710 (class 2606 OID 7982508)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2711 (class 2606 OID 7982503)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2656 (class 2606 OID 7982243)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2657 (class 2606 OID 7982238)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2648 (class 2606 OID 7982203)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2649 (class 2606 OID 7982198)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2690 (class 2606 OID 7982408)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2672 (class 2606 OID 7982318)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2645 (class 2606 OID 7982178)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2644 (class 2606 OID 7982183)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2691 (class 2606 OID 7982423)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2692 (class 2606 OID 7982418)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2693 (class 2606 OID 7982413)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2662 (class 2606 OID 7982258)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2660 (class 2606 OID 7982268)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2661 (class 2606 OID 7982263)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2725 (class 2606 OID 7982583)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2676 (class 2606 OID 7982353)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2678 (class 2606 OID 7982343)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2679 (class 2606 OID 7982338)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2677 (class 2606 OID 7982348)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2643 (class 2606 OID 7982168)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2642 (class 2606 OID 7982173)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2689 (class 2606 OID 7982403)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2685 (class 2606 OID 7982383)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2699 (class 2606 OID 7982448)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2698 (class 2606 OID 7982453)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2720 (class 2606 OID 7982573)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2723 (class 2606 OID 7982558)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2722 (class 2606 OID 7982563)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2721 (class 2606 OID 7982568)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2654 (class 2606 OID 7982228)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2655 (class 2606 OID 7982223)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2653 (class 2606 OID 7982233)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2703 (class 2606 OID 7982468)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2702 (class 2606 OID 7982473)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2717 (class 2606 OID 7982543)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2715 (class 2606 OID 7982553)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2719 (class 2606 OID 7982533)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2716 (class 2606 OID 7982548)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2718 (class 2606 OID 7982538)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2697 (class 2606 OID 7982443)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2680 (class 2606 OID 7982373)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2681 (class 2606 OID 7982368)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2683 (class 2606 OID 7982358)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2682 (class 2606 OID 7982363)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2713 (class 2606 OID 7982528)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2714 (class 2606 OID 7982523)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2724 (class 2606 OID 7982578)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2663 (class 2606 OID 7982273)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2704 (class 2606 OID 7982478)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2646 (class 2606 OID 7982193)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2647 (class 2606 OID 7982188)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2651 (class 2606 OID 7982208)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2650 (class 2606 OID 7982213)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2673 (class 2606 OID 7982333)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2674 (class 2606 OID 7982328)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2675 (class 2606 OID 7982323)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-06-23 08:41:46 CEST

--
-- PostgreSQL database dump complete
--

