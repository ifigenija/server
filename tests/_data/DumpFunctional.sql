--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-23 15:12:32 CEST

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
-- TOC entry 183 (class 1259 OID 8052219)
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
-- TOC entry 230 (class 1259 OID 8052741)
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
-- TOC entry 229 (class 1259 OID 8052724)
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
-- TOC entry 222 (class 1259 OID 8052628)
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
-- TOC entry 197 (class 1259 OID 8052398)
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
-- TOC entry 200 (class 1259 OID 8052432)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8052825)
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
-- TOC entry 192 (class 1259 OID 8052341)
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
-- TOC entry 231 (class 1259 OID 8052755)
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
-- TOC entry 216 (class 1259 OID 8052558)
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
-- TOC entry 195 (class 1259 OID 8052378)
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
-- TOC entry 199 (class 1259 OID 8052426)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8052358)
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
-- TOC entry 205 (class 1259 OID 8052475)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8052500)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8052315)
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
-- TOC entry 184 (class 1259 OID 8052228)
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
-- TOC entry 185 (class 1259 OID 8052239)
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
-- TOC entry 180 (class 1259 OID 8052193)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8052212)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8052507)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8052538)
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
-- TOC entry 226 (class 1259 OID 8052674)
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
-- TOC entry 187 (class 1259 OID 8052272)
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
-- TOC entry 189 (class 1259 OID 8052307)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8052481)
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
-- TOC entry 188 (class 1259 OID 8052292)
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
-- TOC entry 194 (class 1259 OID 8052370)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8052493)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8052613)
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
-- TOC entry 225 (class 1259 OID 8052666)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8052801)
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
-- TOC entry 212 (class 1259 OID 8052522)
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
-- TOC entry 204 (class 1259 OID 8052466)
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
-- TOC entry 203 (class 1259 OID 8052456)
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
-- TOC entry 224 (class 1259 OID 8052655)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8052590)
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
-- TOC entry 177 (class 1259 OID 8052164)
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
-- TOC entry 176 (class 1259 OID 8052162)
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
-- TOC entry 213 (class 1259 OID 8052532)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8052202)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8052186)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8052546)
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
-- TOC entry 207 (class 1259 OID 8052487)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8052437)
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
-- TOC entry 237 (class 1259 OID 8052845)
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
-- TOC entry 236 (class 1259 OID 8052837)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8052832)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8052600)
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
-- TOC entry 186 (class 1259 OID 8052264)
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
-- TOC entry 202 (class 1259 OID 8052443)
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
-- TOC entry 223 (class 1259 OID 8052644)
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
-- TOC entry 233 (class 1259 OID 8052814)
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
-- TOC entry 191 (class 1259 OID 8052327)
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
-- TOC entry 178 (class 1259 OID 8052173)
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
-- TOC entry 228 (class 1259 OID 8052701)
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
-- TOC entry 196 (class 1259 OID 8052389)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8052514)
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
-- TOC entry 218 (class 1259 OID 8052583)
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
-- TOC entry 198 (class 1259 OID 8052421)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8052691)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8052573)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8052167)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2854 (class 0 OID 8052219)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 8052741)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5589-5b3f-7938-1d091875a479	000d0000-5589-5b3f-a59b-a746d915226c	\N	00090000-5589-5b3f-46a1-2ee7d2076435	\N	000b0000-5589-5b3f-c043-c4d2caa48bff	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5589-5b3f-0991-ee2c21c09b63	000d0000-5589-5b3f-bce8-82c60b0c5e13	\N	00090000-5589-5b3f-a9bb-8a7ce4f38937	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5589-5b3f-e49b-4227a1b1ae07	000d0000-5589-5b3f-bcf7-75210e61f078	\N	00090000-5589-5b3f-0df4-1818363d7008	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5589-5b3f-1c0d-1878a41a040e	000d0000-5589-5b3f-7a55-3c72ac0718a8	\N	00090000-5589-5b3f-eb32-46b7b7411746	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5589-5b3f-4c16-568a7d997379	000d0000-5589-5b3f-d06a-1beeaaf2371c	\N	00090000-5589-5b3f-1b6b-24670b688c05	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5589-5b3f-73f1-ec97d04647e1	000d0000-5589-5b3f-46e2-d44daaa2c86c	\N	00090000-5589-5b3f-a9bb-8a7ce4f38937	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2900 (class 0 OID 8052724)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 8052628)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5589-5b3f-9dcc-8d04351807a7	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5589-5b3f-db28-7e8492edde08	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5589-5b3f-2fc9-bb74a50fbbb1	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2868 (class 0 OID 8052398)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5589-5b3f-2b20-99785706a517	\N	\N	00200000-5589-5b3f-0017-ef2a596a4282	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5589-5b3f-dd4d-cab86b355b5e	\N	\N	00200000-5589-5b3f-3d6d-caf1266dcb33	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5589-5b3f-353c-fb28a28a692c	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5589-5b3f-8878-03cd27945b82	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5589-5b3f-9afd-f71d1a2612d4	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2871 (class 0 OID 8052432)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 8052825)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8052341)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5589-5b3d-7ffb-939d51045c5b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5589-5b3d-4ce3-9640bab060ec	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5589-5b3d-eda1-71e5274d3e41	AL	ALB	008	Albania 	Albanija	\N
00040000-5589-5b3d-10ef-c0a663126225	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5589-5b3d-dd53-809ea7f7ed19	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5589-5b3d-cdd6-b9eb70367e38	AD	AND	020	Andorra 	Andora	\N
00040000-5589-5b3d-ce50-ea06481f9d65	AO	AGO	024	Angola 	Angola	\N
00040000-5589-5b3d-fd2d-ed2def27ca27	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5589-5b3d-5d8b-4f198c34c0f9	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5589-5b3d-c776-02da1cce842e	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5589-5b3d-d6de-01957a817356	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5589-5b3d-7790-70b08c5cfd1e	AM	ARM	051	Armenia 	Armenija	\N
00040000-5589-5b3d-83ab-0235a56a9d2f	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5589-5b3d-6c4d-15a06ae43de5	AU	AUS	036	Australia 	Avstralija	\N
00040000-5589-5b3d-fcd0-6b4422568e95	AT	AUT	040	Austria 	Avstrija	\N
00040000-5589-5b3d-e874-6a13a5206388	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5589-5b3d-c2fe-2a7458c759fa	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5589-5b3d-5dee-dd8d7be68906	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5589-5b3d-cdda-89d48f059ebc	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5589-5b3d-0e6e-82d6f010904e	BB	BRB	052	Barbados 	Barbados	\N
00040000-5589-5b3d-ecb4-4144ead69a35	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5589-5b3d-6d42-acb711a9e2ca	BE	BEL	056	Belgium 	Belgija	\N
00040000-5589-5b3d-b5cb-e25925263204	BZ	BLZ	084	Belize 	Belize	\N
00040000-5589-5b3d-d4f0-78e27f78d57e	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5589-5b3d-c32a-099a8909eeb5	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5589-5b3d-556e-1abeafb5bc86	BT	BTN	064	Bhutan 	Butan	\N
00040000-5589-5b3d-9514-79ea4b516b11	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5589-5b3d-dc68-dd0ee62964e0	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5589-5b3d-9aba-03fb5ba46ad3	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5589-5b3d-c44a-380aecf6baa5	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5589-5b3d-da80-d1c342084656	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5589-5b3d-0989-a60d7482eafb	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5589-5b3d-0617-d650c7948a60	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5589-5b3d-a6f7-532c2927fe7b	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5589-5b3d-2bf7-e1b1e7f82480	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5589-5b3d-3a30-362185f8ea2c	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5589-5b3d-70bb-088e9b4f7592	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5589-5b3d-3dab-24deec80540a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5589-5b3d-7e3d-1de7a6b2aa51	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5589-5b3d-4e99-6110109d43df	CA	CAN	124	Canada 	Kanada	\N
00040000-5589-5b3d-056d-0617fccf991b	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5589-5b3d-4d7c-5b72fd255445	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5589-5b3d-a4f2-b49dd40f1dcc	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5589-5b3d-3ecb-ed3e4b8d9b96	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5589-5b3d-ec04-56c2312e99aa	CL	CHL	152	Chile 	Čile	\N
00040000-5589-5b3d-843a-39f5099d80ea	CN	CHN	156	China 	Kitajska	\N
00040000-5589-5b3d-fa3b-c5325223f4e7	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5589-5b3d-0a7b-be338a97900c	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5589-5b3d-e8c1-25d449b5d142	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5589-5b3d-b556-caf3200c8d59	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5589-5b3d-a5ff-7da088df26d6	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5589-5b3d-b3a7-85778cf9ca1a	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5589-5b3d-0ff4-32cf447e752f	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5589-5b3d-26ef-40272ac904b2	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5589-5b3d-ba55-ccbb956aad8d	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5589-5b3d-e2c4-73ae661d3293	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5589-5b3d-878b-abf2b10f6e94	CU	CUB	192	Cuba 	Kuba	\N
00040000-5589-5b3d-81c4-613750c418bb	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5589-5b3d-db28-c192f55dfd5f	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5589-5b3d-f58b-7c1d609e9d22	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5589-5b3d-cb15-fc61a067a5bc	DK	DNK	208	Denmark 	Danska	\N
00040000-5589-5b3d-6cd8-498acdc0ac7b	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5589-5b3d-ba79-4215bad947a5	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5589-5b3d-1374-67644f594428	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5589-5b3d-33fd-d219fc63c2c4	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5589-5b3d-3b45-a4f49b6e856a	EG	EGY	818	Egypt 	Egipt	\N
00040000-5589-5b3d-a740-f6c27afd706f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5589-5b3d-d727-20a1c8fdd929	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5589-5b3d-855e-fb398056f1f6	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5589-5b3d-80f9-ac3b15616092	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5589-5b3d-4a2c-ff1007388329	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5589-5b3d-a86e-1438b6428d1d	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5589-5b3d-4896-01817ef19c4f	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5589-5b3d-29df-ef1bfa887d98	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5589-5b3d-07ea-a385146cbb3e	FI	FIN	246	Finland 	Finska	\N
00040000-5589-5b3d-9c58-635f1b2c15af	FR	FRA	250	France 	Francija	\N
00040000-5589-5b3d-e7f6-0c8a03cb44a0	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5589-5b3d-4ea9-53fc9106ee65	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5589-5b3d-ef53-3113529bd028	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5589-5b3d-87d5-b339ccecd9d0	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5589-5b3d-19e4-0f61c096644a	GA	GAB	266	Gabon 	Gabon	\N
00040000-5589-5b3d-bb01-f185aba0218a	GM	GMB	270	Gambia 	Gambija	\N
00040000-5589-5b3d-0b9c-c9b1fb8b30b3	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5589-5b3d-86a6-1a430530e4a6	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5589-5b3d-8889-17beff85b239	GH	GHA	288	Ghana 	Gana	\N
00040000-5589-5b3d-b0a5-320b727be90e	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5589-5b3d-0b96-a55eb0e95a9e	GR	GRC	300	Greece 	Grčija	\N
00040000-5589-5b3d-a9a5-37b3a1636516	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5589-5b3d-5409-e9f6c10a31df	GD	GRD	308	Grenada 	Grenada	\N
00040000-5589-5b3d-61fe-bad15530b300	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5589-5b3d-bdff-775b632964c2	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5589-5b3d-e1eb-dca271ab2a66	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5589-5b3d-c19f-afc1f686559d	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5589-5b3d-6650-4a041215a1b7	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5589-5b3d-1054-66eb42712761	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5589-5b3d-2ae1-581da3274421	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5589-5b3d-5c3f-f1a42e05b2d0	HT	HTI	332	Haiti 	Haiti	\N
00040000-5589-5b3d-6cdc-69c3c126b4b5	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5589-5b3d-8b6c-762fde7e81d7	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5589-5b3d-050b-5c0441e54e81	HN	HND	340	Honduras 	Honduras	\N
00040000-5589-5b3d-0316-238baa7ae040	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5589-5b3d-a5d4-e6302e252132	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5589-5b3d-e9ea-88cab939de46	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5589-5b3d-47f4-d6804a7d08a8	IN	IND	356	India 	Indija	\N
00040000-5589-5b3d-80a0-e897ed308f4d	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5589-5b3d-750b-7dfc743c3142	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5589-5b3d-cdef-7b7f8d0a1193	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5589-5b3d-dcaa-401e7f382001	IE	IRL	372	Ireland 	Irska	\N
00040000-5589-5b3d-fee9-1c1fa6148219	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5589-5b3d-0896-bd7626fa7c03	IL	ISR	376	Israel 	Izrael	\N
00040000-5589-5b3d-c901-9a82bccfd42f	IT	ITA	380	Italy 	Italija	\N
00040000-5589-5b3d-45f0-2423f5d62b0b	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5589-5b3d-b808-cc12a7d3d69f	JP	JPN	392	Japan 	Japonska	\N
00040000-5589-5b3d-c7dd-1526ec14df94	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5589-5b3d-2ebf-f0e84de099ce	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5589-5b3d-18ac-012f0ab4fb5b	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5589-5b3d-d0c6-edbd7db87959	KE	KEN	404	Kenya 	Kenija	\N
00040000-5589-5b3d-44ba-4ed044bd5025	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5589-5b3d-42f5-fe44b91590d7	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5589-5b3d-47ef-f22162efa821	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5589-5b3d-27dd-176aeb609e3a	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5589-5b3d-0752-1c7cc93415e2	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5589-5b3d-f767-9d70781a5c55	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5589-5b3d-df56-67727dee9235	LV	LVA	428	Latvia 	Latvija	\N
00040000-5589-5b3d-c285-a4f8d49ad7f8	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5589-5b3d-dd8f-901e7cdec329	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5589-5b3d-bdf0-31857bac4bb3	LR	LBR	430	Liberia 	Liberija	\N
00040000-5589-5b3d-02ba-580f55eaf6c6	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5589-5b3d-3798-28cada430a51	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5589-5b3d-feb4-57ad62aae2f2	LT	LTU	440	Lithuania 	Litva	\N
00040000-5589-5b3d-ccdd-406fd90d4688	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5589-5b3d-9164-195cee99a21d	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5589-5b3d-f59e-cb41f093f2fb	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5589-5b3d-bf87-5fc0a8517ce0	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5589-5b3d-2b52-47dbdc657337	MW	MWI	454	Malawi 	Malavi	\N
00040000-5589-5b3d-f8fc-2dc7b384a844	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5589-5b3d-1f2b-136669ff5fca	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5589-5b3d-f72e-fc67e111e1c8	ML	MLI	466	Mali 	Mali	\N
00040000-5589-5b3d-262c-6d2affc3a666	MT	MLT	470	Malta 	Malta	\N
00040000-5589-5b3d-ba91-a281c3c3a2ae	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5589-5b3d-0f03-381ffe036d8e	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5589-5b3d-2879-ff8738ff82f8	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5589-5b3d-2b78-18a0698d982b	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5589-5b3d-6f34-b2518fbd7ddd	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5589-5b3d-4b50-cf413b38affe	MX	MEX	484	Mexico 	Mehika	\N
00040000-5589-5b3d-34e9-f42a7d13f2e0	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5589-5b3d-e96f-9b8e06bc933f	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5589-5b3d-fcb2-dcd951a25e2c	MC	MCO	492	Monaco 	Monako	\N
00040000-5589-5b3d-289d-62a967511b87	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5589-5b3d-aaaa-cf798db60373	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5589-5b3d-d883-6ffcfc4e8f59	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5589-5b3d-5f5f-65b7b4acc109	MA	MAR	504	Morocco 	Maroko	\N
00040000-5589-5b3d-b4fe-6ac657cb3d45	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5589-5b3d-45e0-b0284ddaa1aa	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5589-5b3d-d170-d28bfa4afae0	NA	NAM	516	Namibia 	Namibija	\N
00040000-5589-5b3d-97af-afca52504361	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5589-5b3d-a787-19a55ad4be02	NP	NPL	524	Nepal 	Nepal	\N
00040000-5589-5b3d-ed2a-d6085cceadf9	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5589-5b3d-9eea-42776eb1c13f	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5589-5b3d-e4b7-ae17814358a7	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5589-5b3d-f4a0-79089ad99c32	NE	NER	562	Niger 	Niger 	\N
00040000-5589-5b3d-2c74-56c85d3d9e04	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5589-5b3d-1f5f-925b1b6849a0	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5589-5b3d-8f10-8673a11b7bf0	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5589-5b3d-2ffc-5dd94633f685	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5589-5b3d-8c28-b99452c93791	NO	NOR	578	Norway 	Norveška	\N
00040000-5589-5b3d-f231-bcb0672b91d0	OM	OMN	512	Oman 	Oman	\N
00040000-5589-5b3d-dd36-35e57865c4c0	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5589-5b3d-76ca-b5567073a861	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5589-5b3d-0efd-3bad4bccef61	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5589-5b3d-d280-9e34605716a6	PA	PAN	591	Panama 	Panama	\N
00040000-5589-5b3d-bcdd-ca07b1de2e88	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5589-5b3d-d4f5-391e83997141	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5589-5b3d-1f3d-caa1976e2de5	PE	PER	604	Peru 	Peru	\N
00040000-5589-5b3d-7e2a-8a594eaa81f4	PH	PHL	608	Philippines 	Filipini	\N
00040000-5589-5b3d-9dc3-36c7751f3e1b	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5589-5b3d-2299-e448825396f0	PL	POL	616	Poland 	Poljska	\N
00040000-5589-5b3d-2d1d-94dce2df20c7	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5589-5b3d-648c-61570cba8840	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5589-5b3d-0075-de503d740eae	QA	QAT	634	Qatar 	Katar	\N
00040000-5589-5b3d-ef5e-02204e933c5b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5589-5b3d-d4f1-860f58add3d4	RO	ROU	642	Romania 	Romunija	\N
00040000-5589-5b3d-ad88-bba3b9f77629	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5589-5b3d-2fc1-867357c0e9f7	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5589-5b3d-bcbd-d03df353db1b	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5589-5b3d-1950-101cebee3d23	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5589-5b3d-407a-016d6e2441ee	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5589-5b3d-f6e0-e95cac1afcd4	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5589-5b3d-a627-144d7e69d509	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5589-5b3d-d63e-57dcd5432359	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5589-5b3d-98a1-888b1df4aba0	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5589-5b3d-f688-9a6c26bb87aa	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5589-5b3d-de43-a5d5ee4c8497	SM	SMR	674	San Marino 	San Marino	\N
00040000-5589-5b3d-20f1-45621a1b64ce	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5589-5b3d-e8b2-b90a4a5f1fd9	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5589-5b3d-16a8-7c0e98e47c3b	SN	SEN	686	Senegal 	Senegal	\N
00040000-5589-5b3d-1a29-abc7e2f71f2d	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5589-5b3d-e855-59786875a0f7	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5589-5b3d-eb3c-5ffe7397b929	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5589-5b3d-a325-a4ab552f345a	SG	SGP	702	Singapore 	Singapur	\N
00040000-5589-5b3d-28b1-10e06d2ff95b	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5589-5b3d-3ed7-03f72d6c8f73	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5589-5b3d-e951-238802ac2469	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5589-5b3d-9224-f0bb414acf72	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5589-5b3d-ca10-36431eef8203	SO	SOM	706	Somalia 	Somalija	\N
00040000-5589-5b3d-1f82-fffee65c981d	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5589-5b3d-0ed6-da10e9cbc3fa	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5589-5b3d-d22a-7abbb0021e0b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5589-5b3d-7ee3-7eecdff90a09	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5589-5b3d-27ed-5ee3d98916f1	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5589-5b3d-fdfc-0e876e46447e	SD	SDN	729	Sudan 	Sudan	\N
00040000-5589-5b3d-7e82-48891889c49c	SR	SUR	740	Suriname 	Surinam	\N
00040000-5589-5b3d-bfe2-5357c98ce21b	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5589-5b3d-061a-a525f02dcbc4	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5589-5b3d-f5f8-12a9a52f1ac3	SE	SWE	752	Sweden 	Švedska	\N
00040000-5589-5b3d-7919-6495e119dabb	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5589-5b3d-ed0e-0e64b23f108e	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5589-5b3d-1197-fed332d4a5f9	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5589-5b3d-68c3-cea93ded55ee	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5589-5b3d-2b49-7baefc406e5a	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5589-5b3d-1255-456997c0cecf	TH	THA	764	Thailand 	Tajska	\N
00040000-5589-5b3d-7c2e-802ee0f8e5c2	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5589-5b3d-b219-c5cb172f9029	TG	TGO	768	Togo 	Togo	\N
00040000-5589-5b3d-d37a-cd8d63ca0ac5	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5589-5b3d-9718-5c36bd66cf51	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5589-5b3d-f2c7-7d440e2c77ca	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5589-5b3d-ff06-2527c6d83d60	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5589-5b3d-b6d7-d03150430470	TR	TUR	792	Turkey 	Turčija	\N
00040000-5589-5b3d-1631-6ffc411b1950	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5589-5b3d-7694-508a6599a025	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5589-5b3d-1d6b-ee17ed8af04c	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5589-5b3d-2551-a8d120c1bbf0	UG	UGA	800	Uganda 	Uganda	\N
00040000-5589-5b3d-8f6c-dab6ecd8cda2	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5589-5b3d-58b4-5d27fff534c8	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5589-5b3d-b845-ac803b36098b	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5589-5b3d-b0b1-5c1c2a1fb249	US	USA	840	United States 	Združene države Amerike	\N
00040000-5589-5b3d-b4a2-73da0492a2d2	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5589-5b3d-cd1d-a5afd5ff148e	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5589-5b3d-44f2-a0caefe8df49	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5589-5b3d-acf2-71b147bf371c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5589-5b3d-32cb-8891e5efa0c3	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5589-5b3d-8671-3be8d9ec8a9b	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5589-5b3d-53c1-e69aabcc40f2	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5589-5b3d-3c4b-f35e9ca5829f	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5589-5b3d-0f0d-b4644828349b	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5589-5b3d-abaf-3c805e68664a	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5589-5b3d-dbf6-1ac49c51064c	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5589-5b3d-e956-cd6992277132	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5589-5b3d-806e-bc616869c3b9	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2902 (class 0 OID 8052755)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 8052558)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5589-5b3f-c926-6cf0efd07cf4	000e0000-5589-5b3f-343d-5fa48158791d	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5589-5b3e-58fb-44f8e1c3b97d
000d0000-5589-5b3f-a59b-a746d915226c	000e0000-5589-5b3f-343d-5fa48158791d	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5589-5b3e-58fb-44f8e1c3b97d
000d0000-5589-5b3f-bce8-82c60b0c5e13	000e0000-5589-5b3f-343d-5fa48158791d	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5589-5b3e-8bcc-4789776c6cf9
000d0000-5589-5b3f-bcf7-75210e61f078	000e0000-5589-5b3f-343d-5fa48158791d	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5589-5b3e-aa6a-bec371cb46a4
000d0000-5589-5b3f-7a55-3c72ac0718a8	000e0000-5589-5b3f-343d-5fa48158791d	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5589-5b3e-aa6a-bec371cb46a4
000d0000-5589-5b3f-d06a-1beeaaf2371c	000e0000-5589-5b3f-343d-5fa48158791d	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5589-5b3e-aa6a-bec371cb46a4
000d0000-5589-5b3f-46e2-d44daaa2c86c	000e0000-5589-5b3f-343d-5fa48158791d	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5589-5b3e-58fb-44f8e1c3b97d
\.


