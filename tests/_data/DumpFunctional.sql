--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-29 16:51:51 CEST

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
-- TOC entry 183 (class 1259 OID 8447385)
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
-- TOC entry 230 (class 1259 OID 8447903)
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
-- TOC entry 229 (class 1259 OID 8447886)
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
-- TOC entry 222 (class 1259 OID 8447790)
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
-- TOC entry 197 (class 1259 OID 8447564)
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
-- TOC entry 200 (class 1259 OID 8447598)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8447992)
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
-- TOC entry 192 (class 1259 OID 8447507)
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
-- TOC entry 231 (class 1259 OID 8447916)
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
-- TOC entry 216 (class 1259 OID 8447724)
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
-- TOC entry 195 (class 1259 OID 8447544)
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
-- TOC entry 199 (class 1259 OID 8447592)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8447524)
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
-- TOC entry 205 (class 1259 OID 8447641)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8447666)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8447481)
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
-- TOC entry 184 (class 1259 OID 8447394)
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
-- TOC entry 185 (class 1259 OID 8447405)
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
-- TOC entry 180 (class 1259 OID 8447359)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8447378)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8447673)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8447704)
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
-- TOC entry 226 (class 1259 OID 8447836)
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
-- TOC entry 187 (class 1259 OID 8447438)
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
-- TOC entry 189 (class 1259 OID 8447473)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8447647)
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
-- TOC entry 188 (class 1259 OID 8447458)
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
-- TOC entry 194 (class 1259 OID 8447536)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8447659)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8447779)
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
-- TOC entry 225 (class 1259 OID 8447828)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8447962)
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
    stpremier integer,
    stponprej integer,
    stponprejvelikih integer,
    stponprejmalih integer,
    stponprejmalihkopr integer,
    stponprejsredkopr integer,
    stponprejvelikihkopr integer,
    vrps1 numeric(12,2) DEFAULT NULL::numeric,
    vrps1do numeric(12,2) DEFAULT NULL::numeric,
    vrps1mat numeric(12,2) DEFAULT NULL::numeric,
    vrps1gostovsz numeric(12,2) DEFAULT NULL::numeric,
    stnekomerc integer,
    stponprem integer,
    stprej integer,
    stgostuj integer,
    stostalihnek integer,
    stgostovanjslo integer,
    stgostovanjzam integer,
    stgostovanjint integer,
    stobisknekom integer,
    stobisknekommat integer,
    stobisknekomgostslo integer,
    stobisknekomgostzam integer,
    stobisknekomgostint integer,
    avgobiskprired numeric(12,2) DEFAULT NULL::numeric,
    avgzaseddvoran numeric(12,2) DEFAULT NULL::numeric,
    avgcenavstopnice numeric(12,2) DEFAULT NULL::numeric,
    stprodvstopnic integer,
    stkoprodukcij integer,
    stkoprodukcijint integer,
    stkoprodukcijnvo integer,
    stzaposlenih integer,
    stzaposigralcev integer,
    avgstnastopovigr numeric(12,2) DEFAULT NULL::numeric,
    sthonorarnih integer,
    sthonorarnihigr integer,
    sthonorarnihigrtujjz integer,
    sredstvaint numeric(12,2) DEFAULT NULL::numeric,
    sredstvaavt numeric(12,2) DEFAULT NULL::numeric
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
-- TOC entry 212 (class 1259 OID 8447688)
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
-- TOC entry 204 (class 1259 OID 8447632)
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
-- TOC entry 203 (class 1259 OID 8447622)
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
-- TOC entry 224 (class 1259 OID 8447817)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8447756)
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
-- TOC entry 177 (class 1259 OID 8447330)
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
-- TOC entry 176 (class 1259 OID 8447328)
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
-- TOC entry 213 (class 1259 OID 8447698)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8447368)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8447352)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8447712)
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
-- TOC entry 207 (class 1259 OID 8447653)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8447603)
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
-- TOC entry 237 (class 1259 OID 8448012)
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
-- TOC entry 236 (class 1259 OID 8448004)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8447999)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8447766)
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
-- TOC entry 186 (class 1259 OID 8447430)
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
-- TOC entry 202 (class 1259 OID 8447609)
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
-- TOC entry 223 (class 1259 OID 8447806)
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
-- TOC entry 233 (class 1259 OID 8447981)
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
-- TOC entry 191 (class 1259 OID 8447493)
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
-- TOC entry 178 (class 1259 OID 8447339)
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
-- TOC entry 228 (class 1259 OID 8447863)
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
-- TOC entry 196 (class 1259 OID 8447555)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8447680)
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
-- TOC entry 218 (class 1259 OID 8447749)
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
-- TOC entry 198 (class 1259 OID 8447587)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8447853)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8447739)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8447333)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2854 (class 0 OID 8447385)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 8447903)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5591-5b86-40d5-cc8f3bbbdf7a	000d0000-5591-5b86-3bc8-550b5878db6e	\N	00090000-5591-5b86-1994-ccee6da7b2d0	000b0000-5591-5b86-837e-d1e21dc5c407	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5591-5b86-11a9-c5afc3ba6172	000d0000-5591-5b86-2e1e-838670f6f826	\N	00090000-5591-5b86-1111-92b838057fee	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5591-5b86-617a-00bf0088997a	000d0000-5591-5b86-ca52-e62599330a0b	\N	00090000-5591-5b86-b5f0-549944b0a7c9	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5591-5b86-1fb5-7108bcd1bdad	000d0000-5591-5b86-357e-1f46cd06d620	\N	00090000-5591-5b86-840c-e379d654b745	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5591-5b86-4194-6ed9f6702460	000d0000-5591-5b86-f821-0c0b8f4f4361	\N	00090000-5591-5b86-0964-a01a9a8e7e43	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5591-5b86-8c8c-861acb511c90	000d0000-5591-5b86-ac6e-1886c69416e5	\N	00090000-5591-5b86-1111-92b838057fee	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2900 (class 0 OID 8447886)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 8447790)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5591-5b85-fdda-223c31e2cf65	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5591-5b85-db16-114cb5553a08	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5591-5b85-2115-5ade46170d4e	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2868 (class 0 OID 8447564)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5591-5b86-43af-bb1f43870e42	\N	\N	00200000-5591-5b86-fa9a-b660086173f5	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5591-5b86-5ec9-023ab6c5cd32	\N	\N	00200000-5591-5b86-0a0d-703f183989ec	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5591-5b86-5664-046fc92bb36c	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5591-5b86-52b7-e313e264dada	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5591-5b86-4a46-d5fa1abe118b	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2871 (class 0 OID 8447598)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 8447992)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8447507)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5591-5b84-901e-b81925d4c1d7	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5591-5b84-27a5-6bcb7579e4a7	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5591-5b84-b172-35f49d1513ec	AL	ALB	008	Albania 	Albanija	\N
00040000-5591-5b84-4b05-d8682c50359a	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5591-5b84-cc6b-6ec4d44f8db6	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5591-5b84-dd7a-22c765c2773d	AD	AND	020	Andorra 	Andora	\N
00040000-5591-5b84-ac51-4cf82a442617	AO	AGO	024	Angola 	Angola	\N
00040000-5591-5b84-ab23-364488f863da	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5591-5b84-bf67-3f2a75742ad9	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5591-5b84-8243-edee26e6be89	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5591-5b84-5e8c-e0fa2e327fc0	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5591-5b84-b19e-acf3dcfdd598	AM	ARM	051	Armenia 	Armenija	\N
00040000-5591-5b84-9320-8febcbbdc1ab	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5591-5b84-d2fd-3e3755ce3c9a	AU	AUS	036	Australia 	Avstralija	\N
00040000-5591-5b84-3bd6-8915d5c00fa6	AT	AUT	040	Austria 	Avstrija	\N
00040000-5591-5b84-8203-8a81a55ef74b	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5591-5b84-7274-1abb45015f45	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5591-5b84-15d6-a62d31820f98	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5591-5b84-3b73-c6c977c628c8	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5591-5b84-92cc-20a6064d7b93	BB	BRB	052	Barbados 	Barbados	\N
00040000-5591-5b84-0f82-8502c85fd0a9	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5591-5b84-db81-25b8ea4ba915	BE	BEL	056	Belgium 	Belgija	\N
00040000-5591-5b84-6d89-398a2c20ede8	BZ	BLZ	084	Belize 	Belize	\N
00040000-5591-5b84-019c-ef0b2d0fd3df	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5591-5b84-7400-ed81b3f70ede	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5591-5b84-4f4e-5b9349f7ed8b	BT	BTN	064	Bhutan 	Butan	\N
00040000-5591-5b84-1d80-946d1995a0a4	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5591-5b84-ef56-e440bd6c90fd	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5591-5b84-282f-887772b8d7d4	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5591-5b84-bad0-922e318f9e78	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5591-5b84-65f4-da67392f028e	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5591-5b84-d30c-897de29e38b9	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5591-5b84-fc27-e28ad6f59543	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5591-5b84-e92b-54deb90d5aff	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5591-5b84-c952-3550117e65d2	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5591-5b84-b7bd-15ccb558f6ab	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5591-5b84-c2b5-05e751b78b9b	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5591-5b84-f3ab-dbc998c4a65b	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5591-5b84-3337-0af5a39e83f3	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5591-5b84-855a-3f59e7b7e996	CA	CAN	124	Canada 	Kanada	\N
00040000-5591-5b84-0152-fc0fc6b7df02	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5591-5b84-01ed-b1f4af78a93d	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5591-5b84-ba5d-5a40c656f6ca	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5591-5b84-f69c-67156ea7dedd	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5591-5b84-9174-093c488fc1aa	CL	CHL	152	Chile 	Čile	\N
00040000-5591-5b84-8375-168761c6d120	CN	CHN	156	China 	Kitajska	\N
00040000-5591-5b84-f1bb-b02a1e56d154	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5591-5b84-b0a8-27dd38de8fda	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5591-5b84-7528-67f0f9c35fbe	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5591-5b84-3b74-ae0aec949a8e	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5591-5b84-adbe-a9ce2414392d	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5591-5b84-5c44-5b7f858ef399	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5591-5b84-4202-789f8f1886df	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5591-5b84-c47e-8ff09b236f9f	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5591-5b84-2e5f-07441a727aa6	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5591-5b84-5833-6c628694b671	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5591-5b84-5eb8-d686c7e7e00b	CU	CUB	192	Cuba 	Kuba	\N
00040000-5591-5b84-16a4-469c99f8c194	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5591-5b84-d8ba-cdc960b777d4	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5591-5b84-83f1-b04de79fb820	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5591-5b84-22a9-0c3620f56f9e	DK	DNK	208	Denmark 	Danska	\N
00040000-5591-5b84-e97f-9a32fa979c91	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5591-5b84-10c4-cffd02bebfe4	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5591-5b84-0861-3d4f3150a8e7	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5591-5b84-e8bd-02629faa8f29	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5591-5b84-02a8-27f464bee76e	EG	EGY	818	Egypt 	Egipt	\N
00040000-5591-5b84-f420-60f2736e4326	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5591-5b84-ca3f-aa936655a03b	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5591-5b84-f66d-04e2c632ca20	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5591-5b84-b2e3-ed553aa330c9	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5591-5b84-ba91-3b1ab12051a6	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5591-5b84-7b93-96615db2cc75	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5591-5b84-2cba-7281d119cd3f	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5591-5b84-f3ff-a7cd2d01ca86	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5591-5b84-c7b1-6288ba03632c	FI	FIN	246	Finland 	Finska	\N
00040000-5591-5b84-7480-64b352f23618	FR	FRA	250	France 	Francija	\N
00040000-5591-5b84-064b-41720f01b1ca	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5591-5b84-77de-a5d85538da42	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5591-5b84-ea00-c0b247069a2a	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5591-5b84-1be2-5e3211c7658b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5591-5b84-7290-2a91eee0d965	GA	GAB	266	Gabon 	Gabon	\N
00040000-5591-5b84-b7c8-d02eec7ba080	GM	GMB	270	Gambia 	Gambija	\N
00040000-5591-5b84-8f6a-7478937e44a0	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5591-5b84-0cc1-35ed27714fc4	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5591-5b84-76fb-e62240534da2	GH	GHA	288	Ghana 	Gana	\N
00040000-5591-5b84-2f1f-a95facacc6ab	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5591-5b84-b443-c394719ec47a	GR	GRC	300	Greece 	Grčija	\N
00040000-5591-5b84-5742-b55144146d73	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5591-5b84-05f0-4aa2778dca88	GD	GRD	308	Grenada 	Grenada	\N
00040000-5591-5b84-e112-1e9d277725ac	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5591-5b84-8695-fc3ccda013f7	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5591-5b84-3702-d736f60ea478	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5591-5b84-ec38-acf1f58c6558	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5591-5b84-0728-5b1213f0f02b	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5591-5b84-559a-c6c8c0319570	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5591-5b84-5b2c-66837b6aad5d	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5591-5b84-6340-a5b603305e1b	HT	HTI	332	Haiti 	Haiti	\N
00040000-5591-5b84-2a8b-0b00b8232e72	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5591-5b84-b99b-cdc85680cd21	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5591-5b84-42b7-d44e8ec75ed0	HN	HND	340	Honduras 	Honduras	\N
00040000-5591-5b84-a2a6-e77dd1467d06	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5591-5b84-e0ec-38dee73b9ec6	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5591-5b84-2e03-7dc3aac9fb0a	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5591-5b84-9ed9-b752b3b8ab82	IN	IND	356	India 	Indija	\N
00040000-5591-5b84-e1e8-843532152cf8	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5591-5b84-a414-ff53444fb5e0	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5591-5b84-e90d-acebc7384e2a	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5591-5b84-ec12-72c096bb9605	IE	IRL	372	Ireland 	Irska	\N
00040000-5591-5b84-b3df-2216a0f22230	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5591-5b84-3b01-f4e5b0be0552	IL	ISR	376	Israel 	Izrael	\N
00040000-5591-5b84-c6a8-ccc2f9d6a8d5	IT	ITA	380	Italy 	Italija	\N
00040000-5591-5b84-da03-76d60e6f6318	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5591-5b84-975e-1b35ad6d9563	JP	JPN	392	Japan 	Japonska	\N
00040000-5591-5b84-b0e1-fef92533d6b6	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5591-5b84-aac7-918d189240f9	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5591-5b84-ef03-21bc318800bb	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5591-5b84-a94b-5c80b9aa7b2c	KE	KEN	404	Kenya 	Kenija	\N
00040000-5591-5b84-e12a-0ff28b9dd584	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5591-5b84-67c2-00522702f940	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5591-5b84-d3ff-d17c85601a5e	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5591-5b84-e5bd-16519249222e	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5591-5b84-f338-6b555b3b7e24	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5591-5b84-fa5e-f1112d736e2a	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5591-5b84-c90c-b12fce0abb02	LV	LVA	428	Latvia 	Latvija	\N
00040000-5591-5b84-d44c-c54217fa2af1	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5591-5b84-2d7d-cdf86195cf03	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5591-5b84-0d2e-3d8c92e06ff4	LR	LBR	430	Liberia 	Liberija	\N
00040000-5591-5b84-9383-55ecc7edb5a3	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5591-5b84-a236-e9055ff3d897	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5591-5b84-0dad-4dc5ee957138	LT	LTU	440	Lithuania 	Litva	\N
00040000-5591-5b84-d2b9-9d4e54f190a3	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5591-5b84-8eee-f9227e6502ad	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5591-5b84-08c6-752a77258ed9	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5591-5b84-5033-e07b7714d7be	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5591-5b84-23e0-cda7925ef53a	MW	MWI	454	Malawi 	Malavi	\N
00040000-5591-5b84-7590-37bb4153f759	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5591-5b84-4409-7cec83632a5c	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5591-5b84-110d-6601bbcdcd2d	ML	MLI	466	Mali 	Mali	\N
00040000-5591-5b84-74b8-0784ea04512b	MT	MLT	470	Malta 	Malta	\N
00040000-5591-5b84-8a08-cabce772b84e	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5591-5b84-5120-4f6fff513a83	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5591-5b84-048d-c2a4704eaca6	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5591-5b84-a48b-e4e871063774	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5591-5b84-47fd-67da0da2dc74	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5591-5b84-a668-4aa30bbea48d	MX	MEX	484	Mexico 	Mehika	\N
00040000-5591-5b84-d9e4-4c92f3b90a74	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5591-5b84-e5a7-c5cbf0895819	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5591-5b84-5bd1-86c1e5eb6cb2	MC	MCO	492	Monaco 	Monako	\N
00040000-5591-5b84-d6a2-69b0c041ba87	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5591-5b84-fb3a-814a5265ea64	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5591-5b84-e911-0bf4f2721d1f	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5591-5b84-5802-91ade3e1afc6	MA	MAR	504	Morocco 	Maroko	\N
00040000-5591-5b84-0b17-9399b3b4da5f	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5591-5b84-61eb-201dfa3dbb1b	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5591-5b84-cbf8-68275aa350c5	NA	NAM	516	Namibia 	Namibija	\N
00040000-5591-5b84-db20-9673f6b82d33	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5591-5b84-7eae-28866510595e	NP	NPL	524	Nepal 	Nepal	\N
00040000-5591-5b84-f341-ac34e41c7956	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5591-5b84-429d-9071b950aa37	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5591-5b84-8111-613a4b8d7a36	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5591-5b84-02ca-c1d2e34432cf	NE	NER	562	Niger 	Niger 	\N
00040000-5591-5b84-bc94-dbf9e6b6993f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5591-5b84-d386-c55b9201789a	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5591-5b84-7f61-2a04ba2a2809	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5591-5b84-7bd3-d1b0c98b3743	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5591-5b84-c243-15d03903c5f5	NO	NOR	578	Norway 	Norveška	\N
00040000-5591-5b84-6ed1-91b695f01f45	OM	OMN	512	Oman 	Oman	\N
00040000-5591-5b84-91fd-f56ae12a57ce	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5591-5b84-f199-2b1d7f2b91fd	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5591-5b84-fbb9-f4af8e22b0f1	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5591-5b84-8256-7b0ffeb6b14f	PA	PAN	591	Panama 	Panama	\N
00040000-5591-5b84-a456-07c8874bc663	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5591-5b84-d854-c73d8d9f0660	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5591-5b84-1cd3-251ddb674a2b	PE	PER	604	Peru 	Peru	\N
00040000-5591-5b84-46a5-f0930dcd781a	PH	PHL	608	Philippines 	Filipini	\N
00040000-5591-5b84-a7e2-8a5527978caf	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5591-5b84-464a-731629df9e00	PL	POL	616	Poland 	Poljska	\N
00040000-5591-5b84-b316-2e9d58b37443	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5591-5b84-5f1d-37131f118405	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5591-5b84-b565-b630b743a113	QA	QAT	634	Qatar 	Katar	\N
00040000-5591-5b84-e9fb-78c4c2feceb9	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5591-5b84-0088-5d13ff560c4d	RO	ROU	642	Romania 	Romunija	\N
00040000-5591-5b84-df34-0a092c9385fa	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5591-5b84-dfbf-5c0e6159bba2	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5591-5b84-58f7-0c7f21a1adbf	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5591-5b84-9dad-aaf48ffc7abd	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5591-5b84-8aa7-65b050986a6a	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5591-5b84-d6fb-be65a85dfb1e	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5591-5b84-ac45-6a02920a15fe	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5591-5b84-ea02-01c03be5f9a3	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5591-5b84-44be-b5ff67d79b2a	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5591-5b84-ec97-1ffce883be8a	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5591-5b84-f9fd-5f2ee7f16184	SM	SMR	674	San Marino 	San Marino	\N
00040000-5591-5b84-9445-5c4e196a7c7d	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5591-5b84-a960-a508aeb66a10	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5591-5b84-da3a-b0b17f5c557c	SN	SEN	686	Senegal 	Senegal	\N
00040000-5591-5b84-7b9b-c9f70b91d791	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5591-5b84-9858-aa3186308ac2	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5591-5b84-6c87-1750ca5b57e8	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5591-5b84-c820-5a873d8655e5	SG	SGP	702	Singapore 	Singapur	\N
00040000-5591-5b84-0093-39bb96ce14ea	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5591-5b84-30ec-7e460eed2603	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5591-5b84-577a-124f6222f16c	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5591-5b84-8ad2-ba6218ae5262	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5591-5b84-0487-3b344748a053	SO	SOM	706	Somalia 	Somalija	\N
00040000-5591-5b84-64f5-2a0edebbd500	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5591-5b84-ca29-ba1dad6ef643	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5591-5b84-0565-fad90c24998f	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5591-5b84-6a75-740a6840a168	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5591-5b84-790b-0726531bea77	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5591-5b84-0348-06f2d6cbfe71	SD	SDN	729	Sudan 	Sudan	\N
00040000-5591-5b84-c087-cd3e4fc1d15a	SR	SUR	740	Suriname 	Surinam	\N
00040000-5591-5b84-4a7e-b48f5f1f6389	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5591-5b84-ddd5-51d572f637e5	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5591-5b84-bdab-b6df389f13d9	SE	SWE	752	Sweden 	Švedska	\N
00040000-5591-5b84-f60e-8e7eeff8a0d9	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5591-5b84-8681-81674efbdde1	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5591-5b84-dbb3-8e5f5933e5f3	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5591-5b84-0397-78caf2b61616	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5591-5b84-9f76-843612de54ac	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5591-5b84-44a5-ca498416f161	TH	THA	764	Thailand 	Tajska	\N
00040000-5591-5b84-baca-254ce26079ca	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5591-5b84-ad00-4ce802c104fc	TG	TGO	768	Togo 	Togo	\N
00040000-5591-5b84-c4b8-1a2bdd3f2557	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5591-5b84-00d6-2a146f401e27	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5591-5b84-fd21-6c95624b30b0	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5591-5b84-edec-53983f33ec66	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5591-5b84-16b6-5f5719db7348	TR	TUR	792	Turkey 	Turčija	\N
00040000-5591-5b84-3757-ace0164f5ab3	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5591-5b84-a915-c0f2cd0c0c77	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5591-5b84-a9cb-bf475c1f5f8b	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5591-5b84-cd6c-8720ba3269c4	UG	UGA	800	Uganda 	Uganda	\N
00040000-5591-5b84-f2ee-14ac6bdce2e6	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5591-5b84-d98b-155f1bdb3a40	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5591-5b84-bb56-0853f263d274	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5591-5b84-1e37-63153fb5e3f3	US	USA	840	United States 	Združene države Amerike	\N
00040000-5591-5b84-daf2-2909dce180ea	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5591-5b84-702f-813b7f9e654e	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5591-5b84-a8d9-9637fae22dce	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5591-5b84-484c-36d4b4767033	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5591-5b84-00c6-864d1fb5c4ed	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5591-5b84-967e-6a0d4d734cd1	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5591-5b84-7492-e1f8f5a89303	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5591-5b84-6d42-371d661ea05d	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5591-5b84-ec26-4e0df45a4ee1	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5591-5b84-b364-2ce5c0cef228	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5591-5b84-8c1d-43e3b321fc77	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5591-5b84-48fd-2e6e30edad6b	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5591-5b84-a842-ced907aa4872	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2902 (class 0 OID 8447916)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-5591-5b86-5005-523f5582c1e7	000e0000-5591-5b86-3985-89c97581ef16	\N	\N	10000.80	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-5591-5b85-9e97-f7f85b8263e3	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5591-5b86-7faa-5f9182489fd1	000e0000-5591-5b86-7033-fa3a5d6d5ce4	\N	\N	5000.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-5591-5b85-3f9c-650ed51c6bd9	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2887 (class 0 OID 8447724)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5591-5b86-6230-8b1428054e74	000e0000-5591-5b86-7033-fa3a5d6d5ce4	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5591-5b85-8a60-5d3061ca0b83
000d0000-5591-5b86-3bc8-550b5878db6e	000e0000-5591-5b86-7033-fa3a5d6d5ce4	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5591-5b85-8a60-5d3061ca0b83
000d0000-5591-5b86-2e1e-838670f6f826	000e0000-5591-5b86-7033-fa3a5d6d5ce4	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5591-5b85-aa30-646a1b8bb9c7
000d0000-5591-5b86-ca52-e62599330a0b	000e0000-5591-5b86-7033-fa3a5d6d5ce4	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5591-5b85-c503-bd872ffd5913
000d0000-5591-5b86-357e-1f46cd06d620	000e0000-5591-5b86-7033-fa3a5d6d5ce4	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5591-5b85-c503-bd872ffd5913
000d0000-5591-5b86-f821-0c0b8f4f4361	000e0000-5591-5b86-7033-fa3a5d6d5ce4	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5591-5b85-c503-bd872ffd5913
000d0000-5591-5b86-ac6e-1886c69416e5	000e0000-5591-5b86-7033-fa3a5d6d5ce4	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5591-5b85-8a60-5d3061ca0b83
\.


