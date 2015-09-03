--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-03 15:45:56 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 241 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2982 (class 0 OID 0)
-- Dependencies: 241
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 178 (class 1259 OID 17248589)
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
-- TOC entry 223 (class 1259 OID 17249103)
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
-- TOC entry 222 (class 1259 OID 17249086)
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
-- TOC entry 216 (class 1259 OID 17248996)
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
-- TOC entry 239 (class 1259 OID 17249352)
-- Name: datoteka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE datoteka (
    id uuid NOT NULL,
    owner_id uuid,
    filename character varying(255) DEFAULT NULL::character varying,
    transfers integer NOT NULL,
    size integer,
    format character varying(255) DEFAULT NULL::character varying,
    hash uuid,
    createdat timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    uploadedat timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 192 (class 1259 OID 17248767)
-- Name: dogodek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodek (
    id uuid NOT NULL,
    predstava_id uuid,
    zasedenost_id uuid,
    vaja_id uuid,
    gostovanje_id uuid,
    dogodek_splosni_id uuid,
    prostor_id uuid,
    sezona_id uuid,
    planiranzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    allday boolean DEFAULT false NOT NULL,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status character varying(20) DEFAULT NULL::character varying,
    razred character varying(10) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 17248798)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 17249254)
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
-- TOC entry 187 (class 1259 OID 17248710)
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
-- TOC entry 224 (class 1259 OID 17249116)
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
    avtorskihonorarjisamoz numeric(15,2) DEFAULT 0::numeric NOT NULL,
    tantieme numeric(15,2) DEFAULT 0::numeric NOT NULL,
    avtorskepravice numeric(15,2) DEFAULT 0::numeric NOT NULL,
    materialni numeric(15,2) DEFAULT 0::numeric NOT NULL,
    imakoprodukcije boolean,
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
    obiskkopr integer DEFAULT 0 NOT NULL,
    obiskgost integer DEFAULT 0 NOT NULL,
    obiskzamejo integer DEFAULT 0 NOT NULL,
    obiskint integer DEFAULT 0 NOT NULL,
    obiskkoprint integer DEFAULT 0 NOT NULL,
    ponovidoma integer DEFAULT 0 NOT NULL,
    ponovikopr integer DEFAULT 0 NOT NULL,
    ponovizamejo integer DEFAULT 0 NOT NULL,
    ponovigost integer DEFAULT 0 NOT NULL,
    ponovikoprint integer DEFAULT 0 NOT NULL,
    ponoviint integer DEFAULT 0 NOT NULL,
    naziv character varying(50) DEFAULT NULL::character varying,
    kpe numeric(15,2) DEFAULT 0::numeric NOT NULL,
    sort integer,
    tipprogramskeenote_id uuid,
    tip character varying(20) NOT NULL,
    strosekodkpred numeric(15,2) DEFAULT 0::numeric,
    stroskiostali numeric(15,2) DEFAULT 0::numeric,
    krajgostovanja character varying(255) DEFAULT NULL::character varying,
    ustanova character varying(255) DEFAULT NULL::character varying,
    datumgostovanja date,
    transportnistroski numeric(15,2) DEFAULT NULL::numeric,
    dnevprvzad numeric(15,2) DEFAULT NULL::numeric,
    drzavagostovanja_id uuid,
    stpe integer DEFAULT 0,
    zvrst character varying(255) DEFAULT NULL::character varying,
    stpredstav integer,
    stokroglihmiz integer,
    stpredstavitev integer,
    stdelavnic integer,
    stdrugidogodki integer,
    stprodukcij integer,
    caspriprave character varying(255) DEFAULT NULL::character varying,
    casizvedbe character varying(255) DEFAULT NULL::character varying,
    prizorisca text,
    umetvodja character varying(255) DEFAULT NULL::character varying,
    programskotelo character varying(255) DEFAULT NULL::character varying,
    sttujihselektorjev integer
);


--
-- TOC entry 210 (class 1259 OID 17248931)
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
-- TOC entry 190 (class 1259 OID 17248746)
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
-- TOC entry 188 (class 1259 OID 17248727)
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
-- TOC entry 199 (class 1259 OID 17248845)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 237 (class 1259 OID 17249333)
-- Name: mapa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa (
    id uuid NOT NULL,
    lastnik_id uuid,
    parent_id uuid,
    ime character varying(200) NOT NULL,
    komentar text,
    caskreiranja timestamp(0) without time zone NOT NULL,
    casspremembe timestamp(0) without time zone NOT NULL,
    javnidostop character varying(20) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 238 (class 1259 OID 17249345)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 17249367)
-- Name: mapaacl; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapaacl (
    id uuid NOT NULL,
    mapa_id uuid,
    perm_id uuid,
    dostop character varying(20) NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 170 (class 1259 OID 16867877)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 17248870)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 185 (class 1259 OID 17248684)
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
-- TOC entry 179 (class 1259 OID 17248598)
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
-- TOC entry 180 (class 1259 OID 17248609)
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
-- TOC entry 175 (class 1259 OID 17248563)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 17248582)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 17248877)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 17248911)
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
-- TOC entry 219 (class 1259 OID 17249035)
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
-- TOC entry 182 (class 1259 OID 17248642)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    sifra character varying(4) NOT NULL,
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
-- TOC entry 184 (class 1259 OID 17248676)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 17248851)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 183 (class 1259 OID 17248661)
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
-- TOC entry 189 (class 1259 OID 17248739)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 202 (class 1259 OID 17248863)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 17249215)
-- Name: produkcijadelitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijadelitev (
    id uuid NOT NULL,
    koproducent_id uuid NOT NULL,
    odstotekfinanciranja numeric(15,2) DEFAULT NULL::numeric,
    delez numeric(15,2) DEFAULT NULL::numeric,
    maticnikop boolean NOT NULL,
    kpe numeric(15,2) DEFAULT 0::numeric NOT NULL,
    enotaprograma_id uuid
);


--
-- TOC entry 227 (class 1259 OID 17249225)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 17249171)
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
    stint integer,
    stfest integer,
    strazno integer,
    stizjem integer,
    stponprem integer,
    stponprej integer,
    stponprejvelikih integer,
    stponprejmalih integer,
    stponprejmalihkopr integer,
    stponprejsredkopr integer,
    stponprejvelikihkopr integer,
    stgostujo integer,
    vrps1 numeric(12,2) DEFAULT NULL::numeric,
    vrps1do numeric(12,2) DEFAULT NULL::numeric,
    vrps1mat numeric(12,2) DEFAULT NULL::numeric,
    vrps1gostovsz numeric(12,2) DEFAULT NULL::numeric,
    stizvnekomerc integer,
    stizvprem integer,
    stizvponprem integer,
    stizvponpremdoma integer,
    stizvponpremzamejo integer,
    stizvponpremgost integer,
    stizvponpremkopr integer,
    stizvponpremint integer,
    stizvponpremkoprint integer,
    stizvponprej integer,
    stizvponprejdoma integer,
    stizvponprejzamejo integer,
    stizvponprejgost integer,
    stizvponprejkopr integer,
    stizvponprejint integer,
    stizvponprejkoprint integer,
    stizvgostuj integer,
    stizvostalihnek integer,
    stizvgostovanjslo integer,
    stizvgostovanjzam integer,
    stizvgostovanjint integer,
    stobisknekom integer,
    stobisknekommat integer,
    stobisknekomgostslo integer,
    stobisknekomgostzam integer,
    stobisknekomgostint integer,
    stobiskprem integer,
    stobiskponprem integer,
    stobiskponpremdoma integer,
    stobiskponpremkopr integer,
    stobiskponpremkoprint integer,
    stobiskponpremgost integer,
    stobiskponpremzamejo integer,
    stobiskponpremint integer,
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
    sredstvaavt numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenoprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenoponprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenoponprej numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenogostujo numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenoint numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenofest numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenorazno numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenoizjem numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavniprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavniponprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavniponprej numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavnigostujo numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavniint numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavnifest numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavnirazno numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavniizjem numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugiviriprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugiviriponprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugiviriponprej numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugivirigostujo numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugiviriint numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugivirifest numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugivirirazno numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugiviriizjem numeric(12,2) DEFAULT NULL::numeric,
    sredstvaavtsamoz numeric(12,2) DEFAULT NULL::numeric
);


--
-- TOC entry 228 (class 1259 OID 17249233)
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
-- TOC entry 206 (class 1259 OID 17248892)
-- Name: prostor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prostor (
    id uuid NOT NULL,
    popa_id uuid,
    naslov_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    jeprizorisce boolean,
    seplanira boolean DEFAULT false NOT NULL,
    kapaciteta integer,
    opis text
);


--
-- TOC entry 198 (class 1259 OID 17248836)
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
-- TOC entry 197 (class 1259 OID 17248826)
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
-- TOC entry 218 (class 1259 OID 17249024)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 17248963)
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
-- TOC entry 172 (class 1259 OID 17248534)
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
-- TOC entry 171 (class 1259 OID 17248532)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 171
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 207 (class 1259 OID 17248905)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 176 (class 1259 OID 17248572)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 174 (class 1259 OID 17248556)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 17248919)
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
-- TOC entry 201 (class 1259 OID 17248857)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 17248803)
-- Name: sezona; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sezona (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    zacetek date,
    konec date,
    aktivna boolean
);


--
-- TOC entry 233 (class 1259 OID 17249274)
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
-- TOC entry 232 (class 1259 OID 17249266)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 17249261)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 17248973)
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
    sort integer,
    vrstastroska_id uuid
);


--
-- TOC entry 181 (class 1259 OID 17248634)
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
-- TOC entry 196 (class 1259 OID 17248813)
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
-- TOC entry 217 (class 1259 OID 17249013)
-- Name: tipfunkcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipfunkcije (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis text,
    imezenski character varying(255) DEFAULT NULL::character varying,
    podrocje character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 17249243)
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
-- TOC entry 186 (class 1259 OID 17248696)
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
-- TOC entry 173 (class 1259 OID 17248543)
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
-- TOC entry 221 (class 1259 OID 17249061)
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
    naslovizvirnika character varying(255) DEFAULT NULL::character varying,
    podnaslovizvirnika character varying(255) DEFAULT NULL::character varying,
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
    krstna boolean,
    prvaslovenska boolean,
    kratkinaslov character varying(255) DEFAULT NULL::character varying,
    maticnioder_id uuid
);


--
-- TOC entry 191 (class 1259 OID 17248757)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 17248884)
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
-- TOC entry 215 (class 1259 OID 17248987)
-- Name: vrstastroska; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vrstastroska (
    id uuid NOT NULL,
    skupina integer NOT NULL,
    podskupina integer,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 17249313)
-- Name: vrstazapisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vrstazapisa (
    id uuid NOT NULL,
    oznaka character varying(10) NOT NULL,
    naziv character varying(255) NOT NULL,
    aktiven boolean,
    znacka boolean,
    ikona character varying(255) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 234 (class 1259 OID 17249285)
-- Name: zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zapis (
    id uuid NOT NULL,
    vrsta_id uuid,
    datoteka_id uuid,
    mapa_id uuid,
    avtor_id uuid,
    zaklenil_id uuid,
    tip character varying(20) NOT NULL,
    zaklenjen boolean,
    datumzaklepanja timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    identifier character varying(20) DEFAULT NULL::character varying,
    subject character varying(255) DEFAULT NULL::character varying,
    title character varying(255) NOT NULL,
    description text,
    coverage character varying(255) DEFAULT NULL::character varying,
    creator character varying(255) DEFAULT NULL::character varying,
    language character varying(20) DEFAULT NULL::character varying,
    date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    publisher character varying(255) DEFAULT NULL::character varying,
    relation character varying(255) DEFAULT NULL::character varying,
    rights character varying(255) DEFAULT NULL::character varying,
    source character varying(255) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    standard character varying(255) DEFAULT NULL::character varying,
    lokacija character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 17249325)
-- Name: zapislastnik; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zapislastnik (
    id uuid NOT NULL,
    zapis_id uuid,
    lastnik uuid NOT NULL,
    classlastnika character varying(200) NOT NULL,
    datum timestamp(0) without time zone NOT NULL,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 212 (class 1259 OID 17248956)
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
-- TOC entry 193 (class 1259 OID 17248793)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 17249051)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 17248946)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 17248537)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2913 (class 0 OID 17248589)
-- Dependencies: 178
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 17249103)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55e8-4f13-270b-30aba620b590	000d0000-55e8-4f13-e003-b94c8b92d5a7	\N	00090000-55e8-4f12-da3c-91cafb7aca7c	000b0000-55e8-4f13-de84-5736f29d5f97	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55e8-4f13-08a4-2e57f13f1dfb	000d0000-55e8-4f13-050d-ae7d1acb02f4	00100000-55e8-4f13-2527-108a10ac9957	00090000-55e8-4f12-0436-166945f52b1e	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55e8-4f13-3e19-08332233c922	000d0000-55e8-4f13-b5a9-0e1256b0174d	00100000-55e8-4f13-8763-70f33381eb0d	00090000-55e8-4f12-0f0f-99128bd7f4eb	\N	0003	t	\N	2015-09-03	\N	2	t	\N	f	f
000c0000-55e8-4f13-ea86-4d07eb834d87	000d0000-55e8-4f13-f663-fbe9b840353a	\N	00090000-55e8-4f12-b9a0-3a18ec432020	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55e8-4f13-7a92-96553c1af7bc	000d0000-55e8-4f13-b833-12fec4f15942	\N	00090000-55e8-4f12-3bfd-9224435ef8ff	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55e8-4f13-6721-aa39dd59e389	000d0000-55e8-4f13-8822-60b96d8667ea	\N	00090000-55e8-4f12-2d9c-220fa798b69d	000b0000-55e8-4f13-25a3-e95a9ef820c1	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55e8-4f13-41e7-6138d3ccce99	000d0000-55e8-4f13-e2ca-0c4e0b6c3c45	00100000-55e8-4f13-8617-e42f50302d9c	00090000-55e8-4f12-6ad6-80a1f14ab0d2	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55e8-4f13-6af2-6ade1236d780	000d0000-55e8-4f13-6e56-90a06396f0ff	\N	00090000-55e8-4f12-06d2-e64ad608d521	000b0000-55e8-4f13-6c8f-4cfb532e1bc4	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55e8-4f13-247d-4bb8b3086934	000d0000-55e8-4f13-e2ca-0c4e0b6c3c45	00100000-55e8-4f13-2ee0-223e7f6068ea	00090000-55e8-4f12-09fa-baf88af8db7a	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55e8-4f13-2267-76d883206895	000d0000-55e8-4f13-e2ca-0c4e0b6c3c45	00100000-55e8-4f13-23d7-1d9d5904967c	00090000-55e8-4f12-e46d-c43a05b11d48	\N	0010	t	\N	2015-09-03	\N	16	f	\N	f	t
000c0000-55e8-4f13-c591-567e793624a9	000d0000-55e8-4f13-e2ca-0c4e0b6c3c45	00100000-55e8-4f13-f013-d2a1e7b7bcf7	00090000-55e8-4f12-2880-a89d5e242318	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
\.


