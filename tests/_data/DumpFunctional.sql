--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-07-07 14:53:14 CEST

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
-- TOC entry 2919 (class 0 OID 0)
-- Dependencies: 238
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 9340457)
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
-- TOC entry 228 (class 1259 OID 9340956)
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
-- TOC entry 227 (class 1259 OID 9340939)
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
-- TOC entry 221 (class 1259 OID 9340851)
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
-- TOC entry 197 (class 1259 OID 9340636)
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
-- TOC entry 200 (class 1259 OID 9340670)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 9341068)
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
-- TOC entry 192 (class 1259 OID 9340579)
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
-- TOC entry 229 (class 1259 OID 9340969)
-- Name: enotaprograma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE enotaprograma (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    program_dela_id uuid,
    gostitelj_id uuid,
    celotnavrednost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    nasdelez numeric(15,2) DEFAULT 0::numeric NOT NULL,
    celotnavrednostmat numeric(15,2) DEFAULT 0::numeric NOT NULL,
    celotnavrednostgostovsz numeric(15,2) DEFAULT 0::numeric NOT NULL,
    zaproseno numeric(15,2) DEFAULT 0::numeric NOT NULL,
    lastnasredstva numeric(15,2) DEFAULT 0::numeric NOT NULL,
    avtorskihonorarji numeric(15,2) DEFAULT 0::numeric NOT NULL,
    tantieme numeric(15,2) DEFAULT 0::numeric NOT NULL,
    vlozekgostitelja numeric(15,2) DEFAULT 0::numeric NOT NULL,
    vlozekkoproducenta numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugijavni numeric(15,2) DEFAULT 0::numeric NOT NULL,
    stzaposlenih integer DEFAULT 0 NOT NULL,
    stzaposumet integer DEFAULT 0 NOT NULL,
    stzaposdrug integer DEFAULT 0 NOT NULL,
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
-- TOC entry 216 (class 1259 OID 9340796)
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
-- TOC entry 195 (class 1259 OID 9340616)
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
-- TOC entry 199 (class 1259 OID 9340664)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 9340596)
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
-- TOC entry 205 (class 1259 OID 9340713)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 9340738)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 9340553)
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
-- TOC entry 184 (class 1259 OID 9340466)
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
-- TOC entry 185 (class 1259 OID 9340477)
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
-- TOC entry 180 (class 1259 OID 9340431)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 9340450)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 9340745)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 9340776)
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
-- TOC entry 224 (class 1259 OID 9340889)
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
-- TOC entry 187 (class 1259 OID 9340510)
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
-- TOC entry 189 (class 1259 OID 9340545)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 9340719)
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
-- TOC entry 188 (class 1259 OID 9340530)
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
-- TOC entry 194 (class 1259 OID 9340608)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 9340731)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 9341038)
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
-- TOC entry 232 (class 1259 OID 9341049)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 9341019)
-- Name: programdela; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programdela (
    id uuid NOT NULL,
    sezona_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    zacetek date NOT NULL,
    konec date NOT NULL,
    zakljuceno boolean NOT NULL,
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
    stizvponprem integer,
    stizvprej integer,
    stizvgostuj integer,
    stizvostalihnek integer,
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
-- TOC entry 212 (class 1259 OID 9340760)
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
-- TOC entry 204 (class 1259 OID 9340704)
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
-- TOC entry 203 (class 1259 OID 9340694)
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
-- TOC entry 223 (class 1259 OID 9340878)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 9340828)
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
-- TOC entry 177 (class 1259 OID 9340402)
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
-- TOC entry 176 (class 1259 OID 9340400)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2920 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 9340770)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 9340440)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 9340424)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 9340784)
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
-- TOC entry 207 (class 1259 OID 9340725)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 9340675)
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
-- TOC entry 237 (class 1259 OID 9341088)
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
-- TOC entry 236 (class 1259 OID 9341080)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 9341075)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 9340838)
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
-- TOC entry 186 (class 1259 OID 9340502)
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
-- TOC entry 202 (class 1259 OID 9340681)
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
-- TOC entry 222 (class 1259 OID 9340867)
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
-- TOC entry 233 (class 1259 OID 9341057)
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
-- TOC entry 191 (class 1259 OID 9340565)
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
-- TOC entry 178 (class 1259 OID 9340411)
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
-- TOC entry 226 (class 1259 OID 9340916)
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
-- TOC entry 196 (class 1259 OID 9340627)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 9340752)
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
-- TOC entry 218 (class 1259 OID 9340821)
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
-- TOC entry 198 (class 1259 OID 9340659)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 9340906)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 9340811)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 9340405)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2858 (class 0 OID 9340457)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 9340956)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-559b-cbb9-4a79-42d4bc119954	000d0000-559b-cbb9-ea1a-fd81d7aa7b3c	\N	00090000-559b-cbb9-de3b-4c93863d8451	000b0000-559b-cbb9-5956-43ac5cd19ec8	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-559b-cbb9-0df6-e05587de50e4	000d0000-559b-cbb9-7771-c3511c6feb73	\N	00090000-559b-cbb9-0219-be68f4985211	\N	0002	t	\N	\N	\N	8	\N	\N	f	f
000c0000-559b-cbb9-f5fd-23ce9e88a8bd	000d0000-559b-cbb9-bc9e-36f9335060c3	\N	00090000-559b-cbb9-a1ea-693d42be52ad	\N	0003	t	\N	\N	\N	2	\N	\N	f	f
000c0000-559b-cbb9-3381-071821b93aea	000d0000-559b-cbb9-ed49-528718cd9ae9	\N	00090000-559b-cbb9-afa5-0da50e27a44a	\N	0004	t	\N	\N	\N	26	\N	\N	f	f
000c0000-559b-cbb9-80b6-7027a08c18dd	000d0000-559b-cbb9-909f-a0379e00b1d5	\N	00090000-559b-cbb9-329a-04b311f9fb1c	\N	0005	t	\N	\N	\N	7	\N	\N	f	f
000c0000-559b-cbb9-5415-24e423dab90f	000d0000-559b-cbb9-418f-dbbd3afc9458	\N	00090000-559b-cbb9-6fdb-1898842d1843	000b0000-559b-cbb9-e7fb-83ba46c22e32	0006	f	\N	\N	\N	1	\N	\N	t	t
000c0000-559b-cbb9-2421-17698b384e0b	000d0000-559b-cbb9-4e21-b615451025fa	\N	00090000-559b-cbb9-a752-bcf2017113cb	\N	0007	t	\N	\N	\N	14	\N	\N	f	t
000c0000-559b-cbb9-c023-43d5c16a4743	000d0000-559b-cbb9-6726-068c154db386	\N	00090000-559b-cbb9-9c7a-2f056361dbb3	000b0000-559b-cbb9-2b62-8a3737e942e8	0008	f	\N	\N	\N	12	\N	\N	t	t
\.