--
-- TOC entry 2866 (class 0 OID 8447544)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8447592)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8447524)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5591-5b86-33fa-8686f66b0f42	00080000-5591-5b86-d6aa-84fcc71762c3	00090000-5591-5b86-1994-ccee6da7b2d0	AK		
\.


--
-- TOC entry 2841 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 8447641)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 8447666)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 8447481)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5591-5b84-f818-f60398dd3347	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5591-5b84-ffd7-69d6cce8ceda	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5591-5b84-38d7-6533e0c4bf59	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5591-5b84-55d6-b40542ad0935	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5591-5b84-980d-aa1d6f3866bc	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5591-5b84-888f-4347d2d534da	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5591-5b84-c81b-3c26efb71198	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5591-5b84-ca1f-87c95f4c7670	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5591-5b84-6556-364d2a03de0a	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5591-5b84-9870-581747211091	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5591-5b84-10f0-30f651ea689b	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5591-5b84-4094-a0999b06c88a	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5591-5b84-7de2-247db05e404a	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5591-5b85-85a4-17caea9038ca	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5591-5b85-5e68-c33d445fbe13	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5591-5b86-7ce1-31897b3b98ee	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5591-5b86-9cce-8a1b949e854c	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5591-5b86-cc2c-9da6881fe302	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5591-5b86-ee21-1fdd6d7ab952	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2855 (class 0 OID 8447394)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5591-5b85-2743-f6531543a4c1	00000000-5591-5b85-5e68-c33d445fbe13	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5591-5b86-a173-fdd95c90cd5d	00000000-5591-5b85-5e68-c33d445fbe13	00010000-5591-5b84-45fe-5c0f3446357b	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5591-5b86-b88a-eec150130905	00000000-5591-5b86-7ce1-31897b3b98ee	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2856 (class 0 OID 8447405)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5591-5b86-55fb-af7e475d9d64	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5591-5b86-840c-e379d654b745	00010000-5591-5b86-07a4-015d1422826c	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5591-5b86-b5f0-549944b0a7c9	00010000-5591-5b86-d54a-9cf7ba847a69	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5591-5b86-38e8-1bb8aa0c6957	00010000-5591-5b86-9c80-10e07c21b87d	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5591-5b86-8ab6-147a2648210e	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5591-5b86-2082-7ea0573971f6	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5591-5b86-8ee2-333234b72b53	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5591-5b86-f8c3-8c6d4b2ca59d	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5591-5b86-1994-ccee6da7b2d0	00010000-5591-5b86-0f53-1ba98b540557	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5591-5b86-1111-92b838057fee	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5591-5b86-ddd3-6531af3a38b3	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5591-5b86-0964-a01a9a8e7e43	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5591-5b86-a041-89aad4be1cc7	00010000-5591-5b86-cb7b-b0d116b3b4cb	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2843 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 8447359)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5591-5b84-7503-651ca277caac	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5591-5b84-93af-0899ce50769b	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5591-5b84-191f-5cff882da848	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5591-5b84-8857-7fe90bb3cb5c	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5591-5b84-2543-a2d0a612daa4	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5591-5b84-d570-03565f597e56	Abonma-read	Abonma - branje	f
00030000-5591-5b84-14c1-7f71bf8be7db	Abonma-write	Abonma - spreminjanje	f
00030000-5591-5b84-6fa8-df7fc891c34a	Alternacija-read	Alternacija - branje	f
00030000-5591-5b84-066b-7e8e545387f9	Alternacija-write	Alternacija - spreminjanje	f
00030000-5591-5b84-5a96-a74552cfd5a3	Arhivalija-read	Arhivalija - branje	f
00030000-5591-5b84-3e3d-6014484aa1f0	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5591-5b84-078e-0544a5f5155a	Besedilo-read	Besedilo - branje	f
00030000-5591-5b84-234f-737b4f16b887	Besedilo-write	Besedilo - spreminjanje	f
00030000-5591-5b84-63a9-8c2516b8e2d9	DogodekIzven-read	DogodekIzven - branje	f
00030000-5591-5b84-5d01-afc1183aae98	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5591-5b84-c0d3-367bfebe00f8	Dogodek-read	Dogodek - branje	f
00030000-5591-5b84-ad30-249b7fb200d0	Dogodek-write	Dogodek - spreminjanje	f
00030000-5591-5b84-5c2f-0e7a1ca48806	DrugiVir-read	DrugiVir - branje	f
00030000-5591-5b84-5ae4-24c01800d4eb	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5591-5b84-e35b-609ae37ce623	Drzava-read	Drzava - branje	f
00030000-5591-5b84-c6a0-4146f4ea7a74	Drzava-write	Drzava - spreminjanje	f
00030000-5591-5b84-ecd1-f75193978842	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5591-5b84-2e9f-1e61d4fbe4e6	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5591-5b84-84f7-ad0d6fa488f0	Funkcija-read	Funkcija - branje	f
00030000-5591-5b84-b71d-0514a3f207a0	Funkcija-write	Funkcija - spreminjanje	f
00030000-5591-5b84-efef-4997322fb01a	Gostovanje-read	Gostovanje - branje	f
00030000-5591-5b84-e44d-37abe5a6279b	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5591-5b84-3e1e-c59f8462547d	Gostujoca-read	Gostujoca - branje	f
00030000-5591-5b84-0871-bba46fd5c2f0	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5591-5b84-4f24-7a641f75331a	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5591-5b84-791f-3b8b3008b8f3	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5591-5b84-36ef-63307ecf01e8	Kupec-read	Kupec - branje	f
00030000-5591-5b84-14e2-e821499b13d1	Kupec-write	Kupec - spreminjanje	f
00030000-5591-5b84-8909-da2078d4fddf	NacinPlacina-read	NacinPlacina - branje	f
00030000-5591-5b84-a316-51a87ed3038c	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5591-5b84-0149-f44d4293555d	Option-read	Option - branje	f
00030000-5591-5b84-ec2e-0e47a59f60b0	Option-write	Option - spreminjanje	f
00030000-5591-5b84-aee3-9d458fc13631	OptionValue-read	OptionValue - branje	f
00030000-5591-5b84-3d60-b743abeaac91	OptionValue-write	OptionValue - spreminjanje	f
00030000-5591-5b84-17c0-6a2651fe8696	Oseba-read	Oseba - branje	f
00030000-5591-5b84-cf62-45a6e463f3e3	Oseba-write	Oseba - spreminjanje	f
00030000-5591-5b84-7c34-1b5f96563bbe	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5591-5b84-b438-f9e7c43ab37c	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5591-5b84-01f2-733d4faf053e	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5591-5b84-a612-1122a600a5bc	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5591-5b84-73a7-fd95e063cd2b	Pogodba-read	Pogodba - branje	f
00030000-5591-5b84-5860-8c070ce29a91	Pogodba-write	Pogodba - spreminjanje	f
00030000-5591-5b84-ddc2-52cf94e492e6	Popa-read	Popa - branje	f
00030000-5591-5b84-3a18-69db3d792244	Popa-write	Popa - spreminjanje	f
00030000-5591-5b84-17b0-c29191b77efe	Posta-read	Posta - branje	f
00030000-5591-5b84-55d1-6bb58cf5b1fe	Posta-write	Posta - spreminjanje	f
00030000-5591-5b84-8003-17c3050b4263	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5591-5b84-cde0-ae88d0c6960f	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5591-5b84-7e9b-5927f6927134	PostniNaslov-read	PostniNaslov - branje	f
00030000-5591-5b84-0fe5-0c2624cb3eaf	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5591-5b84-a49b-4df4c6729763	Predstava-read	Predstava - branje	f
00030000-5591-5b84-3beb-7c63de4405df	Predstava-write	Predstava - spreminjanje	f
00030000-5591-5b84-bc65-632e2d944e9f	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5591-5b84-3f95-5d2e8eb12fe2	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5591-5b84-ebc5-e4c254e4adb1	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5591-5b84-bc53-730d9153e488	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5591-5b84-712d-ff754e6d2314	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5591-5b84-30cf-52344f24a422	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5591-5b84-2491-1abb8a5a14a0	ProgramDela-read	ProgramDela - branje	f
00030000-5591-5b84-4405-b865158b7960	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5591-5b84-0d15-6f936f15919c	ProgramFestival-read	ProgramFestival - branje	f
00030000-5591-5b84-2f78-ad8d2ee4161c	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5591-5b84-95cc-fd90e0e0bb3c	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5591-5b84-e669-91332f8a56cd	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5591-5b84-219b-6fb15c16bbd5	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5591-5b84-a0e9-cba912c7b98e	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5591-5b84-98bb-5f2875c9ebab	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5591-5b84-1ab4-8ff0fb366966	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5591-5b84-4bf1-f5508766f25a	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5591-5b84-345d-9e35258e059a	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5591-5b84-87ad-5db45a1f9216	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5591-5b84-361f-6ef7e79df4ac	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5591-5b84-bbbe-67878a705d4b	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5591-5b84-6e1d-3f20f729dc45	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5591-5b84-d02b-b6fbe95f6e86	ProgramRazno-read	ProgramRazno - branje	f
00030000-5591-5b84-57bf-8070188b089b	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5591-5b84-a1f5-052be36ce7dd	Prostor-read	Prostor - branje	f
00030000-5591-5b84-d244-7bf13a4e9d4c	Prostor-write	Prostor - spreminjanje	f
00030000-5591-5b84-e841-83f41b3cb681	Racun-read	Racun - branje	f
00030000-5591-5b84-f8f2-cbad4d031c17	Racun-write	Racun - spreminjanje	f
00030000-5591-5b84-e18d-c1d8c7f5eb87	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5591-5b84-ae21-8aef7543c97d	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5591-5b84-db2c-13bd65f65ec3	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5591-5b84-6cf6-f4ce9173c605	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5591-5b84-31df-2ddfe2830575	Rekvizit-read	Rekvizit - branje	f
00030000-5591-5b84-8052-61ba65ce1516	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5591-5b84-a9a8-d49e622b20c8	Revizija-read	Revizija - branje	f
00030000-5591-5b84-f650-90e7abb7ba26	Revizija-write	Revizija - spreminjanje	f
00030000-5591-5b84-0b41-0b57e14853fe	Rezervacija-read	Rezervacija - branje	f
00030000-5591-5b84-bc9f-bfc388fdb995	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5591-5b84-20ea-70bb77eceffa	SedezniRed-read	SedezniRed - branje	f
00030000-5591-5b84-dc6c-1c0c2cd70da9	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5591-5b84-9af9-d8ebfdfd7e2c	Sedez-read	Sedez - branje	f
00030000-5591-5b84-fec4-5cffd588c747	Sedez-write	Sedez - spreminjanje	f
00030000-5591-5b84-7fd8-5c62c5b0155b	Sezona-read	Sezona - branje	f
00030000-5591-5b84-cf78-dc1da3514c2b	Sezona-write	Sezona - spreminjanje	f
00030000-5591-5b84-ba1b-eb5578d6b0cc	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5591-5b84-90b7-39010f9d1915	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5591-5b84-b6fc-401b1211c1a6	Stevilcenje-read	Stevilcenje - branje	f
00030000-5591-5b84-bf79-b0e5bf02b32b	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5591-5b84-67a2-51928d3127ea	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5591-5b84-4909-b0ca5b21a234	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5591-5b84-2564-12a5fe2fad24	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5591-5b84-5b16-66fe144b8ddc	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5591-5b84-ba68-7ee5dda4dcfc	Telefonska-read	Telefonska - branje	f
00030000-5591-5b84-07b6-91ecc6f4d35f	Telefonska-write	Telefonska - spreminjanje	f
00030000-5591-5b84-10be-57cbbae9bd10	TerminStoritve-read	TerminStoritve - branje	f
00030000-5591-5b84-939c-6fae3adf9c69	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5591-5b84-bd60-c9ec7e5b16d3	TipFunkcije-read	TipFunkcije - branje	f
00030000-5591-5b84-7e8c-8b7db788080c	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5591-5b84-e300-ffe8a7e95894	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5591-5b84-3e29-fe9c3396ed4f	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5591-5b84-6564-fe4d43242267	Trr-read	Trr - branje	f
00030000-5591-5b84-7690-3d3008c5ce6b	Trr-write	Trr - spreminjanje	f
00030000-5591-5b84-61e1-9d8ac6a5e685	Uprizoritev-read	Uprizoritev - branje	f
00030000-5591-5b84-fba7-d4bf8927ac58	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5591-5b84-f4f8-c25b5b35ee50	Vaja-read	Vaja - branje	f
00030000-5591-5b84-d307-9a36bf239a30	Vaja-write	Vaja - spreminjanje	f
00030000-5591-5b84-2ec3-ec8d41b9205e	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5591-5b84-5003-415ce0608cba	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5591-5b84-4bc3-fc5d6b705047	Zaposlitev-read	Zaposlitev - branje	f
00030000-5591-5b84-4212-43a0fb6b56d5	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5591-5b84-c433-67d0ca248203	Zasedenost-read	Zasedenost - branje	f
00030000-5591-5b84-33dc-b0318d1f5c5b	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5591-5b84-e530-2b8983c95586	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5591-5b84-227c-eb771c9dbc7a	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5591-5b84-5c0e-4f865d555216	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5591-5b84-f702-7cc9bd16eb1d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2853 (class 0 OID 8447378)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5591-5b84-05a2-c66d5868d60e	00030000-5591-5b84-93af-0899ce50769b
00020000-5591-5b84-4d5c-1a5719e1a81a	00030000-5591-5b84-e35b-609ae37ce623
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-d570-03565f597e56
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-14c1-7f71bf8be7db
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-6fa8-df7fc891c34a
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-066b-7e8e545387f9
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-5a96-a74552cfd5a3
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-c0d3-367bfebe00f8
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-8857-7fe90bb3cb5c
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-ad30-249b7fb200d0
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-e35b-609ae37ce623
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-c6a0-4146f4ea7a74
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-84f7-ad0d6fa488f0
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-b71d-0514a3f207a0
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-efef-4997322fb01a
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-e44d-37abe5a6279b
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-3e1e-c59f8462547d
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-0871-bba46fd5c2f0
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-4f24-7a641f75331a
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-791f-3b8b3008b8f3
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-0149-f44d4293555d
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-aee3-9d458fc13631
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-17c0-6a2651fe8696
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-cf62-45a6e463f3e3
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-ddc2-52cf94e492e6
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-3a18-69db3d792244
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-17b0-c29191b77efe
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-55d1-6bb58cf5b1fe
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-7e9b-5927f6927134
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-0fe5-0c2624cb3eaf
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-a49b-4df4c6729763
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-3beb-7c63de4405df
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-712d-ff754e6d2314
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-30cf-52344f24a422
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-a1f5-052be36ce7dd
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-d244-7bf13a4e9d4c
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-db2c-13bd65f65ec3
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-6cf6-f4ce9173c605
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-31df-2ddfe2830575
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-8052-61ba65ce1516
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-7fd8-5c62c5b0155b
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-cf78-dc1da3514c2b
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-bd60-c9ec7e5b16d3
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-61e1-9d8ac6a5e685
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-fba7-d4bf8927ac58
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-f4f8-c25b5b35ee50
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-d307-9a36bf239a30
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-c433-67d0ca248203
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-33dc-b0318d1f5c5b
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-e530-2b8983c95586
00020000-5591-5b84-532f-be01b9913ddc	00030000-5591-5b84-5c0e-4f865d555216
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-d570-03565f597e56
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-5a96-a74552cfd5a3
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-c0d3-367bfebe00f8
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-e35b-609ae37ce623
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-efef-4997322fb01a
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-3e1e-c59f8462547d
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-4f24-7a641f75331a
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-791f-3b8b3008b8f3
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-0149-f44d4293555d
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-aee3-9d458fc13631
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-17c0-6a2651fe8696
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-cf62-45a6e463f3e3
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-ddc2-52cf94e492e6
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-17b0-c29191b77efe
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-7e9b-5927f6927134
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-0fe5-0c2624cb3eaf
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-a49b-4df4c6729763
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-a1f5-052be36ce7dd
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-db2c-13bd65f65ec3
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-31df-2ddfe2830575
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-7fd8-5c62c5b0155b
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-ba68-7ee5dda4dcfc
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-07b6-91ecc6f4d35f
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-6564-fe4d43242267
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-7690-3d3008c5ce6b
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-4bc3-fc5d6b705047
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-4212-43a0fb6b56d5
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-e530-2b8983c95586
00020000-5591-5b84-9e2e-99a56a4b3991	00030000-5591-5b84-5c0e-4f865d555216
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-d570-03565f597e56
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-6fa8-df7fc891c34a
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-5a96-a74552cfd5a3
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-3e3d-6014484aa1f0
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-078e-0544a5f5155a
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-63a9-8c2516b8e2d9
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-c0d3-367bfebe00f8
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-e35b-609ae37ce623
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-84f7-ad0d6fa488f0
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-efef-4997322fb01a
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-3e1e-c59f8462547d
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-4f24-7a641f75331a
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-0149-f44d4293555d
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-aee3-9d458fc13631
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-17c0-6a2651fe8696
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-ddc2-52cf94e492e6
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-17b0-c29191b77efe
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-a49b-4df4c6729763
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-712d-ff754e6d2314
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-a1f5-052be36ce7dd
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-db2c-13bd65f65ec3
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-31df-2ddfe2830575
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-7fd8-5c62c5b0155b
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-bd60-c9ec7e5b16d3
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-f4f8-c25b5b35ee50
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-c433-67d0ca248203
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-e530-2b8983c95586
00020000-5591-5b84-2526-6f9201def24e	00030000-5591-5b84-5c0e-4f865d555216
00020000-5591-5b84-d8f0-c658d7e504f5	00030000-5591-5b84-d570-03565f597e56
00020000-5591-5b84-d8f0-c658d7e504f5	00030000-5591-5b84-14c1-7f71bf8be7db
00020000-5591-5b84-d8f0-c658d7e504f5	00030000-5591-5b84-066b-7e8e545387f9
00020000-5591-5b84-d8f0-c658d7e504f5	00030000-5591-5b84-5a96-a74552cfd5a3
00020000-5591-5b84-d8f0-c658d7e504f5	00030000-5591-5b84-c0d3-367bfebe00f8
00020000-5591-5b84-d8f0-c658d7e504f5	00030000-5591-5b84-e35b-609ae37ce623
00020000-5591-5b84-d8f0-c658d7e504f5	00030000-5591-5b84-efef-4997322fb01a
00020000-5591-5b84-d8f0-c658d7e504f5	00030000-5591-5b84-3e1e-c59f8462547d
00020000-5591-5b84-d8f0-c658d7e504f5	00030000-5591-5b84-0149-f44d4293555d
00020000-5591-5b84-d8f0-c658d7e504f5	00030000-5591-5b84-aee3-9d458fc13631
00020000-5591-5b84-d8f0-c658d7e504f5	00030000-5591-5b84-ddc2-52cf94e492e6
00020000-5591-5b84-d8f0-c658d7e504f5	00030000-5591-5b84-17b0-c29191b77efe
00020000-5591-5b84-d8f0-c658d7e504f5	00030000-5591-5b84-a49b-4df4c6729763
00020000-5591-5b84-d8f0-c658d7e504f5	00030000-5591-5b84-a1f5-052be36ce7dd
00020000-5591-5b84-d8f0-c658d7e504f5	00030000-5591-5b84-db2c-13bd65f65ec3
00020000-5591-5b84-d8f0-c658d7e504f5	00030000-5591-5b84-31df-2ddfe2830575
00020000-5591-5b84-d8f0-c658d7e504f5	00030000-5591-5b84-7fd8-5c62c5b0155b
00020000-5591-5b84-d8f0-c658d7e504f5	00030000-5591-5b84-bd60-c9ec7e5b16d3
00020000-5591-5b84-d8f0-c658d7e504f5	00030000-5591-5b84-e530-2b8983c95586
00020000-5591-5b84-d8f0-c658d7e504f5	00030000-5591-5b84-5c0e-4f865d555216
00020000-5591-5b84-eeb0-da9284323e10	00030000-5591-5b84-d570-03565f597e56
00020000-5591-5b84-eeb0-da9284323e10	00030000-5591-5b84-5a96-a74552cfd5a3
00020000-5591-5b84-eeb0-da9284323e10	00030000-5591-5b84-c0d3-367bfebe00f8
00020000-5591-5b84-eeb0-da9284323e10	00030000-5591-5b84-e35b-609ae37ce623
00020000-5591-5b84-eeb0-da9284323e10	00030000-5591-5b84-efef-4997322fb01a
00020000-5591-5b84-eeb0-da9284323e10	00030000-5591-5b84-3e1e-c59f8462547d
00020000-5591-5b84-eeb0-da9284323e10	00030000-5591-5b84-0149-f44d4293555d
00020000-5591-5b84-eeb0-da9284323e10	00030000-5591-5b84-aee3-9d458fc13631
00020000-5591-5b84-eeb0-da9284323e10	00030000-5591-5b84-ddc2-52cf94e492e6
00020000-5591-5b84-eeb0-da9284323e10	00030000-5591-5b84-17b0-c29191b77efe
00020000-5591-5b84-eeb0-da9284323e10	00030000-5591-5b84-a49b-4df4c6729763
00020000-5591-5b84-eeb0-da9284323e10	00030000-5591-5b84-a1f5-052be36ce7dd
00020000-5591-5b84-eeb0-da9284323e10	00030000-5591-5b84-db2c-13bd65f65ec3
00020000-5591-5b84-eeb0-da9284323e10	00030000-5591-5b84-31df-2ddfe2830575
00020000-5591-5b84-eeb0-da9284323e10	00030000-5591-5b84-7fd8-5c62c5b0155b
00020000-5591-5b84-eeb0-da9284323e10	00030000-5591-5b84-10be-57cbbae9bd10
00020000-5591-5b84-eeb0-da9284323e10	00030000-5591-5b84-191f-5cff882da848
00020000-5591-5b84-eeb0-da9284323e10	00030000-5591-5b84-bd60-c9ec7e5b16d3
00020000-5591-5b84-eeb0-da9284323e10	00030000-5591-5b84-e530-2b8983c95586
00020000-5591-5b84-eeb0-da9284323e10	00030000-5591-5b84-5c0e-4f865d555216
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-7503-651ca277caac
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-93af-0899ce50769b
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-191f-5cff882da848
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-8857-7fe90bb3cb5c
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-2543-a2d0a612daa4
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-d570-03565f597e56
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-14c1-7f71bf8be7db
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-6fa8-df7fc891c34a
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-066b-7e8e545387f9
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-5a96-a74552cfd5a3
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-3e3d-6014484aa1f0
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-078e-0544a5f5155a
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-234f-737b4f16b887
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-63a9-8c2516b8e2d9
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-5d01-afc1183aae98
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-c0d3-367bfebe00f8
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-ad30-249b7fb200d0
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-e35b-609ae37ce623
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-c6a0-4146f4ea7a74
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-ecd1-f75193978842
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-2e9f-1e61d4fbe4e6
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-84f7-ad0d6fa488f0
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-b71d-0514a3f207a0
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-efef-4997322fb01a
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-e44d-37abe5a6279b
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-3e1e-c59f8462547d
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-0871-bba46fd5c2f0
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-4f24-7a641f75331a
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-791f-3b8b3008b8f3
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-36ef-63307ecf01e8
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-14e2-e821499b13d1
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-8909-da2078d4fddf
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-a316-51a87ed3038c
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-0149-f44d4293555d
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-ec2e-0e47a59f60b0
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-aee3-9d458fc13631
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-3d60-b743abeaac91
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-17c0-6a2651fe8696
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-cf62-45a6e463f3e3
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-7c34-1b5f96563bbe
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-b438-f9e7c43ab37c
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-01f2-733d4faf053e
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-a612-1122a600a5bc
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-73a7-fd95e063cd2b
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-5860-8c070ce29a91
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-ddc2-52cf94e492e6
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-3a18-69db3d792244
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-17b0-c29191b77efe
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-55d1-6bb58cf5b1fe
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-8003-17c3050b4263
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-cde0-ae88d0c6960f
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-7e9b-5927f6927134
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-0fe5-0c2624cb3eaf
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-a49b-4df4c6729763
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-3beb-7c63de4405df
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-bc65-632e2d944e9f
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-3f95-5d2e8eb12fe2
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-ebc5-e4c254e4adb1
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-bc53-730d9153e488
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-712d-ff754e6d2314
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-30cf-52344f24a422
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-2491-1abb8a5a14a0
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-4405-b865158b7960
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-0d15-6f936f15919c
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-2f78-ad8d2ee4161c
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-95cc-fd90e0e0bb3c
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-e669-91332f8a56cd
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-219b-6fb15c16bbd5
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-a0e9-cba912c7b98e
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-98bb-5f2875c9ebab
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-1ab4-8ff0fb366966
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-4bf1-f5508766f25a
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-345d-9e35258e059a
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-87ad-5db45a1f9216
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-361f-6ef7e79df4ac
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-bbbe-67878a705d4b
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-6e1d-3f20f729dc45
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-d02b-b6fbe95f6e86
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-57bf-8070188b089b
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-a1f5-052be36ce7dd
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-d244-7bf13a4e9d4c
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-e841-83f41b3cb681
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-f8f2-cbad4d031c17
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-e18d-c1d8c7f5eb87
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-ae21-8aef7543c97d
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-db2c-13bd65f65ec3
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-6cf6-f4ce9173c605
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-31df-2ddfe2830575
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-8052-61ba65ce1516
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-a9a8-d49e622b20c8
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-f650-90e7abb7ba26
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-0b41-0b57e14853fe
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-bc9f-bfc388fdb995
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-20ea-70bb77eceffa
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-dc6c-1c0c2cd70da9
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-9af9-d8ebfdfd7e2c
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-fec4-5cffd588c747
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-7fd8-5c62c5b0155b
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-cf78-dc1da3514c2b
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-ba1b-eb5578d6b0cc
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-90b7-39010f9d1915
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-b6fc-401b1211c1a6
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-bf79-b0e5bf02b32b
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-67a2-51928d3127ea
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-4909-b0ca5b21a234
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-2564-12a5fe2fad24
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-5b16-66fe144b8ddc
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-ba68-7ee5dda4dcfc
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-07b6-91ecc6f4d35f
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-10be-57cbbae9bd10
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-939c-6fae3adf9c69
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-bd60-c9ec7e5b16d3
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-7e8c-8b7db788080c
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-e300-ffe8a7e95894
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-3e29-fe9c3396ed4f
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-6564-fe4d43242267
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-7690-3d3008c5ce6b
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-61e1-9d8ac6a5e685
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-fba7-d4bf8927ac58
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-f4f8-c25b5b35ee50
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-d307-9a36bf239a30
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-2ec3-ec8d41b9205e
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-5003-415ce0608cba
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-4bc3-fc5d6b705047
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-4212-43a0fb6b56d5
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-c433-67d0ca248203
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-33dc-b0318d1f5c5b
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-e530-2b8983c95586
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-227c-eb771c9dbc7a
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-5c0e-4f865d555216
00020000-5591-5b86-9dc5-4b027ce61461	00030000-5591-5b84-f702-7cc9bd16eb1d
\.