--
-- TOC entry 2957 (class 0 OID 17249086)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 17248996)
-- Dependencies: 216
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55e8-4f12-c83a-5d7a356b94b9	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55e8-4f12-7384-2ec3df04e211	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55e8-4f12-3cbf-fbd2cd8faa25	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2974 (class 0 OID 17249352)
-- Dependencies: 239
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 17248767)
-- Dependencies: 192
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55e8-4f13-4f07-cbc44ea9a5c0	\N	\N	00200000-55e8-4f13-9a46-f17d8df1f410	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55e8-4f13-028d-6ca4b73bc711	\N	\N	00200000-55e8-4f13-5992-c80116de02d9	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55e8-4f13-4350-7d0a3c2f9adf	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55e8-4f13-7791-71bafedf269c	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55e8-4f13-5b9f-3182fe8df0ce	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2929 (class 0 OID 17248798)
-- Dependencies: 194
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 17249254)
-- Dependencies: 230
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2922 (class 0 OID 17248710)
-- Dependencies: 187
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55e8-4f11-8eda-0ada3b1dfd67	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55e8-4f11-4464-3aee09282669	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55e8-4f11-a316-c11bfd227979	AL	ALB	008	Albania 	Albanija	\N
00040000-55e8-4f11-9413-dc9a596b4997	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55e8-4f11-40fb-3fa3bd2e98da	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55e8-4f11-fca9-ec388aee760e	AD	AND	020	Andorra 	Andora	\N
00040000-55e8-4f11-03d9-7855b76ffee4	AO	AGO	024	Angola 	Angola	\N
00040000-55e8-4f11-0a35-904b8aaa456f	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55e8-4f11-e025-8ccac877c787	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55e8-4f11-ee7c-57070b76e7c7	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55e8-4f11-ab1b-da186a885dfe	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55e8-4f11-72f9-d276ccac5f14	AM	ARM	051	Armenia 	Armenija	\N
00040000-55e8-4f11-943f-c81b7dbc7955	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55e8-4f11-b800-62add649e8f9	AU	AUS	036	Australia 	Avstralija	\N
00040000-55e8-4f11-3aa9-da994184b44f	AT	AUT	040	Austria 	Avstrija	\N
00040000-55e8-4f11-fa7b-e3abbb1bde73	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55e8-4f11-9f6d-8ca667d48184	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55e8-4f11-87aa-8aa372cc2949	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55e8-4f11-a8ea-326567db1edc	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55e8-4f11-772f-79af06318604	BB	BRB	052	Barbados 	Barbados	\N
00040000-55e8-4f11-8093-0257d56f88e1	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55e8-4f11-54c0-ce0eda106190	BE	BEL	056	Belgium 	Belgija	\N
00040000-55e8-4f11-af57-3528073c68e5	BZ	BLZ	084	Belize 	Belize	\N
00040000-55e8-4f11-eecc-5181c193b188	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55e8-4f11-1f70-a0ed1514e40c	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55e8-4f11-63af-f39384de28a6	BT	BTN	064	Bhutan 	Butan	\N
00040000-55e8-4f11-7375-0a82ef79bd41	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55e8-4f11-a8d4-83b78e07d056	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55e8-4f11-e974-dd850516a9cc	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55e8-4f11-7826-44bff798087e	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55e8-4f11-e65d-eaabdf6728ec	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55e8-4f11-d375-0b2d93ecfa6c	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55e8-4f11-9a97-ba0fbdf3d6a9	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55e8-4f11-5320-0fa6220092b4	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55e8-4f11-24df-164cf04e09b0	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55e8-4f11-58a1-25a8e91d3af1	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55e8-4f11-ad8b-7fd2aeaba3ef	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55e8-4f11-5009-086fc4616b2b	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55e8-4f11-7a32-bcd5514966f9	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55e8-4f11-d9c2-8c61825b5b0b	CA	CAN	124	Canada 	Kanada	\N
00040000-55e8-4f11-e73e-6cb02909065c	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55e8-4f11-a975-cb57082eed39	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55e8-4f11-615e-7b6ebf3e4199	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55e8-4f11-ad73-9c61aabee9b7	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55e8-4f11-fa64-d053532094b3	CL	CHL	152	Chile 	Čile	\N
00040000-55e8-4f11-857b-3d1ab2fb2173	CN	CHN	156	China 	Kitajska	\N
00040000-55e8-4f11-db63-7c4d43c5684d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55e8-4f11-ed36-41139e992dd7	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55e8-4f11-0a1b-ea0d830c74cd	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55e8-4f11-f2ae-9fc650873376	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55e8-4f11-383c-5d3f3601821d	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55e8-4f11-44ad-b0c395252d7e	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55e8-4f11-726f-d07375b071ee	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55e8-4f11-484e-08903378c693	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55e8-4f11-62b2-5ac7b819c0ed	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55e8-4f11-69d3-89f694ae5b99	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55e8-4f11-2b86-29348c755996	CU	CUB	192	Cuba 	Kuba	\N
00040000-55e8-4f11-549f-ee0d9d8abe98	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55e8-4f11-b838-7e6eab825c80	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55e8-4f11-708f-a0d9b57a3d71	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55e8-4f11-4ecb-4ce0bc058900	DK	DNK	208	Denmark 	Danska	\N
00040000-55e8-4f11-3024-f72a0b964e55	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55e8-4f11-6b6f-29d196ad034e	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55e8-4f11-4bb7-9fce4653541a	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55e8-4f11-25c0-99571ce41dbf	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55e8-4f11-626d-02fd332e5e55	EG	EGY	818	Egypt 	Egipt	\N
00040000-55e8-4f11-aee8-4feb06a3bcb9	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55e8-4f11-c38b-7212f714f748	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55e8-4f11-9675-aa3386afc95a	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55e8-4f11-957b-a32bd2072379	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55e8-4f11-09e3-98e88c0edf53	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55e8-4f11-f518-dd4eb849a999	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55e8-4f11-b54c-3dbcea746f91	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55e8-4f11-0f0b-65f302c0d03b	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55e8-4f11-2563-7d014c6d1f94	FI	FIN	246	Finland 	Finska	\N
00040000-55e8-4f11-7daa-1973b169c01a	FR	FRA	250	France 	Francija	\N
00040000-55e8-4f11-4cec-c9b6998d4034	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55e8-4f11-9280-c1fb52bda044	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55e8-4f11-5d1c-17b0ca8c9707	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55e8-4f11-55dd-e0321775815e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55e8-4f11-c499-6751dd26df62	GA	GAB	266	Gabon 	Gabon	\N
00040000-55e8-4f11-c8bd-bcdb163cf816	GM	GMB	270	Gambia 	Gambija	\N
00040000-55e8-4f11-60e7-ec0494aa20fc	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55e8-4f11-1fae-818faeb32ebf	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55e8-4f11-e549-8c7c4d9b5be5	GH	GHA	288	Ghana 	Gana	\N
00040000-55e8-4f11-9f23-dd7ea57fff74	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55e8-4f11-086c-3ba2e9e4e809	GR	GRC	300	Greece 	Grčija	\N
00040000-55e8-4f11-9f26-8ff8e34dae4c	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55e8-4f11-5525-489209797a37	GD	GRD	308	Grenada 	Grenada	\N
00040000-55e8-4f11-e3de-03fef2d40b49	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55e8-4f11-1967-22a21627fb4f	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55e8-4f11-c232-3d68f40d37f8	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55e8-4f11-6ab4-c3a876548d1d	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55e8-4f11-8598-841e07ed87aa	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55e8-4f11-6899-79fb2c1f2794	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55e8-4f11-ef87-c0969b6255bf	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55e8-4f11-cf7a-06a0dad4a583	HT	HTI	332	Haiti 	Haiti	\N
00040000-55e8-4f11-c6db-7dc5497d1a12	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55e8-4f11-ac9f-4e76e119714f	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55e8-4f11-5d9f-0e10fed0f572	HN	HND	340	Honduras 	Honduras	\N
00040000-55e8-4f11-7127-3285b667a666	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55e8-4f11-2892-d81d730b3566	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55e8-4f11-e04c-cd0abeadeded	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55e8-4f11-9171-dd062f7a062c	IN	IND	356	India 	Indija	\N
00040000-55e8-4f11-aeab-5db56a32f775	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55e8-4f11-691e-ac0bb40fb733	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55e8-4f11-b82f-556e33572760	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55e8-4f11-aca8-7ad2e320a173	IE	IRL	372	Ireland 	Irska	\N
00040000-55e8-4f11-459f-40bb80294420	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55e8-4f11-8fd2-4e09768f27b1	IL	ISR	376	Israel 	Izrael	\N
00040000-55e8-4f11-275b-d873c205920f	IT	ITA	380	Italy 	Italija	\N
00040000-55e8-4f11-88f7-6d275a3c1050	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55e8-4f11-c664-b5c569abca5f	JP	JPN	392	Japan 	Japonska	\N
00040000-55e8-4f11-70ff-76b7b13a36fb	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55e8-4f11-4cc7-552164d3c5bb	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55e8-4f11-5a47-47fc93388c34	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55e8-4f11-87f5-994528f825d7	KE	KEN	404	Kenya 	Kenija	\N
00040000-55e8-4f11-6a3d-d5cb189b9a1b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55e8-4f11-96bb-b4d49b2cc417	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55e8-4f11-e86d-1269792770cc	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55e8-4f11-bbfc-5e95f6ab7bb2	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55e8-4f11-52f9-fb30353cdcf6	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55e8-4f11-96b1-3c01515cf01e	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55e8-4f11-e04a-cfa8bae31cca	LV	LVA	428	Latvia 	Latvija	\N
00040000-55e8-4f11-b77f-bf5f1cc081b6	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55e8-4f11-36e0-4ccca85f519f	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55e8-4f11-fb32-4568b6ca63ed	LR	LBR	430	Liberia 	Liberija	\N
00040000-55e8-4f11-ad68-099d657e0211	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55e8-4f11-e7a4-7604cdb314d2	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55e8-4f11-e1b0-1804568a825e	LT	LTU	440	Lithuania 	Litva	\N
00040000-55e8-4f11-1e11-27c4a470f7b8	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55e8-4f11-6547-e5394040772d	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55e8-4f11-c287-37cc66ac13a8	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55e8-4f11-16da-c0e5445890ae	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55e8-4f11-9d93-df6744edcc1e	MW	MWI	454	Malawi 	Malavi	\N
00040000-55e8-4f11-fc6c-963aa6a423fe	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55e8-4f11-d582-8db8945b1da5	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55e8-4f11-2309-5b40dd666443	ML	MLI	466	Mali 	Mali	\N
00040000-55e8-4f11-3917-e627d30d8b71	MT	MLT	470	Malta 	Malta	\N
00040000-55e8-4f11-db68-19d693d34708	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55e8-4f11-9d4e-2a15e996f5c1	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55e8-4f11-8759-760d594ffd30	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55e8-4f11-ae4f-49975c789a35	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55e8-4f11-d1dc-710250eae39d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55e8-4f11-fc86-56b15fb52160	MX	MEX	484	Mexico 	Mehika	\N
00040000-55e8-4f11-f178-a925a38fac5d	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55e8-4f11-3107-8acac65e3b57	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55e8-4f11-8728-cd4aa7026c81	MC	MCO	492	Monaco 	Monako	\N
00040000-55e8-4f11-3675-3bbd6e3f6faa	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55e8-4f11-e5a8-a4899ef3da77	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55e8-4f11-16a4-5e0b7df860e0	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55e8-4f11-5fd4-1642e36cf464	MA	MAR	504	Morocco 	Maroko	\N
00040000-55e8-4f11-6604-6906a36e6b15	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55e8-4f11-cf5b-bc4e6df5fe30	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55e8-4f11-9692-279a80bb208a	NA	NAM	516	Namibia 	Namibija	\N
00040000-55e8-4f11-06f0-6caf4852e7aa	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55e8-4f11-fb23-81dfa0abbd5a	NP	NPL	524	Nepal 	Nepal	\N
00040000-55e8-4f11-45e1-dff537ae408f	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55e8-4f11-d477-b7582adc5f47	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55e8-4f11-86b4-ccc6c3165cdb	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55e8-4f11-22fe-960f16120912	NE	NER	562	Niger 	Niger 	\N
00040000-55e8-4f11-5e07-ca159095799d	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55e8-4f11-ec25-a1cf00c5b6d8	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55e8-4f11-4e6e-965979ec4446	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55e8-4f11-8e24-7d709294fdb6	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55e8-4f11-dd6f-7c8d188d8fb3	NO	NOR	578	Norway 	Norveška	\N
00040000-55e8-4f11-738e-fe449e5562a4	OM	OMN	512	Oman 	Oman	\N
00040000-55e8-4f11-61aa-5d951321b18e	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55e8-4f11-4f64-4691e026a305	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55e8-4f11-196d-08c17971db8d	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55e8-4f11-7097-bd0ed392cbe8	PA	PAN	591	Panama 	Panama	\N
00040000-55e8-4f11-e39b-eb1efe7fd1e1	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55e8-4f11-cbaf-4733a7c4c021	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55e8-4f11-7178-bdf79a97d2da	PE	PER	604	Peru 	Peru	\N
00040000-55e8-4f11-36fc-2a5c318d5b6b	PH	PHL	608	Philippines 	Filipini	\N
00040000-55e8-4f11-e48a-e8c5bbd2bebe	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55e8-4f11-7504-644e4234411d	PL	POL	616	Poland 	Poljska	\N
00040000-55e8-4f11-766a-d881fe448481	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55e8-4f11-19ff-2cee7f3ec74b	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55e8-4f11-0f3c-55f219f0ffde	QA	QAT	634	Qatar 	Katar	\N
00040000-55e8-4f11-929f-e6dd065238ad	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55e8-4f11-11ee-667cc9055be1	RO	ROU	642	Romania 	Romunija	\N
00040000-55e8-4f11-065e-9b428cd0218d	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55e8-4f11-a79c-9d14753dde0e	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55e8-4f11-b5f3-8a5c29971938	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55e8-4f11-0113-6c8a449323fd	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55e8-4f11-ee6e-0026c1f4ef75	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55e8-4f11-d14b-ae3cfee52daf	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55e8-4f11-d39b-6146053fdd8d	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55e8-4f11-d584-4ecfcf699284	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55e8-4f11-c0d5-d25f28c88631	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55e8-4f11-e12c-5dc513e6eb11	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55e8-4f11-4a14-3193536ba9c4	SM	SMR	674	San Marino 	San Marino	\N
00040000-55e8-4f11-a85f-29a91f35ceb7	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55e8-4f11-339c-6b65f8dcdd90	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55e8-4f11-860c-67fb0f51a8ae	SN	SEN	686	Senegal 	Senegal	\N
00040000-55e8-4f11-0d85-c9a0f72c75d5	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55e8-4f11-bae8-a5def142723e	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55e8-4f11-f6d8-0925cf18b781	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55e8-4f11-c755-6983f17e3aac	SG	SGP	702	Singapore 	Singapur	\N
00040000-55e8-4f11-aae6-63b62e651467	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55e8-4f11-89a6-0e7cecbdac5e	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55e8-4f11-5e2a-26e2efe9a1fd	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55e8-4f11-b194-dea2d5a53501	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55e8-4f11-34ce-95a52e99df5c	SO	SOM	706	Somalia 	Somalija	\N
00040000-55e8-4f11-1ccc-70d6303327ed	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55e8-4f11-4894-1c03fbc944d6	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55e8-4f11-2aa0-b38916e7474c	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55e8-4f11-111a-1231ec7780bf	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55e8-4f11-d9ab-ae154829cf3b	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55e8-4f11-0e11-16eef4afa876	SD	SDN	729	Sudan 	Sudan	\N
00040000-55e8-4f11-df5e-799f8bf0b94c	SR	SUR	740	Suriname 	Surinam	\N
00040000-55e8-4f11-f9eb-8708858035a3	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55e8-4f11-7742-0bdc42db4caa	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55e8-4f11-17b6-d61e73073391	SE	SWE	752	Sweden 	Švedska	\N
00040000-55e8-4f11-e9d1-8814f1ead931	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55e8-4f11-c081-fcb18480580e	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55e8-4f11-1bca-9f9594a603a8	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55e8-4f11-821f-ab2573f28d94	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55e8-4f11-125f-21ad866fe14b	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55e8-4f11-514a-c30bb9f4806e	TH	THA	764	Thailand 	Tajska	\N
00040000-55e8-4f11-c6ed-27575909b016	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55e8-4f11-3b1e-cef1fc3f76d5	TG	TGO	768	Togo 	Togo	\N
00040000-55e8-4f11-d20b-a2764a17f7a1	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55e8-4f11-ec80-29cb7007337a	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55e8-4f11-1877-d4fdad87a296	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55e8-4f11-85a6-2932600e536d	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55e8-4f11-22ea-d1fa3b347f8d	TR	TUR	792	Turkey 	Turčija	\N
00040000-55e8-4f11-6e43-233ec31a01e4	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55e8-4f11-8afb-d68c7d731bca	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55e8-4f11-6a4f-9ba0b175c828	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55e8-4f11-47cf-2aed05c95f6a	UG	UGA	800	Uganda 	Uganda	\N
00040000-55e8-4f11-0e6e-b6f79e7b319d	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55e8-4f11-4896-2cf4ccbf7d90	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55e8-4f11-017f-f82d8095c53c	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55e8-4f11-9e0b-4abb2b4ed53f	US	USA	840	United States 	Združene države Amerike	\N
00040000-55e8-4f11-02eb-203fd6e7fd17	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55e8-4f11-23ec-80d8d5e36597	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55e8-4f11-774e-3d7bfd7a1034	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55e8-4f11-3c24-46ab0a44eee1	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55e8-4f11-1e3f-1c18fa677c14	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55e8-4f11-6d6b-405a6cc19426	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55e8-4f11-a5b8-e609fbeb9367	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55e8-4f11-ac5d-f5705f60ca7d	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55e8-4f11-bbf1-49770e5657e9	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55e8-4f11-7b71-074e60c42caa	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55e8-4f11-f30a-1265c975e42b	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55e8-4f11-9e78-f7edea09a3f4	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55e8-4f11-d059-fba043678301	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2959 (class 0 OID 17249116)
-- Dependencies: 224
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55e8-4f13-2c26-0ab7e46b13d0	000e0000-55e8-4f13-7e68-aded4f88e624	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e8-4f10-f847-fb59b19c7911	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55e8-4f13-1194-d02b3c3fd0b1	000e0000-55e8-4f13-8f8c-4398144905cb	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e8-4f10-8232-38d5996b6670	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55e8-4f13-b7b8-e531babaa7c4	000e0000-55e8-4f13-a452-e9078b4faa8b	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e8-4f10-f847-fb59b19c7911	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55e8-4f13-15bb-4949d5efcfae	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55e8-4f13-a29f-669ff574f2e7	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2945 (class 0 OID 17248931)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55e8-4f13-e003-b94c8b92d5a7	000e0000-55e8-4f13-8f8c-4398144905cb	000c0000-55e8-4f13-270b-30aba620b590	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55e8-4f11-7e7c-1aea3d9f37c4
000d0000-55e8-4f13-050d-ae7d1acb02f4	000e0000-55e8-4f13-8f8c-4398144905cb	000c0000-55e8-4f13-08a4-2e57f13f1dfb	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55e8-4f10-b473-1f570713bbed
000d0000-55e8-4f13-b5a9-0e1256b0174d	000e0000-55e8-4f13-8f8c-4398144905cb	000c0000-55e8-4f13-3e19-08332233c922	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55e8-4f11-9907-7f6a99af18be
000d0000-55e8-4f13-f663-fbe9b840353a	000e0000-55e8-4f13-8f8c-4398144905cb	000c0000-55e8-4f13-ea86-4d07eb834d87	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55e8-4f11-8dc5-0f3725416e55
000d0000-55e8-4f13-b833-12fec4f15942	000e0000-55e8-4f13-8f8c-4398144905cb	000c0000-55e8-4f13-7a92-96553c1af7bc	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55e8-4f11-8dc5-0f3725416e55
000d0000-55e8-4f13-8822-60b96d8667ea	000e0000-55e8-4f13-8f8c-4398144905cb	000c0000-55e8-4f13-6721-aa39dd59e389	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55e8-4f11-7e7c-1aea3d9f37c4
000d0000-55e8-4f13-e2ca-0c4e0b6c3c45	000e0000-55e8-4f13-8f8c-4398144905cb	000c0000-55e8-4f13-247d-4bb8b3086934	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55e8-4f11-7e7c-1aea3d9f37c4
000d0000-55e8-4f13-6e56-90a06396f0ff	000e0000-55e8-4f13-8f8c-4398144905cb	000c0000-55e8-4f13-6af2-6ade1236d780	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55e8-4f10-f6bf-1b0bfc406579
\.