--
-- TOC entry 2902 (class 0 OID 9340939)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 9340851)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-559b-cbb9-5c95-794c7343623b	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-559b-cbb9-1bbd-8ec9a8f2b9fb	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-559b-cbb9-ea3e-c606c037769a	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2872 (class 0 OID 9340636)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-559b-cbb9-07ff-4c9784e5c0fb	\N	\N	00200000-559b-cbb9-2e87-033ae0e789a3	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-559b-cbb9-4849-538ae5bd28e3	\N	\N	00200000-559b-cbb9-a811-e3d5e8232764	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-559b-cbb9-8c7c-0e386fe88b89	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-559b-cbb9-ea03-ef607946fa77	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-559b-cbb9-0640-ea6ced401bdf	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2875 (class 0 OID 9340670)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 9341068)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 9340579)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-559b-cbb7-4c18-01365ca0b659	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-559b-cbb7-ab39-8680d3c99eaa	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-559b-cbb7-7583-b5fad8e714a7	AL	ALB	008	Albania 	Albanija	\N
00040000-559b-cbb7-b4c3-f118486699db	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-559b-cbb7-a51d-7a4ae0250a80	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-559b-cbb7-86a8-5c41cb3e7d96	AD	AND	020	Andorra 	Andora	\N
00040000-559b-cbb7-8807-51ebae6c1585	AO	AGO	024	Angola 	Angola	\N
00040000-559b-cbb7-7a96-7f356cf53180	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-559b-cbb7-900a-e491a7e191ae	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-559b-cbb7-1fcf-f8e79284c57f	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-559b-cbb7-c658-9b58b9dd677e	AR	ARG	032	Argentina 	Argenitna	\N
00040000-559b-cbb7-e0ad-c3d97e1b2f81	AM	ARM	051	Armenia 	Armenija	\N
00040000-559b-cbb7-0bc1-b1a09ae06547	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-559b-cbb7-7443-c6aef241413c	AU	AUS	036	Australia 	Avstralija	\N
00040000-559b-cbb7-78ee-bba14acfed6d	AT	AUT	040	Austria 	Avstrija	\N
00040000-559b-cbb7-4f12-0b2365ef55c3	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-559b-cbb7-37aa-2ca9bae16a73	BS	BHS	044	Bahamas 	Bahami	\N
00040000-559b-cbb7-db89-db706e732211	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-559b-cbb7-b2e3-501b0a5d7c7c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-559b-cbb7-f8d2-ea693af54c2a	BB	BRB	052	Barbados 	Barbados	\N
00040000-559b-cbb7-34e8-d9b904c2f51e	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-559b-cbb7-ca56-28ec57e4180b	BE	BEL	056	Belgium 	Belgija	\N
00040000-559b-cbb7-f422-b8bc2d07716c	BZ	BLZ	084	Belize 	Belize	\N
00040000-559b-cbb7-d11f-66a191c5f300	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-559b-cbb7-a7a2-83a963eae649	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-559b-cbb7-def0-83250758e79b	BT	BTN	064	Bhutan 	Butan	\N
00040000-559b-cbb7-efd3-ae395c4b8661	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-559b-cbb7-d945-3c55bcb693a1	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-559b-cbb7-36b2-fd9053918662	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-559b-cbb7-ffad-91e3df422e55	BW	BWA	072	Botswana 	Bocvana	\N
00040000-559b-cbb7-a996-706479458674	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-559b-cbb7-e523-2a0f0fdd1fa1	BR	BRA	076	Brazil 	Brazilija	\N
00040000-559b-cbb7-36a1-6f4979cab0e1	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-559b-cbb7-4e58-5b8fabb1f049	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-559b-cbb7-58e5-dbabee6cbbb2	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-559b-cbb7-f91d-d41d09bc2091	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-559b-cbb7-41bc-0d32d49ce221	BI	BDI	108	Burundi 	Burundi 	\N
00040000-559b-cbb7-fb94-1e52f3059df4	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-559b-cbb7-dc86-e63a3d230042	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-559b-cbb7-bb47-88d9ca6dfd15	CA	CAN	124	Canada 	Kanada	\N
00040000-559b-cbb7-d4b2-74339d5b2f96	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-559b-cbb7-9bad-03e1f0d6f7ae	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-559b-cbb7-e4da-6fd4a9c42090	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-559b-cbb7-8ea3-4e47c79476ed	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-559b-cbb7-0254-646198c61f3b	CL	CHL	152	Chile 	Čile	\N
00040000-559b-cbb7-a416-b40638508ca1	CN	CHN	156	China 	Kitajska	\N
00040000-559b-cbb7-6221-4b0b9666fe19	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-559b-cbb7-3233-87bb5ba19dcf	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-559b-cbb7-e920-bde96198f3c2	CO	COL	170	Colombia 	Kolumbija	\N
00040000-559b-cbb7-f979-60b3df3553e5	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-559b-cbb7-e595-d29adf34f9e5	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-559b-cbb7-b813-2d3ff996722a	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-559b-cbb7-225f-49c834b12094	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-559b-cbb7-c29a-eafcbbaa1cec	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-559b-cbb7-fb81-e16bc4605836	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-559b-cbb7-86b9-4859c1697d00	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-559b-cbb7-bc44-9f9e2cd6651b	CU	CUB	192	Cuba 	Kuba	\N
00040000-559b-cbb7-fe25-879c4271dc3a	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-559b-cbb7-3037-1557d49e7a85	CY	CYP	196	Cyprus 	Ciper	\N
00040000-559b-cbb7-6a4c-478e75cc03b8	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-559b-cbb7-bad8-3a1dc8a68ff9	DK	DNK	208	Denmark 	Danska	\N
00040000-559b-cbb7-621b-fec4d6324896	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-559b-cbb7-253c-e913cb9e1132	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-559b-cbb7-9226-249c2fa1bea9	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-559b-cbb7-47d5-c65a98680971	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-559b-cbb7-0147-79aacfe4a7b9	EG	EGY	818	Egypt 	Egipt	\N
00040000-559b-cbb7-9173-9c373c3d4de2	SV	SLV	222	El Salvador 	Salvador	\N
00040000-559b-cbb7-86a9-78ef7e43c2c1	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-559b-cbb7-c79b-b5931c304bb9	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-559b-cbb7-2dc5-f43e2520b553	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-559b-cbb7-5ce8-808aa27f8549	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-559b-cbb7-9df3-3d4b634f2f0d	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-559b-cbb7-aad5-fbceaf54df01	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-559b-cbb7-15f9-f9be2601eb81	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-559b-cbb7-ea3e-0d1ffd15081a	FI	FIN	246	Finland 	Finska	\N
00040000-559b-cbb7-b0de-78de39065bfb	FR	FRA	250	France 	Francija	\N
00040000-559b-cbb7-8817-0e88286fdccc	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-559b-cbb7-c4a8-666952b3a53f	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-559b-cbb7-69ce-d5731a186569	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-559b-cbb7-297d-e7b20e9a9573	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-559b-cbb7-14f3-4bb1deff53a6	GA	GAB	266	Gabon 	Gabon	\N
00040000-559b-cbb7-a8ff-b94ca0499895	GM	GMB	270	Gambia 	Gambija	\N
00040000-559b-cbb7-8abc-527e3a625077	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-559b-cbb7-e5d9-e9f9d52c751a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-559b-cbb7-aab0-2f0848c0d814	GH	GHA	288	Ghana 	Gana	\N
00040000-559b-cbb7-0564-34ef9e1fd5f5	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-559b-cbb7-0be3-f879a7848612	GR	GRC	300	Greece 	Grčija	\N
00040000-559b-cbb7-691e-2ed39bb05a38	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-559b-cbb7-5fca-d24cf5c6e985	GD	GRD	308	Grenada 	Grenada	\N
00040000-559b-cbb7-222b-7e6e2214c4b1	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-559b-cbb7-c000-deca951c22c5	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-559b-cbb7-3217-356d99eac32a	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-559b-cbb7-2245-d4746b092727	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-559b-cbb7-44da-0a9fdc083dc5	GN	GIN	324	Guinea 	Gvineja	\N
00040000-559b-cbb7-7f9f-822b24203b53	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-559b-cbb7-9b7f-364eefda84cf	GY	GUY	328	Guyana 	Gvajana	\N
00040000-559b-cbb7-f108-50adefeca951	HT	HTI	332	Haiti 	Haiti	\N
00040000-559b-cbb7-7f0c-6703c2094e02	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-559b-cbb7-a11a-179fef667d81	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-559b-cbb7-a17a-0ab3d3b2e677	HN	HND	340	Honduras 	Honduras	\N
00040000-559b-cbb7-1682-e9a3cf21017f	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-559b-cbb7-f826-91ccdf4ed029	HU	HUN	348	Hungary 	Madžarska	\N
00040000-559b-cbb7-2d9a-83131de94037	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-559b-cbb7-ac4a-6e7b3feab1fa	IN	IND	356	India 	Indija	\N
00040000-559b-cbb7-4367-0acb2ff00c0e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-559b-cbb7-e6e9-83e2fe357cd5	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-559b-cbb7-da25-48920b190938	IQ	IRQ	368	Iraq 	Irak	\N
00040000-559b-cbb7-087a-2ddc2e8dbac3	IE	IRL	372	Ireland 	Irska	\N
00040000-559b-cbb7-f56b-e1dc11e38de9	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-559b-cbb7-a410-c5a374061178	IL	ISR	376	Israel 	Izrael	\N
00040000-559b-cbb7-c43a-f48b6732646f	IT	ITA	380	Italy 	Italija	\N
00040000-559b-cbb7-9d54-6acf680480b0	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-559b-cbb7-469f-b953585f0eb4	JP	JPN	392	Japan 	Japonska	\N
00040000-559b-cbb7-a082-b620d6adc8a3	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-559b-cbb7-3fff-315822b3c9e9	JO	JOR	400	Jordan 	Jordanija	\N
00040000-559b-cbb7-a588-95a465a743cc	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-559b-cbb7-f4d4-502dc235a754	KE	KEN	404	Kenya 	Kenija	\N
00040000-559b-cbb7-b625-0421246d362d	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-559b-cbb7-03e9-cd1e50c51c69	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-559b-cbb7-cca9-7444e6317b59	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-559b-cbb7-9122-43f37ddc6c97	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-559b-cbb7-bc39-07796baeb6b8	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-559b-cbb7-1782-601e3aaa3edc	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-559b-cbb7-fa0f-b174b92d874f	LV	LVA	428	Latvia 	Latvija	\N
00040000-559b-cbb7-fede-2f7de0546a10	LB	LBN	422	Lebanon 	Libanon	\N
00040000-559b-cbb7-9561-bff07430fe5a	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-559b-cbb7-c835-52623a5745ed	LR	LBR	430	Liberia 	Liberija	\N
00040000-559b-cbb7-7b90-25edfceba78d	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-559b-cbb7-fab9-a1ae6f9fe461	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-559b-cbb7-dab8-79b0603a3144	LT	LTU	440	Lithuania 	Litva	\N
00040000-559b-cbb7-5056-3383b165a9f6	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-559b-cbb7-32d6-f4ca0d41549f	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-559b-cbb7-ed13-443dee086318	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-559b-cbb7-12a6-ef44cbdd28a3	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-559b-cbb7-ba51-5549b0ea21c2	MW	MWI	454	Malawi 	Malavi	\N
00040000-559b-cbb7-b88b-323967d8c984	MY	MYS	458	Malaysia 	Malezija	\N
00040000-559b-cbb7-94ee-c0056732346e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-559b-cbb7-46cf-7b1d02fdef29	ML	MLI	466	Mali 	Mali	\N
00040000-559b-cbb7-af89-abbf30d04052	MT	MLT	470	Malta 	Malta	\N
00040000-559b-cbb7-10e6-305d4530079b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-559b-cbb7-f5a9-019d56bcf646	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-559b-cbb7-c1f2-387cccac9923	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-559b-cbb7-1760-6c1e82eeeae8	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-559b-cbb7-b2ba-080f2f4d1709	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-559b-cbb7-4881-03b80dbdd589	MX	MEX	484	Mexico 	Mehika	\N
00040000-559b-cbb7-7117-ded9ec8dd55c	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-559b-cbb7-27a9-98dc0c7495cf	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-559b-cbb7-387b-ef0fae257e00	MC	MCO	492	Monaco 	Monako	\N
00040000-559b-cbb7-3a49-d2f60169dea2	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-559b-cbb7-7af4-09e751d8a24b	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-559b-cbb7-3785-a11de3144778	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-559b-cbb7-82b2-4b2316701a52	MA	MAR	504	Morocco 	Maroko	\N
00040000-559b-cbb7-c196-b6a6189c372d	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-559b-cbb7-4738-041515021fd8	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-559b-cbb7-d338-8b75830a30fb	NA	NAM	516	Namibia 	Namibija	\N
00040000-559b-cbb7-a852-c1f1e23f3883	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-559b-cbb7-c100-1d7a22c82899	NP	NPL	524	Nepal 	Nepal	\N
00040000-559b-cbb7-dcd4-c95689b6b0df	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-559b-cbb7-4f95-81032b0d50e7	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-559b-cbb7-15d1-4bb211509326	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-559b-cbb7-0619-1b36146c9081	NE	NER	562	Niger 	Niger 	\N
00040000-559b-cbb7-c23a-2fdc588ac290	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-559b-cbb7-1d7d-53d181556c9f	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-559b-cbb7-521a-445b8a730b1b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-559b-cbb7-57e9-5856912a65d0	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-559b-cbb7-5e89-7cf0fa9551e6	NO	NOR	578	Norway 	Norveška	\N
00040000-559b-cbb7-39e4-c932446d4814	OM	OMN	512	Oman 	Oman	\N
00040000-559b-cbb7-2e3b-201d6ed129d4	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-559b-cbb7-6a8b-7c52a42da2a2	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-559b-cbb7-9e6e-9ede0fe92e2d	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-559b-cbb7-cf58-31a791235e9a	PA	PAN	591	Panama 	Panama	\N
00040000-559b-cbb7-925f-41460962f0df	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-559b-cbb7-77da-e6abed75063f	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-559b-cbb7-636d-5db4381eebb5	PE	PER	604	Peru 	Peru	\N
00040000-559b-cbb7-1ef3-a19fded481fc	PH	PHL	608	Philippines 	Filipini	\N
00040000-559b-cbb7-af06-81225e6a444b	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-559b-cbb7-a66d-8e377e7b8dbf	PL	POL	616	Poland 	Poljska	\N
00040000-559b-cbb7-a026-84bea8e6b252	PT	PRT	620	Portugal 	Portugalska	\N
00040000-559b-cbb7-b73f-bf255fe4542d	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-559b-cbb7-2a40-2560194a54af	QA	QAT	634	Qatar 	Katar	\N
00040000-559b-cbb7-8182-dc4516332b20	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-559b-cbb7-0c83-0603e7691024	RO	ROU	642	Romania 	Romunija	\N
00040000-559b-cbb7-c855-c98be1a13fff	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-559b-cbb7-bb67-f63df1c60127	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-559b-cbb7-030a-4bad5029ed83	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-559b-cbb7-dd88-269d6431a1bc	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-559b-cbb7-71a8-26ba0c8fcd54	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-559b-cbb7-4475-18950e4a0c2f	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-559b-cbb7-5b25-e2442eb76db5	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-559b-cbb7-bf38-477d76aa58fb	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-559b-cbb7-49d7-ce6ec13b52a8	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-559b-cbb7-cac4-64f4c19d1853	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-559b-cbb7-07ae-df3c732d1128	SM	SMR	674	San Marino 	San Marino	\N
00040000-559b-cbb7-7a1e-c5f4a79f2d17	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-559b-cbb7-6d0b-fdb6335e64cb	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-559b-cbb7-56fd-29071971aafc	SN	SEN	686	Senegal 	Senegal	\N
00040000-559b-cbb7-c805-f69e78d70419	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-559b-cbb7-0af4-5d7867dd1c7d	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-559b-cbb7-3926-9c8ec3e171bc	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-559b-cbb7-ef58-9f3bf415fa2c	SG	SGP	702	Singapore 	Singapur	\N
00040000-559b-cbb7-49a5-93c59e175ac5	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-559b-cbb7-768f-4bdac88511f8	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-559b-cbb7-1dbe-f71a715c6c21	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-559b-cbb7-578f-c9e3b9804cee	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-559b-cbb7-ac7c-b1ad74d7fe16	SO	SOM	706	Somalia 	Somalija	\N
00040000-559b-cbb7-7e3c-440badae4289	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-559b-cbb7-1303-91f2467a5785	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-559b-cbb7-b67e-e370e9ddb5f4	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-559b-cbb7-283e-bc14950efd86	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-559b-cbb7-f611-1fb91b1e0d04	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-559b-cbb7-bce8-d56c34d387df	SD	SDN	729	Sudan 	Sudan	\N
00040000-559b-cbb7-72f3-3dad6504b02c	SR	SUR	740	Suriname 	Surinam	\N
00040000-559b-cbb7-35d3-42f79f0e5662	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-559b-cbb7-3162-16d7aad4beae	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-559b-cbb7-fc30-34b49d2bc0e8	SE	SWE	752	Sweden 	Švedska	\N
00040000-559b-cbb7-6a08-f7a0f16e7a80	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-559b-cbb7-bc79-871389fb78bb	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-559b-cbb7-844c-009b1870e78e	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-559b-cbb7-e10a-205cc2419ae9	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-559b-cbb7-b1b0-0ff3db9acc53	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-559b-cbb7-82d8-4ab182ef8af6	TH	THA	764	Thailand 	Tajska	\N
00040000-559b-cbb7-d987-15191c32b555	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-559b-cbb7-19ae-4aef15b3ed7a	TG	TGO	768	Togo 	Togo	\N
00040000-559b-cbb7-22fb-712537760346	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-559b-cbb7-5dfc-625d0b92ca98	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-559b-cbb7-5c0d-7cb4045a977f	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-559b-cbb7-2166-2a3d30e0ff13	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-559b-cbb7-41dc-901938642e11	TR	TUR	792	Turkey 	Turčija	\N
00040000-559b-cbb7-c4ca-d408cd85f9be	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-559b-cbb7-e347-d8b1199768cb	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-559b-cbb7-0e0f-eb63bee9bc54	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-559b-cbb7-fcc4-49d4e028ba61	UG	UGA	800	Uganda 	Uganda	\N
00040000-559b-cbb7-91ff-4d1e6bfc2c4e	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-559b-cbb7-ee39-80ce7d1af8fd	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-559b-cbb7-6da3-2f1168cf704c	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-559b-cbb7-de63-c278243eaf1c	US	USA	840	United States 	Združene države Amerike	\N
00040000-559b-cbb7-3cab-13683c34ee30	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-559b-cbb7-6986-20a0d52b9f96	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-559b-cbb7-90cc-b4ab2039c5b5	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-559b-cbb7-6c11-96723adf8ad1	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-559b-cbb7-4117-413b7c2da5c8	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-559b-cbb7-a34f-e58b9d73d8ad	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-559b-cbb7-67f0-09781864862c	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-559b-cbb7-2563-a4047490a472	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-559b-cbb7-c5a7-216cbc8818e5	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-559b-cbb7-9f01-ce6918182bc8	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-559b-cbb7-f754-80314d10b0c3	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-559b-cbb7-198f-d50bcf43d022	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-559b-cbb7-d652-936102412458	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2904 (class 0 OID 9340969)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-559b-cbb9-d852-38036c78d306	000e0000-559b-cbb9-0065-4409259affe8	\N	\N	10000.80	9000.30	0.00	0.00	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	0	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-559b-cbb8-6bb4-665ed7bdee4a	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-559b-cbb9-8770-4e2f0b60b825	000e0000-559b-cbb9-3201-4e1924f57c95	\N	\N	5000.00	4900.20	0.00	0.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	0	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-559b-cbb8-dd28-53460e14d299	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2891 (class 0 OID 9340796)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-559b-cbb9-4e21-b615451025fa	000e0000-559b-cbb9-3201-4e1924f57c95	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-559b-cbb8-8c4b-6b5953d22bb3
000d0000-559b-cbb9-ea1a-fd81d7aa7b3c	000e0000-559b-cbb9-3201-4e1924f57c95	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-559b-cbb8-8c4b-6b5953d22bb3
000d0000-559b-cbb9-7771-c3511c6feb73	000e0000-559b-cbb9-3201-4e1924f57c95	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-559b-cbb8-6d9e-c39392e259b0
000d0000-559b-cbb9-bc9e-36f9335060c3	000e0000-559b-cbb9-3201-4e1924f57c95	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-559b-cbb8-f7d9-4c2acf7fa903
000d0000-559b-cbb9-ed49-528718cd9ae9	000e0000-559b-cbb9-3201-4e1924f57c95	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-559b-cbb8-f7d9-4c2acf7fa903
000d0000-559b-cbb9-909f-a0379e00b1d5	000e0000-559b-cbb9-3201-4e1924f57c95	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-559b-cbb8-f7d9-4c2acf7fa903
000d0000-559b-cbb9-418f-dbbd3afc9458	000e0000-559b-cbb9-3201-4e1924f57c95	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-559b-cbb8-8c4b-6b5953d22bb3
000d0000-559b-cbb9-6726-068c154db386	000e0000-559b-cbb9-3201-4e1924f57c95	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-559b-cbb8-9913-961b749061e6
\.


--
-- TOC entry 2870 (class 0 OID 9340616)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 9340664)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 9340596)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-559b-cbb9-ba86-0b6f6b6ae809	00080000-559b-cbb9-46fa-d9fda02cd45b	00090000-559b-cbb9-de3b-4c93863d8451	AK		
\.


