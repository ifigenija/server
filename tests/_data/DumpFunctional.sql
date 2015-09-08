--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-08 12:16:24 CEST

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
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 240
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 17981596)
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
-- TOC entry 225 (class 1259 OID 17982114)
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
-- TOC entry 224 (class 1259 OID 17982097)
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
-- TOC entry 218 (class 1259 OID 17982006)
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
-- TOC entry 238 (class 1259 OID 17982338)
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
-- TOC entry 194 (class 1259 OID 17981774)
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
-- TOC entry 196 (class 1259 OID 17981805)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 232 (class 1259 OID 17982264)
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
-- TOC entry 189 (class 1259 OID 17981717)
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
-- TOC entry 226 (class 1259 OID 17982127)
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
-- TOC entry 212 (class 1259 OID 17981938)
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
-- TOC entry 192 (class 1259 OID 17981753)
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
-- TOC entry 190 (class 1259 OID 17981734)
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
-- TOC entry 201 (class 1259 OID 17981852)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 17982319)
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
-- TOC entry 237 (class 1259 OID 17982331)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 17982353)
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
-- TOC entry 205 (class 1259 OID 17981877)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 17981691)
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
-- TOC entry 181 (class 1259 OID 17981605)
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
-- TOC entry 182 (class 1259 OID 17981616)
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
-- TOC entry 177 (class 1259 OID 17981570)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 17981589)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 17981884)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 17981918)
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
-- TOC entry 221 (class 1259 OID 17982046)
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
-- TOC entry 184 (class 1259 OID 17981649)
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
-- TOC entry 186 (class 1259 OID 17981683)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 17981858)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 185 (class 1259 OID 17981668)
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
-- TOC entry 191 (class 1259 OID 17981746)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 204 (class 1259 OID 17981870)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 17982225)
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
-- TOC entry 229 (class 1259 OID 17982235)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 227 (class 1259 OID 17982182)
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
-- TOC entry 230 (class 1259 OID 17982243)
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
-- TOC entry 208 (class 1259 OID 17981899)
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
-- TOC entry 200 (class 1259 OID 17981843)
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
-- TOC entry 199 (class 1259 OID 17981833)
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
-- TOC entry 220 (class 1259 OID 17982035)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 17981973)
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
-- TOC entry 174 (class 1259 OID 17981541)
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
-- TOC entry 173 (class 1259 OID 17981539)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 17981912)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 17981579)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 17981563)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 17981926)
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
-- TOC entry 203 (class 1259 OID 17981864)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 17981810)
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
-- TOC entry 172 (class 1259 OID 17981528)
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
-- TOC entry 171 (class 1259 OID 17981520)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 170 (class 1259 OID 17981515)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 216 (class 1259 OID 17981983)
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
-- TOC entry 183 (class 1259 OID 17981641)
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
-- TOC entry 198 (class 1259 OID 17981820)
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
-- TOC entry 219 (class 1259 OID 17982023)
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
-- TOC entry 231 (class 1259 OID 17982253)
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
-- TOC entry 188 (class 1259 OID 17981703)
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
-- TOC entry 175 (class 1259 OID 17981550)
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
-- TOC entry 223 (class 1259 OID 17982072)
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
-- TOC entry 193 (class 1259 OID 17981764)
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
-- TOC entry 207 (class 1259 OID 17981891)
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
-- TOC entry 217 (class 1259 OID 17981997)
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
-- TOC entry 234 (class 1259 OID 17982299)
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
-- TOC entry 233 (class 1259 OID 17982271)
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
-- TOC entry 235 (class 1259 OID 17982311)
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
-- TOC entry 214 (class 1259 OID 17981963)
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
-- TOC entry 195 (class 1259 OID 17981800)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 17982062)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 213 (class 1259 OID 17981953)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2178 (class 2604 OID 17981544)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2909 (class 0 OID 17981596)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 17982114)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55ee-b576-ec23-f7278cb786f4	000d0000-55ee-b576-4b71-7e646bfe1587	\N	00090000-55ee-b576-f207-17368f9ba949	000b0000-55ee-b576-4a5e-0f714be6c8fd	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55ee-b576-7ab5-43927fc8a27e	000d0000-55ee-b576-8ebe-3b45c506612f	00100000-55ee-b576-66aa-ffe8304b0287	00090000-55ee-b576-5096-d0d9e4a8a7f2	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55ee-b576-7e9a-dc8f8288a740	000d0000-55ee-b576-080f-a7227583e617	00100000-55ee-b576-b022-f5d8fa4d6516	00090000-55ee-b576-f48e-ee73d09cfe4d	\N	0003	t	\N	2015-09-08	\N	2	t	\N	f	f
000c0000-55ee-b576-31ef-3ead5b738725	000d0000-55ee-b576-eab0-2f11333a82d6	\N	00090000-55ee-b576-985b-ad84926a7254	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55ee-b576-a9aa-5f3d1814e9bc	000d0000-55ee-b576-d959-2ecee33ea780	\N	00090000-55ee-b576-1391-a8306a5ce6d0	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55ee-b576-2502-febbe53a74e7	000d0000-55ee-b576-f87c-ac0c5b68cc59	\N	00090000-55ee-b576-fa91-867657595cad	000b0000-55ee-b576-4ca3-a33d3f40635c	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55ee-b576-f5ae-fd8841e9fd0a	000d0000-55ee-b576-ad0d-7ac737fdbd70	00100000-55ee-b576-525c-f7f6204ba3c7	00090000-55ee-b576-447d-831e4227f150	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55ee-b576-bcf2-18998ffff80a	000d0000-55ee-b576-ccf1-37d1ab61700d	\N	00090000-55ee-b576-6898-5157133d9363	000b0000-55ee-b576-df8f-4466058bd92b	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55ee-b576-2e47-6703aae62694	000d0000-55ee-b576-ad0d-7ac737fdbd70	00100000-55ee-b576-9a67-edee83c62870	00090000-55ee-b576-8554-52b957c2296b	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55ee-b576-310b-454bbcbb8cc2	000d0000-55ee-b576-ad0d-7ac737fdbd70	00100000-55ee-b576-b8ce-0af4ec106493	00090000-55ee-b576-7b13-71e6999c9c1d	\N	0010	t	\N	2015-09-08	\N	16	f	\N	f	t
000c0000-55ee-b576-009d-53c92a6e6483	000d0000-55ee-b576-ad0d-7ac737fdbd70	00100000-55ee-b576-af11-43cb2191034e	00090000-55ee-b576-03f5-44f8414e608d	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
\.