--
-- TOC entry 2925 (class 0 OID 17248746)
-- Dependencies: 190
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2923 (class 0 OID 17248727)
-- Dependencies: 188
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55e8-4f13-2bf5-4f2ee2ba30e7	00080000-55e8-4f12-2e0a-48f79a5a5456	00090000-55e8-4f12-e46d-c43a05b11d48	AK		
\.


--
-- TOC entry 2934 (class 0 OID 17248845)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 17249333)
-- Dependencies: 237
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 17249345)
-- Dependencies: 238
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2975 (class 0 OID 17249367)
-- Dependencies: 240
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 16867877)
-- Dependencies: 170
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY migrations (version) FROM stdin;
20150824004401
20150826210511
20150827174118
20150831215248
\.


--
-- TOC entry 2938 (class 0 OID 17248870)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 17248684)
-- Dependencies: 185
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55e8-4f11-c915-472faaa8dda7	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55e8-4f11-ad03-91333f32822f	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55e8-4f11-2263-bc30b622ce1f	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55e8-4f11-29f9-1d4d8171f9f4	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55e8-4f11-1b77-70f46ae186ff	dogodek.status	array	a:7:{i:100;a:1:{s:5:"label";s:11:"Dolgoročno";}i:200;a:1:{s:5:"label";s:9:"Planirano";}i:300;a:1:{s:5:"label";s:8:"Fiksiran";}i:400;a:1:{s:5:"label";s:17:"Potrjen - interno";}i:500;a:1:{s:5:"label";s:15:"Potrjen - javno";}i:600;a:1:{s:5:"label";s:10:"Zaključen";}i:700;a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55e8-4f11-a328-d1f97a3cd3c1	dogodek.razred	array	a:5:{i:100;a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}i:200;a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}i:300;a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}i:400;a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}i:500;a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55e8-4f11-b591-c5bc86e9c225	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55e8-4f11-9b56-a65c80a43038	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55e8-4f11-b962-b7f19c441590	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55e8-4f11-8a0d-5e1d6a754e4b	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55e8-4f11-a36a-1b8801ace6ef	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55e8-4f11-7eab-72a9a36a4704	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55e8-4f11-b7fc-53a41552c884	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55e8-4f11-5672-5c1af5afe926	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55e8-4f12-4787-b5978d1e5527	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55e8-4f12-9765-1df0bd1fbd1f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55e8-4f12-f16a-2173dda13389	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55e8-4f12-3d01-22d576b0f511	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55e8-4f12-3d10-6cba7e1f37d8	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55e8-4f14-afdd-2cf819808f9a	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2914 (class 0 OID 17248598)
-- Dependencies: 179
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55e8-4f12-6bee-065eaf1d48e1	00000000-55e8-4f12-4787-b5978d1e5527	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55e8-4f12-afdb-622affee4170	00000000-55e8-4f12-4787-b5978d1e5527	00010000-55e8-4f11-32f8-57f449599b4a	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55e8-4f12-1a50-6eeae930bd42	00000000-55e8-4f12-9765-1df0bd1fbd1f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2915 (class 0 OID 17248609)
-- Dependencies: 180
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55e8-4f12-da3c-91cafb7aca7c	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55e8-4f12-b9a0-3a18ec432020	00010000-55e8-4f12-3413-7d9d8cd94559	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55e8-4f12-0f0f-99128bd7f4eb	00010000-55e8-4f12-6dc3-d4e3d44e6ae7	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55e8-4f12-09fa-baf88af8db7a	00010000-55e8-4f12-2185-bcb0dc259479	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55e8-4f12-6647-abe2c0bd973c	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55e8-4f12-2d9c-220fa798b69d	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55e8-4f12-2880-a89d5e242318	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55e8-4f12-6ad6-80a1f14ab0d2	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55e8-4f12-e46d-c43a05b11d48	00010000-55e8-4f12-3b27-2d6429fc3921	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55e8-4f12-0436-166945f52b1e	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55e8-4f12-0fbf-ae88ef8289e3	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55e8-4f12-3bfd-9224435ef8ff	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55e8-4f12-06d2-e64ad608d521	00010000-55e8-4f12-d525-279fcfabb106	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2910 (class 0 OID 17248563)
-- Dependencies: 175
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55e8-4f11-9e87-a3d4ca53cbfe	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55e8-4f11-1e9c-1650e79ed75b	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55e8-4f11-14dc-4b6215f9f2bc	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55e8-4f11-8e17-68a1879fef20	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55e8-4f11-8a82-fcd67afc83f0	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55e8-4f11-147e-13bdb3e55acc	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55e8-4f11-6e76-6d4c4d6b4b43	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55e8-4f11-6389-7684cdc82883	Abonma-read	Abonma - branje	f
00030000-55e8-4f11-f32c-ec16875942ac	Abonma-write	Abonma - spreminjanje	f
00030000-55e8-4f11-fbf1-6196eabd3c8f	Alternacija-read	Alternacija - branje	f
00030000-55e8-4f11-161b-2c95dba641af	Alternacija-write	Alternacija - spreminjanje	f
00030000-55e8-4f11-2ffe-f75d893960fd	Arhivalija-read	Arhivalija - branje	f
00030000-55e8-4f11-dfb3-6a15498cee0c	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55e8-4f11-bc84-fecd95c05a2e	Besedilo-read	Besedilo - branje	f
00030000-55e8-4f11-056a-79b0982feecb	Besedilo-write	Besedilo - spreminjanje	f
00030000-55e8-4f11-b7f5-c49160319def	DogodekIzven-read	DogodekIzven - branje	f
00030000-55e8-4f11-d5ef-61cd8dc5fc7d	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55e8-4f11-328f-850ae7aef941	Dogodek-read	Dogodek - branje	f
00030000-55e8-4f11-5253-3d942ee4b611	Dogodek-write	Dogodek - spreminjanje	f
00030000-55e8-4f11-f616-77a60ae59259	DrugiVir-read	DrugiVir - branje	f
00030000-55e8-4f11-1679-bb416e2c1de0	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55e8-4f11-1df8-3880ceea5474	Drzava-read	Drzava - branje	f
00030000-55e8-4f11-d8b3-705b6e41565a	Drzava-write	Drzava - spreminjanje	f
00030000-55e8-4f11-2a47-a9fdf43bd839	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55e8-4f11-9ec8-12f9e1d4e7bb	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55e8-4f11-a915-f2180cc2e237	Funkcija-read	Funkcija - branje	f
00030000-55e8-4f11-6625-75f0bd03f54e	Funkcija-write	Funkcija - spreminjanje	f
00030000-55e8-4f11-240b-e098d9b5e2d3	Gostovanje-read	Gostovanje - branje	f
00030000-55e8-4f11-bbd0-07f9d40bb23a	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55e8-4f11-98e0-0030e74f06c3	Gostujoca-read	Gostujoca - branje	f
00030000-55e8-4f11-9536-2ab99a88c7b7	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55e8-4f11-dc7f-d822873d5151	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55e8-4f11-4299-cd6d605d868f	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55e8-4f11-0f0f-6fac4b1cb25b	Kupec-read	Kupec - branje	f
00030000-55e8-4f11-79a3-bc0e03be63fe	Kupec-write	Kupec - spreminjanje	f
00030000-55e8-4f11-8bc2-3aad37f68727	NacinPlacina-read	NacinPlacina - branje	f
00030000-55e8-4f11-5792-6407feddcd2b	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55e8-4f11-a648-b9e1571fb4e6	Option-read	Option - branje	f
00030000-55e8-4f11-24c0-4c37bba60dc2	Option-write	Option - spreminjanje	f
00030000-55e8-4f11-20c3-073a040543ae	OptionValue-read	OptionValue - branje	f
00030000-55e8-4f11-a4a8-c41dd10d6dc0	OptionValue-write	OptionValue - spreminjanje	f
00030000-55e8-4f11-cc62-6da9327c54d2	Oseba-read	Oseba - branje	f
00030000-55e8-4f11-cbee-126ab2d70fef	Oseba-write	Oseba - spreminjanje	f
00030000-55e8-4f11-5da6-ce29dbb59bdd	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55e8-4f11-c8bb-211feadd86fa	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55e8-4f11-1d89-f2f674e74d78	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55e8-4f11-3ee1-2811cc10778c	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55e8-4f11-9a44-905915541c8c	Pogodba-read	Pogodba - branje	f
00030000-55e8-4f11-9b9f-cc7e1af91b19	Pogodba-write	Pogodba - spreminjanje	f
00030000-55e8-4f11-ee9e-3f45f7124f45	Popa-read	Popa - branje	f
00030000-55e8-4f11-4e1a-89463a45eb29	Popa-write	Popa - spreminjanje	f
00030000-55e8-4f11-7ea0-29a55207e6e9	Posta-read	Posta - branje	f
00030000-55e8-4f11-abc9-cb45c17fde01	Posta-write	Posta - spreminjanje	f
00030000-55e8-4f11-d8c1-e809c2aa1299	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55e8-4f11-7385-47a05e8c437c	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55e8-4f11-16ff-a027c2d33105	PostniNaslov-read	PostniNaslov - branje	f
00030000-55e8-4f11-c931-59222eacce64	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55e8-4f11-078a-2ec1341d8a27	Predstava-read	Predstava - branje	f
00030000-55e8-4f11-1b8a-d7e5b20d89ce	Predstava-write	Predstava - spreminjanje	f
00030000-55e8-4f11-6202-836d88ab0812	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55e8-4f11-e261-a9052a3d586b	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55e8-4f11-ace1-0f7d211a6eca	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55e8-4f11-0615-0f8f49e7ef17	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55e8-4f11-7899-55f11e690a80	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55e8-4f11-03df-7fcf3363aa9d	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55e8-4f11-3772-f17d9025b958	ProgramDela-read	ProgramDela - branje	f
00030000-55e8-4f11-9d31-646f32f43568	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55e8-4f11-b6a2-975ff6e8894b	ProgramFestival-read	ProgramFestival - branje	f
00030000-55e8-4f11-601b-7809e7a52c6d	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55e8-4f11-e3d1-2841f54b573f	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55e8-4f11-d515-91b5054d6267	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55e8-4f11-5223-2b71d0d368fd	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55e8-4f11-c92a-59da54f607ee	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55e8-4f11-f91d-8c410f34b17b	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55e8-4f11-406c-b80d498558cb	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55e8-4f11-3fa7-ab68c5624528	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55e8-4f11-ffa7-20adc790e212	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55e8-4f11-e97e-5423756b4805	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55e8-4f11-ff9f-08812588a5e8	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55e8-4f11-e77f-15a759dd5b54	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55e8-4f11-4004-c4107bf27b64	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55e8-4f11-2588-a7ffd37458b3	ProgramRazno-read	ProgramRazno - branje	f
00030000-55e8-4f11-846f-c8518d3ad3b8	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55e8-4f11-0680-b0581a43cb79	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55e8-4f11-0f4a-d89315a0123d	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55e8-4f11-de2c-ca78d991659d	Prostor-read	Prostor - branje	f
00030000-55e8-4f11-4c53-4d1523b84112	Prostor-write	Prostor - spreminjanje	f
00030000-55e8-4f11-ca13-bff8b8c5b09a	Racun-read	Racun - branje	f
00030000-55e8-4f11-89bf-a422f070f7d6	Racun-write	Racun - spreminjanje	f
00030000-55e8-4f11-cff3-60924f08d20f	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55e8-4f11-93a0-79dd9d0d48eb	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55e8-4f11-020f-2cd106d9a7b6	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55e8-4f11-e45d-e4722a0db46b	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55e8-4f11-4dad-e5b789251308	Rekvizit-read	Rekvizit - branje	f
00030000-55e8-4f11-5e0a-d316650ce546	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55e8-4f11-f382-1895e5c1939e	Revizija-read	Revizija - branje	f
00030000-55e8-4f11-44f4-a0a1e94127b0	Revizija-write	Revizija - spreminjanje	f
00030000-55e8-4f11-902d-c45f63aa3178	Rezervacija-read	Rezervacija - branje	f
00030000-55e8-4f11-22b6-efd507e6488d	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55e8-4f11-3b55-25c23eb6a638	SedezniRed-read	SedezniRed - branje	f
00030000-55e8-4f11-e9e0-a728149f2caa	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55e8-4f11-598c-cd611187ff3d	Sedez-read	Sedez - branje	f
00030000-55e8-4f11-e815-045980b3d0e6	Sedez-write	Sedez - spreminjanje	f
00030000-55e8-4f11-d88c-e87c5f0a08f1	Sezona-read	Sezona - branje	f
00030000-55e8-4f11-ab90-ba201f1a2521	Sezona-write	Sezona - spreminjanje	f
00030000-55e8-4f11-5c1f-b3e9eee68877	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55e8-4f11-6473-cc676ca9fa53	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55e8-4f11-a18d-d1dc73830401	Stevilcenje-read	Stevilcenje - branje	f
00030000-55e8-4f11-b184-b2df23214274	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55e8-4f11-980f-370673e4f94c	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55e8-4f11-35ca-75595dbb3f5a	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55e8-4f11-8632-fa5bd54801a2	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55e8-4f11-2f90-0126bf8a3b30	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55e8-4f11-4264-a2551ee3f76a	Telefonska-read	Telefonska - branje	f
00030000-55e8-4f11-2cdd-ddf95766da90	Telefonska-write	Telefonska - spreminjanje	f
00030000-55e8-4f11-e4fd-eb93d85bf202	TerminStoritve-read	TerminStoritve - branje	f
00030000-55e8-4f11-a155-60a5a28faf67	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55e8-4f11-0f35-67c1e0c09df7	TipFunkcije-read	TipFunkcije - branje	f
00030000-55e8-4f11-60cf-dd6ee6d41903	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55e8-4f11-1eed-dd55d422f64e	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55e8-4f11-6445-10a7b78c5efb	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55e8-4f11-f2a0-65838a92ae78	Trr-read	Trr - branje	f
00030000-55e8-4f11-2d8a-abc4d3385dac	Trr-write	Trr - spreminjanje	f
00030000-55e8-4f11-0c86-e192fe6497f8	Uprizoritev-read	Uprizoritev - branje	f
00030000-55e8-4f11-5ec6-bc80c260b269	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55e8-4f11-9cae-f4c214984281	Vaja-read	Vaja - branje	f
00030000-55e8-4f11-cf70-e65fd6fc3fcd	Vaja-write	Vaja - spreminjanje	f
00030000-55e8-4f11-183a-37fdc19ffdcb	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55e8-4f11-46e6-6adadf96c072	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55e8-4f11-c292-3eedf10252cf	VrstaStroska-read	VrstaStroska - branje	f
00030000-55e8-4f11-a27f-c6919dbc8710	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55e8-4f11-785c-0badabfe324a	Zaposlitev-read	Zaposlitev - branje	f
00030000-55e8-4f11-42ca-9d378b07c6cd	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55e8-4f11-c08f-5dd2cbf18990	Zasedenost-read	Zasedenost - branje	f
00030000-55e8-4f11-9526-f1afcb85e073	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55e8-4f11-d1a1-1d798292721e	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55e8-4f11-5937-aa797aaae009	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55e8-4f11-ecbf-c482644ae45d	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55e8-4f11-7308-15e9763da1e8	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55e8-4f11-49de-7b1f86f0eb4d	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55e8-4f11-9ef3-8f22dfc0b932	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55e8-4f11-3da8-f91e4e7f6ccb	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55e8-4f11-c1eb-ee2b1639aea3	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55e8-4f11-0c21-8fca262dfb1b	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55e8-4f11-a73c-619fa46ce2ea	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55e8-4f11-acae-4272f5f7f143	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55e8-4f11-7950-69b880a6eb1f	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55e8-4f11-65be-6660e074a80f	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55e8-4f11-a588-7773c1116e28	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55e8-4f11-50b3-52861d8ec2e1	Datoteka-write	Datoteka - spreminjanje	f
00030000-55e8-4f11-30bc-146e6962cd67	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2912 (class 0 OID 17248582)
-- Dependencies: 177
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55e8-4f11-5a09-9063fddc0a29	00030000-55e8-4f11-1e9c-1650e79ed75b
00020000-55e8-4f11-fbe9-76b2563e6435	00030000-55e8-4f11-1df8-3880ceea5474
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-6389-7684cdc82883
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-f32c-ec16875942ac
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-fbf1-6196eabd3c8f
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-161b-2c95dba641af
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-2ffe-f75d893960fd
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-328f-850ae7aef941
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-8e17-68a1879fef20
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-5253-3d942ee4b611
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-1df8-3880ceea5474
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-d8b3-705b6e41565a
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-a915-f2180cc2e237
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-6625-75f0bd03f54e
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-240b-e098d9b5e2d3
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-bbd0-07f9d40bb23a
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-98e0-0030e74f06c3
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-9536-2ab99a88c7b7
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-dc7f-d822873d5151
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-4299-cd6d605d868f
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-a648-b9e1571fb4e6
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-20c3-073a040543ae
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-cc62-6da9327c54d2
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-cbee-126ab2d70fef
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-ee9e-3f45f7124f45
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-4e1a-89463a45eb29
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-7ea0-29a55207e6e9
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-abc9-cb45c17fde01
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-16ff-a027c2d33105
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-c931-59222eacce64
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-078a-2ec1341d8a27
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-1b8a-d7e5b20d89ce
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-7899-55f11e690a80
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-03df-7fcf3363aa9d
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-de2c-ca78d991659d
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-4c53-4d1523b84112
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-020f-2cd106d9a7b6
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-e45d-e4722a0db46b
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-4dad-e5b789251308
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-5e0a-d316650ce546
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-d88c-e87c5f0a08f1
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-ab90-ba201f1a2521
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-0f35-67c1e0c09df7
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-0c86-e192fe6497f8
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-5ec6-bc80c260b269
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-9cae-f4c214984281
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-cf70-e65fd6fc3fcd
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-c08f-5dd2cbf18990
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-9526-f1afcb85e073
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-d1a1-1d798292721e
00020000-55e8-4f11-bdb5-b4f28ee4b257	00030000-55e8-4f11-ecbf-c482644ae45d
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-6389-7684cdc82883
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-2ffe-f75d893960fd
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-328f-850ae7aef941
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-1df8-3880ceea5474
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-240b-e098d9b5e2d3
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-98e0-0030e74f06c3
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-dc7f-d822873d5151
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-4299-cd6d605d868f
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-a648-b9e1571fb4e6
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-20c3-073a040543ae
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-cc62-6da9327c54d2
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-cbee-126ab2d70fef
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-ee9e-3f45f7124f45
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-7ea0-29a55207e6e9
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-16ff-a027c2d33105
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-c931-59222eacce64
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-078a-2ec1341d8a27
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-de2c-ca78d991659d
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-020f-2cd106d9a7b6
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-4dad-e5b789251308
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-d88c-e87c5f0a08f1
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-4264-a2551ee3f76a
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-2cdd-ddf95766da90
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-f2a0-65838a92ae78
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-2d8a-abc4d3385dac
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-785c-0badabfe324a
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-42ca-9d378b07c6cd
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-d1a1-1d798292721e
00020000-55e8-4f11-69ac-3990024d1698	00030000-55e8-4f11-ecbf-c482644ae45d
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-6389-7684cdc82883
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-fbf1-6196eabd3c8f
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-2ffe-f75d893960fd
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-dfb3-6a15498cee0c
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-bc84-fecd95c05a2e
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-b7f5-c49160319def
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-328f-850ae7aef941
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-1df8-3880ceea5474
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-a915-f2180cc2e237
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-240b-e098d9b5e2d3
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-98e0-0030e74f06c3
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-dc7f-d822873d5151
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-a648-b9e1571fb4e6
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-20c3-073a040543ae
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-cc62-6da9327c54d2
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-ee9e-3f45f7124f45
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-7ea0-29a55207e6e9
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-078a-2ec1341d8a27
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-7899-55f11e690a80
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-de2c-ca78d991659d
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-020f-2cd106d9a7b6
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-4dad-e5b789251308
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-d88c-e87c5f0a08f1
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-0f35-67c1e0c09df7
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-9cae-f4c214984281
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-c08f-5dd2cbf18990
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-d1a1-1d798292721e
00020000-55e8-4f11-096e-4974b3b4dc3e	00030000-55e8-4f11-ecbf-c482644ae45d
00020000-55e8-4f11-ea9b-53b20bd43e0f	00030000-55e8-4f11-6389-7684cdc82883
00020000-55e8-4f11-ea9b-53b20bd43e0f	00030000-55e8-4f11-f32c-ec16875942ac
00020000-55e8-4f11-ea9b-53b20bd43e0f	00030000-55e8-4f11-161b-2c95dba641af
00020000-55e8-4f11-ea9b-53b20bd43e0f	00030000-55e8-4f11-2ffe-f75d893960fd
00020000-55e8-4f11-ea9b-53b20bd43e0f	00030000-55e8-4f11-328f-850ae7aef941
00020000-55e8-4f11-ea9b-53b20bd43e0f	00030000-55e8-4f11-1df8-3880ceea5474
00020000-55e8-4f11-ea9b-53b20bd43e0f	00030000-55e8-4f11-240b-e098d9b5e2d3
00020000-55e8-4f11-ea9b-53b20bd43e0f	00030000-55e8-4f11-98e0-0030e74f06c3
00020000-55e8-4f11-ea9b-53b20bd43e0f	00030000-55e8-4f11-a648-b9e1571fb4e6
00020000-55e8-4f11-ea9b-53b20bd43e0f	00030000-55e8-4f11-20c3-073a040543ae
00020000-55e8-4f11-ea9b-53b20bd43e0f	00030000-55e8-4f11-ee9e-3f45f7124f45
00020000-55e8-4f11-ea9b-53b20bd43e0f	00030000-55e8-4f11-7ea0-29a55207e6e9
00020000-55e8-4f11-ea9b-53b20bd43e0f	00030000-55e8-4f11-078a-2ec1341d8a27
00020000-55e8-4f11-ea9b-53b20bd43e0f	00030000-55e8-4f11-de2c-ca78d991659d
00020000-55e8-4f11-ea9b-53b20bd43e0f	00030000-55e8-4f11-020f-2cd106d9a7b6
00020000-55e8-4f11-ea9b-53b20bd43e0f	00030000-55e8-4f11-4dad-e5b789251308
00020000-55e8-4f11-ea9b-53b20bd43e0f	00030000-55e8-4f11-d88c-e87c5f0a08f1
00020000-55e8-4f11-ea9b-53b20bd43e0f	00030000-55e8-4f11-0f35-67c1e0c09df7
00020000-55e8-4f11-ea9b-53b20bd43e0f	00030000-55e8-4f11-d1a1-1d798292721e
00020000-55e8-4f11-ea9b-53b20bd43e0f	00030000-55e8-4f11-ecbf-c482644ae45d
00020000-55e8-4f11-c475-993f689db485	00030000-55e8-4f11-6389-7684cdc82883
00020000-55e8-4f11-c475-993f689db485	00030000-55e8-4f11-2ffe-f75d893960fd
00020000-55e8-4f11-c475-993f689db485	00030000-55e8-4f11-328f-850ae7aef941
00020000-55e8-4f11-c475-993f689db485	00030000-55e8-4f11-1df8-3880ceea5474
00020000-55e8-4f11-c475-993f689db485	00030000-55e8-4f11-240b-e098d9b5e2d3
00020000-55e8-4f11-c475-993f689db485	00030000-55e8-4f11-98e0-0030e74f06c3
00020000-55e8-4f11-c475-993f689db485	00030000-55e8-4f11-a648-b9e1571fb4e6
00020000-55e8-4f11-c475-993f689db485	00030000-55e8-4f11-20c3-073a040543ae
00020000-55e8-4f11-c475-993f689db485	00030000-55e8-4f11-ee9e-3f45f7124f45
00020000-55e8-4f11-c475-993f689db485	00030000-55e8-4f11-7ea0-29a55207e6e9
00020000-55e8-4f11-c475-993f689db485	00030000-55e8-4f11-078a-2ec1341d8a27
00020000-55e8-4f11-c475-993f689db485	00030000-55e8-4f11-de2c-ca78d991659d
00020000-55e8-4f11-c475-993f689db485	00030000-55e8-4f11-020f-2cd106d9a7b6
00020000-55e8-4f11-c475-993f689db485	00030000-55e8-4f11-4dad-e5b789251308
00020000-55e8-4f11-c475-993f689db485	00030000-55e8-4f11-d88c-e87c5f0a08f1
00020000-55e8-4f11-c475-993f689db485	00030000-55e8-4f11-e4fd-eb93d85bf202
00020000-55e8-4f11-c475-993f689db485	00030000-55e8-4f11-14dc-4b6215f9f2bc
00020000-55e8-4f11-c475-993f689db485	00030000-55e8-4f11-0f35-67c1e0c09df7
00020000-55e8-4f11-c475-993f689db485	00030000-55e8-4f11-d1a1-1d798292721e
00020000-55e8-4f11-c475-993f689db485	00030000-55e8-4f11-ecbf-c482644ae45d
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-9e87-a3d4ca53cbfe
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-1e9c-1650e79ed75b
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-14dc-4b6215f9f2bc
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-8e17-68a1879fef20
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-8a82-fcd67afc83f0
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-147e-13bdb3e55acc
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-6e76-6d4c4d6b4b43
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-6389-7684cdc82883
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-f32c-ec16875942ac
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-fbf1-6196eabd3c8f
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-161b-2c95dba641af
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-2ffe-f75d893960fd
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-dfb3-6a15498cee0c
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-bc84-fecd95c05a2e
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-056a-79b0982feecb
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-b7f5-c49160319def
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-d5ef-61cd8dc5fc7d
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-328f-850ae7aef941
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-5253-3d942ee4b611
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-1df8-3880ceea5474
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-d8b3-705b6e41565a
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-f616-77a60ae59259
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-1679-bb416e2c1de0
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-2a47-a9fdf43bd839
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-9ec8-12f9e1d4e7bb
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-a915-f2180cc2e237
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-6625-75f0bd03f54e
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-240b-e098d9b5e2d3
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-bbd0-07f9d40bb23a
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-98e0-0030e74f06c3
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-9536-2ab99a88c7b7
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-dc7f-d822873d5151
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-4299-cd6d605d868f
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-0f0f-6fac4b1cb25b
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-79a3-bc0e03be63fe
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-8bc2-3aad37f68727
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-5792-6407feddcd2b
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-a648-b9e1571fb4e6
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-24c0-4c37bba60dc2
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-20c3-073a040543ae
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-a4a8-c41dd10d6dc0
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-cc62-6da9327c54d2
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-cbee-126ab2d70fef
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-5da6-ce29dbb59bdd
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-c8bb-211feadd86fa
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-1d89-f2f674e74d78
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-3ee1-2811cc10778c
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-9a44-905915541c8c
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-9b9f-cc7e1af91b19
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-ee9e-3f45f7124f45
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-4e1a-89463a45eb29
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-7ea0-29a55207e6e9
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-abc9-cb45c17fde01
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-d8c1-e809c2aa1299
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-7385-47a05e8c437c
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-16ff-a027c2d33105
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-c931-59222eacce64
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-078a-2ec1341d8a27
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-1b8a-d7e5b20d89ce
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-6202-836d88ab0812
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-e261-a9052a3d586b
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-ace1-0f7d211a6eca
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-0615-0f8f49e7ef17
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-7899-55f11e690a80
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-03df-7fcf3363aa9d
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-3772-f17d9025b958
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-9d31-646f32f43568
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-b6a2-975ff6e8894b
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-601b-7809e7a52c6d
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-e3d1-2841f54b573f
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-d515-91b5054d6267
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-5223-2b71d0d368fd
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-c92a-59da54f607ee
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-f91d-8c410f34b17b
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-406c-b80d498558cb
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-3fa7-ab68c5624528
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-ffa7-20adc790e212
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-e97e-5423756b4805
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-ff9f-08812588a5e8
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-e77f-15a759dd5b54
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-4004-c4107bf27b64
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-2588-a7ffd37458b3
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-846f-c8518d3ad3b8
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-0680-b0581a43cb79
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-0f4a-d89315a0123d
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-de2c-ca78d991659d
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-4c53-4d1523b84112
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-ca13-bff8b8c5b09a
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-89bf-a422f070f7d6
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-cff3-60924f08d20f
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-93a0-79dd9d0d48eb
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-020f-2cd106d9a7b6
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-e45d-e4722a0db46b
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-4dad-e5b789251308
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-5e0a-d316650ce546
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-f382-1895e5c1939e
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-44f4-a0a1e94127b0
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-902d-c45f63aa3178
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-22b6-efd507e6488d
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-3b55-25c23eb6a638
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-e9e0-a728149f2caa
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-598c-cd611187ff3d
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-e815-045980b3d0e6
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-d88c-e87c5f0a08f1
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-ab90-ba201f1a2521
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-5c1f-b3e9eee68877
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-6473-cc676ca9fa53
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-a18d-d1dc73830401
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-b184-b2df23214274
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-980f-370673e4f94c
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-35ca-75595dbb3f5a
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-8632-fa5bd54801a2
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-2f90-0126bf8a3b30
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-4264-a2551ee3f76a
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-2cdd-ddf95766da90
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-e4fd-eb93d85bf202
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-a155-60a5a28faf67
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-0f35-67c1e0c09df7
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-60cf-dd6ee6d41903
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-1eed-dd55d422f64e
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-6445-10a7b78c5efb
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-f2a0-65838a92ae78
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-2d8a-abc4d3385dac
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-0c86-e192fe6497f8
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-5ec6-bc80c260b269
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-9cae-f4c214984281
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-cf70-e65fd6fc3fcd
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-183a-37fdc19ffdcb
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-46e6-6adadf96c072
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-c292-3eedf10252cf
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-a27f-c6919dbc8710
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-785c-0badabfe324a
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-42ca-9d378b07c6cd
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-c08f-5dd2cbf18990
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-9526-f1afcb85e073
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-d1a1-1d798292721e
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-5937-aa797aaae009
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-ecbf-c482644ae45d
00020000-55e8-4f12-6c79-80578c0bb5f8	00030000-55e8-4f11-7308-15e9763da1e8
\.


