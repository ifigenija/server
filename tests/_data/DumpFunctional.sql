--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-07-17 13:06:09 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 239 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2926 (class 0 OID 0)
-- Dependencies: 239
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 10552454)
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
-- TOC entry 228 (class 1259 OID 10552953)
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
-- TOC entry 227 (class 1259 OID 10552936)
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
-- TOC entry 221 (class 1259 OID 10552848)
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
    letoizida integer,
    krajizida character varying(255) DEFAULT NULL::character varying,
    zaloznik character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 10552633)
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
-- TOC entry 200 (class 1259 OID 10552667)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 10553070)
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
-- TOC entry 192 (class 1259 OID 10552576)
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
-- TOC entry 229 (class 1259 OID 10552966)
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
    zaprosenprocent numeric(6,2) DEFAULT NULL::numeric,
    zaproseno numeric(15,2) DEFAULT 0::numeric NOT NULL,
    lastnasredstva numeric(15,2) DEFAULT 0::numeric NOT NULL,
    avtorskihonorarji numeric(15,2) DEFAULT 0::numeric NOT NULL,
    tantieme numeric(15,2) DEFAULT 0::numeric NOT NULL,
    vlozekgostitelja numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugijavni numeric(15,2) DEFAULT 0::numeric NOT NULL,
    stzaposlenih integer DEFAULT 0 NOT NULL,
    stzaposumet integer DEFAULT 0 NOT NULL,
    stzaposdrug integer DEFAULT 0 NOT NULL,
    sthonorarnih integer,
    sthonorarnihigr integer,
    sthonorarnihigrtujjz integer,
    sthonorarnihigrsamoz integer,
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
    drzavagostovanja_id uuid,
    stpe integer DEFAULT 0,
    zvrst character varying(255) DEFAULT NULL::character varying,
    stpredstav integer,
    stokroglihmiz integer,
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
-- TOC entry 216 (class 1259 OID 10552793)
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
-- TOC entry 195 (class 1259 OID 10552613)
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
-- TOC entry 199 (class 1259 OID 10552661)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 10552593)
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
-- TOC entry 205 (class 1259 OID 10552710)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 10552735)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 10552550)
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
-- TOC entry 184 (class 1259 OID 10552463)
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
-- TOC entry 185 (class 1259 OID 10552474)
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
-- TOC entry 180 (class 1259 OID 10552428)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 10552447)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 10552742)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 10552773)
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
-- TOC entry 224 (class 1259 OID 10552887)
-- Name: pogodba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pogodba (
    id uuid NOT NULL,
    oseba_id uuid,
    popa_id uuid,
    trr_id uuid,
    sifra character varying(7) NOT NULL,
    zacetek date,
    konec date,
    placilonavajo boolean,
    vrednostvaje numeric(12,2) DEFAULT NULL::numeric,
    planiranostevilovaj integer,
    vrednostvaj numeric(12,2) DEFAULT NULL::numeric,
    vrednostpredstave numeric(12,2) DEFAULT NULL::numeric,
    vrednostdopremiere numeric(12,2) DEFAULT NULL::numeric,
    aktivna boolean,
    zaposlenvdrjz boolean,
    samozaposlen boolean,
    igralec boolean,
    opis text
);


--
-- TOC entry 187 (class 1259 OID 10552507)
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
-- TOC entry 189 (class 1259 OID 10552542)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 10552716)
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
-- TOC entry 188 (class 1259 OID 10552527)
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
-- TOC entry 194 (class 1259 OID 10552605)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 10552728)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 10553030)
-- Name: produkcijadelitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijadelitev (
    id uuid NOT NULL,
    koproducent_id uuid NOT NULL,
    odstotekfinanciranja numeric(15,2) DEFAULT NULL::numeric,
    delez numeric(15,2) DEFAULT NULL::numeric,
    zaprosenprocent numeric(6,2) DEFAULT NULL::numeric,
    zaproseno numeric(15,2) DEFAULT NULL::numeric,
    maticnikop boolean NOT NULL,
    enotaprograma_id uuid
);


--
-- TOC entry 232 (class 1259 OID 10553041)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 10553011)
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
    sthonorarnihigrsamoz integer,
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
-- TOC entry 233 (class 1259 OID 10553049)
-- Name: programskaenotasklopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programskaenotasklopa (
    id uuid NOT NULL,
    naslovpe character varying(255) NOT NULL,
    avtorpe character varying(255) NOT NULL,
    obsegpe character varying(255) NOT NULL,
    mesecpe character varying(255) NOT NULL,
    vrednostpe numeric(15,2) DEFAULT 0::numeric NOT NULL,
    programrazno_id uuid
);


--
-- TOC entry 212 (class 1259 OID 10552757)
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
-- TOC entry 204 (class 1259 OID 10552701)
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
-- TOC entry 203 (class 1259 OID 10552691)
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
-- TOC entry 223 (class 1259 OID 10552876)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 10552825)
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
-- TOC entry 177 (class 1259 OID 10552399)
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
-- TOC entry 176 (class 1259 OID 10552397)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2927 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 10552767)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 10552437)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 10552421)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 10552781)
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
-- TOC entry 207 (class 1259 OID 10552722)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 10552672)
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
-- TOC entry 238 (class 1259 OID 10553090)
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
-- TOC entry 237 (class 1259 OID 10553082)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 10553077)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 10552835)
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
-- TOC entry 186 (class 1259 OID 10552499)
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
-- TOC entry 202 (class 1259 OID 10552678)
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
    planiranotraja numeric(15,2) DEFAULT NULL::numeric
);


--
-- TOC entry 222 (class 1259 OID 10552865)
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
-- TOC entry 234 (class 1259 OID 10553059)
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
-- TOC entry 191 (class 1259 OID 10552562)
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
-- TOC entry 178 (class 1259 OID 10552408)
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
-- TOC entry 226 (class 1259 OID 10552913)
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
-- TOC entry 196 (class 1259 OID 10552624)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 10552749)
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
-- TOC entry 218 (class 1259 OID 10552818)
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
-- TOC entry 198 (class 1259 OID 10552656)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 10552903)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 10552808)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2213 (class 2604 OID 10552402)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2864 (class 0 OID 10552454)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 10552953)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55a8-e1a1-4ef5-7c78fb761fd7	000d0000-55a8-e1a1-6626-1f5b8991c23e	\N	00090000-55a8-e1a1-93c1-c00f69f074f0	000b0000-55a8-e1a1-4e64-57c9be223a0e	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55a8-e1a1-47d2-3c2cc9b24944	000d0000-55a8-e1a1-65c6-94758551ac12	00100000-55a8-e1a1-ed70-152288342273	00090000-55a8-e1a1-04b8-00b2f8a209d6	\N	0002	t	\N	\N	\N	8	\N	\N	f	f
000c0000-55a8-e1a1-3457-9f9ba70ee18d	000d0000-55a8-e1a1-6e1f-b8a39b5fce0b	00100000-55a8-e1a1-f2b7-2bfcd9d92d82	00090000-55a8-e1a1-d0d9-6f756f0c33eb	\N	0003	t	\N	\N	\N	2	\N	\N	f	f
000c0000-55a8-e1a1-083c-2773ff5f2301	000d0000-55a8-e1a1-fae6-869d2b481bf8	\N	00090000-55a8-e1a1-26ee-0aa888b2b942	\N	0004	f	\N	\N	\N	26	\N	\N	f	f
000c0000-55a8-e1a1-c674-df1451528380	000d0000-55a8-e1a1-82c9-25fa0800f089	\N	00090000-55a8-e1a1-2679-9f6461a7ec97	\N	0005	f	\N	\N	\N	7	\N	\N	f	f
000c0000-55a8-e1a1-6fce-18b24eb40f33	000d0000-55a8-e1a1-b8eb-10efdec01d06	\N	00090000-55a8-e1a1-6874-9789147d1bc1	000b0000-55a8-e1a1-54c2-c3d0cfb1db91	0006	f	\N	\N	\N	1	\N	\N	t	t
000c0000-55a8-e1a1-4c26-142993a59723	000d0000-55a8-e1a1-a2de-5359e6b6571e	00100000-55a8-e1a1-c970-9d0af92b1d79	00090000-55a8-e1a1-cfd6-773cc458bf47	\N	0007	t	\N	\N	\N	14	\N	\N	f	t
000c0000-55a8-e1a1-8ac1-555f002cebdd	000d0000-55a8-e1a1-0d18-1e01225e3c9c	\N	00090000-55a8-e1a1-f51e-acf95d3e88b1	000b0000-55a8-e1a1-14dd-ed44ea9a0dbb	0008	f	\N	\N	\N	12	\N	\N	t	t
\.


