--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-08 15:07:39 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 240 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 240
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 18013092)
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
-- TOC entry 225 (class 1259 OID 18013611)
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
-- TOC entry 224 (class 1259 OID 18013594)
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
-- TOC entry 218 (class 1259 OID 18013502)
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
-- TOC entry 238 (class 1259 OID 18013835)
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
-- TOC entry 194 (class 1259 OID 18013270)
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
-- TOC entry 196 (class 1259 OID 18013301)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 232 (class 1259 OID 18013761)
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
-- TOC entry 189 (class 1259 OID 18013213)
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
-- TOC entry 226 (class 1259 OID 18013624)
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
-- TOC entry 212 (class 1259 OID 18013434)
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
-- TOC entry 192 (class 1259 OID 18013249)
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
-- TOC entry 190 (class 1259 OID 18013230)
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
-- TOC entry 201 (class 1259 OID 18013348)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 18013816)
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
-- TOC entry 237 (class 1259 OID 18013828)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 18013850)
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
-- TOC entry 205 (class 1259 OID 18013373)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 18013187)
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
-- TOC entry 181 (class 1259 OID 18013101)
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
-- TOC entry 182 (class 1259 OID 18013112)
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
    email character varying(255) DEFAULT NULL::character varying,
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
-- TOC entry 177 (class 1259 OID 18013066)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 18013085)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 18013380)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 18013414)
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
-- TOC entry 221 (class 1259 OID 18013543)
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
-- TOC entry 184 (class 1259 OID 18013145)
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
-- TOC entry 186 (class 1259 OID 18013179)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 18013354)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 185 (class 1259 OID 18013164)
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
-- TOC entry 191 (class 1259 OID 18013242)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 204 (class 1259 OID 18013366)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 18013722)
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
-- TOC entry 229 (class 1259 OID 18013732)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 227 (class 1259 OID 18013679)
-- Name: programdela; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programdela (
    id uuid NOT NULL,
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
-- TOC entry 230 (class 1259 OID 18013740)
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
-- TOC entry 208 (class 1259 OID 18013395)
-- Name: prostor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prostor (
    id uuid NOT NULL,
    popa_id uuid,
    naslov_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    jeprizorisce boolean,
    jematicnioder boolean,
    seplanira boolean DEFAULT false NOT NULL,
    kapaciteta integer,
    opis text
);


--
-- TOC entry 200 (class 1259 OID 18013339)
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
-- TOC entry 199 (class 1259 OID 18013329)
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
-- TOC entry 220 (class 1259 OID 18013532)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 18013469)
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
-- TOC entry 174 (class 1259 OID 18013037)
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
-- TOC entry 173 (class 1259 OID 18013035)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 18013408)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 18013075)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 18013059)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 18013422)
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
-- TOC entry 203 (class 1259 OID 18013360)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 18013306)
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
-- TOC entry 172 (class 1259 OID 18013024)
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
-- TOC entry 171 (class 1259 OID 18013016)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 170 (class 1259 OID 18013011)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 216 (class 1259 OID 18013479)
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
-- TOC entry 183 (class 1259 OID 18013137)
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
-- TOC entry 198 (class 1259 OID 18013316)
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
-- TOC entry 219 (class 1259 OID 18013520)
-- Name: tipfunkcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipfunkcije (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text,
    imezenski character varying(255) DEFAULT NULL::character varying,
    podrocje character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 18013750)
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
-- TOC entry 188 (class 1259 OID 18013199)
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
-- TOC entry 175 (class 1259 OID 18013046)
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
-- TOC entry 223 (class 1259 OID 18013569)
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
-- TOC entry 193 (class 1259 OID 18013260)
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
-- TOC entry 207 (class 1259 OID 18013387)
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
-- TOC entry 217 (class 1259 OID 18013493)
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
-- TOC entry 234 (class 1259 OID 18013796)
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
-- TOC entry 233 (class 1259 OID 18013768)
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
-- TOC entry 235 (class 1259 OID 18013808)
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
-- TOC entry 214 (class 1259 OID 18013459)
-- Name: zaposlitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zaposlitev (
    id uuid NOT NULL,
    oseba_id uuid,
    sifra character varying(10) NOT NULL,
    status character varying(10) NOT NULL,
    delovnomesto character varying(255) NOT NULL,
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
-- TOC entry 195 (class 1259 OID 18013296)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 18013559)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 213 (class 1259 OID 18013449)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2178 (class 2604 OID 18013040)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2910 (class 0 OID 18013092)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2955 (class 0 OID 18013611)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55ee-dd99-9b6c-2f6b05bd7442	000d0000-55ee-dd99-c30c-e380a59e39a4	\N	00090000-55ee-dd99-2ab0-7023a5df261d	000b0000-55ee-dd99-4b2b-402ddc546a89	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55ee-dd99-f81a-45967a86f9b0	000d0000-55ee-dd99-363f-97736e33a56c	00100000-55ee-dd99-500b-47edc3b12562	00090000-55ee-dd99-af48-d34e87af0103	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55ee-dd99-dc7e-91b6b18d6764	000d0000-55ee-dd99-31e2-3a2e90f1b81b	00100000-55ee-dd99-2b59-c002023d4eb4	00090000-55ee-dd99-3351-ceec5cc937f7	\N	0003	t	\N	2015-09-08	\N	2	t	\N	f	f
000c0000-55ee-dd99-21c2-c303f455168b	000d0000-55ee-dd99-e9a3-0e3aecb917df	\N	00090000-55ee-dd99-465b-295e3f82c12b	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55ee-dd99-62c2-5466121ef27f	000d0000-55ee-dd99-f5c7-6bcb1c78f2e9	\N	00090000-55ee-dd99-9207-473f81f81439	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55ee-dd99-1a72-dcb4fabd7cc5	000d0000-55ee-dd99-077d-d51e0a8df028	\N	00090000-55ee-dd99-7a81-96bc4eb6d399	000b0000-55ee-dd99-b49f-6455e2f5873c	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55ee-dd99-969f-c6fd64eec67d	000d0000-55ee-dd99-663a-1c30806c2282	00100000-55ee-dd99-141b-41badb41cff7	00090000-55ee-dd99-aceb-f98f8d0d5304	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55ee-dd99-68b9-30eb00050f1c	000d0000-55ee-dd99-c5be-7da65c057c3b	\N	00090000-55ee-dd99-dba8-1d3570400699	000b0000-55ee-dd99-d473-a9c923db9a22	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55ee-dd99-43ca-eccc12df53e3	000d0000-55ee-dd99-663a-1c30806c2282	00100000-55ee-dd99-8a1a-c224daebe0ce	00090000-55ee-dd99-330d-282a8c4af744	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55ee-dd99-f4f1-7d8eace1cb37	000d0000-55ee-dd99-663a-1c30806c2282	00100000-55ee-dd99-ee1f-894892b6c904	00090000-55ee-dd99-680d-1f9316b8f2b8	\N	0010	t	\N	2015-09-08	\N	16	f	\N	f	t
000c0000-55ee-dd99-e20c-4c227f3092ce	000d0000-55ee-dd99-663a-1c30806c2282	00100000-55ee-dd99-b035-52686d3347db	00090000-55ee-dd99-49d2-f0a5d396c075	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
\.