--
-- TOC entry 2953 (class 0 OID 17982097)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 17982006)
-- Dependencies: 218
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55ee-b576-40d7-f2758eeb27d2	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55ee-b576-34aa-105439ac4c26	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55ee-b576-5ede-ed8efe9410cd	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2967 (class 0 OID 17982338)
-- Dependencies: 238
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2923 (class 0 OID 17981774)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55ee-b576-5bde-75b87593354c	\N	\N	00200000-55ee-b576-ed2d-f10f23ed43f9	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55ee-b576-6d15-65ef236df0f8	\N	\N	00200000-55ee-b576-2dd6-761024bfe98b	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55ee-b576-1958-49bff908b066	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55ee-b576-11b0-b8727b16727e	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55ee-b576-5113-dc7c15ea24df	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2925 (class 0 OID 17981805)
-- Dependencies: 196
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 17982264)
-- Dependencies: 232
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2918 (class 0 OID 17981717)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55ee-b574-bca0-57683acca6db	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55ee-b574-f771-519adc35718c	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55ee-b574-800d-bbbe963c715c	AL	ALB	008	Albania 	Albanija	\N
00040000-55ee-b574-7ae2-ccb67b56e0ab	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55ee-b574-74e6-4774de424a2f	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55ee-b574-afae-54cbf31c4859	AD	AND	020	Andorra 	Andora	\N
00040000-55ee-b574-afe9-e70ae1d32742	AO	AGO	024	Angola 	Angola	\N
00040000-55ee-b574-6ceb-4c5b247a0e77	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55ee-b574-80dc-f45c8da7fd0c	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55ee-b574-6f7f-b6515bdfbde3	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55ee-b574-0148-87bffb7ebed6	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55ee-b574-6a92-c7176549abb4	AM	ARM	051	Armenia 	Armenija	\N
00040000-55ee-b574-554e-cc13d6f763e6	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55ee-b574-36ea-3099c9ea8556	AU	AUS	036	Australia 	Avstralija	\N
00040000-55ee-b574-7a44-622baf87e514	AT	AUT	040	Austria 	Avstrija	\N
00040000-55ee-b574-41b0-18cecc4d5eaf	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55ee-b574-23f5-dfe81e251791	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55ee-b574-7b7a-e6bd954addfb	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55ee-b574-bbb5-4bba04da5712	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55ee-b574-89f0-9adb59764d1d	BB	BRB	052	Barbados 	Barbados	\N
00040000-55ee-b574-7a0e-6c24b5221ddd	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55ee-b574-1e98-71ab887daadb	BE	BEL	056	Belgium 	Belgija	\N
00040000-55ee-b574-32d1-645d16d9ae1c	BZ	BLZ	084	Belize 	Belize	\N
00040000-55ee-b574-cdf9-fd7739866300	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55ee-b574-1f72-71baca658f66	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55ee-b574-c9b4-a3efdd371e02	BT	BTN	064	Bhutan 	Butan	\N
00040000-55ee-b574-4470-49cff8e06515	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55ee-b574-71ef-23a6108c832f	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55ee-b574-d9f2-83e6df1a571b	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55ee-b574-4a32-a24e82d2ea24	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55ee-b574-8486-1788b16dbe8a	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55ee-b574-21b1-4b086ead0a7b	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55ee-b574-052a-c53c0d73edf9	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55ee-b574-782b-fae92d087b14	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55ee-b574-ffdb-935a9e520db9	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55ee-b574-5778-63c8b8138e6f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55ee-b574-7035-9316bd70a12a	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55ee-b574-5209-36c98ed9ba8b	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55ee-b574-35ee-f3c540e2e246	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55ee-b574-2d68-fb2886879b80	CA	CAN	124	Canada 	Kanada	\N
00040000-55ee-b574-a8ac-af8031df83bf	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55ee-b574-614f-6598925e0821	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55ee-b574-07c9-ea76265835ce	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55ee-b574-e5e3-8671d8982d43	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55ee-b574-7356-e73568ed33e8	CL	CHL	152	Chile 	Čile	\N
00040000-55ee-b574-47e0-e65b177e0a58	CN	CHN	156	China 	Kitajska	\N
00040000-55ee-b574-0091-2bd8828abdb1	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55ee-b574-666e-ed0a6b5127b6	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55ee-b574-ab25-299f10a5813d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55ee-b574-49b7-da035621e12e	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55ee-b574-d7b9-ff45dc47e8b3	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55ee-b574-426c-5c0bb7bbde8b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55ee-b574-6897-c9bb055aa4ff	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55ee-b574-b423-78b7214c07b5	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55ee-b574-311c-cbaae84f3ebf	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55ee-b574-abba-748f1ac6c5b8	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55ee-b574-938a-003d10e68af1	CU	CUB	192	Cuba 	Kuba	\N
00040000-55ee-b574-4424-256a0d6e5158	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55ee-b574-2fc6-d1570d994595	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55ee-b574-b9ab-753cfe03e70c	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55ee-b574-edcd-14c64ae3bd12	DK	DNK	208	Denmark 	Danska	\N
00040000-55ee-b574-45bf-648fed45b5aa	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55ee-b574-f815-ea88baeb2d78	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55ee-b574-93f8-a32a905134d0	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55ee-b574-90f4-19cd47a4ed00	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55ee-b574-7f92-d2a684a93d1c	EG	EGY	818	Egypt 	Egipt	\N
00040000-55ee-b574-b9c8-50214eac4509	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55ee-b574-f7a7-e1f805b60778	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55ee-b574-3eb4-02992c84442c	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55ee-b574-60eb-d85ad5fae53f	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55ee-b574-c082-f61eed116b44	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55ee-b574-2213-14366fe60bd6	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55ee-b574-947a-a2a250956157	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55ee-b574-7da4-1e463efdbf28	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55ee-b574-5ba7-16cbfceb015f	FI	FIN	246	Finland 	Finska	\N
00040000-55ee-b574-8284-c4c128d3e495	FR	FRA	250	France 	Francija	\N
00040000-55ee-b574-d9e6-d12fec905e92	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55ee-b574-3fd1-82b617444d6a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55ee-b574-a521-7d7824fdc1d2	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55ee-b574-4d0f-a85860ee71a5	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55ee-b574-96fb-5c5308cd785e	GA	GAB	266	Gabon 	Gabon	\N
00040000-55ee-b574-bb51-4adfc3743129	GM	GMB	270	Gambia 	Gambija	\N
00040000-55ee-b574-834a-e8d3edb785f5	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55ee-b574-e6c4-59f844430b9a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55ee-b574-8bfb-20db6839835b	GH	GHA	288	Ghana 	Gana	\N
00040000-55ee-b574-bde5-51cc939d5712	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55ee-b574-a727-bb7a72522e7c	GR	GRC	300	Greece 	Grčija	\N
00040000-55ee-b574-6de9-6a1cf4833c71	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55ee-b574-5be8-e30517794586	GD	GRD	308	Grenada 	Grenada	\N
00040000-55ee-b574-a850-47a8eda8ffd4	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55ee-b574-15f5-fa0d6dcd5fb6	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55ee-b574-6e52-42b96eed5b12	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55ee-b574-9edd-e8ff9d14a0ef	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55ee-b574-a398-2d027b8d7c48	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55ee-b574-025b-6d5026769949	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55ee-b574-639f-0a0ebd51aeb5	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55ee-b574-39ff-cf78c48404c5	HT	HTI	332	Haiti 	Haiti	\N
00040000-55ee-b574-eefd-e3edc1096f29	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55ee-b574-e2f2-547598e34f22	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55ee-b574-6c7b-e61a9320092a	HN	HND	340	Honduras 	Honduras	\N
00040000-55ee-b574-dc4d-604dba2cff34	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55ee-b574-a3c7-d61139d6dbdb	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55ee-b574-c57d-c708887bfbbb	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55ee-b574-aa90-45ff1a791927	IN	IND	356	India 	Indija	\N
00040000-55ee-b574-104b-d500cea9f250	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55ee-b574-f3fc-0ae18377e367	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55ee-b574-5c8b-9559c5844212	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55ee-b574-5e2e-4194d143079c	IE	IRL	372	Ireland 	Irska	\N
00040000-55ee-b574-9c5f-324cd9bd11de	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55ee-b574-36af-6638d3e9f010	IL	ISR	376	Israel 	Izrael	\N
00040000-55ee-b574-2d4f-6440ea29f391	IT	ITA	380	Italy 	Italija	\N
00040000-55ee-b574-779f-1a9be9bcfe87	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55ee-b574-ceed-c5a5731913ff	JP	JPN	392	Japan 	Japonska	\N
00040000-55ee-b574-c4c1-038e75d9cea8	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55ee-b574-8580-fb03f8209321	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55ee-b574-7e10-3f273ad4093e	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55ee-b574-28ef-57e21c7fceb5	KE	KEN	404	Kenya 	Kenija	\N
00040000-55ee-b574-9bf9-644d41714c95	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55ee-b574-612c-227b4bc5d517	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55ee-b574-f355-f0e5fc489f44	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55ee-b574-2d83-a4e270c32a4d	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55ee-b574-cac8-398dc5cf0e08	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55ee-b574-3d8a-72f557dfa135	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55ee-b574-d940-0c627f4ea077	LV	LVA	428	Latvia 	Latvija	\N
00040000-55ee-b574-c229-83fd739ed368	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55ee-b574-7605-b113ba031573	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55ee-b574-14bc-531ec9f90115	LR	LBR	430	Liberia 	Liberija	\N
00040000-55ee-b574-6ef2-8222b47fbcff	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55ee-b574-537f-66a347867a82	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55ee-b574-1b45-af4cbcb30d1f	LT	LTU	440	Lithuania 	Litva	\N
00040000-55ee-b574-1428-c19168616c37	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55ee-b574-2775-9e9423e8b9bd	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55ee-b574-44ab-50d7ee987560	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55ee-b574-6a42-822d97875754	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55ee-b574-9e28-f54d442a3be1	MW	MWI	454	Malawi 	Malavi	\N
00040000-55ee-b574-0dd6-25213aa474f0	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55ee-b574-bf5f-f904d95883ec	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55ee-b574-0a98-a959a78de71f	ML	MLI	466	Mali 	Mali	\N
00040000-55ee-b574-b1cb-5cfe138ce662	MT	MLT	470	Malta 	Malta	\N
00040000-55ee-b574-d4dd-34f479c0f8eb	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55ee-b574-a9fe-a4e976389cce	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55ee-b574-905b-ea9d616f2b8d	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55ee-b574-c519-b86f11e205f6	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55ee-b574-c63a-c20ac3ab0096	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55ee-b574-8543-b9b19ac07873	MX	MEX	484	Mexico 	Mehika	\N
00040000-55ee-b574-b023-e96771cbdc5a	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55ee-b574-98ac-bec7d6b1e3a7	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55ee-b574-215d-2021ea358d92	MC	MCO	492	Monaco 	Monako	\N
00040000-55ee-b574-bc49-87e3be417f06	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55ee-b574-5c31-12f7a8da8647	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55ee-b574-136f-85275746130d	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55ee-b574-bb81-39ac5b014da0	MA	MAR	504	Morocco 	Maroko	\N
00040000-55ee-b574-b180-3b1c17993623	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55ee-b574-5b24-ea0e6cdb1d6c	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55ee-b574-a969-930df53aaec9	NA	NAM	516	Namibia 	Namibija	\N
00040000-55ee-b574-a565-716e6426395a	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55ee-b574-8e5d-73ebf856950c	NP	NPL	524	Nepal 	Nepal	\N
00040000-55ee-b574-a6bf-4f2ae982f472	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55ee-b574-a975-65f348d8bf58	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55ee-b574-e287-4614a139b033	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55ee-b574-ab91-a54718f51884	NE	NER	562	Niger 	Niger 	\N
00040000-55ee-b574-ce27-68c12725717d	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55ee-b574-9072-758704e80b0a	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55ee-b574-f2d8-ad3a1a3dac4a	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55ee-b574-2a77-b5d875606622	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55ee-b574-7fb0-bc8e2e309c88	NO	NOR	578	Norway 	Norveška	\N
00040000-55ee-b574-1587-044c724cbab0	OM	OMN	512	Oman 	Oman	\N
00040000-55ee-b574-308e-8e7820040fe9	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55ee-b574-ce25-751cf4d9bda7	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55ee-b574-5f26-31a9c2db3610	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55ee-b574-ed19-ec53d2d16c64	PA	PAN	591	Panama 	Panama	\N
00040000-55ee-b574-c4b7-f786101a6ec6	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55ee-b574-1376-3139ace75d43	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55ee-b574-6e99-0b09043c1411	PE	PER	604	Peru 	Peru	\N
00040000-55ee-b574-14e5-59cc6e5e6d7a	PH	PHL	608	Philippines 	Filipini	\N
00040000-55ee-b574-96d6-fe8c13bb0956	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55ee-b574-feb2-05c8ea6706ba	PL	POL	616	Poland 	Poljska	\N
00040000-55ee-b574-0729-4e057c42834b	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55ee-b574-849e-4a3154f15287	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55ee-b574-265d-45976d319dff	QA	QAT	634	Qatar 	Katar	\N
00040000-55ee-b574-7fc4-a7ae45f00922	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55ee-b574-e1bc-68e7e910da0c	RO	ROU	642	Romania 	Romunija	\N
00040000-55ee-b574-58a7-cc9df7cf7624	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55ee-b574-ada8-7b5ec2552a68	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55ee-b574-b948-9bf0ac13d7a5	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55ee-b574-f514-80ff53c014d6	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55ee-b574-36ae-488dce5aeb8d	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55ee-b574-40b3-a39025c7a45d	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55ee-b574-5e47-4444b0302aab	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55ee-b574-c836-fdb944aecf35	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55ee-b574-1c87-27633e354035	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55ee-b574-af26-6d9ed13b8f1d	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55ee-b574-1ad6-d880f28d9f09	SM	SMR	674	San Marino 	San Marino	\N
00040000-55ee-b574-175e-2fdeb2edb47a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55ee-b574-4cc1-a7af73f96052	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55ee-b574-16bd-ce6453d923ed	SN	SEN	686	Senegal 	Senegal	\N
00040000-55ee-b574-a217-6973f4be96b9	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55ee-b574-03ff-131fb603fb7b	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55ee-b574-0a57-6bb5f6101a7c	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55ee-b574-0aac-f4e6472eb32d	SG	SGP	702	Singapore 	Singapur	\N
00040000-55ee-b574-683a-57435caa3a2b	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55ee-b574-a0bd-1d945829b90d	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55ee-b574-47b7-15d3f7f1ee70	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55ee-b574-46d5-a43d7805746f	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55ee-b574-6416-5a1995df8cfc	SO	SOM	706	Somalia 	Somalija	\N
00040000-55ee-b574-dc15-7f594ae5a29c	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55ee-b574-a7e8-62143bd8a8b7	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55ee-b574-bf03-d8c0f4a80ac0	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55ee-b574-12ad-4668e15f053b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55ee-b574-37b1-48fbcd507f1c	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55ee-b574-9ee0-aa828944afc4	SD	SDN	729	Sudan 	Sudan	\N
00040000-55ee-b574-3b82-8c9871188758	SR	SUR	740	Suriname 	Surinam	\N
00040000-55ee-b574-a073-bc92f4007acd	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55ee-b574-4258-caec3ec1a12a	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55ee-b574-ffc0-eac8819feedb	SE	SWE	752	Sweden 	Švedska	\N
00040000-55ee-b574-fd00-c9b0f3eef85e	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55ee-b574-0727-00f1c587433b	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55ee-b574-a61e-dafdc528c92c	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55ee-b574-149f-c5620ee053da	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55ee-b574-9605-06fb80f17f75	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55ee-b574-8846-6c511a57071f	TH	THA	764	Thailand 	Tajska	\N
00040000-55ee-b574-f202-07bf1a983dce	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55ee-b574-6c06-7ec9639e19fb	TG	TGO	768	Togo 	Togo	\N
00040000-55ee-b574-06a9-522f9d51ceae	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55ee-b574-083a-c51f27df3c56	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55ee-b574-8da6-ff18f8085fd9	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55ee-b574-8a7c-1e3e03e24235	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55ee-b574-0c30-ad704a36eea7	TR	TUR	792	Turkey 	Turčija	\N
00040000-55ee-b574-bc77-73a7504c342d	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55ee-b574-0f23-502e674637ed	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ee-b574-8c10-6fae1ce4fe00	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55ee-b574-a70a-2ed2e66f1457	UG	UGA	800	Uganda 	Uganda	\N
00040000-55ee-b574-e70e-b70a8d770242	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55ee-b574-3b41-4ff1bdbc29d8	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55ee-b574-5f57-ecc487777a49	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55ee-b574-bcf9-2ebdc164744f	US	USA	840	United States 	Združene države Amerike	\N
00040000-55ee-b574-9c25-2bd11c8c17a1	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55ee-b574-8e73-49d666f89f5a	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55ee-b574-45f7-49acc23511a7	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55ee-b574-852d-65b3ac531d7c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55ee-b574-ef0e-5594023f0bf1	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55ee-b574-b476-91cf0114a7b7	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55ee-b574-722f-6fe115d49a84	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ee-b574-bdbf-78738a7308ac	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55ee-b574-498b-53bbd916d524	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55ee-b574-9776-ed52c4d34f31	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55ee-b574-3dc5-bfc62834516e	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55ee-b574-e229-d314548e794f	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55ee-b574-d61a-3c11b2c16955	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2955 (class 0 OID 17982127)
-- Dependencies: 226
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55ee-b576-0cdf-996b61f7ff4e	000e0000-55ee-b576-4ae4-b933791c35e6	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ee-b574-1ac5-db7fdcc76187	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ee-b576-ec6b-2fee49371672	000e0000-55ee-b576-0f31-fa04b0afbfa2	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ee-b574-42c8-0b605845be73	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ee-b576-7e1c-f91db3a2c949	000e0000-55ee-b576-0c56-998dfc062656	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ee-b574-1ac5-db7fdcc76187	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ee-b576-f83d-9efeb58448a4	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ee-b576-799b-2ce94086a074	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2941 (class 0 OID 17981938)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55ee-b576-4b71-7e646bfe1587	000e0000-55ee-b576-0f31-fa04b0afbfa2	000c0000-55ee-b576-ec23-f7278cb786f4	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55ee-b574-5626-273fc9bd3bd2
000d0000-55ee-b576-8ebe-3b45c506612f	000e0000-55ee-b576-0f31-fa04b0afbfa2	000c0000-55ee-b576-7ab5-43927fc8a27e	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55ee-b574-ae9e-53d2f13818d8
000d0000-55ee-b576-080f-a7227583e617	000e0000-55ee-b576-0f31-fa04b0afbfa2	000c0000-55ee-b576-7e9a-dc8f8288a740	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55ee-b574-f89f-398933d36c3f
000d0000-55ee-b576-eab0-2f11333a82d6	000e0000-55ee-b576-0f31-fa04b0afbfa2	000c0000-55ee-b576-31ef-3ead5b738725	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55ee-b574-b599-0f8be6b7ff44
000d0000-55ee-b576-d959-2ecee33ea780	000e0000-55ee-b576-0f31-fa04b0afbfa2	000c0000-55ee-b576-a9aa-5f3d1814e9bc	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55ee-b574-b599-0f8be6b7ff44
000d0000-55ee-b576-f87c-ac0c5b68cc59	000e0000-55ee-b576-0f31-fa04b0afbfa2	000c0000-55ee-b576-2502-febbe53a74e7	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55ee-b574-5626-273fc9bd3bd2
000d0000-55ee-b576-ad0d-7ac737fdbd70	000e0000-55ee-b576-0f31-fa04b0afbfa2	000c0000-55ee-b576-2e47-6703aae62694	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55ee-b574-5626-273fc9bd3bd2
000d0000-55ee-b576-ccf1-37d1ab61700d	000e0000-55ee-b576-0f31-fa04b0afbfa2	000c0000-55ee-b576-bcf2-18998ffff80a	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55ee-b574-1c59-88c7964f8a4a
\.


--
-- TOC entry 2921 (class 0 OID 17981753)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 17981734)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55ee-b576-be46-3de0616ffd74	00080000-55ee-b576-b8b7-49b65a02fe13	00090000-55ee-b576-7b13-71e6999c9c1d	AK		igralka
\.