--
-- TOC entry 2908 (class 0 OID 10552936)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 10552848)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55a8-e1a0-a726-d1871ad6223a	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55a8-e1a0-b8d0-ce4cc1381d53	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55a8-e1a0-c2ec-ecf65c274680	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2878 (class 0 OID 10552633)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55a8-e1a1-e95b-a6edabeadc0c	\N	\N	00200000-55a8-e1a1-d762-1c005401a89f	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55a8-e1a1-240f-d56d095d2c34	\N	\N	00200000-55a8-e1a1-78d5-705e48ccc3cc	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55a8-e1a1-bcec-cd72432456b1	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55a8-e1a1-4720-df516171e4b7	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55a8-e1a1-5689-eb5dec7829db	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2881 (class 0 OID 10552667)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 10553070)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 10552576)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55a8-e19f-6904-842ef551ff95	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55a8-e19f-fe2c-50f4532429bb	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55a8-e19f-6d4b-bd0a92a20b9b	AL	ALB	008	Albania 	Albanija	\N
00040000-55a8-e19f-ea8a-31ae1467c465	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55a8-e19f-eab2-c076ae6c3af1	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55a8-e19f-552d-6d7b6f3df99a	AD	AND	020	Andorra 	Andora	\N
00040000-55a8-e19f-6685-7cb2a264f1fd	AO	AGO	024	Angola 	Angola	\N
00040000-55a8-e19f-626f-ded5d08e61f9	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55a8-e19f-5aba-b75a8acfb64d	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55a8-e19f-02c9-2520efecdcb9	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55a8-e19f-3848-e1b28c98aa7d	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55a8-e19f-7103-ef830ca54e33	AM	ARM	051	Armenia 	Armenija	\N
00040000-55a8-e19f-d9b0-69c959a81df4	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55a8-e19f-b9a7-8984d7733252	AU	AUS	036	Australia 	Avstralija	\N
00040000-55a8-e19f-a04e-3fef41c0b0ed	AT	AUT	040	Austria 	Avstrija	\N
00040000-55a8-e19f-a6d5-714fe5440d74	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55a8-e19f-bf0f-bb3a5c297c76	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55a8-e19f-fd90-0466e961e9ef	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55a8-e19f-a067-c8bdeff6b688	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55a8-e19f-3abd-8ff04432a94c	BB	BRB	052	Barbados 	Barbados	\N
00040000-55a8-e19f-1ff5-28168785f1e3	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55a8-e19f-c1e1-223ed5a5dc50	BE	BEL	056	Belgium 	Belgija	\N
00040000-55a8-e19f-2b77-84c2fb234a0c	BZ	BLZ	084	Belize 	Belize	\N
00040000-55a8-e19f-f96b-47349104cc6b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55a8-e19f-f7ad-f493a6a88cd3	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55a8-e19f-8a6c-813d624fcb94	BT	BTN	064	Bhutan 	Butan	\N
00040000-55a8-e19f-dce5-0695cd2188ec	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55a8-e19f-b0e8-a278fef19f03	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55a8-e19f-9ecf-656ac974f3bb	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55a8-e19f-0035-57eae5e5dec0	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55a8-e19f-bb71-cefe31788521	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55a8-e19f-d825-71d5de125ab9	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55a8-e19f-56bc-4fa9d470a307	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55a8-e19f-88cc-5e97db60da96	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55a8-e19f-eb84-04956fe00589	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55a8-e19f-f672-e9e4675a2faa	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55a8-e19f-5686-c1de49af664f	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55a8-e19f-bdd0-c68de870945e	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55a8-e19f-f92f-ee37b932eb09	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55a8-e19f-b826-234db11578eb	CA	CAN	124	Canada 	Kanada	\N
00040000-55a8-e19f-ef26-96fb65afd0d5	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55a8-e19f-47bb-7927da591edf	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55a8-e19f-2c41-fa9d79642fb7	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55a8-e19f-f767-ee9fd82b7ad5	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55a8-e19f-ba17-ffddac0b6082	CL	CHL	152	Chile 	Čile	\N
00040000-55a8-e19f-ec85-d1a949375347	CN	CHN	156	China 	Kitajska	\N
00040000-55a8-e19f-5da2-c82b1fdb86d5	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55a8-e19f-61d1-4aa220c0d9c5	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55a8-e19f-573a-88fe78b7009e	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55a8-e19f-3544-35c4bef23e6f	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55a8-e19f-5a8b-9d59c7bb554a	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55a8-e19f-bf2f-62fc95e9982a	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55a8-e19f-5408-6bb34d8bd412	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55a8-e19f-c41a-5055f975ffac	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55a8-e19f-bab9-d8cf956e3b32	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55a8-e19f-fe65-23ef9723e7f0	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55a8-e19f-2773-4eea53a42d28	CU	CUB	192	Cuba 	Kuba	\N
00040000-55a8-e19f-189c-5c8779d13451	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55a8-e19f-3590-a4358ba7a1da	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55a8-e19f-823a-b87ffd77650d	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55a8-e19f-6cac-a83a4398c6f3	DK	DNK	208	Denmark 	Danska	\N
00040000-55a8-e19f-8fcb-ef5d54c4ca17	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55a8-e19f-a794-64f08c96c7e5	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55a8-e19f-f425-18bfe970faae	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55a8-e19f-eb7a-e7ad8b5a0079	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55a8-e19f-bfbf-223f7e902c78	EG	EGY	818	Egypt 	Egipt	\N
00040000-55a8-e19f-cf2c-67589749254b	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55a8-e19f-7355-e9a1d0d18961	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55a8-e19f-08f4-23d4f3627860	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55a8-e19f-c234-c85859b6d035	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55a8-e19f-7c17-10f99def07e4	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55a8-e19f-e6ea-ab878568124d	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55a8-e19f-cb9d-165d26465ebd	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55a8-e19f-69c4-c990ee9c9b1c	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55a8-e19f-9a61-a242560359fd	FI	FIN	246	Finland 	Finska	\N
00040000-55a8-e19f-ec33-a171db97770b	FR	FRA	250	France 	Francija	\N
00040000-55a8-e19f-a9b5-b6d3ba4e47c4	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55a8-e19f-c963-487f277e5322	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55a8-e19f-014a-384812ba59ec	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55a8-e19f-1d67-da81b40967d6	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55a8-e19f-1e3b-7c49a3a6d6a9	GA	GAB	266	Gabon 	Gabon	\N
00040000-55a8-e19f-d0ce-ff9b31cff502	GM	GMB	270	Gambia 	Gambija	\N
00040000-55a8-e19f-003d-a61d2247b585	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55a8-e19f-08eb-d90511947c06	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55a8-e19f-56d7-a65c9158f3ee	GH	GHA	288	Ghana 	Gana	\N
00040000-55a8-e19f-fe54-81487b4aa888	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55a8-e19f-7747-3706f0ba3d5e	GR	GRC	300	Greece 	Grčija	\N
00040000-55a8-e19f-75be-4080ea68fcfb	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55a8-e19f-521c-60578242748f	GD	GRD	308	Grenada 	Grenada	\N
00040000-55a8-e19f-1908-7aa3356c9d70	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55a8-e19f-688f-40bacae01942	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55a8-e19f-a09f-78e673f3c3e5	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55a8-e19f-fd15-6397c60de2ba	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55a8-e19f-6246-1f6ac6d88181	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55a8-e19f-d4c2-bceec4cf9c96	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55a8-e19f-a6ec-2a85b1a866fe	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55a8-e19f-434e-10d768f7a0b5	HT	HTI	332	Haiti 	Haiti	\N
00040000-55a8-e19f-a946-d2436ca57e72	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55a8-e19f-d979-4446acfba956	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55a8-e19f-309f-7f1f3f69c5cd	HN	HND	340	Honduras 	Honduras	\N
00040000-55a8-e19f-5291-b192e449d512	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55a8-e19f-39a0-ec186f00d26c	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55a8-e19f-5907-1abb46b16d32	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55a8-e19f-54b0-5636b87ceee8	IN	IND	356	India 	Indija	\N
00040000-55a8-e19f-91d0-516a03e4ba37	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55a8-e19f-a6ff-3b72eea89d60	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55a8-e19f-23fc-6012bdd3743f	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55a8-e19f-f6b6-07cfb9e4754e	IE	IRL	372	Ireland 	Irska	\N
00040000-55a8-e19f-8efd-d1f9acb91d44	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55a8-e19f-62e6-a7d20ea4423c	IL	ISR	376	Israel 	Izrael	\N
00040000-55a8-e19f-25c6-269d1927ff23	IT	ITA	380	Italy 	Italija	\N
00040000-55a8-e19f-b215-0459d6b4fbc1	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55a8-e19f-5de6-c2b4e2e408c2	JP	JPN	392	Japan 	Japonska	\N
00040000-55a8-e19f-f572-feff9a262502	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55a8-e19f-acab-58d765c6d4a8	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55a8-e19f-3962-28d0c607fe3c	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55a8-e19f-254b-89bf836aeea8	KE	KEN	404	Kenya 	Kenija	\N
00040000-55a8-e19f-8f68-9123cd296faf	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55a8-e19f-942b-ed3e107dd414	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55a8-e19f-da3b-b862003fdd69	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55a8-e19f-64f0-4c5f0683a99d	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55a8-e19f-aa72-432581817306	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55a8-e19f-d6df-8427210c0925	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55a8-e19f-83b6-8f82a4c4d11a	LV	LVA	428	Latvia 	Latvija	\N
00040000-55a8-e19f-87d6-8818a8be22d9	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55a8-e19f-26f1-c17b9c67f942	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55a8-e19f-dac3-d4a254e8fc33	LR	LBR	430	Liberia 	Liberija	\N
00040000-55a8-e19f-0c45-64ddcb47139d	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55a8-e19f-5db8-8bf8d46ea5ba	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55a8-e19f-a4a4-5634cb8f20b7	LT	LTU	440	Lithuania 	Litva	\N
00040000-55a8-e19f-4d10-67d328e9119f	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55a8-e19f-4cf4-d8e0de0aedcc	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55a8-e19f-452b-a842d9633cb1	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55a8-e19f-90dd-aed780ad53a6	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55a8-e19f-fbac-79dc5db77a05	MW	MWI	454	Malawi 	Malavi	\N
00040000-55a8-e19f-6912-749773003633	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55a8-e19f-f301-94642a7d6e7c	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55a8-e19f-dbd0-9e436760fd32	ML	MLI	466	Mali 	Mali	\N
00040000-55a8-e19f-1d2d-59c0fb856ca1	MT	MLT	470	Malta 	Malta	\N
00040000-55a8-e19f-01a8-486fba5ab30f	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55a8-e19f-9d51-7051b18a4336	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55a8-e19f-eecb-e60caec9351a	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55a8-e19f-2a91-bb6557fa4bb5	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55a8-e19f-8eb2-34d0621752c6	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55a8-e19f-5d1e-f0c1bf3aa564	MX	MEX	484	Mexico 	Mehika	\N
00040000-55a8-e19f-69dc-51f214b8aad3	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55a8-e19f-66e7-2bfcd6f163ea	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55a8-e19f-51d9-74ff54d556e4	MC	MCO	492	Monaco 	Monako	\N
00040000-55a8-e19f-9057-3f836e36abe4	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55a8-e19f-3c66-3d9a45f38f07	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55a8-e19f-629d-ed71d3b400ae	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55a8-e19f-edff-3792f7581431	MA	MAR	504	Morocco 	Maroko	\N
00040000-55a8-e19f-4eb0-69204c959668	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55a8-e19f-8c4f-25c16e2bf389	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55a8-e19f-668b-676eb6d8e330	NA	NAM	516	Namibia 	Namibija	\N
00040000-55a8-e19f-3df2-35bd191b8dd7	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55a8-e19f-03e7-2cc11bd4b18d	NP	NPL	524	Nepal 	Nepal	\N
00040000-55a8-e19f-515e-51cdc2f0b4ec	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55a8-e19f-90b0-fa471f817ec3	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55a8-e19f-f65f-e5d14d99e419	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55a8-e19f-c187-c2be2d42b278	NE	NER	562	Niger 	Niger 	\N
00040000-55a8-e19f-145e-fd4d93849c96	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55a8-e19f-9f3f-5356b2be8539	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55a8-e19f-400b-20efad51e34c	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55a8-e19f-3986-7ae7a6349493	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55a8-e19f-7ffe-8bd4c00d9270	NO	NOR	578	Norway 	Norveška	\N
00040000-55a8-e19f-0d45-1c66dd68c592	OM	OMN	512	Oman 	Oman	\N
00040000-55a8-e19f-f7f2-2d62ee21f3f8	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55a8-e19f-ed3c-659d36c3ba21	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55a8-e19f-d2d2-1a616a052329	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55a8-e19f-b682-b6ad2bd07de4	PA	PAN	591	Panama 	Panama	\N
00040000-55a8-e19f-c2b8-ebedddf9dc33	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55a8-e19f-8605-5c0896fed2dd	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55a8-e19f-a260-5ce61747def0	PE	PER	604	Peru 	Peru	\N
00040000-55a8-e19f-b207-4da8e758fda1	PH	PHL	608	Philippines 	Filipini	\N
00040000-55a8-e19f-fe00-33889375094e	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55a8-e19f-2e60-40974400d23a	PL	POL	616	Poland 	Poljska	\N
00040000-55a8-e19f-cb6b-4015ac2754a1	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55a8-e19f-fd1a-3ba247c0aedf	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55a8-e19f-2333-73411ad1c618	QA	QAT	634	Qatar 	Katar	\N
00040000-55a8-e19f-e518-1b7f8980771c	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55a8-e19f-5f5f-b792155da4da	RO	ROU	642	Romania 	Romunija	\N
00040000-55a8-e19f-32fd-b3f7fa016724	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55a8-e19f-bf87-e8294af6e639	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55a8-e19f-7544-54ab0592a38b	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55a8-e19f-7e34-80f42c1cdd20	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55a8-e19f-365d-a1e4a35bb40a	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55a8-e19f-d845-997f22c2e24e	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55a8-e19f-6e39-6d0a2594ae20	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55a8-e19f-a93f-9b9e897d2072	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55a8-e19f-20a3-3006c7883a74	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55a8-e19f-d197-f086b8d18d30	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55a8-e19f-7dec-03fe1532eabf	SM	SMR	674	San Marino 	San Marino	\N
00040000-55a8-e19f-c32c-d545b3bc6b59	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55a8-e19f-2260-eaf362f246ed	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55a8-e19f-7cf1-0176b2b63480	SN	SEN	686	Senegal 	Senegal	\N
00040000-55a8-e19f-6154-b7793f469880	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55a8-e19f-fbb1-d790bd782775	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55a8-e19f-5519-b0e4d158735e	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55a8-e19f-4a28-d3b284c30026	SG	SGP	702	Singapore 	Singapur	\N
00040000-55a8-e19f-6617-e35f7e22686e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55a8-e19f-d723-ac38a78300fc	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55a8-e19f-8227-5bef22910135	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55a8-e19f-8777-12b09d5dbaa4	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55a8-e19f-6a2e-18482ca778c8	SO	SOM	706	Somalia 	Somalija	\N
00040000-55a8-e19f-32a4-15caf220abaf	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55a8-e19f-dc27-a7b4ee0f303b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55a8-e19f-ea12-b85582e238da	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55a8-e19f-b577-e64922fd0990	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55a8-e19f-b883-771e16327b40	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55a8-e19f-b6f1-d83e404d04ef	SD	SDN	729	Sudan 	Sudan	\N
00040000-55a8-e19f-0a9c-b14d225a923c	SR	SUR	740	Suriname 	Surinam	\N
00040000-55a8-e19f-ca8d-3a1fe266e874	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55a8-e19f-9d83-27018b7895d0	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55a8-e19f-0f87-f5e992ffb4ce	SE	SWE	752	Sweden 	Švedska	\N
00040000-55a8-e19f-450d-a021ae1ad954	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55a8-e19f-eaff-ac5e1a3b932d	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55a8-e19f-d68a-db68665f1992	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55a8-e19f-13d3-52cef157bec2	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55a8-e19f-2338-9e367f33d6dd	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55a8-e19f-cad2-41130a3f9267	TH	THA	764	Thailand 	Tajska	\N
00040000-55a8-e19f-5539-4a4295bd8180	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55a8-e19f-e181-173ebc54a5c0	TG	TGO	768	Togo 	Togo	\N
00040000-55a8-e19f-1e69-cc41a6659628	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55a8-e19f-bf22-db120be2062c	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55a8-e19f-0a23-8c7d957075c7	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55a8-e19f-a402-3bc12f1adeb7	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55a8-e19f-c90c-67f3af8ad455	TR	TUR	792	Turkey 	Turčija	\N
00040000-55a8-e19f-818f-9fe3f2b66517	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55a8-e19f-9934-5103930d3c43	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55a8-e19f-d95a-0931e6c91457	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55a8-e19f-1384-f6476dd0a4e1	UG	UGA	800	Uganda 	Uganda	\N
00040000-55a8-e19f-d2ba-4c113e662bc0	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55a8-e19f-64e2-df9f7b9db6d9	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55a8-e19f-66c7-b0d4a860b1de	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55a8-e19f-b2bd-f898a2e0d4f1	US	USA	840	United States 	Združene države Amerike	\N
00040000-55a8-e19f-7703-3b85cc8bdeed	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55a8-e19f-484a-ae273f8154ca	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55a8-e19f-b645-ce7053259608	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55a8-e19f-730a-01345efa26dc	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55a8-e19f-e7c8-2dcb06d001be	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55a8-e19f-127c-0d9d9f1d204d	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55a8-e19f-5f3a-05922e9cb294	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55a8-e19f-ea74-fe46cbebb0f1	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55a8-e19f-1013-4162a1e6a9fa	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55a8-e19f-b6ed-249100193cb2	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55a8-e19f-e5c2-22c9e737e4af	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55a8-e19f-96a5-95489cf1e125	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55a8-e19f-ae38-d937046bc021	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2910 (class 0 OID 10552966)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaprosenprocent, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55a8-e1a1-508f-962030e8fe5f	000e0000-55a8-e1a1-4829-a65261472c79	\N	\N	9000.30	9000.30	0.00	0.00	40.00	3600.12	2222.30	4000.40	200.20	0.00	100.20	0	2	2	2	2	2	\N	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-55a8-e1a0-1ad2-27f3b354d6b2	premiera	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55a8-e1a1-fcbf-aef870792d17	000e0000-55a8-e1a1-680e-09374e16227d	\N	\N	4900.20	4900.20	0.00	0.00	40.00	1960.08	1000.20	600.70	200.20	0.00	100.20	0	3	3	3	3	3	\N	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-55a8-e1a0-463e-cd438cdbe620	premiera	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55a8-e1a1-85c6-41ab1e7cf3c9	\N	\N	\N	300.00	300.00	0.00	0.00	20.00	60.00	200.11	0.00	0.00	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0		Urejanje portala	10	\N	razno	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55a8-e1a1-1f5b-d78492d095f3	\N	\N	\N	203.00	203.00	0.00	0.00	30.00	60.90	100.22	0.00	0.00	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0		Delavnice otroci	8	\N	razno	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2897 (class 0 OID 10552793)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55a8-e1a1-a2de-5359e6b6571e	000e0000-55a8-e1a1-680e-09374e16227d	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55a8-e1a0-b5b0-21b80763c5cf
000d0000-55a8-e1a1-6626-1f5b8991c23e	000e0000-55a8-e1a1-680e-09374e16227d	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55a8-e1a0-b5b0-21b80763c5cf
000d0000-55a8-e1a1-65c6-94758551ac12	000e0000-55a8-e1a1-680e-09374e16227d	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55a8-e1a0-4fcb-60f868855219
000d0000-55a8-e1a1-6e1f-b8a39b5fce0b	000e0000-55a8-e1a1-680e-09374e16227d	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-55a8-e1a0-d8c7-1f4f37afe739
000d0000-55a8-e1a1-fae6-869d2b481bf8	000e0000-55a8-e1a1-680e-09374e16227d	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55a8-e1a0-d8c7-1f4f37afe739
000d0000-55a8-e1a1-82c9-25fa0800f089	000e0000-55a8-e1a1-680e-09374e16227d	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55a8-e1a0-d8c7-1f4f37afe739
000d0000-55a8-e1a1-b8eb-10efdec01d06	000e0000-55a8-e1a1-680e-09374e16227d	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55a8-e1a0-b5b0-21b80763c5cf
000d0000-55a8-e1a1-0d18-1e01225e3c9c	000e0000-55a8-e1a1-680e-09374e16227d	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55a8-e1a0-7b60-ed16c1e42a44
\.


--
-- TOC entry 2876 (class 0 OID 10552613)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 10552661)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 10552593)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55a8-e1a1-fe55-6227151ebec2	00080000-55a8-e1a0-a423-d0f38f462618	00090000-55a8-e1a1-101a-8373efdc2e21	AK		
\.