--
-- TOC entry 2866 (class 0 OID 8052378)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8052426)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8052358)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5589-5b3f-26e2-0262fde278f9	00080000-5589-5b3f-8f92-b487453cd234	00090000-5589-5b3f-46a1-2ee7d2076435	AK		
\.


--
-- TOC entry 2841 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 8052475)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 8052500)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 8052315)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5589-5b3d-4102-ec1ebe73dded	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5589-5b3d-9b25-94528f743aa3	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5589-5b3d-f033-603299eb849f	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5589-5b3d-f580-f3da0364dbcb	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5589-5b3d-b452-9c381ff8c235	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5589-5b3d-6b2d-99b5173fe103	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5589-5b3d-ee4d-050a626fa999	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5589-5b3d-6b99-9beb55df7ace	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5589-5b3d-e378-9946108fc53b	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5589-5b3d-2b3e-3b8b83ed1b6b	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5589-5b3d-e229-4466e3ed681d	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5589-5b3d-d293-7f9748d50287	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5589-5b3d-e943-2620c890e41e	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5589-5b3f-4cc6-f8eac95528c8	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5589-5b3f-103d-da2e5872abd7	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5589-5b3f-0651-f33531d4baf1	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5589-5b3f-85f9-aa062a63fca6	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5589-5b3f-dbdb-9f8058bedaf0	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5589-5b3f-d6fa-d73690935177	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2855 (class 0 OID 8052228)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5589-5b3f-4490-1d862888a14a	00000000-5589-5b3f-103d-da2e5872abd7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5589-5b3f-7df9-4971cd2faa28	00000000-5589-5b3f-103d-da2e5872abd7	00010000-5589-5b3d-3f6b-a8fde6acc37f	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5589-5b3f-99c2-3d7caf6ffe7b	00000000-5589-5b3f-0651-f33531d4baf1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2856 (class 0 OID 8052239)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5589-5b3f-c735-82235e0fa4dc	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5589-5b3f-eb32-46b7b7411746	00010000-5589-5b3f-8d96-35e06ed47173	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5589-5b3f-0df4-1818363d7008	00010000-5589-5b3f-4fd2-ffca85fa83b2	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5589-5b3f-aad1-183944849b95	00010000-5589-5b3f-f024-6eb078e3030e	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5589-5b3f-8ed6-4bd77636d825	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5589-5b3f-14f2-afa50c513ae4	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5589-5b3f-350f-12d385b23b57	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5589-5b3f-5794-7256fc3121df	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5589-5b3f-46a1-2ee7d2076435	00010000-5589-5b3f-5828-8a8854f77b2d	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5589-5b3f-a9bb-8a7ce4f38937	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5589-5b3f-94b6-4690b0ad6ef7	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5589-5b3f-1b6b-24670b688c05	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5589-5b3f-c7b4-8d9f9e9e2863	00010000-5589-5b3f-acf0-360c045fbc78	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2843 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 8052193)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5589-5b3d-b3e0-f5fc8e87f5c6	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5589-5b3d-f3da-e9b42ba96c99	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5589-5b3d-3bea-243ae22b96da	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5589-5b3d-33ab-1386cf818b5f	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5589-5b3d-ad2f-fc47543608c0	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5589-5b3d-de0d-dd1c934797e9	Abonma-read	Abonma - branje	f
00030000-5589-5b3d-71c0-7400241d00b0	Abonma-write	Abonma - spreminjanje	f
00030000-5589-5b3d-4080-fb2a468ea8ef	Alternacija-read	Alternacija - branje	f
00030000-5589-5b3d-c779-4fc5990c38f9	Alternacija-write	Alternacija - spreminjanje	f
00030000-5589-5b3d-e3af-bb4a827509c2	Arhivalija-read	Arhivalija - branje	f
00030000-5589-5b3d-41a5-cbfd37aeb21f	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5589-5b3d-f72e-8cd46445265e	Besedilo-read	Besedilo - branje	f
00030000-5589-5b3d-ed91-4e684f96a31a	Besedilo-write	Besedilo - spreminjanje	f
00030000-5589-5b3d-062b-e9e533bbf26e	DogodekIzven-read	DogodekIzven - branje	f
00030000-5589-5b3d-8ca2-e0848f7b15d7	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5589-5b3d-35cc-6531bd045660	Dogodek-read	Dogodek - branje	f
00030000-5589-5b3d-ae1e-501f6d4fdcac	Dogodek-write	Dogodek - spreminjanje	f
00030000-5589-5b3d-bee6-3ef213af443e	DrugiVir-read	DrugiVir - branje	f
00030000-5589-5b3d-a59b-3cce54b5a4a2	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5589-5b3d-5cdf-83898e93c806	Drzava-read	Drzava - branje	f
00030000-5589-5b3d-0ea9-d6d7f37d5bc6	Drzava-write	Drzava - spreminjanje	f
00030000-5589-5b3d-ee21-07f68e39663e	Funkcija-read	Funkcija - branje	f
00030000-5589-5b3d-32a6-18ad931e6449	Funkcija-write	Funkcija - spreminjanje	f
00030000-5589-5b3d-c476-86515ce957bd	Gostovanje-read	Gostovanje - branje	f
00030000-5589-5b3d-9e8b-81feb8b68bc6	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5589-5b3d-ee2c-4dc28c30df6d	Gostujoca-read	Gostujoca - branje	f
00030000-5589-5b3d-2776-a0c42f47002c	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5589-5b3d-4eb9-7af17df4d30c	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5589-5b3d-0873-8db03815a5db	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5589-5b3d-613d-dfb4a8de3c30	Kupec-read	Kupec - branje	f
00030000-5589-5b3d-3f90-298af06e438b	Kupec-write	Kupec - spreminjanje	f
00030000-5589-5b3d-d511-d57341aca3ed	NacinPlacina-read	NacinPlacina - branje	f
00030000-5589-5b3d-100b-8fec78336a2d	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5589-5b3d-16bd-af3cca75145e	Option-read	Option - branje	f
00030000-5589-5b3d-cc49-d253b3801dd1	Option-write	Option - spreminjanje	f
00030000-5589-5b3d-3c64-e7100e6cf54a	OptionValue-read	OptionValue - branje	f
00030000-5589-5b3d-6753-03afb09efa53	OptionValue-write	OptionValue - spreminjanje	f
00030000-5589-5b3d-88a4-895ccf5676e2	Oseba-read	Oseba - branje	f
00030000-5589-5b3d-4037-238599addb25	Oseba-write	Oseba - spreminjanje	f
00030000-5589-5b3d-9fad-fb9642a1d7b7	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5589-5b3d-66ea-b43931043bb4	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5589-5b3d-ffa1-5c26d1356245	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5589-5b3d-bcfc-f09e6fb628cb	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5589-5b3d-92a7-ec33e66fba7f	Pogodba-read	Pogodba - branje	f
00030000-5589-5b3d-96ef-f469d6acd2d2	Pogodba-write	Pogodba - spreminjanje	f
00030000-5589-5b3d-9f05-2bd0c73594cf	Popa-read	Popa - branje	f
00030000-5589-5b3d-8903-50881ed79376	Popa-write	Popa - spreminjanje	f
00030000-5589-5b3d-85db-d83ec99a4246	Posta-read	Posta - branje	f
00030000-5589-5b3d-c2bc-ac63fc7a4285	Posta-write	Posta - spreminjanje	f
00030000-5589-5b3d-aa5a-14f264ce3a8a	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5589-5b3d-1359-63774619933b	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5589-5b3d-42d1-156f7726abab	PostniNaslov-read	PostniNaslov - branje	f
00030000-5589-5b3d-912b-e0d6bd59ff64	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5589-5b3d-3281-10d99fdd37ee	Predstava-read	Predstava - branje	f
00030000-5589-5b3d-28ef-4917c902d709	Predstava-write	Predstava - spreminjanje	f
00030000-5589-5b3d-9fee-db156db0ffa1	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5589-5b3d-5721-0cfc75649775	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5589-5b3d-7ceb-8d219ede13a7	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5589-5b3d-0ba5-bff94c370e14	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5589-5b3d-9edc-1667e6c1d9cd	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5589-5b3d-0844-b2de06e269e9	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5589-5b3d-e150-215df1fc748c	ProgramDela-read	ProgramDela - branje	f
00030000-5589-5b3d-f071-607f5869c48f	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5589-5b3d-fc49-42986247472c	ProgramFestival-read	ProgramFestival - branje	f
00030000-5589-5b3d-0c62-1cf283125497	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5589-5b3d-b872-b90213054218	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5589-5b3d-5fb1-25bde9db93ee	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5589-5b3d-9378-4f2d1d1019f4	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5589-5b3d-8a4c-403e4df2684f	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5589-5b3d-0b25-cf30c74b98aa	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5589-5b3d-dd7e-b204fefe0220	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5589-5b3d-77b0-66d94320c8ba	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5589-5b3d-05a9-72bf58c23458	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5589-5b3d-d69b-774ca0bb5102	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5589-5b3d-d3d8-cd171203ec81	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5589-5b3d-09d0-e9ac67a91b2b	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5589-5b3d-b8d5-2bdf73e8a919	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5589-5b3d-2206-c96fd6a80905	ProgramRazno-read	ProgramRazno - branje	f
00030000-5589-5b3d-d730-695419c1288e	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5589-5b3d-028f-37bc432f633e	Prostor-read	Prostor - branje	f
00030000-5589-5b3d-c642-422b51ffa395	Prostor-write	Prostor - spreminjanje	f
00030000-5589-5b3d-4ce6-7368c35b34cd	Racun-read	Racun - branje	f
00030000-5589-5b3d-ce77-e77eda524ea0	Racun-write	Racun - spreminjanje	f
00030000-5589-5b3d-dbf9-658bfab86a5c	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5589-5b3d-7f06-782ef28d07d4	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5589-5b3d-0757-458c2e2fe750	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5589-5b3d-91a8-55cc8533af3e	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5589-5b3d-f8d5-23d01437afeb	Rekvizit-read	Rekvizit - branje	f
00030000-5589-5b3d-b6f7-1460fbee7e26	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5589-5b3d-4ce2-023f3687d88f	Revizija-read	Revizija - branje	f
00030000-5589-5b3d-0af9-5d6e0fe8d935	Revizija-write	Revizija - spreminjanje	f
00030000-5589-5b3d-7516-f97d93982a77	Rezervacija-read	Rezervacija - branje	f
00030000-5589-5b3d-aa68-fd7bef87ded4	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5589-5b3d-6c2e-bb577d40490b	SedezniRed-read	SedezniRed - branje	f
00030000-5589-5b3d-dd54-925ca8c38819	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5589-5b3d-11fe-0043f3e4a4a9	Sedez-read	Sedez - branje	f
00030000-5589-5b3d-89cc-4901a97240d8	Sedez-write	Sedez - spreminjanje	f
00030000-5589-5b3d-7988-a87735326bdc	Sezona-read	Sezona - branje	f
00030000-5589-5b3d-d12e-a4b5232120f3	Sezona-write	Sezona - spreminjanje	f
00030000-5589-5b3d-9648-8bfd2605fd21	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5589-5b3d-ede9-c608e6b9080c	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5589-5b3d-c160-8814ab1cfbae	Stevilcenje-read	Stevilcenje - branje	f
00030000-5589-5b3d-7b05-cb514c2eacd1	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5589-5b3d-9047-2aee112e01d2	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5589-5b3d-9f1b-cb69ee2deda2	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5589-5b3d-c912-a99dd125bc98	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5589-5b3d-57bb-6e5328cc4b2e	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5589-5b3d-78b5-a152d258f8d3	Telefonska-read	Telefonska - branje	f
00030000-5589-5b3d-7254-96343f3312e5	Telefonska-write	Telefonska - spreminjanje	f
00030000-5589-5b3d-859d-6f7b52561e7a	TerminStoritve-read	TerminStoritve - branje	f
00030000-5589-5b3d-969d-ccd66e276749	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5589-5b3d-1c3d-28363271f59c	TipFunkcije-read	TipFunkcije - branje	f
00030000-5589-5b3d-0f01-dea7353ecb17	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5589-5b3d-7e41-8c30b07f2def	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5589-5b3d-a757-5204dbcf4f67	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5589-5b3d-6678-0dec49b9a372	Trr-read	Trr - branje	f
00030000-5589-5b3d-91fd-b39633507445	Trr-write	Trr - spreminjanje	f
00030000-5589-5b3d-cea2-f881e1ec6300	Uprizoritev-read	Uprizoritev - branje	f
00030000-5589-5b3d-1666-e24e3a295610	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5589-5b3d-f673-d3d0e78fa1db	Vaja-read	Vaja - branje	f
00030000-5589-5b3d-d276-3dabba533b4b	Vaja-write	Vaja - spreminjanje	f
00030000-5589-5b3d-ed03-0fb773435af4	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5589-5b3d-9b1f-bc98044a8c9b	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5589-5b3d-918c-c78602901d58	Zaposlitev-read	Zaposlitev - branje	f
00030000-5589-5b3d-26c6-391c515040ac	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5589-5b3d-0e45-17daf91dbdb4	Zasedenost-read	Zasedenost - branje	f
00030000-5589-5b3d-fcfa-4d07fd4a8778	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5589-5b3d-ac14-8643eab32c45	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5589-5b3d-0d78-c4db84bee766	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5589-5b3d-a42e-5ac8c5e0f025	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5589-5b3d-575f-3f4fc67dc846	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2853 (class 0 OID 8052212)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5589-5b3d-8fdd-2b5aec6c4ab8	00030000-5589-5b3d-f3da-e9b42ba96c99
00020000-5589-5b3d-949b-9bcdbc1c20b9	00030000-5589-5b3d-5cdf-83898e93c806
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-de0d-dd1c934797e9
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-71c0-7400241d00b0
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-4080-fb2a468ea8ef
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-c779-4fc5990c38f9
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-e3af-bb4a827509c2
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-35cc-6531bd045660
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-33ab-1386cf818b5f
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-ae1e-501f6d4fdcac
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-5cdf-83898e93c806
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-0ea9-d6d7f37d5bc6
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-ee21-07f68e39663e
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-32a6-18ad931e6449
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-c476-86515ce957bd
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-9e8b-81feb8b68bc6
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-ee2c-4dc28c30df6d
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-2776-a0c42f47002c
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-4eb9-7af17df4d30c
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-0873-8db03815a5db
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-16bd-af3cca75145e
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-3c64-e7100e6cf54a
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-88a4-895ccf5676e2
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-4037-238599addb25
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-9f05-2bd0c73594cf
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-8903-50881ed79376
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-85db-d83ec99a4246
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-c2bc-ac63fc7a4285
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-42d1-156f7726abab
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-912b-e0d6bd59ff64
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-3281-10d99fdd37ee
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-28ef-4917c902d709
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-9edc-1667e6c1d9cd
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-0844-b2de06e269e9
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-028f-37bc432f633e
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-c642-422b51ffa395
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-0757-458c2e2fe750
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-91a8-55cc8533af3e
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-f8d5-23d01437afeb
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-b6f7-1460fbee7e26
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-7988-a87735326bdc
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-d12e-a4b5232120f3
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-1c3d-28363271f59c
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-cea2-f881e1ec6300
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-1666-e24e3a295610
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-f673-d3d0e78fa1db
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-d276-3dabba533b4b
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-0e45-17daf91dbdb4
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-fcfa-4d07fd4a8778
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-ac14-8643eab32c45
00020000-5589-5b3d-a51f-72fc88a50263	00030000-5589-5b3d-a42e-5ac8c5e0f025
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-de0d-dd1c934797e9
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-e3af-bb4a827509c2
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-35cc-6531bd045660
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-5cdf-83898e93c806
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-c476-86515ce957bd
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-ee2c-4dc28c30df6d
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-4eb9-7af17df4d30c
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-0873-8db03815a5db
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-16bd-af3cca75145e
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-3c64-e7100e6cf54a
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-88a4-895ccf5676e2
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-4037-238599addb25
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-9f05-2bd0c73594cf
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-85db-d83ec99a4246
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-42d1-156f7726abab
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-912b-e0d6bd59ff64
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-3281-10d99fdd37ee
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-028f-37bc432f633e
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-0757-458c2e2fe750
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-f8d5-23d01437afeb
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-7988-a87735326bdc
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-78b5-a152d258f8d3
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-7254-96343f3312e5
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-6678-0dec49b9a372
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-91fd-b39633507445
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-918c-c78602901d58
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-26c6-391c515040ac
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-ac14-8643eab32c45
00020000-5589-5b3d-f2c3-c01f3e29c080	00030000-5589-5b3d-a42e-5ac8c5e0f025
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-de0d-dd1c934797e9
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-4080-fb2a468ea8ef
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-e3af-bb4a827509c2
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-41a5-cbfd37aeb21f
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-f72e-8cd46445265e
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-062b-e9e533bbf26e
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-35cc-6531bd045660
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-5cdf-83898e93c806
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-ee21-07f68e39663e
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-c476-86515ce957bd
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-ee2c-4dc28c30df6d
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-4eb9-7af17df4d30c
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-16bd-af3cca75145e
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-3c64-e7100e6cf54a
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-88a4-895ccf5676e2
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-9f05-2bd0c73594cf
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-85db-d83ec99a4246
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-3281-10d99fdd37ee
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-9edc-1667e6c1d9cd
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-028f-37bc432f633e
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-0757-458c2e2fe750
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-f8d5-23d01437afeb
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-7988-a87735326bdc
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-1c3d-28363271f59c
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-f673-d3d0e78fa1db
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-0e45-17daf91dbdb4
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-ac14-8643eab32c45
00020000-5589-5b3d-8416-71a78b0f3e18	00030000-5589-5b3d-a42e-5ac8c5e0f025
00020000-5589-5b3d-899f-58e66f16a391	00030000-5589-5b3d-de0d-dd1c934797e9
00020000-5589-5b3d-899f-58e66f16a391	00030000-5589-5b3d-71c0-7400241d00b0
00020000-5589-5b3d-899f-58e66f16a391	00030000-5589-5b3d-c779-4fc5990c38f9
00020000-5589-5b3d-899f-58e66f16a391	00030000-5589-5b3d-e3af-bb4a827509c2
00020000-5589-5b3d-899f-58e66f16a391	00030000-5589-5b3d-35cc-6531bd045660
00020000-5589-5b3d-899f-58e66f16a391	00030000-5589-5b3d-5cdf-83898e93c806
00020000-5589-5b3d-899f-58e66f16a391	00030000-5589-5b3d-c476-86515ce957bd
00020000-5589-5b3d-899f-58e66f16a391	00030000-5589-5b3d-ee2c-4dc28c30df6d
00020000-5589-5b3d-899f-58e66f16a391	00030000-5589-5b3d-16bd-af3cca75145e
00020000-5589-5b3d-899f-58e66f16a391	00030000-5589-5b3d-3c64-e7100e6cf54a
00020000-5589-5b3d-899f-58e66f16a391	00030000-5589-5b3d-9f05-2bd0c73594cf
00020000-5589-5b3d-899f-58e66f16a391	00030000-5589-5b3d-85db-d83ec99a4246
00020000-5589-5b3d-899f-58e66f16a391	00030000-5589-5b3d-3281-10d99fdd37ee
00020000-5589-5b3d-899f-58e66f16a391	00030000-5589-5b3d-028f-37bc432f633e
00020000-5589-5b3d-899f-58e66f16a391	00030000-5589-5b3d-0757-458c2e2fe750
00020000-5589-5b3d-899f-58e66f16a391	00030000-5589-5b3d-f8d5-23d01437afeb
00020000-5589-5b3d-899f-58e66f16a391	00030000-5589-5b3d-7988-a87735326bdc
00020000-5589-5b3d-899f-58e66f16a391	00030000-5589-5b3d-1c3d-28363271f59c
00020000-5589-5b3d-899f-58e66f16a391	00030000-5589-5b3d-ac14-8643eab32c45
00020000-5589-5b3d-899f-58e66f16a391	00030000-5589-5b3d-a42e-5ac8c5e0f025
00020000-5589-5b3d-d187-daa8124a0395	00030000-5589-5b3d-de0d-dd1c934797e9
00020000-5589-5b3d-d187-daa8124a0395	00030000-5589-5b3d-e3af-bb4a827509c2
00020000-5589-5b3d-d187-daa8124a0395	00030000-5589-5b3d-35cc-6531bd045660
00020000-5589-5b3d-d187-daa8124a0395	00030000-5589-5b3d-5cdf-83898e93c806
00020000-5589-5b3d-d187-daa8124a0395	00030000-5589-5b3d-c476-86515ce957bd
00020000-5589-5b3d-d187-daa8124a0395	00030000-5589-5b3d-ee2c-4dc28c30df6d
00020000-5589-5b3d-d187-daa8124a0395	00030000-5589-5b3d-16bd-af3cca75145e
00020000-5589-5b3d-d187-daa8124a0395	00030000-5589-5b3d-3c64-e7100e6cf54a
00020000-5589-5b3d-d187-daa8124a0395	00030000-5589-5b3d-9f05-2bd0c73594cf
00020000-5589-5b3d-d187-daa8124a0395	00030000-5589-5b3d-85db-d83ec99a4246
00020000-5589-5b3d-d187-daa8124a0395	00030000-5589-5b3d-3281-10d99fdd37ee
00020000-5589-5b3d-d187-daa8124a0395	00030000-5589-5b3d-028f-37bc432f633e
00020000-5589-5b3d-d187-daa8124a0395	00030000-5589-5b3d-0757-458c2e2fe750
00020000-5589-5b3d-d187-daa8124a0395	00030000-5589-5b3d-f8d5-23d01437afeb
00020000-5589-5b3d-d187-daa8124a0395	00030000-5589-5b3d-7988-a87735326bdc
00020000-5589-5b3d-d187-daa8124a0395	00030000-5589-5b3d-859d-6f7b52561e7a
00020000-5589-5b3d-d187-daa8124a0395	00030000-5589-5b3d-3bea-243ae22b96da
00020000-5589-5b3d-d187-daa8124a0395	00030000-5589-5b3d-1c3d-28363271f59c
00020000-5589-5b3d-d187-daa8124a0395	00030000-5589-5b3d-ac14-8643eab32c45
00020000-5589-5b3d-d187-daa8124a0395	00030000-5589-5b3d-a42e-5ac8c5e0f025
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-b3e0-f5fc8e87f5c6
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-f3da-e9b42ba96c99
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-3bea-243ae22b96da
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-33ab-1386cf818b5f
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-ad2f-fc47543608c0
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-de0d-dd1c934797e9
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-71c0-7400241d00b0
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-4080-fb2a468ea8ef
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-c779-4fc5990c38f9
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-e3af-bb4a827509c2
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-41a5-cbfd37aeb21f
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-f72e-8cd46445265e
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-ed91-4e684f96a31a
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-062b-e9e533bbf26e
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-8ca2-e0848f7b15d7
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-35cc-6531bd045660
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-ae1e-501f6d4fdcac
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-5cdf-83898e93c806
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-0ea9-d6d7f37d5bc6
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-ee21-07f68e39663e
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-32a6-18ad931e6449
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-c476-86515ce957bd
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-9e8b-81feb8b68bc6
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-ee2c-4dc28c30df6d
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-2776-a0c42f47002c
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-4eb9-7af17df4d30c
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-0873-8db03815a5db
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-613d-dfb4a8de3c30
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-3f90-298af06e438b
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-d511-d57341aca3ed
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-100b-8fec78336a2d
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-16bd-af3cca75145e
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-cc49-d253b3801dd1
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-3c64-e7100e6cf54a
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-6753-03afb09efa53
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-88a4-895ccf5676e2
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-4037-238599addb25
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-9fad-fb9642a1d7b7
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-66ea-b43931043bb4
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-ffa1-5c26d1356245
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-bcfc-f09e6fb628cb
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-92a7-ec33e66fba7f
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-96ef-f469d6acd2d2
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-9f05-2bd0c73594cf
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-8903-50881ed79376
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-85db-d83ec99a4246
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-c2bc-ac63fc7a4285
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-aa5a-14f264ce3a8a
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-1359-63774619933b
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-42d1-156f7726abab
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-912b-e0d6bd59ff64
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-3281-10d99fdd37ee
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-28ef-4917c902d709
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-9fee-db156db0ffa1
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-5721-0cfc75649775
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-7ceb-8d219ede13a7
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-0ba5-bff94c370e14
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-9edc-1667e6c1d9cd
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-0844-b2de06e269e9
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-e150-215df1fc748c
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-f071-607f5869c48f
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-fc49-42986247472c
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-0c62-1cf283125497
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-b872-b90213054218
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-5fb1-25bde9db93ee
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-9378-4f2d1d1019f4
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-8a4c-403e4df2684f
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-0b25-cf30c74b98aa
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-dd7e-b204fefe0220
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-77b0-66d94320c8ba
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-05a9-72bf58c23458
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-d69b-774ca0bb5102
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-d3d8-cd171203ec81
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-09d0-e9ac67a91b2b
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-b8d5-2bdf73e8a919
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-2206-c96fd6a80905
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-d730-695419c1288e
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-028f-37bc432f633e
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-c642-422b51ffa395
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-4ce6-7368c35b34cd
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-ce77-e77eda524ea0
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-dbf9-658bfab86a5c
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-7f06-782ef28d07d4
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-0757-458c2e2fe750
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-91a8-55cc8533af3e
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-f8d5-23d01437afeb
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-b6f7-1460fbee7e26
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-4ce2-023f3687d88f
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-0af9-5d6e0fe8d935
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-7516-f97d93982a77
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-aa68-fd7bef87ded4
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-6c2e-bb577d40490b
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-dd54-925ca8c38819
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-11fe-0043f3e4a4a9
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-89cc-4901a97240d8
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-7988-a87735326bdc
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-d12e-a4b5232120f3
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-9648-8bfd2605fd21
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-ede9-c608e6b9080c
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-c160-8814ab1cfbae
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-7b05-cb514c2eacd1
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-9047-2aee112e01d2
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-9f1b-cb69ee2deda2
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-c912-a99dd125bc98
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-57bb-6e5328cc4b2e
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-78b5-a152d258f8d3
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-7254-96343f3312e5
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-859d-6f7b52561e7a
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-969d-ccd66e276749
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-1c3d-28363271f59c
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-0f01-dea7353ecb17
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-7e41-8c30b07f2def
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-a757-5204dbcf4f67
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-6678-0dec49b9a372
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-91fd-b39633507445
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-cea2-f881e1ec6300
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-1666-e24e3a295610
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-f673-d3d0e78fa1db
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-d276-3dabba533b4b
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-ed03-0fb773435af4
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-9b1f-bc98044a8c9b
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-918c-c78602901d58
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-26c6-391c515040ac
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-0e45-17daf91dbdb4
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-fcfa-4d07fd4a8778
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-ac14-8643eab32c45
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-0d78-c4db84bee766
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-a42e-5ac8c5e0f025
00020000-5589-5b3f-52fa-bf4f3726073c	00030000-5589-5b3d-575f-3f4fc67dc846
\.