--
-- TOC entry 2845 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 9340713)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 9340738)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 9340553)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-559b-cbb8-b0b1-f4ccc9d3fe24	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-559b-cbb8-9c99-b8c6da4028ff	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-559b-cbb8-d394-8a5562a62230	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-559b-cbb8-fb4d-3dc3c0079c44	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-559b-cbb8-89fe-1efb46f0f4a7	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-559b-cbb8-6d0e-8e54d74616b5	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-559b-cbb8-523b-943de7653c81	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-559b-cbb8-ad4e-6b228ebbe83a	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-559b-cbb8-a5db-8c7afc535b5e	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-559b-cbb8-bd57-470aa97e992e	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-559b-cbb8-5483-1b727e43e666	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-559b-cbb8-58d7-045d959174f6	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-559b-cbb8-4355-4bbdcbd50f34	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-559b-cbb9-de2c-d40cdd93cc21	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-559b-cbb9-0bbe-64efb0ebd461	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-559b-cbb9-c24d-859c9597e52f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-559b-cbb9-f5ec-dc2eb7c31549	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-559b-cbb9-abd0-398ac5bde99c	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-559b-cbb9-6d30-83b856c3e2b7	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2859 (class 0 OID 9340466)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-559b-cbb9-d667-b46bc5f6d1dd	00000000-559b-cbb9-0bbe-64efb0ebd461	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-559b-cbb9-fc31-e91692a29012	00000000-559b-cbb9-0bbe-64efb0ebd461	00010000-559b-cbb8-fde1-429d2151a236	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-559b-cbb9-f48a-169fa4b79818	00000000-559b-cbb9-c24d-859c9597e52f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2860 (class 0 OID 9340477)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-559b-cbb9-af01-5107a45e65a4	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-559b-cbb9-afa5-0da50e27a44a	00010000-559b-cbb9-e517-ddfa0204913a	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-559b-cbb9-a1ea-693d42be52ad	00010000-559b-cbb9-3873-8cb4eb3d6d3a	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-559b-cbb9-8762-80cffeb0db76	00010000-559b-cbb9-b2e6-5ee35e405619	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-559b-cbb9-b237-f93768691947	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-559b-cbb9-6fdb-1898842d1843	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-559b-cbb9-dec4-996b6af55cd3	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-559b-cbb9-a752-bcf2017113cb	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-559b-cbb9-de3b-4c93863d8451	00010000-559b-cbb9-497a-950848906186	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-559b-cbb9-0219-be68f4985211	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-559b-cbb9-7f99-362f9dd9a646	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-559b-cbb9-329a-04b311f9fb1c	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-559b-cbb9-9c7a-2f056361dbb3	00010000-559b-cbb9-4b14-65b45a1543e2	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2847 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 9340431)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-559b-cbb7-82ba-9567f359651a	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-559b-cbb7-69e3-b026d336582b	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-559b-cbb7-5eec-fd5acfac78f5	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-559b-cbb7-b8b5-70572d9828fb	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-559b-cbb7-57f4-a4891b3ac6b8	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-559b-cbb7-403c-9d60566b474c	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-559b-cbb7-43b8-abc2a7b8630d	Abonma-read	Abonma - branje	f
00030000-559b-cbb7-9b4e-7f4c22bc4808	Abonma-write	Abonma - spreminjanje	f
00030000-559b-cbb7-d3cf-c58d23ff4d65	Alternacija-read	Alternacija - branje	f
00030000-559b-cbb7-88b5-6d6d91f45867	Alternacija-write	Alternacija - spreminjanje	f
00030000-559b-cbb7-6bc0-391bd8c7a41a	Arhivalija-read	Arhivalija - branje	f
00030000-559b-cbb7-6305-7637ccbb6979	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-559b-cbb7-5d4e-bced46d0b0f5	Besedilo-read	Besedilo - branje	f
00030000-559b-cbb7-85a0-7fe1ad521246	Besedilo-write	Besedilo - spreminjanje	f
00030000-559b-cbb7-9910-80ad8aec1d54	DogodekIzven-read	DogodekIzven - branje	f
00030000-559b-cbb7-b07e-a7baf3d0bf54	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-559b-cbb7-bebe-13eb1323ab8b	Dogodek-read	Dogodek - branje	f
00030000-559b-cbb7-19bd-2de116cc2fe2	Dogodek-write	Dogodek - spreminjanje	f
00030000-559b-cbb7-91ac-803162ca1547	DrugiVir-read	DrugiVir - branje	f
00030000-559b-cbb7-1c85-b27b330d83ec	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-559b-cbb7-ffc4-3a83ca081777	Drzava-read	Drzava - branje	f
00030000-559b-cbb7-9d3c-a6592788c26f	Drzava-write	Drzava - spreminjanje	f
00030000-559b-cbb7-af9d-fbbfb1c37bbc	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-559b-cbb7-0551-4be643067308	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-559b-cbb7-4324-dd5e187ff39b	Funkcija-read	Funkcija - branje	f
00030000-559b-cbb7-c7ae-d6f191ef0f27	Funkcija-write	Funkcija - spreminjanje	f
00030000-559b-cbb7-2277-9d5f5d0f46f8	Gostovanje-read	Gostovanje - branje	f
00030000-559b-cbb7-9518-7bd271dc2477	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-559b-cbb7-70af-89fc6ffe7b28	Gostujoca-read	Gostujoca - branje	f
00030000-559b-cbb7-b7d4-deb9bad4f4fb	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-559b-cbb7-a6d1-0d62dd75c745	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-559b-cbb7-7c9e-923110dc8fce	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-559b-cbb7-c96a-7add56efd47f	Kupec-read	Kupec - branje	f
00030000-559b-cbb7-1cac-42502c48210f	Kupec-write	Kupec - spreminjanje	f
00030000-559b-cbb7-76c3-9d127c909ee4	NacinPlacina-read	NacinPlacina - branje	f
00030000-559b-cbb7-5e25-40875bfce36a	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-559b-cbb7-4f8e-a7cbb622bf0e	Option-read	Option - branje	f
00030000-559b-cbb7-839e-fc9219151475	Option-write	Option - spreminjanje	f
00030000-559b-cbb7-93cb-eded00373ed7	OptionValue-read	OptionValue - branje	f
00030000-559b-cbb7-cc82-76b62e4c895b	OptionValue-write	OptionValue - spreminjanje	f
00030000-559b-cbb7-a1db-b8b6ca0bb0ba	Oseba-read	Oseba - branje	f
00030000-559b-cbb7-f6e2-771a09310e2c	Oseba-write	Oseba - spreminjanje	f
00030000-559b-cbb7-ab1a-1e5687fc704e	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-559b-cbb7-53fc-8104814b2953	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-559b-cbb7-749a-f627dd7a821a	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-559b-cbb7-132b-1d74518df5eb	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-559b-cbb7-d787-f45c9ac0b7fd	Pogodba-read	Pogodba - branje	f
00030000-559b-cbb7-f7cd-cf656f258510	Pogodba-write	Pogodba - spreminjanje	f
00030000-559b-cbb7-9fe1-c833fd3db3bc	Popa-read	Popa - branje	f
00030000-559b-cbb7-b461-203b03a31142	Popa-write	Popa - spreminjanje	f
00030000-559b-cbb7-44bd-e5b8c9defdd7	Posta-read	Posta - branje	f
00030000-559b-cbb7-e2a9-0f18c2d5aee0	Posta-write	Posta - spreminjanje	f
00030000-559b-cbb7-4efc-f8c83bfe4e25	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-559b-cbb7-d8e8-9972531665b3	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-559b-cbb7-31cb-776077642f18	PostniNaslov-read	PostniNaslov - branje	f
00030000-559b-cbb7-2b61-b4ea6795c73d	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-559b-cbb7-1423-064eec60cee5	Predstava-read	Predstava - branje	f
00030000-559b-cbb7-407b-4ab76228b92b	Predstava-write	Predstava - spreminjanje	f
00030000-559b-cbb7-b577-4f3a5c481105	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-559b-cbb7-b15a-a731bfb8af7b	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-559b-cbb7-d076-eaaf5fdf9ef9	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-559b-cbb7-0dcf-fa3302440c74	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-559b-cbb7-010a-f308f1f256b7	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-559b-cbb7-9ad9-d60d6ae9ca95	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-559b-cbb7-afe0-6d4e2916043a	ProgramDela-read	ProgramDela - branje	f
00030000-559b-cbb7-d8b3-47f928669e0e	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-559b-cbb7-880b-aa86dd0204a3	ProgramFestival-read	ProgramFestival - branje	f
00030000-559b-cbb7-d8f5-0e8805017e61	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-559b-cbb7-62b2-e044018f3b12	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-559b-cbb7-6856-ee1919c65867	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-559b-cbb7-8d33-3ac1c4a3693d	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-559b-cbb7-4c73-b22c2e269952	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-559b-cbb7-8061-1a4463853c1d	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-559b-cbb7-4861-bf55b12ba5c8	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-559b-cbb7-99cf-3a3896d35318	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-559b-cbb7-4f8e-cafebffa369c	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-559b-cbb7-bb4a-03429445608d	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-559b-cbb7-e1b5-4633feb548ec	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-559b-cbb7-82d3-56536093014f	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-559b-cbb7-a008-d4bea5d4ae73	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-559b-cbb7-0e0f-a46767d2535b	ProgramRazno-read	ProgramRazno - branje	f
00030000-559b-cbb7-18fb-2dc68980091a	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-559b-cbb7-1299-15c0377a1805	Prostor-read	Prostor - branje	f
00030000-559b-cbb7-c993-918c9e2ba73b	Prostor-write	Prostor - spreminjanje	f
00030000-559b-cbb7-ee73-baf899dc1f4e	Racun-read	Racun - branje	f
00030000-559b-cbb7-3a4a-5332be69df32	Racun-write	Racun - spreminjanje	f
00030000-559b-cbb7-6123-106be62ca250	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-559b-cbb7-448e-059dbd0547ad	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-559b-cbb7-c759-f3ff84dfa3a4	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-559b-cbb7-fab0-e683a3985b8a	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-559b-cbb7-7cfa-57f1f7763259	Rekvizit-read	Rekvizit - branje	f
00030000-559b-cbb7-c8b3-02218d5ec07d	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-559b-cbb7-b847-36fbae0d50fe	Revizija-read	Revizija - branje	f
00030000-559b-cbb7-0286-2640aca86a68	Revizija-write	Revizija - spreminjanje	f
00030000-559b-cbb7-8851-784196a13325	Rezervacija-read	Rezervacija - branje	f
00030000-559b-cbb7-2226-a39fb61f77a1	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-559b-cbb7-b6f2-f7273774d569	SedezniRed-read	SedezniRed - branje	f
00030000-559b-cbb7-9ce8-46c9eb82d522	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-559b-cbb7-6f7b-c2b58fabf609	Sedez-read	Sedez - branje	f
00030000-559b-cbb7-1371-241671e6333b	Sedez-write	Sedez - spreminjanje	f
00030000-559b-cbb7-de36-57ee123f3051	Sezona-read	Sezona - branje	f
00030000-559b-cbb7-a25f-ad1504082183	Sezona-write	Sezona - spreminjanje	f
00030000-559b-cbb7-4fde-c0d152049daf	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-559b-cbb7-18ef-2c95d701709e	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-559b-cbb7-a15e-79ae72cb80e4	Stevilcenje-read	Stevilcenje - branje	f
00030000-559b-cbb7-1e56-0f01dfd13d71	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-559b-cbb7-e389-4fbaee01c3bf	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-559b-cbb7-0a47-f34dbcc914b7	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-559b-cbb7-71eb-67bcd9c01628	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-559b-cbb7-90b5-528c27265a88	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-559b-cbb7-c74e-eb8b5cd212cd	Telefonska-read	Telefonska - branje	f
00030000-559b-cbb7-9de7-71f4dad40354	Telefonska-write	Telefonska - spreminjanje	f
00030000-559b-cbb7-9659-cb1b548441cb	TerminStoritve-read	TerminStoritve - branje	f
00030000-559b-cbb7-fa90-9624cd554a63	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-559b-cbb7-c3a8-05447267c368	TipFunkcije-read	TipFunkcije - branje	f
00030000-559b-cbb7-d409-daf1f05f5175	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-559b-cbb7-b402-c5c5a55c8262	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-559b-cbb7-c12c-56413a82c9b2	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-559b-cbb7-d8f6-308b0c18bbe5	Trr-read	Trr - branje	f
00030000-559b-cbb7-e2b4-32f3dabbadef	Trr-write	Trr - spreminjanje	f
00030000-559b-cbb7-f4bd-f5e325c5df84	Uprizoritev-read	Uprizoritev - branje	f
00030000-559b-cbb7-0c8a-fd12ed2581a9	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-559b-cbb7-eef9-6c6a1fe0deb9	Vaja-read	Vaja - branje	f
00030000-559b-cbb7-f1b4-97f55c776c88	Vaja-write	Vaja - spreminjanje	f
00030000-559b-cbb7-0a28-405e70fe0973	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-559b-cbb7-1857-43685e4b62ad	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-559b-cbb7-7409-858e42804118	Zaposlitev-read	Zaposlitev - branje	f
00030000-559b-cbb7-4048-a120f83529a2	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-559b-cbb7-396e-7b22f133ffa8	Zasedenost-read	Zasedenost - branje	f
00030000-559b-cbb7-3b52-93c9a7242438	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-559b-cbb7-3880-e3916a3f38d4	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-559b-cbb7-044c-df206c848bf2	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-559b-cbb7-894f-5495165203fc	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-559b-cbb7-b591-b85b3e6ab282	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2857 (class 0 OID 9340450)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-559b-cbb7-95cf-e2214a0ece1b	00030000-559b-cbb7-69e3-b026d336582b
00020000-559b-cbb7-72d3-1d147cd8bf6b	00030000-559b-cbb7-ffc4-3a83ca081777
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-43b8-abc2a7b8630d
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-9b4e-7f4c22bc4808
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-d3cf-c58d23ff4d65
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-88b5-6d6d91f45867
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-6bc0-391bd8c7a41a
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-bebe-13eb1323ab8b
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-b8b5-70572d9828fb
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-19bd-2de116cc2fe2
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-ffc4-3a83ca081777
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-9d3c-a6592788c26f
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-4324-dd5e187ff39b
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-c7ae-d6f191ef0f27
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-2277-9d5f5d0f46f8
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-9518-7bd271dc2477
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-70af-89fc6ffe7b28
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-b7d4-deb9bad4f4fb
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-a6d1-0d62dd75c745
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-7c9e-923110dc8fce
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-4f8e-a7cbb622bf0e
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-93cb-eded00373ed7
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-a1db-b8b6ca0bb0ba
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-f6e2-771a09310e2c
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-9fe1-c833fd3db3bc
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-b461-203b03a31142
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-44bd-e5b8c9defdd7
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-e2a9-0f18c2d5aee0
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-31cb-776077642f18
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-2b61-b4ea6795c73d
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-1423-064eec60cee5
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-407b-4ab76228b92b
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-010a-f308f1f256b7
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-9ad9-d60d6ae9ca95
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-1299-15c0377a1805
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-c993-918c9e2ba73b
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-c759-f3ff84dfa3a4
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-fab0-e683a3985b8a
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-7cfa-57f1f7763259
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-c8b3-02218d5ec07d
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-de36-57ee123f3051
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-a25f-ad1504082183
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-c3a8-05447267c368
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-f4bd-f5e325c5df84
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-0c8a-fd12ed2581a9
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-eef9-6c6a1fe0deb9
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-f1b4-97f55c776c88
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-396e-7b22f133ffa8
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-3b52-93c9a7242438
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-3880-e3916a3f38d4
00020000-559b-cbb7-f6b0-21d1fad6719b	00030000-559b-cbb7-894f-5495165203fc
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-43b8-abc2a7b8630d
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-6bc0-391bd8c7a41a
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-bebe-13eb1323ab8b
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-ffc4-3a83ca081777
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-2277-9d5f5d0f46f8
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-70af-89fc6ffe7b28
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-a6d1-0d62dd75c745
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-7c9e-923110dc8fce
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-4f8e-a7cbb622bf0e
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-93cb-eded00373ed7
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-a1db-b8b6ca0bb0ba
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-f6e2-771a09310e2c
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-9fe1-c833fd3db3bc
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-44bd-e5b8c9defdd7
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-31cb-776077642f18
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-2b61-b4ea6795c73d
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-1423-064eec60cee5
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-1299-15c0377a1805
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-c759-f3ff84dfa3a4
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-7cfa-57f1f7763259
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-de36-57ee123f3051
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-c74e-eb8b5cd212cd
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-9de7-71f4dad40354
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-d8f6-308b0c18bbe5
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-e2b4-32f3dabbadef
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-7409-858e42804118
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-4048-a120f83529a2
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-3880-e3916a3f38d4
00020000-559b-cbb7-a5de-eec8d36eabb1	00030000-559b-cbb7-894f-5495165203fc
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-43b8-abc2a7b8630d
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-d3cf-c58d23ff4d65
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-6bc0-391bd8c7a41a
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-6305-7637ccbb6979
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-5d4e-bced46d0b0f5
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-9910-80ad8aec1d54
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-bebe-13eb1323ab8b
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-ffc4-3a83ca081777
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-4324-dd5e187ff39b
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-2277-9d5f5d0f46f8
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-70af-89fc6ffe7b28
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-a6d1-0d62dd75c745
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-4f8e-a7cbb622bf0e
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-93cb-eded00373ed7
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-a1db-b8b6ca0bb0ba
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-9fe1-c833fd3db3bc
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-44bd-e5b8c9defdd7
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-1423-064eec60cee5
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-010a-f308f1f256b7
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-1299-15c0377a1805
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-c759-f3ff84dfa3a4
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-7cfa-57f1f7763259
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-de36-57ee123f3051
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-c3a8-05447267c368
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-eef9-6c6a1fe0deb9
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-396e-7b22f133ffa8
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-3880-e3916a3f38d4
00020000-559b-cbb7-1579-954d40a453ff	00030000-559b-cbb7-894f-5495165203fc
00020000-559b-cbb7-28a8-525e39781e3a	00030000-559b-cbb7-43b8-abc2a7b8630d
00020000-559b-cbb7-28a8-525e39781e3a	00030000-559b-cbb7-9b4e-7f4c22bc4808
00020000-559b-cbb7-28a8-525e39781e3a	00030000-559b-cbb7-88b5-6d6d91f45867
00020000-559b-cbb7-28a8-525e39781e3a	00030000-559b-cbb7-6bc0-391bd8c7a41a
00020000-559b-cbb7-28a8-525e39781e3a	00030000-559b-cbb7-bebe-13eb1323ab8b
00020000-559b-cbb7-28a8-525e39781e3a	00030000-559b-cbb7-ffc4-3a83ca081777
00020000-559b-cbb7-28a8-525e39781e3a	00030000-559b-cbb7-2277-9d5f5d0f46f8
00020000-559b-cbb7-28a8-525e39781e3a	00030000-559b-cbb7-70af-89fc6ffe7b28
00020000-559b-cbb7-28a8-525e39781e3a	00030000-559b-cbb7-4f8e-a7cbb622bf0e
00020000-559b-cbb7-28a8-525e39781e3a	00030000-559b-cbb7-93cb-eded00373ed7
00020000-559b-cbb7-28a8-525e39781e3a	00030000-559b-cbb7-9fe1-c833fd3db3bc
00020000-559b-cbb7-28a8-525e39781e3a	00030000-559b-cbb7-44bd-e5b8c9defdd7
00020000-559b-cbb7-28a8-525e39781e3a	00030000-559b-cbb7-1423-064eec60cee5
00020000-559b-cbb7-28a8-525e39781e3a	00030000-559b-cbb7-1299-15c0377a1805
00020000-559b-cbb7-28a8-525e39781e3a	00030000-559b-cbb7-c759-f3ff84dfa3a4
00020000-559b-cbb7-28a8-525e39781e3a	00030000-559b-cbb7-7cfa-57f1f7763259
00020000-559b-cbb7-28a8-525e39781e3a	00030000-559b-cbb7-de36-57ee123f3051
00020000-559b-cbb7-28a8-525e39781e3a	00030000-559b-cbb7-c3a8-05447267c368
00020000-559b-cbb7-28a8-525e39781e3a	00030000-559b-cbb7-3880-e3916a3f38d4
00020000-559b-cbb7-28a8-525e39781e3a	00030000-559b-cbb7-894f-5495165203fc
00020000-559b-cbb7-a648-6512bf5ceda4	00030000-559b-cbb7-43b8-abc2a7b8630d
00020000-559b-cbb7-a648-6512bf5ceda4	00030000-559b-cbb7-6bc0-391bd8c7a41a
00020000-559b-cbb7-a648-6512bf5ceda4	00030000-559b-cbb7-bebe-13eb1323ab8b
00020000-559b-cbb7-a648-6512bf5ceda4	00030000-559b-cbb7-ffc4-3a83ca081777
00020000-559b-cbb7-a648-6512bf5ceda4	00030000-559b-cbb7-2277-9d5f5d0f46f8
00020000-559b-cbb7-a648-6512bf5ceda4	00030000-559b-cbb7-70af-89fc6ffe7b28
00020000-559b-cbb7-a648-6512bf5ceda4	00030000-559b-cbb7-4f8e-a7cbb622bf0e
00020000-559b-cbb7-a648-6512bf5ceda4	00030000-559b-cbb7-93cb-eded00373ed7
00020000-559b-cbb7-a648-6512bf5ceda4	00030000-559b-cbb7-9fe1-c833fd3db3bc
00020000-559b-cbb7-a648-6512bf5ceda4	00030000-559b-cbb7-44bd-e5b8c9defdd7
00020000-559b-cbb7-a648-6512bf5ceda4	00030000-559b-cbb7-1423-064eec60cee5
00020000-559b-cbb7-a648-6512bf5ceda4	00030000-559b-cbb7-1299-15c0377a1805
00020000-559b-cbb7-a648-6512bf5ceda4	00030000-559b-cbb7-c759-f3ff84dfa3a4
00020000-559b-cbb7-a648-6512bf5ceda4	00030000-559b-cbb7-7cfa-57f1f7763259
00020000-559b-cbb7-a648-6512bf5ceda4	00030000-559b-cbb7-de36-57ee123f3051
00020000-559b-cbb7-a648-6512bf5ceda4	00030000-559b-cbb7-9659-cb1b548441cb
00020000-559b-cbb7-a648-6512bf5ceda4	00030000-559b-cbb7-5eec-fd5acfac78f5
00020000-559b-cbb7-a648-6512bf5ceda4	00030000-559b-cbb7-c3a8-05447267c368
00020000-559b-cbb7-a648-6512bf5ceda4	00030000-559b-cbb7-3880-e3916a3f38d4
00020000-559b-cbb7-a648-6512bf5ceda4	00030000-559b-cbb7-894f-5495165203fc
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-82ba-9567f359651a
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-69e3-b026d336582b
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-5eec-fd5acfac78f5
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-b8b5-70572d9828fb
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-57f4-a4891b3ac6b8
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-403c-9d60566b474c
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-43b8-abc2a7b8630d
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-9b4e-7f4c22bc4808
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-d3cf-c58d23ff4d65
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-88b5-6d6d91f45867
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-6bc0-391bd8c7a41a
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-6305-7637ccbb6979
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-5d4e-bced46d0b0f5
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-85a0-7fe1ad521246
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-9910-80ad8aec1d54
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-b07e-a7baf3d0bf54
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-bebe-13eb1323ab8b
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-19bd-2de116cc2fe2
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-ffc4-3a83ca081777
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-9d3c-a6592788c26f
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-af9d-fbbfb1c37bbc
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-0551-4be643067308
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-4324-dd5e187ff39b
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-c7ae-d6f191ef0f27
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-2277-9d5f5d0f46f8
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-9518-7bd271dc2477
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-70af-89fc6ffe7b28
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-b7d4-deb9bad4f4fb
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-a6d1-0d62dd75c745
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-7c9e-923110dc8fce
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-c96a-7add56efd47f
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-1cac-42502c48210f
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-76c3-9d127c909ee4
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-5e25-40875bfce36a
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-4f8e-a7cbb622bf0e
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-839e-fc9219151475
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-93cb-eded00373ed7
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-cc82-76b62e4c895b
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-a1db-b8b6ca0bb0ba
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-f6e2-771a09310e2c
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-ab1a-1e5687fc704e
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-53fc-8104814b2953
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-749a-f627dd7a821a
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-132b-1d74518df5eb
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-d787-f45c9ac0b7fd
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-f7cd-cf656f258510
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-9fe1-c833fd3db3bc
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-b461-203b03a31142
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-44bd-e5b8c9defdd7
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-e2a9-0f18c2d5aee0
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-4efc-f8c83bfe4e25
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-d8e8-9972531665b3
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-31cb-776077642f18
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-2b61-b4ea6795c73d
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-1423-064eec60cee5
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-407b-4ab76228b92b
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-b577-4f3a5c481105
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-b15a-a731bfb8af7b
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-d076-eaaf5fdf9ef9
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-0dcf-fa3302440c74
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-010a-f308f1f256b7
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-9ad9-d60d6ae9ca95
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-afe0-6d4e2916043a
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-d8b3-47f928669e0e
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-880b-aa86dd0204a3
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-d8f5-0e8805017e61
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-62b2-e044018f3b12
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-6856-ee1919c65867
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-8d33-3ac1c4a3693d
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-4c73-b22c2e269952
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-8061-1a4463853c1d
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-4861-bf55b12ba5c8
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-99cf-3a3896d35318
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-4f8e-cafebffa369c
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-bb4a-03429445608d
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-e1b5-4633feb548ec
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-82d3-56536093014f
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-a008-d4bea5d4ae73
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-0e0f-a46767d2535b
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-18fb-2dc68980091a
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-1299-15c0377a1805
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-c993-918c9e2ba73b
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-ee73-baf899dc1f4e
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-3a4a-5332be69df32
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-6123-106be62ca250
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-448e-059dbd0547ad
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-c759-f3ff84dfa3a4
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-fab0-e683a3985b8a
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-7cfa-57f1f7763259
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-c8b3-02218d5ec07d
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-b847-36fbae0d50fe
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-0286-2640aca86a68
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-8851-784196a13325
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-2226-a39fb61f77a1
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-b6f2-f7273774d569
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-9ce8-46c9eb82d522
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-6f7b-c2b58fabf609
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-1371-241671e6333b
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-de36-57ee123f3051
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-a25f-ad1504082183
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-4fde-c0d152049daf
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-18ef-2c95d701709e
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-a15e-79ae72cb80e4
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-1e56-0f01dfd13d71
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-e389-4fbaee01c3bf
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-0a47-f34dbcc914b7
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-71eb-67bcd9c01628
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-90b5-528c27265a88
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-c74e-eb8b5cd212cd
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-9de7-71f4dad40354
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-9659-cb1b548441cb
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-fa90-9624cd554a63
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-c3a8-05447267c368
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-d409-daf1f05f5175
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-b402-c5c5a55c8262
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-c12c-56413a82c9b2
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-d8f6-308b0c18bbe5
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-e2b4-32f3dabbadef
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-f4bd-f5e325c5df84
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-0c8a-fd12ed2581a9
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-eef9-6c6a1fe0deb9
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-f1b4-97f55c776c88
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-0a28-405e70fe0973
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-1857-43685e4b62ad
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-7409-858e42804118
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-4048-a120f83529a2
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-396e-7b22f133ffa8
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-3b52-93c9a7242438
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-3880-e3916a3f38d4
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-044c-df206c848bf2
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-894f-5495165203fc
00020000-559b-cbb9-70df-1065606a5937	00030000-559b-cbb7-b591-b85b3e6ab282
\.