--
-- TOC entry 2930 (class 0 OID 17981852)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 17982319)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 17982331)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 17982353)
-- Dependencies: 239
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 17981877)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 17981691)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55ee-b575-630b-446565deba0b	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55ee-b575-524a-941274d7fe3b	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55ee-b575-b114-b022e2ca968a	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55ee-b575-8d64-36cba4efcdf2	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55ee-b575-9b33-8dbfad2f9f40	dogodek.status	array	a:7:{i:100;a:1:{s:5:"label";s:11:"Dolgoročno";}i:200;a:1:{s:5:"label";s:9:"Planirano";}i:300;a:1:{s:5:"label";s:8:"Fiksiran";}i:400;a:1:{s:5:"label";s:17:"Potrjen - interno";}i:500;a:1:{s:5:"label";s:15:"Potrjen - javno";}i:600;a:1:{s:5:"label";s:10:"Zaključen";}i:700;a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55ee-b575-ca2a-d76905001bbb	dogodek.razred	array	a:5:{i:100;a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}i:200;a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}i:300;a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}i:400;a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}i:500;a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55ee-b575-6bf4-183f96e90b7e	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55ee-b575-6fe7-16124641baf8	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55ee-b575-3cd7-8e210b7e9213	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55ee-b575-14bd-7cc6422e5165	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55ee-b575-957c-d4f1f396fd20	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55ee-b575-3656-2c98c4d94c7c	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55ee-b575-3b04-da671cb7283f	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55ee-b575-41b8-d0e9875564d5	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55ee-b576-42d5-4f14a24534bf	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55ee-b576-3708-46a5b37110ea	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55ee-b576-a07f-c9735a8703f5	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55ee-b576-f94c-cd287652c459	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55ee-b576-d3d2-1caa6e536e5e	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55ee-b577-1308-1fdecfeb70a7	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2910 (class 0 OID 17981605)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55ee-b576-cb6d-db2624a92d84	00000000-55ee-b576-42d5-4f14a24534bf	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55ee-b576-f69d-98ca031f2478	00000000-55ee-b576-42d5-4f14a24534bf	00010000-55ee-b575-0aa0-8278d0e51970	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55ee-b576-2420-39994192f012	00000000-55ee-b576-3708-46a5b37110ea	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2911 (class 0 OID 17981616)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55ee-b576-f207-17368f9ba949	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55ee-b576-985b-ad84926a7254	00010000-55ee-b576-6624-305b706875fc	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55ee-b576-f48e-ee73d09cfe4d	00010000-55ee-b576-a35c-581e658ef5bb	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55ee-b576-8554-52b957c2296b	00010000-55ee-b576-4851-65e2f7dc200c	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55ee-b576-ef5c-230b9f8f4c1c	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55ee-b576-fa91-867657595cad	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55ee-b576-03f5-44f8414e608d	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55ee-b576-447d-831e4227f150	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55ee-b576-7b13-71e6999c9c1d	00010000-55ee-b576-27ff-fd83954ae89e	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55ee-b576-5096-d0d9e4a8a7f2	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55ee-b576-2926-293ace5bd0f6	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55ee-b576-1391-a8306a5ce6d0	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55ee-b576-6898-5157133d9363	00010000-55ee-b576-774f-92aabc1b8a6f	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2906 (class 0 OID 17981570)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55ee-b574-da0c-3e736b929450	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55ee-b574-ef14-6db0fe832705	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55ee-b574-bf95-f433a8ca998d	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55ee-b574-7eb9-79e49f096545	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55ee-b574-3491-65fcaca889d7	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55ee-b574-7bad-7fd044a5845e	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55ee-b574-2a74-2380b190f4c0	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55ee-b574-9bfd-96e5fc5bfeef	Abonma-read	Abonma - branje	f
00030000-55ee-b574-afde-195f578d2093	Abonma-write	Abonma - spreminjanje	f
00030000-55ee-b574-1cc6-8cef2853f887	Alternacija-read	Alternacija - branje	f
00030000-55ee-b574-4f72-76aaece39a4b	Alternacija-write	Alternacija - spreminjanje	f
00030000-55ee-b574-7e0b-e3f60ab1a581	Arhivalija-read	Arhivalija - branje	f
00030000-55ee-b574-6bfd-90092a82f692	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55ee-b574-ce77-8f330afee522	Besedilo-read	Besedilo - branje	f
00030000-55ee-b574-e18d-df83ca5ea8c7	Besedilo-write	Besedilo - spreminjanje	f
00030000-55ee-b574-fce2-43d976412fa2	DogodekIzven-read	DogodekIzven - branje	f
00030000-55ee-b574-36e4-8e55fc0b7883	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55ee-b574-a92c-e5be08d438d7	Dogodek-read	Dogodek - branje	f
00030000-55ee-b574-3fb8-6d1dffa6de32	Dogodek-write	Dogodek - spreminjanje	f
00030000-55ee-b574-d30b-831ffae5d217	DrugiVir-read	DrugiVir - branje	f
00030000-55ee-b574-672b-4849917b49d6	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55ee-b574-927e-10e99914e02e	Drzava-read	Drzava - branje	f
00030000-55ee-b574-12c3-0cba756431ec	Drzava-write	Drzava - spreminjanje	f
00030000-55ee-b574-ef40-b722570ecc18	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55ee-b574-df2e-0fce018fb02d	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55ee-b574-d54d-2d576fcda354	Funkcija-read	Funkcija - branje	f
00030000-55ee-b574-6a56-e621746dbea7	Funkcija-write	Funkcija - spreminjanje	f
00030000-55ee-b574-888a-1b1787e031e4	Gostovanje-read	Gostovanje - branje	f
00030000-55ee-b574-3953-a6501aca83a8	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55ee-b574-fbc1-faab52e295f6	Gostujoca-read	Gostujoca - branje	f
00030000-55ee-b574-91dc-6987a39742fa	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55ee-b574-f609-3167f4594394	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55ee-b574-8b32-828c53395782	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55ee-b574-93ab-10ce1dde61ef	Kupec-read	Kupec - branje	f
00030000-55ee-b574-4ed4-5d7d4f27d24d	Kupec-write	Kupec - spreminjanje	f
00030000-55ee-b574-ed94-8ac17e1aa894	NacinPlacina-read	NacinPlacina - branje	f
00030000-55ee-b574-4998-1616c0679758	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55ee-b574-5e01-a121e22d9c3c	Option-read	Option - branje	f
00030000-55ee-b574-0387-e7075403bec6	Option-write	Option - spreminjanje	f
00030000-55ee-b574-51f5-281bdc19359f	OptionValue-read	OptionValue - branje	f
00030000-55ee-b574-d643-55ebc368023f	OptionValue-write	OptionValue - spreminjanje	f
00030000-55ee-b574-474b-253cf920e462	Oseba-read	Oseba - branje	f
00030000-55ee-b574-d086-c9edbf3f9cf2	Oseba-write	Oseba - spreminjanje	f
00030000-55ee-b574-6df6-bb61da195dfc	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55ee-b574-8625-5b1f4688d7c0	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55ee-b574-6958-bf5e8c735ed6	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55ee-b574-2e26-3ba765946d84	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55ee-b574-11bf-d6a6aa994f85	Pogodba-read	Pogodba - branje	f
00030000-55ee-b574-aa4c-ccca92e41f87	Pogodba-write	Pogodba - spreminjanje	f
00030000-55ee-b574-439b-652e8b808d67	Popa-read	Popa - branje	f
00030000-55ee-b574-04d2-d402a741df0c	Popa-write	Popa - spreminjanje	f
00030000-55ee-b574-e902-793bacf21e80	Posta-read	Posta - branje	f
00030000-55ee-b574-6125-f2e61696d413	Posta-write	Posta - spreminjanje	f
00030000-55ee-b574-dffa-f4b38922c703	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55ee-b574-104b-c0b656cad65e	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55ee-b574-6fdb-e71d902d92a0	PostniNaslov-read	PostniNaslov - branje	f
00030000-55ee-b574-51d3-06df68bb9c2e	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55ee-b574-6bd7-34237b378d90	Predstava-read	Predstava - branje	f
00030000-55ee-b574-9a0c-be3062d0c1ed	Predstava-write	Predstava - spreminjanje	f
00030000-55ee-b574-7593-6c30a38beaaf	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55ee-b574-bb93-03d72d9c2826	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55ee-b574-544e-792143c8c1d8	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55ee-b574-f9e7-0c900b5d3082	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55ee-b574-7609-882526828c66	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55ee-b574-393e-b3c27cd9c831	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55ee-b574-8418-a5fa9ff4700b	ProgramDela-read	ProgramDela - branje	f
00030000-55ee-b574-6fe6-70c2a760adca	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55ee-b574-de2a-7465e6dd5539	ProgramFestival-read	ProgramFestival - branje	f
00030000-55ee-b574-d98a-f42d7c2b6efc	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55ee-b574-289e-f381b7f841f0	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55ee-b574-9311-45099f6cb034	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55ee-b574-9427-37e4552c59c7	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55ee-b574-09b7-475b820cecea	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55ee-b574-8479-1fc9ab4e645f	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55ee-b574-aa44-a50d620185ca	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55ee-b574-2122-a6ce8cee714a	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55ee-b574-fb7d-28db49659182	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55ee-b574-4345-f82212031365	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55ee-b574-05ff-72c4a1f4fe7c	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55ee-b574-7abc-7506a4e3ecee	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55ee-b574-9f5b-dd6d71f844e5	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55ee-b574-1429-81f34004361b	ProgramRazno-read	ProgramRazno - branje	f
00030000-55ee-b574-9c9d-f1368cb2edff	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55ee-b574-f404-a6647997db0c	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55ee-b574-c344-562d3e8fdaa4	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55ee-b574-11e3-dc05d90981ab	Prostor-read	Prostor - branje	f
00030000-55ee-b574-d63a-6b1aa5642511	Prostor-write	Prostor - spreminjanje	f
00030000-55ee-b574-b3d1-efe5eafeae93	Racun-read	Racun - branje	f
00030000-55ee-b574-fce9-35c9e53713b0	Racun-write	Racun - spreminjanje	f
00030000-55ee-b574-eb69-61ac59bf2ac0	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55ee-b574-8280-4d572de4405d	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55ee-b574-8bd8-3ff64ee6d702	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55ee-b574-8cf2-ccf70625e430	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55ee-b574-76e9-497080052904	Rekvizit-read	Rekvizit - branje	f
00030000-55ee-b574-501b-a2cf3cc5b3a8	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55ee-b574-d55f-f17532b88a9b	Revizija-read	Revizija - branje	f
00030000-55ee-b574-ee34-86ec2beb9666	Revizija-write	Revizija - spreminjanje	f
00030000-55ee-b574-75c9-78ceb690aaec	Rezervacija-read	Rezervacija - branje	f
00030000-55ee-b574-3793-093205a25fb8	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55ee-b574-7c97-f3f581b1e899	SedezniRed-read	SedezniRed - branje	f
00030000-55ee-b574-5478-46bd6672d24d	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55ee-b574-e1b9-ff12f42aac59	Sedez-read	Sedez - branje	f
00030000-55ee-b574-9aa9-41700f83b87e	Sedez-write	Sedez - spreminjanje	f
00030000-55ee-b574-45ee-a582d2cd4df4	Sezona-read	Sezona - branje	f
00030000-55ee-b574-a0e5-6d14cb1eeb83	Sezona-write	Sezona - spreminjanje	f
00030000-55ee-b574-b6cd-f053c06b2889	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55ee-b574-efc7-6b8cc483c337	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55ee-b574-23eb-a320a3965ae6	Stevilcenje-read	Stevilcenje - branje	f
00030000-55ee-b574-e755-2bca093c774d	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55ee-b574-3835-4517c2e1162b	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55ee-b574-e96c-ef2636df42a8	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55ee-b574-fc1e-ed5d17d6ad3d	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55ee-b575-073e-0c67a0379987	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55ee-b575-6b05-4af245f975c0	Telefonska-read	Telefonska - branje	f
00030000-55ee-b575-8b37-4933ad654e1f	Telefonska-write	Telefonska - spreminjanje	f
00030000-55ee-b575-b27f-08aafd3b5b75	TerminStoritve-read	TerminStoritve - branje	f
00030000-55ee-b575-2024-6473ea0d0c00	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55ee-b575-5b23-2464815d7669	TipFunkcije-read	TipFunkcije - branje	f
00030000-55ee-b575-10a6-5b7093444281	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55ee-b575-f72f-4ecd15ff8d64	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55ee-b575-ac9f-a09c35596570	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55ee-b575-c904-554feab17922	Trr-read	Trr - branje	f
00030000-55ee-b575-fd99-ba6af38d1ec0	Trr-write	Trr - spreminjanje	f
00030000-55ee-b575-e332-f9bc6066d737	Uprizoritev-read	Uprizoritev - branje	f
00030000-55ee-b575-d685-b5b958fd25d3	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55ee-b575-56ba-9384e1a9e13d	Vaja-read	Vaja - branje	f
00030000-55ee-b575-1b28-5b56315541db	Vaja-write	Vaja - spreminjanje	f
00030000-55ee-b575-fda7-16bcb4402b90	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55ee-b575-1906-ac0f1814579f	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55ee-b575-a883-68d33f89a810	VrstaStroska-read	VrstaStroska - branje	f
00030000-55ee-b575-92bd-573a6e5e256f	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55ee-b575-016d-0886784278b8	Zaposlitev-read	Zaposlitev - branje	f
00030000-55ee-b575-5947-193cd847d120	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55ee-b575-407d-8cc0b04d78d9	Zasedenost-read	Zasedenost - branje	f
00030000-55ee-b575-3d7b-7becb8fa8281	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55ee-b575-5dcf-568bde1ac721	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55ee-b575-834d-f13e5f504fff	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55ee-b575-5adc-a8bfe9492059	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55ee-b575-376f-157ccba27d37	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55ee-b575-203d-4a96b584068e	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55ee-b575-3e74-65571a850cd4	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55ee-b575-4d32-e4209d56b1eb	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55ee-b575-a7f8-62a5c3814a57	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55ee-b575-ccfd-4a787380f834	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55ee-b575-5105-320d53767abe	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55ee-b575-948c-d06a000e0dfc	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55ee-b575-d8f8-33a0ef11fe51	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55ee-b575-ac84-8a90938947d4	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55ee-b575-1f50-1e199a6ddcd9	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55ee-b575-14f2-e22212778314	Datoteka-write	Datoteka - spreminjanje	f
00030000-55ee-b575-f745-3a0cd119e1bc	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2908 (class 0 OID 17981589)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55ee-b575-1427-7a1b05392430	00030000-55ee-b574-ef14-6db0fe832705
00020000-55ee-b575-7ab8-b1ff283357da	00030000-55ee-b574-927e-10e99914e02e
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-9bfd-96e5fc5bfeef
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-afde-195f578d2093
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-1cc6-8cef2853f887
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-4f72-76aaece39a4b
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-7e0b-e3f60ab1a581
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-a92c-e5be08d438d7
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-7eb9-79e49f096545
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-3fb8-6d1dffa6de32
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-927e-10e99914e02e
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-12c3-0cba756431ec
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-d54d-2d576fcda354
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-6a56-e621746dbea7
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-888a-1b1787e031e4
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-3953-a6501aca83a8
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-fbc1-faab52e295f6
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-91dc-6987a39742fa
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-f609-3167f4594394
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-8b32-828c53395782
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-5e01-a121e22d9c3c
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-51f5-281bdc19359f
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-474b-253cf920e462
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-d086-c9edbf3f9cf2
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-439b-652e8b808d67
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-04d2-d402a741df0c
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-e902-793bacf21e80
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-6125-f2e61696d413
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-6fdb-e71d902d92a0
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-51d3-06df68bb9c2e
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-6bd7-34237b378d90
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-9a0c-be3062d0c1ed
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-7609-882526828c66
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-393e-b3c27cd9c831
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-11e3-dc05d90981ab
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-d63a-6b1aa5642511
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-8bd8-3ff64ee6d702
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-8cf2-ccf70625e430
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-76e9-497080052904
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-501b-a2cf3cc5b3a8
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-45ee-a582d2cd4df4
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b574-a0e5-6d14cb1eeb83
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b575-5b23-2464815d7669
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b575-e332-f9bc6066d737
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b575-d685-b5b958fd25d3
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b575-56ba-9384e1a9e13d
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b575-1b28-5b56315541db
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b575-407d-8cc0b04d78d9
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b575-3d7b-7becb8fa8281
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b575-5dcf-568bde1ac721
00020000-55ee-b575-f051-b5282e06c2ae	00030000-55ee-b575-5adc-a8bfe9492059
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b574-9bfd-96e5fc5bfeef
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b574-7e0b-e3f60ab1a581
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b574-a92c-e5be08d438d7
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b574-927e-10e99914e02e
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b574-888a-1b1787e031e4
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b574-fbc1-faab52e295f6
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b574-f609-3167f4594394
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b574-8b32-828c53395782
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b574-5e01-a121e22d9c3c
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b574-51f5-281bdc19359f
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b574-474b-253cf920e462
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b574-d086-c9edbf3f9cf2
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b574-439b-652e8b808d67
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b574-e902-793bacf21e80
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b574-6fdb-e71d902d92a0
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b574-51d3-06df68bb9c2e
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b574-6bd7-34237b378d90
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b574-11e3-dc05d90981ab
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b574-8bd8-3ff64ee6d702
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b574-76e9-497080052904
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b574-45ee-a582d2cd4df4
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b575-6b05-4af245f975c0
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b575-8b37-4933ad654e1f
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b575-c904-554feab17922
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b575-fd99-ba6af38d1ec0
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b575-016d-0886784278b8
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b575-5947-193cd847d120
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b575-5dcf-568bde1ac721
00020000-55ee-b575-76eb-c7fa4f350093	00030000-55ee-b575-5adc-a8bfe9492059
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b574-9bfd-96e5fc5bfeef
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b574-1cc6-8cef2853f887
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b574-7e0b-e3f60ab1a581
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b574-6bfd-90092a82f692
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b574-ce77-8f330afee522
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b574-fce2-43d976412fa2
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b574-a92c-e5be08d438d7
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b574-927e-10e99914e02e
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b574-d54d-2d576fcda354
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b574-888a-1b1787e031e4
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b574-fbc1-faab52e295f6
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b574-f609-3167f4594394
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b574-5e01-a121e22d9c3c
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b574-51f5-281bdc19359f
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b574-474b-253cf920e462
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b574-439b-652e8b808d67
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b574-e902-793bacf21e80
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b574-6bd7-34237b378d90
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b574-7609-882526828c66
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b574-11e3-dc05d90981ab
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b574-8bd8-3ff64ee6d702
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b574-76e9-497080052904
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b574-45ee-a582d2cd4df4
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b575-5b23-2464815d7669
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b575-56ba-9384e1a9e13d
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b575-407d-8cc0b04d78d9
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b575-5dcf-568bde1ac721
00020000-55ee-b575-48cd-3a02e1e4d9d6	00030000-55ee-b575-5adc-a8bfe9492059
00020000-55ee-b575-4417-a0c295d0949f	00030000-55ee-b574-9bfd-96e5fc5bfeef
00020000-55ee-b575-4417-a0c295d0949f	00030000-55ee-b574-afde-195f578d2093
00020000-55ee-b575-4417-a0c295d0949f	00030000-55ee-b574-4f72-76aaece39a4b
00020000-55ee-b575-4417-a0c295d0949f	00030000-55ee-b574-7e0b-e3f60ab1a581
00020000-55ee-b575-4417-a0c295d0949f	00030000-55ee-b574-a92c-e5be08d438d7
00020000-55ee-b575-4417-a0c295d0949f	00030000-55ee-b574-927e-10e99914e02e
00020000-55ee-b575-4417-a0c295d0949f	00030000-55ee-b574-888a-1b1787e031e4
00020000-55ee-b575-4417-a0c295d0949f	00030000-55ee-b574-fbc1-faab52e295f6
00020000-55ee-b575-4417-a0c295d0949f	00030000-55ee-b574-5e01-a121e22d9c3c
00020000-55ee-b575-4417-a0c295d0949f	00030000-55ee-b574-51f5-281bdc19359f
00020000-55ee-b575-4417-a0c295d0949f	00030000-55ee-b574-439b-652e8b808d67
00020000-55ee-b575-4417-a0c295d0949f	00030000-55ee-b574-e902-793bacf21e80
00020000-55ee-b575-4417-a0c295d0949f	00030000-55ee-b574-6bd7-34237b378d90
00020000-55ee-b575-4417-a0c295d0949f	00030000-55ee-b574-11e3-dc05d90981ab
00020000-55ee-b575-4417-a0c295d0949f	00030000-55ee-b574-8bd8-3ff64ee6d702
00020000-55ee-b575-4417-a0c295d0949f	00030000-55ee-b574-76e9-497080052904
00020000-55ee-b575-4417-a0c295d0949f	00030000-55ee-b574-45ee-a582d2cd4df4
00020000-55ee-b575-4417-a0c295d0949f	00030000-55ee-b575-5b23-2464815d7669
00020000-55ee-b575-4417-a0c295d0949f	00030000-55ee-b575-5dcf-568bde1ac721
00020000-55ee-b575-4417-a0c295d0949f	00030000-55ee-b575-5adc-a8bfe9492059
00020000-55ee-b575-bb2e-84e8817101f2	00030000-55ee-b574-9bfd-96e5fc5bfeef
00020000-55ee-b575-bb2e-84e8817101f2	00030000-55ee-b574-7e0b-e3f60ab1a581
00020000-55ee-b575-bb2e-84e8817101f2	00030000-55ee-b574-a92c-e5be08d438d7
00020000-55ee-b575-bb2e-84e8817101f2	00030000-55ee-b574-927e-10e99914e02e
00020000-55ee-b575-bb2e-84e8817101f2	00030000-55ee-b574-888a-1b1787e031e4
00020000-55ee-b575-bb2e-84e8817101f2	00030000-55ee-b574-fbc1-faab52e295f6
00020000-55ee-b575-bb2e-84e8817101f2	00030000-55ee-b574-5e01-a121e22d9c3c
00020000-55ee-b575-bb2e-84e8817101f2	00030000-55ee-b574-51f5-281bdc19359f
00020000-55ee-b575-bb2e-84e8817101f2	00030000-55ee-b574-439b-652e8b808d67
00020000-55ee-b575-bb2e-84e8817101f2	00030000-55ee-b574-e902-793bacf21e80
00020000-55ee-b575-bb2e-84e8817101f2	00030000-55ee-b574-6bd7-34237b378d90
00020000-55ee-b575-bb2e-84e8817101f2	00030000-55ee-b574-11e3-dc05d90981ab
00020000-55ee-b575-bb2e-84e8817101f2	00030000-55ee-b574-8bd8-3ff64ee6d702
00020000-55ee-b575-bb2e-84e8817101f2	00030000-55ee-b574-76e9-497080052904
00020000-55ee-b575-bb2e-84e8817101f2	00030000-55ee-b574-45ee-a582d2cd4df4
00020000-55ee-b575-bb2e-84e8817101f2	00030000-55ee-b575-b27f-08aafd3b5b75
00020000-55ee-b575-bb2e-84e8817101f2	00030000-55ee-b574-bf95-f433a8ca998d
00020000-55ee-b575-bb2e-84e8817101f2	00030000-55ee-b575-5b23-2464815d7669
00020000-55ee-b575-bb2e-84e8817101f2	00030000-55ee-b575-5dcf-568bde1ac721
00020000-55ee-b575-bb2e-84e8817101f2	00030000-55ee-b575-5adc-a8bfe9492059
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-da0c-3e736b929450
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-ef14-6db0fe832705
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-bf95-f433a8ca998d
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-7eb9-79e49f096545
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-3491-65fcaca889d7
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-7bad-7fd044a5845e
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-2a74-2380b190f4c0
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-9bfd-96e5fc5bfeef
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-afde-195f578d2093
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-1cc6-8cef2853f887
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-4f72-76aaece39a4b
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-7e0b-e3f60ab1a581
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-6bfd-90092a82f692
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-ce77-8f330afee522
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-e18d-df83ca5ea8c7
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-fce2-43d976412fa2
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-36e4-8e55fc0b7883
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-a92c-e5be08d438d7
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-3fb8-6d1dffa6de32
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-927e-10e99914e02e
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-12c3-0cba756431ec
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-d30b-831ffae5d217
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-672b-4849917b49d6
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-ef40-b722570ecc18
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-df2e-0fce018fb02d
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-d54d-2d576fcda354
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-6a56-e621746dbea7
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-888a-1b1787e031e4
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-3953-a6501aca83a8
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-fbc1-faab52e295f6
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-91dc-6987a39742fa
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-f609-3167f4594394
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-8b32-828c53395782
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-93ab-10ce1dde61ef
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-4ed4-5d7d4f27d24d
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-ed94-8ac17e1aa894
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-4998-1616c0679758
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-5e01-a121e22d9c3c
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-0387-e7075403bec6
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-51f5-281bdc19359f
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-d643-55ebc368023f
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-474b-253cf920e462
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-d086-c9edbf3f9cf2
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-6df6-bb61da195dfc
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-8625-5b1f4688d7c0
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-6958-bf5e8c735ed6
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-2e26-3ba765946d84
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-11bf-d6a6aa994f85
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-aa4c-ccca92e41f87
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-439b-652e8b808d67
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-04d2-d402a741df0c
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-e902-793bacf21e80
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-6125-f2e61696d413
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-dffa-f4b38922c703
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-104b-c0b656cad65e
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-6fdb-e71d902d92a0
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-51d3-06df68bb9c2e
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-6bd7-34237b378d90
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-9a0c-be3062d0c1ed
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-7593-6c30a38beaaf
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-bb93-03d72d9c2826
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-544e-792143c8c1d8
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-f9e7-0c900b5d3082
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-7609-882526828c66
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-393e-b3c27cd9c831
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-8418-a5fa9ff4700b
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-6fe6-70c2a760adca
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-de2a-7465e6dd5539
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-d98a-f42d7c2b6efc
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-289e-f381b7f841f0
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-9311-45099f6cb034
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-9427-37e4552c59c7
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-09b7-475b820cecea
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-8479-1fc9ab4e645f
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-aa44-a50d620185ca
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-2122-a6ce8cee714a
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-fb7d-28db49659182
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-4345-f82212031365
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-05ff-72c4a1f4fe7c
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-7abc-7506a4e3ecee
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-9f5b-dd6d71f844e5
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-1429-81f34004361b
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-9c9d-f1368cb2edff
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-f404-a6647997db0c
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-c344-562d3e8fdaa4
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-11e3-dc05d90981ab
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-d63a-6b1aa5642511
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-b3d1-efe5eafeae93
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-fce9-35c9e53713b0
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-eb69-61ac59bf2ac0
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-8280-4d572de4405d
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-8bd8-3ff64ee6d702
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-8cf2-ccf70625e430
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-76e9-497080052904
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-501b-a2cf3cc5b3a8
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-d55f-f17532b88a9b
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-ee34-86ec2beb9666
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-75c9-78ceb690aaec
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-3793-093205a25fb8
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-7c97-f3f581b1e899
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-5478-46bd6672d24d
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-e1b9-ff12f42aac59
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-9aa9-41700f83b87e
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-45ee-a582d2cd4df4
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-a0e5-6d14cb1eeb83
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-b6cd-f053c06b2889
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-efc7-6b8cc483c337
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-23eb-a320a3965ae6
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-e755-2bca093c774d
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-3835-4517c2e1162b
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-e96c-ef2636df42a8
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b574-fc1e-ed5d17d6ad3d
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-073e-0c67a0379987
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-6b05-4af245f975c0
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-8b37-4933ad654e1f
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-b27f-08aafd3b5b75
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-2024-6473ea0d0c00
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-5b23-2464815d7669
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-10a6-5b7093444281
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-f72f-4ecd15ff8d64
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-ac9f-a09c35596570
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-c904-554feab17922
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-fd99-ba6af38d1ec0
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-e332-f9bc6066d737
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-d685-b5b958fd25d3
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-56ba-9384e1a9e13d
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-1b28-5b56315541db
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-fda7-16bcb4402b90
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-1906-ac0f1814579f
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-a883-68d33f89a810
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-92bd-573a6e5e256f
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-016d-0886784278b8
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-5947-193cd847d120
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-407d-8cc0b04d78d9
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-3d7b-7becb8fa8281
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-5dcf-568bde1ac721
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-834d-f13e5f504fff
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-5adc-a8bfe9492059
00020000-55ee-b576-5ee9-bb6271427a78	00030000-55ee-b575-376f-157ccba27d37
\.