--
-- TOC entry 2881 (class 0 OID 8052507)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8052538)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 8052674)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5589-5b3f-c043-c4d2caa48bff	00090000-5589-5b3f-c735-82235e0fa4dc	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2858 (class 0 OID 8052272)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5589-5b3f-8f92-b487453cd234	00040000-5589-5b3d-7ffb-939d51045c5b	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5589-5b3f-aed4-29e07c425b8d	00040000-5589-5b3d-7ffb-939d51045c5b	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5589-5b3f-b300-4392bcc0eb80	00040000-5589-5b3d-7ffb-939d51045c5b	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5589-5b3f-5dd0-66c7d8e35352	00040000-5589-5b3d-7ffb-939d51045c5b	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5589-5b3f-8181-60aa5a5cb5f0	00040000-5589-5b3d-7ffb-939d51045c5b	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5589-5b3f-8e10-68dacd1a3977	00040000-5589-5b3d-e951-238802ac2469	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2860 (class 0 OID 8052307)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5589-5b3d-e393-5867bc732b79	8341	Adlešiči
00050000-5589-5b3d-ad31-4dbf85f7bb93	5270	Ajdovščina
00050000-5589-5b3d-05ff-48bd8cb3a43b	6280	Ankaran/Ancarano
00050000-5589-5b3d-7a6a-8644738f32f5	9253	Apače
00050000-5589-5b3d-4dc1-617429c5109d	8253	Artiče
00050000-5589-5b3d-16ee-23f21e4f2c50	4275	Begunje na Gorenjskem
00050000-5589-5b3d-5381-7b586590b60b	1382	Begunje pri Cerknici
00050000-5589-5b3d-56b7-7b20c0df6729	9231	Beltinci
00050000-5589-5b3d-e414-2df5d58d5217	2234	Benedikt
00050000-5589-5b3d-1140-0f6a5292e850	2345	Bistrica ob Dravi
00050000-5589-5b3d-5fb9-5f05a365b70a	3256	Bistrica ob Sotli
00050000-5589-5b3d-00ff-86df463317c7	8259	Bizeljsko
00050000-5589-5b3d-00f3-c052cda292df	1223	Blagovica
00050000-5589-5b3d-a41a-f4859b4b6f57	8283	Blanca
00050000-5589-5b3d-111c-3c34e3b086c3	4260	Bled
00050000-5589-5b3d-bb26-06925904b7ab	4273	Blejska Dobrava
00050000-5589-5b3d-e0b5-ff487b8ea14c	9265	Bodonci
00050000-5589-5b3d-a5b1-3728916c5ca7	9222	Bogojina
00050000-5589-5b3d-3b6f-a93ebf746e42	4263	Bohinjska Bela
00050000-5589-5b3d-973d-7b062da7071c	4264	Bohinjska Bistrica
00050000-5589-5b3d-a2ce-568f91c182e0	4265	Bohinjsko jezero
00050000-5589-5b3e-21fa-3ef2e6f19e6b	1353	Borovnica
00050000-5589-5b3e-8e18-b5363bee5d6d	8294	Boštanj
00050000-5589-5b3e-4b75-4681787f7a6b	5230	Bovec
00050000-5589-5b3e-7180-0415c3ecf5c4	5295	Branik
00050000-5589-5b3e-5150-cf5c5dca9af1	3314	Braslovče
00050000-5589-5b3e-2390-8f245120a511	5223	Breginj
00050000-5589-5b3e-5f43-32bdab02e0cc	8280	Brestanica
00050000-5589-5b3e-49f2-b4d68e6f7ddd	2354	Bresternica
00050000-5589-5b3e-7552-010a9198c1cf	4243	Brezje
00050000-5589-5b3e-2e4a-d306074dbc77	1351	Brezovica pri Ljubljani
00050000-5589-5b3e-8ba6-81711a2753c7	8250	Brežice
00050000-5589-5b3e-864c-308d95499016	4210	Brnik - Aerodrom
00050000-5589-5b3e-3f63-3a48b26d74d8	8321	Brusnice
00050000-5589-5b3e-7b52-25ce861465d7	3255	Buče
00050000-5589-5b3e-afb6-53a872365ae2	8276	Bučka 
00050000-5589-5b3e-8d4c-fa13b9eac70b	9261	Cankova
00050000-5589-5b3e-3393-673e658c377d	3000	Celje 
00050000-5589-5b3e-20f2-aef746752851	3001	Celje - poštni predali
00050000-5589-5b3e-1893-dad2b0048b1a	4207	Cerklje na Gorenjskem
00050000-5589-5b3e-d620-21b1b2f7dea2	8263	Cerklje ob Krki
00050000-5589-5b3e-c38e-efd774dd99ed	1380	Cerknica
00050000-5589-5b3e-6aa2-733b43f4cd67	5282	Cerkno
00050000-5589-5b3e-f373-34fdc12f5cc3	2236	Cerkvenjak
00050000-5589-5b3e-e7eb-e10a10fcda4f	2215	Ceršak
00050000-5589-5b3e-d2a1-ef88498e35ed	2326	Cirkovce
00050000-5589-5b3e-19a8-c6813a47d5b5	2282	Cirkulane
00050000-5589-5b3e-644b-4bffe2e32763	5273	Col
00050000-5589-5b3e-6b48-ac86484f2210	8251	Čatež ob Savi
00050000-5589-5b3e-3109-364df5696f4c	1413	Čemšenik
00050000-5589-5b3e-d6db-337e1675a8d2	5253	Čepovan
00050000-5589-5b3e-0a1e-267c6e18fa08	9232	Črenšovci
00050000-5589-5b3e-6006-8369a3b176d3	2393	Črna na Koroškem
00050000-5589-5b3e-f1da-5b7876afaab0	6275	Črni Kal
00050000-5589-5b3e-d978-a7eaf8f4f249	5274	Črni Vrh nad Idrijo
00050000-5589-5b3e-55b2-2b827dd10df6	5262	Črniče
00050000-5589-5b3e-ac49-9bb3ce71dadf	8340	Črnomelj
00050000-5589-5b3e-46fc-55f20dfd91de	6271	Dekani
00050000-5589-5b3e-e5be-fe48802d4476	5210	Deskle
00050000-5589-5b3e-5051-785daf98523c	2253	Destrnik
00050000-5589-5b3e-ee72-4cb13259d8f8	6215	Divača
00050000-5589-5b3e-44ec-131055815747	1233	Dob
00050000-5589-5b3e-d76e-6ea8dca0ae4a	3224	Dobje pri Planini
00050000-5589-5b3e-4010-84a50e5c8c16	8257	Dobova
00050000-5589-5b3e-4c1a-fcef244b3edf	1423	Dobovec
00050000-5589-5b3e-d94a-8c1c850ae238	5263	Dobravlje
00050000-5589-5b3e-7ed7-6e3daa9447e3	3204	Dobrna
00050000-5589-5b3e-d976-5a37b859194f	8211	Dobrnič
00050000-5589-5b3e-bba6-c4897f382cde	1356	Dobrova
00050000-5589-5b3e-2013-89f46952e048	9223	Dobrovnik/Dobronak 
00050000-5589-5b3e-40b4-6136cc8ba968	5212	Dobrovo v Brdih
00050000-5589-5b3e-5f1e-c9c13c3fbdd4	1431	Dol pri Hrastniku
00050000-5589-5b3e-6f49-2f983ee3de44	1262	Dol pri Ljubljani
00050000-5589-5b3e-f43f-a0aa55e33dd1	1273	Dole pri Litiji
00050000-5589-5b3e-87bb-0e64c13d46e0	1331	Dolenja vas
00050000-5589-5b3e-6543-7009feb19afa	8350	Dolenjske Toplice
00050000-5589-5b3e-f197-f577d978a0bd	1230	Domžale
00050000-5589-5b3e-d0d0-9c706ec40821	2252	Dornava
00050000-5589-5b3e-d7b3-8f6fc958023a	5294	Dornberk
00050000-5589-5b3e-9e43-481e54b4cce2	1319	Draga
00050000-5589-5b3e-3e35-81119d59ae79	8343	Dragatuš
00050000-5589-5b3e-7201-a1dda41c062e	3222	Dramlje
00050000-5589-5b3e-2d88-a8f337404b47	2370	Dravograd
00050000-5589-5b3e-b0a2-91dbd468e484	4203	Duplje
00050000-5589-5b3e-84ad-cd3b4de0a675	6221	Dutovlje
00050000-5589-5b3e-c4e5-ef9937d7b1d8	8361	Dvor
00050000-5589-5b3e-ce74-97d77c9da27d	2343	Fala
00050000-5589-5b3e-11c4-512549c0811f	9208	Fokovci
00050000-5589-5b3e-7dd0-f194aa45b054	2313	Fram
00050000-5589-5b3e-f8c1-b05dfa43cc08	3213	Frankolovo
00050000-5589-5b3e-6502-3ca17347111b	1274	Gabrovka
00050000-5589-5b3e-f91d-0348633a19e2	8254	Globoko
00050000-5589-5b3e-f210-c3b07f507fe0	5275	Godovič
00050000-5589-5b3e-93e8-b689975ed9e0	4204	Golnik
00050000-5589-5b3e-f34c-97648a8863e1	3303	Gomilsko
00050000-5589-5b3e-38b0-0b4f6e3b516f	4224	Gorenja vas
00050000-5589-5b3e-2404-b622b6064c89	3263	Gorica pri Slivnici
00050000-5589-5b3e-f04d-5b1ddb39bd6d	2272	Gorišnica
00050000-5589-5b3e-df74-4466ce389361	9250	Gornja Radgona
00050000-5589-5b3e-7416-c69164eee573	3342	Gornji Grad
00050000-5589-5b3e-19a8-d5425e2867ef	4282	Gozd Martuljek
00050000-5589-5b3e-5028-62e0d7ef1160	6272	Gračišče
00050000-5589-5b3e-40e4-9fc10ce9ef58	9264	Grad
00050000-5589-5b3e-a6d3-7cd1300efc52	8332	Gradac
00050000-5589-5b3e-0d20-89abc28d0201	1384	Grahovo
00050000-5589-5b3e-69ac-0e53a76e9507	5242	Grahovo ob Bači
00050000-5589-5b3e-d40e-dc631835edc6	5251	Grgar
00050000-5589-5b3e-b5ed-ea00465923d1	3302	Griže
00050000-5589-5b3e-cffa-7d5cdad8f1f3	3231	Grobelno
00050000-5589-5b3e-3ae5-0c4dbce67a9a	1290	Grosuplje
00050000-5589-5b3e-464e-6df336c1b651	2288	Hajdina
00050000-5589-5b3e-c6c6-01a2f13f6c2f	8362	Hinje
00050000-5589-5b3e-55e1-ac9d3a8e3b6f	2311	Hoče
00050000-5589-5b3e-f553-f67eaf29f139	9205	Hodoš/Hodos
00050000-5589-5b3e-52be-8813470b9d29	1354	Horjul
00050000-5589-5b3e-b7e8-5b36664cf8e1	1372	Hotedršica
00050000-5589-5b3e-a085-845f030853ef	1430	Hrastnik
00050000-5589-5b3e-d32c-62166df241dd	6225	Hruševje
00050000-5589-5b3e-2a1d-457d9b6114b9	4276	Hrušica
00050000-5589-5b3e-efca-e18e5494400f	5280	Idrija
00050000-5589-5b3e-c494-9da8d23e1959	1292	Ig
00050000-5589-5b3e-b2c2-d8146eb09004	6250	Ilirska Bistrica
00050000-5589-5b3e-5caa-15b90da2dd3e	6251	Ilirska Bistrica-Trnovo
00050000-5589-5b3e-eeb6-e9fe7f43e2f9	1295	Ivančna Gorica
00050000-5589-5b3e-492f-5b327aa5bd1a	2259	Ivanjkovci
00050000-5589-5b3e-d122-009daad57c2c	1411	Izlake
00050000-5589-5b3e-53eb-e698b99ecbee	6310	Izola/Isola
00050000-5589-5b3e-d167-19468aaf3069	2222	Jakobski Dol
00050000-5589-5b3e-353c-1e97a24ca1fe	2221	Jarenina
00050000-5589-5b3e-224a-ad62f0e0db61	6254	Jelšane
00050000-5589-5b3e-41fc-88d48de49db7	4270	Jesenice
00050000-5589-5b3e-ab20-63fdfea8ce15	8261	Jesenice na Dolenjskem
00050000-5589-5b3e-e0db-c0d6b38a838b	3273	Jurklošter
00050000-5589-5b3e-5690-5a38c23e1e27	2223	Jurovski Dol
00050000-5589-5b3e-fb7c-723bb42e838d	2256	Juršinci
00050000-5589-5b3e-2de7-b3dc948599b4	5214	Kal nad Kanalom
00050000-5589-5b3e-e7d2-a9c84bec72cd	3233	Kalobje
00050000-5589-5b3e-6414-b18925eed2ce	4246	Kamna Gorica
00050000-5589-5b3e-1592-78419b98e03c	2351	Kamnica
00050000-5589-5b3e-f814-82d304fe675f	1241	Kamnik
00050000-5589-5b3e-4da3-8c41e0d4d373	5213	Kanal
00050000-5589-5b3e-bf32-c670e7be5685	8258	Kapele
00050000-5589-5b3e-6c7f-4104860fae36	2362	Kapla
00050000-5589-5b3e-6261-1e20e221929b	2325	Kidričevo
00050000-5589-5b3e-5224-faef527fe7e6	1412	Kisovec
00050000-5589-5b3e-7fa2-e7c69ffa8b83	6253	Knežak
00050000-5589-5b3e-0e03-34fe0687095f	5222	Kobarid
00050000-5589-5b3e-4b7a-3d56a35b412c	9227	Kobilje
00050000-5589-5b3e-1dbb-97c76b564843	1330	Kočevje
00050000-5589-5b3e-e377-5be609e20a01	1338	Kočevska Reka
00050000-5589-5b3e-93ae-9fde51ab5b18	2276	Kog
00050000-5589-5b3e-db36-477a39c3b943	5211	Kojsko
00050000-5589-5b3e-1b4d-c153ce8d9d4a	6223	Komen
00050000-5589-5b3e-120d-76b3b812051d	1218	Komenda
00050000-5589-5b3e-5419-fbe93a8d5009	6000	Koper/Capodistria 
00050000-5589-5b3e-5a6d-80a92199f78d	6001	Koper/Capodistria - poštni predali
00050000-5589-5b3e-1b58-3c8d6569810a	8282	Koprivnica
00050000-5589-5b3e-560f-22a76aa7f696	5296	Kostanjevica na Krasu
00050000-5589-5b3e-2a92-9d370736cc31	8311	Kostanjevica na Krki
00050000-5589-5b3e-42a8-c50426eadc78	1336	Kostel
00050000-5589-5b3e-2b8f-11593c2398c0	6256	Košana
00050000-5589-5b3e-d264-e08161346277	2394	Kotlje
00050000-5589-5b3e-ff68-b6decf241dc3	6240	Kozina
00050000-5589-5b3e-aa29-28809cedbddd	3260	Kozje
00050000-5589-5b3e-7aa2-a710d6648dae	4000	Kranj 
00050000-5589-5b3e-efd7-ef7e1aee1f6b	4001	Kranj - poštni predali
00050000-5589-5b3e-1aa3-fc0316db5fb2	4280	Kranjska Gora
00050000-5589-5b3e-9a85-eb4bf79d3d1f	1281	Kresnice
00050000-5589-5b3e-1494-3ca87c56a4bd	4294	Križe
00050000-5589-5b3e-9702-65dfedcbb590	9206	Križevci
00050000-5589-5b3e-ed29-2a0207f1fcd5	9242	Križevci pri Ljutomeru
00050000-5589-5b3e-40e1-50f2ca53cbf3	1301	Krka
00050000-5589-5b3e-7a8b-57bb01cc00a7	8296	Krmelj
00050000-5589-5b3e-05b1-b59c03dec1d6	4245	Kropa
00050000-5589-5b3e-0e82-589374102e1e	8262	Krška vas
00050000-5589-5b3e-fe3c-ffa71ddfc576	8270	Krško
00050000-5589-5b3e-7417-8a2e6c69c72d	9263	Kuzma
00050000-5589-5b3e-9ccd-88db0651dd65	2318	Laporje
00050000-5589-5b3e-5728-65b01645a91e	3270	Laško
00050000-5589-5b3e-a0e0-72c1b441d304	1219	Laze v Tuhinju
00050000-5589-5b3e-9ff9-b4ca71cb5e53	2230	Lenart v Slovenskih goricah
00050000-5589-5b3e-bb6f-a3bf2871dadc	9220	Lendava/Lendva
00050000-5589-5b3e-1728-8b10406cbf06	4248	Lesce
00050000-5589-5b3e-3eab-24cb3d03fad9	3261	Lesično
00050000-5589-5b3e-cadf-27defbff5eca	8273	Leskovec pri Krškem
00050000-5589-5b3e-6672-1a6a69d9f6a5	2372	Libeliče
00050000-5589-5b3e-2f54-ed391919f2d3	2341	Limbuš
00050000-5589-5b3e-249b-fe91667e7d4f	1270	Litija
00050000-5589-5b3e-96d4-12fda6afbe33	3202	Ljubečna
00050000-5589-5b3e-7531-4e09cb60f64f	1000	Ljubljana 
00050000-5589-5b3e-0bf6-9bc52f066b5e	1001	Ljubljana - poštni predali
00050000-5589-5b3e-7bdc-213b360c2a94	1231	Ljubljana - Črnuče
00050000-5589-5b3e-2cd1-f1ca1832ce91	1261	Ljubljana - Dobrunje
00050000-5589-5b3e-bff3-0184cb9ee3be	1260	Ljubljana - Polje
00050000-5589-5b3e-772c-1e2c576be834	1210	Ljubljana - Šentvid
00050000-5589-5b3e-aa8d-3160580ae7b2	1211	Ljubljana - Šmartno
00050000-5589-5b3e-3ab2-4ba2496beef8	3333	Ljubno ob Savinji
00050000-5589-5b3e-11dd-e45b14ff7d55	9240	Ljutomer
00050000-5589-5b3e-9076-5eb14bc0b7d5	3215	Loče
00050000-5589-5b3e-0361-5f9efc3fb58d	5231	Log pod Mangartom
00050000-5589-5b3e-4ec7-a788c5c7c5f0	1358	Log pri Brezovici
00050000-5589-5b3e-34f2-647387aaa743	1370	Logatec
00050000-5589-5b3e-cf8f-747c1bc5498b	1371	Logatec
00050000-5589-5b3e-4b88-b0775910353f	1434	Loka pri Zidanem Mostu
00050000-5589-5b3e-a328-d33eb95e9552	3223	Loka pri Žusmu
00050000-5589-5b3e-05a7-d94b37c1c845	6219	Lokev
00050000-5589-5b3e-6901-bd7a40cf9908	1318	Loški Potok
00050000-5589-5b3e-dfa0-93148df03fbb	2324	Lovrenc na Dravskem polju
00050000-5589-5b3e-6062-fe84b8101910	2344	Lovrenc na Pohorju
00050000-5589-5b3e-b986-57b50ac3fc3b	3334	Luče
00050000-5589-5b3e-9107-d0ab1bed862b	1225	Lukovica
00050000-5589-5b3e-b02e-7a8ffc7222ef	9202	Mačkovci
00050000-5589-5b3e-89af-7b62b4f124f7	2322	Majšperk
00050000-5589-5b3e-5d6d-11b9c6624cda	2321	Makole
00050000-5589-5b3e-eb64-6684383bcbaf	9243	Mala Nedelja
00050000-5589-5b3e-b5c2-16a2997fab4f	2229	Malečnik
00050000-5589-5b3e-1266-b7abf0167351	6273	Marezige
00050000-5589-5b3e-12c4-b43db789f168	2000	Maribor 
00050000-5589-5b3e-a431-2a227fdc9f66	2001	Maribor - poštni predali
00050000-5589-5b3e-258b-1e5324d4f5de	2206	Marjeta na Dravskem polju
00050000-5589-5b3e-c692-ada7962d445d	2281	Markovci
00050000-5589-5b3e-ea4f-3d298f4c9863	9221	Martjanci
00050000-5589-5b3e-db55-e7d55b03c85b	6242	Materija
00050000-5589-5b3e-b32c-e933cd960348	4211	Mavčiče
00050000-5589-5b3e-630d-7fcd46245afb	1215	Medvode
00050000-5589-5b3e-7b6e-aed8e70de708	1234	Mengeš
00050000-5589-5b3e-fd24-39e46809a0cf	8330	Metlika
00050000-5589-5b3e-ff51-fa88816fca40	2392	Mežica
00050000-5589-5b3e-b648-9ca5a7c8b949	2204	Miklavž na Dravskem polju
00050000-5589-5b3e-95c6-9d99083c5a53	2275	Miklavž pri Ormožu
00050000-5589-5b3e-4a05-f9149387d093	5291	Miren
00050000-5589-5b3e-3001-18b165a39e73	8233	Mirna
00050000-5589-5b3e-a30a-d841e18b851d	8216	Mirna Peč
00050000-5589-5b3e-7b9b-86d9fcf86e05	2382	Mislinja
00050000-5589-5b3e-a196-3f770bb7dd8a	4281	Mojstrana
00050000-5589-5b3e-fad8-ad664a6b12e6	8230	Mokronog
00050000-5589-5b3e-d35d-ca60c5c1edd0	1251	Moravče
00050000-5589-5b3e-e841-9eba3da4f9e2	9226	Moravske Toplice
00050000-5589-5b3e-6792-69e8e5c14953	5216	Most na Soči
00050000-5589-5b3e-5cbb-33d613e5085b	1221	Motnik
00050000-5589-5b3e-78e5-bdfd79e57814	3330	Mozirje
00050000-5589-5b3e-c6a6-6b95dec6895c	9000	Murska Sobota 
00050000-5589-5b3e-433f-72a5b2eb1f29	9001	Murska Sobota - poštni predali
00050000-5589-5b3e-5b98-58d9bb100ecd	2366	Muta
00050000-5589-5b3e-2c2e-655f4c107d68	4202	Naklo
00050000-5589-5b3e-aed7-5eca67bb5176	3331	Nazarje
00050000-5589-5b3e-cf83-edf8717c5604	1357	Notranje Gorice
00050000-5589-5b3e-5f4a-55b2453cc3c6	3203	Nova Cerkev
00050000-5589-5b3e-126a-9391c95af56d	5000	Nova Gorica 
00050000-5589-5b3e-23bd-55e7b91fabb6	5001	Nova Gorica - poštni predali
00050000-5589-5b3e-3a3f-5efe692c55c5	1385	Nova vas
00050000-5589-5b3e-f96d-27601b6ab1db	8000	Novo mesto
00050000-5589-5b3e-0652-d30cd9b15395	8001	Novo mesto - poštni predali
00050000-5589-5b3e-e601-e013108ed89d	6243	Obrov
00050000-5589-5b3e-c1e8-cffde62a3222	9233	Odranci
00050000-5589-5b3e-cc94-c4742efda9bd	2317	Oplotnica
00050000-5589-5b3e-f8e3-2f2d690a84bd	2312	Orehova vas
00050000-5589-5b3e-0baf-ef88728325df	2270	Ormož
00050000-5589-5b3e-12ed-f3951342e326	1316	Ortnek
00050000-5589-5b3e-9edd-c6e5a67e0e19	1337	Osilnica
00050000-5589-5b3e-d5eb-6c9c3973e08c	8222	Otočec
00050000-5589-5b3e-b6c9-ef63087b08e7	2361	Ožbalt
00050000-5589-5b3e-75a5-e89e3ceb48b0	2231	Pernica
00050000-5589-5b3e-0931-2b0c747d74b2	2211	Pesnica pri Mariboru
00050000-5589-5b3e-9305-531c7654e75a	9203	Petrovci
00050000-5589-5b3e-9f95-5e87398dfe96	3301	Petrovče
00050000-5589-5b3e-87b9-8518a0e52c86	6330	Piran/Pirano
00050000-5589-5b3e-7235-96c7ab48bd99	8255	Pišece
00050000-5589-5b3e-33aa-7ae95a87ad3f	6257	Pivka
00050000-5589-5b3e-a4a4-987b11b5e41c	6232	Planina
00050000-5589-5b3e-fb40-ca0758851c9d	3225	Planina pri Sevnici
00050000-5589-5b3e-9f0e-f17f2c8c09d2	6276	Pobegi
00050000-5589-5b3e-e339-957efa960ea7	8312	Podbočje
00050000-5589-5b3e-a176-01539ec71a94	5243	Podbrdo
00050000-5589-5b3e-56e8-f3a3f22471b4	3254	Podčetrtek
00050000-5589-5b3e-9324-7ce77dbade45	2273	Podgorci
00050000-5589-5b3e-544e-8c1e06d79b90	6216	Podgorje
00050000-5589-5b3e-8bbe-5de3e8f58fce	2381	Podgorje pri Slovenj Gradcu
00050000-5589-5b3e-c6f8-bb0a9cdb1d02	6244	Podgrad
00050000-5589-5b3e-b865-0dc642b40b44	1414	Podkum
00050000-5589-5b3e-a21a-a140b6a44cdd	2286	Podlehnik
00050000-5589-5b3e-301e-70c57e67eb0d	5272	Podnanos
00050000-5589-5b3e-1796-5a556599d6f5	4244	Podnart
00050000-5589-5b3e-1669-9aa4dbdbacc2	3241	Podplat
00050000-5589-5b3e-23ee-b9e671610456	3257	Podsreda
00050000-5589-5b3e-4629-f3bbcd384f04	2363	Podvelka
00050000-5589-5b3e-f5c2-cf4064730e5a	2208	Pohorje
00050000-5589-5b3e-19e6-c15805785bc8	2257	Polenšak
00050000-5589-5b3e-2547-87a68f9a519d	1355	Polhov Gradec
00050000-5589-5b3e-094e-e40e6df7737c	4223	Poljane nad Škofjo Loko
00050000-5589-5b3e-05cc-db622fb3f3ec	2319	Poljčane
00050000-5589-5b3e-db91-793f58040303	1272	Polšnik
00050000-5589-5b3e-0367-e2a648cd0835	3313	Polzela
00050000-5589-5b3e-3cc4-34c9d3844156	3232	Ponikva
00050000-5589-5b3e-33ea-d754d3b3feec	6320	Portorož/Portorose
00050000-5589-5b3e-bfe5-96d59819c811	6230	Postojna
00050000-5589-5b3e-212c-f94aa349adad	2331	Pragersko
00050000-5589-5b3e-958e-974ba3ec9c30	3312	Prebold
00050000-5589-5b3e-c4e2-4868aaaa55ea	4205	Preddvor
00050000-5589-5b3e-9984-51ce1c771c72	6255	Prem
00050000-5589-5b3e-152c-3444d708eba5	1352	Preserje
00050000-5589-5b3e-3bed-16720bb03a95	6258	Prestranek
00050000-5589-5b3e-3523-789119d96e69	2391	Prevalje
00050000-5589-5b3e-4b40-2068d4da1f47	3262	Prevorje
00050000-5589-5b3e-7808-1631dd211e0b	1276	Primskovo 
00050000-5589-5b3e-c2b9-49e4817923e6	3253	Pristava pri Mestinju
00050000-5589-5b3e-3e51-e15d6da74748	9207	Prosenjakovci/Partosfalva
00050000-5589-5b3e-081c-8fe544b21f72	5297	Prvačina
00050000-5589-5b3e-ca94-e9d04ab9f9bb	2250	Ptuj
00050000-5589-5b3e-702f-3643742b55c9	2323	Ptujska Gora
00050000-5589-5b3e-f96e-6cf1d24e3182	9201	Puconci
00050000-5589-5b3e-f0b8-ab4904c24460	2327	Rače
00050000-5589-5b3e-be3f-6e35da8768b0	1433	Radeče
00050000-5589-5b3e-f007-17d233bd662c	9252	Radenci
00050000-5589-5b3e-4cdf-24ceba976f26	2360	Radlje ob Dravi
00050000-5589-5b3e-5f0b-3bc5fc07d702	1235	Radomlje
00050000-5589-5b3e-24ed-b05489a1634c	4240	Radovljica
00050000-5589-5b3e-7c9f-a5c2ef1a50ac	8274	Raka
00050000-5589-5b3e-7691-fdb22f514f95	1381	Rakek
00050000-5589-5b3e-bd99-76ed50a888a4	4283	Rateče - Planica
00050000-5589-5b3e-4ade-bee430744313	2390	Ravne na Koroškem
00050000-5589-5b3e-ded8-20ffc52c7055	9246	Razkrižje
00050000-5589-5b3e-bbaa-7d27659cf490	3332	Rečica ob Savinji
00050000-5589-5b3e-3752-c0ec75638d18	5292	Renče
00050000-5589-5b3e-a5fb-ebf49903c6c7	1310	Ribnica
00050000-5589-5b3e-054b-36bb0a2371ac	2364	Ribnica na Pohorju
00050000-5589-5b3e-4af8-9b4913c6ec89	3272	Rimske Toplice
00050000-5589-5b3e-2cd5-02157f3b0902	1314	Rob
00050000-5589-5b3e-4a0e-d3077e25f3f4	5215	Ročinj
00050000-5589-5b3e-5782-86b7c5907bca	3250	Rogaška Slatina
00050000-5589-5b3e-49b5-3708bef97420	9262	Rogašovci
00050000-5589-5b3e-2d66-ae33a6ad9843	3252	Rogatec
00050000-5589-5b3e-7f1e-f47800b64437	1373	Rovte
00050000-5589-5b3e-4423-45f8f7ffd766	2342	Ruše
00050000-5589-5b3e-ef44-4cc7b7bb9e6c	1282	Sava
00050000-5589-5b3e-7622-0202a3388d05	6333	Sečovlje/Sicciole
00050000-5589-5b3e-8e8d-d51f9241c839	4227	Selca
00050000-5589-5b3e-e54a-c3002eec53d2	2352	Selnica ob Dravi
00050000-5589-5b3e-cd3a-71bcb7d75f8e	8333	Semič
00050000-5589-5b3e-0c8d-af6b5ec5860d	8281	Senovo
00050000-5589-5b3e-22d6-2335e515d2b1	6224	Senožeče
00050000-5589-5b3e-8521-d2fced8bebc5	8290	Sevnica
00050000-5589-5b3e-25ed-906040431c97	6210	Sežana
00050000-5589-5b3e-4568-4ed85fc804f1	2214	Sladki Vrh
00050000-5589-5b3e-3003-923fc5fe7c4b	5283	Slap ob Idrijci
00050000-5589-5b3e-1671-463bf015093b	2380	Slovenj Gradec
00050000-5589-5b3e-0443-ba9230f3a052	2310	Slovenska Bistrica
00050000-5589-5b3e-5d82-68e14796e43f	3210	Slovenske Konjice
00050000-5589-5b3e-e731-b65eae636fdf	1216	Smlednik
00050000-5589-5b3e-08bd-bce1c3e960ae	5232	Soča
00050000-5589-5b3e-a46b-02bbc7fb13a9	1317	Sodražica
00050000-5589-5b3e-2183-439cffaf7fd9	3335	Solčava
00050000-5589-5b3e-3656-49f483020325	5250	Solkan
00050000-5589-5b3e-fe8d-200b032f4f2e	4229	Sorica
00050000-5589-5b3e-745b-3810cce958c1	4225	Sovodenj
00050000-5589-5b3e-2f4a-d0a66049388f	5281	Spodnja Idrija
00050000-5589-5b3e-e38c-6da6222b4bc1	2241	Spodnji Duplek
00050000-5589-5b3e-c56a-afb68f0a5a8b	9245	Spodnji Ivanjci
00050000-5589-5b3e-6b06-1900465e1013	2277	Središče ob Dravi
00050000-5589-5b3e-bd37-9dd9670651d6	4267	Srednja vas v Bohinju
00050000-5589-5b3e-c715-1cadbe7e8b10	8256	Sromlje 
00050000-5589-5b3e-5686-671dac7ba933	5224	Srpenica
00050000-5589-5b3e-ae58-14d3cda9f27c	1242	Stahovica
00050000-5589-5b3e-967c-7888c1f499b2	1332	Stara Cerkev
00050000-5589-5b3e-de3b-1c2d81e0eb79	8342	Stari trg ob Kolpi
00050000-5589-5b3e-1fd5-212cac023ecd	1386	Stari trg pri Ložu
00050000-5589-5b3e-69c4-868b6342f1a3	2205	Starše
00050000-5589-5b3e-27f6-e91f0deca2a9	2289	Stoperce
00050000-5589-5b3e-e161-7a9d77e5e515	8322	Stopiče
00050000-5589-5b3e-728b-68d9abfacfd5	3206	Stranice
00050000-5589-5b3e-3a69-4ac1545ad16e	8351	Straža
00050000-5589-5b3e-1779-23f78430b43f	1313	Struge
00050000-5589-5b3e-e4b6-a91d8346e56b	8293	Studenec
00050000-5589-5b3e-ba89-c1221ab0ac01	8331	Suhor
00050000-5589-5b3e-7762-9ace43ca613d	2233	Sv. Ana v Slovenskih goricah
00050000-5589-5b3e-5d3d-aa023a5b2c80	2235	Sv. Trojica v Slovenskih goricah
00050000-5589-5b3e-e8f5-529b63a268c4	2353	Sveti Duh na Ostrem Vrhu
00050000-5589-5b3e-e75f-818fad0efd74	9244	Sveti Jurij ob Ščavnici
00050000-5589-5b3e-cc93-84b679799943	3264	Sveti Štefan
00050000-5589-5b3e-3e90-526ff40470b2	2258	Sveti Tomaž
00050000-5589-5b3e-a49b-5a593b5d8527	9204	Šalovci
00050000-5589-5b3e-cc38-8aa46d1e3040	5261	Šempas
00050000-5589-5b3e-d17c-7c2981c79e57	5290	Šempeter pri Gorici
00050000-5589-5b3e-a977-c3c401453041	3311	Šempeter v Savinjski dolini
00050000-5589-5b3e-ac9f-db5ef3800910	4208	Šenčur
00050000-5589-5b3e-423d-ec4097f36808	2212	Šentilj v Slovenskih goricah
00050000-5589-5b3e-77e3-7bea5466ea71	8297	Šentjanž
00050000-5589-5b3e-2b91-58f59d689dac	2373	Šentjanž pri Dravogradu
00050000-5589-5b3e-70c2-a7cd2b9a0c0d	8310	Šentjernej
00050000-5589-5b3e-4c05-65933f1ec10b	3230	Šentjur
00050000-5589-5b3e-1297-0680040b4055	3271	Šentrupert
00050000-5589-5b3e-1913-6922026da8cf	8232	Šentrupert
00050000-5589-5b3e-e8da-c2e1b40a14c5	1296	Šentvid pri Stični
00050000-5589-5b3e-3441-ea2ca3ad869e	8275	Škocjan
00050000-5589-5b3e-7dad-59f854e57fdf	6281	Škofije
00050000-5589-5b3e-c8e4-faf2eba7b783	4220	Škofja Loka
00050000-5589-5b3e-99c0-485d2123b0ec	3211	Škofja vas
00050000-5589-5b3e-1014-bab39d7911f7	1291	Škofljica
00050000-5589-5b3e-2653-746c3f38351a	6274	Šmarje
00050000-5589-5b3e-816a-3820efacdcde	1293	Šmarje - Sap
00050000-5589-5b3e-dc16-b3bc4cf72ad0	3240	Šmarje pri Jelšah
00050000-5589-5b3e-989b-296621d96a2f	8220	Šmarješke Toplice
00050000-5589-5b3e-8177-9c21d28cbc9b	2315	Šmartno na Pohorju
00050000-5589-5b3e-953e-39aef9ca29c9	3341	Šmartno ob Dreti
00050000-5589-5b3e-ab29-5984ff797279	3327	Šmartno ob Paki
00050000-5589-5b3e-8f83-a2e363539915	1275	Šmartno pri Litiji
00050000-5589-5b3e-29ee-4e49cc9f61c0	2383	Šmartno pri Slovenj Gradcu
00050000-5589-5b3e-f9e9-eba66178d26d	3201	Šmartno v Rožni dolini
00050000-5589-5b3e-7529-a2b77780b576	3325	Šoštanj
00050000-5589-5b3e-29f0-d1570a589e8e	6222	Štanjel
00050000-5589-5b3e-ddf6-ae0585140936	3220	Štore
00050000-5589-5b3e-3675-03fb66a88ced	3304	Tabor
00050000-5589-5b3e-3496-7ac78ea152b0	3221	Teharje
00050000-5589-5b3e-9b7d-cc5c6a7e36a1	9251	Tišina
00050000-5589-5b3e-24e2-59344201fb37	5220	Tolmin
00050000-5589-5b3e-c63c-ae4cceb814ea	3326	Topolšica
00050000-5589-5b3e-d540-d1d7dd9b86a9	2371	Trbonje
00050000-5589-5b3e-29d3-8863123d9214	1420	Trbovlje
00050000-5589-5b3e-e6d9-6a7b660e1325	8231	Trebelno 
00050000-5589-5b3e-b98b-52dc1cb6bd7a	8210	Trebnje
00050000-5589-5b3e-39a9-e47884199fa1	5252	Trnovo pri Gorici
00050000-5589-5b3e-2e7e-eb0384a2d335	2254	Trnovska vas
00050000-5589-5b3e-d96f-d9862f525d1f	1222	Trojane
00050000-5589-5b3e-cde9-ed247d4dffa1	1236	Trzin
00050000-5589-5b3e-29a9-445cffdf9afa	4290	Tržič
00050000-5589-5b3e-409e-eb0c5b5928fc	8295	Tržišče
00050000-5589-5b3e-c903-870f36142f8b	1311	Turjak
00050000-5589-5b3e-c203-bc633e68ac1e	9224	Turnišče
00050000-5589-5b3e-cb97-4e83c63e74a2	8323	Uršna sela
00050000-5589-5b3e-94ac-abd46b4b05ff	1252	Vače
00050000-5589-5b3e-8b49-14cd1718b73c	3320	Velenje 
00050000-5589-5b3e-4ed8-820d22366287	3322	Velenje - poštni predali
00050000-5589-5b3e-a647-70806da05eb3	8212	Velika Loka
00050000-5589-5b3e-1a26-821eaabebaca	2274	Velika Nedelja
00050000-5589-5b3e-16ba-5b6c4e0c83aa	9225	Velika Polana
00050000-5589-5b3e-6334-0c34e0da571a	1315	Velike Lašče
00050000-5589-5b3e-6200-0d7a57907fb2	8213	Veliki Gaber
00050000-5589-5b3e-f909-a49c005e58c2	9241	Veržej
00050000-5589-5b3e-f645-81c981e90d05	1312	Videm - Dobrepolje
00050000-5589-5b3e-7ec7-afa44676335a	2284	Videm pri Ptuju
00050000-5589-5b3e-782d-0d99bc63bad3	8344	Vinica
00050000-5589-5b3e-3178-c73edf4b7144	5271	Vipava
00050000-5589-5b3e-54d9-a2906e8de566	4212	Visoko
00050000-5589-5b3e-ecdf-841238ed1c39	1294	Višnja Gora
00050000-5589-5b3e-f6fe-6726e119ecd0	3205	Vitanje
00050000-5589-5b3e-6041-23d85924f020	2255	Vitomarci
00050000-5589-5b3e-3a10-a2f0096839ba	1217	Vodice
00050000-5589-5b3e-045d-7894d6e46fdc	3212	Vojnik\t
00050000-5589-5b3e-8d8a-6b9fd193ba60	5293	Volčja Draga
00050000-5589-5b3e-d160-2533d215ad39	2232	Voličina
00050000-5589-5b3e-c185-c9e4fc6fdad5	3305	Vransko
00050000-5589-5b3e-dd68-9d9cbc561211	6217	Vremski Britof
00050000-5589-5b3e-5abf-29ece3c0d0b0	1360	Vrhnika
00050000-5589-5b3e-512d-0937ef56d237	2365	Vuhred
00050000-5589-5b3e-763f-200a86f86d0c	2367	Vuzenica
00050000-5589-5b3e-62e6-edc61f5de417	8292	Zabukovje 
00050000-5589-5b3e-8c5f-28005279f193	1410	Zagorje ob Savi
00050000-5589-5b3e-ddaa-e800852e94ee	1303	Zagradec
00050000-5589-5b3e-4cef-60f6a5b3ddd1	2283	Zavrč
00050000-5589-5b3e-646a-53425149a7e1	8272	Zdole 
00050000-5589-5b3e-bd59-b517238ff239	4201	Zgornja Besnica
00050000-5589-5b3e-92f8-4da18e8cf198	2242	Zgornja Korena
00050000-5589-5b3e-ff83-bafd89b99e0d	2201	Zgornja Kungota
00050000-5589-5b3e-45d2-2514c6e98fc4	2316	Zgornja Ložnica
00050000-5589-5b3e-3d67-71c4d440b64a	2314	Zgornja Polskava
00050000-5589-5b3e-2b94-860ba8e6a9c6	2213	Zgornja Velka
00050000-5589-5b3e-e378-30657bafa663	4247	Zgornje Gorje
00050000-5589-5b3e-e43f-d5e03a8972f0	4206	Zgornje Jezersko
00050000-5589-5b3e-5cb3-a7357f88f232	2285	Zgornji Leskovec
00050000-5589-5b3e-50dd-232e4bc4633c	1432	Zidani Most
00050000-5589-5b3e-86a5-5658900799fb	3214	Zreče
00050000-5589-5b3e-e6c1-70f1db94465f	4209	Žabnica
00050000-5589-5b3e-0dfb-66b9f2621d25	3310	Žalec
00050000-5589-5b3e-5ba9-bc5b668ef683	4228	Železniki
00050000-5589-5b3e-4df4-a970b9818068	2287	Žetale
00050000-5589-5b3e-fd70-5be3d71fafb5	4226	Žiri
00050000-5589-5b3e-c256-6b0c2c1023e0	4274	Žirovnica
00050000-5589-5b3e-7e03-c4eca2029c5c	8360	Žužemberk
\.