--
-- TOC entry 2885 (class 0 OID 9340745)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 9340776)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 9340889)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-559b-cbb9-5956-43ac5cd19ec8	00090000-559b-cbb9-af01-5107a45e65a4	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
000b0000-559b-cbb9-e7fb-83ba46c22e32	00090000-559b-cbb9-6fdb-1898842d1843	\N	\N	0002	401.00	\N	\N	11.00	31.00	11.00	401.00	t	f	Pogodba za vlogo Helena
000b0000-559b-cbb9-2b62-8a3737e942e8	00090000-559b-cbb9-9c7a-2f056361dbb3	\N	\N	0003	402.00	\N	\N	12.00	32.00	12.00	402.00	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2862 (class 0 OID 9340510)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-559b-cbb9-46fa-d9fda02cd45b	00040000-559b-cbb7-1dbe-f71a715c6c21	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559b-cbb9-9a87-1c0d2297fb8d	00040000-559b-cbb7-1dbe-f71a715c6c21	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-559b-cbb9-a1b5-27937018ca19	00040000-559b-cbb7-1dbe-f71a715c6c21	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559b-cbb9-f1ad-ca6597693c75	00040000-559b-cbb7-1dbe-f71a715c6c21	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559b-cbb9-7b21-938d19d4ae65	00040000-559b-cbb7-1dbe-f71a715c6c21	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559b-cbb9-d334-f407e6a467d2	00040000-559b-cbb7-c658-9b58b9dd677e	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559b-cbb9-cd62-3194633956dd	00040000-559b-cbb7-86b9-4859c1697d00	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559b-cbb9-2f9a-ee1d59095e63	00040000-559b-cbb7-78ee-bba14acfed6d	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559b-cbb9-3d64-35f85770b731	00040000-559b-cbb7-1dbe-f71a715c6c21	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2864 (class 0 OID 9340545)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-559b-cbb8-5636-a7045967c82b	8341	Adlešiči
00050000-559b-cbb8-91a1-0dddf3fdd8a5	5270	Ajdovščina
00050000-559b-cbb8-6ebc-6cdd431e6ae8	6280	Ankaran/Ancarano
00050000-559b-cbb8-f013-7b90627d8354	9253	Apače
00050000-559b-cbb8-6c14-3359eb0c6a81	8253	Artiče
00050000-559b-cbb8-810f-bc5f03809b45	4275	Begunje na Gorenjskem
00050000-559b-cbb8-df93-6bfb94946655	1382	Begunje pri Cerknici
00050000-559b-cbb8-d685-0e177cf63751	9231	Beltinci
00050000-559b-cbb8-31d3-f31c39351a33	2234	Benedikt
00050000-559b-cbb8-7f53-5dd972078380	2345	Bistrica ob Dravi
00050000-559b-cbb8-1403-e3e8b4b8f8cd	3256	Bistrica ob Sotli
00050000-559b-cbb8-c6c3-a95f3b2bb59a	8259	Bizeljsko
00050000-559b-cbb8-29eb-06f4af56804d	1223	Blagovica
00050000-559b-cbb8-16d9-85fbf3539b86	8283	Blanca
00050000-559b-cbb8-50e3-e6f2ee8ecf94	4260	Bled
00050000-559b-cbb8-42f4-134a8a4b7045	4273	Blejska Dobrava
00050000-559b-cbb8-44e0-3cb44edb2d0a	9265	Bodonci
00050000-559b-cbb8-e32c-840d18af0828	9222	Bogojina
00050000-559b-cbb8-9c91-655a3bc4d328	4263	Bohinjska Bela
00050000-559b-cbb8-e445-7c5ba10c3c81	4264	Bohinjska Bistrica
00050000-559b-cbb8-3228-03018c00eea8	4265	Bohinjsko jezero
00050000-559b-cbb8-f877-158a431f9b2c	1353	Borovnica
00050000-559b-cbb8-6ee4-47a077a10e75	8294	Boštanj
00050000-559b-cbb8-7a49-3dd85f80f878	5230	Bovec
00050000-559b-cbb8-34df-cb2b1658b8b0	5295	Branik
00050000-559b-cbb8-4c3c-59bf6f38cc5a	3314	Braslovče
00050000-559b-cbb8-77d0-c7343a846d02	5223	Breginj
00050000-559b-cbb8-7d9c-9764398a1911	8280	Brestanica
00050000-559b-cbb8-037b-b9c436bd94fc	2354	Bresternica
00050000-559b-cbb8-8de3-cf6ff7d2cf77	4243	Brezje
00050000-559b-cbb8-038a-bc282b56aa8d	1351	Brezovica pri Ljubljani
00050000-559b-cbb8-555f-6122ae3f3faf	8250	Brežice
00050000-559b-cbb8-5c0a-e1dd5aa05f7c	4210	Brnik - Aerodrom
00050000-559b-cbb8-2be2-7bdec6d31997	8321	Brusnice
00050000-559b-cbb8-1144-74bd8a649365	3255	Buče
00050000-559b-cbb8-a75e-97efd148b64c	8276	Bučka 
00050000-559b-cbb8-6ef9-90cfe28e0d3e	9261	Cankova
00050000-559b-cbb8-f96b-10d48126da79	3000	Celje 
00050000-559b-cbb8-e4c3-310f0e414514	3001	Celje - poštni predali
00050000-559b-cbb8-d6e8-9a45af3ee22c	4207	Cerklje na Gorenjskem
00050000-559b-cbb8-1053-4bff1d8d5979	8263	Cerklje ob Krki
00050000-559b-cbb8-0945-d61dabed3d04	1380	Cerknica
00050000-559b-cbb8-1e41-fec51d1d2c58	5282	Cerkno
00050000-559b-cbb8-8ba6-6d3092431515	2236	Cerkvenjak
00050000-559b-cbb8-590b-7755ebf57ee7	2215	Ceršak
00050000-559b-cbb8-fdae-f2dd16eb3b5d	2326	Cirkovce
00050000-559b-cbb8-47fe-8c19a1d5cb97	2282	Cirkulane
00050000-559b-cbb8-790e-4b83005fc6dc	5273	Col
00050000-559b-cbb8-8fe2-688f09c30f38	8251	Čatež ob Savi
00050000-559b-cbb8-d624-ede433ffd75c	1413	Čemšenik
00050000-559b-cbb8-4fb3-cb10501d4700	5253	Čepovan
00050000-559b-cbb8-0fbe-fd27da9f4384	9232	Črenšovci
00050000-559b-cbb8-c4b8-b1ae6102a83b	2393	Črna na Koroškem
00050000-559b-cbb8-e2b2-47f769efdb5c	6275	Črni Kal
00050000-559b-cbb8-ac13-887b9495c3d6	5274	Črni Vrh nad Idrijo
00050000-559b-cbb8-67cd-6b20e2ece219	5262	Črniče
00050000-559b-cbb8-da03-9e78a8eb2a33	8340	Črnomelj
00050000-559b-cbb8-22ac-7ebd0dbcb0dd	6271	Dekani
00050000-559b-cbb8-808d-9301fbb43d52	5210	Deskle
00050000-559b-cbb8-fce4-8782ad2b2968	2253	Destrnik
00050000-559b-cbb8-2b8f-9057ed9689fc	6215	Divača
00050000-559b-cbb8-d28e-f418a440cc50	1233	Dob
00050000-559b-cbb8-ba63-3d9396fbb8bb	3224	Dobje pri Planini
00050000-559b-cbb8-f08a-bce752636ac4	8257	Dobova
00050000-559b-cbb8-57b2-d93b56f1e3e5	1423	Dobovec
00050000-559b-cbb8-4461-22fd03642c37	5263	Dobravlje
00050000-559b-cbb8-b626-916dc0b289ce	3204	Dobrna
00050000-559b-cbb8-ca53-5302eaa6a728	8211	Dobrnič
00050000-559b-cbb8-ee79-e36aa1056f98	1356	Dobrova
00050000-559b-cbb8-96af-a10f72a5c03c	9223	Dobrovnik/Dobronak 
00050000-559b-cbb8-cd6d-bdfe7eafb00c	5212	Dobrovo v Brdih
00050000-559b-cbb8-b5f9-8fc53150b759	1431	Dol pri Hrastniku
00050000-559b-cbb8-954e-70797590d4b3	1262	Dol pri Ljubljani
00050000-559b-cbb8-b78c-ce6e640de6e3	1273	Dole pri Litiji
00050000-559b-cbb8-c129-1500ca09dfb4	1331	Dolenja vas
00050000-559b-cbb8-3203-b1ddcb0d33a5	8350	Dolenjske Toplice
00050000-559b-cbb8-03e5-9d9ad4e92ae1	1230	Domžale
00050000-559b-cbb8-2d9f-250e490d8f6e	2252	Dornava
00050000-559b-cbb8-a485-c0df396e53ea	5294	Dornberk
00050000-559b-cbb8-270f-859c4060ce89	1319	Draga
00050000-559b-cbb8-d197-f28b3655db57	8343	Dragatuš
00050000-559b-cbb8-7403-9e36ccea0769	3222	Dramlje
00050000-559b-cbb8-bfad-f7644456cf60	2370	Dravograd
00050000-559b-cbb8-5a5a-0bea5c5940c0	4203	Duplje
00050000-559b-cbb8-5d03-b0dfa5e44953	6221	Dutovlje
00050000-559b-cbb8-4c13-16425d6b64b9	8361	Dvor
00050000-559b-cbb8-ca0e-9c13db7c3f8b	2343	Fala
00050000-559b-cbb8-234e-3ac30cbaf229	9208	Fokovci
00050000-559b-cbb8-baf8-f5593845bbff	2313	Fram
00050000-559b-cbb8-a982-937d2d111c0b	3213	Frankolovo
00050000-559b-cbb8-2efe-34378b11f840	1274	Gabrovka
00050000-559b-cbb8-8a53-5312b1f54338	8254	Globoko
00050000-559b-cbb8-fed4-0a616863a174	5275	Godovič
00050000-559b-cbb8-5ed9-1164d00e9014	4204	Golnik
00050000-559b-cbb8-c695-8bcbfd03115e	3303	Gomilsko
00050000-559b-cbb8-622c-ee371bce061f	4224	Gorenja vas
00050000-559b-cbb8-14c4-4c0d0611ede6	3263	Gorica pri Slivnici
00050000-559b-cbb8-8e8d-13e37a89565e	2272	Gorišnica
00050000-559b-cbb8-fac3-5ffa45e54d5c	9250	Gornja Radgona
00050000-559b-cbb8-3567-f400798ef355	3342	Gornji Grad
00050000-559b-cbb8-1ec6-1ec0feaf923f	4282	Gozd Martuljek
00050000-559b-cbb8-f217-73bc0cfb705b	6272	Gračišče
00050000-559b-cbb8-64e9-2e34c007f934	9264	Grad
00050000-559b-cbb8-87e0-b4013bb6fda6	8332	Gradac
00050000-559b-cbb8-5759-c70aab902fd5	1384	Grahovo
00050000-559b-cbb8-3331-a504689e4d79	5242	Grahovo ob Bači
00050000-559b-cbb8-c18f-53f8ab4cfdb1	5251	Grgar
00050000-559b-cbb8-22b6-e1656bac4c4c	3302	Griže
00050000-559b-cbb8-9f28-36c4c4ee64d4	3231	Grobelno
00050000-559b-cbb8-39e0-855b2e8bbffa	1290	Grosuplje
00050000-559b-cbb8-b2b1-52562c7a8e30	2288	Hajdina
00050000-559b-cbb8-c7d4-9f9ea058036c	8362	Hinje
00050000-559b-cbb8-654f-c081f7a6ac63	2311	Hoče
00050000-559b-cbb8-33c0-c45ba0c16b19	9205	Hodoš/Hodos
00050000-559b-cbb8-d94c-b2baa8060347	1354	Horjul
00050000-559b-cbb8-4dfa-b216f757857a	1372	Hotedršica
00050000-559b-cbb8-c10d-d2e402a6fab3	1430	Hrastnik
00050000-559b-cbb8-84f9-8f6effe042fb	6225	Hruševje
00050000-559b-cbb8-adbd-368f490dd846	4276	Hrušica
00050000-559b-cbb8-44e6-ff2836349093	5280	Idrija
00050000-559b-cbb8-9e73-7d50f8a3597b	1292	Ig
00050000-559b-cbb8-3469-b5e20e225418	6250	Ilirska Bistrica
00050000-559b-cbb8-e468-53b3f6d9de21	6251	Ilirska Bistrica-Trnovo
00050000-559b-cbb8-d142-3c747ea9d2a1	1295	Ivančna Gorica
00050000-559b-cbb8-bde9-3419c3a5c505	2259	Ivanjkovci
00050000-559b-cbb8-7ccc-cba03f63961f	1411	Izlake
00050000-559b-cbb8-0143-2356e7dc0d6d	6310	Izola/Isola
00050000-559b-cbb8-cfa2-472bcd08f361	2222	Jakobski Dol
00050000-559b-cbb8-f956-ee9b8c4503f6	2221	Jarenina
00050000-559b-cbb8-84f9-466d8bfee57c	6254	Jelšane
00050000-559b-cbb8-0724-145b02dd15db	4270	Jesenice
00050000-559b-cbb8-8fbc-5cb86c1cf967	8261	Jesenice na Dolenjskem
00050000-559b-cbb8-ba52-d803cad81adb	3273	Jurklošter
00050000-559b-cbb8-5990-f8b94ca51449	2223	Jurovski Dol
00050000-559b-cbb8-7a66-c7859a7a8319	2256	Juršinci
00050000-559b-cbb8-b2c8-2f7147eff2e2	5214	Kal nad Kanalom
00050000-559b-cbb8-eee5-e7799d2a081e	3233	Kalobje
00050000-559b-cbb8-d6c8-f0bbbafd135f	4246	Kamna Gorica
00050000-559b-cbb8-b329-1e690eee20d7	2351	Kamnica
00050000-559b-cbb8-6e80-40dcc4fa8430	1241	Kamnik
00050000-559b-cbb8-2e5b-6a7fde4ea60c	5213	Kanal
00050000-559b-cbb8-2266-a8e5eb9f1b52	8258	Kapele
00050000-559b-cbb8-d88d-2e2611d7266b	2362	Kapla
00050000-559b-cbb8-c816-5369db85990f	2325	Kidričevo
00050000-559b-cbb8-3dce-a8078cc00b3a	1412	Kisovec
00050000-559b-cbb8-22d7-0c9e770f0002	6253	Knežak
00050000-559b-cbb8-7c2c-5e5b5448bdff	5222	Kobarid
00050000-559b-cbb8-d7f1-868102db262f	9227	Kobilje
00050000-559b-cbb8-8445-715791bc109b	1330	Kočevje
00050000-559b-cbb8-fce6-bedffadbb810	1338	Kočevska Reka
00050000-559b-cbb8-4e57-e8e8d4852bef	2276	Kog
00050000-559b-cbb8-3ff9-4cc2500ae873	5211	Kojsko
00050000-559b-cbb8-0bac-669648b0c3b7	6223	Komen
00050000-559b-cbb8-3f52-5235e21ed6e8	1218	Komenda
00050000-559b-cbb8-cc36-e7b8d706d2cd	6000	Koper/Capodistria 
00050000-559b-cbb8-8190-b134e82b8ed0	6001	Koper/Capodistria - poštni predali
00050000-559b-cbb8-0af0-a3da9264fd2b	8282	Koprivnica
00050000-559b-cbb8-2eee-6a395c4e858a	5296	Kostanjevica na Krasu
00050000-559b-cbb8-770a-2846a7981ac9	8311	Kostanjevica na Krki
00050000-559b-cbb8-5ab4-f5c760b74510	1336	Kostel
00050000-559b-cbb8-4d19-1b853ac2b4a2	6256	Košana
00050000-559b-cbb8-1af0-eeab3a82afce	2394	Kotlje
00050000-559b-cbb8-f81a-92243b366b56	6240	Kozina
00050000-559b-cbb8-7e4b-02718ac6cd80	3260	Kozje
00050000-559b-cbb8-42bc-ae6a7a2b4cb7	4000	Kranj 
00050000-559b-cbb8-fc76-3e64d19b9c43	4001	Kranj - poštni predali
00050000-559b-cbb8-b7ac-a391a6f6400d	4280	Kranjska Gora
00050000-559b-cbb8-da5e-e1e4ded6468a	1281	Kresnice
00050000-559b-cbb8-3b66-adeb1f89660e	4294	Križe
00050000-559b-cbb8-4f81-27af43674930	9206	Križevci
00050000-559b-cbb8-9752-9908b85ce3b6	9242	Križevci pri Ljutomeru
00050000-559b-cbb8-5421-5bf283861562	1301	Krka
00050000-559b-cbb8-e1b9-4e7ca4d599e0	8296	Krmelj
00050000-559b-cbb8-ed1b-9eaca765e462	4245	Kropa
00050000-559b-cbb8-24ce-a6490327672b	8262	Krška vas
00050000-559b-cbb8-792a-c16b04424ce5	8270	Krško
00050000-559b-cbb8-ab9d-2ba0612a37f2	9263	Kuzma
00050000-559b-cbb8-4684-1423fbedd72b	2318	Laporje
00050000-559b-cbb8-c809-56d00d7e7c20	3270	Laško
00050000-559b-cbb8-65aa-891c6f61a461	1219	Laze v Tuhinju
00050000-559b-cbb8-2e6d-8c2782ca11d0	2230	Lenart v Slovenskih goricah
00050000-559b-cbb8-0a3f-22bedd4be08b	9220	Lendava/Lendva
00050000-559b-cbb8-49a9-65f7b2568a3c	4248	Lesce
00050000-559b-cbb8-df6e-428598133e35	3261	Lesično
00050000-559b-cbb8-d578-f00d3cde8fc5	8273	Leskovec pri Krškem
00050000-559b-cbb8-7056-1c2904e249dd	2372	Libeliče
00050000-559b-cbb8-ca24-a90e39940057	2341	Limbuš
00050000-559b-cbb8-96b0-b7f38195042e	1270	Litija
00050000-559b-cbb8-50ce-342349dffb23	3202	Ljubečna
00050000-559b-cbb8-cee5-f05a5c19a5dd	1000	Ljubljana 
00050000-559b-cbb8-a4b3-d74c71cce433	1001	Ljubljana - poštni predali
00050000-559b-cbb8-bc43-3fa37f576d3d	1231	Ljubljana - Črnuče
00050000-559b-cbb8-8515-53109bb1d484	1261	Ljubljana - Dobrunje
00050000-559b-cbb8-c2d5-580b7bbd84fb	1260	Ljubljana - Polje
00050000-559b-cbb8-63bc-84d22c49119b	1210	Ljubljana - Šentvid
00050000-559b-cbb8-64dc-dd172160fb3c	1211	Ljubljana - Šmartno
00050000-559b-cbb8-8554-b3035f7670d4	3333	Ljubno ob Savinji
00050000-559b-cbb8-8f57-ace20a5538d4	9240	Ljutomer
00050000-559b-cbb8-b00c-e22868b3070f	3215	Loče
00050000-559b-cbb8-7453-af5596d13359	5231	Log pod Mangartom
00050000-559b-cbb8-5665-c78a329ef900	1358	Log pri Brezovici
00050000-559b-cbb8-501e-c85c3ddb5b83	1370	Logatec
00050000-559b-cbb8-136e-0fc2e68e5b9a	1371	Logatec
00050000-559b-cbb8-2cde-98838cd7bc3e	1434	Loka pri Zidanem Mostu
00050000-559b-cbb8-3fbf-be14d45f7750	3223	Loka pri Žusmu
00050000-559b-cbb8-cb6b-56a95d19b877	6219	Lokev
00050000-559b-cbb8-aef1-d9c91c7f528a	1318	Loški Potok
00050000-559b-cbb8-0bd5-9a1110aca620	2324	Lovrenc na Dravskem polju
00050000-559b-cbb8-7b3e-042e6f4ab2b4	2344	Lovrenc na Pohorju
00050000-559b-cbb8-f0cf-ec2074adbcec	3334	Luče
00050000-559b-cbb8-ed15-aa2ac3dc7365	1225	Lukovica
00050000-559b-cbb8-6140-5f3fa28bfa91	9202	Mačkovci
00050000-559b-cbb8-008c-1ed05753cbee	2322	Majšperk
00050000-559b-cbb8-3741-166ae9427561	2321	Makole
00050000-559b-cbb8-bfe1-484c3fc0fbf8	9243	Mala Nedelja
00050000-559b-cbb8-3b70-a39c2f77b417	2229	Malečnik
00050000-559b-cbb8-86f5-002ac4c6956e	6273	Marezige
00050000-559b-cbb8-1b83-db43a3ed62f1	2000	Maribor 
00050000-559b-cbb8-6f22-38da0baf4d32	2001	Maribor - poštni predali
00050000-559b-cbb8-567f-bad39c515c14	2206	Marjeta na Dravskem polju
00050000-559b-cbb8-0b4d-ee950318ec32	2281	Markovci
00050000-559b-cbb8-a8ce-c081b8b78f8e	9221	Martjanci
00050000-559b-cbb8-cf12-be1136821bbb	6242	Materija
00050000-559b-cbb8-9656-2529453443cf	4211	Mavčiče
00050000-559b-cbb8-7505-44339e0d8e4f	1215	Medvode
00050000-559b-cbb8-8583-299082af758e	1234	Mengeš
00050000-559b-cbb8-201a-a2277c3d7972	8330	Metlika
00050000-559b-cbb8-21d0-e25d617fc2ad	2392	Mežica
00050000-559b-cbb8-17b6-c36cddfedd0e	2204	Miklavž na Dravskem polju
00050000-559b-cbb8-5265-9a103b0c232c	2275	Miklavž pri Ormožu
00050000-559b-cbb8-9c57-4bcdc347c63c	5291	Miren
00050000-559b-cbb8-6285-7e202b3bb4ab	8233	Mirna
00050000-559b-cbb8-bc1a-1f8185b3fe0b	8216	Mirna Peč
00050000-559b-cbb8-caf1-66c444a6af81	2382	Mislinja
00050000-559b-cbb8-d5e9-328400413f6d	4281	Mojstrana
00050000-559b-cbb8-cfae-0e81ef587f2c	8230	Mokronog
00050000-559b-cbb8-ecfb-2943e180a329	1251	Moravče
00050000-559b-cbb8-211f-f6f107a7a70d	9226	Moravske Toplice
00050000-559b-cbb8-7bd4-824e53e91e4b	5216	Most na Soči
00050000-559b-cbb8-56ea-471104ba63bd	1221	Motnik
00050000-559b-cbb8-88bd-5609c13c3e97	3330	Mozirje
00050000-559b-cbb8-238e-be5f05a2e53b	9000	Murska Sobota 
00050000-559b-cbb8-f6b0-eb5e2898de4c	9001	Murska Sobota - poštni predali
00050000-559b-cbb8-77d1-f15c8a0c5b2b	2366	Muta
00050000-559b-cbb8-04a1-646b1e7f67c2	4202	Naklo
00050000-559b-cbb8-1d9a-059296129c1f	3331	Nazarje
00050000-559b-cbb8-ef43-12ce8e929c01	1357	Notranje Gorice
00050000-559b-cbb8-dd15-5dc0e5797373	3203	Nova Cerkev
00050000-559b-cbb8-47a2-6ab7271e11b6	5000	Nova Gorica 
00050000-559b-cbb8-75ff-eb0de4a64e7c	5001	Nova Gorica - poštni predali
00050000-559b-cbb8-fb37-1872878db650	1385	Nova vas
00050000-559b-cbb8-db8b-06b69eafa41b	8000	Novo mesto
00050000-559b-cbb8-a0da-3723951cf7ce	8001	Novo mesto - poštni predali
00050000-559b-cbb8-8938-87ef7db9591e	6243	Obrov
00050000-559b-cbb8-9e09-a0511889cd9c	9233	Odranci
00050000-559b-cbb8-3e78-4881e4334d28	2317	Oplotnica
00050000-559b-cbb8-7fa8-3e98dc13ae66	2312	Orehova vas
00050000-559b-cbb8-1297-39b72b52de51	2270	Ormož
00050000-559b-cbb8-0282-0b31cde1e32e	1316	Ortnek
00050000-559b-cbb8-197a-611935451c12	1337	Osilnica
00050000-559b-cbb8-8417-f9b0bc2142df	8222	Otočec
00050000-559b-cbb8-03ab-ec1edcea3ffd	2361	Ožbalt
00050000-559b-cbb8-be01-a63b6258a2ea	2231	Pernica
00050000-559b-cbb8-e9ae-e0a3ccbd5a73	2211	Pesnica pri Mariboru
00050000-559b-cbb8-0562-76f50d93e30b	9203	Petrovci
00050000-559b-cbb8-b2e4-b8b35399eee2	3301	Petrovče
00050000-559b-cbb8-ad54-0fe8dfa5d4ff	6330	Piran/Pirano
00050000-559b-cbb8-0985-e7499d1bbf29	8255	Pišece
00050000-559b-cbb8-f274-a46aa5b46b2a	6257	Pivka
00050000-559b-cbb8-8303-240aa8a4725f	6232	Planina
00050000-559b-cbb8-4797-e5fe71124d7a	3225	Planina pri Sevnici
00050000-559b-cbb8-b662-e894a8b0b603	6276	Pobegi
00050000-559b-cbb8-5aec-b32c6928665a	8312	Podbočje
00050000-559b-cbb8-0b2b-4e78a6737f3b	5243	Podbrdo
00050000-559b-cbb8-fcd9-d22581adfe30	3254	Podčetrtek
00050000-559b-cbb8-232e-df409051ebab	2273	Podgorci
00050000-559b-cbb8-babc-0c30fad2f79d	6216	Podgorje
00050000-559b-cbb8-6d25-cafe937e2e8b	2381	Podgorje pri Slovenj Gradcu
00050000-559b-cbb8-fe74-33cf9b3c1ec4	6244	Podgrad
00050000-559b-cbb8-ba20-ba9a45bc7d8b	1414	Podkum
00050000-559b-cbb8-933c-ac96204e3a28	2286	Podlehnik
00050000-559b-cbb8-1ba9-e03baab4cebe	5272	Podnanos
00050000-559b-cbb8-5181-18ea214313c9	4244	Podnart
00050000-559b-cbb8-3b81-0c0cfbf6ed10	3241	Podplat
00050000-559b-cbb8-3795-34a636a390a1	3257	Podsreda
00050000-559b-cbb8-2be5-20c480598543	2363	Podvelka
00050000-559b-cbb8-f8e4-7f2406d1268a	2208	Pohorje
00050000-559b-cbb8-413c-7ce4991f6716	2257	Polenšak
00050000-559b-cbb8-178f-a857e484a8b0	1355	Polhov Gradec
00050000-559b-cbb8-2eef-73acce6dfc6d	4223	Poljane nad Škofjo Loko
00050000-559b-cbb8-bbc0-f52cc7feef0e	2319	Poljčane
00050000-559b-cbb8-2c61-2048f445606a	1272	Polšnik
00050000-559b-cbb8-eb02-a18dd310d960	3313	Polzela
00050000-559b-cbb8-579f-5c05cb22f7be	3232	Ponikva
00050000-559b-cbb8-f89a-0fe55908880e	6320	Portorož/Portorose
00050000-559b-cbb8-0e10-78976d3844e2	6230	Postojna
00050000-559b-cbb8-3529-f4fcb976b368	2331	Pragersko
00050000-559b-cbb8-3aab-4516b6eeb32f	3312	Prebold
00050000-559b-cbb8-be6e-9179eb361ff8	4205	Preddvor
00050000-559b-cbb8-0f51-7352aa40fafc	6255	Prem
00050000-559b-cbb8-32c8-5bb64e434453	1352	Preserje
00050000-559b-cbb8-3164-50b5c9a15f86	6258	Prestranek
00050000-559b-cbb8-4dfd-e4f9bb4a0be5	2391	Prevalje
00050000-559b-cbb8-8101-281917e1699f	3262	Prevorje
00050000-559b-cbb8-e83e-ba27e0325ae1	1276	Primskovo 
00050000-559b-cbb8-1b02-0b6df5af5522	3253	Pristava pri Mestinju
00050000-559b-cbb8-960e-25f8ba35b233	9207	Prosenjakovci/Partosfalva
00050000-559b-cbb8-fe42-1c0fd58ffcc1	5297	Prvačina
00050000-559b-cbb8-132f-cf04d5b44c35	2250	Ptuj
00050000-559b-cbb8-2b62-780fec25fa78	2323	Ptujska Gora
00050000-559b-cbb8-ecf8-d9d52a3c9b83	9201	Puconci
00050000-559b-cbb8-c8df-0e78aa58b1de	2327	Rače
00050000-559b-cbb8-cbf9-68f3e1f4b2a6	1433	Radeče
00050000-559b-cbb8-8ab7-5533e90b5ca6	9252	Radenci
00050000-559b-cbb8-fe01-b4c468b2e6b6	2360	Radlje ob Dravi
00050000-559b-cbb8-3272-bf0c225be40b	1235	Radomlje
00050000-559b-cbb8-3b85-3034fdd8262b	4240	Radovljica
00050000-559b-cbb8-78f2-37038f157a60	8274	Raka
00050000-559b-cbb8-6bce-172e063f8974	1381	Rakek
00050000-559b-cbb8-a9e7-227a0f09e0c8	4283	Rateče - Planica
00050000-559b-cbb8-2d06-1f50b7dc66ed	2390	Ravne na Koroškem
00050000-559b-cbb8-ea88-15a298f2dc85	9246	Razkrižje
00050000-559b-cbb8-0bf2-528658de3bd7	3332	Rečica ob Savinji
00050000-559b-cbb8-cac0-999049c3a924	5292	Renče
00050000-559b-cbb8-2850-0d9f6f983361	1310	Ribnica
00050000-559b-cbb8-709a-9fd05201cd09	2364	Ribnica na Pohorju
00050000-559b-cbb8-a32e-2b6bab7013c4	3272	Rimske Toplice
00050000-559b-cbb8-2fcc-b134fee2c838	1314	Rob
00050000-559b-cbb8-d90c-0651e1d6284f	5215	Ročinj
00050000-559b-cbb8-3661-c617371ac2f6	3250	Rogaška Slatina
00050000-559b-cbb8-6a6e-8d92f995da9e	9262	Rogašovci
00050000-559b-cbb8-8f2c-b8fbbafb75eb	3252	Rogatec
00050000-559b-cbb8-e3ba-dbc1ac1daf17	1373	Rovte
00050000-559b-cbb8-85aa-2af766e6d93c	2342	Ruše
00050000-559b-cbb8-36e3-ba9f5d58a490	1282	Sava
00050000-559b-cbb8-589c-8a175be73916	6333	Sečovlje/Sicciole
00050000-559b-cbb8-9526-975f149b7760	4227	Selca
00050000-559b-cbb8-093f-70e7db8ff717	2352	Selnica ob Dravi
00050000-559b-cbb8-33a0-b145dc838261	8333	Semič
00050000-559b-cbb8-9532-ecfaba0f309c	8281	Senovo
00050000-559b-cbb8-cfcf-cc9dd4f6b7da	6224	Senožeče
00050000-559b-cbb8-c9b3-66653356eba1	8290	Sevnica
00050000-559b-cbb8-419c-d89122efeaaf	6210	Sežana
00050000-559b-cbb8-bc9c-3e685cf58fbf	2214	Sladki Vrh
00050000-559b-cbb8-9e15-5e63ceae9871	5283	Slap ob Idrijci
00050000-559b-cbb8-e8b2-106899371fb0	2380	Slovenj Gradec
00050000-559b-cbb8-df68-f79f01f0f7ad	2310	Slovenska Bistrica
00050000-559b-cbb8-8bbc-e8b53410942c	3210	Slovenske Konjice
00050000-559b-cbb8-b49c-95d546079115	1216	Smlednik
00050000-559b-cbb8-c3cd-8e470f81dfff	5232	Soča
00050000-559b-cbb8-a745-0569bf2ce1bf	1317	Sodražica
00050000-559b-cbb8-69a1-75ff087d5934	3335	Solčava
00050000-559b-cbb8-bfd7-9215754479a3	5250	Solkan
00050000-559b-cbb8-4042-4a1db5825573	4229	Sorica
00050000-559b-cbb8-ae80-fa67c5e954fd	4225	Sovodenj
00050000-559b-cbb8-33aa-e6f93c83331e	5281	Spodnja Idrija
00050000-559b-cbb8-e7bb-d18c440a4201	2241	Spodnji Duplek
00050000-559b-cbb8-0713-322859d82648	9245	Spodnji Ivanjci
00050000-559b-cbb8-d3d0-b00747d4b69c	2277	Središče ob Dravi
00050000-559b-cbb8-29ea-502effc91e45	4267	Srednja vas v Bohinju
00050000-559b-cbb8-7bbc-b6f275c5112e	8256	Sromlje 
00050000-559b-cbb8-397c-f115828cb74b	5224	Srpenica
00050000-559b-cbb8-f035-03b7b25e3b3b	1242	Stahovica
00050000-559b-cbb8-b606-58dcc5e50a23	1332	Stara Cerkev
00050000-559b-cbb8-66f5-43ae63adb593	8342	Stari trg ob Kolpi
00050000-559b-cbb8-b9f6-e55026605c3a	1386	Stari trg pri Ložu
00050000-559b-cbb8-f316-c81ae9291b0f	2205	Starše
00050000-559b-cbb8-7673-bd2c40fa9275	2289	Stoperce
00050000-559b-cbb8-836f-fb630650def8	8322	Stopiče
00050000-559b-cbb8-81d0-7e70c1794664	3206	Stranice
00050000-559b-cbb8-8e4c-350d110c1f5c	8351	Straža
00050000-559b-cbb8-daab-cc28d134612b	1313	Struge
00050000-559b-cbb8-f1ce-334bd5ae6834	8293	Studenec
00050000-559b-cbb8-3a24-1c7b90cc96b9	8331	Suhor
00050000-559b-cbb8-98a6-15294e07fbcd	2233	Sv. Ana v Slovenskih goricah
00050000-559b-cbb8-6d2a-b61cc4b836f6	2235	Sv. Trojica v Slovenskih goricah
00050000-559b-cbb8-2197-3e817513dc26	2353	Sveti Duh na Ostrem Vrhu
00050000-559b-cbb8-885e-ef6c48c6faa9	9244	Sveti Jurij ob Ščavnici
00050000-559b-cbb8-2d37-ca9bf18b7b39	3264	Sveti Štefan
00050000-559b-cbb8-6cdf-1e79d7143ad8	2258	Sveti Tomaž
00050000-559b-cbb8-5a9f-73eb93f98e05	9204	Šalovci
00050000-559b-cbb8-7154-36f74dc5ff49	5261	Šempas
00050000-559b-cbb8-05a4-73c7896aa5e2	5290	Šempeter pri Gorici
00050000-559b-cbb8-8830-1ef5ac416979	3311	Šempeter v Savinjski dolini
00050000-559b-cbb8-0447-25c3b176fc7d	4208	Šenčur
00050000-559b-cbb8-81dd-6e063e634423	2212	Šentilj v Slovenskih goricah
00050000-559b-cbb8-a09f-deeb05270aab	8297	Šentjanž
00050000-559b-cbb8-fc46-d5f874499eb2	2373	Šentjanž pri Dravogradu
00050000-559b-cbb8-0346-8530ae685bfb	8310	Šentjernej
00050000-559b-cbb8-5881-e453acc8dd96	3230	Šentjur
00050000-559b-cbb8-215b-ac44be72a70b	3271	Šentrupert
00050000-559b-cbb8-749b-7037dd935514	8232	Šentrupert
00050000-559b-cbb8-bc8d-da45febe572d	1296	Šentvid pri Stični
00050000-559b-cbb8-5f4f-3eac414be1f5	8275	Škocjan
00050000-559b-cbb8-d025-75792c00d826	6281	Škofije
00050000-559b-cbb8-2144-95ae10ade7e5	4220	Škofja Loka
00050000-559b-cbb8-0e21-076699634d48	3211	Škofja vas
00050000-559b-cbb8-91eb-186733f7676d	1291	Škofljica
00050000-559b-cbb8-e8fe-c717b6a49980	6274	Šmarje
00050000-559b-cbb8-d6f4-d098730a0d5c	1293	Šmarje - Sap
00050000-559b-cbb8-a74e-c11ecaffddef	3240	Šmarje pri Jelšah
00050000-559b-cbb8-87bb-ab4fdf2aa92c	8220	Šmarješke Toplice
00050000-559b-cbb8-e52f-1170f0f9cb1c	2315	Šmartno na Pohorju
00050000-559b-cbb8-0b93-931cf24ce5e2	3341	Šmartno ob Dreti
00050000-559b-cbb8-bff4-3991461821ee	3327	Šmartno ob Paki
00050000-559b-cbb8-4855-bc5d42f74b77	1275	Šmartno pri Litiji
00050000-559b-cbb8-7bb7-973b01a1a743	2383	Šmartno pri Slovenj Gradcu
00050000-559b-cbb8-e9a8-9417baf6ea88	3201	Šmartno v Rožni dolini
00050000-559b-cbb8-2472-55e1a0a412a7	3325	Šoštanj
00050000-559b-cbb8-3e4c-199a23532ecb	6222	Štanjel
00050000-559b-cbb8-8fb0-f0e095ee102c	3220	Štore
00050000-559b-cbb8-eb89-2ccca5356190	3304	Tabor
00050000-559b-cbb8-b7f3-44ef5b2ec1c7	3221	Teharje
00050000-559b-cbb8-3a80-0573e9ab19a9	9251	Tišina
00050000-559b-cbb8-8ee9-f0a802a57f1b	5220	Tolmin
00050000-559b-cbb8-f892-4523a6828f08	3326	Topolšica
00050000-559b-cbb8-54c0-e5e8dbc40436	2371	Trbonje
00050000-559b-cbb8-9417-eb79c0ef0bc1	1420	Trbovlje
00050000-559b-cbb8-c745-c24489f2aadc	8231	Trebelno 
00050000-559b-cbb8-a3de-bad63d54f08c	8210	Trebnje
00050000-559b-cbb8-b4cb-5fd879770455	5252	Trnovo pri Gorici
00050000-559b-cbb8-c357-67cc26f7f4b1	2254	Trnovska vas
00050000-559b-cbb8-3ed7-3b5604109d0a	1222	Trojane
00050000-559b-cbb8-fa58-8a9e50f4bd94	1236	Trzin
00050000-559b-cbb8-31b3-0d77d71212ac	4290	Tržič
00050000-559b-cbb8-043c-c22a21854613	8295	Tržišče
00050000-559b-cbb8-c2e4-a080bc9d968d	1311	Turjak
00050000-559b-cbb8-c544-24f865924464	9224	Turnišče
00050000-559b-cbb8-6ad9-1950b195ff0f	8323	Uršna sela
00050000-559b-cbb8-2892-0ed043e73c10	1252	Vače
00050000-559b-cbb8-acbe-e72e5f77f4f7	3320	Velenje 
00050000-559b-cbb8-0358-8aaf59cb479d	3322	Velenje - poštni predali
00050000-559b-cbb8-044e-f1878763bd19	8212	Velika Loka
00050000-559b-cbb8-790f-35cac46a06c9	2274	Velika Nedelja
00050000-559b-cbb8-07e3-416303f44a63	9225	Velika Polana
00050000-559b-cbb8-405e-b17a9ac84b41	1315	Velike Lašče
00050000-559b-cbb8-5086-d6621915abda	8213	Veliki Gaber
00050000-559b-cbb8-630e-d3f3276453be	9241	Veržej
00050000-559b-cbb8-621f-52c4d920bc10	1312	Videm - Dobrepolje
00050000-559b-cbb8-0689-ded9e5dccbd1	2284	Videm pri Ptuju
00050000-559b-cbb8-3a15-4c15c0918bc9	8344	Vinica
00050000-559b-cbb8-c925-f195a55d1fce	5271	Vipava
00050000-559b-cbb8-8450-f7f98f7468c9	4212	Visoko
00050000-559b-cbb8-9342-f8f5a22e56e3	1294	Višnja Gora
00050000-559b-cbb8-8384-8a5eb5735e61	3205	Vitanje
00050000-559b-cbb8-c023-32eae4a1e736	2255	Vitomarci
00050000-559b-cbb8-3fbe-0300cbe392d6	1217	Vodice
00050000-559b-cbb8-86ed-a730d076b8a9	3212	Vojnik\t
00050000-559b-cbb8-70c6-50b950e7a692	5293	Volčja Draga
00050000-559b-cbb8-5d9d-328b8a8a3b25	2232	Voličina
00050000-559b-cbb8-c8a6-e80fb495e4ec	3305	Vransko
00050000-559b-cbb8-be20-6862b790e867	6217	Vremski Britof
00050000-559b-cbb8-e19e-dc2eea53c657	1360	Vrhnika
00050000-559b-cbb8-1561-021a623d394c	2365	Vuhred
00050000-559b-cbb8-30fc-68394fbc9852	2367	Vuzenica
00050000-559b-cbb8-03bb-a772122bd336	8292	Zabukovje 
00050000-559b-cbb8-0dd9-c1fcec8a1d89	1410	Zagorje ob Savi
00050000-559b-cbb8-9829-bb5437b21fa1	1303	Zagradec
00050000-559b-cbb8-7e63-f75384eac83d	2283	Zavrč
00050000-559b-cbb8-bedc-831c0478acf3	8272	Zdole 
00050000-559b-cbb8-5b86-92e03cee8bcc	4201	Zgornja Besnica
00050000-559b-cbb8-3f57-52d7a278bc3f	2242	Zgornja Korena
00050000-559b-cbb8-6e30-7a3cd612717a	2201	Zgornja Kungota
00050000-559b-cbb8-6eaa-a2904a9d5c24	2316	Zgornja Ložnica
00050000-559b-cbb8-d374-9c2d2b9857be	2314	Zgornja Polskava
00050000-559b-cbb8-e338-c97166476fb7	2213	Zgornja Velka
00050000-559b-cbb8-7788-b23690a0d5f1	4247	Zgornje Gorje
00050000-559b-cbb8-d2dc-a375a534b18d	4206	Zgornje Jezersko
00050000-559b-cbb8-cdf5-dd19821af20c	2285	Zgornji Leskovec
00050000-559b-cbb8-7ca6-12b73b9ea80c	1432	Zidani Most
00050000-559b-cbb8-437e-df7434b51da8	3214	Zreče
00050000-559b-cbb8-ba86-826ddf6ae348	4209	Žabnica
00050000-559b-cbb8-3931-391842769886	3310	Žalec
00050000-559b-cbb8-5f71-36ade2f540fa	4228	Železniki
00050000-559b-cbb8-9412-9be47c06bea2	2287	Žetale
00050000-559b-cbb8-aab3-b870ca299afe	4226	Žiri
00050000-559b-cbb8-5084-7760565b5800	4274	Žirovnica
00050000-559b-cbb8-fc56-b77532edfd05	8360	Žužemberk
\.