--
-- TOC entry 2881 (class 0 OID 8447673)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8447704)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 8447836)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5591-5b86-837e-d1e21dc5c407	00090000-5591-5b86-55fb-af7e475d9d64	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2858 (class 0 OID 8447438)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5591-5b86-d6aa-84fcc71762c3	00040000-5591-5b84-901e-b81925d4c1d7	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5591-5b86-7faa-680fe583ce79	00040000-5591-5b84-901e-b81925d4c1d7	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5591-5b86-e453-363258b786d4	00040000-5591-5b84-901e-b81925d4c1d7	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5591-5b86-5960-d77fdbc25552	00040000-5591-5b84-901e-b81925d4c1d7	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5591-5b86-a15e-d42f3e3bcff0	00040000-5591-5b84-901e-b81925d4c1d7	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5591-5b86-b4d8-18a5d0c166f0	00040000-5591-5b84-577a-124f6222f16c	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2860 (class 0 OID 8447473)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5591-5b84-2482-2427a22c192b	8341	Adlešiči
00050000-5591-5b84-1eb9-7257de8ec0eb	5270	Ajdovščina
00050000-5591-5b84-d988-7f7584c501fe	6280	Ankaran/Ancarano
00050000-5591-5b84-4900-d1ae007a0e1f	9253	Apače
00050000-5591-5b84-a46c-f52a9a6f9b47	8253	Artiče
00050000-5591-5b84-47ab-6dc2fade72c9	4275	Begunje na Gorenjskem
00050000-5591-5b84-3787-eed218be92f6	1382	Begunje pri Cerknici
00050000-5591-5b84-055f-e6cedb7c98a5	9231	Beltinci
00050000-5591-5b84-3848-9ba40e757791	2234	Benedikt
00050000-5591-5b84-91f6-9310af2d3f57	2345	Bistrica ob Dravi
00050000-5591-5b84-780e-c3ae7d70887a	3256	Bistrica ob Sotli
00050000-5591-5b84-924d-7fed6d34aa2e	8259	Bizeljsko
00050000-5591-5b84-29e3-6c51d48793cc	1223	Blagovica
00050000-5591-5b84-8b31-57a42970d2b2	8283	Blanca
00050000-5591-5b84-eb4f-7126ac7af0b7	4260	Bled
00050000-5591-5b84-9a2c-ff7d7dad5190	4273	Blejska Dobrava
00050000-5591-5b84-9484-b23a3f135af1	9265	Bodonci
00050000-5591-5b84-5955-870fd8259e2c	9222	Bogojina
00050000-5591-5b84-8d74-85bc71343018	4263	Bohinjska Bela
00050000-5591-5b84-09c8-9b511db75c6f	4264	Bohinjska Bistrica
00050000-5591-5b84-ba67-d58e7f8dcf6f	4265	Bohinjsko jezero
00050000-5591-5b84-e5d3-36037c66a834	1353	Borovnica
00050000-5591-5b84-f70a-279ff8e6bb2e	8294	Boštanj
00050000-5591-5b84-587a-1c9378faa4ca	5230	Bovec
00050000-5591-5b84-4cbe-9fbaef67bd46	5295	Branik
00050000-5591-5b84-2f66-3de4ef96cfc7	3314	Braslovče
00050000-5591-5b84-bf13-5fec4dc461ee	5223	Breginj
00050000-5591-5b84-d393-2028176e966a	8280	Brestanica
00050000-5591-5b84-2468-2a96a48fbd71	2354	Bresternica
00050000-5591-5b84-5ff7-a6c925f152b5	4243	Brezje
00050000-5591-5b84-2672-3d83198939e5	1351	Brezovica pri Ljubljani
00050000-5591-5b84-1bf3-b546a3cffad4	8250	Brežice
00050000-5591-5b84-1e95-46403a50890b	4210	Brnik - Aerodrom
00050000-5591-5b84-d492-55c64f77e3e9	8321	Brusnice
00050000-5591-5b84-4e6b-fe5eaf15d674	3255	Buče
00050000-5591-5b84-5a98-45fbb14a74e5	8276	Bučka 
00050000-5591-5b84-5c83-180e2d80f9dc	9261	Cankova
00050000-5591-5b84-8c76-38f01c8ba637	3000	Celje 
00050000-5591-5b84-411a-6badbc8b9995	3001	Celje - poštni predali
00050000-5591-5b84-1777-dcfa272c6745	4207	Cerklje na Gorenjskem
00050000-5591-5b84-6afe-f96b20e9b3cc	8263	Cerklje ob Krki
00050000-5591-5b84-64fc-50985a1ae120	1380	Cerknica
00050000-5591-5b84-18b8-74fc2726e941	5282	Cerkno
00050000-5591-5b84-533e-1c9af471ff8b	2236	Cerkvenjak
00050000-5591-5b84-f647-ea94ce3051c0	2215	Ceršak
00050000-5591-5b84-a7c5-51b4309648fd	2326	Cirkovce
00050000-5591-5b84-0bc1-152c804770c8	2282	Cirkulane
00050000-5591-5b84-929b-ed7f75f101a2	5273	Col
00050000-5591-5b84-ad5f-9668cb5d6ebf	8251	Čatež ob Savi
00050000-5591-5b84-2780-a7224c051f73	1413	Čemšenik
00050000-5591-5b84-155b-fac28e00f677	5253	Čepovan
00050000-5591-5b84-87d5-6fdc226cf6b1	9232	Črenšovci
00050000-5591-5b84-1356-e4fb9d83af5a	2393	Črna na Koroškem
00050000-5591-5b84-25ac-a2ac5da504f8	6275	Črni Kal
00050000-5591-5b84-ab9e-24e25cf5fe39	5274	Črni Vrh nad Idrijo
00050000-5591-5b84-b1d9-56a72a5f8dea	5262	Črniče
00050000-5591-5b84-2b96-4a93a50f76ee	8340	Črnomelj
00050000-5591-5b84-06a5-c7141618dac9	6271	Dekani
00050000-5591-5b84-843e-749058c71f1a	5210	Deskle
00050000-5591-5b84-bc14-9260ae4732f3	2253	Destrnik
00050000-5591-5b84-c54f-809d4c4d263a	6215	Divača
00050000-5591-5b84-f1a0-d262d3939b7b	1233	Dob
00050000-5591-5b84-597c-cbb5e5ee2b4c	3224	Dobje pri Planini
00050000-5591-5b84-1ab1-589cf8bd2e7c	8257	Dobova
00050000-5591-5b84-bad0-febe13e7a249	1423	Dobovec
00050000-5591-5b84-1b18-9c8b5da7769e	5263	Dobravlje
00050000-5591-5b84-476f-0fee72292d7f	3204	Dobrna
00050000-5591-5b84-8c53-8c83a2541182	8211	Dobrnič
00050000-5591-5b84-2f21-0868a1c28082	1356	Dobrova
00050000-5591-5b84-479d-7af578f0c909	9223	Dobrovnik/Dobronak 
00050000-5591-5b84-0930-c3630ca8a9f7	5212	Dobrovo v Brdih
00050000-5591-5b84-34d9-6cc65ba7f5b7	1431	Dol pri Hrastniku
00050000-5591-5b84-6682-ac779a85f318	1262	Dol pri Ljubljani
00050000-5591-5b84-ac3e-b9a06599e6c6	1273	Dole pri Litiji
00050000-5591-5b84-08e3-82a6f08e2454	1331	Dolenja vas
00050000-5591-5b84-d79b-b3e0c04c3c73	8350	Dolenjske Toplice
00050000-5591-5b84-6274-e05a5c94d558	1230	Domžale
00050000-5591-5b84-7e2e-67aed6f4309b	2252	Dornava
00050000-5591-5b84-9f5d-4d18b4edd4fa	5294	Dornberk
00050000-5591-5b84-c25f-c76346d61446	1319	Draga
00050000-5591-5b84-411a-204e79e877bc	8343	Dragatuš
00050000-5591-5b84-0a2f-2d3cef0cd0b5	3222	Dramlje
00050000-5591-5b84-f809-58369f1d1ccd	2370	Dravograd
00050000-5591-5b84-9614-e6c721fd64ed	4203	Duplje
00050000-5591-5b84-1230-3efc6642fe7a	6221	Dutovlje
00050000-5591-5b84-caef-28e2fcf802ef	8361	Dvor
00050000-5591-5b84-6fbc-0468f4fbfb33	2343	Fala
00050000-5591-5b84-4f27-b00e2e2c2f24	9208	Fokovci
00050000-5591-5b84-a57a-a84508fe5a68	2313	Fram
00050000-5591-5b84-cb4e-b7bf11a97cfd	3213	Frankolovo
00050000-5591-5b84-454f-673c1568633c	1274	Gabrovka
00050000-5591-5b84-b09d-79888829cb5a	8254	Globoko
00050000-5591-5b84-071e-89a94f19bee9	5275	Godovič
00050000-5591-5b84-d99f-2dcb9bc7e268	4204	Golnik
00050000-5591-5b84-d042-9a7da4aecd6e	3303	Gomilsko
00050000-5591-5b84-da98-29086bfe109b	4224	Gorenja vas
00050000-5591-5b84-0288-ea1ef5d1a4dd	3263	Gorica pri Slivnici
00050000-5591-5b84-1987-b765c2b22bb0	2272	Gorišnica
00050000-5591-5b84-2b5c-0de9661a19c7	9250	Gornja Radgona
00050000-5591-5b84-8993-660c9b50dfaa	3342	Gornji Grad
00050000-5591-5b84-05dd-57db256776b1	4282	Gozd Martuljek
00050000-5591-5b84-ea2d-0624af636fde	6272	Gračišče
00050000-5591-5b84-54f1-872a34c3642a	9264	Grad
00050000-5591-5b84-4bb3-2cd97427ab1d	8332	Gradac
00050000-5591-5b84-05c3-360f4e89422c	1384	Grahovo
00050000-5591-5b84-89af-3aa3a5fb1258	5242	Grahovo ob Bači
00050000-5591-5b84-8aed-46bcd6d5ca55	5251	Grgar
00050000-5591-5b84-ac5e-9e330168cc7b	3302	Griže
00050000-5591-5b84-5911-15c03884180a	3231	Grobelno
00050000-5591-5b84-ee8e-369cbdf28acd	1290	Grosuplje
00050000-5591-5b84-67e4-53289f927ff8	2288	Hajdina
00050000-5591-5b84-346c-96cffbabd766	8362	Hinje
00050000-5591-5b84-91ca-ac3687b9395c	2311	Hoče
00050000-5591-5b84-61bc-fa77486da73d	9205	Hodoš/Hodos
00050000-5591-5b84-de62-a225a1120bcb	1354	Horjul
00050000-5591-5b84-c772-0d256bc2ae96	1372	Hotedršica
00050000-5591-5b84-134b-bbdcefad0e9b	1430	Hrastnik
00050000-5591-5b84-2ae7-b181446f20db	6225	Hruševje
00050000-5591-5b84-4538-0bd8dfda9e0a	4276	Hrušica
00050000-5591-5b84-331e-aac344bdb191	5280	Idrija
00050000-5591-5b84-392d-e0d01482b7ed	1292	Ig
00050000-5591-5b84-71d4-74c9bf65d84c	6250	Ilirska Bistrica
00050000-5591-5b84-3c9a-f5301daf3f4e	6251	Ilirska Bistrica-Trnovo
00050000-5591-5b84-a2d1-1b21d03f5637	1295	Ivančna Gorica
00050000-5591-5b84-fca9-ee984835e49a	2259	Ivanjkovci
00050000-5591-5b84-cf12-a3b51f643dd5	1411	Izlake
00050000-5591-5b84-cefd-b92cda813c41	6310	Izola/Isola
00050000-5591-5b84-05dd-3cd94dd7470b	2222	Jakobski Dol
00050000-5591-5b84-e721-91f185fc9f55	2221	Jarenina
00050000-5591-5b84-6d8b-e186d9fe6c72	6254	Jelšane
00050000-5591-5b84-f6d0-7c12fccdb79a	4270	Jesenice
00050000-5591-5b84-fe19-7224873a2b03	8261	Jesenice na Dolenjskem
00050000-5591-5b84-d260-b48960d5e2e1	3273	Jurklošter
00050000-5591-5b84-7fbc-270daa515c46	2223	Jurovski Dol
00050000-5591-5b84-e61a-5017d4209c54	2256	Juršinci
00050000-5591-5b84-eb4c-6b38d117d324	5214	Kal nad Kanalom
00050000-5591-5b84-cc42-a17ce0c61006	3233	Kalobje
00050000-5591-5b84-a21a-5d08245080c0	4246	Kamna Gorica
00050000-5591-5b84-2fbf-e74887575882	2351	Kamnica
00050000-5591-5b84-35c5-40631c210238	1241	Kamnik
00050000-5591-5b84-f916-92872f6fd57b	5213	Kanal
00050000-5591-5b84-e63e-8656befc8eca	8258	Kapele
00050000-5591-5b84-1064-cbd8247f72c8	2362	Kapla
00050000-5591-5b84-deff-65caffb0f4f1	2325	Kidričevo
00050000-5591-5b84-1afc-9857b12c2ae4	1412	Kisovec
00050000-5591-5b84-dec5-343d72c31b5f	6253	Knežak
00050000-5591-5b84-734e-41730576cc81	5222	Kobarid
00050000-5591-5b84-dd32-34ce98717d07	9227	Kobilje
00050000-5591-5b84-7777-a2f0c9801a16	1330	Kočevje
00050000-5591-5b84-e271-53bd16cdc3b5	1338	Kočevska Reka
00050000-5591-5b84-84af-ea9c1a263ca9	2276	Kog
00050000-5591-5b84-5bc1-9549b0b652d0	5211	Kojsko
00050000-5591-5b84-c641-b0994cce44b3	6223	Komen
00050000-5591-5b84-c4fa-e80d0fa2bb03	1218	Komenda
00050000-5591-5b84-3af4-e3a5999510cc	6000	Koper/Capodistria 
00050000-5591-5b84-ff41-d95bdb717e8a	6001	Koper/Capodistria - poštni predali
00050000-5591-5b84-f30a-f406cc623105	8282	Koprivnica
00050000-5591-5b84-c599-feb625e1e093	5296	Kostanjevica na Krasu
00050000-5591-5b84-8cdf-342c1a847143	8311	Kostanjevica na Krki
00050000-5591-5b84-ced6-a9f32310e5a7	1336	Kostel
00050000-5591-5b84-781b-fac4c863f86b	6256	Košana
00050000-5591-5b84-05c8-94db45302977	2394	Kotlje
00050000-5591-5b84-6d9a-f1e211074fa5	6240	Kozina
00050000-5591-5b84-2757-6b988d014623	3260	Kozje
00050000-5591-5b84-b4f1-bbcb69b17593	4000	Kranj 
00050000-5591-5b84-6ed9-46ad35d7db03	4001	Kranj - poštni predali
00050000-5591-5b84-f04a-b4e219cc64fd	4280	Kranjska Gora
00050000-5591-5b84-1d4f-e56e145dda9e	1281	Kresnice
00050000-5591-5b84-e74d-7e060d266e21	4294	Križe
00050000-5591-5b84-6a32-a32cae984a82	9206	Križevci
00050000-5591-5b84-c88e-e062bc2f9624	9242	Križevci pri Ljutomeru
00050000-5591-5b84-0642-b2971844e8a8	1301	Krka
00050000-5591-5b84-54f2-f001f560e7fd	8296	Krmelj
00050000-5591-5b84-8214-a67edda00427	4245	Kropa
00050000-5591-5b84-7ffc-b64fc0634c1d	8262	Krška vas
00050000-5591-5b84-460c-3771867b4a4f	8270	Krško
00050000-5591-5b84-756d-b4932d46ff11	9263	Kuzma
00050000-5591-5b84-4128-6ae9b9b47fe7	2318	Laporje
00050000-5591-5b84-0733-d541bca6a0be	3270	Laško
00050000-5591-5b84-efdf-4ee58571c792	1219	Laze v Tuhinju
00050000-5591-5b84-2b2f-951fd926fe10	2230	Lenart v Slovenskih goricah
00050000-5591-5b84-120d-0b2ba6ef2c68	9220	Lendava/Lendva
00050000-5591-5b84-77a7-18d8c4d606f6	4248	Lesce
00050000-5591-5b84-20b8-884e55edad0a	3261	Lesično
00050000-5591-5b84-5d20-dd04df527623	8273	Leskovec pri Krškem
00050000-5591-5b84-9c91-7edd3472ad49	2372	Libeliče
00050000-5591-5b84-e58a-6219e161bc7f	2341	Limbuš
00050000-5591-5b84-de8a-bc760a8231ad	1270	Litija
00050000-5591-5b84-a33a-9b74818bb362	3202	Ljubečna
00050000-5591-5b84-ec6a-b7451ce9bfdf	1000	Ljubljana 
00050000-5591-5b84-4951-9e4841c9c9d1	1001	Ljubljana - poštni predali
00050000-5591-5b84-d46d-816387144286	1231	Ljubljana - Črnuče
00050000-5591-5b84-a5a3-7f722b7897f6	1261	Ljubljana - Dobrunje
00050000-5591-5b84-6ff9-06b6b01803bf	1260	Ljubljana - Polje
00050000-5591-5b84-eba4-d614ff2aeb98	1210	Ljubljana - Šentvid
00050000-5591-5b84-610d-e2429cd1726d	1211	Ljubljana - Šmartno
00050000-5591-5b84-55a4-3484299f239e	3333	Ljubno ob Savinji
00050000-5591-5b84-e9c4-571587765aea	9240	Ljutomer
00050000-5591-5b84-4cb8-c56ae569ae05	3215	Loče
00050000-5591-5b84-7b2f-796101186c07	5231	Log pod Mangartom
00050000-5591-5b84-408c-dc105a6e7bfb	1358	Log pri Brezovici
00050000-5591-5b84-709a-0c882a8cfb45	1370	Logatec
00050000-5591-5b84-0d74-cdecedf59368	1371	Logatec
00050000-5591-5b84-49ec-edcda5ea6d0e	1434	Loka pri Zidanem Mostu
00050000-5591-5b84-c916-27c22fc86c1d	3223	Loka pri Žusmu
00050000-5591-5b84-c843-cdcfb9271d07	6219	Lokev
00050000-5591-5b84-9ebe-fce4faf0d6e0	1318	Loški Potok
00050000-5591-5b84-23f3-f34ee53eb6c7	2324	Lovrenc na Dravskem polju
00050000-5591-5b84-abaf-07c559f548ec	2344	Lovrenc na Pohorju
00050000-5591-5b84-ba09-7587e883c549	3334	Luče
00050000-5591-5b84-9652-829d53adb270	1225	Lukovica
00050000-5591-5b84-bbce-1c990ecd58d6	9202	Mačkovci
00050000-5591-5b84-3485-0a87175800c9	2322	Majšperk
00050000-5591-5b84-eef6-b0863bbddeb6	2321	Makole
00050000-5591-5b84-9f54-10699b91cfa7	9243	Mala Nedelja
00050000-5591-5b84-52db-fb26d9d6fa25	2229	Malečnik
00050000-5591-5b84-099e-1ee49f283cfe	6273	Marezige
00050000-5591-5b84-0482-9988f4575eba	2000	Maribor 
00050000-5591-5b84-3be8-424922ffeef4	2001	Maribor - poštni predali
00050000-5591-5b84-a139-8640a3f540c0	2206	Marjeta na Dravskem polju
00050000-5591-5b84-1520-49330c4e5579	2281	Markovci
00050000-5591-5b84-bbc0-8bd259d5294f	9221	Martjanci
00050000-5591-5b84-a065-aedc764c0ba1	6242	Materija
00050000-5591-5b84-717a-05d34b61d1dc	4211	Mavčiče
00050000-5591-5b84-0704-50b5ab023401	1215	Medvode
00050000-5591-5b84-1d8a-d73a624231c0	1234	Mengeš
00050000-5591-5b84-4728-42bbd1963cd2	8330	Metlika
00050000-5591-5b84-0386-61ea40fb8295	2392	Mežica
00050000-5591-5b84-9459-a930ea796904	2204	Miklavž na Dravskem polju
00050000-5591-5b84-f1e0-444b6f736186	2275	Miklavž pri Ormožu
00050000-5591-5b84-cce9-302834643575	5291	Miren
00050000-5591-5b84-a312-73666ab2e9c5	8233	Mirna
00050000-5591-5b84-3623-661240e5e3a8	8216	Mirna Peč
00050000-5591-5b84-76a4-3acb48ad1ff7	2382	Mislinja
00050000-5591-5b84-dcef-d0ba159e54ea	4281	Mojstrana
00050000-5591-5b84-a19a-2b6a3fc70311	8230	Mokronog
00050000-5591-5b84-a749-852976df381a	1251	Moravče
00050000-5591-5b84-33e9-24feac50d52c	9226	Moravske Toplice
00050000-5591-5b84-cddb-f10c9e2166de	5216	Most na Soči
00050000-5591-5b84-cc41-7022443010d0	1221	Motnik
00050000-5591-5b84-5b40-e4878a74e3a5	3330	Mozirje
00050000-5591-5b84-f5d9-86822e5bc1f3	9000	Murska Sobota 
00050000-5591-5b84-a64a-174a60497a2d	9001	Murska Sobota - poštni predali
00050000-5591-5b84-dc75-5dbfd46d57df	2366	Muta
00050000-5591-5b84-f8fb-0453b3c24c69	4202	Naklo
00050000-5591-5b84-5a3c-74dc82764040	3331	Nazarje
00050000-5591-5b84-952d-013d41f23140	1357	Notranje Gorice
00050000-5591-5b84-ff4f-6700fee1d7b6	3203	Nova Cerkev
00050000-5591-5b84-1b2b-7c38456640b3	5000	Nova Gorica 
00050000-5591-5b84-8250-d510b4c5206b	5001	Nova Gorica - poštni predali
00050000-5591-5b84-f11f-3a89afaf26fb	1385	Nova vas
00050000-5591-5b84-2784-a4eefb38d268	8000	Novo mesto
00050000-5591-5b84-25a6-83a23a0813ee	8001	Novo mesto - poštni predali
00050000-5591-5b84-eb67-a65e96548685	6243	Obrov
00050000-5591-5b84-e862-c31a1b05033d	9233	Odranci
00050000-5591-5b84-d21a-a8abe059e84e	2317	Oplotnica
00050000-5591-5b84-bad3-8868e7e807fa	2312	Orehova vas
00050000-5591-5b84-e6e6-6c6f58079000	2270	Ormož
00050000-5591-5b84-2020-1987d04a45e2	1316	Ortnek
00050000-5591-5b84-a03d-f5780b2d821a	1337	Osilnica
00050000-5591-5b84-9394-18b99200aca1	8222	Otočec
00050000-5591-5b84-618a-ee99ac1ba90e	2361	Ožbalt
00050000-5591-5b84-2956-feceff072a37	2231	Pernica
00050000-5591-5b84-722a-303aeaa8f4dc	2211	Pesnica pri Mariboru
00050000-5591-5b84-70d7-8772ed29fd72	9203	Petrovci
00050000-5591-5b84-6845-b711dd979ae4	3301	Petrovče
00050000-5591-5b84-e407-b1ebd0913bdb	6330	Piran/Pirano
00050000-5591-5b84-34af-8ba66ec32d3f	8255	Pišece
00050000-5591-5b84-31dd-8b14eb5e4d5c	6257	Pivka
00050000-5591-5b84-451f-a3f697d24f49	6232	Planina
00050000-5591-5b84-5d54-dffc7268b69b	3225	Planina pri Sevnici
00050000-5591-5b84-a11b-506b453b14fd	6276	Pobegi
00050000-5591-5b84-5aa8-0eeda45f2e81	8312	Podbočje
00050000-5591-5b84-e8a8-04407c2f94b9	5243	Podbrdo
00050000-5591-5b84-ff0f-438a76ba4215	3254	Podčetrtek
00050000-5591-5b84-d418-d5938b2b2e12	2273	Podgorci
00050000-5591-5b84-c81f-cdbe0acfcb97	6216	Podgorje
00050000-5591-5b84-7b55-cfbb60e78d95	2381	Podgorje pri Slovenj Gradcu
00050000-5591-5b84-55aa-d0e646a4e8b1	6244	Podgrad
00050000-5591-5b84-17c1-d79dc9b22454	1414	Podkum
00050000-5591-5b84-f222-d33f533df525	2286	Podlehnik
00050000-5591-5b84-7449-ecbbdefb43eb	5272	Podnanos
00050000-5591-5b84-a410-5018e734509b	4244	Podnart
00050000-5591-5b84-8e96-0432f5486ce3	3241	Podplat
00050000-5591-5b84-c27e-4919743b05c1	3257	Podsreda
00050000-5591-5b84-7aae-07833d46b7c9	2363	Podvelka
00050000-5591-5b84-0873-b51b0b988b3a	2208	Pohorje
00050000-5591-5b84-0879-c058ec38eefc	2257	Polenšak
00050000-5591-5b84-18b5-a1a661a9dcc0	1355	Polhov Gradec
00050000-5591-5b84-0257-83ad9e5f5f6c	4223	Poljane nad Škofjo Loko
00050000-5591-5b84-6820-4974aa479b99	2319	Poljčane
00050000-5591-5b84-6365-99cd74b016b1	1272	Polšnik
00050000-5591-5b84-04c5-b4e87c50a9a2	3313	Polzela
00050000-5591-5b84-30cb-a8d299312083	3232	Ponikva
00050000-5591-5b84-d1dd-e33624630574	6320	Portorož/Portorose
00050000-5591-5b84-d68e-84fcfd270a99	6230	Postojna
00050000-5591-5b84-8d6d-67eb92bd2ec8	2331	Pragersko
00050000-5591-5b84-a359-b06e6320f0c4	3312	Prebold
00050000-5591-5b84-7910-0665c2b7e88f	4205	Preddvor
00050000-5591-5b84-e9a3-71e9bdc78ef6	6255	Prem
00050000-5591-5b84-7781-daf8d9122b0f	1352	Preserje
00050000-5591-5b84-366b-5fa168286e07	6258	Prestranek
00050000-5591-5b84-e42f-1f739ccdefca	2391	Prevalje
00050000-5591-5b84-7324-d0375e545bce	3262	Prevorje
00050000-5591-5b84-f383-2b6d1f7ebc41	1276	Primskovo 
00050000-5591-5b84-1f7e-fe58783d228d	3253	Pristava pri Mestinju
00050000-5591-5b84-a973-6975eeedd30d	9207	Prosenjakovci/Partosfalva
00050000-5591-5b84-8744-4baaf3b8d471	5297	Prvačina
00050000-5591-5b84-7f2b-a64703e39bcf	2250	Ptuj
00050000-5591-5b84-3819-1ca04408075c	2323	Ptujska Gora
00050000-5591-5b84-beb7-f9edaa349104	9201	Puconci
00050000-5591-5b84-6e1b-f4d3d7fb63db	2327	Rače
00050000-5591-5b84-3d4b-3deb331ddd7c	1433	Radeče
00050000-5591-5b84-6d43-d1bddcd55f0e	9252	Radenci
00050000-5591-5b84-ae2b-5cb64acb0054	2360	Radlje ob Dravi
00050000-5591-5b84-b79b-bb687050cd13	1235	Radomlje
00050000-5591-5b84-a485-8c3ecd232976	4240	Radovljica
00050000-5591-5b84-5474-6b3736f3449c	8274	Raka
00050000-5591-5b84-d43a-4b7ad43b09b9	1381	Rakek
00050000-5591-5b84-41ba-5290965ffa2b	4283	Rateče - Planica
00050000-5591-5b84-75ab-db2d353eab76	2390	Ravne na Koroškem
00050000-5591-5b84-db3a-58cb9562fd9c	9246	Razkrižje
00050000-5591-5b84-a417-d92ee170f4bc	3332	Rečica ob Savinji
00050000-5591-5b84-e244-8fa77a3a2d30	5292	Renče
00050000-5591-5b84-0dd5-4981bfc8de56	1310	Ribnica
00050000-5591-5b84-b7ed-6f5c9ae74a9c	2364	Ribnica na Pohorju
00050000-5591-5b84-bebb-8c6c28774d2c	3272	Rimske Toplice
00050000-5591-5b84-5a8b-95a550c7ba2d	1314	Rob
00050000-5591-5b84-fea4-c017b7330576	5215	Ročinj
00050000-5591-5b84-8d11-f0711cf655d9	3250	Rogaška Slatina
00050000-5591-5b84-e16f-3d4468b99ee3	9262	Rogašovci
00050000-5591-5b84-8dec-40ed6bba0b11	3252	Rogatec
00050000-5591-5b84-e935-4162f34593d2	1373	Rovte
00050000-5591-5b84-bebb-92114d8181d1	2342	Ruše
00050000-5591-5b84-c76d-0e9ddfe5170e	1282	Sava
00050000-5591-5b84-48cf-e2059003d70f	6333	Sečovlje/Sicciole
00050000-5591-5b84-3311-d834be762fd1	4227	Selca
00050000-5591-5b84-a9b2-abe9d4d36e6b	2352	Selnica ob Dravi
00050000-5591-5b84-f5db-592c4f2b9525	8333	Semič
00050000-5591-5b84-ad51-6c767050e663	8281	Senovo
00050000-5591-5b84-2d50-45f94ef0d17c	6224	Senožeče
00050000-5591-5b84-3747-7350bbd22b66	8290	Sevnica
00050000-5591-5b84-204a-a30cf8762922	6210	Sežana
00050000-5591-5b84-8c68-ad2e447caa95	2214	Sladki Vrh
00050000-5591-5b84-5f66-1232ec2cb87a	5283	Slap ob Idrijci
00050000-5591-5b84-ddf0-ce145262518d	2380	Slovenj Gradec
00050000-5591-5b84-69eb-49df19587c29	2310	Slovenska Bistrica
00050000-5591-5b84-5b3f-64d9e7fcb37c	3210	Slovenske Konjice
00050000-5591-5b84-bd18-5614d51ba086	1216	Smlednik
00050000-5591-5b84-61fe-7187d34299e9	5232	Soča
00050000-5591-5b84-d5ea-8ef2a3c5c1b7	1317	Sodražica
00050000-5591-5b84-db60-9631e2de9710	3335	Solčava
00050000-5591-5b84-6cd3-e6c49cdbb5ca	5250	Solkan
00050000-5591-5b84-e9a4-cb70cdc6d981	4229	Sorica
00050000-5591-5b84-2096-759a50516f54	4225	Sovodenj
00050000-5591-5b84-bc44-01a5a9e460f9	5281	Spodnja Idrija
00050000-5591-5b84-f1c4-fb831c42a408	2241	Spodnji Duplek
00050000-5591-5b84-53fc-4ee7da1b267a	9245	Spodnji Ivanjci
00050000-5591-5b84-dc1b-5b55de13514b	2277	Središče ob Dravi
00050000-5591-5b84-fb73-eada186b6311	4267	Srednja vas v Bohinju
00050000-5591-5b84-825b-923a00ad1827	8256	Sromlje 
00050000-5591-5b84-82b8-2a2e7ee968ee	5224	Srpenica
00050000-5591-5b84-a48c-c8dfde4bd40b	1242	Stahovica
00050000-5591-5b84-e571-4a04c0f43d15	1332	Stara Cerkev
00050000-5591-5b84-649a-db7f903f5753	8342	Stari trg ob Kolpi
00050000-5591-5b84-3229-246afc830773	1386	Stari trg pri Ložu
00050000-5591-5b84-c4f8-d0d7ad3f8d27	2205	Starše
00050000-5591-5b84-946a-6a3689716495	2289	Stoperce
00050000-5591-5b84-b263-0d983f637bc2	8322	Stopiče
00050000-5591-5b84-6b6b-3b64999705c5	3206	Stranice
00050000-5591-5b84-9975-979e81f4ff02	8351	Straža
00050000-5591-5b84-330d-c77df4878bef	1313	Struge
00050000-5591-5b84-016f-049051252a61	8293	Studenec
00050000-5591-5b84-5f83-567bcc697e39	8331	Suhor
00050000-5591-5b84-5c06-3f772603e9df	2233	Sv. Ana v Slovenskih goricah
00050000-5591-5b84-8868-112112926468	2235	Sv. Trojica v Slovenskih goricah
00050000-5591-5b84-63da-725405498c6a	2353	Sveti Duh na Ostrem Vrhu
00050000-5591-5b84-a3bf-a9f96715f136	9244	Sveti Jurij ob Ščavnici
00050000-5591-5b84-606f-1869b1143886	3264	Sveti Štefan
00050000-5591-5b84-74d5-d1b11137ecd2	2258	Sveti Tomaž
00050000-5591-5b84-2e77-9cd1174eb4a6	9204	Šalovci
00050000-5591-5b84-13c5-b429e59e9e7d	5261	Šempas
00050000-5591-5b84-4703-54976e399953	5290	Šempeter pri Gorici
00050000-5591-5b84-c86f-a76f2318df60	3311	Šempeter v Savinjski dolini
00050000-5591-5b84-874f-832fd2a786d6	4208	Šenčur
00050000-5591-5b84-51ae-b2e52214cf26	2212	Šentilj v Slovenskih goricah
00050000-5591-5b84-f76d-5567f01f5376	8297	Šentjanž
00050000-5591-5b84-f4f0-6065b5c080b6	2373	Šentjanž pri Dravogradu
00050000-5591-5b84-dbc4-d4f1e1e2628d	8310	Šentjernej
00050000-5591-5b84-75f6-68ad5729d46f	3230	Šentjur
00050000-5591-5b84-197f-73693e187086	3271	Šentrupert
00050000-5591-5b84-b26b-b6c249f4b84b	8232	Šentrupert
00050000-5591-5b84-ede9-7716d7a50269	1296	Šentvid pri Stični
00050000-5591-5b84-0de7-0e6ecf62df01	8275	Škocjan
00050000-5591-5b84-c19e-f5c69b9f8dcc	6281	Škofije
00050000-5591-5b84-7887-10d5bca6d520	4220	Škofja Loka
00050000-5591-5b85-a4a0-099a2cd1f36a	3211	Škofja vas
00050000-5591-5b85-1f41-5f60dcbe3a59	1291	Škofljica
00050000-5591-5b85-a6ab-7111e23043bc	6274	Šmarje
00050000-5591-5b85-d2e0-582b9fe410e9	1293	Šmarje - Sap
00050000-5591-5b85-446d-65c55f7fda92	3240	Šmarje pri Jelšah
00050000-5591-5b85-8000-5dec9c57417d	8220	Šmarješke Toplice
00050000-5591-5b85-66e9-c049352f031a	2315	Šmartno na Pohorju
00050000-5591-5b85-438b-e435f8a2d0a0	3341	Šmartno ob Dreti
00050000-5591-5b85-63be-1f8b783b03ae	3327	Šmartno ob Paki
00050000-5591-5b85-dec7-3d787e757d37	1275	Šmartno pri Litiji
00050000-5591-5b85-e030-bfec3a1849a4	2383	Šmartno pri Slovenj Gradcu
00050000-5591-5b85-4f69-fb9f3d0bc380	3201	Šmartno v Rožni dolini
00050000-5591-5b85-ff43-b62ebadf59d0	3325	Šoštanj
00050000-5591-5b85-cd6e-445278da2648	6222	Štanjel
00050000-5591-5b85-bf10-21d43ec348c6	3220	Štore
00050000-5591-5b85-e360-010acd172e9f	3304	Tabor
00050000-5591-5b85-45c7-36e6cd32e145	3221	Teharje
00050000-5591-5b85-6441-7984a402681d	9251	Tišina
00050000-5591-5b85-407e-64c8110c474f	5220	Tolmin
00050000-5591-5b85-86ed-f0a4a8732b2f	3326	Topolšica
00050000-5591-5b85-8297-63d091088221	2371	Trbonje
00050000-5591-5b85-40d3-7d4bebfc3b80	1420	Trbovlje
00050000-5591-5b85-ee10-4c6e9d8bfaf5	8231	Trebelno 
00050000-5591-5b85-f9f7-9eb2b46d864b	8210	Trebnje
00050000-5591-5b85-65ef-610e9a822fbc	5252	Trnovo pri Gorici
00050000-5591-5b85-456e-b5be7d93d93c	2254	Trnovska vas
00050000-5591-5b85-e482-03052a64dc08	1222	Trojane
00050000-5591-5b85-1d2e-3865978c314b	1236	Trzin
00050000-5591-5b85-18b2-88e3b9a206ca	4290	Tržič
00050000-5591-5b85-d942-9b79071d15e2	8295	Tržišče
00050000-5591-5b85-2d35-f78889c3c078	1311	Turjak
00050000-5591-5b85-601d-e5a0c45b6ce2	9224	Turnišče
00050000-5591-5b85-14e2-b65f566b3c94	8323	Uršna sela
00050000-5591-5b85-08c0-525f20a934a5	1252	Vače
00050000-5591-5b85-de05-4f58cedd83fe	3320	Velenje 
00050000-5591-5b85-f962-8bbdfd933633	3322	Velenje - poštni predali
00050000-5591-5b85-99ea-043990a39583	8212	Velika Loka
00050000-5591-5b85-6cf7-403b0a65d2cb	2274	Velika Nedelja
00050000-5591-5b85-0b2d-2bc48c22db4a	9225	Velika Polana
00050000-5591-5b85-0283-4cd32db76f58	1315	Velike Lašče
00050000-5591-5b85-e673-787f9f5114ce	8213	Veliki Gaber
00050000-5591-5b85-d325-88c071acf6eb	9241	Veržej
00050000-5591-5b85-5943-c86329f41e0e	1312	Videm - Dobrepolje
00050000-5591-5b85-1611-e440ba0a779b	2284	Videm pri Ptuju
00050000-5591-5b85-d08b-d1f94c7d64ff	8344	Vinica
00050000-5591-5b85-d720-9919176e0bb3	5271	Vipava
00050000-5591-5b85-7d1f-aab35150d424	4212	Visoko
00050000-5591-5b85-7d1e-7cfefc56dfbb	1294	Višnja Gora
00050000-5591-5b85-1716-554993c6eb6c	3205	Vitanje
00050000-5591-5b85-a314-5146953493a0	2255	Vitomarci
00050000-5591-5b85-fc38-3cef70d49207	1217	Vodice
00050000-5591-5b85-d192-01198eb624ba	3212	Vojnik\t
00050000-5591-5b85-d834-5163a9936042	5293	Volčja Draga
00050000-5591-5b85-e657-79d9e1ca66b0	2232	Voličina
00050000-5591-5b85-328d-c4a521383fc2	3305	Vransko
00050000-5591-5b85-443d-55bcb1a40ec2	6217	Vremski Britof
00050000-5591-5b85-87ad-2621494cb4e5	1360	Vrhnika
00050000-5591-5b85-c4c9-d383c89d0218	2365	Vuhred
00050000-5591-5b85-93fc-f761e62ec1e2	2367	Vuzenica
00050000-5591-5b85-2c87-b04ebdb81404	8292	Zabukovje 
00050000-5591-5b85-32f3-6648984699bd	1410	Zagorje ob Savi
00050000-5591-5b85-d62b-e50f0ef7d4bf	1303	Zagradec
00050000-5591-5b85-52bf-620d8ff66a4d	2283	Zavrč
00050000-5591-5b85-9915-0b64f8529da8	8272	Zdole 
00050000-5591-5b85-5285-40389792d696	4201	Zgornja Besnica
00050000-5591-5b85-d457-b0b19ef12bf5	2242	Zgornja Korena
00050000-5591-5b85-8514-931f49a7268f	2201	Zgornja Kungota
00050000-5591-5b85-ac0f-0fa5bd1f8438	2316	Zgornja Ložnica
00050000-5591-5b85-ee18-d2d4a519efdc	2314	Zgornja Polskava
00050000-5591-5b85-4719-82e80a81707a	2213	Zgornja Velka
00050000-5591-5b85-7468-e89b55483c5a	4247	Zgornje Gorje
00050000-5591-5b85-78a8-1895f107eeb6	4206	Zgornje Jezersko
00050000-5591-5b85-bded-37762b4db259	2285	Zgornji Leskovec
00050000-5591-5b85-5746-8104c3e8081c	1432	Zidani Most
00050000-5591-5b85-4a26-b8836d41e102	3214	Zreče
00050000-5591-5b85-1aeb-ef3c7ea0821f	4209	Žabnica
00050000-5591-5b85-92c6-e29d17abbd98	3310	Žalec
00050000-5591-5b85-2ce6-97e3ab3cda91	4228	Železniki
00050000-5591-5b85-5ab1-a03bb836c2c1	2287	Žetale
00050000-5591-5b85-2a61-1f439bced9cd	4226	Žiri
00050000-5591-5b85-f7ce-31fa270b64b0	4274	Žirovnica
00050000-5591-5b85-b501-29ff116ff357	8360	Žužemberk
\.