--
-- TOC entry 2877 (class 0 OID 8052481)
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
-- TOC entry 2859 (class 0 OID 8052292)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 8052370)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8052493)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8052613)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantieme, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 8052666)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5589-5b3f-1e20-f4a33454f2d5	00080000-5589-5b3f-8e10-68dacd1a3977	0900	AK
00190000-5589-5b3f-db83-857490e0455d	00080000-5589-5b3f-b300-4392bcc0eb80	0987	A
00190000-5589-5b3f-67d9-8a9a7f4afcb5	00080000-5589-5b3f-aed4-29e07c425b8d	0989	A
\.


--
-- TOC entry 2903 (class 0 OID 8052801)
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
-- TOC entry 2883 (class 0 OID 8052522)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5589-5b3f-3f74-d5345f41dfe8	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5589-5b3f-94e8-2477ecd04374	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5589-5b3f-e3f8-c42447f45822	0003	Kazinska	t	84	Kazinska dvorana
00220000-5589-5b3f-9075-ab3316891027	0004	Mali oder	t	24	Mali oder 
00220000-5589-5b3f-5608-403bec877055	0005	Komorni oder	t	15	Komorni oder
00220000-5589-5b3f-da96-2674c6ddac79	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5589-5b3f-9eeb-402c52c46824	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2875 (class 0 OID 8052466)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8052456)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8052655)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8052590)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 8052164)
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
-- TOC entry 2884 (class 0 OID 8052532)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 8052202)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5589-5b3d-8fdd-2b5aec6c4ab8	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5589-5b3d-949b-9bcdbc1c20b9	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5589-5b3d-ec3a-0d8ae3857aaf	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5589-5b3d-e950-52fea355eca4	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5589-5b3d-a51f-72fc88a50263	planer	Planer dogodkov v koledarju	t
00020000-5589-5b3d-f2c3-c01f3e29c080	kadrovska	Kadrovska služba	t
00020000-5589-5b3d-8416-71a78b0f3e18	arhivar	Ažuriranje arhivalij	t
00020000-5589-5b3d-899f-58e66f16a391	igralec	Igralec	t
00020000-5589-5b3d-d187-daa8124a0395	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5589-5b3f-52fa-bf4f3726073c	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2850 (class 0 OID 8052186)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5589-5b3d-3f6b-a8fde6acc37f	00020000-5589-5b3d-ec3a-0d8ae3857aaf
00010000-5589-5b3d-48bb-6d1c99f8dfd2	00020000-5589-5b3d-ec3a-0d8ae3857aaf
00010000-5589-5b3f-5bd4-0ee62f55a5de	00020000-5589-5b3f-52fa-bf4f3726073c
\.