--
-- TOC entry 2935 (class 0 OID 17981884)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 17981918)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 17982046)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55ee-b576-4a5e-0f714be6c8fd	00090000-55ee-b576-f207-17368f9ba949	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55ee-b576-4ca3-a33d3f40635c	00090000-55ee-b576-fa91-867657595cad	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55ee-b576-df8f-4466058bd92b	00090000-55ee-b576-6898-5157133d9363	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2913 (class 0 OID 17981649)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55ee-b576-b8b7-49b65a02fe13	00040000-55ee-b574-47b7-15d3f7f1ee70	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-b576-eb09-553b17e415c9	00040000-55ee-b574-47b7-15d3f7f1ee70	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55ee-b576-2c54-834366b69e5d	00040000-55ee-b574-47b7-15d3f7f1ee70	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-b576-d61f-9b3df2b8df28	00040000-55ee-b574-47b7-15d3f7f1ee70	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-b576-2dbb-f3e7250c45be	00040000-55ee-b574-47b7-15d3f7f1ee70	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-b576-6f29-2763c99985a1	00040000-55ee-b574-0148-87bffb7ebed6	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-b576-75b4-430faf4dc649	00040000-55ee-b574-abba-748f1ac6c5b8	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-b576-ebfc-d63937659a6e	00040000-55ee-b574-7a44-622baf87e514	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-b576-cf55-77248b703f40	00040000-55ee-b574-e6c4-59f844430b9a	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-b577-24d3-8892d46ecdd6	00040000-55ee-b574-47b7-15d3f7f1ee70	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2915 (class 0 OID 17981683)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55ee-b574-003f-ef735889e916	8341	Adlešiči
00050000-55ee-b574-0ccd-6cd3ed49a94c	5270	Ajdovščina
00050000-55ee-b574-cb9e-6cf356903332	6280	Ankaran/Ancarano
00050000-55ee-b574-662b-ebee1bae7257	9253	Apače
00050000-55ee-b574-10f4-f30fac47d6a4	8253	Artiče
00050000-55ee-b574-eb78-fa93193e6c05	4275	Begunje na Gorenjskem
00050000-55ee-b574-cdbe-72b57a609951	1382	Begunje pri Cerknici
00050000-55ee-b574-bdb2-b67d27c33a36	9231	Beltinci
00050000-55ee-b574-72b9-2ad76d2d9d89	2234	Benedikt
00050000-55ee-b574-bf27-0fb8465d61f2	2345	Bistrica ob Dravi
00050000-55ee-b574-4d8c-3b2a0992212c	3256	Bistrica ob Sotli
00050000-55ee-b574-85ef-b4b5440587c3	8259	Bizeljsko
00050000-55ee-b574-c015-7c6781c03206	1223	Blagovica
00050000-55ee-b574-b0d2-19b6f48ad269	8283	Blanca
00050000-55ee-b574-fe3b-550e0c7369ab	4260	Bled
00050000-55ee-b574-91ae-a67a60b0199a	4273	Blejska Dobrava
00050000-55ee-b574-c5c2-d7b79189b13d	9265	Bodonci
00050000-55ee-b574-e369-52c3e854190b	9222	Bogojina
00050000-55ee-b574-f6f7-7690173cfd6a	4263	Bohinjska Bela
00050000-55ee-b574-7d0d-3574a286e72a	4264	Bohinjska Bistrica
00050000-55ee-b574-854c-4203b33a7981	4265	Bohinjsko jezero
00050000-55ee-b574-2900-ecd6a30e8602	1353	Borovnica
00050000-55ee-b574-3a5c-1a9997bc63bd	8294	Boštanj
00050000-55ee-b574-0134-acae9f98debb	5230	Bovec
00050000-55ee-b574-ea70-e54188e83fa2	5295	Branik
00050000-55ee-b574-6175-7b1b37c7bd75	3314	Braslovče
00050000-55ee-b574-f183-4ef5220ad81c	5223	Breginj
00050000-55ee-b574-359e-205e12f9f696	8280	Brestanica
00050000-55ee-b574-66a8-37a32042ea00	2354	Bresternica
00050000-55ee-b574-8271-e410909e4fe6	4243	Brezje
00050000-55ee-b574-1738-29e644f80185	1351	Brezovica pri Ljubljani
00050000-55ee-b574-2963-805264172339	8250	Brežice
00050000-55ee-b574-79f1-d2596a289b76	4210	Brnik - Aerodrom
00050000-55ee-b574-1713-d050d857644b	8321	Brusnice
00050000-55ee-b574-6844-734bd840e17c	3255	Buče
00050000-55ee-b574-689d-8bbc88c47e1c	8276	Bučka 
00050000-55ee-b574-849c-de0e81cf69a6	9261	Cankova
00050000-55ee-b574-85dc-82f862ca1c69	3000	Celje 
00050000-55ee-b574-7299-2271a73c793a	3001	Celje - poštni predali
00050000-55ee-b574-6d98-7a710cf58c70	4207	Cerklje na Gorenjskem
00050000-55ee-b574-643c-a582d2e3e8fd	8263	Cerklje ob Krki
00050000-55ee-b574-5bf9-59271ea9aaf3	1380	Cerknica
00050000-55ee-b574-a1a4-6dc119c88574	5282	Cerkno
00050000-55ee-b574-9c7b-2511e29cf910	2236	Cerkvenjak
00050000-55ee-b574-4acc-f46b2e7979e7	2215	Ceršak
00050000-55ee-b574-43db-5ec66518fbad	2326	Cirkovce
00050000-55ee-b574-4371-858a14e379dd	2282	Cirkulane
00050000-55ee-b574-951e-78898d8fd986	5273	Col
00050000-55ee-b574-8d64-c1c1aae2b7d0	8251	Čatež ob Savi
00050000-55ee-b574-2efb-99dbf6b8bfdc	1413	Čemšenik
00050000-55ee-b574-6ede-3740518d0445	5253	Čepovan
00050000-55ee-b574-a8d2-33b689c8db6a	9232	Črenšovci
00050000-55ee-b574-bd14-3aefe8653642	2393	Črna na Koroškem
00050000-55ee-b574-2c57-bcdf6cb33e14	6275	Črni Kal
00050000-55ee-b574-5224-49447e2344d9	5274	Črni Vrh nad Idrijo
00050000-55ee-b574-a1f9-29c52e7b97fb	5262	Črniče
00050000-55ee-b574-7667-1d9a0fdbd4d3	8340	Črnomelj
00050000-55ee-b574-a8c0-6853d5a7cb1d	6271	Dekani
00050000-55ee-b574-9a41-a9efb1b171d6	5210	Deskle
00050000-55ee-b574-1977-fb2fae23d14b	2253	Destrnik
00050000-55ee-b574-f1f2-f91016a9a25b	6215	Divača
00050000-55ee-b574-a067-7b262ef8b946	1233	Dob
00050000-55ee-b574-da8d-05e216906b62	3224	Dobje pri Planini
00050000-55ee-b574-5f6b-bbe4d94fc442	8257	Dobova
00050000-55ee-b574-1078-89889ed36923	1423	Dobovec
00050000-55ee-b574-7997-d61a7b603f15	5263	Dobravlje
00050000-55ee-b574-e03b-f43d7fcd6174	3204	Dobrna
00050000-55ee-b574-517c-86bc010a8453	8211	Dobrnič
00050000-55ee-b574-955e-40eb74677ef4	1356	Dobrova
00050000-55ee-b574-e612-fc8aa75f8921	9223	Dobrovnik/Dobronak 
00050000-55ee-b574-8b15-5a6d1638e17b	5212	Dobrovo v Brdih
00050000-55ee-b574-f67c-7bd3c8112e08	1431	Dol pri Hrastniku
00050000-55ee-b574-1dab-a4cca14df8dc	1262	Dol pri Ljubljani
00050000-55ee-b574-71f4-d0a776389625	1273	Dole pri Litiji
00050000-55ee-b574-f202-265bbefe4dc7	1331	Dolenja vas
00050000-55ee-b574-3b88-510a188e3428	8350	Dolenjske Toplice
00050000-55ee-b574-c075-b3b845b14c56	1230	Domžale
00050000-55ee-b574-4c94-4c24352cf880	2252	Dornava
00050000-55ee-b574-09d8-2bd22a7724e0	5294	Dornberk
00050000-55ee-b574-8902-01eb97fb8c67	1319	Draga
00050000-55ee-b574-fb19-dd87d35f373f	8343	Dragatuš
00050000-55ee-b574-88c1-29ac1b3d8b5e	3222	Dramlje
00050000-55ee-b574-16e1-8fa13b18c2ce	2370	Dravograd
00050000-55ee-b574-46fa-e439f5e8bace	4203	Duplje
00050000-55ee-b574-f739-47a02507fd93	6221	Dutovlje
00050000-55ee-b574-ace6-1bdf07f2c2db	8361	Dvor
00050000-55ee-b574-c993-9f369bda24a1	2343	Fala
00050000-55ee-b574-eab6-dc45c470f539	9208	Fokovci
00050000-55ee-b574-a95e-fce5b811d2e4	2313	Fram
00050000-55ee-b574-c8b7-c1b6d17b7b8f	3213	Frankolovo
00050000-55ee-b574-f313-e490b51db85f	1274	Gabrovka
00050000-55ee-b574-3f64-acc003a8b3eb	8254	Globoko
00050000-55ee-b574-553c-bb1846a6fb7b	5275	Godovič
00050000-55ee-b574-32cc-8925ab6a7417	4204	Golnik
00050000-55ee-b574-9bae-f76ea32a03ce	3303	Gomilsko
00050000-55ee-b574-3664-1e0b79fb87e9	4224	Gorenja vas
00050000-55ee-b574-0bec-fc48a13101bf	3263	Gorica pri Slivnici
00050000-55ee-b574-2ef3-70f696f27e61	2272	Gorišnica
00050000-55ee-b574-aa08-9e13d8d11d72	9250	Gornja Radgona
00050000-55ee-b574-7d09-c15fd72d67f6	3342	Gornji Grad
00050000-55ee-b574-79df-99a60377162f	4282	Gozd Martuljek
00050000-55ee-b574-52fa-77ddaa251ff7	6272	Gračišče
00050000-55ee-b574-8d76-999aa8bd5ca5	9264	Grad
00050000-55ee-b574-e405-f617f185749c	8332	Gradac
00050000-55ee-b574-fdef-b161fa179772	1384	Grahovo
00050000-55ee-b574-0079-d22b037acbb4	5242	Grahovo ob Bači
00050000-55ee-b574-3c5d-27e60ad25695	5251	Grgar
00050000-55ee-b574-096d-1bfc98f4c96c	3302	Griže
00050000-55ee-b574-bcc0-25123f6d54a4	3231	Grobelno
00050000-55ee-b574-400c-2bcef111088b	1290	Grosuplje
00050000-55ee-b574-8e58-7e7c5999c26d	2288	Hajdina
00050000-55ee-b574-1053-39387fb2fb8f	8362	Hinje
00050000-55ee-b574-147e-9b767ef6c525	2311	Hoče
00050000-55ee-b574-277b-b1a95192accf	9205	Hodoš/Hodos
00050000-55ee-b574-c64d-8dcd3848a363	1354	Horjul
00050000-55ee-b574-3ad0-6ee80b1ca7cb	1372	Hotedršica
00050000-55ee-b574-66d8-aec29d474e84	1430	Hrastnik
00050000-55ee-b574-225b-aee269557178	6225	Hruševje
00050000-55ee-b574-ebca-bc02c3a4e9c6	4276	Hrušica
00050000-55ee-b574-7ba7-98038bf7415f	5280	Idrija
00050000-55ee-b574-7caf-96b7bd23abde	1292	Ig
00050000-55ee-b574-2dba-734216835e87	6250	Ilirska Bistrica
00050000-55ee-b574-c8de-135294e6893f	6251	Ilirska Bistrica-Trnovo
00050000-55ee-b574-e429-857d65e9f1e3	1295	Ivančna Gorica
00050000-55ee-b574-9135-35522299bdec	2259	Ivanjkovci
00050000-55ee-b574-19fd-c3a4df128335	1411	Izlake
00050000-55ee-b574-54da-1117d7b867b5	6310	Izola/Isola
00050000-55ee-b574-4d7c-7c106b4a95a0	2222	Jakobski Dol
00050000-55ee-b574-cf13-8373bb9e8b19	2221	Jarenina
00050000-55ee-b574-62e2-08115df6a799	6254	Jelšane
00050000-55ee-b574-b59b-02f50399c3ea	4270	Jesenice
00050000-55ee-b574-fc6f-1dd92dc65fca	8261	Jesenice na Dolenjskem
00050000-55ee-b574-c4ec-9e3f03527936	3273	Jurklošter
00050000-55ee-b574-27e2-755548f52358	2223	Jurovski Dol
00050000-55ee-b574-0816-4d935b0c160a	2256	Juršinci
00050000-55ee-b574-8f9f-8d8ad34105b6	5214	Kal nad Kanalom
00050000-55ee-b574-25fd-8c33150d9cd2	3233	Kalobje
00050000-55ee-b574-a48c-466e808d043c	4246	Kamna Gorica
00050000-55ee-b574-3cfa-f56d6849a3ed	2351	Kamnica
00050000-55ee-b574-e399-c35a0d212cfe	1241	Kamnik
00050000-55ee-b574-6531-7f2d54818ef5	5213	Kanal
00050000-55ee-b574-fa09-911a6497c1bc	8258	Kapele
00050000-55ee-b574-a5e5-629ca95e40b8	2362	Kapla
00050000-55ee-b574-47f1-b69ebf606d35	2325	Kidričevo
00050000-55ee-b574-59bc-a7f67220df64	1412	Kisovec
00050000-55ee-b574-b6eb-a3f2388bf6c0	6253	Knežak
00050000-55ee-b574-4d34-31eaaacf70f5	5222	Kobarid
00050000-55ee-b574-7808-ffac905b2359	9227	Kobilje
00050000-55ee-b574-6af6-acea543c33e7	1330	Kočevje
00050000-55ee-b574-ddb8-37bf7fafc942	1338	Kočevska Reka
00050000-55ee-b574-1ff4-6039261ffbaa	2276	Kog
00050000-55ee-b574-1a41-346a004597d1	5211	Kojsko
00050000-55ee-b574-45bd-4ed9c1a7774d	6223	Komen
00050000-55ee-b574-14db-a69af2bfd6c2	1218	Komenda
00050000-55ee-b574-312e-17a093e2bd44	6000	Koper/Capodistria 
00050000-55ee-b574-f534-c0eabf9b03a7	6001	Koper/Capodistria - poštni predali
00050000-55ee-b574-d8f5-4a41244fdea3	8282	Koprivnica
00050000-55ee-b574-3488-f22716dad121	5296	Kostanjevica na Krasu
00050000-55ee-b574-fc15-99ab785e6631	8311	Kostanjevica na Krki
00050000-55ee-b574-3abe-8a40829e1017	1336	Kostel
00050000-55ee-b574-3ae2-4d3955c60253	6256	Košana
00050000-55ee-b574-6407-12c3f4c0411a	2394	Kotlje
00050000-55ee-b574-045b-23ab3e3d919a	6240	Kozina
00050000-55ee-b574-00de-adc8749a253d	3260	Kozje
00050000-55ee-b574-0438-68203ab12cfc	4000	Kranj 
00050000-55ee-b574-02d1-cf7cb39c80f2	4001	Kranj - poštni predali
00050000-55ee-b574-6dcb-f1e96ebf90ba	4280	Kranjska Gora
00050000-55ee-b574-e45b-8f49a2de6d7b	1281	Kresnice
00050000-55ee-b574-716a-5739dbac3b0c	4294	Križe
00050000-55ee-b574-443c-de47f342cadf	9206	Križevci
00050000-55ee-b574-04b4-6d418e9969ac	9242	Križevci pri Ljutomeru
00050000-55ee-b574-6707-1843c6ee7662	1301	Krka
00050000-55ee-b574-896d-7629dd3535e7	8296	Krmelj
00050000-55ee-b574-aac3-fa3c1082b1c2	4245	Kropa
00050000-55ee-b574-c70e-3e2377ce309b	8262	Krška vas
00050000-55ee-b574-4d32-572417af0a20	8270	Krško
00050000-55ee-b574-1d29-42573b395621	9263	Kuzma
00050000-55ee-b574-249d-5fd53a9f196e	2318	Laporje
00050000-55ee-b574-dde9-1c06ed3836d4	3270	Laško
00050000-55ee-b574-5257-e24e1c07ac50	1219	Laze v Tuhinju
00050000-55ee-b574-2d43-053b18b8c2b1	2230	Lenart v Slovenskih goricah
00050000-55ee-b574-6446-bed3725424a4	9220	Lendava/Lendva
00050000-55ee-b574-d995-fb28293c56a0	4248	Lesce
00050000-55ee-b574-fa9e-b3a25a785b08	3261	Lesično
00050000-55ee-b574-b6e6-654cde1c6353	8273	Leskovec pri Krškem
00050000-55ee-b574-d55c-6b80569b63ec	2372	Libeliče
00050000-55ee-b574-4d2f-3335d2005173	2341	Limbuš
00050000-55ee-b574-56a4-2b9e28a007a6	1270	Litija
00050000-55ee-b574-2ec0-647987a75119	3202	Ljubečna
00050000-55ee-b574-2520-7ed82e8e57ea	1000	Ljubljana 
00050000-55ee-b574-32c6-e1d115af0484	1001	Ljubljana - poštni predali
00050000-55ee-b574-bf75-b8806acc6b4b	1231	Ljubljana - Črnuče
00050000-55ee-b574-643c-21d2eff66d7f	1261	Ljubljana - Dobrunje
00050000-55ee-b574-0920-cab0e3669ba8	1260	Ljubljana - Polje
00050000-55ee-b574-7fdb-5b4312672f15	1210	Ljubljana - Šentvid
00050000-55ee-b574-4563-0b6c2103a074	1211	Ljubljana - Šmartno
00050000-55ee-b574-5a2a-d0df52174f03	3333	Ljubno ob Savinji
00050000-55ee-b574-8f28-415264b62ede	9240	Ljutomer
00050000-55ee-b574-81ba-07d54209278d	3215	Loče
00050000-55ee-b574-ec75-f25d04c0d0f8	5231	Log pod Mangartom
00050000-55ee-b574-d3bd-3ef2560239a4	1358	Log pri Brezovici
00050000-55ee-b574-28e9-e0cde073a8d0	1370	Logatec
00050000-55ee-b574-2ea4-58e2c5d11374	1371	Logatec
00050000-55ee-b574-6983-af27d4693bf0	1434	Loka pri Zidanem Mostu
00050000-55ee-b574-7ebd-5326ee81d45e	3223	Loka pri Žusmu
00050000-55ee-b574-0bf8-99fd741a84d4	6219	Lokev
00050000-55ee-b574-be4a-16ac168a9c1b	1318	Loški Potok
00050000-55ee-b574-56ce-df0551fa516b	2324	Lovrenc na Dravskem polju
00050000-55ee-b574-beb7-0f8704ca6247	2344	Lovrenc na Pohorju
00050000-55ee-b574-9be7-dd5228a49bbf	3334	Luče
00050000-55ee-b574-8ecd-d547930c82fe	1225	Lukovica
00050000-55ee-b574-7c8d-0fb446bc9c24	9202	Mačkovci
00050000-55ee-b574-55e3-1b1b44e86b91	2322	Majšperk
00050000-55ee-b574-4c29-ec52172d4e08	2321	Makole
00050000-55ee-b574-1e3b-b4443b33a018	9243	Mala Nedelja
00050000-55ee-b574-b888-d28c631bfcde	2229	Malečnik
00050000-55ee-b574-0234-f81cc6fcc93b	6273	Marezige
00050000-55ee-b574-fcec-e2c9ae39be8d	2000	Maribor 
00050000-55ee-b574-7b18-bc26238dd6fc	2001	Maribor - poštni predali
00050000-55ee-b574-2b0e-b944e496d2da	2206	Marjeta na Dravskem polju
00050000-55ee-b574-e52c-d0a2ecb281af	2281	Markovci
00050000-55ee-b574-b155-bc728a772ef7	9221	Martjanci
00050000-55ee-b574-89b5-b847a5b60cf7	6242	Materija
00050000-55ee-b574-9d2e-a648f04025d7	4211	Mavčiče
00050000-55ee-b574-a6df-2cf187c0dee1	1215	Medvode
00050000-55ee-b574-d78f-33f3e494d6b2	1234	Mengeš
00050000-55ee-b574-86f2-ceb1a7fa1b81	8330	Metlika
00050000-55ee-b574-fc65-e82fdbdda517	2392	Mežica
00050000-55ee-b574-101d-7d1ecfb6d564	2204	Miklavž na Dravskem polju
00050000-55ee-b574-1e95-3d14d62b33c7	2275	Miklavž pri Ormožu
00050000-55ee-b574-f9be-4687ee73e682	5291	Miren
00050000-55ee-b574-3f61-1020446aaa1b	8233	Mirna
00050000-55ee-b574-3fb1-1db126f09335	8216	Mirna Peč
00050000-55ee-b574-0c0d-b6e6688ab74a	2382	Mislinja
00050000-55ee-b574-32cd-bcc36df4a7aa	4281	Mojstrana
00050000-55ee-b574-c706-2576cdb2ee52	8230	Mokronog
00050000-55ee-b574-7752-6715dbea7022	1251	Moravče
00050000-55ee-b574-e2a1-60d4728f747d	9226	Moravske Toplice
00050000-55ee-b574-6a16-d2e9e77a9d62	5216	Most na Soči
00050000-55ee-b574-9f64-7924da916b2f	1221	Motnik
00050000-55ee-b574-7699-d4715bbeda64	3330	Mozirje
00050000-55ee-b574-51ef-b64ea87bc02f	9000	Murska Sobota 
00050000-55ee-b574-e917-83d8d649258c	9001	Murska Sobota - poštni predali
00050000-55ee-b574-1ffd-b944f8590ff2	2366	Muta
00050000-55ee-b574-0b8e-72b0f58b4702	4202	Naklo
00050000-55ee-b574-5028-4cbd2cece5ed	3331	Nazarje
00050000-55ee-b574-9100-afdcf89e0dd8	1357	Notranje Gorice
00050000-55ee-b574-eaa3-0963e59d254a	3203	Nova Cerkev
00050000-55ee-b574-0848-d12d64a94431	5000	Nova Gorica 
00050000-55ee-b574-4c92-49cee91dcf86	5001	Nova Gorica - poštni predali
00050000-55ee-b574-796f-f3ec196b8c6a	1385	Nova vas
00050000-55ee-b574-2b92-7e7bf649a969	8000	Novo mesto
00050000-55ee-b574-2402-8926c5a89e96	8001	Novo mesto - poštni predali
00050000-55ee-b574-5ea1-462fd77cc7ff	6243	Obrov
00050000-55ee-b574-b0da-5740f71f36be	9233	Odranci
00050000-55ee-b574-733d-96fb8409d327	2317	Oplotnica
00050000-55ee-b574-b961-6956c021fbfb	2312	Orehova vas
00050000-55ee-b574-bc2a-62e0809eedd6	2270	Ormož
00050000-55ee-b574-fbf8-0ea3921aabcb	1316	Ortnek
00050000-55ee-b574-0ef2-5cef8c5543dd	1337	Osilnica
00050000-55ee-b574-703d-f16373877ddf	8222	Otočec
00050000-55ee-b574-4863-9fcba474ebe7	2361	Ožbalt
00050000-55ee-b574-0c82-79ca273ab7e5	2231	Pernica
00050000-55ee-b574-a32b-10ecb972097e	2211	Pesnica pri Mariboru
00050000-55ee-b574-7b1f-28b03ba3143a	9203	Petrovci
00050000-55ee-b574-008e-0ea466ecc43b	3301	Petrovče
00050000-55ee-b574-d771-e628009c7b67	6330	Piran/Pirano
00050000-55ee-b574-3048-5398ca5497d6	8255	Pišece
00050000-55ee-b574-1717-aadfb0658f4a	6257	Pivka
00050000-55ee-b574-22b6-f802e5fb916d	6232	Planina
00050000-55ee-b574-cd52-7ba79f2b1441	3225	Planina pri Sevnici
00050000-55ee-b574-a9a8-72c2de33daa7	6276	Pobegi
00050000-55ee-b574-747e-8cd11739312e	8312	Podbočje
00050000-55ee-b574-0c23-85b11ab58d9e	5243	Podbrdo
00050000-55ee-b574-93aa-19507da4b834	3254	Podčetrtek
00050000-55ee-b574-d418-1d5198eb422a	2273	Podgorci
00050000-55ee-b574-8a3f-a6f2388504e6	6216	Podgorje
00050000-55ee-b574-50e4-58f50278bb7b	2381	Podgorje pri Slovenj Gradcu
00050000-55ee-b574-75c6-b020793d354d	6244	Podgrad
00050000-55ee-b574-54d0-4cc1c9e18cab	1414	Podkum
00050000-55ee-b574-d437-ccb31c174c9b	2286	Podlehnik
00050000-55ee-b574-3ec2-9371faa9467c	5272	Podnanos
00050000-55ee-b574-7293-9c458a7bd662	4244	Podnart
00050000-55ee-b574-5007-f9d122e36d56	3241	Podplat
00050000-55ee-b574-a72b-f765a01d495f	3257	Podsreda
00050000-55ee-b574-948b-68e762fe7dc2	2363	Podvelka
00050000-55ee-b574-6121-fd59405386bc	2208	Pohorje
00050000-55ee-b574-c68a-b018963326aa	2257	Polenšak
00050000-55ee-b574-6cc8-90e08290f5a7	1355	Polhov Gradec
00050000-55ee-b574-b397-75a233ea297c	4223	Poljane nad Škofjo Loko
00050000-55ee-b574-edfe-3e7987ce279d	2319	Poljčane
00050000-55ee-b574-d185-8abf4f673aa1	1272	Polšnik
00050000-55ee-b574-075c-21d9bb575980	3313	Polzela
00050000-55ee-b574-4cd4-76f497c74c3c	3232	Ponikva
00050000-55ee-b574-da68-35ad54f30ec4	6320	Portorož/Portorose
00050000-55ee-b574-7949-e56a126ea6da	6230	Postojna
00050000-55ee-b574-bf89-1edfc93f0844	2331	Pragersko
00050000-55ee-b574-a00b-a725af217710	3312	Prebold
00050000-55ee-b574-9660-aae6e600a5bc	4205	Preddvor
00050000-55ee-b574-1799-c1f3b06248f9	6255	Prem
00050000-55ee-b574-ac10-784e37e210a8	1352	Preserje
00050000-55ee-b574-4641-7c7d0581badc	6258	Prestranek
00050000-55ee-b574-5bd6-a7a451598000	2391	Prevalje
00050000-55ee-b574-960c-2b1ad9e7701e	3262	Prevorje
00050000-55ee-b574-9851-c5aa55ca2a68	1276	Primskovo 
00050000-55ee-b574-07c4-3b12e248ebe5	3253	Pristava pri Mestinju
00050000-55ee-b574-ddf9-79f6300c5577	9207	Prosenjakovci/Partosfalva
00050000-55ee-b574-8069-145fdb530d2f	5297	Prvačina
00050000-55ee-b574-0bd0-c88b84253995	2250	Ptuj
00050000-55ee-b574-f8f7-176186333094	2323	Ptujska Gora
00050000-55ee-b574-fb40-dc40127b5e76	9201	Puconci
00050000-55ee-b574-6ff9-0e987f287409	2327	Rače
00050000-55ee-b574-a0a0-15b81bdc98dc	1433	Radeče
00050000-55ee-b574-763e-72e0b2babdc4	9252	Radenci
00050000-55ee-b574-e427-79902188a23f	2360	Radlje ob Dravi
00050000-55ee-b574-3a6d-9a0e7030ca75	1235	Radomlje
00050000-55ee-b574-4d5c-e8c9e14d8a16	4240	Radovljica
00050000-55ee-b574-d28b-825f62ae039a	8274	Raka
00050000-55ee-b574-e24a-86500d616b6d	1381	Rakek
00050000-55ee-b574-9ffd-8fbd17c871bd	4283	Rateče - Planica
00050000-55ee-b574-4b63-05292e263b0d	2390	Ravne na Koroškem
00050000-55ee-b574-a39d-b5177ff2599c	9246	Razkrižje
00050000-55ee-b574-28bb-e0b335b50d05	3332	Rečica ob Savinji
00050000-55ee-b574-df22-9a15d470d6d8	5292	Renče
00050000-55ee-b574-d103-989d54008540	1310	Ribnica
00050000-55ee-b574-beda-a258a2de768c	2364	Ribnica na Pohorju
00050000-55ee-b574-a932-87d8cf246864	3272	Rimske Toplice
00050000-55ee-b574-ddc1-9a88d7e402c5	1314	Rob
00050000-55ee-b574-7918-56cad087a877	5215	Ročinj
00050000-55ee-b574-8dd7-de3861cc9038	3250	Rogaška Slatina
00050000-55ee-b574-e33e-bacee260853f	9262	Rogašovci
00050000-55ee-b574-ce00-4a9468b8fea4	3252	Rogatec
00050000-55ee-b574-16db-19331267f262	1373	Rovte
00050000-55ee-b574-bc7c-df0595142fdf	2342	Ruše
00050000-55ee-b574-5f97-b92213ba9794	1282	Sava
00050000-55ee-b574-7e3e-60cf09c0a4a4	6333	Sečovlje/Sicciole
00050000-55ee-b574-ee23-a7f154626c0f	4227	Selca
00050000-55ee-b574-5597-842e564e170b	2352	Selnica ob Dravi
00050000-55ee-b574-e0f7-892c03f88a97	8333	Semič
00050000-55ee-b574-633d-7ed74d7c2cea	8281	Senovo
00050000-55ee-b574-6665-4c3af0f736cb	6224	Senožeče
00050000-55ee-b574-dd7c-20d3fb4e0a6f	8290	Sevnica
00050000-55ee-b574-e7c8-2f5ec25f374d	6210	Sežana
00050000-55ee-b574-be47-f8800bae1565	2214	Sladki Vrh
00050000-55ee-b574-e29d-6b97e5d2ddf8	5283	Slap ob Idrijci
00050000-55ee-b574-d04f-329e4736fca6	2380	Slovenj Gradec
00050000-55ee-b574-5d6d-a32c432b24a2	2310	Slovenska Bistrica
00050000-55ee-b574-5f0c-84530345ffcd	3210	Slovenske Konjice
00050000-55ee-b574-1c53-f1dc6df08889	1216	Smlednik
00050000-55ee-b574-3960-1f5995c89cdc	5232	Soča
00050000-55ee-b574-28ba-a59cc9233ffe	1317	Sodražica
00050000-55ee-b574-fcf1-e8e4e5f6d985	3335	Solčava
00050000-55ee-b574-c256-b6aae2b69497	5250	Solkan
00050000-55ee-b574-464d-ebdd15aadb13	4229	Sorica
00050000-55ee-b574-74ec-2e629741efe1	4225	Sovodenj
00050000-55ee-b574-15ba-d45e5edd7bb6	5281	Spodnja Idrija
00050000-55ee-b574-54f9-7c0820ace711	2241	Spodnji Duplek
00050000-55ee-b574-5f65-2f6aad083bcb	9245	Spodnji Ivanjci
00050000-55ee-b574-4e73-a01b6cf7615a	2277	Središče ob Dravi
00050000-55ee-b574-a63a-8a94804291ef	4267	Srednja vas v Bohinju
00050000-55ee-b574-21fa-b0b5528ef293	8256	Sromlje 
00050000-55ee-b574-3342-ee65a9df4da3	5224	Srpenica
00050000-55ee-b574-ef3a-b1999b6a58d7	1242	Stahovica
00050000-55ee-b574-2241-c256502f69ab	1332	Stara Cerkev
00050000-55ee-b574-e1e6-4fb4469ffb69	8342	Stari trg ob Kolpi
00050000-55ee-b574-623f-e4a8372772b7	1386	Stari trg pri Ložu
00050000-55ee-b574-2a0c-7b379542eb0a	2205	Starše
00050000-55ee-b574-7449-5b897d79b978	2289	Stoperce
00050000-55ee-b574-21fa-08c6722526e8	8322	Stopiče
00050000-55ee-b574-56a8-11e4a377bf26	3206	Stranice
00050000-55ee-b574-4fcf-b39a2395735b	8351	Straža
00050000-55ee-b574-1b13-5c97af217955	1313	Struge
00050000-55ee-b574-182d-4ab7ee29c9f5	8293	Studenec
00050000-55ee-b574-9901-552def8fe061	8331	Suhor
00050000-55ee-b574-43ae-b0def7f730ea	2233	Sv. Ana v Slovenskih goricah
00050000-55ee-b574-0d60-2de2d29047ba	2235	Sv. Trojica v Slovenskih goricah
00050000-55ee-b574-861c-10f5ae070f13	2353	Sveti Duh na Ostrem Vrhu
00050000-55ee-b574-37d5-ae6827356c62	9244	Sveti Jurij ob Ščavnici
00050000-55ee-b574-058b-9ff6724e5be1	3264	Sveti Štefan
00050000-55ee-b574-fa71-03b52230be3d	2258	Sveti Tomaž
00050000-55ee-b574-8ed6-6a932f00c40e	9204	Šalovci
00050000-55ee-b574-d754-ad2d6863f487	5261	Šempas
00050000-55ee-b574-9a12-c36883c971e6	5290	Šempeter pri Gorici
00050000-55ee-b574-6c48-0710db1e7a15	3311	Šempeter v Savinjski dolini
00050000-55ee-b574-687f-ee6203ade545	4208	Šenčur
00050000-55ee-b574-72ff-84b94b5442fd	2212	Šentilj v Slovenskih goricah
00050000-55ee-b574-e241-6401846c3cc4	8297	Šentjanž
00050000-55ee-b574-14a6-49e5f7ca09ca	2373	Šentjanž pri Dravogradu
00050000-55ee-b574-df4d-512e6018bef9	8310	Šentjernej
00050000-55ee-b574-55e4-f25ae08374a5	3230	Šentjur
00050000-55ee-b574-e728-1fe2424e2fb9	3271	Šentrupert
00050000-55ee-b574-ef24-ebf03b69844c	8232	Šentrupert
00050000-55ee-b574-90cc-e983288a1d19	1296	Šentvid pri Stični
00050000-55ee-b574-d9a9-aac1a9ec602f	8275	Škocjan
00050000-55ee-b574-2aa5-d89d7d09b04b	6281	Škofije
00050000-55ee-b574-b061-c500d0054d4e	4220	Škofja Loka
00050000-55ee-b574-bf47-ca85c5168461	3211	Škofja vas
00050000-55ee-b574-87a7-806287021ffd	1291	Škofljica
00050000-55ee-b574-4fa6-db26ceedf7d0	6274	Šmarje
00050000-55ee-b574-ac6b-c7ac77fb6e43	1293	Šmarje - Sap
00050000-55ee-b574-2af6-2d405a97a8a3	3240	Šmarje pri Jelšah
00050000-55ee-b574-73ff-e82f6bd411db	8220	Šmarješke Toplice
00050000-55ee-b574-2269-0d2df9f29a8f	2315	Šmartno na Pohorju
00050000-55ee-b574-7914-fcc4d0c46710	3341	Šmartno ob Dreti
00050000-55ee-b574-f626-6855075bb467	3327	Šmartno ob Paki
00050000-55ee-b574-bc10-0932b73994c8	1275	Šmartno pri Litiji
00050000-55ee-b574-4297-e03a4d21ba2c	2383	Šmartno pri Slovenj Gradcu
00050000-55ee-b574-5908-93644f2f2437	3201	Šmartno v Rožni dolini
00050000-55ee-b574-affa-7c24d7cddae5	3325	Šoštanj
00050000-55ee-b574-d958-fa9ac5494f55	6222	Štanjel
00050000-55ee-b574-e83d-7b41efe30adb	3220	Štore
00050000-55ee-b574-2575-0f7aa5bc890d	3304	Tabor
00050000-55ee-b574-6149-19cb2535878a	3221	Teharje
00050000-55ee-b574-2eea-199be00b24fd	9251	Tišina
00050000-55ee-b574-aec9-05ae809dc379	5220	Tolmin
00050000-55ee-b574-a67e-880516991bce	3326	Topolšica
00050000-55ee-b574-c3e3-36835bb4c3c1	2371	Trbonje
00050000-55ee-b574-b297-e8e2998bef07	1420	Trbovlje
00050000-55ee-b574-87ed-eeea91e1bd9d	8231	Trebelno 
00050000-55ee-b574-fff6-feee40d28218	8210	Trebnje
00050000-55ee-b574-be47-dac55ab18ff1	5252	Trnovo pri Gorici
00050000-55ee-b574-9613-0ae7ba514c7e	2254	Trnovska vas
00050000-55ee-b574-ead0-8a5cdef69dce	1222	Trojane
00050000-55ee-b574-f665-8dfb9ba344d4	1236	Trzin
00050000-55ee-b574-a78d-ff51f9c9923d	4290	Tržič
00050000-55ee-b574-ddc9-c807bbb9875a	8295	Tržišče
00050000-55ee-b574-5475-c27bc689757b	1311	Turjak
00050000-55ee-b574-a732-1bf6fd412092	9224	Turnišče
00050000-55ee-b574-3edc-a456cd7634c8	8323	Uršna sela
00050000-55ee-b574-b329-3802acab7528	1252	Vače
00050000-55ee-b574-1f7d-1c897d654b49	3320	Velenje 
00050000-55ee-b574-17cc-bd000f430531	3322	Velenje - poštni predali
00050000-55ee-b574-5301-27ea07b3b8c3	8212	Velika Loka
00050000-55ee-b574-21a9-43d119671877	2274	Velika Nedelja
00050000-55ee-b574-c074-14fc43aa8295	9225	Velika Polana
00050000-55ee-b574-cc6f-627af302f484	1315	Velike Lašče
00050000-55ee-b574-1cd2-e3c609ce9683	8213	Veliki Gaber
00050000-55ee-b574-555a-888c774848ff	9241	Veržej
00050000-55ee-b574-d4a8-da6f642332ed	1312	Videm - Dobrepolje
00050000-55ee-b574-a161-73c2dabf9c22	2284	Videm pri Ptuju
00050000-55ee-b574-5e70-db8a0dd0bf44	8344	Vinica
00050000-55ee-b574-7641-523674be6f10	5271	Vipava
00050000-55ee-b574-8977-860363f7db33	4212	Visoko
00050000-55ee-b574-ce64-149919ef845e	1294	Višnja Gora
00050000-55ee-b574-3227-95aab6e596f2	3205	Vitanje
00050000-55ee-b574-c608-4682a0bc68de	2255	Vitomarci
00050000-55ee-b574-3f57-85c26e39fc46	1217	Vodice
00050000-55ee-b574-f137-21ccfca0723c	3212	Vojnik\t
00050000-55ee-b574-7da6-49e93ea3e81b	5293	Volčja Draga
00050000-55ee-b574-7772-6b5c9df48a99	2232	Voličina
00050000-55ee-b574-8de2-dcf6fe56716a	3305	Vransko
00050000-55ee-b574-7bbc-e2bbcc136a31	6217	Vremski Britof
00050000-55ee-b574-2f4e-37aaf7c8dfbc	1360	Vrhnika
00050000-55ee-b574-26be-a0d15ac10c0c	2365	Vuhred
00050000-55ee-b574-4a73-20299ad3ceb5	2367	Vuzenica
00050000-55ee-b574-800e-16244706ab2f	8292	Zabukovje 
00050000-55ee-b574-cd35-0c1325c1ac17	1410	Zagorje ob Savi
00050000-55ee-b574-45a7-dca5c05a22bc	1303	Zagradec
00050000-55ee-b574-7245-8ae96575daf7	2283	Zavrč
00050000-55ee-b574-7981-b206b2adfb85	8272	Zdole 
00050000-55ee-b574-866a-20defdea9e57	4201	Zgornja Besnica
00050000-55ee-b574-dfe7-9f407c5e8d9f	2242	Zgornja Korena
00050000-55ee-b574-2b03-0ff611fa9c27	2201	Zgornja Kungota
00050000-55ee-b574-046d-b5ce1fba275c	2316	Zgornja Ložnica
00050000-55ee-b574-c377-f61535291a32	2314	Zgornja Polskava
00050000-55ee-b574-440e-475568ff0c36	2213	Zgornja Velka
00050000-55ee-b574-bb44-1a54f411fc32	4247	Zgornje Gorje
00050000-55ee-b574-f499-f8d1efd80612	4206	Zgornje Jezersko
00050000-55ee-b574-53b6-769906eb7e5e	2285	Zgornji Leskovec
00050000-55ee-b574-3a17-932e24e75e8f	1432	Zidani Most
00050000-55ee-b574-3637-f301270990da	3214	Zreče
00050000-55ee-b574-2da7-d337b19a9697	4209	Žabnica
00050000-55ee-b574-5894-0b4143cb5a3e	3310	Žalec
00050000-55ee-b574-df67-0240119c978b	4228	Železniki
00050000-55ee-b574-4518-e454df9abdf0	2287	Žetale
00050000-55ee-b574-1e25-aeb84228687c	4226	Žiri
00050000-55ee-b574-510c-484a10c4a7ff	4274	Žirovnica
00050000-55ee-b574-a254-4f2085160f2b	8360	Žužemberk
\.