--
-- TOC entry 2877 (class 0 OID 8447647)
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
-- TOC entry 2859 (class 0 OID 8447458)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 8447536)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8447659)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8447779)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 8447828)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5591-5b86-d13e-b85e3c61afa4	00080000-5591-5b86-b4d8-18a5d0c166f0	0900	AK
00190000-5591-5b86-516b-fbfdcedf6310	00080000-5591-5b86-e453-363258b786d4	0987	A
00190000-5591-5b86-cd88-12a49f24ccf8	00080000-5591-5b86-7faa-680fe583ce79	0989	A
\.


--
-- TOC entry 2903 (class 0 OID 8447962)
-- Dependencies: 232
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stponprem, stprej, stgostuj, stostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint, sredstvaavt) FROM stdin;
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
-- TOC entry 2883 (class 0 OID 8447688)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5591-5b85-752d-664b037ecf14	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5591-5b85-7306-7d108b058bdb	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5591-5b85-f516-e988de83e612	0003	Kazinska	t	84	Kazinska dvorana
00220000-5591-5b85-d705-eed6bf5027be	0004	Mali oder	t	24	Mali oder 
00220000-5591-5b85-1dcf-22fb71b0566e	0005	Komorni oder	t	15	Komorni oder
00220000-5591-5b85-bc36-64ef1f95b896	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5591-5b85-f59b-3b5ddad927fa	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2875 (class 0 OID 8447632)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8447622)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8447817)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8447756)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 8447330)
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
-- TOC entry 2884 (class 0 OID 8447698)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 8447368)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5591-5b84-05a2-c66d5868d60e	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5591-5b84-4d5c-1a5719e1a81a	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5591-5b84-523b-c79f96b24e1d	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5591-5b84-3cd2-edfade84430a	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5591-5b84-532f-be01b9913ddc	planer	Planer dogodkov v koledarju	t
00020000-5591-5b84-9e2e-99a56a4b3991	kadrovska	Kadrovska služba	t
00020000-5591-5b84-2526-6f9201def24e	arhivar	Ažuriranje arhivalij	t
00020000-5591-5b84-d8f0-c658d7e504f5	igralec	Igralec	t
00020000-5591-5b84-eeb0-da9284323e10	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5591-5b86-9dc5-4b027ce61461	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2850 (class 0 OID 8447352)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5591-5b84-45fe-5c0f3446357b	00020000-5591-5b84-523b-c79f96b24e1d
00010000-5591-5b84-617b-6306cfb95164	00020000-5591-5b84-523b-c79f96b24e1d
00010000-5591-5b86-3955-51e827c16cd3	00020000-5591-5b86-9dc5-4b027ce61461
\.