--
-- TOC entry 2886 (class 0 OID 8052546)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 8052487)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8052437)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 8052845)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5589-5b3e-636b-18b6b7a406df	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5589-5b3e-7200-cdf0a19eb906	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5589-5b3e-6374-919f835c435b	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5589-5b3e-52a6-3c6dbba3cc42	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5589-5b3e-2b3f-fc11a8fed4ec	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2907 (class 0 OID 8052837)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5589-5b3e-8bf9-568a6857bac6	00230000-5589-5b3e-52a6-3c6dbba3cc42	popa
00240000-5589-5b3e-6bca-1c15e577ca14	00230000-5589-5b3e-52a6-3c6dbba3cc42	oseba
00240000-5589-5b3e-4b25-adab9804522a	00230000-5589-5b3e-7200-cdf0a19eb906	prostor
00240000-5589-5b3e-b393-2696ca9d2985	00230000-5589-5b3e-52a6-3c6dbba3cc42	besedilo
00240000-5589-5b3e-cdb9-6bac63b1f79b	00230000-5589-5b3e-52a6-3c6dbba3cc42	uprizoritev
00240000-5589-5b3e-c1d0-373b276fc653	00230000-5589-5b3e-52a6-3c6dbba3cc42	funkcija
00240000-5589-5b3e-6eb4-18ac4e1576a0	00230000-5589-5b3e-52a6-3c6dbba3cc42	tipfunkcije
00240000-5589-5b3e-3cb6-9cf0b0e52ba0	00230000-5589-5b3e-52a6-3c6dbba3cc42	alternacija
00240000-5589-5b3e-8ef8-7329caf74a5d	00230000-5589-5b3e-636b-18b6b7a406df	pogodba
00240000-5589-5b3e-9ac0-3598739055b2	00230000-5589-5b3e-52a6-3c6dbba3cc42	zaposlitev
\.