--
-- TOC entry 2931 (class 0 OID 17981858)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 17981668)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55ee-b576-c097-40a8d2b38d0a	00080000-55ee-b576-b8b7-49b65a02fe13	\N	00040000-55ee-b574-47b7-15d3f7f1ee70	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55ee-b576-2186-0d787be0fe2a	00080000-55ee-b576-b8b7-49b65a02fe13	\N	00040000-55ee-b574-47b7-15d3f7f1ee70	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55ee-b576-ef27-81c2f88adb8d	00080000-55ee-b576-eb09-553b17e415c9	\N	00040000-55ee-b574-47b7-15d3f7f1ee70	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2920 (class 0 OID 17981746)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 17981870)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2957 (class 0 OID 17982225)
-- Dependencies: 228
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 17982235)
-- Dependencies: 229
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55ee-b576-da7e-4c51ef4815f9	00080000-55ee-b576-2c54-834366b69e5d	0987	AK
00190000-55ee-b576-cf53-aace1bd8ec9d	00080000-55ee-b576-eb09-553b17e415c9	0989	AK
00190000-55ee-b576-e10b-b9a0e2549fa0	00080000-55ee-b576-d61f-9b3df2b8df28	0986	AK
00190000-55ee-b576-0e99-8f0bb566c854	00080000-55ee-b576-6f29-2763c99985a1	0984	AK
00190000-55ee-b576-e76b-68a88c8db436	00080000-55ee-b576-75b4-430faf4dc649	0983	AK
00190000-55ee-b576-38e9-2f6e1871a1b5	00080000-55ee-b576-ebfc-d63937659a6e	0982	AK
00190000-55ee-b577-d636-389cd55b4aa4	00080000-55ee-b577-24d3-8892d46ecdd6	1001	AK
\.