--
-- TOC entry 2954 (class 0 OID 18013594)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 18013502)
-- Dependencies: 218
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55ee-dd99-5c3e-1335b822597d	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55ee-dd99-d60b-99ed6e997d3c	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55ee-dd99-f3db-21eeb2f0f5ee	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2968 (class 0 OID 18013835)
-- Dependencies: 238
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2924 (class 0 OID 18013270)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55ee-dd99-8a6b-c93d9e785e14	\N	\N	00200000-55ee-dd99-7a74-36e8c4ac2b7c	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55ee-dd99-8d86-187af0d05294	\N	\N	00200000-55ee-dd99-ce03-2df7c89d8ab3	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55ee-dd99-b0f6-b431085bed3a	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55ee-dd99-d214-38227688f418	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55ee-dd99-f851-0a1f231cd86b	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2926 (class 0 OID 18013301)
-- Dependencies: 196
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 18013761)
-- Dependencies: 232
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 18013213)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55ee-dd97-b9c2-e95e57c80c12	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55ee-dd97-6491-386374328a83	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55ee-dd97-99ee-b7f0ad0a9461	AL	ALB	008	Albania 	Albanija	\N
00040000-55ee-dd97-31de-e5da17596f8e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55ee-dd97-03f8-0e8291626f8a	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55ee-dd97-1d1b-622bb4e3b55f	AD	AND	020	Andorra 	Andora	\N
00040000-55ee-dd97-8497-6aebcea56053	AO	AGO	024	Angola 	Angola	\N
00040000-55ee-dd97-e45d-b071928832ee	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55ee-dd97-af1f-f7f79e5b072a	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55ee-dd97-7ca6-596f56ed0a49	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55ee-dd97-4f26-6620ac6bb49e	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55ee-dd97-88e5-d3795d8475da	AM	ARM	051	Armenia 	Armenija	\N
00040000-55ee-dd97-d20f-7d448f9f7111	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55ee-dd97-3f89-e608af8f7fef	AU	AUS	036	Australia 	Avstralija	\N
00040000-55ee-dd97-7ddb-699a025fab62	AT	AUT	040	Austria 	Avstrija	\N
00040000-55ee-dd97-5999-16ce68a1d1e9	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55ee-dd97-64e3-e21b1c252d59	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55ee-dd97-bc00-0798ca79457b	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55ee-dd97-c361-e8812ed1ab52	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55ee-dd97-371b-9dea0021956c	BB	BRB	052	Barbados 	Barbados	\N
00040000-55ee-dd97-49a9-58e25b0e1a9f	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55ee-dd97-af67-0fb2d71f2bd8	BE	BEL	056	Belgium 	Belgija	\N
00040000-55ee-dd97-7338-731bb47e3628	BZ	BLZ	084	Belize 	Belize	\N
00040000-55ee-dd97-f917-beddaf3be742	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55ee-dd97-4d95-0c88e9001c5d	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55ee-dd97-9003-4de1a260d602	BT	BTN	064	Bhutan 	Butan	\N
00040000-55ee-dd97-e1c5-fe855f6fb2a0	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55ee-dd97-a71a-4f4ff94f966d	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55ee-dd97-6982-e1d398549fa7	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55ee-dd97-5fb4-74ac6882a54f	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55ee-dd97-6796-8c7815f11d65	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55ee-dd97-5bc3-2a6a03dfcaee	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55ee-dd97-efa2-47090eddab14	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55ee-dd97-09da-5b9ee19529af	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55ee-dd97-a100-0d00a0665499	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55ee-dd97-9709-9df53c892c1c	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55ee-dd97-a0f0-2fcde8704232	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55ee-dd97-8984-7ffa4727928b	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55ee-dd97-84b9-95ace41668ba	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55ee-dd97-205a-a2d491c50199	CA	CAN	124	Canada 	Kanada	\N
00040000-55ee-dd97-281b-8b58a176d816	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55ee-dd97-0487-862ddee00ac4	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55ee-dd97-446d-f96529393434	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55ee-dd97-4bdd-86d37da8ef7b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55ee-dd97-7db8-32d9580202e5	CL	CHL	152	Chile 	Čile	\N
00040000-55ee-dd97-9c3c-1fb03d4300ef	CN	CHN	156	China 	Kitajska	\N
00040000-55ee-dd97-94a0-ac0c2fc870b5	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55ee-dd97-323b-b16ecb11ee34	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55ee-dd97-4c71-ab0c9cdcd48a	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55ee-dd97-7835-6d857b619928	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55ee-dd97-953c-665696e1d234	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55ee-dd97-4cb6-4fa0b7f96247	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55ee-dd97-6e7d-8d2042f1271a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55ee-dd97-d504-7ca2b6351a9a	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55ee-dd97-18a2-6b496d5a92f2	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55ee-dd97-b316-6785605c00ce	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55ee-dd97-85c1-94c361689fd8	CU	CUB	192	Cuba 	Kuba	\N
00040000-55ee-dd97-6f5f-98425eb8dad7	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55ee-dd97-5484-94a1da3c1890	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55ee-dd97-bcb2-92b9266f2cd6	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55ee-dd97-eec7-4ba541ba6520	DK	DNK	208	Denmark 	Danska	\N
00040000-55ee-dd97-c496-13ed7b4f8616	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55ee-dd97-7841-d89ddfa74492	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55ee-dd97-96e6-2798ac894119	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55ee-dd97-467b-f12e5fc72051	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55ee-dd97-e5e8-c32486d9e633	EG	EGY	818	Egypt 	Egipt	\N
00040000-55ee-dd97-409e-1e16667b1675	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55ee-dd97-9669-080edc0a667a	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55ee-dd97-672e-f5fb33b93773	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55ee-dd97-eff7-19bcf40e4b5e	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55ee-dd97-7675-cde9a88d472a	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55ee-dd97-ea57-ac683ccec4dc	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55ee-dd97-3d71-0de512b35f11	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55ee-dd97-0e80-81235eb5769b	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55ee-dd97-39c8-3e2ba4f95d9b	FI	FIN	246	Finland 	Finska	\N
00040000-55ee-dd97-efdd-bd74f13291f3	FR	FRA	250	France 	Francija	\N
00040000-55ee-dd97-26fa-be4a01cda65c	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55ee-dd98-4596-b6710b44b42a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55ee-dd97-c2f8-bb316208ccc8	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55ee-dd97-0d78-28c9ccfee17f	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55ee-dd97-f326-bbfc8d605d2f	GA	GAB	266	Gabon 	Gabon	\N
00040000-55ee-dd97-0da0-4a4945cc035e	GM	GMB	270	Gambia 	Gambija	\N
00040000-55ee-dd97-2a61-12110f6df588	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55ee-dd97-a4a1-c6f9386ad5c5	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55ee-dd97-bcd0-4b85e5b8170e	GH	GHA	288	Ghana 	Gana	\N
00040000-55ee-dd97-19e4-ef9d21129079	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55ee-dd97-e764-851f42b16cab	GR	GRC	300	Greece 	Grčija	\N
00040000-55ee-dd97-9232-cb2acc6250dd	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55ee-dd97-dd3d-97eb244bcd6d	GD	GRD	308	Grenada 	Grenada	\N
00040000-55ee-dd97-b258-b83d2dbb1699	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55ee-dd97-d9cc-b6b247a3dcc2	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55ee-dd97-70f8-4077f394ba18	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55ee-dd97-77f4-44589de13baa	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55ee-dd97-6470-7b1caefbbcc7	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55ee-dd97-9f53-d87fae0e2dab	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55ee-dd97-52d5-ab0765803622	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55ee-dd97-16bb-848592d20194	HT	HTI	332	Haiti 	Haiti	\N
00040000-55ee-dd97-3e6c-d05efa4bf1e1	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55ee-dd97-5b57-c53d1993968f	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55ee-dd97-82d6-d889116b1057	HN	HND	340	Honduras 	Honduras	\N
00040000-55ee-dd97-0716-a34fceb54f1e	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55ee-dd97-1e1b-31f1f84b8149	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55ee-dd98-d33f-13220d6a4a4c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55ee-dd98-9248-e9b0bee45613	IN	IND	356	India 	Indija	\N
00040000-55ee-dd98-cb7e-d00460546df3	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55ee-dd98-ce09-c2605bce2dfc	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55ee-dd98-df89-17850eece555	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55ee-dd98-b766-ce68cbd060f1	IE	IRL	372	Ireland 	Irska	\N
00040000-55ee-dd98-cb65-8fb6b9e98b98	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55ee-dd98-fa04-1f6322c0fa0f	IL	ISR	376	Israel 	Izrael	\N
00040000-55ee-dd98-925f-f9f6e4c3912f	IT	ITA	380	Italy 	Italija	\N
00040000-55ee-dd98-3ee7-6bfb483da072	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55ee-dd98-e45b-ed99483f1e8d	JP	JPN	392	Japan 	Japonska	\N
00040000-55ee-dd98-8db2-5386413fc38c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55ee-dd98-a922-8f981ad0d60f	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55ee-dd98-108b-e8d575170465	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55ee-dd98-328a-1bd8a056d9c4	KE	KEN	404	Kenya 	Kenija	\N
00040000-55ee-dd98-572f-31a146c92549	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55ee-dd98-1c21-2aa3c1c50550	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55ee-dd98-198b-3c73cd2e94f5	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55ee-dd98-1dd9-53934ab9cf27	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55ee-dd98-62bc-0655088d5f86	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55ee-dd98-10cd-49edff88fc47	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55ee-dd98-935b-9e37f71cbd33	LV	LVA	428	Latvia 	Latvija	\N
00040000-55ee-dd98-403a-e7edbec641bb	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55ee-dd98-01ca-91f26efc499f	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55ee-dd98-bdf0-db859015102c	LR	LBR	430	Liberia 	Liberija	\N
00040000-55ee-dd98-dd9d-ec5d8e726dea	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55ee-dd98-21b9-96733064dbe4	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55ee-dd98-62d4-72e60dc133f7	LT	LTU	440	Lithuania 	Litva	\N
00040000-55ee-dd98-5f62-3bb5c35be767	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55ee-dd98-7757-8c4e66066982	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55ee-dd98-287c-14c73ab2012c	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55ee-dd98-2d4f-4f8917bf604b	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55ee-dd98-3b29-1385ed170bc4	MW	MWI	454	Malawi 	Malavi	\N
00040000-55ee-dd98-8e7b-7f04f5b7ed5a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55ee-dd98-4285-5579591db282	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55ee-dd98-e274-520683dffd5e	ML	MLI	466	Mali 	Mali	\N
00040000-55ee-dd98-fd57-4977748eb2da	MT	MLT	470	Malta 	Malta	\N
00040000-55ee-dd98-b3c4-2a730521d653	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55ee-dd98-bd08-5e19dc555f82	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55ee-dd98-0a93-1a1344dbdc55	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55ee-dd98-2ddb-5f5fb7f8ee71	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55ee-dd98-d66e-d7d52b75bd3b	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55ee-dd98-811f-547b4f384cf1	MX	MEX	484	Mexico 	Mehika	\N
00040000-55ee-dd98-fc62-5affcb14f6d9	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55ee-dd98-f12b-7505ed79ce1a	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55ee-dd98-cc4b-e1cd08bcb1b9	MC	MCO	492	Monaco 	Monako	\N
00040000-55ee-dd98-9f6f-e55535cac0cb	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55ee-dd98-d780-d218cb187a95	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55ee-dd98-daa2-8c594f26d12c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55ee-dd98-c2b6-ff69342e1e2d	MA	MAR	504	Morocco 	Maroko	\N
00040000-55ee-dd98-8558-732ec6405ad2	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55ee-dd98-bca0-56d470c22e66	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55ee-dd98-5cd4-a5196b64b883	NA	NAM	516	Namibia 	Namibija	\N
00040000-55ee-dd98-9875-9db94dc52d99	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55ee-dd98-a2fb-55c8eb77ea84	NP	NPL	524	Nepal 	Nepal	\N
00040000-55ee-dd98-4f85-9469c843b32e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55ee-dd98-ba79-895fc816f58d	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55ee-dd98-4aa6-65f7f8e95af0	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55ee-dd98-1ff4-a08c8a3848e1	NE	NER	562	Niger 	Niger 	\N
00040000-55ee-dd98-e36e-40f3e4012854	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55ee-dd98-1c32-86370d7475f7	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55ee-dd98-a646-04ebdeaf8ec5	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55ee-dd98-79ae-2bd75407cf33	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55ee-dd98-787c-37bf92aab6ca	NO	NOR	578	Norway 	Norveška	\N
00040000-55ee-dd98-6aa1-24d5543ce829	OM	OMN	512	Oman 	Oman	\N
00040000-55ee-dd98-7e33-c469115c741d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55ee-dd98-a81d-cc3b39596bdd	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55ee-dd98-8298-81d23e1a36b2	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55ee-dd98-4c39-19b9d08c24fd	PA	PAN	591	Panama 	Panama	\N
00040000-55ee-dd98-a60a-9069e2932e07	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55ee-dd98-a801-5ac88b72e87c	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55ee-dd98-fb6b-fb8820c41ca8	PE	PER	604	Peru 	Peru	\N
00040000-55ee-dd98-394a-1a678048ff66	PH	PHL	608	Philippines 	Filipini	\N
00040000-55ee-dd98-ee56-0512663d1ab5	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55ee-dd98-2e7b-81e1fb8e333c	PL	POL	616	Poland 	Poljska	\N
00040000-55ee-dd98-ce4a-bc853dfcf6af	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55ee-dd98-db72-303aed25debe	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55ee-dd98-e30e-a3bd007ecf2b	QA	QAT	634	Qatar 	Katar	\N
00040000-55ee-dd98-7011-33003bab61cc	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55ee-dd98-379b-9d238229f9b7	RO	ROU	642	Romania 	Romunija	\N
00040000-55ee-dd98-3faf-4460561fafaf	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55ee-dd98-e869-d6bac6be1df6	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55ee-dd98-a3a9-3fb1dc008105	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55ee-dd98-e0fa-3d872b2812ba	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55ee-dd98-544b-53ac0304a0a6	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55ee-dd98-910e-b3806874d333	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55ee-dd98-18ff-9d8e157956a1	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55ee-dd98-a060-d200ed5c5159	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55ee-dd98-2145-0c8543c166d2	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55ee-dd98-5e33-7fa91321172f	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55ee-dd98-915b-5d5045bc8a99	SM	SMR	674	San Marino 	San Marino	\N
00040000-55ee-dd98-2004-6b03c071ddeb	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55ee-dd98-abbe-5f60a4b3a33d	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55ee-dd98-6505-5ac6f82e94cb	SN	SEN	686	Senegal 	Senegal	\N
00040000-55ee-dd98-a66b-c6cbef527772	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55ee-dd98-92cd-73f137f50492	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55ee-dd98-9b13-10f3d30f2a61	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55ee-dd98-fe88-503ee81d82d3	SG	SGP	702	Singapore 	Singapur	\N
00040000-55ee-dd98-fe07-b12326b85e94	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55ee-dd98-d08e-4d5d814910ef	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55ee-dd98-aa38-7fc813528c43	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55ee-dd98-5792-5cfde8be28a0	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55ee-dd98-bc7a-fd939ce42f8a	SO	SOM	706	Somalia 	Somalija	\N
00040000-55ee-dd98-7a4d-75a64d94f5cf	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55ee-dd98-cfde-c986867fee11	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55ee-dd98-ada9-ee0295112802	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55ee-dd98-4c77-b7b154cbfc9d	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55ee-dd98-f2cf-6302f81cc126	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55ee-dd98-58ca-cffe048b0b50	SD	SDN	729	Sudan 	Sudan	\N
00040000-55ee-dd98-a0a5-ca4b28f6c3dc	SR	SUR	740	Suriname 	Surinam	\N
00040000-55ee-dd98-c1f8-d5abd1a3f570	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55ee-dd98-6aeb-464566e83fb3	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55ee-dd98-a3ef-b3131ac34cbc	SE	SWE	752	Sweden 	Švedska	\N
00040000-55ee-dd98-9739-5356dd13311a	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55ee-dd98-24fd-73bafd759cc8	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55ee-dd98-72a0-6014c118cae1	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55ee-dd98-87f7-f36fe2c56049	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55ee-dd98-1ba2-f9937f888381	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55ee-dd98-6b20-5d60ee129be6	TH	THA	764	Thailand 	Tajska	\N
00040000-55ee-dd98-6f3e-8bf5a96ba57e	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55ee-dd98-19d5-94c7c1a1564d	TG	TGO	768	Togo 	Togo	\N
00040000-55ee-dd98-3f05-260f1a8f4d69	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55ee-dd98-ba5e-2f70fd10abc3	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55ee-dd98-3248-586125cc1c6b	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55ee-dd98-956b-a48b3ff0d459	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55ee-dd98-571e-7dcffb3a2813	TR	TUR	792	Turkey 	Turčija	\N
00040000-55ee-dd98-3ed7-63fe7ecf446c	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55ee-dd98-9a33-8e0be712131d	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ee-dd98-90f9-91f5ce07c868	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55ee-dd98-6034-f4164e36838d	UG	UGA	800	Uganda 	Uganda	\N
00040000-55ee-dd98-f5bf-3543ad0c00f1	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55ee-dd98-6469-4e23fa1ba8b2	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55ee-dd98-55ed-7d53451cb27a	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55ee-dd98-f4a1-9e67e629fdd0	US	USA	840	United States 	Združene države Amerike	\N
00040000-55ee-dd98-f8b2-09618e33ff98	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55ee-dd98-abfe-1ed6bd54269e	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55ee-dd98-4035-d29c959617b6	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55ee-dd98-fd31-114ed61cbd81	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55ee-dd98-8fee-38ea21098b36	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55ee-dd98-1960-26f299fb3d4f	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55ee-dd98-4af6-f0e848ad57c9	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ee-dd98-2839-64b684c607d1	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55ee-dd98-5a85-0211f4ef66f3	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55ee-dd98-ca9f-78ff9f73122f	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55ee-dd98-afd8-6e8c0e431148	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55ee-dd98-18a2-dc72d9da0459	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55ee-dd98-8a5f-8b2e781b5a17	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2956 (class 0 OID 18013624)
-- Dependencies: 226
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55ee-dd99-5e10-b941807050b1	000e0000-55ee-dd99-a7c0-a26d5136d077	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ee-dd97-0a52-34a9fbfa606b	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ee-dd99-452c-7211ceaa2de9	000e0000-55ee-dd99-9c95-37e068fcb1d0	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ee-dd97-507b-a1c8747d140b	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ee-dd99-4605-05730c1e61c2	000e0000-55ee-dd99-7a3c-c1bdc2af3c95	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ee-dd97-0a52-34a9fbfa606b	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ee-dd99-1705-c8e36aadba35	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ee-dd99-0c75-62f3828bed4b	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2942 (class 0 OID 18013434)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55ee-dd99-c30c-e380a59e39a4	000e0000-55ee-dd99-9c95-37e068fcb1d0	000c0000-55ee-dd99-9b6c-2f6b05bd7442	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55ee-dd97-6397-fd10fa83f27b
000d0000-55ee-dd99-363f-97736e33a56c	000e0000-55ee-dd99-9c95-37e068fcb1d0	000c0000-55ee-dd99-f81a-45967a86f9b0	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55ee-dd97-98cf-119b32025cc7
000d0000-55ee-dd99-31e2-3a2e90f1b81b	000e0000-55ee-dd99-9c95-37e068fcb1d0	000c0000-55ee-dd99-dc7e-91b6b18d6764	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55ee-dd97-bbb2-e233991d9746
000d0000-55ee-dd99-e9a3-0e3aecb917df	000e0000-55ee-dd99-9c95-37e068fcb1d0	000c0000-55ee-dd99-21c2-c303f455168b	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55ee-dd97-86ea-5750f66a8fde
000d0000-55ee-dd99-f5c7-6bcb1c78f2e9	000e0000-55ee-dd99-9c95-37e068fcb1d0	000c0000-55ee-dd99-62c2-5466121ef27f	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55ee-dd97-86ea-5750f66a8fde
000d0000-55ee-dd99-077d-d51e0a8df028	000e0000-55ee-dd99-9c95-37e068fcb1d0	000c0000-55ee-dd99-1a72-dcb4fabd7cc5	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55ee-dd97-6397-fd10fa83f27b
000d0000-55ee-dd99-663a-1c30806c2282	000e0000-55ee-dd99-9c95-37e068fcb1d0	000c0000-55ee-dd99-43ca-eccc12df53e3	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55ee-dd97-6397-fd10fa83f27b
000d0000-55ee-dd99-c5be-7da65c057c3b	000e0000-55ee-dd99-9c95-37e068fcb1d0	000c0000-55ee-dd99-68b9-30eb00050f1c	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55ee-dd97-9f75-881c18e721e0
\.


--
-- TOC entry 2922 (class 0 OID 18013249)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 18013230)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55ee-dd99-d60e-a105ee5320da	00080000-55ee-dd99-6879-6701cfa37761	00090000-55ee-dd99-680d-1f9316b8f2b8	AK		igralka
\.