--
-- TOC entry 2851 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2886 (class 0 OID 10552710)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 10552735)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2871 (class 0 OID 10552550)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55a8-e19f-d6cc-5f5d4ecc8277	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55a8-e19f-bc3c-d209d498795b	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55a8-e19f-7c4a-886b788e8f1a	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55a8-e19f-9a37-344cdf505722	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55a8-e19f-7fc2-b69a177b945d	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55a8-e19f-f224-695c04060431	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55a8-e19f-f9a2-b0c29830bfb6	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55a8-e19f-b442-aa76a49092ed	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55a8-e19f-e5c3-563941161c82	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55a8-e19f-a7e5-273aa6e89699	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55a8-e19f-f819-d24c14330a6a	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55a8-e19f-6f41-a5d7e3bbf8fe	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55a8-e19f-4695-9ab761c951c1	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-55a8-e1a0-a3bf-21b437f77250	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55a8-e1a0-6f46-cd86376b834d	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55a8-e1a0-28ef-5182b4365418	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55a8-e1a0-e4d0-f81885a752be	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55a8-e1a0-313a-fafe8c6ee5e1	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55a8-e1a0-bde3-017357226d6e	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2865 (class 0 OID 10552463)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55a8-e1a0-4821-9659908e4772	00000000-55a8-e1a0-6f46-cd86376b834d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55a8-e1a0-6a7e-9a2475ed4493	00000000-55a8-e1a0-6f46-cd86376b834d	00010000-55a8-e19f-b1b1-cfdbc09dd0d4	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55a8-e1a0-5d4d-d4ee00330c54	00000000-55a8-e1a0-28ef-5182b4365418	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2866 (class 0 OID 10552474)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55a8-e1a1-93c1-c00f69f074f0	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55a8-e1a1-26ee-0aa888b2b942	00010000-55a8-e1a0-a854-d1c935c2c430	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55a8-e1a1-d0d9-6f756f0c33eb	00010000-55a8-e1a0-e781-45f6427b2642	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55a8-e1a1-494d-09e678c36450	00010000-55a8-e1a1-7b41-17f0ff1822af	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55a8-e1a1-bf19-6efbb41639e1	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55a8-e1a1-6874-9789147d1bc1	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55a8-e1a1-fe81-cc5219c947c0	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55a8-e1a1-cfd6-773cc458bf47	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55a8-e1a1-101a-8373efdc2e21	00010000-55a8-e1a0-1ebd-8ea4f22d68db	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55a8-e1a1-04b8-00b2f8a209d6	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55a8-e1a1-d1fa-3274e4db5afc	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55a8-e1a1-2679-9f6461a7ec97	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55a8-e1a1-f51e-acf95d3e88b1	00010000-55a8-e1a1-6096-1e6fab140b4f	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2853 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 10552428)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55a8-e19f-0fa9-36560a3ce84d	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55a8-e19f-a9e4-fb92936babf2	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55a8-e19f-0677-a22161c4dfb3	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55a8-e19f-1290-ed7eb8abc817	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55a8-e19f-e1d6-d0aa636bcf1d	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55a8-e19f-6876-e8b192acb51d	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55a8-e19f-738a-27cb0da12f68	Abonma-read	Abonma - branje	f
00030000-55a8-e19f-0c22-6f6279e45aa2	Abonma-write	Abonma - spreminjanje	f
00030000-55a8-e19f-20dd-efdea8e7094a	Alternacija-read	Alternacija - branje	f
00030000-55a8-e19f-29de-009c63431cb5	Alternacija-write	Alternacija - spreminjanje	f
00030000-55a8-e19f-ad79-337a1e8952ff	Arhivalija-read	Arhivalija - branje	f
00030000-55a8-e19f-1dc7-74fb3c38ea5d	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55a8-e19f-07ec-3a17e0b4a2be	Besedilo-read	Besedilo - branje	f
00030000-55a8-e19f-a51c-135885ccba10	Besedilo-write	Besedilo - spreminjanje	f
00030000-55a8-e19f-62d7-b39aa463cc32	DogodekIzven-read	DogodekIzven - branje	f
00030000-55a8-e19f-74f9-6421dac4cfa2	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55a8-e19f-8f1c-c77ead7cfd5b	Dogodek-read	Dogodek - branje	f
00030000-55a8-e19f-0b81-42bd3e5b69fc	Dogodek-write	Dogodek - spreminjanje	f
00030000-55a8-e19f-d099-070aa4cb52ed	DrugiVir-read	DrugiVir - branje	f
00030000-55a8-e19f-5de9-b0e7b370e5df	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55a8-e19f-adb3-bb0bf4608ada	Drzava-read	Drzava - branje	f
00030000-55a8-e19f-2617-151df723f503	Drzava-write	Drzava - spreminjanje	f
00030000-55a8-e19f-27bb-580e4acb9dce	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55a8-e19f-1f1c-dd9f475988ea	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55a8-e19f-c722-ba568957a640	Funkcija-read	Funkcija - branje	f
00030000-55a8-e19f-58dc-67a59ee84dae	Funkcija-write	Funkcija - spreminjanje	f
00030000-55a8-e19f-8b59-be85461faaef	Gostovanje-read	Gostovanje - branje	f
00030000-55a8-e19f-ef6f-fb583511a0a5	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55a8-e19f-f851-f6d961c40721	Gostujoca-read	Gostujoca - branje	f
00030000-55a8-e19f-1478-cfff3b5eb6d6	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55a8-e19f-f6a2-4b3c1284b38d	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55a8-e19f-2672-1ef404907986	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55a8-e19f-16de-45011557da94	Kupec-read	Kupec - branje	f
00030000-55a8-e19f-842d-f293384e8c0c	Kupec-write	Kupec - spreminjanje	f
00030000-55a8-e19f-b726-3efb2eed87f6	NacinPlacina-read	NacinPlacina - branje	f
00030000-55a8-e19f-840b-5859aa5b0b79	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55a8-e19f-7579-7d814ff2ce02	Option-read	Option - branje	f
00030000-55a8-e19f-23a7-d09be9b479c0	Option-write	Option - spreminjanje	f
00030000-55a8-e19f-d00c-b09501e88f7e	OptionValue-read	OptionValue - branje	f
00030000-55a8-e19f-7ac3-418d6cf62d71	OptionValue-write	OptionValue - spreminjanje	f
00030000-55a8-e19f-e47f-77bf02cda011	Oseba-read	Oseba - branje	f
00030000-55a8-e19f-1401-0935f87bb0b6	Oseba-write	Oseba - spreminjanje	f
00030000-55a8-e19f-877e-89fea0ea06f0	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55a8-e19f-6234-e0e9c27f7a69	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55a8-e19f-03dd-93d137a96328	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55a8-e19f-fdd8-936bc93d9751	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55a8-e19f-c0ed-bbba4b2bc84a	Pogodba-read	Pogodba - branje	f
00030000-55a8-e19f-82de-860f3acf583d	Pogodba-write	Pogodba - spreminjanje	f
00030000-55a8-e19f-481b-ece33b0d2ced	Popa-read	Popa - branje	f
00030000-55a8-e19f-9314-343cc119609b	Popa-write	Popa - spreminjanje	f
00030000-55a8-e19f-faa8-2d09bfb8deb8	Posta-read	Posta - branje	f
00030000-55a8-e19f-e6d7-b1c6953f8246	Posta-write	Posta - spreminjanje	f
00030000-55a8-e19f-ffe0-01b3ebe3208e	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55a8-e19f-5c1c-ab1b6e50dfaa	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55a8-e19f-c8ee-316926dca643	PostniNaslov-read	PostniNaslov - branje	f
00030000-55a8-e19f-32e0-d7a4d40ed154	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55a8-e19f-aee6-a456108cc05e	Predstava-read	Predstava - branje	f
00030000-55a8-e19f-8155-31d446010eec	Predstava-write	Predstava - spreminjanje	f
00030000-55a8-e19f-efa3-5764774bb18e	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55a8-e19f-3840-7ade2ecd8512	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55a8-e19f-600e-f5c0bfd11f2f	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55a8-e19f-3295-bc5eb5c69c7b	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55a8-e19f-03c6-91551ad38892	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55a8-e19f-1128-0706b8b88c87	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55a8-e19f-f5c8-d2f826ae4dd7	ProgramDela-read	ProgramDela - branje	f
00030000-55a8-e19f-d7bb-cb4bfccda92c	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55a8-e19f-736c-e1150848d210	ProgramFestival-read	ProgramFestival - branje	f
00030000-55a8-e19f-720c-50ef1c6efdda	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55a8-e19f-0656-fc748f321227	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55a8-e19f-e742-1979f2deb56f	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55a8-e19f-11ef-e38969c7d003	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55a8-e19f-e88d-1a30ba75280a	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55a8-e19f-dc25-fa39cdd64238	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55a8-e19f-3612-f05b13264403	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55a8-e19f-c012-ec45dd8d2be1	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55a8-e19f-4d50-f369ea0cf64c	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55a8-e19f-a0dd-697f07820ba1	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55a8-e19f-e8f3-57547182f27f	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55a8-e19f-063b-f96de7c69a21	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55a8-e19f-3e69-3841b7113fda	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55a8-e19f-251b-2c8a9c8ed5a1	ProgramRazno-read	ProgramRazno - branje	f
00030000-55a8-e19f-6ea4-66b12d260a8c	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55a8-e19f-a299-e156e3b5f1ba	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55a8-e19f-4b88-7dd195fea235	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55a8-e19f-93c4-59ab91bae356	Prostor-read	Prostor - branje	f
00030000-55a8-e19f-9b6e-ce9a4688efce	Prostor-write	Prostor - spreminjanje	f
00030000-55a8-e19f-0aa9-dfd9c4fb94ac	Racun-read	Racun - branje	f
00030000-55a8-e19f-4212-b02cbcacaa26	Racun-write	Racun - spreminjanje	f
00030000-55a8-e19f-b69b-391f7ee13df7	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55a8-e19f-9759-a30d116fd9e4	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55a8-e19f-0d7c-a2e146e2581b	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55a8-e19f-ecbd-1f6d26735f8c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55a8-e19f-0c35-c79b69ebcae1	Rekvizit-read	Rekvizit - branje	f
00030000-55a8-e19f-f2a9-d7d0d40e5a2f	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55a8-e19f-d3e8-92f248355b9d	Revizija-read	Revizija - branje	f
00030000-55a8-e19f-f99f-6df7934097eb	Revizija-write	Revizija - spreminjanje	f
00030000-55a8-e19f-2bfb-b42a0f7b2a52	Rezervacija-read	Rezervacija - branje	f
00030000-55a8-e19f-bb5b-14f02c4c7fec	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55a8-e19f-38e0-d4292128473c	SedezniRed-read	SedezniRed - branje	f
00030000-55a8-e19f-8374-40e706a7c1e2	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55a8-e19f-ebaa-6f65bfeec8be	Sedez-read	Sedez - branje	f
00030000-55a8-e19f-75c6-9d7b891f946d	Sedez-write	Sedez - spreminjanje	f
00030000-55a8-e19f-0447-9dac875dd1a7	Sezona-read	Sezona - branje	f
00030000-55a8-e19f-4f84-6004cf14342b	Sezona-write	Sezona - spreminjanje	f
00030000-55a8-e19f-ef12-f0d9b1762b53	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55a8-e19f-530d-39be4a9f8b03	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55a8-e19f-8363-bbad351c406b	Stevilcenje-read	Stevilcenje - branje	f
00030000-55a8-e19f-bf68-391d294ad374	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55a8-e19f-9511-682d4baf8e1b	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55a8-e19f-f623-cabc219d7cac	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55a8-e19f-93ec-2482b74ec0ab	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55a8-e19f-342b-a142727f1138	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55a8-e19f-c714-24f507827afa	Telefonska-read	Telefonska - branje	f
00030000-55a8-e19f-7e3c-56a3d04abf54	Telefonska-write	Telefonska - spreminjanje	f
00030000-55a8-e19f-cd3b-b11c0d60d8ac	TerminStoritve-read	TerminStoritve - branje	f
00030000-55a8-e19f-fab9-3dbc61101c30	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55a8-e19f-9458-6591995e8580	TipFunkcije-read	TipFunkcije - branje	f
00030000-55a8-e19f-1552-03369b3c1114	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55a8-e19f-ebb4-85b54dca8381	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55a8-e19f-8a9c-11875548856c	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55a8-e19f-6814-264516c4f8de	Trr-read	Trr - branje	f
00030000-55a8-e19f-c5d9-89300e65d84b	Trr-write	Trr - spreminjanje	f
00030000-55a8-e19f-ab94-214425308896	Uprizoritev-read	Uprizoritev - branje	f
00030000-55a8-e19f-c16b-9b3de3a15e30	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55a8-e19f-2da6-333f5b3d08d1	Vaja-read	Vaja - branje	f
00030000-55a8-e19f-1f91-6fdbdb029831	Vaja-write	Vaja - spreminjanje	f
00030000-55a8-e19f-4267-0504a36d8248	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55a8-e19f-aeb6-6549ae7a5588	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55a8-e19f-00d4-33be7b217339	Zaposlitev-read	Zaposlitev - branje	f
00030000-55a8-e19f-42fd-02ee5039d242	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55a8-e19f-d502-58d3a79994c7	Zasedenost-read	Zasedenost - branje	f
00030000-55a8-e19f-b25b-f374c217758b	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55a8-e19f-e52c-c00e1109c186	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55a8-e19f-6a2d-92fefa46a9b0	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55a8-e19f-f0e3-04e63ca3979c	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55a8-e19f-d2b3-6047bf56eb41	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2863 (class 0 OID 10552447)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55a8-e19f-5306-26953364be88	00030000-55a8-e19f-a9e4-fb92936babf2
00020000-55a8-e19f-855e-4f68321313b6	00030000-55a8-e19f-adb3-bb0bf4608ada
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-738a-27cb0da12f68
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-0c22-6f6279e45aa2
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-20dd-efdea8e7094a
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-29de-009c63431cb5
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-ad79-337a1e8952ff
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-8f1c-c77ead7cfd5b
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-1290-ed7eb8abc817
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-0b81-42bd3e5b69fc
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-adb3-bb0bf4608ada
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-2617-151df723f503
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-c722-ba568957a640
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-58dc-67a59ee84dae
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-8b59-be85461faaef
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-ef6f-fb583511a0a5
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-f851-f6d961c40721
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-1478-cfff3b5eb6d6
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-f6a2-4b3c1284b38d
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-2672-1ef404907986
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-7579-7d814ff2ce02
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-d00c-b09501e88f7e
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-e47f-77bf02cda011
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-1401-0935f87bb0b6
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-481b-ece33b0d2ced
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-9314-343cc119609b
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-faa8-2d09bfb8deb8
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-e6d7-b1c6953f8246
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-c8ee-316926dca643
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-32e0-d7a4d40ed154
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-aee6-a456108cc05e
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-8155-31d446010eec
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-03c6-91551ad38892
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-1128-0706b8b88c87
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-93c4-59ab91bae356
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-9b6e-ce9a4688efce
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-0d7c-a2e146e2581b
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-ecbd-1f6d26735f8c
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-0c35-c79b69ebcae1
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-f2a9-d7d0d40e5a2f
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-0447-9dac875dd1a7
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-4f84-6004cf14342b
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-9458-6591995e8580
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-ab94-214425308896
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-c16b-9b3de3a15e30
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-2da6-333f5b3d08d1
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-1f91-6fdbdb029831
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-d502-58d3a79994c7
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-b25b-f374c217758b
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-e52c-c00e1109c186
00020000-55a8-e19f-cee6-60d6a2b209d6	00030000-55a8-e19f-f0e3-04e63ca3979c
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-738a-27cb0da12f68
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-ad79-337a1e8952ff
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-8f1c-c77ead7cfd5b
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-adb3-bb0bf4608ada
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-8b59-be85461faaef
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-f851-f6d961c40721
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-f6a2-4b3c1284b38d
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-2672-1ef404907986
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-7579-7d814ff2ce02
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-d00c-b09501e88f7e
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-e47f-77bf02cda011
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-1401-0935f87bb0b6
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-481b-ece33b0d2ced
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-faa8-2d09bfb8deb8
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-c8ee-316926dca643
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-32e0-d7a4d40ed154
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-aee6-a456108cc05e
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-93c4-59ab91bae356
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-0d7c-a2e146e2581b
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-0c35-c79b69ebcae1
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-0447-9dac875dd1a7
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-c714-24f507827afa
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-7e3c-56a3d04abf54
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-6814-264516c4f8de
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-c5d9-89300e65d84b
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-00d4-33be7b217339
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-42fd-02ee5039d242
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-e52c-c00e1109c186
00020000-55a8-e19f-1dfa-a39f21666709	00030000-55a8-e19f-f0e3-04e63ca3979c
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-738a-27cb0da12f68
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-20dd-efdea8e7094a
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-ad79-337a1e8952ff
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-1dc7-74fb3c38ea5d
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-07ec-3a17e0b4a2be
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-62d7-b39aa463cc32
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-8f1c-c77ead7cfd5b
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-adb3-bb0bf4608ada
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-c722-ba568957a640
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-8b59-be85461faaef
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-f851-f6d961c40721
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-f6a2-4b3c1284b38d
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-7579-7d814ff2ce02
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-d00c-b09501e88f7e
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-e47f-77bf02cda011
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-481b-ece33b0d2ced
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-faa8-2d09bfb8deb8
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-aee6-a456108cc05e
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-03c6-91551ad38892
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-93c4-59ab91bae356
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-0d7c-a2e146e2581b
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-0c35-c79b69ebcae1
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-0447-9dac875dd1a7
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-9458-6591995e8580
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-2da6-333f5b3d08d1
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-d502-58d3a79994c7
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-e52c-c00e1109c186
00020000-55a8-e19f-8f8d-804d6fc8771c	00030000-55a8-e19f-f0e3-04e63ca3979c
00020000-55a8-e19f-d138-09f082e354d0	00030000-55a8-e19f-738a-27cb0da12f68
00020000-55a8-e19f-d138-09f082e354d0	00030000-55a8-e19f-0c22-6f6279e45aa2
00020000-55a8-e19f-d138-09f082e354d0	00030000-55a8-e19f-29de-009c63431cb5
00020000-55a8-e19f-d138-09f082e354d0	00030000-55a8-e19f-ad79-337a1e8952ff
00020000-55a8-e19f-d138-09f082e354d0	00030000-55a8-e19f-8f1c-c77ead7cfd5b
00020000-55a8-e19f-d138-09f082e354d0	00030000-55a8-e19f-adb3-bb0bf4608ada
00020000-55a8-e19f-d138-09f082e354d0	00030000-55a8-e19f-8b59-be85461faaef
00020000-55a8-e19f-d138-09f082e354d0	00030000-55a8-e19f-f851-f6d961c40721
00020000-55a8-e19f-d138-09f082e354d0	00030000-55a8-e19f-7579-7d814ff2ce02
00020000-55a8-e19f-d138-09f082e354d0	00030000-55a8-e19f-d00c-b09501e88f7e
00020000-55a8-e19f-d138-09f082e354d0	00030000-55a8-e19f-481b-ece33b0d2ced
00020000-55a8-e19f-d138-09f082e354d0	00030000-55a8-e19f-faa8-2d09bfb8deb8
00020000-55a8-e19f-d138-09f082e354d0	00030000-55a8-e19f-aee6-a456108cc05e
00020000-55a8-e19f-d138-09f082e354d0	00030000-55a8-e19f-93c4-59ab91bae356
00020000-55a8-e19f-d138-09f082e354d0	00030000-55a8-e19f-0d7c-a2e146e2581b
00020000-55a8-e19f-d138-09f082e354d0	00030000-55a8-e19f-0c35-c79b69ebcae1
00020000-55a8-e19f-d138-09f082e354d0	00030000-55a8-e19f-0447-9dac875dd1a7
00020000-55a8-e19f-d138-09f082e354d0	00030000-55a8-e19f-9458-6591995e8580
00020000-55a8-e19f-d138-09f082e354d0	00030000-55a8-e19f-e52c-c00e1109c186
00020000-55a8-e19f-d138-09f082e354d0	00030000-55a8-e19f-f0e3-04e63ca3979c
00020000-55a8-e19f-a151-29084cad7df5	00030000-55a8-e19f-738a-27cb0da12f68
00020000-55a8-e19f-a151-29084cad7df5	00030000-55a8-e19f-ad79-337a1e8952ff
00020000-55a8-e19f-a151-29084cad7df5	00030000-55a8-e19f-8f1c-c77ead7cfd5b
00020000-55a8-e19f-a151-29084cad7df5	00030000-55a8-e19f-adb3-bb0bf4608ada
00020000-55a8-e19f-a151-29084cad7df5	00030000-55a8-e19f-8b59-be85461faaef
00020000-55a8-e19f-a151-29084cad7df5	00030000-55a8-e19f-f851-f6d961c40721
00020000-55a8-e19f-a151-29084cad7df5	00030000-55a8-e19f-7579-7d814ff2ce02
00020000-55a8-e19f-a151-29084cad7df5	00030000-55a8-e19f-d00c-b09501e88f7e
00020000-55a8-e19f-a151-29084cad7df5	00030000-55a8-e19f-481b-ece33b0d2ced
00020000-55a8-e19f-a151-29084cad7df5	00030000-55a8-e19f-faa8-2d09bfb8deb8
00020000-55a8-e19f-a151-29084cad7df5	00030000-55a8-e19f-aee6-a456108cc05e
00020000-55a8-e19f-a151-29084cad7df5	00030000-55a8-e19f-93c4-59ab91bae356
00020000-55a8-e19f-a151-29084cad7df5	00030000-55a8-e19f-0d7c-a2e146e2581b
00020000-55a8-e19f-a151-29084cad7df5	00030000-55a8-e19f-0c35-c79b69ebcae1
00020000-55a8-e19f-a151-29084cad7df5	00030000-55a8-e19f-0447-9dac875dd1a7
00020000-55a8-e19f-a151-29084cad7df5	00030000-55a8-e19f-cd3b-b11c0d60d8ac
00020000-55a8-e19f-a151-29084cad7df5	00030000-55a8-e19f-0677-a22161c4dfb3
00020000-55a8-e19f-a151-29084cad7df5	00030000-55a8-e19f-9458-6591995e8580
00020000-55a8-e19f-a151-29084cad7df5	00030000-55a8-e19f-e52c-c00e1109c186
00020000-55a8-e19f-a151-29084cad7df5	00030000-55a8-e19f-f0e3-04e63ca3979c
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-0fa9-36560a3ce84d
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-a9e4-fb92936babf2
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-0677-a22161c4dfb3
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-1290-ed7eb8abc817
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-e1d6-d0aa636bcf1d
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-6876-e8b192acb51d
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-738a-27cb0da12f68
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-0c22-6f6279e45aa2
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-20dd-efdea8e7094a
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-29de-009c63431cb5
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-ad79-337a1e8952ff
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-1dc7-74fb3c38ea5d
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-07ec-3a17e0b4a2be
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-a51c-135885ccba10
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-62d7-b39aa463cc32
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-74f9-6421dac4cfa2
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-8f1c-c77ead7cfd5b
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-0b81-42bd3e5b69fc
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-adb3-bb0bf4608ada
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-2617-151df723f503
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-d099-070aa4cb52ed
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-5de9-b0e7b370e5df
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-27bb-580e4acb9dce
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-1f1c-dd9f475988ea
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-c722-ba568957a640
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-58dc-67a59ee84dae
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-8b59-be85461faaef
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-ef6f-fb583511a0a5
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-f851-f6d961c40721
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-1478-cfff3b5eb6d6
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-f6a2-4b3c1284b38d
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-2672-1ef404907986
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-16de-45011557da94
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-842d-f293384e8c0c
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-b726-3efb2eed87f6
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-840b-5859aa5b0b79
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-7579-7d814ff2ce02
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-23a7-d09be9b479c0
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-d00c-b09501e88f7e
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-7ac3-418d6cf62d71
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-e47f-77bf02cda011
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-1401-0935f87bb0b6
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-877e-89fea0ea06f0
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-6234-e0e9c27f7a69
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-03dd-93d137a96328
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-fdd8-936bc93d9751
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-c0ed-bbba4b2bc84a
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-82de-860f3acf583d
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-481b-ece33b0d2ced
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-9314-343cc119609b
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-faa8-2d09bfb8deb8
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-e6d7-b1c6953f8246
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-ffe0-01b3ebe3208e
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-5c1c-ab1b6e50dfaa
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-c8ee-316926dca643
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-32e0-d7a4d40ed154
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-aee6-a456108cc05e
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-8155-31d446010eec
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-efa3-5764774bb18e
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-3840-7ade2ecd8512
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-600e-f5c0bfd11f2f
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-3295-bc5eb5c69c7b
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-03c6-91551ad38892
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-1128-0706b8b88c87
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-f5c8-d2f826ae4dd7
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-d7bb-cb4bfccda92c
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-736c-e1150848d210
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-720c-50ef1c6efdda
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-0656-fc748f321227
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-e742-1979f2deb56f
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-11ef-e38969c7d003
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-e88d-1a30ba75280a
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-dc25-fa39cdd64238
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-3612-f05b13264403
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-c012-ec45dd8d2be1
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-4d50-f369ea0cf64c
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-a0dd-697f07820ba1
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-e8f3-57547182f27f
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-063b-f96de7c69a21
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-3e69-3841b7113fda
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-251b-2c8a9c8ed5a1
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-6ea4-66b12d260a8c
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-a299-e156e3b5f1ba
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-4b88-7dd195fea235
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-93c4-59ab91bae356
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-9b6e-ce9a4688efce
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-0aa9-dfd9c4fb94ac
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-4212-b02cbcacaa26
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-b69b-391f7ee13df7
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-9759-a30d116fd9e4
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-0d7c-a2e146e2581b
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-ecbd-1f6d26735f8c
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-0c35-c79b69ebcae1
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-f2a9-d7d0d40e5a2f
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-d3e8-92f248355b9d
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-f99f-6df7934097eb
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-2bfb-b42a0f7b2a52
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-bb5b-14f02c4c7fec
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-38e0-d4292128473c
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-8374-40e706a7c1e2
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-ebaa-6f65bfeec8be
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-75c6-9d7b891f946d
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-0447-9dac875dd1a7
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-4f84-6004cf14342b
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-ef12-f0d9b1762b53
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-530d-39be4a9f8b03
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-8363-bbad351c406b
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-bf68-391d294ad374
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-9511-682d4baf8e1b
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-f623-cabc219d7cac
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-93ec-2482b74ec0ab
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-342b-a142727f1138
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-c714-24f507827afa
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-7e3c-56a3d04abf54
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-cd3b-b11c0d60d8ac
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-fab9-3dbc61101c30
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-9458-6591995e8580
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-1552-03369b3c1114
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-ebb4-85b54dca8381
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-8a9c-11875548856c
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-6814-264516c4f8de
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-c5d9-89300e65d84b
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-ab94-214425308896
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-c16b-9b3de3a15e30
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-2da6-333f5b3d08d1
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-1f91-6fdbdb029831
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-4267-0504a36d8248
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-aeb6-6549ae7a5588
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-00d4-33be7b217339
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-42fd-02ee5039d242
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-d502-58d3a79994c7
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-b25b-f374c217758b
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-e52c-c00e1109c186
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-6a2d-92fefa46a9b0
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-f0e3-04e63ca3979c
00020000-55a8-e1a0-cce9-e036607521b1	00030000-55a8-e19f-d2b3-6047bf56eb41
\.