--
-- TOC entry 2906 (class 0 OID 8052832)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8052600)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5589-5b3f-23f3-adbb49c7c5a1	000e0000-5589-5b3f-343d-5fa48158791d	00080000-5589-5b3f-8f92-b487453cd234	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5589-5b3f-47b7-cb27e3ddc8ce	000e0000-5589-5b3f-343d-5fa48158791d	00080000-5589-5b3f-8f92-b487453cd234	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5589-5b3f-7f3e-16d796ac3f99	000e0000-5589-5b3f-343d-5fa48158791d	00080000-5589-5b3f-8181-60aa5a5cb5f0	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2857 (class 0 OID 8052264)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8052443)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5589-5b3f-4e5e-fad13455661d	00180000-5589-5b3f-2b20-99785706a517	000c0000-5589-5b3f-7938-1d091875a479	00090000-5589-5b3f-46a1-2ee7d2076435	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5589-5b3f-1587-b0f8c10f562f	00180000-5589-5b3f-2b20-99785706a517	000c0000-5589-5b3f-0991-ee2c21c09b63	00090000-5589-5b3f-a9bb-8a7ce4f38937	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5589-5b3f-3474-2a32c1c51812	00180000-5589-5b3f-2b20-99785706a517	000c0000-5589-5b3f-e49b-4227a1b1ae07	00090000-5589-5b3f-0df4-1818363d7008	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5589-5b3f-1d7f-081242cdf567	00180000-5589-5b3f-2b20-99785706a517	000c0000-5589-5b3f-1c0d-1878a41a040e	00090000-5589-5b3f-eb32-46b7b7411746	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5589-5b3f-baae-2c12d350648c	00180000-5589-5b3f-2b20-99785706a517	000c0000-5589-5b3f-4c16-568a7d997379	00090000-5589-5b3f-1b6b-24670b688c05	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5589-5b3f-841a-0d2a752b337f	00180000-5589-5b3f-353c-fb28a28a692c	\N	00090000-5589-5b3f-1b6b-24670b688c05	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2894 (class 0 OID 8052644)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5589-5b3e-58fb-44f8e1c3b97d	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5589-5b3e-a7ad-4a5ed99da496	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5589-5b3e-853f-9ac193d0152d	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5589-5b3e-8bcc-4789776c6cf9	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5589-5b3e-6f81-cc3adafea87b	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5589-5b3e-5316-a71902a7625a	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5589-5b3e-fa33-d758907dfdad	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5589-5b3e-4a14-7c93b82842e0	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5589-5b3e-fb9f-0339fd2b0f92	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5589-5b3e-7d5c-3d9c8202b1cf	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5589-5b3e-d661-1d08fd4455bb	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5589-5b3e-8b28-b4fcafce3746	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5589-5b3e-1ef1-efeb4ca8f6cb	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5589-5b3e-8844-cb5b6d00ce27	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5589-5b3e-0ab6-ba2f4d8dbe1e	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5589-5b3e-aa6a-bec371cb46a4	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2904 (class 0 OID 8052814)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5589-5b3e-f198-5dcdd7f4c1ee	01	Velika predstava	f	1.00	1.00
002b0000-5589-5b3e-2cb0-b86e863a302f	02	Mala predstava	f	0.50	0.50
002b0000-5589-5b3e-9c68-87fe3bcbe461	03	Mala koprodukcija	t	0.40	1.00
002b0000-5589-5b3e-cb8c-091ddb2c2bb6	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5589-5b3e-9751-749e1ae2de83	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2862 (class 0 OID 8052327)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 8052173)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5589-5b3d-48bb-6d1c99f8dfd2	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROnL4ixuy5n.I3zoX33SGkLQReBliPeYq	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5589-5b3f-4fd2-ffca85fa83b2	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5589-5b3f-8d96-35e06ed47173	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5589-5b3f-5828-8a8854f77b2d	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5589-5b3f-acf0-360c045fbc78	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5589-5b3f-f024-6eb078e3030e	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5589-5b3f-b913-4d1f2b7ac85b	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5589-5b3f-857c-de4c8cf2ae0e	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5589-5b3f-85ec-5ad2dbf82064	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5589-5b3f-2500-b09c12ced464	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5589-5b3f-5bd4-0ee62f55a5de	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5589-5b3d-3f6b-a8fde6acc37f	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2899 (class 0 OID 8052701)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5589-5b3f-be24-85d590746d63	00160000-5589-5b3f-9dcc-8d04351807a7	00150000-5589-5b3e-b801-4c21edde2ac0	00140000-5589-5b3d-d35f-c62fbf31881a	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5589-5b3f-5608-403bec877055
000e0000-5589-5b3f-343d-5fa48158791d	00160000-5589-5b3f-2fc9-bb74a50fbbb1	00150000-5589-5b3e-4ff8-9948943907bc	00140000-5589-5b3d-3561-d8b6dec8de66	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5589-5b3f-da96-2674c6ddac79
000e0000-5589-5b3f-5343-bcaf4a94c7fb	\N	00150000-5589-5b3e-4ff8-9948943907bc	00140000-5589-5b3d-3561-d8b6dec8de66	00190000-5589-5b3f-db83-857490e0455d	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5589-5b3f-5608-403bec877055
000e0000-5589-5b3f-356c-5e0ae51083ad	\N	00150000-5589-5b3e-4ff8-9948943907bc	00140000-5589-5b3d-3561-d8b6dec8de66	00190000-5589-5b3f-db83-857490e0455d	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5589-5b3f-5608-403bec877055
\.