--
-- TOC entry 2931 (class 0 OID 18013348)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 18013816)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 18013828)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 18013850)
-- Dependencies: 239
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 18013373)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2917 (class 0 OID 18013187)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55ee-dd98-e7d4-57d95a4753b3	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55ee-dd98-8b6f-95b767736984	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55ee-dd98-ce26-379ff9baaa67	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55ee-dd98-e84f-57af7be5b436	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55ee-dd98-ced1-ee59cf3511c3	dogodek.status	array	a:7:{i:100;a:1:{s:5:"label";s:11:"Dolgoročno";}i:200;a:1:{s:5:"label";s:9:"Planirano";}i:300;a:1:{s:5:"label";s:8:"Fiksiran";}i:400;a:1:{s:5:"label";s:17:"Potrjen - interno";}i:500;a:1:{s:5:"label";s:15:"Potrjen - javno";}i:600;a:1:{s:5:"label";s:10:"Zaključen";}i:700;a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55ee-dd98-4880-5384004cf790	dogodek.razred	array	a:5:{i:100;a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}i:200;a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}i:300;a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}i:400;a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}i:500;a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55ee-dd98-82e5-f00aae762570	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55ee-dd98-586a-39a64e8d1576	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55ee-dd98-efb2-cf80ba1d720b	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55ee-dd98-2135-826f4372687e	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55ee-dd98-e575-8453d3e9de43	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55ee-dd98-df88-8858ee66890f	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55ee-dd98-bd84-c9edfdf66e18	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55ee-dd98-e333-7173c0c87ce4	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55ee-dd99-ad88-08f17beaeed0	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55ee-dd99-5c9c-cd65bfe18b0b	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55ee-dd99-e78f-a7ac50712420	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55ee-dd99-42a5-a2279af0be69	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55ee-dd99-9d33-f8b9828cf2e9	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55ee-dd9a-400f-6f77d72abae2	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2911 (class 0 OID 18013101)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55ee-dd99-585e-446aeb642506	00000000-55ee-dd99-ad88-08f17beaeed0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55ee-dd99-8d5b-0b3b9fb8ca85	00000000-55ee-dd99-ad88-08f17beaeed0	00010000-55ee-dd98-3a2a-66995a9b6d3f	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55ee-dd99-9af3-a15ea66938b5	00000000-55ee-dd99-5c9c-cd65bfe18b0b	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2912 (class 0 OID 18013112)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55ee-dd99-2ab0-7023a5df261d	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55ee-dd99-465b-295e3f82c12b	00010000-55ee-dd99-ad2a-021c9180bae3	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55ee-dd99-3351-ceec5cc937f7	00010000-55ee-dd99-3352-68cb5ab67e75	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55ee-dd99-330d-282a8c4af744	00010000-55ee-dd99-774b-998479763506	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55ee-dd99-0c96-86941b10d6d0	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55ee-dd99-7a81-96bc4eb6d399	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55ee-dd99-49d2-f0a5d396c075	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55ee-dd99-aceb-f98f8d0d5304	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55ee-dd99-680d-1f9316b8f2b8	00010000-55ee-dd99-cb47-6daf1614fd4a	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55ee-dd99-af48-d34e87af0103	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55ee-dd99-cfe6-132b7210f712	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55ee-dd99-9207-473f81f81439	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55ee-dd99-dba8-1d3570400699	00010000-55ee-dd99-0e4a-1d2c91c76a27	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2907 (class 0 OID 18013066)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55ee-dd98-f72e-17d80f0b5b17	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55ee-dd98-f78f-161f274988aa	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55ee-dd98-b49a-08eeb0a4943e	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55ee-dd98-ab52-02587f284223	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55ee-dd98-2dc9-f529b099d904	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55ee-dd98-17b5-3948b5f9fedc	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55ee-dd98-e18b-24fb206793cc	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55ee-dd98-7ca4-6fc0abe083ba	Abonma-read	Abonma - branje	f
00030000-55ee-dd98-8454-cbccfa3e3e6b	Abonma-write	Abonma - spreminjanje	f
00030000-55ee-dd98-33b5-8e2c837445e1	Alternacija-read	Alternacija - branje	f
00030000-55ee-dd98-325b-9c4587411b42	Alternacija-write	Alternacija - spreminjanje	f
00030000-55ee-dd98-c222-aa396f63eec3	Arhivalija-read	Arhivalija - branje	f
00030000-55ee-dd98-686c-482e67af9806	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55ee-dd98-2b27-7c4488998030	Besedilo-read	Besedilo - branje	f
00030000-55ee-dd98-46b4-0f3e21d91bc3	Besedilo-write	Besedilo - spreminjanje	f
00030000-55ee-dd98-9d32-b41237941eb5	DogodekIzven-read	DogodekIzven - branje	f
00030000-55ee-dd98-8f5e-d1456e12f37b	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55ee-dd98-ad14-03fdb1d7de78	Dogodek-read	Dogodek - branje	f
00030000-55ee-dd98-0e4d-2bd9c06fcac6	Dogodek-write	Dogodek - spreminjanje	f
00030000-55ee-dd98-954a-aa92e9d6de0e	DrugiVir-read	DrugiVir - branje	f
00030000-55ee-dd98-7c97-a54ddacf94cd	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55ee-dd98-2c4f-c1a5b0a18e8b	Drzava-read	Drzava - branje	f
00030000-55ee-dd98-38fd-d08bc03b2a74	Drzava-write	Drzava - spreminjanje	f
00030000-55ee-dd98-8dbc-c958a6ba6ca2	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55ee-dd98-6430-4c081745a018	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55ee-dd98-a95e-e37b407157ea	Funkcija-read	Funkcija - branje	f
00030000-55ee-dd98-f3f2-3863ceef517d	Funkcija-write	Funkcija - spreminjanje	f
00030000-55ee-dd98-4c0e-3c4c69d4dec9	Gostovanje-read	Gostovanje - branje	f
00030000-55ee-dd98-5090-17726f6a3507	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55ee-dd98-3a80-ada7f4ff790f	Gostujoca-read	Gostujoca - branje	f
00030000-55ee-dd98-fadf-d714307df546	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55ee-dd98-f92f-255df9851b0d	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55ee-dd98-a9dc-820f158ba258	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55ee-dd98-2291-accfdd43db89	Kupec-read	Kupec - branje	f
00030000-55ee-dd98-bee8-3064a5577f7b	Kupec-write	Kupec - spreminjanje	f
00030000-55ee-dd98-0e70-59617dd05325	NacinPlacina-read	NacinPlacina - branje	f
00030000-55ee-dd98-2b8a-be49c513b4bb	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55ee-dd98-c321-432cf49b9a20	Option-read	Option - branje	f
00030000-55ee-dd98-8dfb-e61386cf06fb	Option-write	Option - spreminjanje	f
00030000-55ee-dd98-c59c-e8fde96c525b	OptionValue-read	OptionValue - branje	f
00030000-55ee-dd98-b6fd-c18978104d6e	OptionValue-write	OptionValue - spreminjanje	f
00030000-55ee-dd98-a199-eb70fc14c4b1	Oseba-read	Oseba - branje	f
00030000-55ee-dd98-b4e6-2bc69b25c440	Oseba-write	Oseba - spreminjanje	f
00030000-55ee-dd98-03db-2587454cc431	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55ee-dd98-cc6b-e252ee751fd5	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55ee-dd98-0de3-d6f36fdb5e55	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55ee-dd98-e24f-8259e84ac392	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55ee-dd98-d74f-a8a7ad82c5e2	Pogodba-read	Pogodba - branje	f
00030000-55ee-dd98-a967-5a180d14aaa6	Pogodba-write	Pogodba - spreminjanje	f
00030000-55ee-dd98-524c-6ff254b557a8	Popa-read	Popa - branje	f
00030000-55ee-dd98-f9e5-0f79a1121662	Popa-write	Popa - spreminjanje	f
00030000-55ee-dd98-3c4a-2d40b2cb79a3	Posta-read	Posta - branje	f
00030000-55ee-dd98-f268-2017667bd7cf	Posta-write	Posta - spreminjanje	f
00030000-55ee-dd98-66ff-d4002da401b3	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55ee-dd98-8ea7-980e95191dda	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55ee-dd98-9fb0-73ab5ede8bb7	PostniNaslov-read	PostniNaslov - branje	f
00030000-55ee-dd98-f5ff-54d0f265fbfe	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55ee-dd98-ea84-bbf8baae6988	Predstava-read	Predstava - branje	f
00030000-55ee-dd98-e141-e36326e205ec	Predstava-write	Predstava - spreminjanje	f
00030000-55ee-dd98-0ec8-04caf803850e	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55ee-dd98-716f-85514feb3678	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55ee-dd98-6898-472ce23eb5b5	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55ee-dd98-f80e-49ef2458a2db	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55ee-dd98-c8bd-e41f4eaebe50	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55ee-dd98-fc8f-11b8179f545d	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55ee-dd98-a6da-cd74ee1b8f19	ProgramDela-read	ProgramDela - branje	f
00030000-55ee-dd98-67d8-979abc5291b7	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55ee-dd98-9bab-3168bc6a75bd	ProgramFestival-read	ProgramFestival - branje	f
00030000-55ee-dd98-651b-7d808b5f00ac	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55ee-dd98-1121-ad04c2e92a0d	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55ee-dd98-4314-3ac553d53f89	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55ee-dd98-16ef-c3f6ffb9681d	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55ee-dd98-5e57-872aa38557f6	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55ee-dd98-2032-a2d7ce21f373	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55ee-dd98-9ed4-1e2ac56c6378	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55ee-dd98-ce51-dbaa6a514263	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55ee-dd98-47bf-83161f0907a7	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55ee-dd98-f29c-fd01cde44e8e	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55ee-dd98-bfcf-228aadac345c	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55ee-dd98-2a6e-0d3d6707b711	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55ee-dd98-d179-d8e94a0f9dd8	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55ee-dd98-e05d-444ec9a3e059	ProgramRazno-read	ProgramRazno - branje	f
00030000-55ee-dd98-4b77-9e4d11275895	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55ee-dd98-e4ba-d89fbe958275	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55ee-dd98-50ba-c3f701eb63c5	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55ee-dd98-7107-c065294413d6	Prostor-read	Prostor - branje	f
00030000-55ee-dd98-86c3-a0a558fec426	Prostor-write	Prostor - spreminjanje	f
00030000-55ee-dd98-4754-e6966e49861d	Racun-read	Racun - branje	f
00030000-55ee-dd98-ee39-0b3078f400b8	Racun-write	Racun - spreminjanje	f
00030000-55ee-dd98-c4cb-d5d831eca155	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55ee-dd98-c134-dc0cc96a66e0	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55ee-dd98-fb5f-96e4542c1707	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55ee-dd98-43de-7bffbf3d794c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55ee-dd98-8a09-7bba6c8bb80a	Rekvizit-read	Rekvizit - branje	f
00030000-55ee-dd98-8c01-23387686c4e5	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55ee-dd98-441d-6a90c0ba6da8	Revizija-read	Revizija - branje	f
00030000-55ee-dd98-249f-2d68d0036b8b	Revizija-write	Revizija - spreminjanje	f
00030000-55ee-dd98-ca32-f9cb8d29aaef	Rezervacija-read	Rezervacija - branje	f
00030000-55ee-dd98-239b-44ffa95c47eb	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55ee-dd98-619f-88a0ce2cf983	SedezniRed-read	SedezniRed - branje	f
00030000-55ee-dd98-15a1-d9b211325044	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55ee-dd98-7066-b799c98431d5	Sedez-read	Sedez - branje	f
00030000-55ee-dd98-36b5-00113e504d2c	Sedez-write	Sedez - spreminjanje	f
00030000-55ee-dd98-fd86-26dd23591c6c	Sezona-read	Sezona - branje	f
00030000-55ee-dd98-f179-7b0b45e1cea4	Sezona-write	Sezona - spreminjanje	f
00030000-55ee-dd98-27e1-a07720878cfa	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55ee-dd98-2613-3ab9b9bfbdd6	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55ee-dd98-8714-7813dd13f101	Stevilcenje-read	Stevilcenje - branje	f
00030000-55ee-dd98-3ae9-b656b5f92be2	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55ee-dd98-c1b8-24f3e83cbe51	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55ee-dd98-b77b-39a5ef3c059f	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55ee-dd98-c438-6a4396dd13c5	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55ee-dd98-9a5b-02d2f9e21368	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55ee-dd98-88b7-62b3ed6d7661	Telefonska-read	Telefonska - branje	f
00030000-55ee-dd98-8c63-58b4056b7459	Telefonska-write	Telefonska - spreminjanje	f
00030000-55ee-dd98-24cc-15f572612dc1	TerminStoritve-read	TerminStoritve - branje	f
00030000-55ee-dd98-3f33-5064ef8d8962	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55ee-dd98-fff3-45a3fa141fb8	TipFunkcije-read	TipFunkcije - branje	f
00030000-55ee-dd98-dc9e-753f6940522c	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55ee-dd98-ca93-08111f8be6fe	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55ee-dd98-faf1-607eb778eacd	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55ee-dd98-9459-6d4cfa8efce2	Trr-read	Trr - branje	f
00030000-55ee-dd98-8e23-ee87ad7f546e	Trr-write	Trr - spreminjanje	f
00030000-55ee-dd98-4648-34c382b737a0	Uprizoritev-read	Uprizoritev - branje	f
00030000-55ee-dd98-cb12-74596a4b7e17	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55ee-dd98-b722-a5424cd5e7d4	Vaja-read	Vaja - branje	f
00030000-55ee-dd98-6225-afdc289b7000	Vaja-write	Vaja - spreminjanje	f
00030000-55ee-dd98-fd43-f68802586f75	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55ee-dd98-1ab2-0e31e7e5397d	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55ee-dd98-5b91-588c5c7c27c5	VrstaStroska-read	VrstaStroska - branje	f
00030000-55ee-dd98-dd34-9e093135f41c	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55ee-dd98-799d-9f2b35340520	Zaposlitev-read	Zaposlitev - branje	f
00030000-55ee-dd98-9d30-e86b9971bdfd	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55ee-dd98-f4c1-11b6b409f0d9	Zasedenost-read	Zasedenost - branje	f
00030000-55ee-dd98-d983-02ecdf4af3d9	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55ee-dd98-fcee-94d46d7f11a1	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55ee-dd98-ebc6-8c9884c1473c	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55ee-dd98-89b4-a012ce6165f3	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55ee-dd98-8c42-289d1067cf44	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55ee-dd98-fac9-5964153cbd6b	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55ee-dd98-9754-a8bbbc35f476	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55ee-dd98-ea1f-de10cacee294	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55ee-dd98-c022-6e3c2501d490	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55ee-dd98-ad74-dabc23220184	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55ee-dd98-cd19-e3c820cbfa5d	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55ee-dd98-bee6-c0447375dee1	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55ee-dd98-9f53-2c6b2a6b9d2a	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55ee-dd98-ee0f-4fce78bfe850	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55ee-dd98-8571-44c0002623c6	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55ee-dd98-7b86-83046269e9ad	Datoteka-write	Datoteka - spreminjanje	f
00030000-55ee-dd98-8f55-f657e2078cad	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2909 (class 0 OID 18013085)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55ee-dd98-f7dc-589a500ab262	00030000-55ee-dd98-f78f-161f274988aa
00020000-55ee-dd98-e1a9-81700370737c	00030000-55ee-dd98-2c4f-c1a5b0a18e8b
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-7ca4-6fc0abe083ba
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-8454-cbccfa3e3e6b
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-33b5-8e2c837445e1
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-325b-9c4587411b42
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-c222-aa396f63eec3
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-ad14-03fdb1d7de78
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-ab52-02587f284223
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-0e4d-2bd9c06fcac6
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-2c4f-c1a5b0a18e8b
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-38fd-d08bc03b2a74
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-a95e-e37b407157ea
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-f3f2-3863ceef517d
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-4c0e-3c4c69d4dec9
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-5090-17726f6a3507
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-3a80-ada7f4ff790f
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-fadf-d714307df546
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-f92f-255df9851b0d
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-a9dc-820f158ba258
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-c321-432cf49b9a20
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-c59c-e8fde96c525b
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-a199-eb70fc14c4b1
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-b4e6-2bc69b25c440
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-524c-6ff254b557a8
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-f9e5-0f79a1121662
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-3c4a-2d40b2cb79a3
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-f268-2017667bd7cf
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-9fb0-73ab5ede8bb7
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-f5ff-54d0f265fbfe
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-ea84-bbf8baae6988
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-e141-e36326e205ec
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-c8bd-e41f4eaebe50
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-fc8f-11b8179f545d
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-7107-c065294413d6
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-86c3-a0a558fec426
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-fb5f-96e4542c1707
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-43de-7bffbf3d794c
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-8a09-7bba6c8bb80a
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-8c01-23387686c4e5
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-fd86-26dd23591c6c
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-f179-7b0b45e1cea4
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-fff3-45a3fa141fb8
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-4648-34c382b737a0
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-cb12-74596a4b7e17
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-b722-a5424cd5e7d4
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-6225-afdc289b7000
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-f4c1-11b6b409f0d9
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-d983-02ecdf4af3d9
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-fcee-94d46d7f11a1
00020000-55ee-dd98-72cf-85523adda11d	00030000-55ee-dd98-89b4-a012ce6165f3
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-7ca4-6fc0abe083ba
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-c222-aa396f63eec3
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-ad14-03fdb1d7de78
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-2c4f-c1a5b0a18e8b
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-4c0e-3c4c69d4dec9
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-3a80-ada7f4ff790f
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-f92f-255df9851b0d
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-a9dc-820f158ba258
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-c321-432cf49b9a20
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-c59c-e8fde96c525b
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-a199-eb70fc14c4b1
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-b4e6-2bc69b25c440
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-524c-6ff254b557a8
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-3c4a-2d40b2cb79a3
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-9fb0-73ab5ede8bb7
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-f5ff-54d0f265fbfe
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-ea84-bbf8baae6988
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-7107-c065294413d6
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-fb5f-96e4542c1707
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-8a09-7bba6c8bb80a
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-fd86-26dd23591c6c
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-88b7-62b3ed6d7661
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-8c63-58b4056b7459
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-9459-6d4cfa8efce2
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-8e23-ee87ad7f546e
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-799d-9f2b35340520
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-9d30-e86b9971bdfd
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-fcee-94d46d7f11a1
00020000-55ee-dd98-33c8-9e067cca568a	00030000-55ee-dd98-89b4-a012ce6165f3
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-7ca4-6fc0abe083ba
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-33b5-8e2c837445e1
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-c222-aa396f63eec3
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-686c-482e67af9806
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-2b27-7c4488998030
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-9d32-b41237941eb5
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-ad14-03fdb1d7de78
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-2c4f-c1a5b0a18e8b
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-a95e-e37b407157ea
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-4c0e-3c4c69d4dec9
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-3a80-ada7f4ff790f
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-f92f-255df9851b0d
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-c321-432cf49b9a20
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-c59c-e8fde96c525b
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-a199-eb70fc14c4b1
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-524c-6ff254b557a8
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-3c4a-2d40b2cb79a3
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-ea84-bbf8baae6988
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-c8bd-e41f4eaebe50
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-7107-c065294413d6
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-fb5f-96e4542c1707
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-8a09-7bba6c8bb80a
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-fd86-26dd23591c6c
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-fff3-45a3fa141fb8
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-b722-a5424cd5e7d4
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-f4c1-11b6b409f0d9
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-fcee-94d46d7f11a1
00020000-55ee-dd98-fc02-608574901dd7	00030000-55ee-dd98-89b4-a012ce6165f3
00020000-55ee-dd98-ba89-c24104fc855e	00030000-55ee-dd98-7ca4-6fc0abe083ba
00020000-55ee-dd98-ba89-c24104fc855e	00030000-55ee-dd98-8454-cbccfa3e3e6b
00020000-55ee-dd98-ba89-c24104fc855e	00030000-55ee-dd98-325b-9c4587411b42
00020000-55ee-dd98-ba89-c24104fc855e	00030000-55ee-dd98-c222-aa396f63eec3
00020000-55ee-dd98-ba89-c24104fc855e	00030000-55ee-dd98-ad14-03fdb1d7de78
00020000-55ee-dd98-ba89-c24104fc855e	00030000-55ee-dd98-2c4f-c1a5b0a18e8b
00020000-55ee-dd98-ba89-c24104fc855e	00030000-55ee-dd98-4c0e-3c4c69d4dec9
00020000-55ee-dd98-ba89-c24104fc855e	00030000-55ee-dd98-3a80-ada7f4ff790f
00020000-55ee-dd98-ba89-c24104fc855e	00030000-55ee-dd98-c321-432cf49b9a20
00020000-55ee-dd98-ba89-c24104fc855e	00030000-55ee-dd98-c59c-e8fde96c525b
00020000-55ee-dd98-ba89-c24104fc855e	00030000-55ee-dd98-524c-6ff254b557a8
00020000-55ee-dd98-ba89-c24104fc855e	00030000-55ee-dd98-3c4a-2d40b2cb79a3
00020000-55ee-dd98-ba89-c24104fc855e	00030000-55ee-dd98-ea84-bbf8baae6988
00020000-55ee-dd98-ba89-c24104fc855e	00030000-55ee-dd98-7107-c065294413d6
00020000-55ee-dd98-ba89-c24104fc855e	00030000-55ee-dd98-fb5f-96e4542c1707
00020000-55ee-dd98-ba89-c24104fc855e	00030000-55ee-dd98-8a09-7bba6c8bb80a
00020000-55ee-dd98-ba89-c24104fc855e	00030000-55ee-dd98-fd86-26dd23591c6c
00020000-55ee-dd98-ba89-c24104fc855e	00030000-55ee-dd98-fff3-45a3fa141fb8
00020000-55ee-dd98-ba89-c24104fc855e	00030000-55ee-dd98-fcee-94d46d7f11a1
00020000-55ee-dd98-ba89-c24104fc855e	00030000-55ee-dd98-89b4-a012ce6165f3
00020000-55ee-dd98-a211-e34f0a440472	00030000-55ee-dd98-7ca4-6fc0abe083ba
00020000-55ee-dd98-a211-e34f0a440472	00030000-55ee-dd98-c222-aa396f63eec3
00020000-55ee-dd98-a211-e34f0a440472	00030000-55ee-dd98-ad14-03fdb1d7de78
00020000-55ee-dd98-a211-e34f0a440472	00030000-55ee-dd98-2c4f-c1a5b0a18e8b
00020000-55ee-dd98-a211-e34f0a440472	00030000-55ee-dd98-4c0e-3c4c69d4dec9
00020000-55ee-dd98-a211-e34f0a440472	00030000-55ee-dd98-3a80-ada7f4ff790f
00020000-55ee-dd98-a211-e34f0a440472	00030000-55ee-dd98-c321-432cf49b9a20
00020000-55ee-dd98-a211-e34f0a440472	00030000-55ee-dd98-c59c-e8fde96c525b
00020000-55ee-dd98-a211-e34f0a440472	00030000-55ee-dd98-524c-6ff254b557a8
00020000-55ee-dd98-a211-e34f0a440472	00030000-55ee-dd98-3c4a-2d40b2cb79a3
00020000-55ee-dd98-a211-e34f0a440472	00030000-55ee-dd98-ea84-bbf8baae6988
00020000-55ee-dd98-a211-e34f0a440472	00030000-55ee-dd98-7107-c065294413d6
00020000-55ee-dd98-a211-e34f0a440472	00030000-55ee-dd98-fb5f-96e4542c1707
00020000-55ee-dd98-a211-e34f0a440472	00030000-55ee-dd98-8a09-7bba6c8bb80a
00020000-55ee-dd98-a211-e34f0a440472	00030000-55ee-dd98-fd86-26dd23591c6c
00020000-55ee-dd98-a211-e34f0a440472	00030000-55ee-dd98-24cc-15f572612dc1
00020000-55ee-dd98-a211-e34f0a440472	00030000-55ee-dd98-b49a-08eeb0a4943e
00020000-55ee-dd98-a211-e34f0a440472	00030000-55ee-dd98-fff3-45a3fa141fb8
00020000-55ee-dd98-a211-e34f0a440472	00030000-55ee-dd98-fcee-94d46d7f11a1
00020000-55ee-dd98-a211-e34f0a440472	00030000-55ee-dd98-89b4-a012ce6165f3
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-f72e-17d80f0b5b17
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-f78f-161f274988aa
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-b49a-08eeb0a4943e
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-ab52-02587f284223
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-2dc9-f529b099d904
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-17b5-3948b5f9fedc
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-e18b-24fb206793cc
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-7ca4-6fc0abe083ba
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-8454-cbccfa3e3e6b
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-33b5-8e2c837445e1
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-325b-9c4587411b42
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-c222-aa396f63eec3
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-686c-482e67af9806
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-2b27-7c4488998030
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-46b4-0f3e21d91bc3
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-9d32-b41237941eb5
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-8f5e-d1456e12f37b
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-ad14-03fdb1d7de78
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-0e4d-2bd9c06fcac6
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-2c4f-c1a5b0a18e8b
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-38fd-d08bc03b2a74
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-954a-aa92e9d6de0e
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-7c97-a54ddacf94cd
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-8dbc-c958a6ba6ca2
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-6430-4c081745a018
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-a95e-e37b407157ea
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-f3f2-3863ceef517d
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-4c0e-3c4c69d4dec9
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-5090-17726f6a3507
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-3a80-ada7f4ff790f
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-fadf-d714307df546
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-f92f-255df9851b0d
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-a9dc-820f158ba258
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-2291-accfdd43db89
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-bee8-3064a5577f7b
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-0e70-59617dd05325
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-2b8a-be49c513b4bb
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-c321-432cf49b9a20
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-8dfb-e61386cf06fb
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-c59c-e8fde96c525b
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-b6fd-c18978104d6e
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-a199-eb70fc14c4b1
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-b4e6-2bc69b25c440
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-03db-2587454cc431
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-cc6b-e252ee751fd5
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-0de3-d6f36fdb5e55
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-e24f-8259e84ac392
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-d74f-a8a7ad82c5e2
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-a967-5a180d14aaa6
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-524c-6ff254b557a8
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-f9e5-0f79a1121662
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-3c4a-2d40b2cb79a3
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-f268-2017667bd7cf
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-66ff-d4002da401b3
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-8ea7-980e95191dda
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-9fb0-73ab5ede8bb7
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-f5ff-54d0f265fbfe
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-ea84-bbf8baae6988
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-e141-e36326e205ec
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-0ec8-04caf803850e
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-716f-85514feb3678
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-6898-472ce23eb5b5
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-f80e-49ef2458a2db
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-c8bd-e41f4eaebe50
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-fc8f-11b8179f545d
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-a6da-cd74ee1b8f19
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-67d8-979abc5291b7
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-9bab-3168bc6a75bd
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-651b-7d808b5f00ac
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-1121-ad04c2e92a0d
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-4314-3ac553d53f89
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-16ef-c3f6ffb9681d
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-5e57-872aa38557f6
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-2032-a2d7ce21f373
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-9ed4-1e2ac56c6378
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-ce51-dbaa6a514263
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-47bf-83161f0907a7
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-f29c-fd01cde44e8e
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-bfcf-228aadac345c
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-2a6e-0d3d6707b711
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-d179-d8e94a0f9dd8
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-e05d-444ec9a3e059
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-4b77-9e4d11275895
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-e4ba-d89fbe958275
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-50ba-c3f701eb63c5
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-7107-c065294413d6
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-86c3-a0a558fec426
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-4754-e6966e49861d
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-ee39-0b3078f400b8
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-c4cb-d5d831eca155
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-c134-dc0cc96a66e0
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-fb5f-96e4542c1707
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-43de-7bffbf3d794c
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-8a09-7bba6c8bb80a
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-8c01-23387686c4e5
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-441d-6a90c0ba6da8
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-249f-2d68d0036b8b
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-ca32-f9cb8d29aaef
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-239b-44ffa95c47eb
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-619f-88a0ce2cf983
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-15a1-d9b211325044
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-7066-b799c98431d5
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-36b5-00113e504d2c
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-fd86-26dd23591c6c
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-f179-7b0b45e1cea4
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-27e1-a07720878cfa
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-2613-3ab9b9bfbdd6
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-8714-7813dd13f101
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-3ae9-b656b5f92be2
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-c1b8-24f3e83cbe51
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-b77b-39a5ef3c059f
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-c438-6a4396dd13c5
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-9a5b-02d2f9e21368
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-88b7-62b3ed6d7661
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-8c63-58b4056b7459
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-24cc-15f572612dc1
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-3f33-5064ef8d8962
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-fff3-45a3fa141fb8
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-dc9e-753f6940522c
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-ca93-08111f8be6fe
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-faf1-607eb778eacd
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-9459-6d4cfa8efce2
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-8e23-ee87ad7f546e
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-4648-34c382b737a0
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-cb12-74596a4b7e17
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-b722-a5424cd5e7d4
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-6225-afdc289b7000
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-fd43-f68802586f75
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-1ab2-0e31e7e5397d
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-5b91-588c5c7c27c5
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-dd34-9e093135f41c
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-799d-9f2b35340520
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-9d30-e86b9971bdfd
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-f4c1-11b6b409f0d9
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-d983-02ecdf4af3d9
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-fcee-94d46d7f11a1
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-ebc6-8c9884c1473c
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-89b4-a012ce6165f3
00020000-55ee-dd99-2f16-417288257e1d	00030000-55ee-dd98-8c42-289d1067cf44
\.