--
-- TOC entry 2891 (class 0 OID 10552742)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 10552773)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 10552887)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55a8-e1a1-4e64-57c9be223a0e	00090000-55a8-e1a1-93c1-c00f69f074f0	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55a8-e1a1-54c2-c3d0cfb1db91	00090000-55a8-e1a1-6874-9789147d1bc1	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55a8-e1a1-14dd-ed44ea9a0dbb	00090000-55a8-e1a1-f51e-acf95d3e88b1	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2868 (class 0 OID 10552507)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55a8-e1a0-a423-d0f38f462618	00040000-55a8-e19f-8227-5bef22910135	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-e1a0-ba61-cad68eff3333	00040000-55a8-e19f-8227-5bef22910135	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55a8-e1a0-8791-23d693c97ccc	00040000-55a8-e19f-8227-5bef22910135	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-e1a0-21f1-4eef83b0fcfa	00040000-55a8-e19f-8227-5bef22910135	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-e1a0-8cda-9daa6a81f104	00040000-55a8-e19f-8227-5bef22910135	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-e1a0-abdb-5690dfa52d47	00040000-55a8-e19f-3848-e1b28c98aa7d	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-e1a0-964b-9684f41c6607	00040000-55a8-e19f-fe65-23ef9723e7f0	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-e1a0-1c41-a4657666b545	00040000-55a8-e19f-a04e-3fef41c0b0ed	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-e1a1-3ed6-ecf867698db7	00040000-55a8-e19f-8227-5bef22910135	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2870 (class 0 OID 10552542)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55a8-e19f-5286-6affa265077a	8341	Adlešiči
00050000-55a8-e19f-b06d-b8ba6f1e2503	5270	Ajdovščina
00050000-55a8-e19f-116f-867069d0e894	6280	Ankaran/Ancarano
00050000-55a8-e19f-b406-dd8617123e88	9253	Apače
00050000-55a8-e19f-cb94-ff8b41931bf8	8253	Artiče
00050000-55a8-e19f-f140-13bc4f89fbef	4275	Begunje na Gorenjskem
00050000-55a8-e19f-f7d3-7fa35e868c86	1382	Begunje pri Cerknici
00050000-55a8-e19f-3bec-bdea75c12c41	9231	Beltinci
00050000-55a8-e19f-610e-7154dd661a5a	2234	Benedikt
00050000-55a8-e19f-9aca-d9d8019c6f6e	2345	Bistrica ob Dravi
00050000-55a8-e19f-b94a-37154973b12d	3256	Bistrica ob Sotli
00050000-55a8-e19f-75c1-647f37a6061d	8259	Bizeljsko
00050000-55a8-e19f-8d53-157f246a2782	1223	Blagovica
00050000-55a8-e19f-d698-edbc900c820c	8283	Blanca
00050000-55a8-e19f-8297-bc2e31a35bc2	4260	Bled
00050000-55a8-e19f-e68d-809c25fee8ea	4273	Blejska Dobrava
00050000-55a8-e19f-0cc7-a58cbd208233	9265	Bodonci
00050000-55a8-e19f-066f-f2c4e216a33e	9222	Bogojina
00050000-55a8-e19f-e3a4-7aa6eba316d4	4263	Bohinjska Bela
00050000-55a8-e19f-75f3-9086ae310cd4	4264	Bohinjska Bistrica
00050000-55a8-e19f-f210-9b23ffb515f3	4265	Bohinjsko jezero
00050000-55a8-e19f-1357-3d113402ffb4	1353	Borovnica
00050000-55a8-e19f-40a1-2490709dd9d4	8294	Boštanj
00050000-55a8-e19f-84d4-a237ccb01a9b	5230	Bovec
00050000-55a8-e19f-dfb8-689f5ae25b52	5295	Branik
00050000-55a8-e19f-03d5-f05e349a428d	3314	Braslovče
00050000-55a8-e19f-bc40-5205b8b977fd	5223	Breginj
00050000-55a8-e19f-3aff-d2703f2d265d	8280	Brestanica
00050000-55a8-e19f-1154-9eb1cbbbb153	2354	Bresternica
00050000-55a8-e19f-c2b8-e1c0292671ce	4243	Brezje
00050000-55a8-e19f-f76d-fbfcb3d9c656	1351	Brezovica pri Ljubljani
00050000-55a8-e19f-b81a-a9dc3454842a	8250	Brežice
00050000-55a8-e19f-4d81-fc02c27c3b6e	4210	Brnik - Aerodrom
00050000-55a8-e19f-f43d-c8cd39e0c1c1	8321	Brusnice
00050000-55a8-e19f-1d4f-11fbb92d583d	3255	Buče
00050000-55a8-e19f-d15e-a192e9b7cdb3	8276	Bučka 
00050000-55a8-e19f-e213-2cd179baa3f8	9261	Cankova
00050000-55a8-e19f-99bd-c30bc7d6ee0c	3000	Celje 
00050000-55a8-e19f-3b38-06e428c924a7	3001	Celje - poštni predali
00050000-55a8-e19f-f923-cdbc50dfb1a4	4207	Cerklje na Gorenjskem
00050000-55a8-e19f-d003-18a8a1df7cf8	8263	Cerklje ob Krki
00050000-55a8-e19f-3109-de17f251c4d7	1380	Cerknica
00050000-55a8-e19f-18fb-13c74f5b2da3	5282	Cerkno
00050000-55a8-e19f-9231-31edbe0c4435	2236	Cerkvenjak
00050000-55a8-e19f-144b-10807367128b	2215	Ceršak
00050000-55a8-e19f-1c9c-eca224ad1f94	2326	Cirkovce
00050000-55a8-e19f-76e5-c0a422d18dcd	2282	Cirkulane
00050000-55a8-e19f-b9dd-770f5d03a1a2	5273	Col
00050000-55a8-e19f-326e-44110a3c0432	8251	Čatež ob Savi
00050000-55a8-e19f-b445-9a7779f04800	1413	Čemšenik
00050000-55a8-e19f-b7d3-d2776de9bc34	5253	Čepovan
00050000-55a8-e19f-7c6e-da693a725313	9232	Črenšovci
00050000-55a8-e19f-1897-19cf3cdba96c	2393	Črna na Koroškem
00050000-55a8-e19f-cae0-1569b095395c	6275	Črni Kal
00050000-55a8-e19f-cd87-6a73b5887c6e	5274	Črni Vrh nad Idrijo
00050000-55a8-e19f-b199-bea3c47f47c1	5262	Črniče
00050000-55a8-e19f-0fb8-72fd400eefa1	8340	Črnomelj
00050000-55a8-e19f-e7ab-e18a6e33aabc	6271	Dekani
00050000-55a8-e19f-1757-1f2441e2a2c3	5210	Deskle
00050000-55a8-e19f-1d03-bd67e3c9fa47	2253	Destrnik
00050000-55a8-e19f-2aa6-f1715be200fa	6215	Divača
00050000-55a8-e19f-5fa2-9932b386916b	1233	Dob
00050000-55a8-e19f-90d9-5fc35eb8e0a5	3224	Dobje pri Planini
00050000-55a8-e19f-25c6-87e6ce10cd2d	8257	Dobova
00050000-55a8-e19f-d0a9-c0e1b81ca6ee	1423	Dobovec
00050000-55a8-e19f-5a34-4dc4c6dd9027	5263	Dobravlje
00050000-55a8-e19f-5397-1057e17f59c4	3204	Dobrna
00050000-55a8-e19f-292c-49b1133ea2d7	8211	Dobrnič
00050000-55a8-e19f-a519-0bab82cccb1a	1356	Dobrova
00050000-55a8-e19f-5e22-f08b9b152d97	9223	Dobrovnik/Dobronak 
00050000-55a8-e19f-294c-f2bc8b15af5c	5212	Dobrovo v Brdih
00050000-55a8-e19f-ea20-ef5cc04aab08	1431	Dol pri Hrastniku
00050000-55a8-e19f-be1d-090c4b040b81	1262	Dol pri Ljubljani
00050000-55a8-e19f-fe00-b80bcd96bc2e	1273	Dole pri Litiji
00050000-55a8-e19f-8db6-3e19225d92e8	1331	Dolenja vas
00050000-55a8-e19f-acec-741aa0b7a5e5	8350	Dolenjske Toplice
00050000-55a8-e19f-dc21-d0818d884760	1230	Domžale
00050000-55a8-e19f-3676-645c9c1813ca	2252	Dornava
00050000-55a8-e19f-e6e8-b9f0f86dd817	5294	Dornberk
00050000-55a8-e19f-659d-bbf6e3a03a31	1319	Draga
00050000-55a8-e19f-2a68-660347930e40	8343	Dragatuš
00050000-55a8-e19f-7a13-7d46791cb460	3222	Dramlje
00050000-55a8-e19f-084a-70708bbf881d	2370	Dravograd
00050000-55a8-e19f-04f8-20f352ca8250	4203	Duplje
00050000-55a8-e19f-488a-b5300db9693f	6221	Dutovlje
00050000-55a8-e19f-78b0-88a716bf4678	8361	Dvor
00050000-55a8-e19f-6e59-a88d8c3215dc	2343	Fala
00050000-55a8-e19f-eb0b-8d0dc8865fd2	9208	Fokovci
00050000-55a8-e19f-8c11-1ecb60225e26	2313	Fram
00050000-55a8-e19f-a238-7240cb3db7b6	3213	Frankolovo
00050000-55a8-e19f-9273-3240fd934780	1274	Gabrovka
00050000-55a8-e19f-d084-0fb6ada63413	8254	Globoko
00050000-55a8-e19f-723d-e22dd134abd8	5275	Godovič
00050000-55a8-e19f-8385-01bc8d6033ac	4204	Golnik
00050000-55a8-e19f-2e16-918d8f2582fa	3303	Gomilsko
00050000-55a8-e19f-69d3-5576bd4817ca	4224	Gorenja vas
00050000-55a8-e19f-9089-1d979162703a	3263	Gorica pri Slivnici
00050000-55a8-e19f-7050-211d2b185acf	2272	Gorišnica
00050000-55a8-e19f-2ad4-d9c713c1a809	9250	Gornja Radgona
00050000-55a8-e19f-3022-c7f7daf24c42	3342	Gornji Grad
00050000-55a8-e19f-cc92-2813cab370d8	4282	Gozd Martuljek
00050000-55a8-e19f-e572-35a4fed13523	6272	Gračišče
00050000-55a8-e19f-063b-1816fd3c2dfb	9264	Grad
00050000-55a8-e19f-5c74-001553085f28	8332	Gradac
00050000-55a8-e19f-2a2e-84caa5152155	1384	Grahovo
00050000-55a8-e19f-c284-9ce6a566d28c	5242	Grahovo ob Bači
00050000-55a8-e19f-a66d-69ba1d51a958	5251	Grgar
00050000-55a8-e19f-c0ba-5335acc9b89a	3302	Griže
00050000-55a8-e19f-5ad3-02bc6953cb5a	3231	Grobelno
00050000-55a8-e19f-885d-46a3513c5c70	1290	Grosuplje
00050000-55a8-e19f-51a8-34a13a0483bf	2288	Hajdina
00050000-55a8-e19f-e872-a5119ff3f20f	8362	Hinje
00050000-55a8-e19f-4ba9-9f86da358db0	2311	Hoče
00050000-55a8-e19f-3128-c91619de9390	9205	Hodoš/Hodos
00050000-55a8-e19f-6195-1cab0680abcf	1354	Horjul
00050000-55a8-e19f-caa5-fd27e32575a2	1372	Hotedršica
00050000-55a8-e19f-bf54-55a6b8df3d3a	1430	Hrastnik
00050000-55a8-e19f-33b7-542ee3418a52	6225	Hruševje
00050000-55a8-e19f-2bda-d40a8846360f	4276	Hrušica
00050000-55a8-e19f-cf6e-1ce8b476e032	5280	Idrija
00050000-55a8-e19f-2efc-cb8a00729510	1292	Ig
00050000-55a8-e19f-4963-483dc23de3d2	6250	Ilirska Bistrica
00050000-55a8-e19f-6a90-3664b90bd04a	6251	Ilirska Bistrica-Trnovo
00050000-55a8-e19f-a131-7da3f86fe43e	1295	Ivančna Gorica
00050000-55a8-e19f-3b78-650f769c2319	2259	Ivanjkovci
00050000-55a8-e19f-d63b-eb3ce344041f	1411	Izlake
00050000-55a8-e19f-f093-dbb32e1d72c4	6310	Izola/Isola
00050000-55a8-e19f-1485-15a8b056c156	2222	Jakobski Dol
00050000-55a8-e19f-164a-add8b3ff0c50	2221	Jarenina
00050000-55a8-e19f-6020-de23a1700b89	6254	Jelšane
00050000-55a8-e19f-246d-082254e4e226	4270	Jesenice
00050000-55a8-e19f-3e53-d10d19fb5799	8261	Jesenice na Dolenjskem
00050000-55a8-e19f-91d4-caf51cc1f953	3273	Jurklošter
00050000-55a8-e19f-5597-8d5e20d6a93d	2223	Jurovski Dol
00050000-55a8-e19f-5096-7f375b2635ce	2256	Juršinci
00050000-55a8-e19f-2d6e-9e08d055898c	5214	Kal nad Kanalom
00050000-55a8-e19f-9fdf-ee0ad56cc6c8	3233	Kalobje
00050000-55a8-e19f-7d4d-6b6ae7d6ca49	4246	Kamna Gorica
00050000-55a8-e19f-978c-d36721e14245	2351	Kamnica
00050000-55a8-e19f-f2f8-497ce175c679	1241	Kamnik
00050000-55a8-e19f-ace4-b3193ecf4eca	5213	Kanal
00050000-55a8-e19f-91df-7e632f745381	8258	Kapele
00050000-55a8-e19f-7b58-610a66079ae2	2362	Kapla
00050000-55a8-e19f-85d2-cf79ca5c11c7	2325	Kidričevo
00050000-55a8-e19f-fb03-f46a3d5424cb	1412	Kisovec
00050000-55a8-e19f-74cf-27f515c8426c	6253	Knežak
00050000-55a8-e19f-5da5-32a04a8d9293	5222	Kobarid
00050000-55a8-e19f-546f-e3b7d9787c34	9227	Kobilje
00050000-55a8-e19f-91b4-6e47742ab28c	1330	Kočevje
00050000-55a8-e19f-ce02-9926b0d2aeb8	1338	Kočevska Reka
00050000-55a8-e19f-4426-8a36bccc5363	2276	Kog
00050000-55a8-e19f-8591-6019246489c1	5211	Kojsko
00050000-55a8-e19f-76bf-c798cdb87ee1	6223	Komen
00050000-55a8-e19f-5982-7a03c814ac37	1218	Komenda
00050000-55a8-e19f-29bb-16268f511c21	6000	Koper/Capodistria 
00050000-55a8-e19f-bbdf-abe5a3f5966d	6001	Koper/Capodistria - poštni predali
00050000-55a8-e19f-ece1-9eecb4a72e4b	8282	Koprivnica
00050000-55a8-e19f-5aad-c70a023348a6	5296	Kostanjevica na Krasu
00050000-55a8-e19f-8b72-8ea17ef1450c	8311	Kostanjevica na Krki
00050000-55a8-e19f-88ce-f54f4bee1a0f	1336	Kostel
00050000-55a8-e19f-1897-d75efe6571e2	6256	Košana
00050000-55a8-e19f-3186-c62f3d0a6cbe	2394	Kotlje
00050000-55a8-e19f-772e-613b318be7d8	6240	Kozina
00050000-55a8-e19f-5276-5bbb65be174f	3260	Kozje
00050000-55a8-e19f-5bbe-2e888724b254	4000	Kranj 
00050000-55a8-e19f-a00c-64ae36b20e54	4001	Kranj - poštni predali
00050000-55a8-e19f-f61c-c73ec7e5c926	4280	Kranjska Gora
00050000-55a8-e19f-17fd-e0a7d0f45b7a	1281	Kresnice
00050000-55a8-e19f-6aa8-1c948febbfee	4294	Križe
00050000-55a8-e19f-926b-bd8fb99b967e	9206	Križevci
00050000-55a8-e19f-e2b1-89e2c6ebefab	9242	Križevci pri Ljutomeru
00050000-55a8-e19f-1576-29208fbf7247	1301	Krka
00050000-55a8-e19f-377e-8858654c57bc	8296	Krmelj
00050000-55a8-e19f-02be-9995a10659ec	4245	Kropa
00050000-55a8-e19f-9c27-c4b93b4d4a1a	8262	Krška vas
00050000-55a8-e19f-8a7b-c3a1127184ad	8270	Krško
00050000-55a8-e19f-3e71-8ec9472d8ea8	9263	Kuzma
00050000-55a8-e19f-a105-079240a11bc9	2318	Laporje
00050000-55a8-e19f-8e38-a0d7303d7ebf	3270	Laško
00050000-55a8-e19f-c5ab-f030deff3890	1219	Laze v Tuhinju
00050000-55a8-e19f-96e2-7ca93cabbfb1	2230	Lenart v Slovenskih goricah
00050000-55a8-e19f-f328-8f341c1391fb	9220	Lendava/Lendva
00050000-55a8-e19f-83eb-12bdf64c3e11	4248	Lesce
00050000-55a8-e19f-64c7-857ecee607d1	3261	Lesično
00050000-55a8-e19f-71ea-43675d490278	8273	Leskovec pri Krškem
00050000-55a8-e19f-79a9-a53f331cdbf9	2372	Libeliče
00050000-55a8-e19f-cd1b-7637fdc7b43a	2341	Limbuš
00050000-55a8-e19f-65fb-ede8213d6ecd	1270	Litija
00050000-55a8-e19f-c806-9ebcec994f28	3202	Ljubečna
00050000-55a8-e19f-600c-45b4165bff4b	1000	Ljubljana 
00050000-55a8-e19f-0453-414b8e7d8771	1001	Ljubljana - poštni predali
00050000-55a8-e19f-896d-2cc3005b627e	1231	Ljubljana - Črnuče
00050000-55a8-e19f-d2f5-d1f5c98a8979	1261	Ljubljana - Dobrunje
00050000-55a8-e19f-f251-280a039e8c31	1260	Ljubljana - Polje
00050000-55a8-e19f-ec13-91f94a82bfdc	1210	Ljubljana - Šentvid
00050000-55a8-e19f-ef32-d9807637aa60	1211	Ljubljana - Šmartno
00050000-55a8-e19f-1da0-e29beaf05dca	3333	Ljubno ob Savinji
00050000-55a8-e19f-5b10-aca03a04a0ce	9240	Ljutomer
00050000-55a8-e19f-7464-6ddb4566c967	3215	Loče
00050000-55a8-e19f-87a5-933243034422	5231	Log pod Mangartom
00050000-55a8-e19f-565c-25ec28ac28d3	1358	Log pri Brezovici
00050000-55a8-e19f-61f8-2def50b9bf94	1370	Logatec
00050000-55a8-e19f-ecec-7655750006f0	1371	Logatec
00050000-55a8-e19f-e0ab-53f437a0f911	1434	Loka pri Zidanem Mostu
00050000-55a8-e19f-b3f5-407421080095	3223	Loka pri Žusmu
00050000-55a8-e19f-e8d7-daac25182393	6219	Lokev
00050000-55a8-e19f-2c5a-d33c4a24bce4	1318	Loški Potok
00050000-55a8-e19f-cbab-1abf7f8cb719	2324	Lovrenc na Dravskem polju
00050000-55a8-e19f-0cc7-7b24916e21a4	2344	Lovrenc na Pohorju
00050000-55a8-e19f-7cad-ccdf6a27e4af	3334	Luče
00050000-55a8-e19f-2903-1ffbad98a999	1225	Lukovica
00050000-55a8-e19f-ab05-db6b4e688f5a	9202	Mačkovci
00050000-55a8-e19f-b19f-7dad49c9fa75	2322	Majšperk
00050000-55a8-e19f-bc49-4c84ae3b3388	2321	Makole
00050000-55a8-e19f-f607-ba03c59d0223	9243	Mala Nedelja
00050000-55a8-e19f-e0bb-c97832264bb4	2229	Malečnik
00050000-55a8-e19f-f373-e0a45f1c99a3	6273	Marezige
00050000-55a8-e19f-2d6b-39d9f1299754	2000	Maribor 
00050000-55a8-e19f-fe8d-ac867aa6cc8d	2001	Maribor - poštni predali
00050000-55a8-e19f-47e4-83510d10ace5	2206	Marjeta na Dravskem polju
00050000-55a8-e19f-20ab-58342d53bee7	2281	Markovci
00050000-55a8-e19f-39d3-1fa256c07481	9221	Martjanci
00050000-55a8-e19f-fb6f-6705d6d4a873	6242	Materija
00050000-55a8-e19f-2b17-2908abb994bd	4211	Mavčiče
00050000-55a8-e19f-80b1-f0d3ef2a7d58	1215	Medvode
00050000-55a8-e19f-bbf7-1c722cef4c9d	1234	Mengeš
00050000-55a8-e19f-eefe-fb2d38336dcc	8330	Metlika
00050000-55a8-e19f-f1b7-6f3989de570f	2392	Mežica
00050000-55a8-e19f-a5cd-9a2efb9f23df	2204	Miklavž na Dravskem polju
00050000-55a8-e19f-ab24-c9eb838b8ec0	2275	Miklavž pri Ormožu
00050000-55a8-e19f-9844-11c5d6aa7a8c	5291	Miren
00050000-55a8-e19f-00f5-d2d3803c3fe8	8233	Mirna
00050000-55a8-e19f-3a42-d0622cd8d226	8216	Mirna Peč
00050000-55a8-e19f-856d-a9cc7e23bfb3	2382	Mislinja
00050000-55a8-e19f-b481-5e9af53d3c8b	4281	Mojstrana
00050000-55a8-e19f-9e8f-0e5a0383e4cc	8230	Mokronog
00050000-55a8-e19f-a413-02b67c6bf239	1251	Moravče
00050000-55a8-e19f-45da-6950c5836ad6	9226	Moravske Toplice
00050000-55a8-e19f-0c2a-e1b56fecc77b	5216	Most na Soči
00050000-55a8-e19f-c775-df72cf780cc7	1221	Motnik
00050000-55a8-e19f-8c68-5e286088da21	3330	Mozirje
00050000-55a8-e19f-74b1-caa9cc975907	9000	Murska Sobota 
00050000-55a8-e19f-f43e-94e194796d84	9001	Murska Sobota - poštni predali
00050000-55a8-e19f-ddfe-ff4b81e13fad	2366	Muta
00050000-55a8-e19f-b0f4-1833423cd852	4202	Naklo
00050000-55a8-e19f-2a77-7479e255e95e	3331	Nazarje
00050000-55a8-e19f-984b-a89b3fbb817d	1357	Notranje Gorice
00050000-55a8-e19f-cc61-fd16602664f9	3203	Nova Cerkev
00050000-55a8-e19f-2dcc-a0138ad89a0e	5000	Nova Gorica 
00050000-55a8-e19f-0970-4566519107f1	5001	Nova Gorica - poštni predali
00050000-55a8-e19f-30f3-e85bf5beae24	1385	Nova vas
00050000-55a8-e19f-73b0-e5d2e63de5f0	8000	Novo mesto
00050000-55a8-e19f-8594-5ef917ca3fb0	8001	Novo mesto - poštni predali
00050000-55a8-e19f-ca0f-645a9a6e8b04	6243	Obrov
00050000-55a8-e19f-731c-e3b5e0bb1bb1	9233	Odranci
00050000-55a8-e19f-218c-59cee6f5075b	2317	Oplotnica
00050000-55a8-e19f-098d-8704b47fde25	2312	Orehova vas
00050000-55a8-e19f-7bb7-c185961afb49	2270	Ormož
00050000-55a8-e19f-cbe6-19f5ad01ac1a	1316	Ortnek
00050000-55a8-e19f-792c-614f07b12bea	1337	Osilnica
00050000-55a8-e19f-f3b7-bf6c2132bd66	8222	Otočec
00050000-55a8-e19f-6431-579f2e281143	2361	Ožbalt
00050000-55a8-e19f-3ce1-f3647af2e425	2231	Pernica
00050000-55a8-e19f-9062-1a37ee55b5b9	2211	Pesnica pri Mariboru
00050000-55a8-e19f-9291-8a45a06053b8	9203	Petrovci
00050000-55a8-e19f-2d77-dcbbdc692e13	3301	Petrovče
00050000-55a8-e19f-b564-11722e3eb62e	6330	Piran/Pirano
00050000-55a8-e19f-e638-964ce2a3abeb	8255	Pišece
00050000-55a8-e19f-4858-58cec20c407e	6257	Pivka
00050000-55a8-e19f-30b3-a5c26041186f	6232	Planina
00050000-55a8-e19f-feda-5333b7b50501	3225	Planina pri Sevnici
00050000-55a8-e19f-1739-1b6e95b0af5c	6276	Pobegi
00050000-55a8-e19f-8a34-2699833f4c95	8312	Podbočje
00050000-55a8-e19f-23d0-21704ee421ab	5243	Podbrdo
00050000-55a8-e19f-a20b-840297e62899	3254	Podčetrtek
00050000-55a8-e19f-f7e7-87cf6b4b5cf8	2273	Podgorci
00050000-55a8-e19f-4e54-d01a37f08d4b	6216	Podgorje
00050000-55a8-e19f-c7b3-f782be9e327c	2381	Podgorje pri Slovenj Gradcu
00050000-55a8-e19f-f0b6-707760f445d8	6244	Podgrad
00050000-55a8-e19f-1d32-3cf0a2babc30	1414	Podkum
00050000-55a8-e19f-0354-94255ccad10b	2286	Podlehnik
00050000-55a8-e19f-c358-6065629020a1	5272	Podnanos
00050000-55a8-e19f-1eb3-92ff9dcdb912	4244	Podnart
00050000-55a8-e19f-4857-7088397e55fe	3241	Podplat
00050000-55a8-e19f-f525-f8a94d966d2a	3257	Podsreda
00050000-55a8-e19f-20d6-f2513d341cf7	2363	Podvelka
00050000-55a8-e19f-cd4c-757f66b76797	2208	Pohorje
00050000-55a8-e19f-f8ee-3ffb1dad9c1d	2257	Polenšak
00050000-55a8-e19f-53ab-cf036e9f9649	1355	Polhov Gradec
00050000-55a8-e19f-274b-87e645907d66	4223	Poljane nad Škofjo Loko
00050000-55a8-e19f-854d-773f4a8cbe89	2319	Poljčane
00050000-55a8-e19f-5dee-7dd4f952d429	1272	Polšnik
00050000-55a8-e19f-c209-1b3c79f0166e	3313	Polzela
00050000-55a8-e19f-d841-c5faa400fba5	3232	Ponikva
00050000-55a8-e19f-d484-6f88bd9385c1	6320	Portorož/Portorose
00050000-55a8-e19f-0e5b-3a4871dd0ebf	6230	Postojna
00050000-55a8-e19f-0689-b293ee8c84f0	2331	Pragersko
00050000-55a8-e19f-df6b-890f54e257b9	3312	Prebold
00050000-55a8-e19f-27cd-81e0015f4697	4205	Preddvor
00050000-55a8-e19f-e3d7-c54706b1401f	6255	Prem
00050000-55a8-e19f-c2f0-2242276577f3	1352	Preserje
00050000-55a8-e19f-d9f5-739c1516f9c3	6258	Prestranek
00050000-55a8-e19f-9a94-963225dd0cfb	2391	Prevalje
00050000-55a8-e19f-653a-83fd82c438a4	3262	Prevorje
00050000-55a8-e19f-07a0-329835e7df99	1276	Primskovo 
00050000-55a8-e19f-d8cb-fb128a134762	3253	Pristava pri Mestinju
00050000-55a8-e19f-cbbb-10e3aed24986	9207	Prosenjakovci/Partosfalva
00050000-55a8-e19f-dace-12a175fdbb5c	5297	Prvačina
00050000-55a8-e19f-b686-c1450097bde5	2250	Ptuj
00050000-55a8-e19f-1deb-d8c4972a2440	2323	Ptujska Gora
00050000-55a8-e19f-0ca0-1b5421444092	9201	Puconci
00050000-55a8-e19f-724d-a3a6a186735f	2327	Rače
00050000-55a8-e19f-34d7-dcca2ae63527	1433	Radeče
00050000-55a8-e19f-ed27-61bf329885cf	9252	Radenci
00050000-55a8-e19f-be52-be4e33271033	2360	Radlje ob Dravi
00050000-55a8-e19f-9da1-ccc1a47e462c	1235	Radomlje
00050000-55a8-e19f-3efc-94fad3d3fd29	4240	Radovljica
00050000-55a8-e19f-336a-5fa4eab3ffbd	8274	Raka
00050000-55a8-e19f-79d5-aac9427323e3	1381	Rakek
00050000-55a8-e19f-9263-15204677f990	4283	Rateče - Planica
00050000-55a8-e19f-cb8f-bcc657fd0bd9	2390	Ravne na Koroškem
00050000-55a8-e19f-fbaa-a9d207cdf324	9246	Razkrižje
00050000-55a8-e19f-6b33-f51f785f81f0	3332	Rečica ob Savinji
00050000-55a8-e19f-7383-ded7fe45a7c0	5292	Renče
00050000-55a8-e19f-24d8-5946a8ee6c73	1310	Ribnica
00050000-55a8-e19f-ff4e-aeb3582b52cc	2364	Ribnica na Pohorju
00050000-55a8-e19f-c085-c6e689f82e64	3272	Rimske Toplice
00050000-55a8-e19f-e4fb-1a2a432a90a5	1314	Rob
00050000-55a8-e19f-81aa-170578a00f6d	5215	Ročinj
00050000-55a8-e19f-1c23-cb62495ed6f0	3250	Rogaška Slatina
00050000-55a8-e19f-4b48-3fe9742615a6	9262	Rogašovci
00050000-55a8-e19f-7d4c-5bca84ea4803	3252	Rogatec
00050000-55a8-e19f-e227-7433e8b18146	1373	Rovte
00050000-55a8-e19f-0c81-9bf834004258	2342	Ruše
00050000-55a8-e19f-dc47-1be8db3178f8	1282	Sava
00050000-55a8-e19f-2f9b-28d607f526d3	6333	Sečovlje/Sicciole
00050000-55a8-e19f-2555-23c0050e1d7c	4227	Selca
00050000-55a8-e19f-2fa1-b5bb65a617b8	2352	Selnica ob Dravi
00050000-55a8-e19f-c6ce-e7d8a0f3d97b	8333	Semič
00050000-55a8-e19f-9065-0612e12c6019	8281	Senovo
00050000-55a8-e19f-8f3e-c0efb0bdedab	6224	Senožeče
00050000-55a8-e19f-eb8d-bfe09be6f976	8290	Sevnica
00050000-55a8-e19f-d190-3fc02ffd6062	6210	Sežana
00050000-55a8-e19f-053c-241fceaa9030	2214	Sladki Vrh
00050000-55a8-e19f-74cc-c16613ec971b	5283	Slap ob Idrijci
00050000-55a8-e19f-8788-5332a79c9874	2380	Slovenj Gradec
00050000-55a8-e19f-acc2-ff99db5bdf16	2310	Slovenska Bistrica
00050000-55a8-e19f-c93e-4db66e0adac1	3210	Slovenske Konjice
00050000-55a8-e19f-726e-b4eca4daf3cb	1216	Smlednik
00050000-55a8-e19f-b5e5-0d6d80eefdc1	5232	Soča
00050000-55a8-e19f-f81e-71607bb642e8	1317	Sodražica
00050000-55a8-e19f-0449-e0945036051b	3335	Solčava
00050000-55a8-e19f-35a2-b99f5dbade1c	5250	Solkan
00050000-55a8-e19f-2e24-96553f033134	4229	Sorica
00050000-55a8-e19f-8508-78b07372f080	4225	Sovodenj
00050000-55a8-e19f-c5f2-c45a7a02f504	5281	Spodnja Idrija
00050000-55a8-e19f-4a11-b67a99565edf	2241	Spodnji Duplek
00050000-55a8-e19f-5d2a-3ce4f703ecfc	9245	Spodnji Ivanjci
00050000-55a8-e19f-25cb-d9397c6e2267	2277	Središče ob Dravi
00050000-55a8-e19f-eb45-53d062e59586	4267	Srednja vas v Bohinju
00050000-55a8-e19f-41a4-7960f58aa7ae	8256	Sromlje 
00050000-55a8-e19f-0b4f-f75fd0e4f3b6	5224	Srpenica
00050000-55a8-e19f-6989-8a3115712fbb	1242	Stahovica
00050000-55a8-e19f-d163-4ece48c9faba	1332	Stara Cerkev
00050000-55a8-e19f-c3a1-6e37df6dac4a	8342	Stari trg ob Kolpi
00050000-55a8-e19f-f560-f1246b03fa62	1386	Stari trg pri Ložu
00050000-55a8-e19f-a6f7-c4db2f5dcb39	2205	Starše
00050000-55a8-e19f-5ce9-9638f61bb689	2289	Stoperce
00050000-55a8-e19f-ab0b-abc62ce0edf1	8322	Stopiče
00050000-55a8-e19f-e303-10e9898c3f38	3206	Stranice
00050000-55a8-e19f-0698-3e74c40c5e4d	8351	Straža
00050000-55a8-e19f-250f-a3e9d7464aa2	1313	Struge
00050000-55a8-e19f-15f4-53629feedaf2	8293	Studenec
00050000-55a8-e19f-58d1-065be29b3e25	8331	Suhor
00050000-55a8-e19f-8632-3bd33525019c	2233	Sv. Ana v Slovenskih goricah
00050000-55a8-e19f-1137-01a00ba95564	2235	Sv. Trojica v Slovenskih goricah
00050000-55a8-e19f-a945-dba200a6bfb4	2353	Sveti Duh na Ostrem Vrhu
00050000-55a8-e19f-15eb-3e2e4da52caa	9244	Sveti Jurij ob Ščavnici
00050000-55a8-e19f-4e6c-85f0017f3a39	3264	Sveti Štefan
00050000-55a8-e19f-565f-a1fcd517b110	2258	Sveti Tomaž
00050000-55a8-e19f-c6ef-836faf07e71a	9204	Šalovci
00050000-55a8-e19f-fa19-90e9f29a7187	5261	Šempas
00050000-55a8-e19f-8d78-ad5af5c2e8c0	5290	Šempeter pri Gorici
00050000-55a8-e19f-4bdf-a4cedea343b0	3311	Šempeter v Savinjski dolini
00050000-55a8-e19f-6901-cd5622cc61e4	4208	Šenčur
00050000-55a8-e19f-111b-bc8b76c200ed	2212	Šentilj v Slovenskih goricah
00050000-55a8-e19f-88f3-3cb3ab9ea4c8	8297	Šentjanž
00050000-55a8-e19f-25c5-05725bfe7edd	2373	Šentjanž pri Dravogradu
00050000-55a8-e19f-cbdc-208b03967077	8310	Šentjernej
00050000-55a8-e19f-5f26-f5644d435408	3230	Šentjur
00050000-55a8-e19f-3422-286d7bb067d9	3271	Šentrupert
00050000-55a8-e19f-35b7-056f06cec326	8232	Šentrupert
00050000-55a8-e19f-f7df-fc8d3dcf2964	1296	Šentvid pri Stični
00050000-55a8-e19f-c78f-b59ccbc2bf0e	8275	Škocjan
00050000-55a8-e19f-ba24-79d1bbe45c67	6281	Škofije
00050000-55a8-e19f-3c26-c4ce899654a9	4220	Škofja Loka
00050000-55a8-e19f-541b-223e9439afbb	3211	Škofja vas
00050000-55a8-e19f-bff6-7095561c5f74	1291	Škofljica
00050000-55a8-e19f-a97f-9d4c6a76225b	6274	Šmarje
00050000-55a8-e19f-8e32-0b5709e44eec	1293	Šmarje - Sap
00050000-55a8-e19f-b3a3-a2536af36f2f	3240	Šmarje pri Jelšah
00050000-55a8-e19f-0e6b-fa87c18624c9	8220	Šmarješke Toplice
00050000-55a8-e19f-afc6-b181f8ddba9c	2315	Šmartno na Pohorju
00050000-55a8-e19f-c40e-0f36ad6bb9fc	3341	Šmartno ob Dreti
00050000-55a8-e19f-d4d5-24c7a57f497f	3327	Šmartno ob Paki
00050000-55a8-e19f-b58f-83d3892c662c	1275	Šmartno pri Litiji
00050000-55a8-e19f-71ef-0eb131e36c61	2383	Šmartno pri Slovenj Gradcu
00050000-55a8-e19f-e867-6b0a350b1fc6	3201	Šmartno v Rožni dolini
00050000-55a8-e19f-b87e-9057a84d468b	3325	Šoštanj
00050000-55a8-e19f-481a-f28e653b43f2	6222	Štanjel
00050000-55a8-e19f-2883-da901e90e7b0	3220	Štore
00050000-55a8-e19f-c8ff-023f034b6012	3304	Tabor
00050000-55a8-e19f-dca3-68ff80e9ca6d	3221	Teharje
00050000-55a8-e19f-d9fc-538154955e31	9251	Tišina
00050000-55a8-e19f-6693-e6e2c7c5fd67	5220	Tolmin
00050000-55a8-e19f-65b2-89e3e7d49aed	3326	Topolšica
00050000-55a8-e19f-8d34-84d959e0adae	2371	Trbonje
00050000-55a8-e19f-9271-9ccaf2375839	1420	Trbovlje
00050000-55a8-e19f-d305-ce018c894ad2	8231	Trebelno 
00050000-55a8-e19f-88c9-f093b9be0cd5	8210	Trebnje
00050000-55a8-e19f-bce1-9aaf703a15ce	5252	Trnovo pri Gorici
00050000-55a8-e19f-775c-250534c776b8	2254	Trnovska vas
00050000-55a8-e19f-8369-c2fb528a3d58	1222	Trojane
00050000-55a8-e19f-7d50-8fcc4a451af7	1236	Trzin
00050000-55a8-e19f-80ca-5a67bd6b9ad3	4290	Tržič
00050000-55a8-e19f-6402-3aaac70e69ec	8295	Tržišče
00050000-55a8-e19f-8deb-7f2614baf6c4	1311	Turjak
00050000-55a8-e19f-a894-b6505ccdae83	9224	Turnišče
00050000-55a8-e19f-bd60-aa3b34451171	8323	Uršna sela
00050000-55a8-e19f-bf93-15e0b5132a44	1252	Vače
00050000-55a8-e19f-39a7-7b157684bd4d	3320	Velenje 
00050000-55a8-e19f-4bca-423dbaee1aca	3322	Velenje - poštni predali
00050000-55a8-e19f-547b-916bba10dff5	8212	Velika Loka
00050000-55a8-e19f-b7b2-8d0e0ad8bef1	2274	Velika Nedelja
00050000-55a8-e19f-156e-f527b2afadcd	9225	Velika Polana
00050000-55a8-e19f-db65-5944033cac73	1315	Velike Lašče
00050000-55a8-e19f-67fa-71cf2185a3d9	8213	Veliki Gaber
00050000-55a8-e19f-45e5-fd7dd1695960	9241	Veržej
00050000-55a8-e19f-0e70-0e64efcad2e3	1312	Videm - Dobrepolje
00050000-55a8-e19f-66e3-4839026cc908	2284	Videm pri Ptuju
00050000-55a8-e19f-6d4b-3da2cd1a9f88	8344	Vinica
00050000-55a8-e19f-12f4-cb3649e238d5	5271	Vipava
00050000-55a8-e19f-1a0e-12a9056fa656	4212	Visoko
00050000-55a8-e19f-68ff-8865b53445d2	1294	Višnja Gora
00050000-55a8-e19f-2e73-2e20c459c5f8	3205	Vitanje
00050000-55a8-e19f-d17f-d2e38cd67915	2255	Vitomarci
00050000-55a8-e19f-6dd2-7c417c5e2c7c	1217	Vodice
00050000-55a8-e19f-ee55-c9e52f047b91	3212	Vojnik\t
00050000-55a8-e19f-3000-a3edb2398270	5293	Volčja Draga
00050000-55a8-e19f-985e-4f0f40d5a4a6	2232	Voličina
00050000-55a8-e19f-25bd-bcb648f8f5f8	3305	Vransko
00050000-55a8-e19f-04fc-a010d37ffcf4	6217	Vremski Britof
00050000-55a8-e19f-a402-510815ab8145	1360	Vrhnika
00050000-55a8-e19f-bf8d-6a29447ef2b5	2365	Vuhred
00050000-55a8-e19f-7cfa-0f8bb2131012	2367	Vuzenica
00050000-55a8-e19f-2d4d-acd55992b383	8292	Zabukovje 
00050000-55a8-e19f-9c4b-22f35448c64d	1410	Zagorje ob Savi
00050000-55a8-e19f-20fa-2c88b4a61038	1303	Zagradec
00050000-55a8-e19f-9d35-f9cab386b58b	2283	Zavrč
00050000-55a8-e19f-9dce-098069458faf	8272	Zdole 
00050000-55a8-e19f-0470-c336f5e997c7	4201	Zgornja Besnica
00050000-55a8-e19f-0003-3bbadbd77328	2242	Zgornja Korena
00050000-55a8-e19f-6c7a-37e3d747a306	2201	Zgornja Kungota
00050000-55a8-e19f-3c8b-b352d731d2a1	2316	Zgornja Ložnica
00050000-55a8-e19f-7dd5-a63d90ee2000	2314	Zgornja Polskava
00050000-55a8-e19f-b519-de1241182424	2213	Zgornja Velka
00050000-55a8-e19f-064e-d78bb647ba12	4247	Zgornje Gorje
00050000-55a8-e19f-0a1f-08e5f6f16262	4206	Zgornje Jezersko
00050000-55a8-e19f-078f-ff4a04f9dcc7	2285	Zgornji Leskovec
00050000-55a8-e19f-78aa-64ef8cf9a290	1432	Zidani Most
00050000-55a8-e19f-17d2-b9bfcbc55321	3214	Zreče
00050000-55a8-e19f-fcfa-6853d165db14	4209	Žabnica
00050000-55a8-e19f-2db9-7a4bc6a69e42	3310	Žalec
00050000-55a8-e19f-eb8b-2c47beca8286	4228	Železniki
00050000-55a8-e19f-309b-27f027ff6b4b	2287	Žetale
00050000-55a8-e19f-941f-e1fce8e08a0d	4226	Žiri
00050000-55a8-e19f-f677-288c40f27122	4274	Žirovnica
00050000-55a8-e19f-3970-d06ed7d3f0ee	8360	Žužemberk
\.