--
-- TOC entry 2939 (class 0 OID 17248877)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 17248911)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 17249035)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55e8-4f13-de84-5736f29d5f97	00090000-55e8-4f12-da3c-91cafb7aca7c	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55e8-4f13-25a3-e95a9ef820c1	00090000-55e8-4f12-2d9c-220fa798b69d	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55e8-4f13-6c8f-4cfb532e1bc4	00090000-55e8-4f12-06d2-e64ad608d521	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2917 (class 0 OID 17248642)
-- Dependencies: 182
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55e8-4f12-2e0a-48f79a5a5456	00040000-55e8-4f11-5e2a-26e2efe9a1fd	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e8-4f12-5033-aa6c2e620abf	00040000-55e8-4f11-5e2a-26e2efe9a1fd	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55e8-4f12-5335-92998ab2d47c	00040000-55e8-4f11-5e2a-26e2efe9a1fd	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e8-4f12-d94a-2eac2f758c6d	00040000-55e8-4f11-5e2a-26e2efe9a1fd	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e8-4f12-00c6-026b32a7a698	00040000-55e8-4f11-5e2a-26e2efe9a1fd	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e8-4f12-40fd-5e432430dfee	00040000-55e8-4f11-ab1b-da186a885dfe	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e8-4f12-6b0e-967d1e205abe	00040000-55e8-4f11-69d3-89f694ae5b99	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e8-4f12-0551-d8eaa5821f16	00040000-55e8-4f11-3aa9-da994184b44f	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e8-4f14-51f4-1fbf1b2031b7	00040000-55e8-4f11-5e2a-26e2efe9a1fd	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2919 (class 0 OID 17248676)
-- Dependencies: 184
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55e8-4f10-897c-f580c3aa8efa	8341	Adlešiči
00050000-55e8-4f10-ded5-9fb707414d1d	5270	Ajdovščina
00050000-55e8-4f10-4792-939082daa3c2	6280	Ankaran/Ancarano
00050000-55e8-4f10-1c9f-9cabe34cad70	9253	Apače
00050000-55e8-4f10-9fb1-76a2353dba8a	8253	Artiče
00050000-55e8-4f10-4f84-3ede2cfc854b	4275	Begunje na Gorenjskem
00050000-55e8-4f10-70bb-df9af6fecbaf	1382	Begunje pri Cerknici
00050000-55e8-4f10-3750-db3f18f0e0da	9231	Beltinci
00050000-55e8-4f10-5d6d-7f37ed41b103	2234	Benedikt
00050000-55e8-4f10-bd0e-7811d04d4492	2345	Bistrica ob Dravi
00050000-55e8-4f10-ef48-b0e8824d10b9	3256	Bistrica ob Sotli
00050000-55e8-4f10-0749-bc3f4012f878	8259	Bizeljsko
00050000-55e8-4f10-834d-04353c3bdc0d	1223	Blagovica
00050000-55e8-4f10-fb08-05b0d4382450	8283	Blanca
00050000-55e8-4f10-861a-f25acda8d8ec	4260	Bled
00050000-55e8-4f10-c7f7-f8ec9a00c03d	4273	Blejska Dobrava
00050000-55e8-4f10-dc3b-0774992fb31b	9265	Bodonci
00050000-55e8-4f10-d9c1-c2433f4d28eb	9222	Bogojina
00050000-55e8-4f10-2eb8-a4f2a17727ba	4263	Bohinjska Bela
00050000-55e8-4f10-1bd4-b9a5265f15f6	4264	Bohinjska Bistrica
00050000-55e8-4f10-cda5-11e4b2c7d581	4265	Bohinjsko jezero
00050000-55e8-4f10-4340-989cfdefe2cf	1353	Borovnica
00050000-55e8-4f10-1a68-8dd881067d90	8294	Boštanj
00050000-55e8-4f10-de74-534edb1842fc	5230	Bovec
00050000-55e8-4f10-0877-97871856703c	5295	Branik
00050000-55e8-4f10-31ef-47db487acf6c	3314	Braslovče
00050000-55e8-4f10-ab66-0dbcac15537e	5223	Breginj
00050000-55e8-4f10-4130-0960b73350f2	8280	Brestanica
00050000-55e8-4f10-4ea0-911294e04c6e	2354	Bresternica
00050000-55e8-4f10-025d-bf1b6550c0ac	4243	Brezje
00050000-55e8-4f10-ebc3-61c2b3f4c123	1351	Brezovica pri Ljubljani
00050000-55e8-4f10-40cd-ee77211f088f	8250	Brežice
00050000-55e8-4f10-f6e6-e56e4e253a19	4210	Brnik - Aerodrom
00050000-55e8-4f10-f016-6d2071be3e53	8321	Brusnice
00050000-55e8-4f10-d6fc-7a6e020fdd8c	3255	Buče
00050000-55e8-4f10-0354-30d5e88344b6	8276	Bučka 
00050000-55e8-4f10-c20c-720e458f764f	9261	Cankova
00050000-55e8-4f10-9385-b75641b763ea	3000	Celje 
00050000-55e8-4f10-c230-5fa750eca4a6	3001	Celje - poštni predali
00050000-55e8-4f10-0503-2e10ccca7d8b	4207	Cerklje na Gorenjskem
00050000-55e8-4f10-59a7-c4e12a8fa59e	8263	Cerklje ob Krki
00050000-55e8-4f10-2900-f8b5bbc0a72d	1380	Cerknica
00050000-55e8-4f10-5d59-4931f664e2f6	5282	Cerkno
00050000-55e8-4f10-f585-261c9548e1ba	2236	Cerkvenjak
00050000-55e8-4f10-5c85-3c275c71ebf3	2215	Ceršak
00050000-55e8-4f10-d12d-579b4a3757dc	2326	Cirkovce
00050000-55e8-4f10-915c-79898d5adc3f	2282	Cirkulane
00050000-55e8-4f10-a600-a4b6ca17bde4	5273	Col
00050000-55e8-4f10-7eee-8255334bb8ec	8251	Čatež ob Savi
00050000-55e8-4f10-0956-1c99a3ae6c6a	1413	Čemšenik
00050000-55e8-4f10-94d2-441e944d1542	5253	Čepovan
00050000-55e8-4f10-0bf2-d992aa73b87e	9232	Črenšovci
00050000-55e8-4f10-3129-333f4029fee3	2393	Črna na Koroškem
00050000-55e8-4f10-ab91-660fe9ad05f3	6275	Črni Kal
00050000-55e8-4f10-452d-a6b5fe1aa17f	5274	Črni Vrh nad Idrijo
00050000-55e8-4f10-498f-4c81a0bb1fbb	5262	Črniče
00050000-55e8-4f10-2bd1-819da3a27886	8340	Črnomelj
00050000-55e8-4f10-dd1f-998e0910888a	6271	Dekani
00050000-55e8-4f10-ac93-a3dadc22b242	5210	Deskle
00050000-55e8-4f10-73a5-aaf2f681ff3b	2253	Destrnik
00050000-55e8-4f10-dace-2e6ff84da0dd	6215	Divača
00050000-55e8-4f10-0399-6555ae7f342e	1233	Dob
00050000-55e8-4f10-be54-9bc04b529d74	3224	Dobje pri Planini
00050000-55e8-4f10-f2d6-28001d140d00	8257	Dobova
00050000-55e8-4f10-cfea-3c45528d6fc5	1423	Dobovec
00050000-55e8-4f10-4244-1ded767fdd67	5263	Dobravlje
00050000-55e8-4f10-dd80-a7831a3461b2	3204	Dobrna
00050000-55e8-4f10-9af2-e415846e8415	8211	Dobrnič
00050000-55e8-4f10-fc12-75d33696fab2	1356	Dobrova
00050000-55e8-4f10-f8a7-44c42ec3bf97	9223	Dobrovnik/Dobronak 
00050000-55e8-4f10-d2ef-12029e5f7bf5	5212	Dobrovo v Brdih
00050000-55e8-4f10-6607-a87999458b58	1431	Dol pri Hrastniku
00050000-55e8-4f10-ce9d-50250338b536	1262	Dol pri Ljubljani
00050000-55e8-4f10-f6c0-38236d7788ce	1273	Dole pri Litiji
00050000-55e8-4f10-9661-4bec36595097	1331	Dolenja vas
00050000-55e8-4f10-20f3-49d7c35e179b	8350	Dolenjske Toplice
00050000-55e8-4f10-2dfa-fec261888db6	1230	Domžale
00050000-55e8-4f10-7ee9-cdefb6e42a43	2252	Dornava
00050000-55e8-4f10-bcd5-ab8f1be0e604	5294	Dornberk
00050000-55e8-4f10-2ea6-011931d2df18	1319	Draga
00050000-55e8-4f10-aed9-964dc8e710ec	8343	Dragatuš
00050000-55e8-4f10-5962-dbec53768ba9	3222	Dramlje
00050000-55e8-4f10-ca2c-9d2797594d1d	2370	Dravograd
00050000-55e8-4f10-4525-b978f73426d5	4203	Duplje
00050000-55e8-4f10-f798-2ecd5516f1dc	6221	Dutovlje
00050000-55e8-4f10-27f8-a242c287f2cf	8361	Dvor
00050000-55e8-4f10-b308-6824abd5e0bc	2343	Fala
00050000-55e8-4f10-88ad-6a07cdd261d1	9208	Fokovci
00050000-55e8-4f10-8117-39ec89f32ac7	2313	Fram
00050000-55e8-4f10-fc31-05ff8dc45906	3213	Frankolovo
00050000-55e8-4f10-0fd6-e7f654f3491c	1274	Gabrovka
00050000-55e8-4f10-d3a9-76ba7e6e6f53	8254	Globoko
00050000-55e8-4f10-0796-08f96ae8a779	5275	Godovič
00050000-55e8-4f10-cae5-6f0ff730bf70	4204	Golnik
00050000-55e8-4f10-1555-7a58b5551d87	3303	Gomilsko
00050000-55e8-4f10-5e06-7f96effa325b	4224	Gorenja vas
00050000-55e8-4f10-f548-82303d3d150d	3263	Gorica pri Slivnici
00050000-55e8-4f10-7042-c20fc6ef65fa	2272	Gorišnica
00050000-55e8-4f10-2795-e98ca8276162	9250	Gornja Radgona
00050000-55e8-4f10-1519-eeaa0c2b7486	3342	Gornji Grad
00050000-55e8-4f10-22e1-1e3ce861d3cf	4282	Gozd Martuljek
00050000-55e8-4f10-f14d-08022f682731	6272	Gračišče
00050000-55e8-4f10-22ad-7a00f73b8543	9264	Grad
00050000-55e8-4f10-e62b-d3394ce06f0d	8332	Gradac
00050000-55e8-4f10-de54-447d281d9ad8	1384	Grahovo
00050000-55e8-4f10-3645-edb23af14c94	5242	Grahovo ob Bači
00050000-55e8-4f10-6b00-40b0459fbdfa	5251	Grgar
00050000-55e8-4f10-c7dc-ec3704f02a48	3302	Griže
00050000-55e8-4f10-6960-e31a8aeb0c7d	3231	Grobelno
00050000-55e8-4f10-557f-c1f4c515a81c	1290	Grosuplje
00050000-55e8-4f10-991a-86b814fa9a23	2288	Hajdina
00050000-55e8-4f10-261c-838c35f431ec	8362	Hinje
00050000-55e8-4f10-96c7-5fb114dfb207	2311	Hoče
00050000-55e8-4f10-0acb-ef442aef8fd2	9205	Hodoš/Hodos
00050000-55e8-4f10-0ab6-7ed0eafc493b	1354	Horjul
00050000-55e8-4f10-c7f6-3aed419a7ca4	1372	Hotedršica
00050000-55e8-4f10-e1d6-fbdfaf9fb90d	1430	Hrastnik
00050000-55e8-4f10-7a58-b89597c10831	6225	Hruševje
00050000-55e8-4f10-19c0-5bf8e88cb3c1	4276	Hrušica
00050000-55e8-4f10-7309-4a3af94ad315	5280	Idrija
00050000-55e8-4f10-01ac-0623d7da1aef	1292	Ig
00050000-55e8-4f10-8b6f-4d859c1731b7	6250	Ilirska Bistrica
00050000-55e8-4f10-c3b6-df44cc7a69ed	6251	Ilirska Bistrica-Trnovo
00050000-55e8-4f10-a86a-7eff3dd428f9	1295	Ivančna Gorica
00050000-55e8-4f10-c8d0-8e7eb64866d0	2259	Ivanjkovci
00050000-55e8-4f10-9bd5-7906844312ec	1411	Izlake
00050000-55e8-4f10-4e76-3031f53a92b4	6310	Izola/Isola
00050000-55e8-4f10-08cd-b9e11811ae4d	2222	Jakobski Dol
00050000-55e8-4f10-7557-0247ddf5a620	2221	Jarenina
00050000-55e8-4f10-dffc-0ac5b26f1933	6254	Jelšane
00050000-55e8-4f10-fe24-1ad9bcc44e51	4270	Jesenice
00050000-55e8-4f10-0229-5a4754635b79	8261	Jesenice na Dolenjskem
00050000-55e8-4f10-cd9d-9f042320cf6b	3273	Jurklošter
00050000-55e8-4f10-bdfc-36897aca1a33	2223	Jurovski Dol
00050000-55e8-4f10-17c7-b294b3f127ec	2256	Juršinci
00050000-55e8-4f10-0de8-9f3aeab74cc5	5214	Kal nad Kanalom
00050000-55e8-4f10-55e8-53975db49f65	3233	Kalobje
00050000-55e8-4f10-a27b-de6a41e085c8	4246	Kamna Gorica
00050000-55e8-4f10-fb41-0b752292474e	2351	Kamnica
00050000-55e8-4f10-82f8-962ec07d3f83	1241	Kamnik
00050000-55e8-4f10-2575-2da8c66257dd	5213	Kanal
00050000-55e8-4f10-7b5d-204a376bac9b	8258	Kapele
00050000-55e8-4f10-66e6-4352dac3654d	2362	Kapla
00050000-55e8-4f10-cef3-f8028ab82086	2325	Kidričevo
00050000-55e8-4f10-5c39-59b37d407a52	1412	Kisovec
00050000-55e8-4f10-3749-d2b46b7e6697	6253	Knežak
00050000-55e8-4f10-af9c-bdad1bdf94ea	5222	Kobarid
00050000-55e8-4f10-b319-e07bb305301f	9227	Kobilje
00050000-55e8-4f10-4a74-758e9db63fdd	1330	Kočevje
00050000-55e8-4f10-9d04-98cd7d74be2c	1338	Kočevska Reka
00050000-55e8-4f10-db8e-ecd87a25e2a0	2276	Kog
00050000-55e8-4f10-307e-777fa4b86ac3	5211	Kojsko
00050000-55e8-4f10-a8b2-4b3e687a1b34	6223	Komen
00050000-55e8-4f10-46f6-a143f071d121	1218	Komenda
00050000-55e8-4f10-3f3e-5297ca5ba513	6000	Koper/Capodistria 
00050000-55e8-4f10-6fd1-bcccd511e0f2	6001	Koper/Capodistria - poštni predali
00050000-55e8-4f10-f8f9-2624b327701c	8282	Koprivnica
00050000-55e8-4f10-ef39-d27782461fc9	5296	Kostanjevica na Krasu
00050000-55e8-4f10-18d0-5366b91b0738	8311	Kostanjevica na Krki
00050000-55e8-4f10-ce11-04edba8c3748	1336	Kostel
00050000-55e8-4f10-e276-32aad56844db	6256	Košana
00050000-55e8-4f10-f735-efd83b3ffd44	2394	Kotlje
00050000-55e8-4f10-c974-40bd80fdf135	6240	Kozina
00050000-55e8-4f10-8904-686c565f1f69	3260	Kozje
00050000-55e8-4f10-8b4c-07b20597221a	4000	Kranj 
00050000-55e8-4f10-900b-5b44af97d340	4001	Kranj - poštni predali
00050000-55e8-4f10-b03e-dfd2ca97fd0c	4280	Kranjska Gora
00050000-55e8-4f10-00cb-ebe06db0ea92	1281	Kresnice
00050000-55e8-4f10-2670-190fb0450de8	4294	Križe
00050000-55e8-4f10-8505-c29e83ffc55d	9206	Križevci
00050000-55e8-4f10-5c6b-dc8090e3e3c0	9242	Križevci pri Ljutomeru
00050000-55e8-4f10-1649-9012cb25aa98	1301	Krka
00050000-55e8-4f10-f956-309211a65789	8296	Krmelj
00050000-55e8-4f10-7bdd-983b13c6052e	4245	Kropa
00050000-55e8-4f10-f61d-56bc031b249f	8262	Krška vas
00050000-55e8-4f10-cedb-d55a13218efc	8270	Krško
00050000-55e8-4f10-2f75-c74c70d0d96e	9263	Kuzma
00050000-55e8-4f10-04d0-5454b3d89bef	2318	Laporje
00050000-55e8-4f10-3ad2-0b2b525ac2e5	3270	Laško
00050000-55e8-4f10-5cb6-73bc12fe36ed	1219	Laze v Tuhinju
00050000-55e8-4f10-5e3c-31930178c628	2230	Lenart v Slovenskih goricah
00050000-55e8-4f10-e932-59046e9bce05	9220	Lendava/Lendva
00050000-55e8-4f10-1a17-33e00640ca4b	4248	Lesce
00050000-55e8-4f10-62fc-ba30d866e3ab	3261	Lesično
00050000-55e8-4f10-e4bc-3a662b6bef39	8273	Leskovec pri Krškem
00050000-55e8-4f10-c84c-b26fd6b8e90c	2372	Libeliče
00050000-55e8-4f10-4f50-f8f030fe9fad	2341	Limbuš
00050000-55e8-4f10-f9ae-933b6ecec7ed	1270	Litija
00050000-55e8-4f10-dd1d-97f53f4f7116	3202	Ljubečna
00050000-55e8-4f10-cfc3-fad0f2593263	1000	Ljubljana 
00050000-55e8-4f10-0197-42832ef58257	1001	Ljubljana - poštni predali
00050000-55e8-4f10-ef7e-cf93b76509f6	1231	Ljubljana - Črnuče
00050000-55e8-4f10-aa4e-7c87baad7259	1261	Ljubljana - Dobrunje
00050000-55e8-4f10-430e-bc63a7b8ba18	1260	Ljubljana - Polje
00050000-55e8-4f10-ed4d-87df6fcd6927	1210	Ljubljana - Šentvid
00050000-55e8-4f10-6dd7-70995b86df7e	1211	Ljubljana - Šmartno
00050000-55e8-4f10-f014-f17cf5c45246	3333	Ljubno ob Savinji
00050000-55e8-4f10-4b3f-5c6ca426f8cd	9240	Ljutomer
00050000-55e8-4f10-f7f6-304450aba0ae	3215	Loče
00050000-55e8-4f10-4b84-490250299d14	5231	Log pod Mangartom
00050000-55e8-4f10-91e0-7f5bc44f3580	1358	Log pri Brezovici
00050000-55e8-4f10-135a-fbb26946b5fd	1370	Logatec
00050000-55e8-4f10-439b-ae6574ad50e7	1371	Logatec
00050000-55e8-4f10-699e-1e8d3612de1d	1434	Loka pri Zidanem Mostu
00050000-55e8-4f10-d213-1060221be3c2	3223	Loka pri Žusmu
00050000-55e8-4f10-f384-ac8caba94b87	6219	Lokev
00050000-55e8-4f10-4e27-d2ee102a7e18	1318	Loški Potok
00050000-55e8-4f10-4ff0-bc60f3f0acb1	2324	Lovrenc na Dravskem polju
00050000-55e8-4f10-c515-eefcb1a3d671	2344	Lovrenc na Pohorju
00050000-55e8-4f10-efaf-19dfe512eba1	3334	Luče
00050000-55e8-4f10-a0c4-d1136fd9022c	1225	Lukovica
00050000-55e8-4f10-dcec-c2c2a4d263d5	9202	Mačkovci
00050000-55e8-4f10-751c-b9c67a111c4a	2322	Majšperk
00050000-55e8-4f10-f740-bfad8a3ae584	2321	Makole
00050000-55e8-4f10-16a6-0205abf3fc9c	9243	Mala Nedelja
00050000-55e8-4f10-2406-1fb7765a060b	2229	Malečnik
00050000-55e8-4f10-c296-d6e29fd691b7	6273	Marezige
00050000-55e8-4f10-1ffc-bd69ceb5aaa7	2000	Maribor 
00050000-55e8-4f10-923c-4f976db13476	2001	Maribor - poštni predali
00050000-55e8-4f10-f43e-2d7ba9716e7a	2206	Marjeta na Dravskem polju
00050000-55e8-4f10-0885-812d76f6cba1	2281	Markovci
00050000-55e8-4f10-a818-9e802f017f4f	9221	Martjanci
00050000-55e8-4f10-0921-2ab6f83f7b72	6242	Materija
00050000-55e8-4f10-8e8f-f35ff75d55c0	4211	Mavčiče
00050000-55e8-4f10-83aa-714c8ca24335	1215	Medvode
00050000-55e8-4f10-5808-1996d5e14a39	1234	Mengeš
00050000-55e8-4f10-5284-e4957b4594d5	8330	Metlika
00050000-55e8-4f10-721d-b66a6a1b63a8	2392	Mežica
00050000-55e8-4f10-c6d6-27bc6bcea16a	2204	Miklavž na Dravskem polju
00050000-55e8-4f10-1a3f-b8fccbc905b4	2275	Miklavž pri Ormožu
00050000-55e8-4f10-8967-e8aefa7de5cc	5291	Miren
00050000-55e8-4f10-6e97-80e909c8cfe1	8233	Mirna
00050000-55e8-4f10-87ab-ab16a130f567	8216	Mirna Peč
00050000-55e8-4f10-7a2d-e943f5d38d59	2382	Mislinja
00050000-55e8-4f10-d03e-7512b30760e8	4281	Mojstrana
00050000-55e8-4f10-8b37-dd4606bb9154	8230	Mokronog
00050000-55e8-4f10-60d7-c10c8d6bd0a0	1251	Moravče
00050000-55e8-4f10-e637-ac00181366a4	9226	Moravske Toplice
00050000-55e8-4f10-798b-7b0ed18667a7	5216	Most na Soči
00050000-55e8-4f10-b0eb-b17de111f6d8	1221	Motnik
00050000-55e8-4f10-11a0-84cf60231612	3330	Mozirje
00050000-55e8-4f10-5dac-40d8100109e7	9000	Murska Sobota 
00050000-55e8-4f10-58ad-c72990f97e8d	9001	Murska Sobota - poštni predali
00050000-55e8-4f10-5f8b-69c4b45e1a34	2366	Muta
00050000-55e8-4f10-1e4b-fdd77ad0969a	4202	Naklo
00050000-55e8-4f10-bde3-e9225e54e1d9	3331	Nazarje
00050000-55e8-4f10-9c46-7b4db5e2a823	1357	Notranje Gorice
00050000-55e8-4f10-8884-a84f796736d5	3203	Nova Cerkev
00050000-55e8-4f10-5e0f-68b1733f95b1	5000	Nova Gorica 
00050000-55e8-4f10-1ca6-3ee74d7196fa	5001	Nova Gorica - poštni predali
00050000-55e8-4f10-c771-fa3da665b548	1385	Nova vas
00050000-55e8-4f10-7f94-cbdacb92fe6c	8000	Novo mesto
00050000-55e8-4f10-9263-272bec896441	8001	Novo mesto - poštni predali
00050000-55e8-4f10-a7f5-83e2b7f90ddb	6243	Obrov
00050000-55e8-4f10-e221-a262e6899235	9233	Odranci
00050000-55e8-4f10-de40-60beeb42b314	2317	Oplotnica
00050000-55e8-4f10-8dc8-a9cfb96fb6c8	2312	Orehova vas
00050000-55e8-4f10-3d2f-e4e3a8c3e0cb	2270	Ormož
00050000-55e8-4f10-2d73-24dbeb034f7e	1316	Ortnek
00050000-55e8-4f10-30bb-220189fe2ad5	1337	Osilnica
00050000-55e8-4f10-62c2-420d0654293b	8222	Otočec
00050000-55e8-4f10-d8a4-3741d4c31037	2361	Ožbalt
00050000-55e8-4f10-a8d1-5d56547f32f9	2231	Pernica
00050000-55e8-4f10-104a-ef4b9b7df71f	2211	Pesnica pri Mariboru
00050000-55e8-4f10-3359-a8af5ad1d3a0	9203	Petrovci
00050000-55e8-4f10-93f6-59fbc3c672bf	3301	Petrovče
00050000-55e8-4f10-0610-a93adb1f1b88	6330	Piran/Pirano
00050000-55e8-4f10-c833-b609c900465e	8255	Pišece
00050000-55e8-4f10-8538-79ca570c741d	6257	Pivka
00050000-55e8-4f10-fb44-c35966185021	6232	Planina
00050000-55e8-4f10-ef34-ba1dab16d50e	3225	Planina pri Sevnici
00050000-55e8-4f10-31e2-f7199f3d5a35	6276	Pobegi
00050000-55e8-4f10-c2ad-63a2561ff586	8312	Podbočje
00050000-55e8-4f10-71ba-c87f34d571df	5243	Podbrdo
00050000-55e8-4f10-67e6-30586686c2ec	3254	Podčetrtek
00050000-55e8-4f10-9847-cd79c97423d4	2273	Podgorci
00050000-55e8-4f10-9d6c-699256b06d23	6216	Podgorje
00050000-55e8-4f10-b44a-c9474dd9ae7a	2381	Podgorje pri Slovenj Gradcu
00050000-55e8-4f10-643f-dc842b9e2065	6244	Podgrad
00050000-55e8-4f10-57c3-5b91a3a73d70	1414	Podkum
00050000-55e8-4f10-4e5b-8ba37ec86961	2286	Podlehnik
00050000-55e8-4f10-faac-c70d8dd1da74	5272	Podnanos
00050000-55e8-4f10-0650-d61797bfbc03	4244	Podnart
00050000-55e8-4f10-5111-44f458f5d710	3241	Podplat
00050000-55e8-4f10-2301-98d085df76a0	3257	Podsreda
00050000-55e8-4f10-5c03-10afa47d36f5	2363	Podvelka
00050000-55e8-4f10-2a25-2b245594d95f	2208	Pohorje
00050000-55e8-4f10-e9ef-d4117007f8a4	2257	Polenšak
00050000-55e8-4f10-a594-1b355cbb4d63	1355	Polhov Gradec
00050000-55e8-4f10-a1b6-2ead5d06eb69	4223	Poljane nad Škofjo Loko
00050000-55e8-4f10-589b-7efdbdf3639a	2319	Poljčane
00050000-55e8-4f10-ef40-01ac3e58192a	1272	Polšnik
00050000-55e8-4f10-e76f-55bd7970ff88	3313	Polzela
00050000-55e8-4f10-1004-eaa2b89a3d46	3232	Ponikva
00050000-55e8-4f10-4ca8-478b91ab89e8	6320	Portorož/Portorose
00050000-55e8-4f10-47df-142d627ebac2	6230	Postojna
00050000-55e8-4f10-5094-507a61af9b1d	2331	Pragersko
00050000-55e8-4f10-a18d-74d4988cb410	3312	Prebold
00050000-55e8-4f10-6cfd-e73cfbe626e5	4205	Preddvor
00050000-55e8-4f10-d907-179960f15293	6255	Prem
00050000-55e8-4f10-738a-cfe9ba0a7050	1352	Preserje
00050000-55e8-4f10-de4b-af20a82ace91	6258	Prestranek
00050000-55e8-4f10-3516-038a32ca1e56	2391	Prevalje
00050000-55e8-4f10-dce1-fa5a9a42a7b4	3262	Prevorje
00050000-55e8-4f10-4d6a-ac5faaa8565f	1276	Primskovo 
00050000-55e8-4f10-2f18-4694a409919a	3253	Pristava pri Mestinju
00050000-55e8-4f10-5bcf-ed763006ee38	9207	Prosenjakovci/Partosfalva
00050000-55e8-4f10-d6f7-8ce281f1acf1	5297	Prvačina
00050000-55e8-4f10-a4d8-36fe3e7638e2	2250	Ptuj
00050000-55e8-4f10-192a-510a6b6cfe4e	2323	Ptujska Gora
00050000-55e8-4f10-6602-0103a31a710d	9201	Puconci
00050000-55e8-4f10-61ee-aa1df2d341d1	2327	Rače
00050000-55e8-4f10-d408-fc5603f49333	1433	Radeče
00050000-55e8-4f10-966a-218f1f90d725	9252	Radenci
00050000-55e8-4f10-285c-f96fb03af74e	2360	Radlje ob Dravi
00050000-55e8-4f10-9108-374374179206	1235	Radomlje
00050000-55e8-4f10-f8ef-66b9ff13860c	4240	Radovljica
00050000-55e8-4f10-bff6-cf177df5599a	8274	Raka
00050000-55e8-4f10-07ac-7cf31980aeca	1381	Rakek
00050000-55e8-4f10-b7fd-7568a139e155	4283	Rateče - Planica
00050000-55e8-4f10-6ded-771295bd3e14	2390	Ravne na Koroškem
00050000-55e8-4f10-d133-7f98d0260bec	9246	Razkrižje
00050000-55e8-4f10-a149-bb05b671f3bd	3332	Rečica ob Savinji
00050000-55e8-4f10-e59b-20609eba990e	5292	Renče
00050000-55e8-4f10-7b0b-2269d2c34625	1310	Ribnica
00050000-55e8-4f10-2039-e067d0973d16	2364	Ribnica na Pohorju
00050000-55e8-4f10-79b0-2799410a2247	3272	Rimske Toplice
00050000-55e8-4f10-c180-1b12e50b7782	1314	Rob
00050000-55e8-4f10-002a-215f091289b8	5215	Ročinj
00050000-55e8-4f10-e305-e9e139198f49	3250	Rogaška Slatina
00050000-55e8-4f10-7c6b-3fdfd6e9fdfe	9262	Rogašovci
00050000-55e8-4f10-adab-0dece238c00c	3252	Rogatec
00050000-55e8-4f10-6e88-4a68d4df608c	1373	Rovte
00050000-55e8-4f10-de05-5e2399060831	2342	Ruše
00050000-55e8-4f10-c5be-0b14ed725964	1282	Sava
00050000-55e8-4f10-a1d8-c6b2b658fb14	6333	Sečovlje/Sicciole
00050000-55e8-4f10-ab75-c8a253c83497	4227	Selca
00050000-55e8-4f10-f3d3-9df583f8a74b	2352	Selnica ob Dravi
00050000-55e8-4f10-6f7d-ffc6e73d0680	8333	Semič
00050000-55e8-4f10-380a-78b33e3fa710	8281	Senovo
00050000-55e8-4f10-b399-d17cfe210058	6224	Senožeče
00050000-55e8-4f10-ed4e-5681a8980e30	8290	Sevnica
00050000-55e8-4f10-cc7d-f8d68bf78499	6210	Sežana
00050000-55e8-4f10-e9d3-3f4cb1ed78d3	2214	Sladki Vrh
00050000-55e8-4f10-d460-b1551453d653	5283	Slap ob Idrijci
00050000-55e8-4f10-8a14-0efa3cfe7901	2380	Slovenj Gradec
00050000-55e8-4f10-1868-ae9d1e6a6f57	2310	Slovenska Bistrica
00050000-55e8-4f10-e1cd-dc98509bd183	3210	Slovenske Konjice
00050000-55e8-4f10-776b-be4b7d1eba54	1216	Smlednik
00050000-55e8-4f10-eb28-2d706e229700	5232	Soča
00050000-55e8-4f10-9732-d27e0ecb31a4	1317	Sodražica
00050000-55e8-4f10-7c59-725cf86c129e	3335	Solčava
00050000-55e8-4f10-8e63-069c6ec994aa	5250	Solkan
00050000-55e8-4f10-92eb-dad89561d387	4229	Sorica
00050000-55e8-4f10-e6dc-3c3e10c1a742	4225	Sovodenj
00050000-55e8-4f10-6e1f-6d99aac9eead	5281	Spodnja Idrija
00050000-55e8-4f10-3f00-e68900bda7f4	2241	Spodnji Duplek
00050000-55e8-4f10-dccd-fb724801a3f7	9245	Spodnji Ivanjci
00050000-55e8-4f10-fadb-48845608b6c9	2277	Središče ob Dravi
00050000-55e8-4f10-f0ce-be991ffd8552	4267	Srednja vas v Bohinju
00050000-55e8-4f10-a3f3-b20985f444d7	8256	Sromlje 
00050000-55e8-4f10-f83f-e36d51f37e15	5224	Srpenica
00050000-55e8-4f10-cb2b-87de35ff7218	1242	Stahovica
00050000-55e8-4f10-7698-adfd954649e6	1332	Stara Cerkev
00050000-55e8-4f10-fcfc-16f5cb2bf13e	8342	Stari trg ob Kolpi
00050000-55e8-4f10-6f88-8e07734957ff	1386	Stari trg pri Ložu
00050000-55e8-4f10-9486-a7121e2bc406	2205	Starše
00050000-55e8-4f10-48b1-d540937d972c	2289	Stoperce
00050000-55e8-4f10-f986-fa78d070d8c0	8322	Stopiče
00050000-55e8-4f10-4b86-8d834303046c	3206	Stranice
00050000-55e8-4f10-d41b-0ce302e82c64	8351	Straža
00050000-55e8-4f10-ba58-6a2a0af34cb8	1313	Struge
00050000-55e8-4f10-6328-75df1311cee0	8293	Studenec
00050000-55e8-4f10-ff2b-e35023d95346	8331	Suhor
00050000-55e8-4f10-7093-3d3d00069da8	2233	Sv. Ana v Slovenskih goricah
00050000-55e8-4f10-462f-78e73d32a215	2235	Sv. Trojica v Slovenskih goricah
00050000-55e8-4f10-ebc6-226ce93edbad	2353	Sveti Duh na Ostrem Vrhu
00050000-55e8-4f10-baa3-741cbdad04a6	9244	Sveti Jurij ob Ščavnici
00050000-55e8-4f10-8a19-909f70de09a3	3264	Sveti Štefan
00050000-55e8-4f10-736d-d75ca5e57ae4	2258	Sveti Tomaž
00050000-55e8-4f10-6d2c-d125ad60ba52	9204	Šalovci
00050000-55e8-4f10-f8f5-e1ce6b00ebc5	5261	Šempas
00050000-55e8-4f10-3b11-944f654ce991	5290	Šempeter pri Gorici
00050000-55e8-4f10-aa85-352575646b1e	3311	Šempeter v Savinjski dolini
00050000-55e8-4f10-9c37-19c2e77262c4	4208	Šenčur
00050000-55e8-4f10-e0d1-7d143d7fe16b	2212	Šentilj v Slovenskih goricah
00050000-55e8-4f10-c600-9fd4536980ef	8297	Šentjanž
00050000-55e8-4f10-0ba2-2c62d399999a	2373	Šentjanž pri Dravogradu
00050000-55e8-4f10-8e23-74af1871d975	8310	Šentjernej
00050000-55e8-4f10-a41b-d20ad4aee4d8	3230	Šentjur
00050000-55e8-4f10-1ac8-7425cfeebf2e	3271	Šentrupert
00050000-55e8-4f10-68a5-9f9c1c30ccec	8232	Šentrupert
00050000-55e8-4f10-eb32-d2ecfe37c3c0	1296	Šentvid pri Stični
00050000-55e8-4f10-e7ec-946d62eff7b7	8275	Škocjan
00050000-55e8-4f10-9fe1-b17419c06494	6281	Škofije
00050000-55e8-4f10-e9c3-ebcfb916f629	4220	Škofja Loka
00050000-55e8-4f10-f217-dbd8f2cc64c2	3211	Škofja vas
00050000-55e8-4f10-5224-a000fc8e2e4f	1291	Škofljica
00050000-55e8-4f10-3957-005c6ee76847	6274	Šmarje
00050000-55e8-4f10-c136-d0e61077d0c0	1293	Šmarje - Sap
00050000-55e8-4f10-a394-743dd5af33f5	3240	Šmarje pri Jelšah
00050000-55e8-4f10-a626-aaefbc415b4a	8220	Šmarješke Toplice
00050000-55e8-4f10-c48a-ae4b896a3bf6	2315	Šmartno na Pohorju
00050000-55e8-4f10-a3a3-800a13a844ee	3341	Šmartno ob Dreti
00050000-55e8-4f10-8de3-e58f901b4d00	3327	Šmartno ob Paki
00050000-55e8-4f10-c731-0248cb130e38	1275	Šmartno pri Litiji
00050000-55e8-4f10-6944-998a24e5b99a	2383	Šmartno pri Slovenj Gradcu
00050000-55e8-4f10-e925-6b11ea1a0bb6	3201	Šmartno v Rožni dolini
00050000-55e8-4f10-e23e-0a6e783dd7e5	3325	Šoštanj
00050000-55e8-4f10-5fe2-4b7306cd324d	6222	Štanjel
00050000-55e8-4f10-401f-28ec538a916f	3220	Štore
00050000-55e8-4f10-655c-3e1a3652753d	3304	Tabor
00050000-55e8-4f10-04c6-2f7826668e05	3221	Teharje
00050000-55e8-4f10-7505-772bd279f183	9251	Tišina
00050000-55e8-4f10-670a-763a430c15ff	5220	Tolmin
00050000-55e8-4f10-8237-ec0ea86a4870	3326	Topolšica
00050000-55e8-4f10-a88d-4f3333e29492	2371	Trbonje
00050000-55e8-4f10-6642-b8c61b78bd94	1420	Trbovlje
00050000-55e8-4f10-97ba-aebf2a70181b	8231	Trebelno 
00050000-55e8-4f10-ebd4-ff7ed2c0aac0	8210	Trebnje
00050000-55e8-4f10-524d-c8bf8dee6692	5252	Trnovo pri Gorici
00050000-55e8-4f10-469a-20b903926987	2254	Trnovska vas
00050000-55e8-4f10-f045-25f0268aa668	1222	Trojane
00050000-55e8-4f10-289b-7ab01b9f006b	1236	Trzin
00050000-55e8-4f10-1d8c-afc7a62bd9e4	4290	Tržič
00050000-55e8-4f10-17ed-b80c94c3939f	8295	Tržišče
00050000-55e8-4f10-8705-c47ff9bb557b	1311	Turjak
00050000-55e8-4f10-485d-78c1b6f6a28c	9224	Turnišče
00050000-55e8-4f10-526a-113316115967	8323	Uršna sela
00050000-55e8-4f10-6f04-aa1ba27cea2e	1252	Vače
00050000-55e8-4f10-53f3-dc87eaabeabd	3320	Velenje 
00050000-55e8-4f10-2827-e164dadb9c3d	3322	Velenje - poštni predali
00050000-55e8-4f10-6d8d-37fca1b47762	8212	Velika Loka
00050000-55e8-4f10-c277-358c77365314	2274	Velika Nedelja
00050000-55e8-4f10-02f3-87bf438b10dc	9225	Velika Polana
00050000-55e8-4f10-eaec-5fb58427a031	1315	Velike Lašče
00050000-55e8-4f10-3548-3c11853c6c01	8213	Veliki Gaber
00050000-55e8-4f10-6850-cfa7c5bca7d8	9241	Veržej
00050000-55e8-4f10-e734-7b9748416905	1312	Videm - Dobrepolje
00050000-55e8-4f10-9841-ff297d805bec	2284	Videm pri Ptuju
00050000-55e8-4f10-0209-ac2dbefdfefa	8344	Vinica
00050000-55e8-4f10-825b-0c347133b801	5271	Vipava
00050000-55e8-4f10-275d-58b7f6281f20	4212	Visoko
00050000-55e8-4f10-7128-92590ccaebf7	1294	Višnja Gora
00050000-55e8-4f10-4bea-bd310dd76f7f	3205	Vitanje
00050000-55e8-4f10-5cf6-ead73e422e7a	2255	Vitomarci
00050000-55e8-4f10-178c-184bf5d85aea	1217	Vodice
00050000-55e8-4f10-3f5a-e5838638a50f	3212	Vojnik\t
00050000-55e8-4f10-97a9-b7324128ca86	5293	Volčja Draga
00050000-55e8-4f10-aaef-c3c31dea6e60	2232	Voličina
00050000-55e8-4f10-0fed-1f00de89758e	3305	Vransko
00050000-55e8-4f10-3a27-56577c48dd55	6217	Vremski Britof
00050000-55e8-4f10-e8e5-95ad66861310	1360	Vrhnika
00050000-55e8-4f10-0b89-1c1b4db4b27d	2365	Vuhred
00050000-55e8-4f10-5b65-ac75a05e43b9	2367	Vuzenica
00050000-55e8-4f10-13a9-ab07726d752c	8292	Zabukovje 
00050000-55e8-4f10-e5f2-c78a3bc80e6c	1410	Zagorje ob Savi
00050000-55e8-4f10-c41c-bfcae4357202	1303	Zagradec
00050000-55e8-4f10-680e-ce27696e82da	2283	Zavrč
00050000-55e8-4f10-241c-7cd182790dad	8272	Zdole 
00050000-55e8-4f10-0791-d0d6cc11d746	4201	Zgornja Besnica
00050000-55e8-4f10-3b1f-31bfb5a386ec	2242	Zgornja Korena
00050000-55e8-4f10-c474-f1fd9a5b5b82	2201	Zgornja Kungota
00050000-55e8-4f10-55e7-11596edc59af	2316	Zgornja Ložnica
00050000-55e8-4f10-48d4-d970e32cae5e	2314	Zgornja Polskava
00050000-55e8-4f10-8a14-8f08e0e33293	2213	Zgornja Velka
00050000-55e8-4f10-aded-63bbf6163574	4247	Zgornje Gorje
00050000-55e8-4f10-91ac-0eac3326788c	4206	Zgornje Jezersko
00050000-55e8-4f10-07b0-bc47941d8a73	2285	Zgornji Leskovec
00050000-55e8-4f10-bac8-9ec9bd099b31	1432	Zidani Most
00050000-55e8-4f10-f041-5774349c970c	3214	Zreče
00050000-55e8-4f10-4dbf-01c5c988dc3f	4209	Žabnica
00050000-55e8-4f10-6d97-ddf6ca21243c	3310	Žalec
00050000-55e8-4f10-f2d5-f1239e8b104c	4228	Železniki
00050000-55e8-4f10-f6d4-e14912a81e2d	2287	Žetale
00050000-55e8-4f10-b41f-38f54f8de92e	4226	Žiri
00050000-55e8-4f10-79c6-61af9a68da35	4274	Žirovnica
00050000-55e8-4f10-a673-0e07b9e66b0f	8360	Žužemberk
\.