--
-- TOC entry 2936 (class 0 OID 18013380)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 18013414)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 18013543)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55ee-dd99-4b2b-402ddc546a89	00090000-55ee-dd99-2ab0-7023a5df261d	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55ee-dd99-b49f-6455e2f5873c	00090000-55ee-dd99-7a81-96bc4eb6d399	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55ee-dd99-d473-a9c923db9a22	00090000-55ee-dd99-dba8-1d3570400699	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2914 (class 0 OID 18013145)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55ee-dd99-6879-6701cfa37761	00040000-55ee-dd98-aa38-7fc813528c43	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-dd99-203c-707e3f9c224b	00040000-55ee-dd98-aa38-7fc813528c43	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55ee-dd99-5f14-4e5291feab9d	00040000-55ee-dd98-aa38-7fc813528c43	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-dd99-90ee-e1a671072cfa	00040000-55ee-dd98-aa38-7fc813528c43	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-dd99-61f1-a008ef92e8ca	00040000-55ee-dd98-aa38-7fc813528c43	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-dd99-e8e5-82d15584b218	00040000-55ee-dd97-4f26-6620ac6bb49e	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-dd99-2cfe-d484e17ea938	00040000-55ee-dd97-b316-6785605c00ce	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-dd99-8c96-4f2b3cbcea04	00040000-55ee-dd97-7ddb-699a025fab62	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-dd99-1e39-8e0a7b4363e3	00040000-55ee-dd97-a4a1-c6f9386ad5c5	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-dd9a-71e1-f53475767914	00040000-55ee-dd98-aa38-7fc813528c43	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2916 (class 0 OID 18013179)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55ee-dd97-a32e-b2880e6d06a1	8341	Adlešiči
00050000-55ee-dd97-8d53-0f79f916356b	5270	Ajdovščina
00050000-55ee-dd97-133b-6b1ef7cf42ff	6280	Ankaran/Ancarano
00050000-55ee-dd97-a844-b75ca3cc3126	9253	Apače
00050000-55ee-dd97-f5ed-43b9c20e53ce	8253	Artiče
00050000-55ee-dd97-9f76-ad4c51ff2e70	4275	Begunje na Gorenjskem
00050000-55ee-dd97-992d-6d0bed9e4c12	1382	Begunje pri Cerknici
00050000-55ee-dd97-4536-e8bbc82fcb0f	9231	Beltinci
00050000-55ee-dd97-8370-184307175736	2234	Benedikt
00050000-55ee-dd97-aed9-8fdad180f530	2345	Bistrica ob Dravi
00050000-55ee-dd97-bd1e-c279c676b547	3256	Bistrica ob Sotli
00050000-55ee-dd97-0120-c438ec9ce443	8259	Bizeljsko
00050000-55ee-dd97-c0eb-d2d8f16a2c74	1223	Blagovica
00050000-55ee-dd97-3a84-2ba6e8d20e78	8283	Blanca
00050000-55ee-dd97-b11d-e2fa13ca12ad	4260	Bled
00050000-55ee-dd97-300d-1b782efc37a4	4273	Blejska Dobrava
00050000-55ee-dd97-5daf-84b5f11be977	9265	Bodonci
00050000-55ee-dd97-e3cb-93d8fbbb3776	9222	Bogojina
00050000-55ee-dd97-b03f-1c459735b3d2	4263	Bohinjska Bela
00050000-55ee-dd97-0fc4-7b140d1d200d	4264	Bohinjska Bistrica
00050000-55ee-dd97-7137-21f96f581f35	4265	Bohinjsko jezero
00050000-55ee-dd97-0cb9-e9afc9239dfb	1353	Borovnica
00050000-55ee-dd97-10c7-813512678937	8294	Boštanj
00050000-55ee-dd97-f8fc-71993f535887	5230	Bovec
00050000-55ee-dd97-9b70-730e676c726a	5295	Branik
00050000-55ee-dd97-d189-4621bb1177bf	3314	Braslovče
00050000-55ee-dd97-5480-0ec2ffff0464	5223	Breginj
00050000-55ee-dd97-aade-2ea36ead6c80	8280	Brestanica
00050000-55ee-dd97-b97d-66f6589f884b	2354	Bresternica
00050000-55ee-dd97-cd6c-874521251b27	4243	Brezje
00050000-55ee-dd97-dd33-9dc0a6820ebb	1351	Brezovica pri Ljubljani
00050000-55ee-dd97-7fb3-5504fd7fcde9	8250	Brežice
00050000-55ee-dd97-24a4-e275f7388425	4210	Brnik - Aerodrom
00050000-55ee-dd97-e662-d3f44151c2b1	8321	Brusnice
00050000-55ee-dd97-1f6f-2a1d3c9e7ba1	3255	Buče
00050000-55ee-dd97-9a5c-8904180f0a7f	8276	Bučka 
00050000-55ee-dd97-442e-8a68bd5ca719	9261	Cankova
00050000-55ee-dd97-89ba-5fab548e6e4d	3000	Celje 
00050000-55ee-dd97-4b79-420099d27b26	3001	Celje - poštni predali
00050000-55ee-dd97-9cba-d2128e21dcc3	4207	Cerklje na Gorenjskem
00050000-55ee-dd97-65b9-7480e6afa8d9	8263	Cerklje ob Krki
00050000-55ee-dd97-d125-bc46f8c7fd08	1380	Cerknica
00050000-55ee-dd97-8605-493c286e2b20	5282	Cerkno
00050000-55ee-dd97-356a-50705139f9d4	2236	Cerkvenjak
00050000-55ee-dd97-df38-5e8b34db8221	2215	Ceršak
00050000-55ee-dd97-c1e5-c7ec2ce618a8	2326	Cirkovce
00050000-55ee-dd97-15be-1d376462d3e5	2282	Cirkulane
00050000-55ee-dd97-f44f-7cdef02acad4	5273	Col
00050000-55ee-dd97-d014-7ad9faff0d2f	8251	Čatež ob Savi
00050000-55ee-dd97-50bb-0b8bd9f63c8d	1413	Čemšenik
00050000-55ee-dd97-f989-992dc566761a	5253	Čepovan
00050000-55ee-dd97-c181-d623093b6a2b	9232	Črenšovci
00050000-55ee-dd97-625b-da092192bdfa	2393	Črna na Koroškem
00050000-55ee-dd97-5efb-cee107d6adcf	6275	Črni Kal
00050000-55ee-dd97-f2f6-16701d14b706	5274	Črni Vrh nad Idrijo
00050000-55ee-dd97-1dde-276a14b13c58	5262	Črniče
00050000-55ee-dd97-d52d-a5f154260fe3	8340	Črnomelj
00050000-55ee-dd97-a3d4-b1fc6264b6e9	6271	Dekani
00050000-55ee-dd97-fc2d-bba3abbdf71c	5210	Deskle
00050000-55ee-dd97-4bd3-6d9a3b4e1150	2253	Destrnik
00050000-55ee-dd97-3cc1-ec1cc73d87ef	6215	Divača
00050000-55ee-dd97-184c-5042f2dc1fe5	1233	Dob
00050000-55ee-dd97-a6a2-714178d087be	3224	Dobje pri Planini
00050000-55ee-dd97-003f-2bccb0185081	8257	Dobova
00050000-55ee-dd97-b97e-0bfce09a2a40	1423	Dobovec
00050000-55ee-dd97-9510-531a29856299	5263	Dobravlje
00050000-55ee-dd97-9908-889b9a80e80d	3204	Dobrna
00050000-55ee-dd97-aabc-bc478db158a5	8211	Dobrnič
00050000-55ee-dd97-ab26-4be08d3e05c6	1356	Dobrova
00050000-55ee-dd97-7164-df9bad4e6c89	9223	Dobrovnik/Dobronak 
00050000-55ee-dd97-2743-8d8264e9a3d3	5212	Dobrovo v Brdih
00050000-55ee-dd97-5beb-009a66540cea	1431	Dol pri Hrastniku
00050000-55ee-dd97-5e55-efff5d1ede98	1262	Dol pri Ljubljani
00050000-55ee-dd97-9592-e8e029555163	1273	Dole pri Litiji
00050000-55ee-dd97-81f0-3a2ba5f990e8	1331	Dolenja vas
00050000-55ee-dd97-4312-c1bd41cced1b	8350	Dolenjske Toplice
00050000-55ee-dd97-bade-b48ad5bc92be	1230	Domžale
00050000-55ee-dd97-772b-30fd335c983b	2252	Dornava
00050000-55ee-dd97-bd75-db323c7ba470	5294	Dornberk
00050000-55ee-dd97-b8b8-ccd3daccc5ed	1319	Draga
00050000-55ee-dd97-7e86-684a7bb13caf	8343	Dragatuš
00050000-55ee-dd97-abb8-0b32c73c1f11	3222	Dramlje
00050000-55ee-dd97-ad11-0ecd470b2585	2370	Dravograd
00050000-55ee-dd97-8cde-e809f147c9b2	4203	Duplje
00050000-55ee-dd97-37a5-81db9e6213a1	6221	Dutovlje
00050000-55ee-dd97-5054-8c339ead3258	8361	Dvor
00050000-55ee-dd97-fbb8-c7b3431da424	2343	Fala
00050000-55ee-dd97-c2a7-60d8488cb93a	9208	Fokovci
00050000-55ee-dd97-ad4f-6618af23df94	2313	Fram
00050000-55ee-dd97-be59-9fc413b42353	3213	Frankolovo
00050000-55ee-dd97-bb0e-ab4d2e9047d6	1274	Gabrovka
00050000-55ee-dd97-c5da-39415c17f542	8254	Globoko
00050000-55ee-dd97-5567-db2f94048972	5275	Godovič
00050000-55ee-dd97-03e1-7ad75cb26a5d	4204	Golnik
00050000-55ee-dd97-0ca4-88b5ab8858f8	3303	Gomilsko
00050000-55ee-dd97-2022-3226709d4f8d	4224	Gorenja vas
00050000-55ee-dd97-427c-b74e262024e1	3263	Gorica pri Slivnici
00050000-55ee-dd97-4d5a-513d84dbc4e2	2272	Gorišnica
00050000-55ee-dd97-76c4-9ccbc0e162f4	9250	Gornja Radgona
00050000-55ee-dd97-bd82-e62612fb766a	3342	Gornji Grad
00050000-55ee-dd97-8dc8-b905f04b2b0a	4282	Gozd Martuljek
00050000-55ee-dd97-285b-2a6d2ba10081	6272	Gračišče
00050000-55ee-dd97-e97f-f29e7094bfe7	9264	Grad
00050000-55ee-dd97-ff7d-5c929e06059e	8332	Gradac
00050000-55ee-dd97-3e59-da82087951b1	1384	Grahovo
00050000-55ee-dd97-15d3-e519f34178cb	5242	Grahovo ob Bači
00050000-55ee-dd97-3783-8505a3c37838	5251	Grgar
00050000-55ee-dd97-7265-15b8ab505259	3302	Griže
00050000-55ee-dd97-3abe-947d591f1d0c	3231	Grobelno
00050000-55ee-dd97-3d73-dc8f8d0907a8	1290	Grosuplje
00050000-55ee-dd97-42ee-49be2497b04d	2288	Hajdina
00050000-55ee-dd97-1e33-724fac0db580	8362	Hinje
00050000-55ee-dd97-cfd1-4f35ac325f0f	2311	Hoče
00050000-55ee-dd97-7bf2-09e032af287a	9205	Hodoš/Hodos
00050000-55ee-dd97-9b67-d3439950608a	1354	Horjul
00050000-55ee-dd97-550b-28f10b62dcd4	1372	Hotedršica
00050000-55ee-dd97-6103-33caf04aae85	1430	Hrastnik
00050000-55ee-dd97-17f8-1e00df57d619	6225	Hruševje
00050000-55ee-dd97-2d0a-0831d4287631	4276	Hrušica
00050000-55ee-dd97-38fe-4348b7ab9c38	5280	Idrija
00050000-55ee-dd97-515e-2cb1fbb7e79b	1292	Ig
00050000-55ee-dd97-3638-85c5aff9462e	6250	Ilirska Bistrica
00050000-55ee-dd97-8582-a4074244424d	6251	Ilirska Bistrica-Trnovo
00050000-55ee-dd97-2269-0132bf005a21	1295	Ivančna Gorica
00050000-55ee-dd97-f4d2-386330940e6c	2259	Ivanjkovci
00050000-55ee-dd97-1f63-d17a9aa62418	1411	Izlake
00050000-55ee-dd97-6ac7-5cc3957d0c3d	6310	Izola/Isola
00050000-55ee-dd97-48bc-4edb68223f4d	2222	Jakobski Dol
00050000-55ee-dd97-6ca0-736a1c6db4d3	2221	Jarenina
00050000-55ee-dd97-155f-a5e418402045	6254	Jelšane
00050000-55ee-dd97-6f3e-9612ba61ae82	4270	Jesenice
00050000-55ee-dd97-8764-0417fd951fae	8261	Jesenice na Dolenjskem
00050000-55ee-dd97-d7ce-53d865b8728e	3273	Jurklošter
00050000-55ee-dd97-e7ee-7f67b4121c75	2223	Jurovski Dol
00050000-55ee-dd97-5311-358691d8a6df	2256	Juršinci
00050000-55ee-dd97-87d6-1c8b7d633fd3	5214	Kal nad Kanalom
00050000-55ee-dd97-4637-a494c4fda21a	3233	Kalobje
00050000-55ee-dd97-f5b5-3b0d331f6453	4246	Kamna Gorica
00050000-55ee-dd97-0ab6-a0fa4796e344	2351	Kamnica
00050000-55ee-dd97-5c2c-81a3e2d5fc7e	1241	Kamnik
00050000-55ee-dd97-0547-3effce44a171	5213	Kanal
00050000-55ee-dd97-0876-c03c6f4f83bc	8258	Kapele
00050000-55ee-dd97-bb9c-b16b6e209ecb	2362	Kapla
00050000-55ee-dd97-292c-75d4f2083241	2325	Kidričevo
00050000-55ee-dd97-098e-596a9ca0fd36	1412	Kisovec
00050000-55ee-dd97-114e-3542e5a5520b	6253	Knežak
00050000-55ee-dd97-6905-04a8be7a1e83	5222	Kobarid
00050000-55ee-dd97-653e-08e509913855	9227	Kobilje
00050000-55ee-dd97-a888-5ca8b6665787	1330	Kočevje
00050000-55ee-dd97-f27c-b13f2555d13c	1338	Kočevska Reka
00050000-55ee-dd97-26b7-27a3c14473a3	2276	Kog
00050000-55ee-dd97-7a2a-8cdf82731c8c	5211	Kojsko
00050000-55ee-dd97-bef1-a5bc842fd8d4	6223	Komen
00050000-55ee-dd97-2f8a-7a7ae872808d	1218	Komenda
00050000-55ee-dd97-360f-47819eb8d1e2	6000	Koper/Capodistria 
00050000-55ee-dd97-1d77-b286f9f61948	6001	Koper/Capodistria - poštni predali
00050000-55ee-dd97-4535-32c6335f8c5c	8282	Koprivnica
00050000-55ee-dd97-4558-326489f337cb	5296	Kostanjevica na Krasu
00050000-55ee-dd97-6ce1-311b10402ce2	8311	Kostanjevica na Krki
00050000-55ee-dd97-9d6c-0e38be2f3228	1336	Kostel
00050000-55ee-dd97-64b8-1cafa0988cd8	6256	Košana
00050000-55ee-dd97-2515-2dbce7cfd592	2394	Kotlje
00050000-55ee-dd97-83e5-2cc0ce549fd9	6240	Kozina
00050000-55ee-dd97-407c-a23375922f10	3260	Kozje
00050000-55ee-dd97-c867-a19c588093ae	4000	Kranj 
00050000-55ee-dd97-7e6d-1c344bc9650a	4001	Kranj - poštni predali
00050000-55ee-dd97-c658-b06ddc8957ef	4280	Kranjska Gora
00050000-55ee-dd97-3fbb-17e125fe026b	1281	Kresnice
00050000-55ee-dd97-e8a8-231c145ced35	4294	Križe
00050000-55ee-dd97-72d7-52a0a13c66ab	9206	Križevci
00050000-55ee-dd97-cb2b-76da9e123fe9	9242	Križevci pri Ljutomeru
00050000-55ee-dd97-814c-3814f400885e	1301	Krka
00050000-55ee-dd97-5b31-ea78c8646092	8296	Krmelj
00050000-55ee-dd97-0dd2-f69f2f9684e3	4245	Kropa
00050000-55ee-dd97-0253-ed406b1dca8e	8262	Krška vas
00050000-55ee-dd97-5c59-f5d44362e6c7	8270	Krško
00050000-55ee-dd97-54c6-09209f8b254a	9263	Kuzma
00050000-55ee-dd97-1cbf-5b4157248def	2318	Laporje
00050000-55ee-dd97-825c-96e5a8848b5f	3270	Laško
00050000-55ee-dd97-8876-d03bc0ffe4cd	1219	Laze v Tuhinju
00050000-55ee-dd97-4421-7840a77a5b42	2230	Lenart v Slovenskih goricah
00050000-55ee-dd97-3d60-5613c4dec526	9220	Lendava/Lendva
00050000-55ee-dd97-6b45-253d5d44bb6a	4248	Lesce
00050000-55ee-dd97-2a78-cad9010345d9	3261	Lesično
00050000-55ee-dd97-c8fd-649cb2a3deba	8273	Leskovec pri Krškem
00050000-55ee-dd97-b3c4-e92c07316015	2372	Libeliče
00050000-55ee-dd97-de60-1005e8cb465b	2341	Limbuš
00050000-55ee-dd97-4bce-e4178aea44a1	1270	Litija
00050000-55ee-dd97-10d5-b5d29ce4a0ab	3202	Ljubečna
00050000-55ee-dd97-f35f-a0708db92c60	1000	Ljubljana 
00050000-55ee-dd97-21a4-c4aa31ab0b9d	1001	Ljubljana - poštni predali
00050000-55ee-dd97-636b-f019983d9cc1	1231	Ljubljana - Črnuče
00050000-55ee-dd97-46cb-8a1d72376805	1261	Ljubljana - Dobrunje
00050000-55ee-dd97-3e92-dee531057830	1260	Ljubljana - Polje
00050000-55ee-dd97-876d-d60487088830	1210	Ljubljana - Šentvid
00050000-55ee-dd97-dcb0-d6529f2d80db	1211	Ljubljana - Šmartno
00050000-55ee-dd97-9c87-bb8f9da0d164	3333	Ljubno ob Savinji
00050000-55ee-dd97-9fa3-fa334a3d01ee	9240	Ljutomer
00050000-55ee-dd97-c846-4046419afd91	3215	Loče
00050000-55ee-dd97-aea8-82155141fed6	5231	Log pod Mangartom
00050000-55ee-dd97-dcc1-b8206fc082f5	1358	Log pri Brezovici
00050000-55ee-dd97-c846-be0634b67f77	1370	Logatec
00050000-55ee-dd97-ac64-3a900021cc51	1371	Logatec
00050000-55ee-dd97-f7b2-0382db984bbd	1434	Loka pri Zidanem Mostu
00050000-55ee-dd97-a715-794b49b69999	3223	Loka pri Žusmu
00050000-55ee-dd97-391d-0a84818d5414	6219	Lokev
00050000-55ee-dd97-b6d3-b919e6fa5d20	1318	Loški Potok
00050000-55ee-dd97-9828-54076d321b8a	2324	Lovrenc na Dravskem polju
00050000-55ee-dd97-4246-ca1b3b984892	2344	Lovrenc na Pohorju
00050000-55ee-dd97-ac60-6f620ae3ad69	3334	Luče
00050000-55ee-dd97-eb47-a23aa1af34e5	1225	Lukovica
00050000-55ee-dd97-8111-2b660416725b	9202	Mačkovci
00050000-55ee-dd97-bb4a-c1f0bfe5cf20	2322	Majšperk
00050000-55ee-dd97-af76-a59f3eec9142	2321	Makole
00050000-55ee-dd97-5670-9967179e1f1f	9243	Mala Nedelja
00050000-55ee-dd97-7e74-00288fe200c9	2229	Malečnik
00050000-55ee-dd97-cae0-490348a022bc	6273	Marezige
00050000-55ee-dd97-2d67-3eef2f7ca19d	2000	Maribor 
00050000-55ee-dd97-4413-04b4edede0ef	2001	Maribor - poštni predali
00050000-55ee-dd97-ecbd-68c56bd11767	2206	Marjeta na Dravskem polju
00050000-55ee-dd97-6799-84a74858dc50	2281	Markovci
00050000-55ee-dd97-5d42-900aca417cb4	9221	Martjanci
00050000-55ee-dd97-8d35-7802d1da8d98	6242	Materija
00050000-55ee-dd97-6a30-e37e45ca2f60	4211	Mavčiče
00050000-55ee-dd97-98a3-6eb3d17a3a96	1215	Medvode
00050000-55ee-dd97-9795-c3e15709aec4	1234	Mengeš
00050000-55ee-dd97-6fc1-6b2d8e66af95	8330	Metlika
00050000-55ee-dd97-dee3-272830363ebc	2392	Mežica
00050000-55ee-dd97-f90d-b4be955182ef	2204	Miklavž na Dravskem polju
00050000-55ee-dd97-91a6-fef722f8d25b	2275	Miklavž pri Ormožu
00050000-55ee-dd97-14bd-de9244c377c2	5291	Miren
00050000-55ee-dd97-3026-dead635e714a	8233	Mirna
00050000-55ee-dd97-9696-cc0a87fa1d13	8216	Mirna Peč
00050000-55ee-dd97-176e-7e077f1b0132	2382	Mislinja
00050000-55ee-dd97-b396-a90c88f0de60	4281	Mojstrana
00050000-55ee-dd97-cda8-c411c3be79f4	8230	Mokronog
00050000-55ee-dd97-f757-9dbe49551bd6	1251	Moravče
00050000-55ee-dd97-2138-8284567d6eb3	9226	Moravske Toplice
00050000-55ee-dd97-2ead-74638ce3c712	5216	Most na Soči
00050000-55ee-dd97-a3a9-45c89f938d0d	1221	Motnik
00050000-55ee-dd97-f99f-dfcf5c87d372	3330	Mozirje
00050000-55ee-dd97-e3c3-b328ca383e30	9000	Murska Sobota 
00050000-55ee-dd97-c79b-46df2ee16daa	9001	Murska Sobota - poštni predali
00050000-55ee-dd97-c756-4d4dcfebdc7b	2366	Muta
00050000-55ee-dd97-5a73-16e21d432c28	4202	Naklo
00050000-55ee-dd97-0786-30610c8cdc5e	3331	Nazarje
00050000-55ee-dd97-b665-8f57d9618cbd	1357	Notranje Gorice
00050000-55ee-dd97-060f-379f7526b626	3203	Nova Cerkev
00050000-55ee-dd97-15d2-ff19d63102ce	5000	Nova Gorica 
00050000-55ee-dd97-2cb3-d6aa9edb85f3	5001	Nova Gorica - poštni predali
00050000-55ee-dd97-16c8-67a5b6e624e5	1385	Nova vas
00050000-55ee-dd97-1254-e3d07137e0d7	8000	Novo mesto
00050000-55ee-dd97-9b11-6dbc96fc5882	8001	Novo mesto - poštni predali
00050000-55ee-dd97-0fd8-78d0bdac3f04	6243	Obrov
00050000-55ee-dd97-6fac-17e946036921	9233	Odranci
00050000-55ee-dd97-e0ca-bcb2d087b8fa	2317	Oplotnica
00050000-55ee-dd97-b5f2-1181adecb657	2312	Orehova vas
00050000-55ee-dd97-f88d-ed15431f3770	2270	Ormož
00050000-55ee-dd97-f6e3-4b8ac208b71b	1316	Ortnek
00050000-55ee-dd97-10cd-6fca8b61fc14	1337	Osilnica
00050000-55ee-dd97-31bc-b9524e919ff0	8222	Otočec
00050000-55ee-dd97-031f-e5af3aee8a9c	2361	Ožbalt
00050000-55ee-dd97-4543-db8fcf80c71d	2231	Pernica
00050000-55ee-dd97-0c9e-24b69f8248c4	2211	Pesnica pri Mariboru
00050000-55ee-dd97-bd26-8bf008ad04be	9203	Petrovci
00050000-55ee-dd97-156e-a57804dfb923	3301	Petrovče
00050000-55ee-dd97-eb6e-28da150f8710	6330	Piran/Pirano
00050000-55ee-dd97-5d2a-2f57e3517a47	8255	Pišece
00050000-55ee-dd97-ba56-92c33c061f79	6257	Pivka
00050000-55ee-dd97-9920-bd32bd8d0597	6232	Planina
00050000-55ee-dd97-919f-bff1b8c6c8c3	3225	Planina pri Sevnici
00050000-55ee-dd97-1f3c-1f7e293fd9f8	6276	Pobegi
00050000-55ee-dd97-26c7-98909618f4d4	8312	Podbočje
00050000-55ee-dd97-e4ee-293527bbf62e	5243	Podbrdo
00050000-55ee-dd97-422f-3770aa6a12d2	3254	Podčetrtek
00050000-55ee-dd97-a9ad-e2dafee18574	2273	Podgorci
00050000-55ee-dd97-e727-f2b8655cd3f0	6216	Podgorje
00050000-55ee-dd97-8786-dd8adf30cdfd	2381	Podgorje pri Slovenj Gradcu
00050000-55ee-dd97-62c4-a1f3284b3bfe	6244	Podgrad
00050000-55ee-dd97-5839-479246de0d76	1414	Podkum
00050000-55ee-dd97-083e-8ce75721dbf3	2286	Podlehnik
00050000-55ee-dd97-24ae-ef63fd40e9a8	5272	Podnanos
00050000-55ee-dd97-27b2-23d990ed3dae	4244	Podnart
00050000-55ee-dd97-a32d-f2d61d587598	3241	Podplat
00050000-55ee-dd97-0fea-fc2dfe241c60	3257	Podsreda
00050000-55ee-dd97-b37b-701c269c8851	2363	Podvelka
00050000-55ee-dd97-46f5-93271533b064	2208	Pohorje
00050000-55ee-dd97-bd9e-bb249b402133	2257	Polenšak
00050000-55ee-dd97-474c-6ba4389aa6c0	1355	Polhov Gradec
00050000-55ee-dd97-c4c9-650acc5f723b	4223	Poljane nad Škofjo Loko
00050000-55ee-dd97-4087-16d3c4e5d412	2319	Poljčane
00050000-55ee-dd97-44a0-13bc3a3a60fc	1272	Polšnik
00050000-55ee-dd97-65d9-5083b7a0c15a	3313	Polzela
00050000-55ee-dd97-b0ed-0f663219d543	3232	Ponikva
00050000-55ee-dd97-c834-f04cda0f78df	6320	Portorož/Portorose
00050000-55ee-dd97-f18d-ee4f43fbaa3a	6230	Postojna
00050000-55ee-dd97-9654-c06d4ea736a9	2331	Pragersko
00050000-55ee-dd97-422f-92bd02c56525	3312	Prebold
00050000-55ee-dd97-f088-cae1ff81e7b6	4205	Preddvor
00050000-55ee-dd97-8e26-15041be268fd	6255	Prem
00050000-55ee-dd97-9180-ca24aecdc0de	1352	Preserje
00050000-55ee-dd97-7fd7-08397af5bbfb	6258	Prestranek
00050000-55ee-dd97-725d-0efc049f914c	2391	Prevalje
00050000-55ee-dd97-ef1a-0baffa086f0e	3262	Prevorje
00050000-55ee-dd97-64b1-b373c852e361	1276	Primskovo 
00050000-55ee-dd97-6577-c206a57be45c	3253	Pristava pri Mestinju
00050000-55ee-dd97-3dfa-0efcd6f16289	9207	Prosenjakovci/Partosfalva
00050000-55ee-dd97-389f-0215a2f8698e	5297	Prvačina
00050000-55ee-dd97-368c-c1aa727a14c5	2250	Ptuj
00050000-55ee-dd97-9bed-4e2ba809aeba	2323	Ptujska Gora
00050000-55ee-dd97-4e49-8b23e71a85c8	9201	Puconci
00050000-55ee-dd97-ed30-19176321d518	2327	Rače
00050000-55ee-dd97-22d5-dbd8be4e3f07	1433	Radeče
00050000-55ee-dd97-4cef-584893329add	9252	Radenci
00050000-55ee-dd97-51ab-f3170b9216ed	2360	Radlje ob Dravi
00050000-55ee-dd97-b0e5-81386745dd50	1235	Radomlje
00050000-55ee-dd97-095e-ec31f01dde28	4240	Radovljica
00050000-55ee-dd97-8910-3b0c0eab78b1	8274	Raka
00050000-55ee-dd97-613a-cbd2e850536c	1381	Rakek
00050000-55ee-dd97-720c-f355d3d50664	4283	Rateče - Planica
00050000-55ee-dd97-c88e-ce006896cc56	2390	Ravne na Koroškem
00050000-55ee-dd97-e7a5-f329fcc700c1	9246	Razkrižje
00050000-55ee-dd97-550f-33b844f8f822	3332	Rečica ob Savinji
00050000-55ee-dd97-f545-d02a4a6e30f0	5292	Renče
00050000-55ee-dd97-341c-a45bca1b6523	1310	Ribnica
00050000-55ee-dd97-54ac-ec21a66d20a0	2364	Ribnica na Pohorju
00050000-55ee-dd97-8557-fa0f41740d09	3272	Rimske Toplice
00050000-55ee-dd97-f76a-30b9c3580acf	1314	Rob
00050000-55ee-dd97-ecf3-b352115a11e5	5215	Ročinj
00050000-55ee-dd97-a3c4-17dbd709907a	3250	Rogaška Slatina
00050000-55ee-dd97-8a2c-f164b3b3368b	9262	Rogašovci
00050000-55ee-dd97-4ab7-c4cc260d82eb	3252	Rogatec
00050000-55ee-dd97-b16c-35c7d5839c9e	1373	Rovte
00050000-55ee-dd97-bebf-92c420756208	2342	Ruše
00050000-55ee-dd97-ab52-308349150317	1282	Sava
00050000-55ee-dd97-346f-c2021c7e8932	6333	Sečovlje/Sicciole
00050000-55ee-dd97-97a4-9cc94d78f8a3	4227	Selca
00050000-55ee-dd97-205d-4b1b767cd2e4	2352	Selnica ob Dravi
00050000-55ee-dd97-cd7f-f2217b71e69f	8333	Semič
00050000-55ee-dd97-8e27-64cbfdfe91ad	8281	Senovo
00050000-55ee-dd97-f6da-a1a0e43a53c3	6224	Senožeče
00050000-55ee-dd97-7cba-f4ef4ae92a6b	8290	Sevnica
00050000-55ee-dd97-f933-2dff49289c97	6210	Sežana
00050000-55ee-dd97-9b30-aa8700492412	2214	Sladki Vrh
00050000-55ee-dd97-7f61-32e38e68d90c	5283	Slap ob Idrijci
00050000-55ee-dd97-2718-ba1005fbb363	2380	Slovenj Gradec
00050000-55ee-dd97-fff0-0a4b076e379a	2310	Slovenska Bistrica
00050000-55ee-dd97-4a5d-a4b93c6d6a0f	3210	Slovenske Konjice
00050000-55ee-dd97-8d80-6309bae153fc	1216	Smlednik
00050000-55ee-dd97-63bf-0c2bb7db21af	5232	Soča
00050000-55ee-dd97-cbd7-035f28847a97	1317	Sodražica
00050000-55ee-dd97-7a4d-ab7b9d1b44f0	3335	Solčava
00050000-55ee-dd97-fe5f-45a95dbf51f5	5250	Solkan
00050000-55ee-dd97-145e-dad12c30c4bd	4229	Sorica
00050000-55ee-dd97-5361-98b46ec39fd5	4225	Sovodenj
00050000-55ee-dd97-1a9e-98e86fe30d08	5281	Spodnja Idrija
00050000-55ee-dd97-54e8-7d4feb605e0d	2241	Spodnji Duplek
00050000-55ee-dd97-4ff8-ffd7d063c40e	9245	Spodnji Ivanjci
00050000-55ee-dd97-c9bf-44de4e2c2eca	2277	Središče ob Dravi
00050000-55ee-dd97-6509-4a9d8e353c4f	4267	Srednja vas v Bohinju
00050000-55ee-dd97-b4e4-0424f3482922	8256	Sromlje 
00050000-55ee-dd97-35c7-0e2d3a950dfa	5224	Srpenica
00050000-55ee-dd97-0ccc-21da51a49fd2	1242	Stahovica
00050000-55ee-dd97-43e2-b42b857c94e7	1332	Stara Cerkev
00050000-55ee-dd97-c49e-cfaf569cdbe4	8342	Stari trg ob Kolpi
00050000-55ee-dd97-d3bf-f5c4375d5df5	1386	Stari trg pri Ložu
00050000-55ee-dd97-a3b9-eb7b27295a07	2205	Starše
00050000-55ee-dd97-6f8a-d68e5ccfb7b9	2289	Stoperce
00050000-55ee-dd97-381f-cf05d7f04f43	8322	Stopiče
00050000-55ee-dd97-74b9-ae49a5e302fc	3206	Stranice
00050000-55ee-dd97-b1a1-1bd6db45ba8b	8351	Straža
00050000-55ee-dd97-1add-d715f43d0bb5	1313	Struge
00050000-55ee-dd97-736a-21fc8854df4f	8293	Studenec
00050000-55ee-dd97-3b35-76ecac9792f4	8331	Suhor
00050000-55ee-dd97-4861-487b9c01fb87	2233	Sv. Ana v Slovenskih goricah
00050000-55ee-dd97-2991-f280b05cb860	2235	Sv. Trojica v Slovenskih goricah
00050000-55ee-dd97-2560-fb348c9e667a	2353	Sveti Duh na Ostrem Vrhu
00050000-55ee-dd97-c14e-b6a144bbf224	9244	Sveti Jurij ob Ščavnici
00050000-55ee-dd97-1ae6-95043e4e3b15	3264	Sveti Štefan
00050000-55ee-dd97-14fe-80daeb75b00a	2258	Sveti Tomaž
00050000-55ee-dd97-4e19-6aa56cd1f9da	9204	Šalovci
00050000-55ee-dd97-924a-63cc157687c7	5261	Šempas
00050000-55ee-dd97-a6ed-9ace2177c0e8	5290	Šempeter pri Gorici
00050000-55ee-dd97-0c14-147d982a7dc4	3311	Šempeter v Savinjski dolini
00050000-55ee-dd97-bd21-9f0a5fd9a6db	4208	Šenčur
00050000-55ee-dd97-4b26-f5228afb419d	2212	Šentilj v Slovenskih goricah
00050000-55ee-dd97-55ee-d777866bc741	8297	Šentjanž
00050000-55ee-dd97-34d1-fec8e376b5ef	2373	Šentjanž pri Dravogradu
00050000-55ee-dd97-dcaa-ac07b02a3858	8310	Šentjernej
00050000-55ee-dd97-be92-d41f4b842f24	3230	Šentjur
00050000-55ee-dd97-2149-bf30b3bac7fd	3271	Šentrupert
00050000-55ee-dd97-13cb-0b5cab6561e6	8232	Šentrupert
00050000-55ee-dd97-fa79-d5590c0395d9	1296	Šentvid pri Stični
00050000-55ee-dd97-a313-8fd2bd07c9c2	8275	Škocjan
00050000-55ee-dd97-208c-5b6cabfa116c	6281	Škofije
00050000-55ee-dd97-5a9a-e98d4d902735	4220	Škofja Loka
00050000-55ee-dd97-36e4-38e314430031	3211	Škofja vas
00050000-55ee-dd97-870b-6893432a6432	1291	Škofljica
00050000-55ee-dd97-6eef-76ea737d2f5b	6274	Šmarje
00050000-55ee-dd97-4a2f-2712e95902b9	1293	Šmarje - Sap
00050000-55ee-dd97-a24c-6bb19a4fd578	3240	Šmarje pri Jelšah
00050000-55ee-dd97-e6d6-d2a2a0fe8d96	8220	Šmarješke Toplice
00050000-55ee-dd97-7c26-197a58fdfcab	2315	Šmartno na Pohorju
00050000-55ee-dd97-6c5a-4fb6f810f5fa	3341	Šmartno ob Dreti
00050000-55ee-dd97-7edb-4c4d79b030a0	3327	Šmartno ob Paki
00050000-55ee-dd97-e240-544a149b15cf	1275	Šmartno pri Litiji
00050000-55ee-dd97-fe40-2752d05a176a	2383	Šmartno pri Slovenj Gradcu
00050000-55ee-dd97-8f93-38db76e5205e	3201	Šmartno v Rožni dolini
00050000-55ee-dd97-af77-129c6e3c4e65	3325	Šoštanj
00050000-55ee-dd97-1941-0d9fc2a2cf32	6222	Štanjel
00050000-55ee-dd97-4b0b-4fe9f8202ab6	3220	Štore
00050000-55ee-dd97-bd78-6aa12e759b79	3304	Tabor
00050000-55ee-dd97-5685-5cf07023bdef	3221	Teharje
00050000-55ee-dd97-5a72-a66e3b608065	9251	Tišina
00050000-55ee-dd97-4ff9-1ef48ecec6c3	5220	Tolmin
00050000-55ee-dd97-fd99-810a4768afd5	3326	Topolšica
00050000-55ee-dd97-fd0c-042f4d31fcd6	2371	Trbonje
00050000-55ee-dd97-6e34-c5441b9bc9c9	1420	Trbovlje
00050000-55ee-dd97-4c85-055c6ad5e501	8231	Trebelno 
00050000-55ee-dd97-e6ae-455571dfc833	8210	Trebnje
00050000-55ee-dd97-d716-59910f696f6e	5252	Trnovo pri Gorici
00050000-55ee-dd97-2e03-4e23495e0dfe	2254	Trnovska vas
00050000-55ee-dd97-3d1f-82da9da49b94	1222	Trojane
00050000-55ee-dd97-98b3-98c0009b72f0	1236	Trzin
00050000-55ee-dd97-ef5a-46cd771a2b7b	4290	Tržič
00050000-55ee-dd97-f96d-fff10e4ccd32	8295	Tržišče
00050000-55ee-dd97-d7de-2d3952fdba19	1311	Turjak
00050000-55ee-dd97-2d6e-1162e0596789	9224	Turnišče
00050000-55ee-dd97-7eac-6332293217d3	8323	Uršna sela
00050000-55ee-dd97-43ee-620e21582abf	1252	Vače
00050000-55ee-dd97-8d2b-d6e6cae5c699	3320	Velenje 
00050000-55ee-dd97-03ab-a3aa582dc845	3322	Velenje - poštni predali
00050000-55ee-dd97-9a63-29e93c67e052	8212	Velika Loka
00050000-55ee-dd97-9387-a6c9dc218e9c	2274	Velika Nedelja
00050000-55ee-dd97-2202-8e1910f4af1e	9225	Velika Polana
00050000-55ee-dd97-2504-2540733b593a	1315	Velike Lašče
00050000-55ee-dd97-3182-f0deb02ac893	8213	Veliki Gaber
00050000-55ee-dd97-42b7-d7ec07463390	9241	Veržej
00050000-55ee-dd97-a049-43e872e1c803	1312	Videm - Dobrepolje
00050000-55ee-dd97-c86d-ffa598bdb540	2284	Videm pri Ptuju
00050000-55ee-dd97-2115-f4884e7e4c10	8344	Vinica
00050000-55ee-dd97-88ad-bc9ca1d8d0f8	5271	Vipava
00050000-55ee-dd97-3e1f-34db7064efc8	4212	Visoko
00050000-55ee-dd97-5310-86b43ba6ec73	1294	Višnja Gora
00050000-55ee-dd97-bd79-c988e35cc1d5	3205	Vitanje
00050000-55ee-dd97-33b6-3a54b44a6c8e	2255	Vitomarci
00050000-55ee-dd97-54cd-c3d8eef9416f	1217	Vodice
00050000-55ee-dd97-702f-89684f7aa98e	3212	Vojnik\t
00050000-55ee-dd97-3463-1d1550fd8f88	5293	Volčja Draga
00050000-55ee-dd97-a7d5-a9c6adfff3ef	2232	Voličina
00050000-55ee-dd97-64ca-49f6ec66da53	3305	Vransko
00050000-55ee-dd97-3d72-d292fade6d26	6217	Vremski Britof
00050000-55ee-dd97-a3c7-de7fe9aaa36f	1360	Vrhnika
00050000-55ee-dd97-1b27-150624aaeac9	2365	Vuhred
00050000-55ee-dd97-a5cf-138e7c0047f1	2367	Vuzenica
00050000-55ee-dd97-74ad-acf3e4a207ca	8292	Zabukovje 
00050000-55ee-dd97-35d9-3ac561ac8628	1410	Zagorje ob Savi
00050000-55ee-dd97-7ba0-e6de3c54ebd7	1303	Zagradec
00050000-55ee-dd97-c4e3-8cc47581e568	2283	Zavrč
00050000-55ee-dd97-76ba-94b336ba53d1	8272	Zdole 
00050000-55ee-dd97-5b26-67d7959384cc	4201	Zgornja Besnica
00050000-55ee-dd97-3449-f498e74f3072	2242	Zgornja Korena
00050000-55ee-dd97-4750-138e30e726b4	2201	Zgornja Kungota
00050000-55ee-dd97-890a-4edf2c6968bd	2316	Zgornja Ložnica
00050000-55ee-dd97-5f45-69576f332239	2314	Zgornja Polskava
00050000-55ee-dd97-8cef-7392dcc38227	2213	Zgornja Velka
00050000-55ee-dd97-a877-1825a806ec01	4247	Zgornje Gorje
00050000-55ee-dd97-f37c-0d695e916556	4206	Zgornje Jezersko
00050000-55ee-dd97-1a7a-60437325e767	2285	Zgornji Leskovec
00050000-55ee-dd97-4a0f-30a2c7f4050d	1432	Zidani Most
00050000-55ee-dd97-bf4c-1b108e940420	3214	Zreče
00050000-55ee-dd97-b84d-ac8f0271e57d	4209	Žabnica
00050000-55ee-dd97-c5af-382b815fee46	3310	Žalec
00050000-55ee-dd97-ed29-17507b1930d4	4228	Železniki
00050000-55ee-dd97-b3c6-345325ae2ef2	2287	Žetale
00050000-55ee-dd97-3a25-3a26be42cc18	4226	Žiri
00050000-55ee-dd97-f52b-00846948d855	4274	Žirovnica
00050000-55ee-dd97-03be-58e103fd25ec	8360	Žužemberk
\.