--
-- TOC entry 2887 (class 0 OID 10552716)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 10552527)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2875 (class 0 OID 10552605)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 10552728)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2912 (class 0 OID 10553030)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2913 (class 0 OID 10553041)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55a8-e1a1-aba1-a971cfe5c2b1	00080000-55a8-e1a1-3ed6-ecf867698db7	0900	AK
00190000-55a8-e1a1-1f10-10d6c7561c5f	00080000-55a8-e1a0-8791-23d693c97ccc	0987	AK
00190000-55a8-e1a1-81c6-01a4d4757fce	00080000-55a8-e1a0-ba61-cad68eff3333	0989	AK
00190000-55a8-e1a1-a69e-76d3b5a2d3ff	00080000-55a8-e1a0-21f1-4eef83b0fcfa	0986	AK
00190000-55a8-e1a1-a809-67cd20ba3311	00080000-55a8-e1a0-abdb-5690dfa52d47	0984	AK
00190000-55a8-e1a1-8262-46b64874d2e0	00080000-55a8-e1a0-964b-9684f41c6607	0983	AK
00190000-55a8-e1a1-b2bd-28a45fce3f9a	00080000-55a8-e1a0-1c41-a4657666b545	0982	AK
\.


--
-- TOC entry 2911 (class 0 OID 10553011)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt) FROM stdin;
00290000-55a8-e1a1-c82e-d5c5d910ef0b	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2856 (class 0 OID 7936450)
-- Dependencies: 175
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2854 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 10553049)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 10552757)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55a8-e1a0-f62f-ab33302b6d86	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55a8-e1a0-c9cd-a774bf405fa7	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55a8-e1a0-d429-f42bfa0aad1a	0003	Kazinska	t	84	Kazinska dvorana
00220000-55a8-e1a0-995e-5da678a22ee9	0004	Mali oder	t	24	Mali oder 
00220000-55a8-e1a0-8451-8c7c375d5e5a	0005	Komorni oder	t	15	Komorni oder
00220000-55a8-e1a0-4606-703b1fd5cb7f	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55a8-e1a0-d55f-274dc13b337e	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2885 (class 0 OID 10552701)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 10552691)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 10552876)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 10552825)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 10552399)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2894 (class 0 OID 10552767)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 10552437)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55a8-e19f-5306-26953364be88	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55a8-e19f-855e-4f68321313b6	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55a8-e19f-387f-c657d651c886	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55a8-e19f-f063-cac4ea95acfd	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55a8-e19f-cee6-60d6a2b209d6	planer	Planer dogodkov v koledarju	t
00020000-55a8-e19f-1dfa-a39f21666709	kadrovska	Kadrovska služba	t
00020000-55a8-e19f-8f8d-804d6fc8771c	arhivar	Ažuriranje arhivalij	t
00020000-55a8-e19f-d138-09f082e354d0	igralec	Igralec	t
00020000-55a8-e19f-a151-29084cad7df5	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55a8-e1a0-cce9-e036607521b1	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2860 (class 0 OID 10552421)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55a8-e19f-b1b1-cfdbc09dd0d4	00020000-55a8-e19f-387f-c657d651c886
00010000-55a8-e19f-c17a-7c66ad47e197	00020000-55a8-e19f-387f-c657d651c886
00010000-55a8-e1a1-ff36-aca30116381f	00020000-55a8-e1a0-cce9-e036607521b1
\.