--
-- TOC entry 2867 (class 0 OID 8052389)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5589-5b3f-0017-ef2a596a4282	000e0000-5589-5b3f-343d-5fa48158791d	1	
00200000-5589-5b3f-3d6d-caf1266dcb33	000e0000-5589-5b3f-343d-5fa48158791d	2	
\.


--
-- TOC entry 2882 (class 0 OID 8052514)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8052583)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 8052421)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 8052691)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5589-5b3d-d35f-c62fbf31881a	01	Drama	drama (SURS 01)
00140000-5589-5b3d-674e-405d4cf01977	02	Opera	opera (SURS 02)
00140000-5589-5b3d-36cb-180535474a68	03	Balet	balet (SURS 03)
00140000-5589-5b3d-4e68-f63a17b55ec6	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5589-5b3d-9b98-14e057642696	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5589-5b3d-3561-d8b6dec8de66	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5589-5b3d-be35-180ea20285d5	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2888 (class 0 OID 8052573)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5589-5b3e-0c37-83c6a5e55247	01	Opera	opera
00150000-5589-5b3e-f73b-2b9bcb3fe2bb	02	Opereta	opereta
00150000-5589-5b3e-688b-5b3c2cc71dac	03	Balet	balet
00150000-5589-5b3e-29b6-6be30d5aa6ef	04	Plesne prireditve	plesne prireditve
00150000-5589-5b3e-a244-d65d81916edb	05	Lutkovno gledališče	lutkovno gledališče
00150000-5589-5b3e-d375-c0552e5cfc5e	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5589-5b3e-ed42-df99ecfa0735	07	Biografska drama	biografska drama
00150000-5589-5b3e-b801-4c21edde2ac0	08	Komedija	komedija
00150000-5589-5b3e-9a7c-ddab3b2f2724	09	Črna komedija	črna komedija
00150000-5589-5b3e-c51b-90adb06376ed	10	E-igra	E-igra
00150000-5589-5b3e-4ff8-9948943907bc	11	Kriminalka	kriminalka
00150000-5589-5b3e-a0a3-f0f1ced037a0	12	Musical	musical
\.