--
-- TOC entry 2932 (class 0 OID 18013354)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2915 (class 0 OID 18013164)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55ee-dd99-63ef-cac2841fadbe	00080000-55ee-dd99-6879-6701cfa37761	\N	00040000-55ee-dd98-aa38-7fc813528c43	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55ee-dd99-4fd6-b0565e6ea087	00080000-55ee-dd99-6879-6701cfa37761	\N	00040000-55ee-dd98-aa38-7fc813528c43	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55ee-dd99-936f-99eadb6acad8	00080000-55ee-dd99-203c-707e3f9c224b	\N	00040000-55ee-dd98-aa38-7fc813528c43	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2921 (class 0 OID 18013242)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 18013366)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 18013722)
-- Dependencies: 228
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 18013732)
-- Dependencies: 229
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55ee-dd99-8eba-a20d31e4b1d0	00080000-55ee-dd99-5f14-4e5291feab9d	0987	AK
00190000-55ee-dd99-e8b2-42d96b06fe31	00080000-55ee-dd99-203c-707e3f9c224b	0989	AK
00190000-55ee-dd99-8f1b-8c3a70b4b934	00080000-55ee-dd99-90ee-e1a671072cfa	0986	AK
00190000-55ee-dd99-e6d9-1159bbc805f6	00080000-55ee-dd99-e8e5-82d15584b218	0984	AK
00190000-55ee-dd99-5fae-d39e8e6393fb	00080000-55ee-dd99-2cfe-d484e17ea938	0983	AK
00190000-55ee-dd99-f868-d426812ff252	00080000-55ee-dd99-8c96-4f2b3cbcea04	0982	AK
00190000-55ee-dd9a-ae15-74c54b03e4fd	00080000-55ee-dd9a-71e1-f53475767914	1001	AK
\.