--
-- TOC entry 2881 (class 0 OID 9340719)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 9340530)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 9340608)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 9340731)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 9341038)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 9341049)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-559b-cbb9-6985-5bd374aab44d	00080000-559b-cbb9-3d64-35f85770b731	0900	AK
00190000-559b-cbb9-d0dc-b08fbb3dcfdb	00080000-559b-cbb9-a1b5-27937018ca19	0987	A
00190000-559b-cbb9-99ef-edaf44ba1459	00080000-559b-cbb9-9a87-1c0d2297fb8d	0989	A
00190000-559b-cbb9-571e-9204f79310ea	00080000-559b-cbb9-f1ad-ca6597693c75	0986	A
00190000-559b-cbb9-c64c-45838484990b	00080000-559b-cbb9-d334-f407e6a467d2	0984	A
00190000-559b-cbb9-ccd1-0f0191de99e5	00080000-559b-cbb9-cd62-3194633956dd	0983	A
00190000-559b-cbb9-4ae2-cf29cc103116	00080000-559b-cbb9-2f9a-ee1d59095e63	0982	A
\.


--
-- TOC entry 2905 (class 0 OID 9341019)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint, sredstvaavt) FROM stdin;
00290000-559b-cbb9-422e-8c057bc01d3c	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2850 (class 0 OID 7936450)
-- Dependencies: 175
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 9340760)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-559b-cbb9-2b74-2169e3214d40	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-559b-cbb9-fb9d-6a00e689f8e1	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-559b-cbb9-51cf-966417aea967	0003	Kazinska	t	84	Kazinska dvorana
00220000-559b-cbb9-4c54-5f4e00125c11	0004	Mali oder	t	24	Mali oder 
00220000-559b-cbb9-3d2d-ea57f69c3524	0005	Komorni oder	t	15	Komorni oder
00220000-559b-cbb9-4520-b4b871e11356	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-559b-cbb9-17ea-b45f02242851	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2879 (class 0 OID 9340704)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 9340694)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 9340878)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2894 (class 0 OID 9340828)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 9340402)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2888 (class 0 OID 9340770)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 9340440)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-559b-cbb7-95cf-e2214a0ece1b	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-559b-cbb7-72d3-1d147cd8bf6b	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-559b-cbb7-bfcb-9556a56b7555	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-559b-cbb7-6f8e-6107c5fe5699	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-559b-cbb7-f6b0-21d1fad6719b	planer	Planer dogodkov v koledarju	t
00020000-559b-cbb7-a5de-eec8d36eabb1	kadrovska	Kadrovska služba	t
00020000-559b-cbb7-1579-954d40a453ff	arhivar	Ažuriranje arhivalij	t
00020000-559b-cbb7-28a8-525e39781e3a	igralec	Igralec	t
00020000-559b-cbb7-a648-6512bf5ceda4	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-559b-cbb9-70df-1065606a5937	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2854 (class 0 OID 9340424)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-559b-cbb8-fde1-429d2151a236	00020000-559b-cbb7-bfcb-9556a56b7555
00010000-559b-cbb8-e11d-1dbeb5b19687	00020000-559b-cbb7-bfcb-9556a56b7555
00010000-559b-cbb9-f406-b348befe6264	00020000-559b-cbb9-70df-1065606a5937
\.