--
-- TOC entry 2896 (class 0 OID 10552781)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2888 (class 0 OID 10552722)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 10552672)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 10553090)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55a8-e1a0-3f2e-a9abea1b4fe9	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55a8-e1a0-b17e-b150056e2cc6	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55a8-e1a0-88fc-161a6ba23647	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55a8-e1a0-b835-85cb4e5fae48	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55a8-e1a0-27be-e05dc7476a0e	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2918 (class 0 OID 10553082)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55a8-e1a0-2234-ed61454d0cfc	00230000-55a8-e1a0-b835-85cb4e5fae48	popa
00240000-55a8-e1a0-23b7-6195b8758d94	00230000-55a8-e1a0-b835-85cb4e5fae48	oseba
00240000-55a8-e1a0-8656-05bb267e1972	00230000-55a8-e1a0-b17e-b150056e2cc6	prostor
00240000-55a8-e1a0-6d7b-e60e981fc981	00230000-55a8-e1a0-b835-85cb4e5fae48	besedilo
00240000-55a8-e1a0-95be-0c48442c1bfb	00230000-55a8-e1a0-b835-85cb4e5fae48	uprizoritev
00240000-55a8-e1a0-3367-1fcfd3c6dc9d	00230000-55a8-e1a0-b835-85cb4e5fae48	funkcija
00240000-55a8-e1a0-913a-1a559516c859	00230000-55a8-e1a0-b835-85cb4e5fae48	tipfunkcije
00240000-55a8-e1a0-8aab-bcec268ead94	00230000-55a8-e1a0-b835-85cb4e5fae48	alternacija
00240000-55a8-e1a0-0117-19d49ba4420a	00230000-55a8-e1a0-3f2e-a9abea1b4fe9	pogodba
00240000-55a8-e1a0-01ee-4e4a41aa551c	00230000-55a8-e1a0-b835-85cb4e5fae48	zaposlitev
00240000-55a8-e1a0-18c1-51b68fbbfe1e	00230000-55a8-e1a0-3f2e-a9abea1b4fe9	programdela
\.