--
-- TOC entry 2957 (class 0 OID 18013679)
-- Dependencies: 227
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55ee-dd99-f39e-912cad5d7db5	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2960 (class 0 OID 18013740)
-- Dependencies: 230
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2938 (class 0 OID 18013395)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55ee-dd99-9053-956adb5d5aea	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55ee-dd99-fafb-3ab18d8acbd7	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55ee-dd99-c0a2-983cd7254bb3	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55ee-dd99-93c3-fee6da4542ce	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55ee-dd99-002d-6eda6140806a	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55ee-dd99-d2b5-db3abe200b68	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55ee-dd99-0557-e699d96596aa	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2930 (class 0 OID 18013339)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 18013329)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 18013532)
-- Dependencies: 220
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2945 (class 0 OID 18013469)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 18013037)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55ee-dd9a-71e1-f53475767914	00010000-55ee-dd98-3712-7b8cd1c78b30	2015-09-08 15:07:38	INS	a:0:{}
2	App\\Entity\\Option	00000000-55ee-dd9a-400f-6f77d72abae2	00010000-55ee-dd98-3712-7b8cd1c78b30	2015-09-08 15:07:38	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55ee-dd9a-ae15-74c54b03e4fd	00010000-55ee-dd98-3712-7b8cd1c78b30	2015-09-08 15:07:38	INS	a:0:{}
\.