--
-- TOC entry 2886 (class 0 OID 8447712)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 8447653)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8447603)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 8448012)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5591-5b85-6d80-ecdb5201ebcd	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5591-5b85-97ba-a03091ee7db0	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5591-5b85-fa5e-e3eb6aaf4198	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5591-5b85-11d6-c0505d344864	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5591-5b85-9ed5-bd6df27da42d	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2907 (class 0 OID 8448004)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5591-5b85-a269-efe369fa1e75	00230000-5591-5b85-11d6-c0505d344864	popa
00240000-5591-5b85-3385-ead5181a666e	00230000-5591-5b85-11d6-c0505d344864	oseba
00240000-5591-5b85-fe5c-7da9d35f19df	00230000-5591-5b85-97ba-a03091ee7db0	prostor
00240000-5591-5b85-8bf6-625b0883e208	00230000-5591-5b85-11d6-c0505d344864	besedilo
00240000-5591-5b85-6bad-a2c6da1d875e	00230000-5591-5b85-11d6-c0505d344864	uprizoritev
00240000-5591-5b85-9794-575f8ccbdbef	00230000-5591-5b85-11d6-c0505d344864	funkcija
00240000-5591-5b85-ab7e-e291fd86169a	00230000-5591-5b85-11d6-c0505d344864	tipfunkcije
00240000-5591-5b85-96d0-6b595ad7aa9a	00230000-5591-5b85-11d6-c0505d344864	alternacija
00240000-5591-5b85-1c0f-eac4441ce336	00230000-5591-5b85-6d80-ecdb5201ebcd	pogodba
00240000-5591-5b85-00f7-e12f4f231134	00230000-5591-5b85-11d6-c0505d344864	zaposlitev
\.