--
-- TOC entry 2935 (class 0 OID 17248851)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2918 (class 0 OID 17248661)
-- Dependencies: 183
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55e8-4f12-df00-f53338b22af9	00080000-55e8-4f12-2e0a-48f79a5a5456	\N	00040000-55e8-4f11-5e2a-26e2efe9a1fd	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55e8-4f12-be39-b741adfad9c1	00080000-55e8-4f12-2e0a-48f79a5a5456	\N	00040000-55e8-4f11-5e2a-26e2efe9a1fd		\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55e8-4f12-9e79-23a4174d162b	00080000-55e8-4f12-5033-aa6c2e620abf	\N	00040000-55e8-4f11-5e2a-26e2efe9a1fd		\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2924 (class 0 OID 17248739)
-- Dependencies: 189
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 17248863)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 17249215)
-- Dependencies: 226
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 17249225)
-- Dependencies: 227
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55e8-4f12-1b0a-325960d59111	00080000-55e8-4f12-5335-92998ab2d47c	0987	AK
00190000-55e8-4f12-0f5a-4b3f0776681d	00080000-55e8-4f12-5033-aa6c2e620abf	0989	AK
00190000-55e8-4f12-a0aa-4731498039f9	00080000-55e8-4f12-d94a-2eac2f758c6d	0986	AK
00190000-55e8-4f12-d04f-cf5be2b601ab	00080000-55e8-4f12-40fd-5e432430dfee	0984	AK
00190000-55e8-4f12-d59a-c6f607dd4d81	00080000-55e8-4f12-6b0e-967d1e205abe	0983	AK
00190000-55e8-4f12-e690-be81cc1a1841	00080000-55e8-4f12-0551-d8eaa5821f16	0982	AK
00190000-55e8-4f14-ef1e-644c6b368a2b	00080000-55e8-4f14-51f4-1fbf1b2031b7	1001	AK
\.