--
-- TOC entry 2978 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2939 (class 0 OID 18013408)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 18013075)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55ee-dd98-f7dc-589a500ab262	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55ee-dd98-e1a9-81700370737c	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55ee-dd98-0de8-58458b8a2629	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55ee-dd98-7856-90b6f812ef7b	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55ee-dd98-72cf-85523adda11d	planer	Planer dogodkov v koledarju	t
00020000-55ee-dd98-33c8-9e067cca568a	kadrovska	Kadrovska služba	t
00020000-55ee-dd98-fc02-608574901dd7	arhivar	Ažuriranje arhivalij	t
00020000-55ee-dd98-ba89-c24104fc855e	igralec	Igralec	t
00020000-55ee-dd98-a211-e34f0a440472	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55ee-dd99-2f16-417288257e1d	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2906 (class 0 OID 18013059)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55ee-dd98-3a2a-66995a9b6d3f	00020000-55ee-dd98-0de8-58458b8a2629
00010000-55ee-dd98-3712-7b8cd1c78b30	00020000-55ee-dd98-0de8-58458b8a2629
00010000-55ee-dd99-d2e2-6cb8bb00dd32	00020000-55ee-dd99-2f16-417288257e1d
\.


--
-- TOC entry 2941 (class 0 OID 18013422)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 18013360)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 18013306)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 18013024)
-- Dependencies: 172
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55ee-dd97-ed25-46922262288b	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55ee-dd97-0860-e8f9fca34e9e	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55ee-dd97-a394-9f45d488f180	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55ee-dd97-e5e3-8e341d08e5cc	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55ee-dd97-11e1-b1b9c899d037	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2901 (class 0 OID 18013016)
-- Dependencies: 171
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55ee-dd97-ed68-08a9607580ae	00230000-55ee-dd97-e5e3-8e341d08e5cc	popa
00240000-55ee-dd97-ac47-0b6f38fdb831	00230000-55ee-dd97-e5e3-8e341d08e5cc	oseba
00240000-55ee-dd97-ac17-e66cb507e549	00230000-55ee-dd97-e5e3-8e341d08e5cc	sezona
00240000-55ee-dd97-6386-388d2adda152	00230000-55ee-dd97-0860-e8f9fca34e9e	prostor
00240000-55ee-dd97-89d2-f6c3aa44d9f5	00230000-55ee-dd97-e5e3-8e341d08e5cc	besedilo
00240000-55ee-dd97-2b9c-f06834d26172	00230000-55ee-dd97-e5e3-8e341d08e5cc	uprizoritev
00240000-55ee-dd97-f544-0e136dc4d303	00230000-55ee-dd97-e5e3-8e341d08e5cc	funkcija
00240000-55ee-dd97-b8e4-502cd33b1a8c	00230000-55ee-dd97-e5e3-8e341d08e5cc	tipfunkcije
00240000-55ee-dd97-641a-151aaed331aa	00230000-55ee-dd97-e5e3-8e341d08e5cc	alternacija
00240000-55ee-dd97-fd20-1c31000c0655	00230000-55ee-dd97-ed25-46922262288b	pogodba
00240000-55ee-dd97-ed97-647e7d675c90	00230000-55ee-dd97-e5e3-8e341d08e5cc	zaposlitev
00240000-55ee-dd97-548b-cdc374b43f3c	00230000-55ee-dd97-e5e3-8e341d08e5cc	zvrstuprizoritve
00240000-55ee-dd97-2fef-8b7fe56e5858	00230000-55ee-dd97-ed25-46922262288b	programdela
00240000-55ee-dd97-a7c9-55c3aa48dc0a	00230000-55ee-dd97-e5e3-8e341d08e5cc	zapis
\.


--
-- TOC entry 2900 (class 0 OID 18013011)
-- Dependencies: 170
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
5eee5dba-73c4-4aed-99b1-462097f97664	00240000-55ee-dd97-ed68-08a9607580ae	0	1001
\.


--
-- TOC entry 2946 (class 0 OID 18013479)
-- Dependencies: 216
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55ee-dd99-2464-d7818e4a23f5	000e0000-55ee-dd99-9c95-37e068fcb1d0	00080000-55ee-dd99-6879-6701cfa37761	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55ee-dd98-864c-c016ca3b2935
00270000-55ee-dd99-ea10-84e65302c2b6	000e0000-55ee-dd99-9c95-37e068fcb1d0	00080000-55ee-dd99-6879-6701cfa37761	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55ee-dd98-864c-c016ca3b2935
00270000-55ee-dd99-ac4e-92e778bfa286	000e0000-55ee-dd99-9c95-37e068fcb1d0	00080000-55ee-dd99-61f1-a008ef92e8ca	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 2913 (class 0 OID 18013137)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 18013316)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55ee-dd99-6f8c-55e7834f1211	00180000-55ee-dd99-8a6b-c93d9e785e14	000c0000-55ee-dd99-9b6c-2f6b05bd7442	00090000-55ee-dd99-680d-1f9316b8f2b8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ee-dd99-31fd-59193c06f0ab	00180000-55ee-dd99-8a6b-c93d9e785e14	000c0000-55ee-dd99-f81a-45967a86f9b0	00090000-55ee-dd99-af48-d34e87af0103	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ee-dd99-81db-be6eb47a07e1	00180000-55ee-dd99-8a6b-c93d9e785e14	000c0000-55ee-dd99-dc7e-91b6b18d6764	00090000-55ee-dd99-3351-ceec5cc937f7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ee-dd99-e72a-f591b615ec6c	00180000-55ee-dd99-8a6b-c93d9e785e14	000c0000-55ee-dd99-21c2-c303f455168b	00090000-55ee-dd99-465b-295e3f82c12b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ee-dd99-be10-bbd3e7b8e317	00180000-55ee-dd99-8a6b-c93d9e785e14	000c0000-55ee-dd99-62c2-5466121ef27f	00090000-55ee-dd99-9207-473f81f81439	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ee-dd99-edc8-89be8cf2c94d	00180000-55ee-dd99-b0f6-b431085bed3a	\N	00090000-55ee-dd99-9207-473f81f81439	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2949 (class 0 OID 18013520)
-- Dependencies: 219
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55ee-dd97-811d-e7bb832aeb09	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55ee-dd97-4c23-300f710b1603	02	Priredba	Priredba	Priredba	umetnik
000f0000-55ee-dd97-fd16-b7449efc4a7c	03	Prevod	Prevod	Prevod	umetnik
000f0000-55ee-dd97-98cf-119b32025cc7	04	Režija	Režija	Režija	umetnik
000f0000-55ee-dd97-67ce-822f02d21b38	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55ee-dd97-bb45-cc97dbf3e383	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55ee-dd97-dd8c-6fcc7f593204	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55ee-dd97-a2d0-bf06b7ac3028	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55ee-dd97-abe4-8eac27b592b0	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55ee-dd97-d1c7-4663f6c441fe	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55ee-dd97-9f75-881c18e721e0	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55ee-dd97-cf7d-46dcaa8e3d5a	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55ee-dd97-6cae-05a4b1699f57	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55ee-dd97-63cd-c0e64c2026cd	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55ee-dd97-6397-fd10fa83f27b	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55ee-dd97-c638-e6974e6acd62	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55ee-dd97-86ea-5750f66a8fde	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55ee-dd97-bbb2-e233991d9746	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2961 (class 0 OID 18013750)
-- Dependencies: 231
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55ee-dd97-475a-13fb366bb9da	01	Velika predstava	f	1.00	1.00
002b0000-55ee-dd97-60e2-dddc7c9d32f7	02	Mala predstava	f	0.50	0.50
002b0000-55ee-dd97-c124-6e7c2ef6ef59	03	Mala koprodukcija	t	0.40	1.00
002b0000-55ee-dd97-0a52-34a9fbfa606b	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55ee-dd97-507b-a1c8747d140b	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2918 (class 0 OID 18013199)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 18013046)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55ee-dd98-3712-7b8cd1c78b30	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROSI8M7cpmHcj/.2zgc/KL8iAFaAaAPNe	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55ee-dd99-3352-68cb5ab67e75	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55ee-dd99-ad2a-021c9180bae3	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55ee-dd99-cb47-6daf1614fd4a	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55ee-dd99-0e4a-1d2c91c76a27	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55ee-dd99-774b-998479763506	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55ee-dd99-39bb-d392b8bcfcb1	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55ee-dd99-e479-13f88958f9d2	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55ee-dd99-4569-e6cea1ce7c9a	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55ee-dd99-f183-171b5695e8e3	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55ee-dd99-d2e2-6cb8bb00dd32	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55ee-dd98-3a2a-66995a9b6d3f	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2953 (class 0 OID 18013569)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55ee-dd99-a7c0-a26d5136d077	00160000-55ee-dd99-5c3e-1335b822597d	\N	00140000-55ee-dd97-144b-19d3a6b73075	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55ee-dd99-002d-6eda6140806a
000e0000-55ee-dd99-9c95-37e068fcb1d0	00160000-55ee-dd99-f3db-21eeb2f0f5ee	\N	00140000-55ee-dd97-cd8e-a62e37e7c8fb	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55ee-dd99-d2b5-db3abe200b68
000e0000-55ee-dd99-7a3c-c1bdc2af3c95	\N	\N	00140000-55ee-dd97-cd8e-a62e37e7c8fb	00190000-55ee-dd99-8eba-a20d31e4b1d0	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55ee-dd99-002d-6eda6140806a
000e0000-55ee-dd99-52cc-1a33b713d943	\N	\N	00140000-55ee-dd97-cd8e-a62e37e7c8fb	00190000-55ee-dd99-8eba-a20d31e4b1d0	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55ee-dd99-002d-6eda6140806a
000e0000-55ee-dd99-2fa4-78d7b521fd90	\N	\N	00140000-55ee-dd97-cd8e-a62e37e7c8fb	00190000-55ee-dd99-8eba-a20d31e4b1d0	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55ee-dd99-9053-956adb5d5aea
000e0000-55ee-dd99-e11d-86d8f3b3b81b	\N	\N	00140000-55ee-dd97-cd8e-a62e37e7c8fb	00190000-55ee-dd99-8eba-a20d31e4b1d0	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55ee-dd99-9053-956adb5d5aea
\.