--
-- TOC entry 2890 (class 0 OID 9340784)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 9340725)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 9340675)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2912 (class 0 OID 9341088)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-559b-cbb8-0b49-c9ad6005f99c	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-559b-cbb8-f0af-2db52bb5a80c	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-559b-cbb8-467e-fb7c8cc09ff9	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-559b-cbb8-1d89-1cee78b6fda5	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-559b-cbb8-260e-b37f601a0028	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2911 (class 0 OID 9341080)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-559b-cbb8-f888-b91bb70c4d9e	00230000-559b-cbb8-1d89-1cee78b6fda5	popa
00240000-559b-cbb8-e0f6-94effc9963de	00230000-559b-cbb8-1d89-1cee78b6fda5	oseba
00240000-559b-cbb8-73ae-809936b6c84f	00230000-559b-cbb8-f0af-2db52bb5a80c	prostor
00240000-559b-cbb8-7bb6-5f6738b6a361	00230000-559b-cbb8-1d89-1cee78b6fda5	besedilo
00240000-559b-cbb8-ce7d-a94ee62ad573	00230000-559b-cbb8-1d89-1cee78b6fda5	uprizoritev
00240000-559b-cbb8-cff9-19b882f2d33b	00230000-559b-cbb8-1d89-1cee78b6fda5	funkcija
00240000-559b-cbb8-6407-02f0286478e2	00230000-559b-cbb8-1d89-1cee78b6fda5	tipfunkcije
00240000-559b-cbb8-9dad-b1e1b39c88c1	00230000-559b-cbb8-1d89-1cee78b6fda5	alternacija
00240000-559b-cbb8-1d56-e3ca488c2a91	00230000-559b-cbb8-0b49-c9ad6005f99c	pogodba
00240000-559b-cbb8-946c-edf9d24cfb2a	00230000-559b-cbb8-1d89-1cee78b6fda5	zaposlitev
00240000-559b-cbb8-f790-269136c0e250	00230000-559b-cbb8-0b49-c9ad6005f99c	programdela
\.