--
-- TOC entry 2917 (class 0 OID 10553077)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 10552835)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55a8-e1a1-b33f-2e2afeab6f13	000e0000-55a8-e1a1-680e-09374e16227d	00080000-55a8-e1a0-a423-d0f38f462618	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55a8-e1a1-ee93-57e53f05f870	000e0000-55a8-e1a1-680e-09374e16227d	00080000-55a8-e1a0-a423-d0f38f462618	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55a8-e1a1-5c2a-d2a6382bd799	000e0000-55a8-e1a1-680e-09374e16227d	00080000-55a8-e1a0-8cda-9daa6a81f104	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2867 (class 0 OID 10552499)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 10552678)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55a8-e1a1-3ad3-7c39de82f67e	00180000-55a8-e1a1-e95b-a6edabeadc0c	000c0000-55a8-e1a1-4ef5-7c78fb761fd7	00090000-55a8-e1a1-101a-8373efdc2e21	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a8-e1a1-b4b6-ef178c843b68	00180000-55a8-e1a1-e95b-a6edabeadc0c	000c0000-55a8-e1a1-47d2-3c2cc9b24944	00090000-55a8-e1a1-04b8-00b2f8a209d6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a8-e1a1-898d-6e5ce0289357	00180000-55a8-e1a1-e95b-a6edabeadc0c	000c0000-55a8-e1a1-3457-9f9ba70ee18d	00090000-55a8-e1a1-d0d9-6f756f0c33eb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a8-e1a1-4263-5eeb54d44828	00180000-55a8-e1a1-e95b-a6edabeadc0c	000c0000-55a8-e1a1-083c-2773ff5f2301	00090000-55a8-e1a1-26ee-0aa888b2b942	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a8-e1a1-3664-22c711f7955a	00180000-55a8-e1a1-e95b-a6edabeadc0c	000c0000-55a8-e1a1-c674-df1451528380	00090000-55a8-e1a1-2679-9f6461a7ec97	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a8-e1a1-8863-69cd3d866ff3	00180000-55a8-e1a1-bcec-cd72432456b1	\N	00090000-55a8-e1a1-2679-9f6461a7ec97	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2903 (class 0 OID 10552865)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-55a8-e1a0-b5b0-21b80763c5cf	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-55a8-e1a0-19ee-74ef08e0d473	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-55a8-e1a0-0028-efe93f137c70	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-55a8-e1a0-4fcb-60f868855219	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-55a8-e1a0-f0fe-817eaddff495	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-55a8-e1a0-55e0-665d8782d886	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-55a8-e1a0-b24d-0e173664b4f3	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-55a8-e1a0-cdc9-01caf96915bc	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-55a8-e1a0-0d9d-4ad8d9c4486c	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-55a8-e1a0-79fe-0be245138235	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-55a8-e1a0-9fea-ede6f244c388	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-55a8-e1a0-7b60-ed16c1e42a44	Lektor	Lektorji	t	Lektorica	umetnik
000f0000-55a8-e1a0-9798-8b3e638ff02c	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-55a8-e1a0-e9a3-9687ea2451b2	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-55a8-e1a0-d21a-1b93455c8e11	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-55a8-e1a0-d8c7-1f4f37afe739	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2915 (class 0 OID 10553059)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55a8-e1a0-ffb9-2c3e63bc8624	01	Velika predstava	f	1.00	1.00
002b0000-55a8-e1a0-dcce-01c67d888025	02	Mala predstava	f	0.50	0.50
002b0000-55a8-e1a0-fb79-592bf1372733	03	Mala koprodukcija	t	0.40	1.00
002b0000-55a8-e1a0-1ad2-27f3b354d6b2	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55a8-e1a0-463e-cd438cdbe620	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2872 (class 0 OID 10552562)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2859 (class 0 OID 10552408)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55a8-e19f-c17a-7c66ad47e197	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROqf7I3KNi/0vEt6ZJ6lcDPydT8za6FcK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55a8-e1a0-e781-45f6427b2642	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55a8-e1a0-a854-d1c935c2c430	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55a8-e1a0-1ebd-8ea4f22d68db	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55a8-e1a1-6096-1e6fab140b4f	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55a8-e1a1-7b41-17f0ff1822af	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55a8-e1a1-b152-cb225f137052	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55a8-e1a1-f58c-9a098e14fe00	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55a8-e1a1-f846-3a06520ad336	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55a8-e1a1-c892-4152498e5f39	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55a8-e1a1-ff36-aca30116381f	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55a8-e19f-b1b1-cfdbc09dd0d4	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2907 (class 0 OID 10552913)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55a8-e1a1-4829-a65261472c79	00160000-55a8-e1a0-a726-d1871ad6223a	00150000-55a8-e1a0-be7b-e88a66b0ca96	00140000-55a8-e19f-791a-a0d2f5ca3227	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55a8-e1a0-8451-8c7c375d5e5a
000e0000-55a8-e1a1-680e-09374e16227d	00160000-55a8-e1a0-c2ec-ecf65c274680	00150000-55a8-e1a0-6808-f99fe2e4eba0	00140000-55a8-e19f-abb0-4b2a53b63a69	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55a8-e1a0-4606-703b1fd5cb7f
000e0000-55a8-e1a1-c10f-9d7ccd458c75	\N	00150000-55a8-e1a0-6808-f99fe2e4eba0	00140000-55a8-e19f-abb0-4b2a53b63a69	00190000-55a8-e1a1-1f10-10d6c7561c5f	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55a8-e1a0-8451-8c7c375d5e5a
000e0000-55a8-e1a1-3c59-5c59eaef256e	\N	00150000-55a8-e1a0-6808-f99fe2e4eba0	00140000-55a8-e19f-abb0-4b2a53b63a69	00190000-55a8-e1a1-1f10-10d6c7561c5f	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55a8-e1a0-8451-8c7c375d5e5a
000e0000-55a8-e1a1-3816-4e39cbdb4b5f	\N	00150000-55a8-e1a0-6808-f99fe2e4eba0	00140000-55a8-e19f-abb0-4b2a53b63a69	00190000-55a8-e1a1-1f10-10d6c7561c5f	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55a8-e1a0-f62f-ab33302b6d86
\.