--
-- TOC entry 2923 (class 0 OID 18013260)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55ee-dd99-7a74-36e8c4ac2b7c	000e0000-55ee-dd99-9c95-37e068fcb1d0	\N	1	
00200000-55ee-dd99-ce03-2df7c89d8ab3	000e0000-55ee-dd99-9c95-37e068fcb1d0	\N	2	
\.


--
-- TOC entry 2937 (class 0 OID 18013387)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 18013493)
-- Dependencies: 217
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55ee-dd98-1f2d-388bbd8f8bad	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55ee-dd98-625f-9b9e79858e18	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55ee-dd98-0a6e-e36d6f0b840d	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55ee-dd98-1ad5-a10b329fdd4f	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55ee-dd98-70f1-b9969f1a8ae7	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55ee-dd98-6940-c97cd98e1566	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55ee-dd98-a9c2-2f1caf004f5c	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55ee-dd98-e91c-6960679f266e	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55ee-dd98-864c-c016ca3b2935	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55ee-dd98-3295-381bb199509e	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55ee-dd98-2cad-a5fef2e4e6be	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55ee-dd98-1b67-5da316c9d418	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55ee-dd98-aa60-4bd2f4685e60	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55ee-dd98-3e3e-50725ba659fe	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55ee-dd98-4cde-0f25a3a05415	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55ee-dd98-b0b9-fb7f5f22ca4e	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55ee-dd98-788a-565ac470d784	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55ee-dd98-dc8b-d027097b76e8	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55ee-dd98-0b34-df6cf760a0b3	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55ee-dd98-2a2d-7096d4b20292	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55ee-dd98-d210-873bc6cee766	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55ee-dd98-c21d-eb3670dda54c	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55ee-dd98-6dd3-15a8619c77e4	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55ee-dd98-85a3-efb4fb5b7156	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55ee-dd98-1c63-e963d4ab9b4c	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55ee-dd98-9d66-306b16fd3229	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55ee-dd98-3be8-89822019db0a	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55ee-dd98-1b0d-28cdf569470e	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2964 (class 0 OID 18013796)
-- Dependencies: 234
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 18013768)
-- Dependencies: 233
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 18013808)
-- Dependencies: 235
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 18013459)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55ee-dd99-500b-47edc3b12562	00090000-55ee-dd99-af48-d34e87af0103	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ee-dd99-2b59-c002023d4eb4	00090000-55ee-dd99-3351-ceec5cc937f7	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ee-dd99-141b-41badb41cff7	00090000-55ee-dd99-aceb-f98f8d0d5304	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ee-dd99-8a1a-c224daebe0ce	00090000-55ee-dd99-330d-282a8c4af744	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ee-dd99-ee1f-894892b6c904	00090000-55ee-dd99-680d-1f9316b8f2b8	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ee-dd99-b035-52686d3347db	00090000-55ee-dd99-49d2-f0a5d396c075	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2925 (class 0 OID 18013296)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 18013559)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55ee-dd97-144b-19d3a6b73075	01	Drama	drama (SURS 01)
00140000-55ee-dd97-d1eb-9a93dba329b4	02	Opera	opera (SURS 02)
00140000-55ee-dd97-39e0-832bb03b0faf	03	Balet	balet (SURS 03)
00140000-55ee-dd97-ea9a-efe4c811439a	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55ee-dd97-2a56-87402d038a9f	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55ee-dd97-cd8e-a62e37e7c8fb	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55ee-dd97-3f5d-0b87d5752346	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2943 (class 0 OID 18013449)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2457 (class 2606 OID 18013100)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 18013618)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 18013608)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 18013518)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 18013848)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 18013285)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 18013305)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 18013766)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 18013225)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 18013673)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 18013445)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 18013258)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 18013239)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 18013352)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 18013825)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 18013832)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2693 (class 2606 OID 18013856)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 18013379)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 18013197)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 18013109)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 18013133)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 18013089)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2448 (class 2606 OID 18013074)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 18013385)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 18013421)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 18013554)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 18013161)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 18013185)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 18013358)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 18013175)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 18013246)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 18013370)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 18013729)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 18013737)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 18013721)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 18013748)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 18013403)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 18013343)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 18013334)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 18013542)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 18013476)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 18013045)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 18013412)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 18013063)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2450 (class 2606 OID 18013083)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 18013430)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 18013365)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 18013314)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 18013033)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 18013021)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 18013015)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 18013489)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 18013142)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 18013325)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 18013529)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 18013760)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 18013210)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 18013058)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 18013587)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 18013268)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 18013393)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 18013501)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 18013806)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 18013790)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 18013814)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 18013467)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 18013300)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 18013567)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 18013457)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 1259 OID 18013294)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2513 (class 1259 OID 18013295)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2514 (class 1259 OID 18013293)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2515 (class 1259 OID 18013292)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2597 (class 1259 OID 18013490)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2598 (class 1259 OID 18013491)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2599 (class 1259 OID 18013492)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2679 (class 1259 OID 18013827)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2680 (class 1259 OID 18013826)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2471 (class 1259 OID 18013163)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2560 (class 1259 OID 18013386)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2666 (class 1259 OID 18013794)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2667 (class 1259 OID 18013793)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2668 (class 1259 OID 18013795)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2669 (class 1259 OID 18013792)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2670 (class 1259 OID 18013791)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2554 (class 1259 OID 18013372)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2555 (class 1259 OID 18013371)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2507 (class 1259 OID 18013269)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2584 (class 1259 OID 18013446)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2585 (class 1259 OID 18013448)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2586 (class 1259 OID 18013447)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2496 (class 1259 OID 18013241)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2497 (class 1259 OID 18013240)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2658 (class 1259 OID 18013749)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2613 (class 1259 OID 18013556)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2614 (class 1259 OID 18013557)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2615 (class 1259 OID 18013558)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2676 (class 1259 OID 18013815)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2622 (class 1259 OID 18013592)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2623 (class 1259 OID 18013589)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2624 (class 1259 OID 18013593)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2625 (class 1259 OID 18013591)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2626 (class 1259 OID 18013590)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2486 (class 1259 OID 18013212)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2487 (class 1259 OID 18013211)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2462 (class 1259 OID 18013136)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2572 (class 1259 OID 18013413)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2452 (class 1259 OID 18013090)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2453 (class 1259 OID 18013091)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2577 (class 1259 OID 18013433)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2578 (class 1259 OID 18013432)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2579 (class 1259 OID 18013431)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2500 (class 1259 OID 18013247)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2501 (class 1259 OID 18013248)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2432 (class 1259 OID 18013023)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2534 (class 1259 OID 18013338)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2535 (class 1259 OID 18013336)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2536 (class 1259 OID 18013335)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2537 (class 1259 OID 18013337)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2443 (class 1259 OID 18013064)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2444 (class 1259 OID 18013065)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2563 (class 1259 OID 18013394)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2689 (class 1259 OID 18013849)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2690 (class 1259 OID 18013857)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2691 (class 1259 OID 18013858)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2549 (class 1259 OID 18013359)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2593 (class 1259 OID 18013477)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2594 (class 1259 OID 18013478)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2643 (class 1259 OID 18013678)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2644 (class 1259 OID 18013677)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2645 (class 1259 OID 18013674)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2646 (class 1259 OID 18013675)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2647 (class 1259 OID 18013676)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2475 (class 1259 OID 18013177)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2476 (class 1259 OID 18013176)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2477 (class 1259 OID 18013178)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2566 (class 1259 OID 18013407)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2567 (class 1259 OID 18013406)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2650 (class 1259 OID 18013730)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2651 (class 1259 OID 18013731)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2636 (class 1259 OID 18013622)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 18013623)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2638 (class 1259 OID 18013620)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2639 (class 1259 OID 18013621)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2590 (class 1259 OID 18013468)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2540 (class 1259 OID 18013347)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2541 (class 1259 OID 18013346)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2542 (class 1259 OID 18013344)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2543 (class 1259 OID 18013345)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2632 (class 1259 OID 18013610)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2633 (class 1259 OID 18013609)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2506 (class 1259 OID 18013259)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2665 (class 1259 OID 18013767)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2683 (class 1259 OID 18013833)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2684 (class 1259 OID 18013834)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2458 (class 1259 OID 18013111)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2459 (class 1259 OID 18013110)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2467 (class 1259 OID 18013143)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2468 (class 1259 OID 18013144)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2529 (class 1259 OID 18013328)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2530 (class 1259 OID 18013327)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2531 (class 1259 OID 18013326)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2516 (class 1259 OID 18013287)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2517 (class 1259 OID 18013288)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2518 (class 1259 OID 18013286)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2519 (class 1259 OID 18013290)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2520 (class 1259 OID 18013291)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2521 (class 1259 OID 18013289)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2474 (class 1259 OID 18013162)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2492 (class 1259 OID 18013226)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2493 (class 1259 OID 18013228)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2494 (class 1259 OID 18013227)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2495 (class 1259 OID 18013229)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2548 (class 1259 OID 18013353)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2618 (class 1259 OID 18013555)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 18013588)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2609 (class 1259 OID 18013530)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2610 (class 1259 OID 18013531)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2465 (class 1259 OID 18013134)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2466 (class 1259 OID 18013135)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2587 (class 1259 OID 18013458)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2438 (class 1259 OID 18013034)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2485 (class 1259 OID 18013198)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2435 (class 1259 OID 18013022)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2570 (class 1259 OID 18013405)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2571 (class 1259 OID 18013404)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 18013619)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 18013186)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2619 (class 1259 OID 18013568)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2673 (class 1259 OID 18013807)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2656 (class 1259 OID 18013738)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2657 (class 1259 OID 18013739)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2606 (class 1259 OID 18013519)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2528 (class 1259 OID 18013315)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2451 (class 1259 OID 18013084)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2722 (class 2606 OID 18013979)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2721 (class 2606 OID 18013984)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2717 (class 2606 OID 18014004)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2723 (class 2606 OID 18013974)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2719 (class 2606 OID 18013994)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2718 (class 2606 OID 18013999)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2720 (class 2606 OID 18013989)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2755 (class 2606 OID 18014154)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2754 (class 2606 OID 18014159)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2753 (class 2606 OID 18014164)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2786 (class 2606 OID 18014324)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2787 (class 2606 OID 18014319)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2705 (class 2606 OID 18013914)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2739 (class 2606 OID 18014084)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2781 (class 2606 OID 18014304)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2782 (class 2606 OID 18014299)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2780 (class 2606 OID 18014309)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2783 (class 2606 OID 18014294)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2784 (class 2606 OID 18014289)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2737 (class 2606 OID 18014079)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2738 (class 2606 OID 18014074)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2716 (class 2606 OID 18013969)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2749 (class 2606 OID 18014124)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2747 (class 2606 OID 18014134)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2748 (class 2606 OID 18014129)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2711 (class 2606 OID 18013949)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2712 (class 2606 OID 18013944)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2735 (class 2606 OID 18014064)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2778 (class 2606 OID 18014279)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2758 (class 2606 OID 18014169)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2757 (class 2606 OID 18014174)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2756 (class 2606 OID 18014179)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2785 (class 2606 OID 18014314)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2760 (class 2606 OID 18014199)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2763 (class 2606 OID 18014184)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2759 (class 2606 OID 18014204)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2761 (class 2606 OID 18014194)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2762 (class 2606 OID 18014189)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2709 (class 2606 OID 18013939)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2710 (class 2606 OID 18013934)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2701 (class 2606 OID 18013899)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2702 (class 2606 OID 18013894)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2743 (class 2606 OID 18014104)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2698 (class 2606 OID 18013874)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 18013879)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2744 (class 2606 OID 18014119)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2745 (class 2606 OID 18014114)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2746 (class 2606 OID 18014109)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2714 (class 2606 OID 18013954)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2713 (class 2606 OID 18013959)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2694 (class 2606 OID 18013859)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2727 (class 2606 OID 18014039)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2729 (class 2606 OID 18014029)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2730 (class 2606 OID 18014024)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2728 (class 2606 OID 18014034)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2696 (class 2606 OID 18013864)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2695 (class 2606 OID 18013869)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2740 (class 2606 OID 18014089)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2790 (class 2606 OID 18014339)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2792 (class 2606 OID 18014344)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2791 (class 2606 OID 18014349)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2736 (class 2606 OID 18014069)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2752 (class 2606 OID 18014144)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2751 (class 2606 OID 18014149)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2770 (class 2606 OID 18014259)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2771 (class 2606 OID 18014254)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2774 (class 2606 OID 18014239)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2773 (class 2606 OID 18014244)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2772 (class 2606 OID 18014249)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2707 (class 2606 OID 18013924)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2708 (class 2606 OID 18013919)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2706 (class 2606 OID 18013929)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2741 (class 2606 OID 18014099)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2742 (class 2606 OID 18014094)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2776 (class 2606 OID 18014264)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2775 (class 2606 OID 18014269)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2767 (class 2606 OID 18014229)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2766 (class 2606 OID 18014234)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2769 (class 2606 OID 18014219)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2768 (class 2606 OID 18014224)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2750 (class 2606 OID 18014139)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2731 (class 2606 OID 18014059)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2732 (class 2606 OID 18014054)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2734 (class 2606 OID 18014044)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2733 (class 2606 OID 18014049)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2764 (class 2606 OID 18014214)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2765 (class 2606 OID 18014209)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2715 (class 2606 OID 18013964)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2777 (class 2606 OID 18014274)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2779 (class 2606 OID 18014284)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2789 (class 2606 OID 18014329)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2788 (class 2606 OID 18014334)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2699 (class 2606 OID 18013889)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2700 (class 2606 OID 18013884)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2704 (class 2606 OID 18013904)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2703 (class 2606 OID 18013909)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2724 (class 2606 OID 18014019)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2725 (class 2606 OID 18014014)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2726 (class 2606 OID 18014009)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-08 15:07:39 CEST

--
-- PostgreSQL database dump complete
--