--
-- TOC entry 2956 (class 0 OID 17982182)
-- Dependencies: 227
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55ee-b576-5927-c7fd175fb23a	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2959 (class 0 OID 17982243)
-- Dependencies: 230
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 17981899)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, seplanira, kapaciteta, opis) FROM stdin;
00220000-55ee-b576-babe-c3cf21c6af3e	\N	\N	0001	Poskusna 1	f	t	8	Poskusna učilnica v prvem
00220000-55ee-b576-c5a0-c234767d072e	\N	\N	0002	Poskusna 3	f	f	34	Poskusna učilnica v tretjem
00220000-55ee-b576-32d7-f86f2b19e40c	\N	\N	0003	Kazinska	t	t	84	Kazinska dvorana
00220000-55ee-b576-bfbb-0064512a667d	\N	\N	0004	Mali oder	t	t	24	Mali oder 
00220000-55ee-b576-63f1-102e8bddfc5a	\N	\N	0005	Komorni oder	t	t	15	Komorni oder
00220000-55ee-b576-245e-71c3be2d4e5d	\N	\N	0006	Stara dvorana	t	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55ee-b576-3b00-49c2c84e4394	\N	\N	0007	Velika dvorana	t	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2929 (class 0 OID 17981843)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 17981833)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 17982035)
-- Dependencies: 220
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 17981973)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 17981541)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55ee-b577-24d3-8892d46ecdd6	00010000-55ee-b575-7ea3-108a419fe954	2015-09-08 12:16:23	INS	a:0:{}
2	App\\Entity\\Option	00000000-55ee-b577-1308-1fdecfeb70a7	00010000-55ee-b575-7ea3-108a419fe954	2015-09-08 12:16:23	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55ee-b577-d636-389cd55b4aa4	00010000-55ee-b575-7ea3-108a419fe954	2015-09-08 12:16:23	INS	a:0:{}
\.