--
-- TOC entry 2439 (class 2606 OID 8052227)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 8052748)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8052738)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8052643)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 8052411)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 8052436)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 8052830)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 8052353)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 8052796)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 8052569)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8052387)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 8052430)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 8052367)
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
-- TOC entry 2531 (class 2606 OID 8052479)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 8052506)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 8052325)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 8052236)
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
-- TOC entry 2446 (class 2606 OID 8052260)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 8052216)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2430 (class 2606 OID 8052201)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 8052512)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 8052545)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 8052686)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 8052289)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 8052313)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 8052485)
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
-- TOC entry 2461 (class 2606 OID 8052303)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 8052374)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 8052497)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 8052625)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 8052671)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 8052812)
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
-- TOC entry 2551 (class 2606 OID 8052529)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 8052470)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 8052461)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 8052665)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 8052597)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 8052172)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 8052536)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 8052190)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2432 (class 2606 OID 8052210)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 8052554)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8052492)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 8052442)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 8052854)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 8052842)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 8052836)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 8052610)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 8052269)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 8052452)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8052654)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 8052824)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 8052338)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8052185)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 8052717)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 8052396)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 8052520)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 8052588)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 8052425)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 8052699)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 8052581)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 1259 OID 8052418)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2579 (class 1259 OID 8052611)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2580 (class 1259 OID 8052612)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2453 (class 1259 OID 8052291)
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
-- TOC entry 2544 (class 1259 OID 8052513)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2538 (class 1259 OID 8052499)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2539 (class 1259 OID 8052498)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2490 (class 1259 OID 8052397)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2566 (class 1259 OID 8052570)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2567 (class 1259 OID 8052572)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2568 (class 1259 OID 8052571)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2478 (class 1259 OID 8052369)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2479 (class 1259 OID 8052368)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 8052688)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2598 (class 1259 OID 8052689)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 8052690)
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
-- TOC entry 2606 (class 1259 OID 8052722)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2607 (class 1259 OID 8052719)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2608 (class 1259 OID 8052723)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2609 (class 1259 OID 8052721)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2610 (class 1259 OID 8052720)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2468 (class 1259 OID 8052340)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2469 (class 1259 OID 8052339)
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
-- TOC entry 2444 (class 1259 OID 8052263)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2554 (class 1259 OID 8052537)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2508 (class 1259 OID 8052431)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2434 (class 1259 OID 8052217)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2435 (class 1259 OID 8052218)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2559 (class 1259 OID 8052557)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2560 (class 1259 OID 8052556)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2561 (class 1259 OID 8052555)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2482 (class 1259 OID 8052375)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2483 (class 1259 OID 8052377)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2484 (class 1259 OID 8052376)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2642 (class 1259 OID 8052844)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2518 (class 1259 OID 8052465)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2519 (class 1259 OID 8052463)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2520 (class 1259 OID 8052462)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2521 (class 1259 OID 8052464)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2425 (class 1259 OID 8052191)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2426 (class 1259 OID 8052192)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2547 (class 1259 OID 8052521)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2533 (class 1259 OID 8052486)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2575 (class 1259 OID 8052598)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2576 (class 1259 OID 8052599)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2628 (class 1259 OID 8052800)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2629 (class 1259 OID 8052797)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2630 (class 1259 OID 8052798)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2631 (class 1259 OID 8052799)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2457 (class 1259 OID 8052305)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2458 (class 1259 OID 8052304)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2459 (class 1259 OID 8052306)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2418 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2583 (class 1259 OID 8052626)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2584 (class 1259 OID 8052627)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2620 (class 1259 OID 8052752)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2621 (class 1259 OID 8052754)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2622 (class 1259 OID 8052750)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2623 (class 1259 OID 8052753)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2624 (class 1259 OID 8052751)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2572 (class 1259 OID 8052589)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 8052474)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2525 (class 1259 OID 8052473)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2526 (class 1259 OID 8052471)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2527 (class 1259 OID 8052472)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2396 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2616 (class 1259 OID 8052740)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2617 (class 1259 OID 8052739)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2632 (class 1259 OID 8052813)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2489 (class 1259 OID 8052388)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2639 (class 1259 OID 8052831)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2440 (class 1259 OID 8052238)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2441 (class 1259 OID 8052237)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2449 (class 1259 OID 8052270)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2450 (class 1259 OID 8052271)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2513 (class 1259 OID 8052455)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2514 (class 1259 OID 8052454)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2515 (class 1259 OID 8052453)
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
-- TOC entry 2496 (class 1259 OID 8052420)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2497 (class 1259 OID 8052416)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2498 (class 1259 OID 8052413)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2499 (class 1259 OID 8052414)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2500 (class 1259 OID 8052412)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2501 (class 1259 OID 8052417)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2502 (class 1259 OID 8052415)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2456 (class 1259 OID 8052290)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2474 (class 1259 OID 8052354)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2475 (class 1259 OID 8052356)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2476 (class 1259 OID 8052355)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2477 (class 1259 OID 8052357)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2532 (class 1259 OID 8052480)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2602 (class 1259 OID 8052687)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2611 (class 1259 OID 8052718)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2447 (class 1259 OID 8052261)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2448 (class 1259 OID 8052262)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2569 (class 1259 OID 8052582)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 8052855)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2467 (class 1259 OID 8052326)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2645 (class 1259 OID 8052843)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2552 (class 1259 OID 8052531)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2553 (class 1259 OID 8052530)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 8052749)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2399 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2464 (class 1259 OID 8052314)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 8052700)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2595 (class 1259 OID 8052672)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2596 (class 1259 OID 8052673)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2433 (class 1259 OID 8052211)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2503 (class 1259 OID 8052419)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2674 (class 2606 OID 8052991)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2677 (class 2606 OID 8052976)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2676 (class 2606 OID 8052981)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2672 (class 2606 OID 8053001)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2678 (class 2606 OID 8052971)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2673 (class 2606 OID 8052996)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2675 (class 2606 OID 8052986)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2708 (class 2606 OID 8053146)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2707 (class 2606 OID 8053151)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2659 (class 2606 OID 8052906)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2695 (class 2606 OID 8053086)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2693 (class 2606 OID 8053081)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2694 (class 2606 OID 8053076)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2671 (class 2606 OID 8052966)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2703 (class 2606 OID 8053116)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2701 (class 2606 OID 8053126)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2702 (class 2606 OID 8053121)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2665 (class 2606 OID 8052941)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2666 (class 2606 OID 8052936)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2691 (class 2606 OID 8053066)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2714 (class 2606 OID 8053171)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2713 (class 2606 OID 8053176)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2712 (class 2606 OID 8053181)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2716 (class 2606 OID 8053201)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2719 (class 2606 OID 8053186)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2715 (class 2606 OID 8053206)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2717 (class 2606 OID 8053196)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2718 (class 2606 OID 8053191)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2663 (class 2606 OID 8052931)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2664 (class 2606 OID 8052926)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2655 (class 2606 OID 8052891)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2656 (class 2606 OID 8052886)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2697 (class 2606 OID 8053096)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2679 (class 2606 OID 8053006)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2652 (class 2606 OID 8052866)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2651 (class 2606 OID 8052871)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2698 (class 2606 OID 8053111)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2699 (class 2606 OID 8053106)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2700 (class 2606 OID 8053101)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2669 (class 2606 OID 8052946)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2667 (class 2606 OID 8052956)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2668 (class 2606 OID 8052951)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2733 (class 2606 OID 8053276)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2683 (class 2606 OID 8053041)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2685 (class 2606 OID 8053031)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2686 (class 2606 OID 8053026)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2684 (class 2606 OID 8053036)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2650 (class 2606 OID 8052856)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2649 (class 2606 OID 8052861)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2696 (class 2606 OID 8053091)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2692 (class 2606 OID 8053071)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2706 (class 2606 OID 8053136)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2705 (class 2606 OID 8053141)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2727 (class 2606 OID 8053261)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2730 (class 2606 OID 8053246)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 8053251)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2728 (class 2606 OID 8053256)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2661 (class 2606 OID 8052916)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2662 (class 2606 OID 8052911)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 8052921)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2710 (class 2606 OID 8053156)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2709 (class 2606 OID 8053161)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2724 (class 2606 OID 8053231)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2722 (class 2606 OID 8053241)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2726 (class 2606 OID 8053221)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2723 (class 2606 OID 8053236)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2725 (class 2606 OID 8053226)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2704 (class 2606 OID 8053131)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2687 (class 2606 OID 8053061)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2688 (class 2606 OID 8053056)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2690 (class 2606 OID 8053046)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2689 (class 2606 OID 8053051)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2720 (class 2606 OID 8053216)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2721 (class 2606 OID 8053211)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2731 (class 2606 OID 8053266)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2670 (class 2606 OID 8052961)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2711 (class 2606 OID 8053166)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 8053271)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2653 (class 2606 OID 8052881)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2654 (class 2606 OID 8052876)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2658 (class 2606 OID 8052896)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2657 (class 2606 OID 8052901)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2680 (class 2606 OID 8053021)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2681 (class 2606 OID 8053016)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2682 (class 2606 OID 8053011)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-06-23 15:12:32 CEST

--
-- PostgreSQL database dump complete
--