--
-- TOC entry 2910 (class 0 OID 9341075)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 9340838)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-559b-cbb9-86cc-8855c0f9ff59	000e0000-559b-cbb9-3201-4e1924f57c95	00080000-559b-cbb9-46fa-d9fda02cd45b	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-559b-cbb9-ae95-54d57b60cde4	000e0000-559b-cbb9-3201-4e1924f57c95	00080000-559b-cbb9-46fa-d9fda02cd45b	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-559b-cbb9-ed1e-c89744e4528a	000e0000-559b-cbb9-3201-4e1924f57c95	00080000-559b-cbb9-7b21-938d19d4ae65	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2861 (class 0 OID 9340502)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 9340681)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-559b-cbb9-1181-c44f115794d4	00180000-559b-cbb9-07ff-4c9784e5c0fb	000c0000-559b-cbb9-4a79-42d4bc119954	00090000-559b-cbb9-de3b-4c93863d8451	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559b-cbb9-768a-044cad29c3aa	00180000-559b-cbb9-07ff-4c9784e5c0fb	000c0000-559b-cbb9-0df6-e05587de50e4	00090000-559b-cbb9-0219-be68f4985211	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559b-cbb9-385a-c5c4d1cd2d2e	00180000-559b-cbb9-07ff-4c9784e5c0fb	000c0000-559b-cbb9-f5fd-23ce9e88a8bd	00090000-559b-cbb9-a1ea-693d42be52ad	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559b-cbb9-f660-cb4053cc006f	00180000-559b-cbb9-07ff-4c9784e5c0fb	000c0000-559b-cbb9-3381-071821b93aea	00090000-559b-cbb9-afa5-0da50e27a44a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559b-cbb9-3089-0bfef9c2d80d	00180000-559b-cbb9-07ff-4c9784e5c0fb	000c0000-559b-cbb9-80b6-7027a08c18dd	00090000-559b-cbb9-329a-04b311f9fb1c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559b-cbb9-1ca1-8f0913a4e6ef	00180000-559b-cbb9-8c7c-0e386fe88b89	\N	00090000-559b-cbb9-329a-04b311f9fb1c	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2897 (class 0 OID 9340867)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-559b-cbb8-8c4b-6b5953d22bb3	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-559b-cbb8-85c0-2856aa632d17	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-559b-cbb8-9ffd-cf0a27bbd47f	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-559b-cbb8-6d9e-c39392e259b0	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-559b-cbb8-d363-3e493f40cb29	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-559b-cbb8-4009-b1ecb75c5714	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-559b-cbb8-cda2-8dc3c14291d9	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-559b-cbb8-5056-966b5484684b	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-559b-cbb8-0ce3-6ade92ed5f14	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-559b-cbb8-f09c-35850e3d31bf	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-559b-cbb8-126c-a1d57b9f8de6	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-559b-cbb8-9913-961b749061e6	Lektor	Lektorji	t	Lektorica	umetnik
000f0000-559b-cbb8-55b0-1ee5028a4d86	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-559b-cbb8-1ea9-32466333ca6a	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-559b-cbb8-73b4-29fa0d1bbfae	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-559b-cbb8-f7d9-4c2acf7fa903	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2908 (class 0 OID 9341057)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-559b-cbb8-6bb4-665ed7bdee4a	01	Velika predstava	f	1.00	1.00
002b0000-559b-cbb8-dd28-53460e14d299	02	Mala predstava	f	0.50	0.50
002b0000-559b-cbb8-dfb5-6b9c4bc54fb5	03	Mala koprodukcija	t	0.40	1.00
002b0000-559b-cbb8-627c-e3e959fd7ca5	04	Srednja koprodukcija	t	0.70	2.00
002b0000-559b-cbb8-1506-056daca33748	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2866 (class 0 OID 9340565)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 9340411)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-559b-cbb8-e11d-1dbeb5b19687	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROf9Xpi8w1wRL6w55asiZ95N2.8MztTzK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-559b-cbb9-3873-8cb4eb3d6d3a	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-559b-cbb9-e517-ddfa0204913a	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-559b-cbb9-497a-950848906186	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-559b-cbb9-4b14-65b45a1543e2	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-559b-cbb9-b2e6-5ee35e405619	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-559b-cbb9-73f5-864b5004f63c	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-559b-cbb9-fff0-d8ca27686f2d	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-559b-cbb9-384c-d965bdd2d708	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-559b-cbb9-01c1-b4fb415fec5d	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-559b-cbb9-f406-b348befe6264	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-559b-cbb8-fde1-429d2151a236	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2901 (class 0 OID 9340916)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-559b-cbb9-0065-4409259affe8	00160000-559b-cbb9-5c95-794c7343623b	00150000-559b-cbb8-fc9b-e8a3c9d06e70	00140000-559b-cbb7-84a0-87866529d71d	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-559b-cbb9-3d2d-ea57f69c3524
000e0000-559b-cbb9-3201-4e1924f57c95	00160000-559b-cbb9-ea3e-c606c037769a	00150000-559b-cbb8-7edf-a322d46c3688	00140000-559b-cbb7-e451-3c20794230d8	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-559b-cbb9-4520-b4b871e11356
000e0000-559b-cbb9-db14-d183c97d17bd	\N	00150000-559b-cbb8-7edf-a322d46c3688	00140000-559b-cbb7-e451-3c20794230d8	00190000-559b-cbb9-d0dc-b08fbb3dcfdb	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-559b-cbb9-3d2d-ea57f69c3524
000e0000-559b-cbb9-c55a-31cdb17fb57a	\N	00150000-559b-cbb8-7edf-a322d46c3688	00140000-559b-cbb7-e451-3c20794230d8	00190000-559b-cbb9-d0dc-b08fbb3dcfdb	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-559b-cbb9-3d2d-ea57f69c3524
000e0000-559b-cbb9-8c40-5ce82a0747f0	\N	00150000-559b-cbb8-7edf-a322d46c3688	00140000-559b-cbb7-e451-3c20794230d8	00190000-559b-cbb9-d0dc-b08fbb3dcfdb	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-559b-cbb9-2b74-2169e3214d40
\.