--
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2938 (class 0 OID 17981912)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 17981579)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55ee-b575-1427-7a1b05392430	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55ee-b575-7ab8-b1ff283357da	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55ee-b575-c63c-7a662cc33a41	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55ee-b575-bcef-d810ffd3e487	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55ee-b575-f051-b5282e06c2ae	planer	Planer dogodkov v koledarju	t
00020000-55ee-b575-76eb-c7fa4f350093	kadrovska	Kadrovska služba	t
00020000-55ee-b575-48cd-3a02e1e4d9d6	arhivar	Ažuriranje arhivalij	t
00020000-55ee-b575-4417-a0c295d0949f	igralec	Igralec	t
00020000-55ee-b575-bb2e-84e8817101f2	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55ee-b576-5ee9-bb6271427a78	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2905 (class 0 OID 17981563)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55ee-b575-0aa0-8278d0e51970	00020000-55ee-b575-c63c-7a662cc33a41
00010000-55ee-b575-7ea3-108a419fe954	00020000-55ee-b575-c63c-7a662cc33a41
00010000-55ee-b576-eebc-9b22027c7d2c	00020000-55ee-b576-5ee9-bb6271427a78
\.


--
-- TOC entry 2940 (class 0 OID 17981926)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 17981864)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 17981810)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 17981528)
-- Dependencies: 172
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55ee-b574-f2d3-437ddbb28431	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55ee-b574-59c3-44a6b79c2f10	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55ee-b574-74d7-c15ae3bbe202	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55ee-b574-b57d-273830bbc12f	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55ee-b574-bc3f-79b32e20ea44	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2900 (class 0 OID 17981520)
-- Dependencies: 171
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55ee-b574-4840-7ba139cf6410	00230000-55ee-b574-b57d-273830bbc12f	popa
00240000-55ee-b574-b460-6a0098ac7a1f	00230000-55ee-b574-b57d-273830bbc12f	oseba
00240000-55ee-b574-b630-9a188b180ffd	00230000-55ee-b574-b57d-273830bbc12f	sezona
00240000-55ee-b574-d532-a6ebde0b8515	00230000-55ee-b574-59c3-44a6b79c2f10	prostor
00240000-55ee-b574-7ac1-645750d2384b	00230000-55ee-b574-b57d-273830bbc12f	besedilo
00240000-55ee-b574-d915-1281913af086	00230000-55ee-b574-b57d-273830bbc12f	uprizoritev
00240000-55ee-b574-4dc4-2a56f12fc478	00230000-55ee-b574-b57d-273830bbc12f	funkcija
00240000-55ee-b574-9b70-0044b376c2f7	00230000-55ee-b574-b57d-273830bbc12f	tipfunkcije
00240000-55ee-b574-39d8-28aad6272e5c	00230000-55ee-b574-b57d-273830bbc12f	alternacija
00240000-55ee-b574-4604-a7a8e49ff15f	00230000-55ee-b574-f2d3-437ddbb28431	pogodba
00240000-55ee-b574-f07b-349b60cf973d	00230000-55ee-b574-b57d-273830bbc12f	zaposlitev
00240000-55ee-b574-e512-4be7a77db466	00230000-55ee-b574-b57d-273830bbc12f	zvrstuprizoritve
00240000-55ee-b574-a928-a3265784c1ad	00230000-55ee-b574-f2d3-437ddbb28431	programdela
00240000-55ee-b574-28c7-a91577adfd0a	00230000-55ee-b574-b57d-273830bbc12f	zapis
\.


--
-- TOC entry 2899 (class 0 OID 17981515)
-- Dependencies: 170
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
da967e8e-62b4-440e-90a4-1c88b8eafdfe	00240000-55ee-b574-4840-7ba139cf6410	0	1001
\.


--
-- TOC entry 2945 (class 0 OID 17981983)
-- Dependencies: 216
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55ee-b576-afaa-3659f018058e	000e0000-55ee-b576-0f31-fa04b0afbfa2	00080000-55ee-b576-b8b7-49b65a02fe13	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55ee-b574-e0dc-8fb6810f81b7
00270000-55ee-b576-dde6-6f502d4053dd	000e0000-55ee-b576-0f31-fa04b0afbfa2	00080000-55ee-b576-b8b7-49b65a02fe13	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55ee-b574-e0dc-8fb6810f81b7
00270000-55ee-b576-7f24-4dec8f57041b	000e0000-55ee-b576-0f31-fa04b0afbfa2	00080000-55ee-b576-2dbb-f3e7250c45be	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 2912 (class 0 OID 17981641)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 17981820)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55ee-b576-cd79-134ac9bcc4bd	00180000-55ee-b576-5bde-75b87593354c	000c0000-55ee-b576-ec23-f7278cb786f4	00090000-55ee-b576-7b13-71e6999c9c1d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ee-b576-f530-25782c7e5e0c	00180000-55ee-b576-5bde-75b87593354c	000c0000-55ee-b576-7ab5-43927fc8a27e	00090000-55ee-b576-5096-d0d9e4a8a7f2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ee-b576-81f6-483b5e6d4fbe	00180000-55ee-b576-5bde-75b87593354c	000c0000-55ee-b576-7e9a-dc8f8288a740	00090000-55ee-b576-f48e-ee73d09cfe4d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ee-b576-ce37-832e183398aa	00180000-55ee-b576-5bde-75b87593354c	000c0000-55ee-b576-31ef-3ead5b738725	00090000-55ee-b576-985b-ad84926a7254	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ee-b576-5805-23865754db71	00180000-55ee-b576-5bde-75b87593354c	000c0000-55ee-b576-a9aa-5f3d1814e9bc	00090000-55ee-b576-1391-a8306a5ce6d0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ee-b576-f78c-4642ef6f5d1c	00180000-55ee-b576-1958-49bff908b066	\N	00090000-55ee-b576-1391-a8306a5ce6d0	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2948 (class 0 OID 17982023)
-- Dependencies: 219
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55ee-b574-0335-e7ca8151538f	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55ee-b574-aa87-9894f15728a3	02	Priredba	Priredba	Priredba	umetnik
000f0000-55ee-b574-4bc5-99a8c611286a	03	Prevod	Prevod	Prevod	umetnik
000f0000-55ee-b574-ae9e-53d2f13818d8	04	Režija	Režija	Režija	umetnik
000f0000-55ee-b574-037f-35ee5a790ac8	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55ee-b574-660b-8e32e202bd07	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55ee-b574-4726-40f2669b73f9	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55ee-b574-04c4-f6da8be8d2c2	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55ee-b574-329d-a0052d42352f	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55ee-b574-2f5c-b9893f6e21a9	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55ee-b574-1c59-88c7964f8a4a	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55ee-b574-efbb-a60251ef936c	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55ee-b574-3ee8-7c7fc4d27a8d	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55ee-b574-e789-85f860309fb1	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55ee-b574-5626-273fc9bd3bd2	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55ee-b574-6304-a4602eeefa5c	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55ee-b574-b599-0f8be6b7ff44	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55ee-b574-f89f-398933d36c3f	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2960 (class 0 OID 17982253)
-- Dependencies: 231
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55ee-b574-4f7b-47fbc93e5870	01	Velika predstava	f	1.00	1.00
002b0000-55ee-b574-0c4c-750de5c4bf35	02	Mala predstava	f	0.50	0.50
002b0000-55ee-b574-20ce-9fdf4d367358	03	Mala koprodukcija	t	0.40	1.00
002b0000-55ee-b574-1ac5-db7fdcc76187	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55ee-b574-42c8-0b605845be73	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2917 (class 0 OID 17981703)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 17981550)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55ee-b575-7ea3-108a419fe954	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROtONYdYd8x5nIxcFJMDriMOUP3nRWmH2	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55ee-b576-a35c-581e658ef5bb	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55ee-b576-6624-305b706875fc	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55ee-b576-27ff-fd83954ae89e	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55ee-b576-774f-92aabc1b8a6f	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55ee-b576-4851-65e2f7dc200c	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55ee-b576-0280-d502f941a659	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55ee-b576-6eec-438651487621	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55ee-b576-5d8f-76f3d2103b3d	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55ee-b576-0659-093fd6b0c5c3	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55ee-b576-eebc-9b22027c7d2c	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55ee-b575-0aa0-8278d0e51970	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2952 (class 0 OID 17982072)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55ee-b576-4ae4-b933791c35e6	00160000-55ee-b576-40d7-f2758eeb27d2	\N	00140000-55ee-b574-f0df-402d23343dbe	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55ee-b576-63f1-102e8bddfc5a
000e0000-55ee-b576-0f31-fa04b0afbfa2	00160000-55ee-b576-5ede-ed8efe9410cd	\N	00140000-55ee-b574-035f-1b40adfaf723	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55ee-b576-245e-71c3be2d4e5d
000e0000-55ee-b576-0c56-998dfc062656	\N	\N	00140000-55ee-b574-035f-1b40adfaf723	00190000-55ee-b576-da7e-4c51ef4815f9	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55ee-b576-63f1-102e8bddfc5a
000e0000-55ee-b576-d644-22041fd24020	\N	\N	00140000-55ee-b574-035f-1b40adfaf723	00190000-55ee-b576-da7e-4c51ef4815f9	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55ee-b576-63f1-102e8bddfc5a
000e0000-55ee-b576-d8b3-ce394f9e4f24	\N	\N	00140000-55ee-b574-035f-1b40adfaf723	00190000-55ee-b576-da7e-4c51ef4815f9	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55ee-b576-babe-c3cf21c6af3e
000e0000-55ee-b576-30d1-094823ad9034	\N	\N	00140000-55ee-b574-035f-1b40adfaf723	00190000-55ee-b576-da7e-4c51ef4815f9	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55ee-b576-babe-c3cf21c6af3e
\.