--
-- TOC entry 2906 (class 0 OID 8447999)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8447766)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5591-5b86-c765-d237805c8ebf	000e0000-5591-5b86-7033-fa3a5d6d5ce4	00080000-5591-5b86-d6aa-84fcc71762c3	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5591-5b86-a9e8-6108f99df96a	000e0000-5591-5b86-7033-fa3a5d6d5ce4	00080000-5591-5b86-d6aa-84fcc71762c3	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5591-5b86-626b-d3ecdcff6200	000e0000-5591-5b86-7033-fa3a5d6d5ce4	00080000-5591-5b86-a15e-d42f3e3bcff0	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2857 (class 0 OID 8447430)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8447609)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5591-5b86-c98c-033c58fdff16	00180000-5591-5b86-43af-bb1f43870e42	000c0000-5591-5b86-40d5-cc8f3bbbdf7a	00090000-5591-5b86-1994-ccee6da7b2d0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5591-5b86-d727-94aa8aaa0bd5	00180000-5591-5b86-43af-bb1f43870e42	000c0000-5591-5b86-11a9-c5afc3ba6172	00090000-5591-5b86-1111-92b838057fee	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5591-5b86-ba02-f05ccb07fba8	00180000-5591-5b86-43af-bb1f43870e42	000c0000-5591-5b86-617a-00bf0088997a	00090000-5591-5b86-b5f0-549944b0a7c9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5591-5b86-6a5b-cbf5d09f4eed	00180000-5591-5b86-43af-bb1f43870e42	000c0000-5591-5b86-1fb5-7108bcd1bdad	00090000-5591-5b86-840c-e379d654b745	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5591-5b86-416c-5c5dfe81279b	00180000-5591-5b86-43af-bb1f43870e42	000c0000-5591-5b86-4194-6ed9f6702460	00090000-5591-5b86-0964-a01a9a8e7e43	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5591-5b86-2483-3dadcb9f0666	00180000-5591-5b86-5664-046fc92bb36c	\N	00090000-5591-5b86-0964-a01a9a8e7e43	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2894 (class 0 OID 8447806)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5591-5b85-8a60-5d3061ca0b83	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5591-5b85-971c-1dfb77982830	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5591-5b85-2de1-532c5326b634	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5591-5b85-aa30-646a1b8bb9c7	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5591-5b85-9286-6ffaaf230c03	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5591-5b85-f1ec-d3881c6df9e4	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5591-5b85-a8e8-39780aed68f5	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5591-5b85-6fac-e33d450f949c	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5591-5b85-d71f-6e26c02ac3e2	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5591-5b85-b2de-c62e4b4ef793	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5591-5b85-a01a-5623a32318c6	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5591-5b85-74b2-4580cc910f7e	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5591-5b85-3692-c3bb1781a14b	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5591-5b85-7563-4b8411219d63	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5591-5b85-b299-3bdab3bcf798	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5591-5b85-c503-bd872ffd5913	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2904 (class 0 OID 8447981)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5591-5b85-9e97-f7f85b8263e3	01	Velika predstava	f	1.00	1.00
002b0000-5591-5b85-3f9c-650ed51c6bd9	02	Mala predstava	f	0.50	0.50
002b0000-5591-5b85-21fe-acc203823d42	03	Mala koprodukcija	t	0.40	1.00
002b0000-5591-5b85-e727-f234196696fe	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5591-5b85-e850-b76a11126a47	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2862 (class 0 OID 8447493)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 8447339)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5591-5b84-617b-6306cfb95164	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO1GzuabRJyEqekJJqnMy0.XjyoDuIPwq	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5591-5b86-d54a-9cf7ba847a69	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5591-5b86-07a4-015d1422826c	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5591-5b86-0f53-1ba98b540557	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5591-5b86-cb7b-b0d116b3b4cb	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5591-5b86-9c80-10e07c21b87d	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5591-5b86-e50a-758293fc8e67	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5591-5b86-2f07-aae8d2058f4a	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5591-5b86-8927-44fb382a8cc3	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5591-5b86-9cc4-d7432944bf15	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5591-5b86-3955-51e827c16cd3	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5591-5b84-45fe-5c0f3446357b	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2899 (class 0 OID 8447863)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5591-5b86-3985-89c97581ef16	00160000-5591-5b85-fdda-223c31e2cf65	00150000-5591-5b85-73cc-20e3886a7d37	00140000-5591-5b84-6359-19949b455814	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5591-5b85-1dcf-22fb71b0566e
000e0000-5591-5b86-7033-fa3a5d6d5ce4	00160000-5591-5b85-2115-5ade46170d4e	00150000-5591-5b85-9ec4-675c7e25c7bf	00140000-5591-5b84-25a6-936d5b6226ab	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5591-5b85-bc36-64ef1f95b896
000e0000-5591-5b86-7af7-31822f57f6e8	\N	00150000-5591-5b85-9ec4-675c7e25c7bf	00140000-5591-5b84-25a6-936d5b6226ab	00190000-5591-5b86-516b-fbfdcedf6310	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5591-5b85-1dcf-22fb71b0566e
000e0000-5591-5b86-ca5f-ed4017040185	\N	00150000-5591-5b85-9ec4-675c7e25c7bf	00140000-5591-5b84-25a6-936d5b6226ab	00190000-5591-5b86-516b-fbfdcedf6310	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5591-5b85-1dcf-22fb71b0566e
\.