--
-- TOC entry 2871 (class 0 OID 9340627)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-559b-cbb9-2e87-033ae0e789a3	000e0000-559b-cbb9-3201-4e1924f57c95	1	
00200000-559b-cbb9-a811-e3d5e8232764	000e0000-559b-cbb9-3201-4e1924f57c95	2	
\.


--
-- TOC entry 2886 (class 0 OID 9340752)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 9340821)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 9340659)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 9340906)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-559b-cbb7-84a0-87866529d71d	01	Drama	drama (SURS 01)
00140000-559b-cbb7-e47a-66f0f07a9b5f	02	Opera	opera (SURS 02)
00140000-559b-cbb7-db0c-c181c1bd87c8	03	Balet	balet (SURS 03)
00140000-559b-cbb7-8a34-499d5950f6b6	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-559b-cbb7-a3a4-7ebc62d43150	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-559b-cbb7-e451-3c20794230d8	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-559b-cbb7-db30-df312f1a842f	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2892 (class 0 OID 9340811)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-559b-cbb8-bb86-b28c7a6ce1a1	01	Opera	opera
00150000-559b-cbb8-2c04-6a6126e46774	02	Opereta	opereta
00150000-559b-cbb8-b74a-121012934cd0	03	Balet	balet
00150000-559b-cbb8-9a0d-23c68f7f4562	04	Plesne prireditve	plesne prireditve
00150000-559b-cbb8-3923-7dc508217114	05	Lutkovno gledališče	lutkovno gledališče
00150000-559b-cbb8-c390-d27a3329b78a	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-559b-cbb8-b172-3f5b5305a8a1	07	Biografska drama	biografska drama
00150000-559b-cbb8-fc9b-e8a3c9d06e70	08	Komedija	komedija
00150000-559b-cbb8-904f-78b66484020d	09	Črna komedija	črna komedija
00150000-559b-cbb8-7efc-9a53ca32de28	10	E-igra	E-igra
00150000-559b-cbb8-7edf-a322d46c3688	11	Kriminalka	kriminalka
00150000-559b-cbb8-c9dc-b49729baed7a	12	Musical	musical
\.


--
-- TOC entry 2445 (class 2606 OID 9340465)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 9340963)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 9340953)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 9340866)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 9340649)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 9340674)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 9341073)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 9340591)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 9341014)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 9340807)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 9340625)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 9340668)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 9340605)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 9340717)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 9340744)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 9340563)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 9340474)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2452 (class 2606 OID 9340498)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 9340454)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2436 (class 2606 OID 9340439)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 9340750)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 9340783)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 9340901)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 9340527)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 9340551)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 9340723)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 9340541)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 9340612)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 9340735)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 9341046)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 9341054)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 9341036)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 7936468)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 7924222)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 9340767)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 9340708)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 9340699)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 9340888)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 9340835)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 9340410)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 9340774)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 9340428)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2438 (class 2606 OID 9340448)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 9340792)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 9340730)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 9340680)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 9341097)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 9341085)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 9341079)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 9340848)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 9340507)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 9340690)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 9340877)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 9341067)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 9340576)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 9340423)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 9340932)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 9340634)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 9340758)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 9340826)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 9340663)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 9340914)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 9340819)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 1259 OID 9340656)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2585 (class 1259 OID 9340849)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2586 (class 1259 OID 9340850)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2459 (class 1259 OID 9340529)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2406 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2407 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2408 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2550 (class 1259 OID 9340751)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2544 (class 1259 OID 9340737)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2545 (class 1259 OID 9340736)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2496 (class 1259 OID 9340635)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2572 (class 1259 OID 9340808)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2573 (class 1259 OID 9340810)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2574 (class 1259 OID 9340809)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2484 (class 1259 OID 9340607)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2485 (class 1259 OID 9340606)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2595 (class 1259 OID 9340903)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2596 (class 1259 OID 9340904)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 9340905)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2420 (class 1259 OID 7924224)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2421 (class 1259 OID 7924223)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2604 (class 1259 OID 9340937)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2605 (class 1259 OID 9340934)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2606 (class 1259 OID 9340938)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2607 (class 1259 OID 9340936)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2608 (class 1259 OID 9340935)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2474 (class 1259 OID 9340578)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2475 (class 1259 OID 9340577)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2411 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2412 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2450 (class 1259 OID 9340501)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2560 (class 1259 OID 9340775)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2514 (class 1259 OID 9340669)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 9340455)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2441 (class 1259 OID 9340456)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2565 (class 1259 OID 9340795)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2566 (class 1259 OID 9340794)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2567 (class 1259 OID 9340793)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2488 (class 1259 OID 9340613)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2489 (class 1259 OID 9340615)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2490 (class 1259 OID 9340614)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2647 (class 1259 OID 9341087)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2524 (class 1259 OID 9340703)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2525 (class 1259 OID 9340701)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2526 (class 1259 OID 9340700)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2527 (class 1259 OID 9340702)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2431 (class 1259 OID 9340429)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2432 (class 1259 OID 9340430)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2553 (class 1259 OID 9340759)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2539 (class 1259 OID 9340724)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2581 (class 1259 OID 9340836)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2582 (class 1259 OID 9340837)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2625 (class 1259 OID 9341018)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2626 (class 1259 OID 9341015)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2627 (class 1259 OID 9341016)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2628 (class 1259 OID 9341017)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2463 (class 1259 OID 9340543)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2464 (class 1259 OID 9340542)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2465 (class 1259 OID 9340544)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2424 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2632 (class 1259 OID 9341047)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2633 (class 1259 OID 9341048)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2618 (class 1259 OID 9340967)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2619 (class 1259 OID 9340968)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2620 (class 1259 OID 9340965)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2621 (class 1259 OID 9340966)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2578 (class 1259 OID 9340827)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2530 (class 1259 OID 9340712)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2531 (class 1259 OID 9340711)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2532 (class 1259 OID 9340709)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2533 (class 1259 OID 9340710)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2402 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2614 (class 1259 OID 9340955)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2615 (class 1259 OID 9340954)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2629 (class 1259 OID 9341037)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2495 (class 1259 OID 9340626)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2644 (class 1259 OID 9341074)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2446 (class 1259 OID 9340476)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2447 (class 1259 OID 9340475)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2455 (class 1259 OID 9340508)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2456 (class 1259 OID 9340509)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2519 (class 1259 OID 9340693)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 9340692)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2521 (class 1259 OID 9340691)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2415 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2416 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2417 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2502 (class 1259 OID 9340658)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2503 (class 1259 OID 9340654)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2504 (class 1259 OID 9340651)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2505 (class 1259 OID 9340652)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2506 (class 1259 OID 9340650)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2507 (class 1259 OID 9340655)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2508 (class 1259 OID 9340653)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2462 (class 1259 OID 9340528)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2480 (class 1259 OID 9340592)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 9340594)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2482 (class 1259 OID 9340593)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2483 (class 1259 OID 9340595)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2538 (class 1259 OID 9340718)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2600 (class 1259 OID 9340902)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2609 (class 1259 OID 9340933)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2453 (class 1259 OID 9340499)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2454 (class 1259 OID 9340500)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 9340820)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2653 (class 1259 OID 9341098)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2473 (class 1259 OID 9340564)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 9341086)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2558 (class 1259 OID 9340769)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2559 (class 1259 OID 9340768)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 9340964)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2405 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2470 (class 1259 OID 9340552)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 9340915)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2638 (class 1259 OID 9341055)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2639 (class 1259 OID 9341056)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2439 (class 1259 OID 9340449)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2509 (class 1259 OID 9340657)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2679 (class 2606 OID 9341234)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2682 (class 2606 OID 9341219)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2681 (class 2606 OID 9341224)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2677 (class 2606 OID 9341244)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2683 (class 2606 OID 9341214)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2678 (class 2606 OID 9341239)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2680 (class 2606 OID 9341229)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2713 (class 2606 OID 9341389)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2712 (class 2606 OID 9341394)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2664 (class 2606 OID 9341149)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2700 (class 2606 OID 9341329)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2698 (class 2606 OID 9341324)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2699 (class 2606 OID 9341319)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2676 (class 2606 OID 9341209)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 9341359)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2706 (class 2606 OID 9341369)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2707 (class 2606 OID 9341364)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2670 (class 2606 OID 9341184)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2671 (class 2606 OID 9341179)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2696 (class 2606 OID 9341309)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2716 (class 2606 OID 9341399)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2715 (class 2606 OID 9341404)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2714 (class 2606 OID 9341409)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2718 (class 2606 OID 9341429)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2721 (class 2606 OID 9341414)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2717 (class 2606 OID 9341434)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2719 (class 2606 OID 9341424)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2720 (class 2606 OID 9341419)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2668 (class 2606 OID 9341174)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2669 (class 2606 OID 9341169)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 9341134)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2661 (class 2606 OID 9341129)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2702 (class 2606 OID 9341339)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2684 (class 2606 OID 9341249)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2657 (class 2606 OID 9341109)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2656 (class 2606 OID 9341114)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2703 (class 2606 OID 9341354)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2704 (class 2606 OID 9341349)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2705 (class 2606 OID 9341344)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2674 (class 2606 OID 9341189)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2672 (class 2606 OID 9341199)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2673 (class 2606 OID 9341194)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2737 (class 2606 OID 9341514)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2688 (class 2606 OID 9341284)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2690 (class 2606 OID 9341274)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2691 (class 2606 OID 9341269)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2689 (class 2606 OID 9341279)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2655 (class 2606 OID 9341099)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2654 (class 2606 OID 9341104)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2701 (class 2606 OID 9341334)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2697 (class 2606 OID 9341314)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2711 (class 2606 OID 9341379)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2710 (class 2606 OID 9341384)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2728 (class 2606 OID 9341484)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2731 (class 2606 OID 9341469)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2730 (class 2606 OID 9341474)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2729 (class 2606 OID 9341479)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2666 (class 2606 OID 9341159)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 9341154)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2665 (class 2606 OID 9341164)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2734 (class 2606 OID 9341494)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2733 (class 2606 OID 9341499)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2725 (class 2606 OID 9341459)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2724 (class 2606 OID 9341464)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2727 (class 2606 OID 9341449)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2726 (class 2606 OID 9341454)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2709 (class 2606 OID 9341374)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2692 (class 2606 OID 9341304)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2693 (class 2606 OID 9341299)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2695 (class 2606 OID 9341289)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2694 (class 2606 OID 9341294)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2722 (class 2606 OID 9341444)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2723 (class 2606 OID 9341439)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2732 (class 2606 OID 9341489)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2675 (class 2606 OID 9341204)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2735 (class 2606 OID 9341504)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2736 (class 2606 OID 9341509)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2658 (class 2606 OID 9341124)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2659 (class 2606 OID 9341119)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2663 (class 2606 OID 9341139)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2662 (class 2606 OID 9341144)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2685 (class 2606 OID 9341264)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2686 (class 2606 OID 9341259)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2687 (class 2606 OID 9341254)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-07 14:53:14 CEST

--
-- PostgreSQL database dump complete
--