--
-- TOC entry 2922 (class 0 OID 17981764)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55ee-b576-ed2d-f10f23ed43f9	000e0000-55ee-b576-0f31-fa04b0afbfa2	\N	1	
00200000-55ee-b576-2dd6-761024bfe98b	000e0000-55ee-b576-0f31-fa04b0afbfa2	\N	2	
\.


--
-- TOC entry 2936 (class 0 OID 17981891)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 17981997)
-- Dependencies: 217
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55ee-b574-6d27-28fcbcb75b12	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55ee-b574-bb69-04918d4b3061	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55ee-b574-521f-4575dd981918	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55ee-b574-ef38-fba272650c40	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55ee-b574-9881-9d7f73825388	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55ee-b574-dfcf-b570387fba5a	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55ee-b574-ee49-a45e8cb3116f	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55ee-b574-1613-684eec323d78	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55ee-b574-e0dc-8fb6810f81b7	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55ee-b574-3876-7ada755c0b10	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55ee-b574-36f8-60f0896da199	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55ee-b574-1bb4-a0d3b3335d7b	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55ee-b574-8d6a-d910117928c5	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55ee-b574-74c5-dfd7de70ddf8	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55ee-b574-1adc-6083c71674c0	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55ee-b574-5891-5cdfa96ce4ed	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55ee-b574-c2da-7a43d533fd4f	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55ee-b574-968a-497eaead981c	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55ee-b574-2312-146c4269fe06	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55ee-b574-3445-4ed46acfc203	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55ee-b574-1d6b-f9e91ef51753	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55ee-b574-3839-b142402d51db	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55ee-b574-7a31-dbc999b0fa79	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55ee-b574-52c8-f10f72309b22	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55ee-b574-dbbb-c6a630606f50	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55ee-b574-6cc0-17e82be69a90	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55ee-b574-5a90-37b68004919b	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55ee-b574-6a02-960db50a6b8f	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2963 (class 0 OID 17982299)
-- Dependencies: 234
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 17982271)
-- Dependencies: 233
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 17982311)
-- Dependencies: 235
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 17981963)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55ee-b576-66aa-ffe8304b0287	00090000-55ee-b576-5096-d0d9e4a8a7f2	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ee-b576-b022-f5d8fa4d6516	00090000-55ee-b576-f48e-ee73d09cfe4d	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ee-b576-525c-f7f6204ba3c7	00090000-55ee-b576-447d-831e4227f150	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ee-b576-9a67-edee83c62870	00090000-55ee-b576-8554-52b957c2296b	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ee-b576-b8ce-0af4ec106493	00090000-55ee-b576-7b13-71e6999c9c1d	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ee-b576-af11-43cb2191034e	00090000-55ee-b576-03f5-44f8414e608d	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2924 (class 0 OID 17981800)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 17982062)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55ee-b574-f0df-402d23343dbe	01	Drama	drama (SURS 01)
00140000-55ee-b574-b2ed-ede527604614	02	Opera	opera (SURS 02)
00140000-55ee-b574-b5ab-a4f5a57d5107	03	Balet	balet (SURS 03)
00140000-55ee-b574-0f5e-23a72d146498	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55ee-b574-9458-d3b5bde20aca	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55ee-b574-035f-1b40adfaf723	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55ee-b574-e74a-f0dc044d0afa	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2942 (class 0 OID 17981953)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2457 (class 2606 OID 17981604)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 17982121)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 17982111)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 17982022)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 17982351)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 17981789)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 17981809)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 17982269)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 17981729)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 17982176)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 17981949)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 17981762)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 17981743)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 17981856)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 17982328)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 17982335)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2692 (class 2606 OID 17982359)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 17981883)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 17981701)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 17981613)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 17981637)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 17981593)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2448 (class 2606 OID 17981578)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 17981889)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 17981925)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 17982057)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 17981665)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 17981689)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 17981862)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 17981679)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 17981750)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 17981874)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 17982232)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 17982240)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 17982224)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 17982251)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 17981907)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 17981847)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 17981838)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 17982045)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 17981980)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 17981549)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 17981916)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 17981567)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2450 (class 2606 OID 17981587)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 17981934)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 17981869)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 17981818)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 17981537)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 17981525)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 17981519)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 17981993)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 17981646)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 17981829)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 17982032)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 17982263)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 17981714)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 17981562)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 17982090)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 17981772)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 17981897)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 17982005)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 17982309)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 17982293)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 17982317)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 17981971)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 17981804)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 17982070)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 17981961)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 1259 OID 17981798)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2513 (class 1259 OID 17981799)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2514 (class 1259 OID 17981797)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2515 (class 1259 OID 17981796)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2597 (class 1259 OID 17981994)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2598 (class 1259 OID 17981995)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2599 (class 1259 OID 17981996)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2678 (class 1259 OID 17982330)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2679 (class 1259 OID 17982329)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2471 (class 1259 OID 17981667)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2560 (class 1259 OID 17981890)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2665 (class 1259 OID 17982297)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2666 (class 1259 OID 17982296)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2667 (class 1259 OID 17982298)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2668 (class 1259 OID 17982295)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2669 (class 1259 OID 17982294)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2554 (class 1259 OID 17981876)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2555 (class 1259 OID 17981875)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2507 (class 1259 OID 17981773)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2584 (class 1259 OID 17981950)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2585 (class 1259 OID 17981952)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2586 (class 1259 OID 17981951)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2496 (class 1259 OID 17981745)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2497 (class 1259 OID 17981744)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2657 (class 1259 OID 17982252)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2612 (class 1259 OID 17982059)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2613 (class 1259 OID 17982060)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2614 (class 1259 OID 17982061)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2675 (class 1259 OID 17982318)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2621 (class 1259 OID 17982095)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2622 (class 1259 OID 17982092)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2623 (class 1259 OID 17982096)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2624 (class 1259 OID 17982094)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2625 (class 1259 OID 17982093)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2486 (class 1259 OID 17981716)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2487 (class 1259 OID 17981715)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2462 (class 1259 OID 17981640)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2572 (class 1259 OID 17981917)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2452 (class 1259 OID 17981594)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2453 (class 1259 OID 17981595)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2577 (class 1259 OID 17981937)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2578 (class 1259 OID 17981936)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2579 (class 1259 OID 17981935)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2500 (class 1259 OID 17981751)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2501 (class 1259 OID 17981752)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2432 (class 1259 OID 17981527)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2534 (class 1259 OID 17981842)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2535 (class 1259 OID 17981840)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2536 (class 1259 OID 17981839)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2537 (class 1259 OID 17981841)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2443 (class 1259 OID 17981568)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2444 (class 1259 OID 17981569)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2563 (class 1259 OID 17981898)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2688 (class 1259 OID 17982352)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2689 (class 1259 OID 17982360)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2690 (class 1259 OID 17982361)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2549 (class 1259 OID 17981863)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2593 (class 1259 OID 17981981)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2594 (class 1259 OID 17981982)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2642 (class 1259 OID 17982181)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2643 (class 1259 OID 17982180)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2644 (class 1259 OID 17982177)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2645 (class 1259 OID 17982178)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2646 (class 1259 OID 17982179)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2475 (class 1259 OID 17981681)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2476 (class 1259 OID 17981680)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2477 (class 1259 OID 17981682)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2566 (class 1259 OID 17981911)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2567 (class 1259 OID 17981910)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2649 (class 1259 OID 17982233)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2650 (class 1259 OID 17982234)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2635 (class 1259 OID 17982125)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2636 (class 1259 OID 17982126)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2637 (class 1259 OID 17982123)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2638 (class 1259 OID 17982124)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2590 (class 1259 OID 17981972)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2540 (class 1259 OID 17981851)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2541 (class 1259 OID 17981850)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2542 (class 1259 OID 17981848)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2543 (class 1259 OID 17981849)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2631 (class 1259 OID 17982113)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2632 (class 1259 OID 17982112)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2506 (class 1259 OID 17981763)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2664 (class 1259 OID 17982270)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2682 (class 1259 OID 17982336)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2683 (class 1259 OID 17982337)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2458 (class 1259 OID 17981615)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2459 (class 1259 OID 17981614)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2467 (class 1259 OID 17981647)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2468 (class 1259 OID 17981648)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2529 (class 1259 OID 17981832)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2530 (class 1259 OID 17981831)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2531 (class 1259 OID 17981830)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2516 (class 1259 OID 17981791)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2517 (class 1259 OID 17981792)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2518 (class 1259 OID 17981790)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2519 (class 1259 OID 17981794)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2520 (class 1259 OID 17981795)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2521 (class 1259 OID 17981793)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2474 (class 1259 OID 17981666)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2492 (class 1259 OID 17981730)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2493 (class 1259 OID 17981732)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2494 (class 1259 OID 17981731)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2495 (class 1259 OID 17981733)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2548 (class 1259 OID 17981857)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2617 (class 1259 OID 17982058)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 17982091)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2608 (class 1259 OID 17982033)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2609 (class 1259 OID 17982034)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2465 (class 1259 OID 17981638)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2466 (class 1259 OID 17981639)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2587 (class 1259 OID 17981962)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2438 (class 1259 OID 17981538)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2485 (class 1259 OID 17981702)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2435 (class 1259 OID 17981526)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2570 (class 1259 OID 17981909)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2571 (class 1259 OID 17981908)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2639 (class 1259 OID 17982122)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 17981690)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2618 (class 1259 OID 17982071)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2672 (class 1259 OID 17982310)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2655 (class 1259 OID 17982241)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2656 (class 1259 OID 17982242)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2528 (class 1259 OID 17981819)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2451 (class 1259 OID 17981588)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2717 (class 2606 OID 17982482)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2718 (class 2606 OID 17982487)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2722 (class 2606 OID 17982507)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2716 (class 2606 OID 17982477)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2720 (class 2606 OID 17982497)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2721 (class 2606 OID 17982502)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2719 (class 2606 OID 17982492)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2752 (class 2606 OID 17982657)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2753 (class 2606 OID 17982662)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2754 (class 2606 OID 17982667)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2786 (class 2606 OID 17982827)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2785 (class 2606 OID 17982822)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2704 (class 2606 OID 17982417)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2738 (class 2606 OID 17982587)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2782 (class 2606 OID 17982807)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2781 (class 2606 OID 17982802)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2783 (class 2606 OID 17982812)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2780 (class 2606 OID 17982797)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2779 (class 2606 OID 17982792)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2737 (class 2606 OID 17982582)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2736 (class 2606 OID 17982577)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2715 (class 2606 OID 17982472)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2746 (class 2606 OID 17982627)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2748 (class 2606 OID 17982637)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2747 (class 2606 OID 17982632)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2711 (class 2606 OID 17982452)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2710 (class 2606 OID 17982447)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2734 (class 2606 OID 17982567)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2777 (class 2606 OID 17982782)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2755 (class 2606 OID 17982672)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2756 (class 2606 OID 17982677)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2757 (class 2606 OID 17982682)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2784 (class 2606 OID 17982817)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2761 (class 2606 OID 17982702)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2758 (class 2606 OID 17982687)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2762 (class 2606 OID 17982707)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2760 (class 2606 OID 17982697)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2759 (class 2606 OID 17982692)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2709 (class 2606 OID 17982442)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2708 (class 2606 OID 17982437)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2701 (class 2606 OID 17982402)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2700 (class 2606 OID 17982397)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2742 (class 2606 OID 17982607)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2696 (class 2606 OID 17982377)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 17982382)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2745 (class 2606 OID 17982622)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2744 (class 2606 OID 17982617)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2743 (class 2606 OID 17982612)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2712 (class 2606 OID 17982457)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2713 (class 2606 OID 17982462)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2693 (class 2606 OID 17982362)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2729 (class 2606 OID 17982542)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2727 (class 2606 OID 17982532)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2726 (class 2606 OID 17982527)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2728 (class 2606 OID 17982537)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2694 (class 2606 OID 17982367)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2695 (class 2606 OID 17982372)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2739 (class 2606 OID 17982592)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2789 (class 2606 OID 17982842)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2790 (class 2606 OID 17982847)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2791 (class 2606 OID 17982852)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2735 (class 2606 OID 17982572)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2750 (class 2606 OID 17982647)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2751 (class 2606 OID 17982652)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2773 (class 2606 OID 17982762)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2772 (class 2606 OID 17982757)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2769 (class 2606 OID 17982742)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2770 (class 2606 OID 17982747)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2771 (class 2606 OID 17982752)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2706 (class 2606 OID 17982427)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2705 (class 2606 OID 17982422)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2707 (class 2606 OID 17982432)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2741 (class 2606 OID 17982602)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2740 (class 2606 OID 17982597)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2774 (class 2606 OID 17982767)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2775 (class 2606 OID 17982772)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2767 (class 2606 OID 17982732)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2768 (class 2606 OID 17982737)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2765 (class 2606 OID 17982722)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2766 (class 2606 OID 17982727)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2749 (class 2606 OID 17982642)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2733 (class 2606 OID 17982562)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2732 (class 2606 OID 17982557)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2730 (class 2606 OID 17982547)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2731 (class 2606 OID 17982552)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2764 (class 2606 OID 17982717)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2763 (class 2606 OID 17982712)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2714 (class 2606 OID 17982467)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2776 (class 2606 OID 17982777)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2778 (class 2606 OID 17982787)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2787 (class 2606 OID 17982832)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2788 (class 2606 OID 17982837)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2699 (class 2606 OID 17982392)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2698 (class 2606 OID 17982387)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2702 (class 2606 OID 17982407)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2703 (class 2606 OID 17982412)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2725 (class 2606 OID 17982522)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2724 (class 2606 OID 17982517)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2723 (class 2606 OID 17982512)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-08 12:16:24 CEST

--
-- PostgreSQL database dump complete
--