--
-- TOC entry 2867 (class 0 OID 8447555)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5591-5b86-fa9a-b660086173f5	000e0000-5591-5b86-7033-fa3a5d6d5ce4	1	
00200000-5591-5b86-0a0d-703f183989ec	000e0000-5591-5b86-7033-fa3a5d6d5ce4	2	
\.


--
-- TOC entry 2882 (class 0 OID 8447680)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8447749)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 8447587)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 8447853)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5591-5b84-6359-19949b455814	01	Drama	drama (SURS 01)
00140000-5591-5b84-af3b-c5bf9276dfb8	02	Opera	opera (SURS 02)
00140000-5591-5b84-9b19-335bf459626f	03	Balet	balet (SURS 03)
00140000-5591-5b84-3649-60ebb6b9d5d7	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5591-5b84-dfe8-ea980ccfe237	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5591-5b84-25a6-936d5b6226ab	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5591-5b84-7a9e-fe572e3e43e0	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2888 (class 0 OID 8447739)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5591-5b85-cd60-1af6e6e403a3	01	Opera	opera
00150000-5591-5b85-7350-1bf96bd16828	02	Opereta	opereta
00150000-5591-5b85-0acd-65c0c02cb3b3	03	Balet	balet
00150000-5591-5b85-7cf4-d3c59b2a6b11	04	Plesne prireditve	plesne prireditve
00150000-5591-5b85-d618-158b66a03519	05	Lutkovno gledališče	lutkovno gledališče
00150000-5591-5b85-047a-68eb518c449e	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5591-5b85-610b-5f289aff737d	07	Biografska drama	biografska drama
00150000-5591-5b85-73cc-20e3886a7d37	08	Komedija	komedija
00150000-5591-5b85-88f5-71b8942a7538	09	Črna komedija	črna komedija
00150000-5591-5b85-f4c6-8d9a0d0e2158	10	E-igra	E-igra
00150000-5591-5b85-9ec4-675c7e25c7bf	11	Kriminalka	kriminalka
00150000-5591-5b85-f298-49dfabb75958	12	Musical	musical
\.