--
-- TOC entry 2877 (class 0 OID 10552624)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55a8-e1a1-d762-1c005401a89f	000e0000-55a8-e1a1-680e-09374e16227d	1	
00200000-55a8-e1a1-78d5-705e48ccc3cc	000e0000-55a8-e1a1-680e-09374e16227d	2	
\.


--
-- TOC entry 2892 (class 0 OID 10552749)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 10552818)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55a8-e1a1-ed70-152288342273	00090000-55a8-e1a1-04b8-00b2f8a209d6	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55a8-e1a1-f2b7-2bfcd9d92d82	00090000-55a8-e1a1-d0d9-6f756f0c33eb	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55a8-e1a1-c970-9d0af92b1d79	00090000-55a8-e1a1-cfd6-773cc458bf47	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2879 (class 0 OID 10552656)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 10552903)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55a8-e19f-791a-a0d2f5ca3227	01	Drama	drama (SURS 01)
00140000-55a8-e19f-b1a6-db4acc863393	02	Opera	opera (SURS 02)
00140000-55a8-e19f-0d1a-7f5d964a4ba0	03	Balet	balet (SURS 03)
00140000-55a8-e19f-868e-4318820b9ee4	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55a8-e19f-e308-430371040556	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55a8-e19f-abb0-4b2a53b63a69	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55a8-e19f-d307-3938c8249779	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2898 (class 0 OID 10552808)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55a8-e1a0-4196-c92650a7f3ef	01	Opera	opera
00150000-55a8-e1a0-0aad-5f1a8718c3c0	02	Opereta	opereta
00150000-55a8-e1a0-d327-ea6e77a241e7	03	Balet	balet
00150000-55a8-e1a0-0bc6-74108ed6aa4f	04	Plesne prireditve	plesne prireditve
00150000-55a8-e1a0-aa5a-fd07f143d054	05	Lutkovno gledališče	lutkovno gledališče
00150000-55a8-e1a0-0622-c06059d514d2	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55a8-e1a0-1b6f-b26e2c6fb8e2	07	Biografska drama	biografska drama
00150000-55a8-e1a0-be7b-e88a66b0ca96	08	Komedija	komedija
00150000-55a8-e1a0-643c-a3d2204d51b6	09	Črna komedija	črna komedija
00150000-55a8-e1a0-ff70-14607153f1db	10	E-igra	E-igra
00150000-55a8-e1a0-6808-f99fe2e4eba0	11	Kriminalka	kriminalka
00150000-55a8-e1a0-8500-1611fda218b0	12	Musical	musical
\.


--
-- TOC entry 2445 (class 2606 OID 10552462)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 10552960)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 10552950)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 10552864)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 10552646)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 10552671)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 10553075)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 10552588)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 10553005)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 10552804)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 10552622)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 10552665)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 10552602)
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
-- TOC entry 2537 (class 2606 OID 10552714)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 10552741)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 10552560)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 10552471)
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
-- TOC entry 2452 (class 2606 OID 10552495)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 10552451)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2436 (class 2606 OID 10552436)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 10552747)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 10552780)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 10552898)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 10552524)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 10552548)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 10552720)
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
-- TOC entry 2467 (class 2606 OID 10552538)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 10552609)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 10552732)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 10553038)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 10553046)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 10553028)
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
-- TOC entry 2643 (class 2606 OID 10553057)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 10552764)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 10552705)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 10552696)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 10552886)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 10552832)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 10552407)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 10552771)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 10552425)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2438 (class 2606 OID 10552445)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 10552789)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 10552727)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 10552677)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 10553099)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 10553087)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 10553081)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 10552845)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 10552504)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 10552687)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 10552875)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 10553069)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 10552573)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 10552420)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 10552929)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 10552631)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 10552755)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 10552823)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 10552660)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 10552911)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 10552816)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 1259 OID 10552653)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2585 (class 1259 OID 10552846)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2586 (class 1259 OID 10552847)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2459 (class 1259 OID 10552526)
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
-- TOC entry 2550 (class 1259 OID 10552748)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2544 (class 1259 OID 10552734)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2545 (class 1259 OID 10552733)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2496 (class 1259 OID 10552632)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2572 (class 1259 OID 10552805)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2573 (class 1259 OID 10552807)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2574 (class 1259 OID 10552806)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2484 (class 1259 OID 10552604)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2485 (class 1259 OID 10552603)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2641 (class 1259 OID 10553058)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2595 (class 1259 OID 10552900)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2596 (class 1259 OID 10552901)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 10552902)
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
-- TOC entry 2604 (class 1259 OID 10552934)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2605 (class 1259 OID 10552931)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2606 (class 1259 OID 10552935)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2607 (class 1259 OID 10552933)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2608 (class 1259 OID 10552932)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2474 (class 1259 OID 10552575)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2475 (class 1259 OID 10552574)
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
-- TOC entry 2450 (class 1259 OID 10552498)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2560 (class 1259 OID 10552772)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2514 (class 1259 OID 10552666)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 10552452)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2441 (class 1259 OID 10552453)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2565 (class 1259 OID 10552792)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2566 (class 1259 OID 10552791)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2567 (class 1259 OID 10552790)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2488 (class 1259 OID 10552610)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2489 (class 1259 OID 10552612)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2490 (class 1259 OID 10552611)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2651 (class 1259 OID 10553089)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2524 (class 1259 OID 10552700)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2525 (class 1259 OID 10552698)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2526 (class 1259 OID 10552697)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2527 (class 1259 OID 10552699)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2431 (class 1259 OID 10552426)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2432 (class 1259 OID 10552427)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2553 (class 1259 OID 10552756)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2539 (class 1259 OID 10552721)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2581 (class 1259 OID 10552833)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2582 (class 1259 OID 10552834)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2625 (class 1259 OID 10553010)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2626 (class 1259 OID 10553009)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2627 (class 1259 OID 10553006)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2628 (class 1259 OID 10553007)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2629 (class 1259 OID 10553008)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2463 (class 1259 OID 10552540)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2464 (class 1259 OID 10552539)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2465 (class 1259 OID 10552541)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2424 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2633 (class 1259 OID 10553039)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2634 (class 1259 OID 10553040)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2618 (class 1259 OID 10552964)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2619 (class 1259 OID 10552962)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2620 (class 1259 OID 10552963)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2578 (class 1259 OID 10552824)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2530 (class 1259 OID 10552709)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2531 (class 1259 OID 10552708)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2532 (class 1259 OID 10552706)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2533 (class 1259 OID 10552707)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2402 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2614 (class 1259 OID 10552952)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2615 (class 1259 OID 10552951)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2630 (class 1259 OID 10553029)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2495 (class 1259 OID 10552623)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2648 (class 1259 OID 10553076)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2446 (class 1259 OID 10552473)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2447 (class 1259 OID 10552472)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2455 (class 1259 OID 10552505)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2456 (class 1259 OID 10552506)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2519 (class 1259 OID 10552690)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 10552689)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2521 (class 1259 OID 10552688)
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
-- TOC entry 2502 (class 1259 OID 10552655)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2503 (class 1259 OID 10552651)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2504 (class 1259 OID 10552648)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2505 (class 1259 OID 10552649)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2506 (class 1259 OID 10552647)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2507 (class 1259 OID 10552652)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2508 (class 1259 OID 10552650)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2462 (class 1259 OID 10552525)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2480 (class 1259 OID 10552589)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 10552591)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2482 (class 1259 OID 10552590)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2483 (class 1259 OID 10552592)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2538 (class 1259 OID 10552715)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2600 (class 1259 OID 10552899)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2609 (class 1259 OID 10552930)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2453 (class 1259 OID 10552496)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2454 (class 1259 OID 10552497)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 10552817)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2657 (class 1259 OID 10553100)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2473 (class 1259 OID 10552561)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2654 (class 1259 OID 10553088)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2558 (class 1259 OID 10552766)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2559 (class 1259 OID 10552765)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 10552961)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 10552965)
-- Name: uniq_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2405 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2470 (class 1259 OID 10552549)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 10552912)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2639 (class 1259 OID 10553047)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 10553048)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2439 (class 1259 OID 10552446)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2509 (class 1259 OID 10552654)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2683 (class 2606 OID 10553236)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2686 (class 2606 OID 10553221)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2685 (class 2606 OID 10553226)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2681 (class 2606 OID 10553246)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2687 (class 2606 OID 10553216)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2682 (class 2606 OID 10553241)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2684 (class 2606 OID 10553231)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2717 (class 2606 OID 10553391)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2716 (class 2606 OID 10553396)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2668 (class 2606 OID 10553151)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2704 (class 2606 OID 10553331)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2702 (class 2606 OID 10553326)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2703 (class 2606 OID 10553321)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2680 (class 2606 OID 10553211)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2712 (class 2606 OID 10553361)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2710 (class 2606 OID 10553371)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2711 (class 2606 OID 10553366)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2674 (class 2606 OID 10553186)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2675 (class 2606 OID 10553181)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2700 (class 2606 OID 10553311)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2741 (class 2606 OID 10553516)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2720 (class 2606 OID 10553401)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2719 (class 2606 OID 10553406)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2718 (class 2606 OID 10553411)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2722 (class 2606 OID 10553431)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2725 (class 2606 OID 10553416)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2721 (class 2606 OID 10553436)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2723 (class 2606 OID 10553426)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2724 (class 2606 OID 10553421)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2672 (class 2606 OID 10553176)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2673 (class 2606 OID 10553171)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2664 (class 2606 OID 10553136)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2665 (class 2606 OID 10553131)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2706 (class 2606 OID 10553341)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2688 (class 2606 OID 10553251)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2661 (class 2606 OID 10553111)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2660 (class 2606 OID 10553116)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2707 (class 2606 OID 10553356)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2708 (class 2606 OID 10553351)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2709 (class 2606 OID 10553346)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2678 (class 2606 OID 10553191)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2676 (class 2606 OID 10553201)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2677 (class 2606 OID 10553196)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2743 (class 2606 OID 10553526)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2692 (class 2606 OID 10553286)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2694 (class 2606 OID 10553276)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2695 (class 2606 OID 10553271)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2693 (class 2606 OID 10553281)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2659 (class 2606 OID 10553101)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2658 (class 2606 OID 10553106)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2705 (class 2606 OID 10553336)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2701 (class 2606 OID 10553316)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2715 (class 2606 OID 10553381)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2714 (class 2606 OID 10553386)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2732 (class 2606 OID 10553491)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2733 (class 2606 OID 10553486)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2736 (class 2606 OID 10553471)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2735 (class 2606 OID 10553476)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2734 (class 2606 OID 10553481)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2670 (class 2606 OID 10553161)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2671 (class 2606 OID 10553156)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2669 (class 2606 OID 10553166)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2739 (class 2606 OID 10553501)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2738 (class 2606 OID 10553506)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2729 (class 2606 OID 10553461)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2728 (class 2606 OID 10553466)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2731 (class 2606 OID 10553451)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2730 (class 2606 OID 10553456)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2713 (class 2606 OID 10553376)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2696 (class 2606 OID 10553306)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2697 (class 2606 OID 10553301)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2699 (class 2606 OID 10553291)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2698 (class 2606 OID 10553296)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2726 (class 2606 OID 10553446)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2727 (class 2606 OID 10553441)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2737 (class 2606 OID 10553496)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2679 (class 2606 OID 10553206)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2740 (class 2606 OID 10553511)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2742 (class 2606 OID 10553521)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2662 (class 2606 OID 10553126)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2663 (class 2606 OID 10553121)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2667 (class 2606 OID 10553141)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2666 (class 2606 OID 10553146)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2689 (class 2606 OID 10553266)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2690 (class 2606 OID 10553261)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2691 (class 2606 OID 10553256)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-17 13:06:10 CEST

--
-- PostgreSQL database dump complete
--