--
-- TOC entry 2960 (class 0 OID 17249171)
-- Dependencies: 225
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55e8-4f13-ab4d-ca5d0c8321da	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2963 (class 0 OID 17249233)
-- Dependencies: 228
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2941 (class 0 OID 17248892)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, seplanira, kapaciteta, opis) FROM stdin;
00220000-55e8-4f12-3854-5002dc22a225	\N	\N	0001	Poskusna 1	f	t	8	Poskusna učilnica v prvem
00220000-55e8-4f12-e8e9-3d0f05ce4ccd	\N	\N	0002	Poskusna 3	f	f	34	Poskusna učilnica v tretjem
00220000-55e8-4f12-5927-2248e3c5c5b8	\N	\N	0003	Kazinska	t	t	84	Kazinska dvorana
00220000-55e8-4f12-c36d-59296023c47c	\N	\N	0004	Mali oder	t	t	24	Mali oder 
00220000-55e8-4f12-856f-c02a1d8462be	\N	\N	0005	Komorni oder	t	t	15	Komorni oder
00220000-55e8-4f12-0e02-57d7de54bb22	\N	\N	0006	Stara dvorana	t	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55e8-4f12-1678-b47b67c57199	\N	\N	0007	Velika dvorana	t	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2933 (class 0 OID 17248836)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 17248826)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 17249024)
-- Dependencies: 218
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 17248963)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 17248534)
-- Dependencies: 172
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55e8-4f14-51f4-1fbf1b2031b7	00010000-55e8-4f11-2388-eee8dc4104d2	2015-09-03 15:45:56	INS	a:0:{}
2	App\\Entity\\Option	00000000-55e8-4f14-afdd-2cf819808f9a	00010000-55e8-4f11-2388-eee8dc4104d2	2015-09-03 15:45:56	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55e8-4f14-ef1e-644c6b368a2b	00010000-55e8-4f11-2388-eee8dc4104d2	2015-09-03 15:45:56	INS	a:0:{}
\.