--
-- TOC entry 2441 (class 2606 OID 8447393)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 8447910)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 8447900)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8447805)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 8447577)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 8447602)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 8447997)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 8447519)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 8447957)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 8447735)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 8447553)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 8447596)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 8447533)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2400 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 8447645)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 8447672)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 8447491)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 8447402)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2448 (class 2606 OID 8447426)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 8447382)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2432 (class 2606 OID 8447367)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 8447678)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 8447711)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 8447848)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 8447455)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 8447479)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8447651)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 8447469)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8447540)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 8447663)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8447787)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 8447833)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 8447979)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 7936468)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 7924222)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 8447695)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 8447636)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 8447627)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 8447827)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 8447763)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8447338)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 8447702)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 8447356)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2434 (class 2606 OID 8447376)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 8447720)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 8447658)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 8447608)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 8448021)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 8448009)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 8448003)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 8447776)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 8447435)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 8447618)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 8447816)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 8447991)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 8447504)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 8447351)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8447879)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 8447562)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 8447686)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 8447754)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 8447591)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 8447861)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 8447747)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 1259 OID 8447584)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2581 (class 1259 OID 8447777)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 8447778)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2455 (class 1259 OID 8447457)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2402 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2403 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2404 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2546 (class 1259 OID 8447679)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2540 (class 1259 OID 8447665)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2541 (class 1259 OID 8447664)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2492 (class 1259 OID 8447563)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2568 (class 1259 OID 8447736)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 8447738)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2570 (class 1259 OID 8447737)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2480 (class 1259 OID 8447535)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2481 (class 1259 OID 8447534)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 8447850)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2600 (class 1259 OID 8447851)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2601 (class 1259 OID 8447852)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2416 (class 1259 OID 7924224)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2417 (class 1259 OID 7924223)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2608 (class 1259 OID 8447884)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2609 (class 1259 OID 8447881)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2610 (class 1259 OID 8447885)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2611 (class 1259 OID 8447883)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2612 (class 1259 OID 8447882)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2470 (class 1259 OID 8447506)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2471 (class 1259 OID 8447505)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2407 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2408 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2446 (class 1259 OID 8447429)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2556 (class 1259 OID 8447703)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2510 (class 1259 OID 8447597)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2436 (class 1259 OID 8447383)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2437 (class 1259 OID 8447384)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2561 (class 1259 OID 8447723)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2562 (class 1259 OID 8447722)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2563 (class 1259 OID 8447721)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2484 (class 1259 OID 8447541)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2485 (class 1259 OID 8447543)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2486 (class 1259 OID 8447542)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 8448011)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2520 (class 1259 OID 8447631)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2521 (class 1259 OID 8447629)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2522 (class 1259 OID 8447628)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2523 (class 1259 OID 8447630)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2427 (class 1259 OID 8447357)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 8447358)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2549 (class 1259 OID 8447687)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2535 (class 1259 OID 8447652)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2577 (class 1259 OID 8447764)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2578 (class 1259 OID 8447765)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2629 (class 1259 OID 8447961)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2630 (class 1259 OID 8447958)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2631 (class 1259 OID 8447959)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2632 (class 1259 OID 8447960)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2459 (class 1259 OID 8447471)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2460 (class 1259 OID 8447470)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2461 (class 1259 OID 8447472)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2420 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2585 (class 1259 OID 8447788)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2586 (class 1259 OID 8447789)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2622 (class 1259 OID 8447914)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 8447915)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2624 (class 1259 OID 8447912)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2625 (class 1259 OID 8447913)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2574 (class 1259 OID 8447755)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 8447640)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2527 (class 1259 OID 8447639)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2528 (class 1259 OID 8447637)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2529 (class 1259 OID 8447638)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2398 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2618 (class 1259 OID 8447902)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2619 (class 1259 OID 8447901)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2633 (class 1259 OID 8447980)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2491 (class 1259 OID 8447554)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2640 (class 1259 OID 8447998)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2442 (class 1259 OID 8447404)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2443 (class 1259 OID 8447403)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2451 (class 1259 OID 8447436)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2452 (class 1259 OID 8447437)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2515 (class 1259 OID 8447621)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 8447620)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2517 (class 1259 OID 8447619)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2411 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2412 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2413 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2498 (class 1259 OID 8447586)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2499 (class 1259 OID 8447582)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2500 (class 1259 OID 8447579)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2501 (class 1259 OID 8447580)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2502 (class 1259 OID 8447578)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2503 (class 1259 OID 8447583)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2504 (class 1259 OID 8447581)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2458 (class 1259 OID 8447456)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 8447520)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2477 (class 1259 OID 8447522)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2478 (class 1259 OID 8447521)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2479 (class 1259 OID 8447523)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2534 (class 1259 OID 8447646)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2604 (class 1259 OID 8447849)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 8447880)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2449 (class 1259 OID 8447427)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2450 (class 1259 OID 8447428)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2571 (class 1259 OID 8447748)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 8448022)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 8447492)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 8448010)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2554 (class 1259 OID 8447697)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2555 (class 1259 OID 8447696)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 8447911)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2401 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2466 (class 1259 OID 8447480)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 8447862)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 8447834)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 8447835)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2435 (class 1259 OID 8447377)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2505 (class 1259 OID 8447585)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2675 (class 2606 OID 8448158)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2678 (class 2606 OID 8448143)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2677 (class 2606 OID 8448148)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2673 (class 2606 OID 8448168)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2679 (class 2606 OID 8448138)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2674 (class 2606 OID 8448163)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2676 (class 2606 OID 8448153)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2709 (class 2606 OID 8448313)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 8448318)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 8448073)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2696 (class 2606 OID 8448253)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2694 (class 2606 OID 8448248)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2695 (class 2606 OID 8448243)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2672 (class 2606 OID 8448133)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 8448283)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2702 (class 2606 OID 8448293)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2703 (class 2606 OID 8448288)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2666 (class 2606 OID 8448108)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 8448103)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2692 (class 2606 OID 8448233)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2715 (class 2606 OID 8448338)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2714 (class 2606 OID 8448343)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2713 (class 2606 OID 8448348)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2717 (class 2606 OID 8448368)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2720 (class 2606 OID 8448353)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2716 (class 2606 OID 8448373)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2718 (class 2606 OID 8448363)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2719 (class 2606 OID 8448358)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2664 (class 2606 OID 8448098)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2665 (class 2606 OID 8448093)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 8448058)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2657 (class 2606 OID 8448053)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2698 (class 2606 OID 8448263)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2680 (class 2606 OID 8448173)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 8448033)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2652 (class 2606 OID 8448038)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2699 (class 2606 OID 8448278)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2700 (class 2606 OID 8448273)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2701 (class 2606 OID 8448268)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2670 (class 2606 OID 8448113)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2668 (class 2606 OID 8448123)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2669 (class 2606 OID 8448118)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2733 (class 2606 OID 8448438)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2684 (class 2606 OID 8448208)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2686 (class 2606 OID 8448198)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2687 (class 2606 OID 8448193)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2685 (class 2606 OID 8448203)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2651 (class 2606 OID 8448023)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2650 (class 2606 OID 8448028)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 8448258)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2693 (class 2606 OID 8448238)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2707 (class 2606 OID 8448303)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2706 (class 2606 OID 8448308)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2727 (class 2606 OID 8448423)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2730 (class 2606 OID 8448408)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 8448413)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2728 (class 2606 OID 8448418)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2662 (class 2606 OID 8448083)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 8448078)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2661 (class 2606 OID 8448088)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2711 (class 2606 OID 8448323)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2710 (class 2606 OID 8448328)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2724 (class 2606 OID 8448398)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2723 (class 2606 OID 8448403)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2726 (class 2606 OID 8448388)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2725 (class 2606 OID 8448393)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2705 (class 2606 OID 8448298)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2688 (class 2606 OID 8448228)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2689 (class 2606 OID 8448223)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2691 (class 2606 OID 8448213)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2690 (class 2606 OID 8448218)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2721 (class 2606 OID 8448383)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2722 (class 2606 OID 8448378)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2731 (class 2606 OID 8448428)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2671 (class 2606 OID 8448128)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2712 (class 2606 OID 8448333)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 8448433)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2654 (class 2606 OID 8448048)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2655 (class 2606 OID 8448043)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2659 (class 2606 OID 8448063)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2658 (class 2606 OID 8448068)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2681 (class 2606 OID 8448188)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2682 (class 2606 OID 8448183)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2683 (class 2606 OID 8448178)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-06-29 16:51:51 CEST

--
-- PostgreSQL database dump complete
--