--
-- TOC entry 2984 (class 0 OID 0)
-- Dependencies: 171
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2942 (class 0 OID 17248905)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2911 (class 0 OID 17248572)
-- Dependencies: 176
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55e8-4f11-5a09-9063fddc0a29	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55e8-4f11-fbe9-76b2563e6435	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55e8-4f11-9072-b5f1f8c8de4b	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55e8-4f11-a576-606702d57a11	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55e8-4f11-bdb5-b4f28ee4b257	planer	Planer dogodkov v koledarju	t
00020000-55e8-4f11-69ac-3990024d1698	kadrovska	Kadrovska služba	t
00020000-55e8-4f11-096e-4974b3b4dc3e	arhivar	Ažuriranje arhivalij	t
00020000-55e8-4f11-ea9b-53b20bd43e0f	igralec	Igralec	t
00020000-55e8-4f11-c475-993f689db485	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55e8-4f12-6c79-80578c0bb5f8	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2909 (class 0 OID 17248556)
-- Dependencies: 174
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55e8-4f11-32f8-57f449599b4a	00020000-55e8-4f11-9072-b5f1f8c8de4b
00010000-55e8-4f11-2388-eee8dc4104d2	00020000-55e8-4f11-9072-b5f1f8c8de4b
00010000-55e8-4f12-479b-778b9d2df72e	00020000-55e8-4f12-6c79-80578c0bb5f8
\.


--
-- TOC entry 2944 (class 0 OID 17248919)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 17248857)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 17248803)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 17249274)
-- Dependencies: 233
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55e8-4f11-de5d-bac541b62f77	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55e8-4f11-279b-25ab374d2bf2	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55e8-4f11-5736-9ac8d93bc076	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55e8-4f11-8c37-091f43121b47	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55e8-4f11-2e4e-676208ea9c13	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2967 (class 0 OID 17249266)
-- Dependencies: 232
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55e8-4f11-017a-947e33338f6b	00230000-55e8-4f11-8c37-091f43121b47	popa
00240000-55e8-4f11-79d4-d0f7b10c378f	00230000-55e8-4f11-8c37-091f43121b47	oseba
00240000-55e8-4f11-7c3a-8c60db8119a2	00230000-55e8-4f11-8c37-091f43121b47	sezona
00240000-55e8-4f11-c3f5-6690f9fef7da	00230000-55e8-4f11-279b-25ab374d2bf2	prostor
00240000-55e8-4f11-05c3-098a093230a6	00230000-55e8-4f11-8c37-091f43121b47	besedilo
00240000-55e8-4f11-4ac3-0e08f504546a	00230000-55e8-4f11-8c37-091f43121b47	uprizoritev
00240000-55e8-4f11-486d-b0aa496cc53c	00230000-55e8-4f11-8c37-091f43121b47	funkcija
00240000-55e8-4f11-cc15-aeeb1bceb9d9	00230000-55e8-4f11-8c37-091f43121b47	tipfunkcije
00240000-55e8-4f11-803c-87912ca3d557	00230000-55e8-4f11-8c37-091f43121b47	alternacija
00240000-55e8-4f11-0500-e31552c28804	00230000-55e8-4f11-de5d-bac541b62f77	pogodba
00240000-55e8-4f11-3eb2-579dd633963c	00230000-55e8-4f11-8c37-091f43121b47	zaposlitev
00240000-55e8-4f11-5134-ef1965b70748	00230000-55e8-4f11-8c37-091f43121b47	zvrstuprizoritve
00240000-55e8-4f11-7c60-9c53619cf2d7	00230000-55e8-4f11-de5d-bac541b62f77	programdela
00240000-55e8-4f11-4113-3611645792ae	00230000-55e8-4f11-8c37-091f43121b47	zapis
\.


--
-- TOC entry 2966 (class 0 OID 17249261)
-- Dependencies: 231
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
26a7ff38-0c2b-4b4b-836e-52f7c4a2531b	00230000-55e8-4f11-8c37-091f43121b47	0	1001
\.


--
-- TOC entry 2949 (class 0 OID 17248973)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55e8-4f13-dac8-47c8ae965f35	000e0000-55e8-4f13-8f8c-4398144905cb	00080000-55e8-4f12-2e0a-48f79a5a5456	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55e8-4f11-d52e-9ec8cafcc706
00270000-55e8-4f13-2d9f-155a7c9a5fc5	000e0000-55e8-4f13-8f8c-4398144905cb	00080000-55e8-4f12-2e0a-48f79a5a5456	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55e8-4f11-d52e-9ec8cafcc706
00270000-55e8-4f13-1bd4-287318ca2698	000e0000-55e8-4f13-8f8c-4398144905cb	00080000-55e8-4f12-00c6-026b32a7a698	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 2916 (class 0 OID 17248634)
-- Dependencies: 181
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 17248813)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55e8-4f13-6712-cff44e13a39e	00180000-55e8-4f13-4f07-cbc44ea9a5c0	000c0000-55e8-4f13-270b-30aba620b590	00090000-55e8-4f12-e46d-c43a05b11d48	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e8-4f13-b537-bf5108a2b563	00180000-55e8-4f13-4f07-cbc44ea9a5c0	000c0000-55e8-4f13-08a4-2e57f13f1dfb	00090000-55e8-4f12-0436-166945f52b1e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e8-4f13-08d4-82b0a87ef4bd	00180000-55e8-4f13-4f07-cbc44ea9a5c0	000c0000-55e8-4f13-3e19-08332233c922	00090000-55e8-4f12-0f0f-99128bd7f4eb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e8-4f13-9253-778d7a725cd7	00180000-55e8-4f13-4f07-cbc44ea9a5c0	000c0000-55e8-4f13-ea86-4d07eb834d87	00090000-55e8-4f12-b9a0-3a18ec432020	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e8-4f13-0bce-a72dd3af9fb3	00180000-55e8-4f13-4f07-cbc44ea9a5c0	000c0000-55e8-4f13-7a92-96553c1af7bc	00090000-55e8-4f12-3bfd-9224435ef8ff	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e8-4f13-8f1a-8285b4213514	00180000-55e8-4f13-4350-7d0a3c2f9adf	\N	00090000-55e8-4f12-3bfd-9224435ef8ff	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2952 (class 0 OID 17249013)
-- Dependencies: 217
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55e8-4f10-3efc-76b2c87d0026	Avtor	Avtorji	Avtorka	umetnik
000f0000-55e8-4f10-ee3a-a7d68ee31849	Priredba	Priredba	Priredba	umetnik
000f0000-55e8-4f10-c937-793bf9c4e86b	Prevod	Prevod	Prevod	umetnik
000f0000-55e8-4f10-b473-1f570713bbed	Režija	Režija	Režija	umetnik
000f0000-55e8-4f10-a90d-dcd3f121a1a5	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55e8-4f10-5d02-b4341b3e243c	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55e8-4f10-5c0c-e828bb121d58	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55e8-4f10-09d6-cb0773dd96e9	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55e8-4f10-7b2c-91f7b5408561	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55e8-4f10-acef-0730063ae796	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55e8-4f10-f6bf-1b0bfc406579	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55e8-4f10-859d-59b7cd667cad	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55e8-4f10-b219-9bb217fe77b4	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55e8-4f10-e6f9-71327fc91139	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55e8-4f11-7e7c-1aea3d9f37c4	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55e8-4f11-7086-d0af8eb2dbb2	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55e8-4f11-8dc5-0f3725416e55	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55e8-4f11-9907-7f6a99af18be	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2964 (class 0 OID 17249243)
-- Dependencies: 229
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55e8-4f10-8965-385bbf6d600a	01	Velika predstava	f	1.00	1.00
002b0000-55e8-4f10-d9e6-8ff2c8c3a073	02	Mala predstava	f	0.50	0.50
002b0000-55e8-4f10-eefc-71ab0401a89f	03	Mala koprodukcija	t	0.40	1.00
002b0000-55e8-4f10-f847-fb59b19c7911	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55e8-4f10-8232-38d5996b6670	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2921 (class 0 OID 17248696)
-- Dependencies: 186
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 17248543)
-- Dependencies: 173
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55e8-4f11-2388-eee8dc4104d2	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROpoennLBOe6OrgLYNE1l2jSsqwW6Ql42	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55e8-4f12-6dc3-d4e3d44e6ae7	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55e8-4f12-3413-7d9d8cd94559	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55e8-4f12-3b27-2d6429fc3921	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55e8-4f12-d525-279fcfabb106	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55e8-4f12-2185-bcb0dc259479	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55e8-4f12-299e-d2800bfbc08f	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55e8-4f12-c8d5-479acd2d2a04	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55e8-4f12-5d8a-87537b52baac	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55e8-4f12-6dd6-9a930fdb2335	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55e8-4f12-479b-778b9d2df72e	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55e8-4f11-32f8-57f449599b4a	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2956 (class 0 OID 17249061)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55e8-4f13-7e68-aded4f88e624	00160000-55e8-4f12-c83a-5d7a356b94b9	\N	00140000-55e8-4f11-992a-9eb74cd1b74c	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55e8-4f12-856f-c02a1d8462be
000e0000-55e8-4f13-8f8c-4398144905cb	00160000-55e8-4f12-3cbf-fbd2cd8faa25	\N	00140000-55e8-4f11-ce88-72e1e4629466	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55e8-4f12-0e02-57d7de54bb22
000e0000-55e8-4f13-a452-e9078b4faa8b	\N	\N	00140000-55e8-4f11-ce88-72e1e4629466	00190000-55e8-4f12-1b0a-325960d59111	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55e8-4f12-856f-c02a1d8462be
000e0000-55e8-4f13-fc6f-3aa710d7fa8c	\N	\N	00140000-55e8-4f11-ce88-72e1e4629466	00190000-55e8-4f12-1b0a-325960d59111	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55e8-4f12-856f-c02a1d8462be
000e0000-55e8-4f13-9a5d-0ebb7f926289	\N	\N	00140000-55e8-4f11-ce88-72e1e4629466	00190000-55e8-4f12-1b0a-325960d59111	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55e8-4f12-3854-5002dc22a225
000e0000-55e8-4f13-d7b6-c0c55b767ebd	\N	\N	00140000-55e8-4f11-ce88-72e1e4629466	00190000-55e8-4f12-1b0a-325960d59111	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55e8-4f12-3854-5002dc22a225
\.


--
-- TOC entry 2926 (class 0 OID 17248757)
-- Dependencies: 191
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55e8-4f13-9a46-f17d8df1f410	000e0000-55e8-4f13-8f8c-4398144905cb	\N	1	
00200000-55e8-4f13-5992-c80116de02d9	000e0000-55e8-4f13-8f8c-4398144905cb	\N	2	
\.


--
-- TOC entry 2940 (class 0 OID 17248884)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 17248987)
-- Dependencies: 215
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55e8-4f11-b72f-23aa1879e73b	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55e8-4f11-948a-7ca4aaa2b43c	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55e8-4f11-c8e5-c94a2ceecb72	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55e8-4f11-c6a4-73111b856679	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55e8-4f11-eedb-56894cf4d40d	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55e8-4f11-cc35-9305174fa6af	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55e8-4f11-5e06-a1cae2f619b6	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55e8-4f11-834c-2c06f9f76888	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55e8-4f11-d52e-9ec8cafcc706	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55e8-4f11-96ec-b78c0dc69208	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55e8-4f11-7f65-54aae1d93abd	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55e8-4f11-1dd7-f76968980e43	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55e8-4f11-41a4-e7b5ab8a6c1b	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55e8-4f11-d372-50b29b1b9f33	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55e8-4f11-d331-3650a2428bd6	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55e8-4f11-b649-10104f0fb4c5	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55e8-4f11-38bf-10f94b8b5641	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55e8-4f11-3dc9-213b343d99d8	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55e8-4f11-765b-469cc1ee574c	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55e8-4f11-27a3-f9d796cc96c0	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55e8-4f11-80af-d104c1cae003	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55e8-4f11-8ffd-cbe1efea1c79	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55e8-4f11-1126-7178338b15f3	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55e8-4f11-a477-ff3aadc78185	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55e8-4f11-c88d-d94c3eafbee7	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55e8-4f11-7b17-7d7e563d1f99	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55e8-4f11-d162-bef9fa315c59	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55e8-4f11-a370-84195bdf9a8a	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2970 (class 0 OID 17249313)
-- Dependencies: 235
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 17249285)
-- Dependencies: 234
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 17249325)
-- Dependencies: 236
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 17248956)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55e8-4f13-2527-108a10ac9957	00090000-55e8-4f12-0436-166945f52b1e	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e8-4f13-8763-70f33381eb0d	00090000-55e8-4f12-0f0f-99128bd7f4eb	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e8-4f13-8617-e42f50302d9c	00090000-55e8-4f12-6ad6-80a1f14ab0d2	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e8-4f13-2ee0-223e7f6068ea	00090000-55e8-4f12-09fa-baf88af8db7a	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e8-4f13-23d7-1d9d5904967c	00090000-55e8-4f12-e46d-c43a05b11d48	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e8-4f13-f013-d2a1e7b7bcf7	00090000-55e8-4f12-2880-a89d5e242318	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2928 (class 0 OID 17248793)
-- Dependencies: 193
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2955 (class 0 OID 17249051)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55e8-4f11-992a-9eb74cd1b74c	01	Drama	drama (SURS 01)
00140000-55e8-4f11-9d08-459c2f598735	02	Opera	opera (SURS 02)
00140000-55e8-4f11-1dc7-f780ba4d11e0	03	Balet	balet (SURS 03)
00140000-55e8-4f11-dfcb-c01302c7bc5d	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55e8-4f11-bdc1-5d3736ac4e65	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55e8-4f11-ce88-72e1e4629466	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55e8-4f11-3274-dfd3b80e95a8	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2946 (class 0 OID 17248946)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2454 (class 2606 OID 17248597)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 17249110)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 17249100)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 17249012)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 17249365)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 17248782)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 17248802)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 17249259)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 17248722)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 17249165)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 17248942)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 17248755)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 17248736)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 17248849)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 17249342)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 17249349)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2697 (class 2606 OID 17249373)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 16867881)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2556 (class 2606 OID 17248876)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 17248694)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 17248606)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 17248630)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 17248586)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2445 (class 2606 OID 17248571)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 17248882)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 17248918)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 17249046)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 17248658)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 17248682)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 17248855)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 17248672)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 17248743)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 17248867)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 17249222)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 17249230)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 17249213)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 17249241)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 17248900)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 17248840)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 17248831)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 17249034)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 17248970)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 17248542)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 17248909)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 17248560)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2447 (class 2606 OID 17248580)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 17248927)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 17248862)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 17248811)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 17249283)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 17249271)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 17249265)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 17248983)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 17248639)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 17248822)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 17249023)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 17249253)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 17248707)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 17248555)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 17249079)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 17248765)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 17248890)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 17248995)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 17249323)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 17249307)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 17249331)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 17248961)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 17248797)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 17249059)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 17248954)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 1259 OID 17248791)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2510 (class 1259 OID 17248792)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2511 (class 1259 OID 17248790)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2512 (class 1259 OID 17248789)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2594 (class 1259 OID 17248984)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2595 (class 1259 OID 17248985)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2596 (class 1259 OID 17248986)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2683 (class 1259 OID 17249344)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2684 (class 1259 OID 17249343)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2468 (class 1259 OID 17248660)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2557 (class 1259 OID 17248883)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2670 (class 1259 OID 17249311)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2671 (class 1259 OID 17249310)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2672 (class 1259 OID 17249312)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2673 (class 1259 OID 17249309)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2674 (class 1259 OID 17249308)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2551 (class 1259 OID 17248869)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2552 (class 1259 OID 17248868)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2504 (class 1259 OID 17248766)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 17248943)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 17248945)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2583 (class 1259 OID 17248944)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2493 (class 1259 OID 17248738)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2494 (class 1259 OID 17248737)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2653 (class 1259 OID 17249242)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2607 (class 1259 OID 17249048)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2608 (class 1259 OID 17249049)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2609 (class 1259 OID 17249050)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2680 (class 1259 OID 17249332)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2616 (class 1259 OID 17249084)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2617 (class 1259 OID 17249081)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2618 (class 1259 OID 17249085)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2619 (class 1259 OID 17249083)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2620 (class 1259 OID 17249082)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2483 (class 1259 OID 17248709)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2484 (class 1259 OID 17248708)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2459 (class 1259 OID 17248633)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2569 (class 1259 OID 17248910)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2449 (class 1259 OID 17248587)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2450 (class 1259 OID 17248588)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2574 (class 1259 OID 17248930)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2575 (class 1259 OID 17248929)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2576 (class 1259 OID 17248928)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2497 (class 1259 OID 17248744)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2498 (class 1259 OID 17248745)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2663 (class 1259 OID 17249273)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2531 (class 1259 OID 17248835)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2532 (class 1259 OID 17248833)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2533 (class 1259 OID 17248832)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2534 (class 1259 OID 17248834)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2440 (class 1259 OID 17248561)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2441 (class 1259 OID 17248562)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2560 (class 1259 OID 17248891)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2693 (class 1259 OID 17249366)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2694 (class 1259 OID 17249374)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2695 (class 1259 OID 17249375)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2546 (class 1259 OID 17248856)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2590 (class 1259 OID 17248971)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2591 (class 1259 OID 17248972)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 17249170)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2638 (class 1259 OID 17249169)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2639 (class 1259 OID 17249166)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2640 (class 1259 OID 17249167)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2641 (class 1259 OID 17249168)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2472 (class 1259 OID 17248674)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2473 (class 1259 OID 17248673)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2474 (class 1259 OID 17248675)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2563 (class 1259 OID 17248904)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2564 (class 1259 OID 17248903)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2645 (class 1259 OID 17249223)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2646 (class 1259 OID 17249224)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2630 (class 1259 OID 17249114)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 17249115)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2632 (class 1259 OID 17249112)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2633 (class 1259 OID 17249113)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2587 (class 1259 OID 17248962)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2537 (class 1259 OID 17248844)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2538 (class 1259 OID 17248843)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2539 (class 1259 OID 17248841)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2540 (class 1259 OID 17248842)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2626 (class 1259 OID 17249102)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2627 (class 1259 OID 17249101)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2642 (class 1259 OID 17249214)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2503 (class 1259 OID 17248756)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2660 (class 1259 OID 17249260)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2687 (class 1259 OID 17249350)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2688 (class 1259 OID 17249351)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2455 (class 1259 OID 17248608)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2456 (class 1259 OID 17248607)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2464 (class 1259 OID 17248640)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 17248641)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2526 (class 1259 OID 17248825)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2527 (class 1259 OID 17248824)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2528 (class 1259 OID 17248823)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2513 (class 1259 OID 17248784)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2514 (class 1259 OID 17248785)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2515 (class 1259 OID 17248783)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2516 (class 1259 OID 17248787)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2517 (class 1259 OID 17248788)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2518 (class 1259 OID 17248786)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2471 (class 1259 OID 17248659)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2489 (class 1259 OID 17248723)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2490 (class 1259 OID 17248725)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2491 (class 1259 OID 17248724)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2492 (class 1259 OID 17248726)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2545 (class 1259 OID 17248850)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2612 (class 1259 OID 17249047)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 17249080)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2462 (class 1259 OID 17248631)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2463 (class 1259 OID 17248632)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2584 (class 1259 OID 17248955)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 17249284)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 17248695)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2666 (class 1259 OID 17249272)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2567 (class 1259 OID 17248902)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2568 (class 1259 OID 17248901)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2634 (class 1259 OID 17249111)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2479 (class 1259 OID 17248683)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 17249060)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2677 (class 1259 OID 17249324)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2651 (class 1259 OID 17249231)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2652 (class 1259 OID 17249232)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2525 (class 1259 OID 17248812)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2448 (class 1259 OID 17248581)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2725 (class 2606 OID 17249491)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2724 (class 2606 OID 17249496)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2720 (class 2606 OID 17249516)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2726 (class 2606 OID 17249486)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2722 (class 2606 OID 17249506)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2721 (class 2606 OID 17249511)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2723 (class 2606 OID 17249501)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2758 (class 2606 OID 17249666)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2757 (class 2606 OID 17249671)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2756 (class 2606 OID 17249676)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2791 (class 2606 OID 17249846)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2792 (class 2606 OID 17249841)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2708 (class 2606 OID 17249426)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2742 (class 2606 OID 17249596)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2786 (class 2606 OID 17249826)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2787 (class 2606 OID 17249821)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2785 (class 2606 OID 17249831)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2788 (class 2606 OID 17249816)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2789 (class 2606 OID 17249811)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2740 (class 2606 OID 17249591)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2741 (class 2606 OID 17249586)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2719 (class 2606 OID 17249481)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2752 (class 2606 OID 17249636)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2750 (class 2606 OID 17249646)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2751 (class 2606 OID 17249641)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2714 (class 2606 OID 17249461)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2715 (class 2606 OID 17249456)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2738 (class 2606 OID 17249576)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2782 (class 2606 OID 17249796)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2761 (class 2606 OID 17249681)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2760 (class 2606 OID 17249686)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2759 (class 2606 OID 17249691)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2790 (class 2606 OID 17249836)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2763 (class 2606 OID 17249711)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2766 (class 2606 OID 17249696)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2762 (class 2606 OID 17249716)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2764 (class 2606 OID 17249706)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2765 (class 2606 OID 17249701)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2712 (class 2606 OID 17249451)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2713 (class 2606 OID 17249446)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2704 (class 2606 OID 17249411)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2705 (class 2606 OID 17249406)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2746 (class 2606 OID 17249616)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2701 (class 2606 OID 17249386)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2700 (class 2606 OID 17249391)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2747 (class 2606 OID 17249631)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2748 (class 2606 OID 17249626)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2749 (class 2606 OID 17249621)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2717 (class 2606 OID 17249466)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2716 (class 2606 OID 17249471)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2784 (class 2606 OID 17249806)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2730 (class 2606 OID 17249551)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2732 (class 2606 OID 17249541)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2733 (class 2606 OID 17249536)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2731 (class 2606 OID 17249546)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2699 (class 2606 OID 17249376)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2698 (class 2606 OID 17249381)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2743 (class 2606 OID 17249601)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2795 (class 2606 OID 17249861)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2797 (class 2606 OID 17249866)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2796 (class 2606 OID 17249871)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2739 (class 2606 OID 17249581)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2755 (class 2606 OID 17249656)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2754 (class 2606 OID 17249661)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2773 (class 2606 OID 17249771)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2774 (class 2606 OID 17249766)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2777 (class 2606 OID 17249751)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2776 (class 2606 OID 17249756)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2775 (class 2606 OID 17249761)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2710 (class 2606 OID 17249436)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2711 (class 2606 OID 17249431)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2709 (class 2606 OID 17249441)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2744 (class 2606 OID 17249611)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2745 (class 2606 OID 17249606)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2780 (class 2606 OID 17249781)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2779 (class 2606 OID 17249786)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2770 (class 2606 OID 17249741)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2769 (class 2606 OID 17249746)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2772 (class 2606 OID 17249731)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2771 (class 2606 OID 17249736)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2753 (class 2606 OID 17249651)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2734 (class 2606 OID 17249571)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2735 (class 2606 OID 17249566)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2737 (class 2606 OID 17249556)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2736 (class 2606 OID 17249561)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2767 (class 2606 OID 17249726)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2768 (class 2606 OID 17249721)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2778 (class 2606 OID 17249776)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2718 (class 2606 OID 17249476)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2781 (class 2606 OID 17249791)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2783 (class 2606 OID 17249801)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2794 (class 2606 OID 17249851)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2793 (class 2606 OID 17249856)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2702 (class 2606 OID 17249401)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2703 (class 2606 OID 17249396)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2707 (class 2606 OID 17249416)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2706 (class 2606 OID 17249421)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2727 (class 2606 OID 17249531)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2728 (class 2606 OID 17249526)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2729 (class 2606 OID 17249521)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-03 15:45:57 CEST

--
-- PostgreSQL database dump complete
--

