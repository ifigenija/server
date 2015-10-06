--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-06 11:40:49 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 245 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 245
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 21342366)
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
-- TOC entry 229 (class 1259 OID 21342923)
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
-- TOC entry 228 (class 1259 OID 21342906)
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
-- TOC entry 219 (class 1259 OID 21342783)
-- Name: avtorbesedila; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE avtorbesedila (
    id uuid NOT NULL,
    besedilo_id uuid,
    oseba_id uuid,
    tipavtorja character varying(255) NOT NULL,
    zaporedna integer,
    alivnaslovu boolean
);


--
-- TOC entry 222 (class 1259 OID 21342813)
-- Name: besedilo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE besedilo (
    id uuid NOT NULL,
    stevilka character varying(255) NOT NULL,
    naslov character varying(255) DEFAULT NULL::character varying,
    podnaslov character varying(255) DEFAULT NULL::character varying,
    jezik character varying(255) DEFAULT NULL::character varying,
    naslovizvirnika character varying(255) DEFAULT NULL::character varying,
    podnaslovizvirnika character varying(255) DEFAULT NULL::character varying,
    internacionalninaslov character varying(255) DEFAULT NULL::character varying,
    datumprejema date,
    moskevloge integer,
    zenskevloge integer,
    povzetekvsebine text,
    letoizida integer,
    krajizida character varying(255) DEFAULT NULL::character varying,
    zaloznik character varying(255) DEFAULT NULL::character varying,
    avtor character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 21343168)
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
-- TOC entry 197 (class 1259 OID 21342574)
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
    allday boolean DEFAULT false,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status character varying(4) DEFAULT NULL::character varying,
    razred character varying(4) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 199 (class 1259 OID 21342605)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 21343094)
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
-- TOC entry 190 (class 1259 OID 21342487)
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
-- TOC entry 230 (class 1259 OID 21342936)
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
    sthonorarnihzun integer,
    sthonorarnihzunigr integer,
    sthonorarnihzunigrtujjz integer,
    sthonorarnihzunsamoz integer,
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
    prikoproducentu boolean,
    prizorisce character varying(255) DEFAULT NULL::character varying,
    trajanje character varying(255) DEFAULT NULL::character varying,
    zvrst character varying(255) DEFAULT NULL::character varying,
    avtor character varying(255) DEFAULT NULL::character varying,
    reziser character varying(255) DEFAULT NULL::character varying,
    datum date,
    soustvarjalci character varying(255) DEFAULT NULL::character varying,
    strosekodkpred numeric(15,2) DEFAULT 0::numeric,
    stroskiostali numeric(15,2) DEFAULT 0::numeric,
    krajgostovanja character varying(255) DEFAULT NULL::character varying,
    ustanova character varying(255) DEFAULT NULL::character varying,
    datumgostovanja date,
    transportnistroski numeric(15,2) DEFAULT NULL::numeric,
    dnevprvzad numeric(15,2) DEFAULT NULL::numeric,
    drzavagostovanja_id uuid,
    stpe integer DEFAULT 0,
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
-- TOC entry 215 (class 1259 OID 21342738)
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
-- TOC entry 195 (class 1259 OID 21342553)
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
-- TOC entry 193 (class 1259 OID 21342527)
-- Name: job; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE job (
    id uuid NOT NULL,
    user_id uuid,
    name character varying(50) NOT NULL,
    task character varying(50) NOT NULL,
    status integer NOT NULL,
    log text,
    datum timestamp(0) without time zone NOT NULL,
    casizvedbe timestamp(0) without time zone NOT NULL,
    izveden timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    data text,
    alert boolean,
    hidden boolean,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 191 (class 1259 OID 21342504)
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
-- TOC entry 204 (class 1259 OID 21342652)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 21343149)
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
-- TOC entry 242 (class 1259 OID 21343161)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 21343183)
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
-- TOC entry 170 (class 1259 OID 21093458)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 21342677)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 21342461)
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
-- TOC entry 182 (class 1259 OID 21342375)
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
-- TOC entry 183 (class 1259 OID 21342386)
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
-- TOC entry 178 (class 1259 OID 21342340)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 21342359)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 21342684)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 21342718)
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
-- TOC entry 225 (class 1259 OID 21342854)
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
    jeavtorskepravice boolean,
    placilonavajo boolean,
    vrednostvaje numeric(12,2) DEFAULT NULL::numeric,
    planiranostevilovaj integer,
    vrednostvaj numeric(12,2) DEFAULT NULL::numeric,
    vrednostpredstave numeric(12,2) DEFAULT NULL::numeric,
    procentodinkasa numeric(12,2) DEFAULT NULL::numeric,
    jeprocentodinkasa boolean,
    vrednostdopremiere numeric(12,2) DEFAULT NULL::numeric,
    zaposlenvdrjz boolean,
    samozaposlen boolean,
    igralec boolean,
    opis text
);


--
-- TOC entry 185 (class 1259 OID 21342419)
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
-- TOC entry 187 (class 1259 OID 21342453)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 21343039)
-- Name: postavkacdve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkacdve (
    id uuid NOT NULL,
    skupina character varying(2) NOT NULL,
    podskupina integer,
    naziv character varying(255) DEFAULT NULL::character varying,
    vrpremiere numeric(15,2) DEFAULT NULL::numeric,
    vrponovitvepremier numeric(15,2) DEFAULT NULL::numeric,
    vrponovitveprejsnjih numeric(15,2) DEFAULT NULL::numeric,
    vrgostovanjazamejstvo numeric(15,2) DEFAULT NULL::numeric,
    vrfestivali numeric(15,2) DEFAULT NULL::numeric,
    vrgostovanjaint numeric(15,2) DEFAULT NULL::numeric,
    vrostalo numeric(15,2) DEFAULT NULL::numeric,
    programdela_id uuid
);


--
-- TOC entry 205 (class 1259 OID 21342658)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 21342438)
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
-- TOC entry 194 (class 1259 OID 21342542)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    zaporedna integer,
    objavljenzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 21342670)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 21343053)
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
-- TOC entry 234 (class 1259 OID 21343063)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 21342996)
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
    stpremiervelikih integer,
    stpremiermalih integer,
    stpremiermalihkopr integer,
    stpremiervelikihkopr integer,
    stpremiersredkopr integer,
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
    stizvpremdoma integer,
    stizvpremkopr integer,
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
    stobiskpremdoma integer,
    stobiskpremkopr integer,
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
    sthonorarnihzun integer,
    sthonorarnihzunigr integer,
    sthonorarnihzunigrtujjz integer,
    sthonorarnihzunsamoz integer,
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
-- TOC entry 235 (class 1259 OID 21343071)
-- Name: programskaenotasklopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programskaenotasklopa (
    id uuid NOT NULL,
    naslovpe character varying(255) NOT NULL,
    avtorpe character varying(255) NOT NULL,
    obsegpe character varying(255) NOT NULL,
    mesecpe character varying(255) NOT NULL,
    vrednostpe numeric(15,2) DEFAULT 0::numeric NOT NULL,
    obiskdoma integer DEFAULT 0 NOT NULL,
    programrazno_id uuid
);


--
-- TOC entry 211 (class 1259 OID 21342699)
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
-- TOC entry 203 (class 1259 OID 21342643)
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
-- TOC entry 202 (class 1259 OID 21342633)
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
-- TOC entry 224 (class 1259 OID 21342843)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 21342773)
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
-- TOC entry 192 (class 1259 OID 21342516)
-- Name: report; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE report (
    id uuid NOT NULL,
    job_id uuid,
    title character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    transfers integer NOT NULL,
    size integer,
    format character varying(255) DEFAULT NULL::character varying,
    hash uuid,
    createdat timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 175 (class 1259 OID 21342311)
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
-- TOC entry 174 (class 1259 OID 21342309)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 212 (class 1259 OID 21342712)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 21342349)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 21342333)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 21342726)
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
-- TOC entry 206 (class 1259 OID 21342664)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 21342610)
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
-- TOC entry 173 (class 1259 OID 21342298)
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
-- TOC entry 172 (class 1259 OID 21342290)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 21342285)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 21342790)
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
-- TOC entry 184 (class 1259 OID 21342411)
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
-- TOC entry 201 (class 1259 OID 21342620)
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
-- TOC entry 223 (class 1259 OID 21342831)
-- Name: tipfunkcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipfunkcije (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text,
    imezenski character varying(255) DEFAULT NULL::character varying,
    podrocje character varying(255) DEFAULT NULL::character varying,
    sort integer
);


--
-- TOC entry 236 (class 1259 OID 21343082)
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
-- TOC entry 189 (class 1259 OID 21342473)
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
-- TOC entry 176 (class 1259 OID 21342320)
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
-- TOC entry 227 (class 1259 OID 21342881)
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
    jekoprodukcija boolean,
    maticnioder_id uuid
);


--
-- TOC entry 196 (class 1259 OID 21342564)
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
-- TOC entry 210 (class 1259 OID 21342691)
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
-- TOC entry 221 (class 1259 OID 21342804)
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
-- TOC entry 239 (class 1259 OID 21343129)
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
-- TOC entry 238 (class 1259 OID 21343101)
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
-- TOC entry 240 (class 1259 OID 21343141)
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
-- TOC entry 217 (class 1259 OID 21342763)
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
-- TOC entry 198 (class 1259 OID 21342599)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 21342871)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 21342753)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 21342314)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2980 (class 0 OID 21342366)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 21342923)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5613-971e-be9d-55d7ad33fa5a	000d0000-5613-971e-572e-1106b4d32e2c	\N	00090000-5613-971e-a8fb-52abdefb356c	000b0000-5613-971e-7f2e-d12d223e211e	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5613-971e-ba5a-674b1788234a	000d0000-5613-971e-0505-44027ed98868	00100000-5613-971e-6429-f34770092209	00090000-5613-971e-30cc-8337f37e2cdf	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5613-971e-3f4b-3452834df03f	000d0000-5613-971e-dfe5-c8ce7fa341e4	00100000-5613-971e-620a-83153834a2c3	00090000-5613-971e-0537-93814b82763a	\N	0003	t	\N	2015-10-06	\N	2	t	\N	f	f
000c0000-5613-971e-7763-e2b4470a38ce	000d0000-5613-971e-1041-50213fd67a9c	\N	00090000-5613-971e-e6f3-0dcf37a56d6b	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5613-971e-68cf-118794af8fe7	000d0000-5613-971e-15f6-2176d27c4e92	\N	00090000-5613-971e-c1f4-bd98b3dd170d	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5613-971e-13e1-22316eed8eb9	000d0000-5613-971e-cd9e-35aefd9ac080	\N	00090000-5613-971e-3c13-d84b63048246	000b0000-5613-971e-b7df-edcb9b46d319	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5613-971e-51c1-e7b8b5055261	000d0000-5613-971e-908f-4ceea2b90af0	00100000-5613-971e-a1c9-88578cde95e8	00090000-5613-971e-a90b-c2d833cf483d	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5613-971e-6ee3-4b6f0b6aa7fd	000d0000-5613-971e-7767-40f858ccc635	\N	00090000-5613-971e-7236-fb65b1a59a32	000b0000-5613-971e-ade1-cbe4e397e5ce	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5613-971e-0ae3-2ff1b913233b	000d0000-5613-971e-908f-4ceea2b90af0	00100000-5613-971e-1d13-a63384793387	00090000-5613-971e-d83e-83aa6ce0bec5	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5613-971e-f07c-ea0bff78e429	000d0000-5613-971e-908f-4ceea2b90af0	00100000-5613-971e-bc0d-fd7dd4a63143	00090000-5613-971e-daaf-93d1a7813176	\N	0010	t	\N	2015-10-06	\N	16	f	\N	f	t
000c0000-5613-971e-416e-9e6c46892b26	000d0000-5613-971e-908f-4ceea2b90af0	00100000-5613-971e-f5cb-9874ef4790bd	00090000-5613-971e-297a-5728cebcac77	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5613-971e-ae0f-0d4bc0272027	000d0000-5613-971e-1d16-ddd86988040d	\N	00090000-5613-971e-30cc-8337f37e2cdf	000b0000-5613-971e-5aca-5ac21c20147f	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3027 (class 0 OID 21342906)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 21342783)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5613-971e-986d-b722849f7e33	00160000-5613-971e-988f-4cf858e31348	00090000-5613-971e-f037-19a7caedb1a6	aizv	10	t
003d0000-5613-971e-5935-551f4863999d	00160000-5613-971e-988f-4cf858e31348	00090000-5613-971e-50e5-2736b9c9d73f	apri	14	t
003d0000-5613-971e-2ba3-4f8ecace36d5	00160000-5613-971e-f248-ddba2959cd40	00090000-5613-971e-a493-5b0f4a4cfcd6	aizv	11	t
003d0000-5613-971e-d115-4dfe16d127be	00160000-5613-971e-4a17-0a3d2a487677	00090000-5613-971e-f64d-30239f66af05	aizv	12	t
003d0000-5613-971e-51bc-07fc4290e8bd	00160000-5613-971e-988f-4cf858e31348	00090000-5613-971e-f933-ca9ae87e728c	apri	18	f
\.


--
-- TOC entry 3021 (class 0 OID 21342813)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5613-971e-988f-4cf858e31348	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5613-971e-f248-ddba2959cd40	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5613-971e-4a17-0a3d2a487677	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3042 (class 0 OID 21343168)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 21342574)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5613-971e-3975-a3c95854392d	\N	\N	00200000-5613-971e-12fb-b4317f683d86	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5613-971e-e0d7-572c37346c4e	\N	\N	00200000-5613-971e-f098-4291a7d76578	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5613-971e-5646-e270022f3b4d	\N	\N	00200000-5613-971e-901c-2b3ff02697a0	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5613-971e-6aa4-9ed9b0a39232	\N	\N	00200000-5613-971e-5d42-638f5a5ac753	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5613-971e-d107-1b9e2523381c	\N	\N	00200000-5613-971e-6dbc-5f3641202653	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2998 (class 0 OID 21342605)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 21343094)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 21342487)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5613-971c-70c8-1ae7936c91fc	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5613-971c-fc9f-212c743b5fca	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5613-971c-edce-d5fdf6d14807	AL	ALB	008	Albania 	Albanija	\N
00040000-5613-971c-ecb9-7a0405473f3a	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5613-971c-cb43-2f8ee27e847c	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5613-971c-d410-f4ab5ad2a306	AD	AND	020	Andorra 	Andora	\N
00040000-5613-971c-fb87-5103ffc29047	AO	AGO	024	Angola 	Angola	\N
00040000-5613-971c-7f45-30ecad86ab6a	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5613-971c-0b93-a3e3307ed080	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5613-971c-46f0-2c211d86d0d7	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5613-971c-9c9b-262e2f56f156	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5613-971c-035c-30fbea9a0420	AM	ARM	051	Armenia 	Armenija	\N
00040000-5613-971c-338f-fc750f72ca2e	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5613-971c-437c-7156d489e2da	AU	AUS	036	Australia 	Avstralija	\N
00040000-5613-971c-db91-657fb229356b	AT	AUT	040	Austria 	Avstrija	\N
00040000-5613-971c-b3cc-98cb307db907	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5613-971c-c635-beb72815d999	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5613-971c-8d7b-79c610f1b91e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5613-971c-8be5-ebce522a9c35	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5613-971c-ed99-12fa359c6a67	BB	BRB	052	Barbados 	Barbados	\N
00040000-5613-971c-4431-8c22770554e0	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5613-971c-ece4-4a878f7375ea	BE	BEL	056	Belgium 	Belgija	\N
00040000-5613-971c-1014-4d8bf82a32c2	BZ	BLZ	084	Belize 	Belize	\N
00040000-5613-971c-036c-413c302bd2b3	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5613-971c-7338-0e8cf616e0da	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5613-971c-09f7-05d7f75584a5	BT	BTN	064	Bhutan 	Butan	\N
00040000-5613-971c-1951-81b7912059d6	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5613-971c-57d4-f769056ee912	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5613-971c-76d4-e43dfb2114dd	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5613-971c-0d5a-2ddd3585a923	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5613-971c-824a-ffb12d8e44cd	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5613-971c-9e53-394a8529eeb3	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5613-971c-f37c-77bf1f73b5b1	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5613-971c-98f8-89afdcd0a25a	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5613-971c-2361-8e17b0f03a55	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5613-971c-6c2a-5fbeaf7905ec	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5613-971c-b9bf-afe26f3e6746	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5613-971c-6902-5acd21b0b9de	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5613-971c-8c51-332446171f21	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5613-971c-4376-f7795b48e4c0	CA	CAN	124	Canada 	Kanada	\N
00040000-5613-971c-58f5-ff1e0b2747a2	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5613-971c-a026-b257ec787711	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5613-971c-bea9-bfb131cd4b62	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5613-971c-e1fb-9021b9c18ce1	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5613-971c-ebe6-6f560fd29b68	CL	CHL	152	Chile 	Čile	\N
00040000-5613-971c-fed1-08f9fedf9b03	CN	CHN	156	China 	Kitajska	\N
00040000-5613-971c-19dd-ddf19b18acb4	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5613-971c-91e0-a26e61126aaf	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5613-971c-cda2-b73a598e2988	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5613-971c-a10c-f3b46202b6e6	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5613-971c-761d-cfc0b9b08760	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5613-971c-2f83-5b1ea4ed7b21	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5613-971c-3415-d90a8d40b30e	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5613-971c-58bd-dc854ab6ffe6	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5613-971c-09e8-7ccf3625974d	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5613-971c-0f90-5f4ce8be0e89	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5613-971c-f92b-a1a7dcac1308	CU	CUB	192	Cuba 	Kuba	\N
00040000-5613-971c-3527-b2d187908159	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5613-971c-c28b-2362c3cabafa	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5613-971c-66d2-155461276c7e	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5613-971c-45ed-05a76814fa32	DK	DNK	208	Denmark 	Danska	\N
00040000-5613-971c-b53a-b701a95cb837	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5613-971c-fea9-c5c3dd4bfd81	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5613-971c-df1d-74608ad2717e	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5613-971c-4273-875cb05553e1	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5613-971c-c4f0-64190e356781	EG	EGY	818	Egypt 	Egipt	\N
00040000-5613-971c-8d04-c780de15e6f1	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5613-971c-ebfa-18cb34f41b50	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5613-971c-e97f-fa1955ce1b02	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5613-971c-a6dc-8ae1a94ed16e	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5613-971c-0c63-e07c19671181	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5613-971c-28b6-94217b5b4e6e	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5613-971c-bb57-eaa75dc74d45	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5613-971c-08ba-c03fc8e019df	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5613-971c-dab6-1f5e774be271	FI	FIN	246	Finland 	Finska	\N
00040000-5613-971c-a6c8-d118156da219	FR	FRA	250	France 	Francija	\N
00040000-5613-971c-baae-34aa648d1c47	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5613-971c-8c77-0e26b0d1c778	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5613-971c-bd40-5aea69fd0dd5	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5613-971c-7559-af0bafaaec16	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5613-971c-7697-8787a1562ae8	GA	GAB	266	Gabon 	Gabon	\N
00040000-5613-971c-3d07-4aeda736d222	GM	GMB	270	Gambia 	Gambija	\N
00040000-5613-971c-8da3-43de13b7e613	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5613-971c-aab8-ffbce0bea54c	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5613-971c-22ab-08e3fc0c24c6	GH	GHA	288	Ghana 	Gana	\N
00040000-5613-971c-24a5-1d0093953ede	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5613-971c-3370-2dd1c8a67074	GR	GRC	300	Greece 	Grčija	\N
00040000-5613-971c-07c8-e84c6a29d573	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5613-971c-3508-c2b7b905c726	GD	GRD	308	Grenada 	Grenada	\N
00040000-5613-971c-71e8-0c37f9fdd288	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5613-971c-8162-8a17f56847ec	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5613-971c-74ed-c3cabc756598	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5613-971c-9872-f700bd569036	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5613-971c-ac3e-c6827eec2448	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5613-971c-3248-60da35450fdb	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5613-971c-490a-3d88f14d429d	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5613-971c-7167-0ed4d5fcc9dd	HT	HTI	332	Haiti 	Haiti	\N
00040000-5613-971c-6463-b9ff4e6d3c3f	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5613-971c-9fbf-28dbbf58efc1	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5613-971c-af6a-90dd01bd8de8	HN	HND	340	Honduras 	Honduras	\N
00040000-5613-971c-4752-806aba4f151a	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5613-971c-e212-43ff3b549aca	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5613-971c-4d99-0f291be8e581	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5613-971c-4250-819a5e63b221	IN	IND	356	India 	Indija	\N
00040000-5613-971c-ce99-512589443c5b	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5613-971c-8324-b2e905011c8d	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5613-971c-72a6-58ee126f4530	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5613-971c-1bb4-615d5182a094	IE	IRL	372	Ireland 	Irska	\N
00040000-5613-971c-447d-499f0ebbedea	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5613-971c-4fa1-ed3cf384efa1	IL	ISR	376	Israel 	Izrael	\N
00040000-5613-971c-6685-122e4a42ed78	IT	ITA	380	Italy 	Italija	\N
00040000-5613-971c-a4a4-2e48546f33a6	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5613-971c-e9a7-cb6b2256f00e	JP	JPN	392	Japan 	Japonska	\N
00040000-5613-971c-14ac-81734a4e6728	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5613-971c-b876-6b229eeccfd4	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5613-971c-e542-8e750629423e	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5613-971c-40d2-4f02c6479276	KE	KEN	404	Kenya 	Kenija	\N
00040000-5613-971c-5261-ec761d83c656	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5613-971c-85d9-7592b20de28d	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5613-971c-8227-24591b8db1e7	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5613-971c-ab4d-99f2d9bf0028	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5613-971c-2ae1-71627a83aba9	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5613-971c-6b01-9f2293fb0028	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5613-971c-de75-f90e6ede542e	LV	LVA	428	Latvia 	Latvija	\N
00040000-5613-971c-22a4-dd2d1cc18cdc	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5613-971c-1a78-37f1b1c8af1f	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5613-971c-d270-b1f67cdc43de	LR	LBR	430	Liberia 	Liberija	\N
00040000-5613-971c-d250-196dd150f286	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5613-971c-9f5d-0b5fb349199e	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5613-971c-aef7-905ff8add5d5	LT	LTU	440	Lithuania 	Litva	\N
00040000-5613-971c-b528-ee8cdb3e98a8	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5613-971c-ee20-bf7be71989b3	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5613-971c-6a70-8c1601845578	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5613-971c-1848-af4476c8b53a	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5613-971c-7197-30d6e375968b	MW	MWI	454	Malawi 	Malavi	\N
00040000-5613-971c-eb24-4a4156b51720	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5613-971c-1413-25e2a6d680fe	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5613-971c-8825-6f8ab0e863ee	ML	MLI	466	Mali 	Mali	\N
00040000-5613-971c-a540-a9dae5e0505b	MT	MLT	470	Malta 	Malta	\N
00040000-5613-971c-18ab-3792116630d7	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5613-971c-fdc7-ec5838fe8072	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5613-971c-3fb6-97a46888b7f3	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5613-971c-6093-a0d59fe2f7d8	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5613-971c-248c-f3a719df493c	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5613-971c-b9df-0f5a02bedcb2	MX	MEX	484	Mexico 	Mehika	\N
00040000-5613-971c-a9a8-4dc397a0d984	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5613-971c-2bef-4ec303c9c46f	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5613-971c-a886-dce6b99c41dc	MC	MCO	492	Monaco 	Monako	\N
00040000-5613-971c-e213-6d5d64988ae5	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5613-971c-4c9b-75b4a13a1cd4	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5613-971c-e944-c043a7d6f514	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5613-971c-be14-c8eb02cf40fe	MA	MAR	504	Morocco 	Maroko	\N
00040000-5613-971c-d820-9d2675261d78	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5613-971c-edd8-52a04e2fb94b	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5613-971c-6c3e-22d36d180893	NA	NAM	516	Namibia 	Namibija	\N
00040000-5613-971c-0d6e-a0ab1dfb4189	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5613-971c-d9c8-73e9756c47f2	NP	NPL	524	Nepal 	Nepal	\N
00040000-5613-971c-f08d-6545d262dac9	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5613-971c-0de9-41814fe7a2c5	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5613-971c-b15e-900f5757f7f4	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5613-971c-1cff-9eaa25a76dbc	NE	NER	562	Niger 	Niger 	\N
00040000-5613-971c-a38f-9549b99c12cd	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5613-971c-3c48-cebc478f7980	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5613-971c-3039-c6962d5a782e	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5613-971c-d6f8-c17db9f0f1ea	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5613-971c-bf9d-0add091a501f	NO	NOR	578	Norway 	Norveška	\N
00040000-5613-971c-4517-3df6e2204a8d	OM	OMN	512	Oman 	Oman	\N
00040000-5613-971c-9849-5fc8abe1846a	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5613-971c-42f3-bef8f0f094e1	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5613-971c-dce9-31abb8168218	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5613-971c-9e5a-a6322a095350	PA	PAN	591	Panama 	Panama	\N
00040000-5613-971c-fecb-90831fb8cc69	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5613-971c-1d58-6ebca36d44bf	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5613-971c-243a-9caa67436544	PE	PER	604	Peru 	Peru	\N
00040000-5613-971c-85ad-2d7c2153056c	PH	PHL	608	Philippines 	Filipini	\N
00040000-5613-971c-5ffc-ccf287ff972b	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5613-971c-566d-ccc7edf9d10f	PL	POL	616	Poland 	Poljska	\N
00040000-5613-971c-0779-d0e57843bcf0	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5613-971c-17ed-1355f8e5023d	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5613-971c-6ff3-55d741b906c8	QA	QAT	634	Qatar 	Katar	\N
00040000-5613-971c-f84f-b6b1bf1d59ca	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5613-971c-9d34-0947bde431c3	RO	ROU	642	Romania 	Romunija	\N
00040000-5613-971c-d464-66d003ad0982	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5613-971c-3cac-1d3b9e8307c3	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5613-971c-f78f-b8c36d9e6250	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5613-971c-9197-c7ed1b039786	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5613-971c-56a4-03ed7e206bb2	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5613-971c-473a-515e5d3a1dd1	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5613-971c-f93b-c4cb373f8183	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5613-971c-fb5b-c4acd7a184de	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5613-971c-4947-c6b48391252b	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5613-971c-36f8-b42f35d073b7	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5613-971c-31b7-2c95d2fffc0a	SM	SMR	674	San Marino 	San Marino	\N
00040000-5613-971c-f7b5-0162200e0158	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5613-971c-9626-9967f3ed9d76	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5613-971c-3ef7-2a68e56342fa	SN	SEN	686	Senegal 	Senegal	\N
00040000-5613-971c-0dad-c2994b4078ea	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5613-971c-7058-08e22842b5cc	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5613-971c-7706-34909d5fd5d4	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5613-971c-235f-b299ecbbf68f	SG	SGP	702	Singapore 	Singapur	\N
00040000-5613-971c-7a98-51adfd25cbf7	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5613-971c-a6fa-ebbca4ab4e87	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5613-971c-7f0a-b05b33cd9502	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5613-971c-e9c4-28c36532b0f4	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5613-971c-a44a-7d81ce372735	SO	SOM	706	Somalia 	Somalija	\N
00040000-5613-971c-e3c4-683e5ba6d458	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5613-971c-9061-db58ce5b901a	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5613-971c-0728-447085c15b58	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5613-971c-5a98-e66ddb90496f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5613-971c-a555-2c5b7ccdc611	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5613-971c-efe5-50c7de1572c4	SD	SDN	729	Sudan 	Sudan	\N
00040000-5613-971c-5dc5-2dd7268382d8	SR	SUR	740	Suriname 	Surinam	\N
00040000-5613-971c-3d64-073c39486f8c	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5613-971c-e515-f3d73f8756a4	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5613-971c-13ac-b4337fe302a5	SE	SWE	752	Sweden 	Švedska	\N
00040000-5613-971c-c8eb-2fbe5c0bc4df	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5613-971c-5fcb-21069864338c	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5613-971c-920a-f007b0e50d4c	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5613-971c-e694-f5aa32bfb246	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5613-971c-1915-2b3212569ae0	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5613-971c-e52f-c836a7e69037	TH	THA	764	Thailand 	Tajska	\N
00040000-5613-971c-d1a2-75e7c0504041	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5613-971c-ee87-ae221c0760b7	TG	TGO	768	Togo 	Togo	\N
00040000-5613-971c-24fd-b1000e416568	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5613-971c-0d45-dd0d2798ccf1	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5613-971c-3471-44f8e47eff2b	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5613-971c-fe6d-6ed32346676d	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5613-971c-9dd5-e47a18299ca4	TR	TUR	792	Turkey 	Turčija	\N
00040000-5613-971c-87b7-23cad3c75df2	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5613-971c-1144-b3b26893ee1e	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5613-971c-ce37-84da10b2bd41	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5613-971c-ca83-65cb26d6f3c0	UG	UGA	800	Uganda 	Uganda	\N
00040000-5613-971c-d36d-645952b7b226	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5613-971c-2919-596d55587e47	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5613-971c-9f5e-b0011987f3f9	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5613-971c-47fe-4c583b193eca	US	USA	840	United States 	Združene države Amerike	\N
00040000-5613-971c-4158-0da05f92ed4b	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5613-971c-d634-e571b1537f58	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5613-971c-e2ef-4ace2ebb34b6	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5613-971c-84b3-7084dd1b0df5	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5613-971c-3e92-6cb6de0f086a	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5613-971c-5194-952eda1f8a91	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5613-971c-95b5-59c5601b97d5	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5613-971c-8921-3be2b2892c2b	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5613-971c-e72b-7a8a6c490a0b	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5613-971c-6072-96b393ea64f1	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5613-971c-9379-2ed0dc7b4bca	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5613-971c-1fd4-0c685e321646	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5613-971c-9f91-8a973bec7c41	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3029 (class 0 OID 21342936)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5613-971e-fcc3-623d74efa561	000e0000-5613-971e-bfe3-333c04324c5d	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5613-971c-b45f-840a62d7967d	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5613-971e-31d7-14ca462bd599	000e0000-5613-971e-2f4a-d204b77f2a91	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5613-971c-2bf9-cbc65ab52366	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5613-971e-f9a8-783f08214490	000e0000-5613-971e-bbbb-9c01aa2c7540	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5613-971c-b45f-840a62d7967d	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5613-971e-7eaa-41974e52c141	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5613-971e-2433-d7c8c5247f49	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3014 (class 0 OID 21342738)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5613-971e-572e-1106b4d32e2c	000e0000-5613-971e-2f4a-d204b77f2a91	000c0000-5613-971e-be9d-55d7ad33fa5a	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5613-971c-1196-1c64e28dd0d8
000d0000-5613-971e-0505-44027ed98868	000e0000-5613-971e-2f4a-d204b77f2a91	000c0000-5613-971e-ba5a-674b1788234a	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5613-971c-7604-7dc011ea3163
000d0000-5613-971e-dfe5-c8ce7fa341e4	000e0000-5613-971e-2f4a-d204b77f2a91	000c0000-5613-971e-3f4b-3452834df03f	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5613-971c-ef41-3e52bd4aa334
000d0000-5613-971e-1041-50213fd67a9c	000e0000-5613-971e-2f4a-d204b77f2a91	000c0000-5613-971e-7763-e2b4470a38ce	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5613-971c-1d53-2c39fb43bbbf
000d0000-5613-971e-15f6-2176d27c4e92	000e0000-5613-971e-2f4a-d204b77f2a91	000c0000-5613-971e-68cf-118794af8fe7	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5613-971c-1d53-2c39fb43bbbf
000d0000-5613-971e-cd9e-35aefd9ac080	000e0000-5613-971e-2f4a-d204b77f2a91	000c0000-5613-971e-13e1-22316eed8eb9	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5613-971c-1196-1c64e28dd0d8
000d0000-5613-971e-908f-4ceea2b90af0	000e0000-5613-971e-2f4a-d204b77f2a91	000c0000-5613-971e-0ae3-2ff1b913233b	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5613-971c-1196-1c64e28dd0d8
000d0000-5613-971e-7767-40f858ccc635	000e0000-5613-971e-2f4a-d204b77f2a91	000c0000-5613-971e-6ee3-4b6f0b6aa7fd	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5613-971c-af25-6fa503ae26c9
000d0000-5613-971e-1d16-ddd86988040d	000e0000-5613-971e-2f4a-d204b77f2a91	000c0000-5613-971e-ae0f-0d4bc0272027	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5613-971c-ba44-7af0d1adb7f8
\.


--
-- TOC entry 2994 (class 0 OID 21342553)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 21342527)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 21342504)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5613-971e-bf9d-48087e359976	00080000-5613-971e-5da2-33314d8aa50d	00090000-5613-971e-daaf-93d1a7813176	AK		igralka
\.


--
-- TOC entry 3003 (class 0 OID 21342652)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 21343149)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3041 (class 0 OID 21343161)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3043 (class 0 OID 21343183)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 21093458)
-- Dependencies: 170
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY migrations (version) FROM stdin;
20150824004401
20150826210511
20150827174118
20150831215248
20150907083238
20150911210328
20150917115047
20150918081756
20150923181744
20150929204104
\.


--
-- TOC entry 3007 (class 0 OID 21342677)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 21342461)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5613-971d-6962-bb70153ea17f	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5613-971d-96be-c9b53be62982	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5613-971d-4feb-2c47a2d025f1	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5613-971d-0808-2f85f34551d6	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5613-971d-a9cc-109b4c457237	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5613-971d-1c3d-73f1a4a66100	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5613-971d-156e-ab2fbaf64431	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5613-971d-cdf5-902dd7468e20	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5613-971d-1952-53681a066146	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5613-971d-fdc9-519fc8f18e53	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5613-971d-d263-d9b7e59dd2f3	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5613-971d-4571-dafcc5262120	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5613-971d-20a5-e464b28084ae	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5613-971d-b542-988e65c5f8f6	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5613-971d-ec1d-42d1db8d73b9	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5613-971e-a7d9-6eba686034a5	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5613-971e-92d5-4471d7342da5	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5613-971e-2e6a-9f0f44e54adf	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5613-971e-5353-5c7ad0041259	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5613-971e-9095-9ce635a532f6	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5613-971f-414b-e0aa66ef51e1	application.tenant.maticnopodjetje	string	s:36:"00080000-5613-971f-58d3-fad7d4b04d72";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 2981 (class 0 OID 21342375)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5613-971e-9836-7eaa1bbdb8f9	00000000-5613-971e-a7d9-6eba686034a5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5613-971e-9444-6885d27961e6	00000000-5613-971e-a7d9-6eba686034a5	00010000-5613-971d-2cd2-239961e9cca5	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5613-971e-dc82-3d79b7638c4f	00000000-5613-971e-92d5-4471d7342da5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2982 (class 0 OID 21342386)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5613-971e-a8fb-52abdefb356c	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5613-971e-e6f3-0dcf37a56d6b	00010000-5613-971e-5a7e-ec4aff4cf013	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5613-971e-0537-93814b82763a	00010000-5613-971e-e617-64ebdec060d5	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5613-971e-d83e-83aa6ce0bec5	00010000-5613-971e-2cda-9224d5eb88a2	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5613-971e-07bb-557c19893290	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5613-971e-3c13-d84b63048246	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5613-971e-297a-5728cebcac77	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5613-971e-a90b-c2d833cf483d	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5613-971e-daaf-93d1a7813176	00010000-5613-971e-d384-929a61a1d44b	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5613-971e-30cc-8337f37e2cdf	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5613-971e-6df0-7e96735b9a76	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5613-971e-c1f4-bd98b3dd170d	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5613-971e-7236-fb65b1a59a32	00010000-5613-971e-4b9b-b190a4d97bae	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5613-971e-f037-19a7caedb1a6	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5613-971e-50e5-2736b9c9d73f	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5613-971e-a493-5b0f4a4cfcd6	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5613-971e-f64d-30239f66af05	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5613-971e-f933-ca9ae87e728c	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2977 (class 0 OID 21342340)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5613-971c-689d-0009858fd325	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5613-971c-b0e2-2cac652972fb	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5613-971c-f849-f39d44f10642	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5613-971c-4db1-3a9a389248cd	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5613-971c-e781-90ee463da320	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5613-971c-17aa-166103fd3871	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5613-971c-4c6b-3c676385abbb	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5613-971c-b760-aafee3a158c3	Abonma-read	Abonma - branje	f
00030000-5613-971c-a71a-a2e3d1fff315	Abonma-write	Abonma - spreminjanje	f
00030000-5613-971c-7646-6ad83afc6819	Alternacija-read	Alternacija - branje	f
00030000-5613-971c-57ea-31d5e0ac6872	Alternacija-write	Alternacija - spreminjanje	f
00030000-5613-971c-814e-0ad7670e8ea6	Arhivalija-read	Arhivalija - branje	f
00030000-5613-971c-db94-82d893b03dcd	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5613-971c-13a8-21056738857c	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5613-971c-0793-7e56fea74fac	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5613-971c-fdaa-98a973415e80	Besedilo-read	Besedilo - branje	f
00030000-5613-971c-774c-5fec4d714e0b	Besedilo-write	Besedilo - spreminjanje	f
00030000-5613-971c-d014-8e7d9c3c34a2	DogodekIzven-read	DogodekIzven - branje	f
00030000-5613-971c-6826-f8aaf364119f	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5613-971c-efa6-5274e7b505f0	Dogodek-read	Dogodek - branje	f
00030000-5613-971c-faf6-35fe4d986aad	Dogodek-write	Dogodek - spreminjanje	f
00030000-5613-971c-9002-8e6eb5a3cde5	DrugiVir-read	DrugiVir - branje	f
00030000-5613-971c-096e-d89c1537e21a	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5613-971c-7dd9-875c0766f3ee	Drzava-read	Drzava - branje	f
00030000-5613-971c-8da0-e9fde90fb9dc	Drzava-write	Drzava - spreminjanje	f
00030000-5613-971c-c404-2bd81712e640	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5613-971c-6519-e8619d640f02	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5613-971c-aa96-a2dca15cff70	Funkcija-read	Funkcija - branje	f
00030000-5613-971c-ed83-b34d8ff5212b	Funkcija-write	Funkcija - spreminjanje	f
00030000-5613-971c-df1a-ce947a9bb8ec	Gostovanje-read	Gostovanje - branje	f
00030000-5613-971c-32e8-69abfff779a8	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5613-971c-2177-b8af49ba42aa	Gostujoca-read	Gostujoca - branje	f
00030000-5613-971c-bed3-87be1f4d53d6	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5613-971c-5993-a2bac92a7508	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5613-971c-da35-c284ce074943	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5613-971c-caf8-cec513494fff	Kupec-read	Kupec - branje	f
00030000-5613-971c-0869-5e563845ffd1	Kupec-write	Kupec - spreminjanje	f
00030000-5613-971c-9240-dc50793e04b0	NacinPlacina-read	NacinPlacina - branje	f
00030000-5613-971c-50c7-c7eda4be2628	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5613-971c-d1fb-8a9cec4e55e1	Option-read	Option - branje	f
00030000-5613-971c-b92a-14488458aae3	Option-write	Option - spreminjanje	f
00030000-5613-971c-3f2a-d45cc5b4e21c	OptionValue-read	OptionValue - branje	f
00030000-5613-971c-5d53-8c9688d82a46	OptionValue-write	OptionValue - spreminjanje	f
00030000-5613-971c-02d3-e2190642718e	Oseba-read	Oseba - branje	f
00030000-5613-971c-be5e-570904afec27	Oseba-write	Oseba - spreminjanje	f
00030000-5613-971c-037d-bb9428e40b28	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5613-971c-7483-5c48edd3ebc2	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5613-971c-26c3-9c71ed6e2d28	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5613-971c-c5cc-c4c79a2d2f58	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5613-971c-2dd4-1c9d00cb3d6f	Pogodba-read	Pogodba - branje	f
00030000-5613-971c-142c-f75b6ef9d9b3	Pogodba-write	Pogodba - spreminjanje	f
00030000-5613-971c-9db9-8bb9990e68e6	Popa-read	Popa - branje	f
00030000-5613-971c-4055-a46abce6c7b7	Popa-write	Popa - spreminjanje	f
00030000-5613-971c-1b08-193ba23662c1	Posta-read	Posta - branje	f
00030000-5613-971c-2946-db7a42b56974	Posta-write	Posta - spreminjanje	f
00030000-5613-971c-65ef-c523d73501e8	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5613-971c-a800-642f7bf54b99	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5613-971c-4552-dd768269a542	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5613-971c-0d9e-4f356cdf443c	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5613-971c-5d90-31cf0ca3e1ae	PostniNaslov-read	PostniNaslov - branje	f
00030000-5613-971c-ce7d-90a173d96b65	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5613-971c-945c-c87d9f218046	Predstava-read	Predstava - branje	f
00030000-5613-971c-30f4-022b0e78fa67	Predstava-write	Predstava - spreminjanje	f
00030000-5613-971c-5110-654b64463cb5	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5613-971c-99dd-5f57a19f4803	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5613-971c-9fef-95efcc7eb605	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5613-971c-291a-b1fa39ada5c7	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5613-971c-7098-816ba964b1c8	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5613-971c-cc61-b03783f4d193	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5613-971c-a87f-c61e4ee0c15f	ProgramDela-read	ProgramDela - branje	f
00030000-5613-971c-ef1e-0c8c13b468a5	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5613-971c-0fb9-3ad8eefd4c3a	ProgramFestival-read	ProgramFestival - branje	f
00030000-5613-971c-0944-ddbb1052bc5a	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5613-971c-1561-4b07a19d2875	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5613-971c-eb08-3fc629bbb34d	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5613-971c-73af-11fa7fba619d	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5613-971c-f591-ca65235bcb29	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5613-971c-95ee-f17f1a557784	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5613-971c-67f2-18f331e48e11	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5613-971c-5533-41f9e5e0ce0d	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5613-971c-8b8f-37335adbc71d	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5613-971c-fd2f-2707fb24338e	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5613-971c-c654-18ff45f45b41	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5613-971c-33ee-96aded2454a1	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5613-971c-4518-f37386b8bd51	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5613-971c-6a38-a0789aaaa6cd	ProgramRazno-read	ProgramRazno - branje	f
00030000-5613-971c-aa44-a72b5a696ad7	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5613-971c-c7b8-f66249056d31	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5613-971c-bcda-caaac30c9546	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5613-971c-fc76-25e1850fa4f7	Prostor-read	Prostor - branje	f
00030000-5613-971c-2ba3-5bb77bc0e347	Prostor-write	Prostor - spreminjanje	f
00030000-5613-971c-46ee-e6debb9fa2a7	Racun-read	Racun - branje	f
00030000-5613-971c-5329-f70bfd1d9268	Racun-write	Racun - spreminjanje	f
00030000-5613-971c-618a-c01e165b8642	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5613-971c-c30a-a9570bd09e24	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5613-971c-0183-f22e7760af9c	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5613-971c-4c80-31996060858a	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5613-971c-d6fb-72923257b6e9	Rekvizit-read	Rekvizit - branje	f
00030000-5613-971c-ca06-ee223f1de223	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5613-971c-31a2-2d1010c6b52c	Revizija-read	Revizija - branje	f
00030000-5613-971c-bd35-a0640ccfede5	Revizija-write	Revizija - spreminjanje	f
00030000-5613-971c-79fb-9f600f2cb555	Rezervacija-read	Rezervacija - branje	f
00030000-5613-971c-19b2-9b96f80b1fd0	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5613-971c-e9a1-b670f43e2ae5	SedezniRed-read	SedezniRed - branje	f
00030000-5613-971c-4531-20b5ee7b240c	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5613-971c-d49f-fdbe562fec41	Sedez-read	Sedez - branje	f
00030000-5613-971c-8a06-f883bef188af	Sedez-write	Sedez - spreminjanje	f
00030000-5613-971c-3339-567a56a39ef4	Sezona-read	Sezona - branje	f
00030000-5613-971c-8c1f-61b9e3538848	Sezona-write	Sezona - spreminjanje	f
00030000-5613-971c-a280-db6173b2f846	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5613-971c-a2dd-e74b1fbea497	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5613-971c-6f5a-c32469fd0727	Stevilcenje-read	Stevilcenje - branje	f
00030000-5613-971c-caf0-ec837c5e205c	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5613-971c-3015-e83e7010a997	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5613-971c-6031-8da1f35130d7	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5613-971c-763e-2051b29ebda9	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5613-971c-e131-07b68b2d8276	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5613-971c-8fa8-da92c8a3f205	Telefonska-read	Telefonska - branje	f
00030000-5613-971c-8e73-465298c6b743	Telefonska-write	Telefonska - spreminjanje	f
00030000-5613-971c-be4c-3f4cc142d855	TerminStoritve-read	TerminStoritve - branje	f
00030000-5613-971c-91a5-48639605bf43	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5613-971c-9fac-de634d17d1c0	TipFunkcije-read	TipFunkcije - branje	f
00030000-5613-971c-638a-5ca88be8181e	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5613-971c-bdac-1b3b33095594	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5613-971c-a3f0-387e5d6a50cb	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5613-971c-6ecd-3b377859ab3b	Trr-read	Trr - branje	f
00030000-5613-971c-e0ab-59a8461a4bb6	Trr-write	Trr - spreminjanje	f
00030000-5613-971c-72c3-f5aeaf966139	Uprizoritev-read	Uprizoritev - branje	f
00030000-5613-971c-fb1d-d8e5fa4b40ec	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5613-971c-d636-267d1ae2e232	Vaja-read	Vaja - branje	f
00030000-5613-971c-6fd1-46fb814aae84	Vaja-write	Vaja - spreminjanje	f
00030000-5613-971c-6c34-cd81073265c3	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5613-971c-5aec-1bb1787ac8e2	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5613-971c-16d9-6696248a8c0d	VrstaStroska-read	VrstaStroska - branje	f
00030000-5613-971c-86b4-e4fedd4da86f	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5613-971c-8c47-b51f32f8b5e3	Zaposlitev-read	Zaposlitev - branje	f
00030000-5613-971c-b7dc-0a1ca9da01d1	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5613-971c-02e2-bc434b2002c9	Zasedenost-read	Zasedenost - branje	f
00030000-5613-971c-f25f-9e437aba4577	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5613-971c-f829-b99652284aea	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5613-971c-3bc6-cf813b582268	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5613-971c-0b68-0ee6f8a5ed38	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5613-971c-8725-77f9c2691821	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5613-971c-c0bf-bbfdbe047219	Job-read	Branje opravil - samo zase - branje	f
00030000-5613-971c-f6a4-96c7baf069f7	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5613-971c-8a5d-0f6f761e201e	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5613-971c-2241-c345a1a67ee7	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5613-971c-3a4f-b2500d6405f2	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5613-971c-55d5-e196e61e4693	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5613-971c-452c-5249ee0a9a11	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5613-971c-53d3-ca3b4520f827	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5613-971c-dffa-23de8c7d0b0e	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5613-971c-da56-029f171da7fd	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5613-971c-d653-b7d62065f601	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5613-971c-6fce-9b4e552daafc	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5613-971c-c348-cb5f625a61a3	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5613-971c-96eb-57d68a07c8b0	Datoteka-write	Datoteka - spreminjanje	f
00030000-5613-971c-2775-0383537b1580	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2979 (class 0 OID 21342359)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5613-971c-f783-573eeb87e234	00030000-5613-971c-b0e2-2cac652972fb
00020000-5613-971c-4560-9f5f22227d98	00030000-5613-971c-7dd9-875c0766f3ee
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-b760-aafee3a158c3
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-a71a-a2e3d1fff315
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-7646-6ad83afc6819
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-57ea-31d5e0ac6872
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-814e-0ad7670e8ea6
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-efa6-5274e7b505f0
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-4db1-3a9a389248cd
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-faf6-35fe4d986aad
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-7dd9-875c0766f3ee
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-8da0-e9fde90fb9dc
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-aa96-a2dca15cff70
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-ed83-b34d8ff5212b
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-df1a-ce947a9bb8ec
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-32e8-69abfff779a8
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-2177-b8af49ba42aa
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-bed3-87be1f4d53d6
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-5993-a2bac92a7508
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-da35-c284ce074943
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-d1fb-8a9cec4e55e1
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-3f2a-d45cc5b4e21c
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-02d3-e2190642718e
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-be5e-570904afec27
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-9db9-8bb9990e68e6
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-4055-a46abce6c7b7
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-1b08-193ba23662c1
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-2946-db7a42b56974
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-5d90-31cf0ca3e1ae
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-ce7d-90a173d96b65
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-945c-c87d9f218046
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-30f4-022b0e78fa67
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-7098-816ba964b1c8
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-cc61-b03783f4d193
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-fc76-25e1850fa4f7
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-2ba3-5bb77bc0e347
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-0183-f22e7760af9c
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-4c80-31996060858a
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-d6fb-72923257b6e9
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-ca06-ee223f1de223
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-3339-567a56a39ef4
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-8c1f-61b9e3538848
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-9fac-de634d17d1c0
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-72c3-f5aeaf966139
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-fb1d-d8e5fa4b40ec
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-d636-267d1ae2e232
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-6fd1-46fb814aae84
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-02e2-bc434b2002c9
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-f25f-9e437aba4577
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-f829-b99652284aea
00020000-5613-971d-af92-bcb23be70d34	00030000-5613-971c-0b68-0ee6f8a5ed38
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-b760-aafee3a158c3
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-814e-0ad7670e8ea6
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-efa6-5274e7b505f0
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-7dd9-875c0766f3ee
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-df1a-ce947a9bb8ec
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-2177-b8af49ba42aa
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-5993-a2bac92a7508
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-da35-c284ce074943
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-d1fb-8a9cec4e55e1
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-3f2a-d45cc5b4e21c
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-02d3-e2190642718e
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-be5e-570904afec27
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-9db9-8bb9990e68e6
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-1b08-193ba23662c1
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-5d90-31cf0ca3e1ae
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-ce7d-90a173d96b65
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-945c-c87d9f218046
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-fc76-25e1850fa4f7
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-0183-f22e7760af9c
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-d6fb-72923257b6e9
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-3339-567a56a39ef4
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-8fa8-da92c8a3f205
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-8e73-465298c6b743
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-6ecd-3b377859ab3b
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-e0ab-59a8461a4bb6
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-8c47-b51f32f8b5e3
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-b7dc-0a1ca9da01d1
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-f829-b99652284aea
00020000-5613-971d-609b-e964877f1955	00030000-5613-971c-0b68-0ee6f8a5ed38
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-b760-aafee3a158c3
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-7646-6ad83afc6819
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-814e-0ad7670e8ea6
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-db94-82d893b03dcd
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-fdaa-98a973415e80
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-d014-8e7d9c3c34a2
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-efa6-5274e7b505f0
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-7dd9-875c0766f3ee
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-aa96-a2dca15cff70
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-df1a-ce947a9bb8ec
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-2177-b8af49ba42aa
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-5993-a2bac92a7508
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-d1fb-8a9cec4e55e1
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-3f2a-d45cc5b4e21c
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-02d3-e2190642718e
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-9db9-8bb9990e68e6
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-1b08-193ba23662c1
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-945c-c87d9f218046
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-7098-816ba964b1c8
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-fc76-25e1850fa4f7
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-0183-f22e7760af9c
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-d6fb-72923257b6e9
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-3339-567a56a39ef4
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-9fac-de634d17d1c0
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-d636-267d1ae2e232
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-02e2-bc434b2002c9
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-f829-b99652284aea
00020000-5613-971d-48be-695c186378c5	00030000-5613-971c-0b68-0ee6f8a5ed38
00020000-5613-971d-5d15-bc27eb551dfe	00030000-5613-971c-b760-aafee3a158c3
00020000-5613-971d-5d15-bc27eb551dfe	00030000-5613-971c-a71a-a2e3d1fff315
00020000-5613-971d-5d15-bc27eb551dfe	00030000-5613-971c-57ea-31d5e0ac6872
00020000-5613-971d-5d15-bc27eb551dfe	00030000-5613-971c-814e-0ad7670e8ea6
00020000-5613-971d-5d15-bc27eb551dfe	00030000-5613-971c-efa6-5274e7b505f0
00020000-5613-971d-5d15-bc27eb551dfe	00030000-5613-971c-7dd9-875c0766f3ee
00020000-5613-971d-5d15-bc27eb551dfe	00030000-5613-971c-df1a-ce947a9bb8ec
00020000-5613-971d-5d15-bc27eb551dfe	00030000-5613-971c-2177-b8af49ba42aa
00020000-5613-971d-5d15-bc27eb551dfe	00030000-5613-971c-d1fb-8a9cec4e55e1
00020000-5613-971d-5d15-bc27eb551dfe	00030000-5613-971c-3f2a-d45cc5b4e21c
00020000-5613-971d-5d15-bc27eb551dfe	00030000-5613-971c-9db9-8bb9990e68e6
00020000-5613-971d-5d15-bc27eb551dfe	00030000-5613-971c-1b08-193ba23662c1
00020000-5613-971d-5d15-bc27eb551dfe	00030000-5613-971c-945c-c87d9f218046
00020000-5613-971d-5d15-bc27eb551dfe	00030000-5613-971c-fc76-25e1850fa4f7
00020000-5613-971d-5d15-bc27eb551dfe	00030000-5613-971c-0183-f22e7760af9c
00020000-5613-971d-5d15-bc27eb551dfe	00030000-5613-971c-d6fb-72923257b6e9
00020000-5613-971d-5d15-bc27eb551dfe	00030000-5613-971c-3339-567a56a39ef4
00020000-5613-971d-5d15-bc27eb551dfe	00030000-5613-971c-9fac-de634d17d1c0
00020000-5613-971d-5d15-bc27eb551dfe	00030000-5613-971c-f829-b99652284aea
00020000-5613-971d-5d15-bc27eb551dfe	00030000-5613-971c-0b68-0ee6f8a5ed38
00020000-5613-971d-81fa-8a83547b4593	00030000-5613-971c-b760-aafee3a158c3
00020000-5613-971d-81fa-8a83547b4593	00030000-5613-971c-814e-0ad7670e8ea6
00020000-5613-971d-81fa-8a83547b4593	00030000-5613-971c-efa6-5274e7b505f0
00020000-5613-971d-81fa-8a83547b4593	00030000-5613-971c-7dd9-875c0766f3ee
00020000-5613-971d-81fa-8a83547b4593	00030000-5613-971c-df1a-ce947a9bb8ec
00020000-5613-971d-81fa-8a83547b4593	00030000-5613-971c-2177-b8af49ba42aa
00020000-5613-971d-81fa-8a83547b4593	00030000-5613-971c-d1fb-8a9cec4e55e1
00020000-5613-971d-81fa-8a83547b4593	00030000-5613-971c-3f2a-d45cc5b4e21c
00020000-5613-971d-81fa-8a83547b4593	00030000-5613-971c-9db9-8bb9990e68e6
00020000-5613-971d-81fa-8a83547b4593	00030000-5613-971c-1b08-193ba23662c1
00020000-5613-971d-81fa-8a83547b4593	00030000-5613-971c-945c-c87d9f218046
00020000-5613-971d-81fa-8a83547b4593	00030000-5613-971c-fc76-25e1850fa4f7
00020000-5613-971d-81fa-8a83547b4593	00030000-5613-971c-0183-f22e7760af9c
00020000-5613-971d-81fa-8a83547b4593	00030000-5613-971c-d6fb-72923257b6e9
00020000-5613-971d-81fa-8a83547b4593	00030000-5613-971c-3339-567a56a39ef4
00020000-5613-971d-81fa-8a83547b4593	00030000-5613-971c-be4c-3f4cc142d855
00020000-5613-971d-81fa-8a83547b4593	00030000-5613-971c-f849-f39d44f10642
00020000-5613-971d-81fa-8a83547b4593	00030000-5613-971c-9fac-de634d17d1c0
00020000-5613-971d-81fa-8a83547b4593	00030000-5613-971c-f829-b99652284aea
00020000-5613-971d-81fa-8a83547b4593	00030000-5613-971c-0b68-0ee6f8a5ed38
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-689d-0009858fd325
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-b0e2-2cac652972fb
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-f849-f39d44f10642
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-4db1-3a9a389248cd
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-e781-90ee463da320
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-17aa-166103fd3871
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-4c6b-3c676385abbb
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-b760-aafee3a158c3
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-a71a-a2e3d1fff315
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-7646-6ad83afc6819
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-57ea-31d5e0ac6872
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-814e-0ad7670e8ea6
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-db94-82d893b03dcd
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-fdaa-98a973415e80
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-774c-5fec4d714e0b
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-d014-8e7d9c3c34a2
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-6826-f8aaf364119f
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-efa6-5274e7b505f0
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-faf6-35fe4d986aad
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-7dd9-875c0766f3ee
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-8da0-e9fde90fb9dc
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-9002-8e6eb5a3cde5
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-096e-d89c1537e21a
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-c404-2bd81712e640
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-6519-e8619d640f02
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-aa96-a2dca15cff70
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-ed83-b34d8ff5212b
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-df1a-ce947a9bb8ec
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-32e8-69abfff779a8
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-2177-b8af49ba42aa
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-bed3-87be1f4d53d6
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-5993-a2bac92a7508
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-da35-c284ce074943
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-caf8-cec513494fff
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-0869-5e563845ffd1
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-9240-dc50793e04b0
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-50c7-c7eda4be2628
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-d1fb-8a9cec4e55e1
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-b92a-14488458aae3
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-3f2a-d45cc5b4e21c
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-5d53-8c9688d82a46
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-02d3-e2190642718e
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-be5e-570904afec27
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-037d-bb9428e40b28
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-7483-5c48edd3ebc2
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-26c3-9c71ed6e2d28
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-c5cc-c4c79a2d2f58
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-2dd4-1c9d00cb3d6f
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-142c-f75b6ef9d9b3
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-9db9-8bb9990e68e6
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-4055-a46abce6c7b7
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-1b08-193ba23662c1
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-2946-db7a42b56974
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-65ef-c523d73501e8
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-a800-642f7bf54b99
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-4552-dd768269a542
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-0d9e-4f356cdf443c
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-5d90-31cf0ca3e1ae
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-ce7d-90a173d96b65
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-945c-c87d9f218046
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-30f4-022b0e78fa67
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-5110-654b64463cb5
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-99dd-5f57a19f4803
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-9fef-95efcc7eb605
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-291a-b1fa39ada5c7
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-7098-816ba964b1c8
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-cc61-b03783f4d193
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-a87f-c61e4ee0c15f
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-ef1e-0c8c13b468a5
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-0fb9-3ad8eefd4c3a
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-0944-ddbb1052bc5a
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-1561-4b07a19d2875
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-eb08-3fc629bbb34d
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-73af-11fa7fba619d
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-f591-ca65235bcb29
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-95ee-f17f1a557784
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-67f2-18f331e48e11
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-5533-41f9e5e0ce0d
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-8b8f-37335adbc71d
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-fd2f-2707fb24338e
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-c654-18ff45f45b41
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-33ee-96aded2454a1
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-4518-f37386b8bd51
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-6a38-a0789aaaa6cd
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-aa44-a72b5a696ad7
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-c7b8-f66249056d31
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-bcda-caaac30c9546
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-fc76-25e1850fa4f7
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-2ba3-5bb77bc0e347
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-46ee-e6debb9fa2a7
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-5329-f70bfd1d9268
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-618a-c01e165b8642
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-c30a-a9570bd09e24
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-0183-f22e7760af9c
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-4c80-31996060858a
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-d6fb-72923257b6e9
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-ca06-ee223f1de223
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-31a2-2d1010c6b52c
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-bd35-a0640ccfede5
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-79fb-9f600f2cb555
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-19b2-9b96f80b1fd0
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-e9a1-b670f43e2ae5
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-4531-20b5ee7b240c
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-d49f-fdbe562fec41
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-8a06-f883bef188af
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-3339-567a56a39ef4
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-8c1f-61b9e3538848
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-a280-db6173b2f846
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-a2dd-e74b1fbea497
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-6f5a-c32469fd0727
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-caf0-ec837c5e205c
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-3015-e83e7010a997
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-6031-8da1f35130d7
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-763e-2051b29ebda9
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-e131-07b68b2d8276
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-8fa8-da92c8a3f205
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-8e73-465298c6b743
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-be4c-3f4cc142d855
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-91a5-48639605bf43
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-9fac-de634d17d1c0
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-638a-5ca88be8181e
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-bdac-1b3b33095594
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-a3f0-387e5d6a50cb
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-6ecd-3b377859ab3b
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-e0ab-59a8461a4bb6
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-72c3-f5aeaf966139
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-fb1d-d8e5fa4b40ec
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-d636-267d1ae2e232
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-6fd1-46fb814aae84
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-6c34-cd81073265c3
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-5aec-1bb1787ac8e2
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-16d9-6696248a8c0d
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-86b4-e4fedd4da86f
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-8c47-b51f32f8b5e3
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-b7dc-0a1ca9da01d1
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-02e2-bc434b2002c9
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-f25f-9e437aba4577
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-f829-b99652284aea
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-3bc6-cf813b582268
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-0b68-0ee6f8a5ed38
00020000-5613-971e-7149-2e574ace7f5d	00030000-5613-971c-8725-77f9c2691821
\.


--
-- TOC entry 3008 (class 0 OID 21342684)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 21342718)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 21342854)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5613-971e-7f2e-d12d223e211e	00090000-5613-971e-a8fb-52abdefb356c	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5613-971e-b7df-edcb9b46d319	00090000-5613-971e-3c13-d84b63048246	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5613-971e-ade1-cbe4e397e5ce	00090000-5613-971e-7236-fb65b1a59a32	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5613-971e-5aca-5ac21c20147f	00090000-5613-971e-30cc-8337f37e2cdf	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2984 (class 0 OID 21342419)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5613-971e-5da2-33314d8aa50d	00040000-5613-971c-7f0a-b05b33cd9502	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-971e-5c93-c92e791493a4	00040000-5613-971c-7f0a-b05b33cd9502	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5613-971e-6840-de44cd054d1d	00040000-5613-971c-7f0a-b05b33cd9502	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-971e-dde0-70b57cee6cc9	00040000-5613-971c-7f0a-b05b33cd9502	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-971e-0363-5a53bb4bd1dc	00040000-5613-971c-7f0a-b05b33cd9502	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-971e-dcb6-a2b87d4f23ab	00040000-5613-971c-9c9b-262e2f56f156	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-971e-c4f2-4d9c42297100	00040000-5613-971c-0f90-5f4ce8be0e89	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-971e-051c-cc855d6b9e7b	00040000-5613-971c-db91-657fb229356b	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-971e-be83-a9bd94c39cd6	00040000-5613-971c-aab8-ffbce0bea54c	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-971f-58d3-fad7d4b04d72	00040000-5613-971c-7f0a-b05b33cd9502	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2986 (class 0 OID 21342453)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5613-971c-7212-6caca9933353	8341	Adlešiči
00050000-5613-971c-70bb-7e3a148db452	5270	Ajdovščina
00050000-5613-971c-6e80-be3980f38e3f	6280	Ankaran/Ancarano
00050000-5613-971c-2ec9-1197e490f4ce	9253	Apače
00050000-5613-971c-53de-20f0e9073f5a	8253	Artiče
00050000-5613-971c-90cd-25243e3c537c	4275	Begunje na Gorenjskem
00050000-5613-971c-9210-1fa7f02e1dc6	1382	Begunje pri Cerknici
00050000-5613-971c-6111-27752e1545ab	9231	Beltinci
00050000-5613-971c-8026-1ebfb49b4cb6	2234	Benedikt
00050000-5613-971c-ef50-4bdfeae1b28c	2345	Bistrica ob Dravi
00050000-5613-971c-afc0-862fab999c42	3256	Bistrica ob Sotli
00050000-5613-971c-7d6c-f10b35246b24	8259	Bizeljsko
00050000-5613-971c-3c90-66b287bd8e2e	1223	Blagovica
00050000-5613-971c-f52e-3e987f5a3c5f	8283	Blanca
00050000-5613-971c-2724-b8e8afefb57b	4260	Bled
00050000-5613-971c-320c-72927c5e542f	4273	Blejska Dobrava
00050000-5613-971c-f4df-a0a055e84262	9265	Bodonci
00050000-5613-971c-aaf1-4c758fe4af48	9222	Bogojina
00050000-5613-971c-6128-229510020d3f	4263	Bohinjska Bela
00050000-5613-971c-7998-672985dbf865	4264	Bohinjska Bistrica
00050000-5613-971c-ec1f-28425860d32b	4265	Bohinjsko jezero
00050000-5613-971c-de93-a3f93c90512d	1353	Borovnica
00050000-5613-971c-a8f2-ae814a0ede45	8294	Boštanj
00050000-5613-971c-9d29-66448e85f29f	5230	Bovec
00050000-5613-971c-b3a9-9bbd23735fd9	5295	Branik
00050000-5613-971c-7214-f061e9069092	3314	Braslovče
00050000-5613-971c-5930-faf3a22b31d3	5223	Breginj
00050000-5613-971c-7759-bf1c49307315	8280	Brestanica
00050000-5613-971c-1cf7-d9925c1694ed	2354	Bresternica
00050000-5613-971c-bc4c-098f5dfa0af4	4243	Brezje
00050000-5613-971c-225b-106972aba8e9	1351	Brezovica pri Ljubljani
00050000-5613-971c-e196-1b5962dd0ee9	8250	Brežice
00050000-5613-971c-1ec7-8cf85169794b	4210	Brnik - Aerodrom
00050000-5613-971c-92bf-8c93ed47b41e	8321	Brusnice
00050000-5613-971c-7f96-bc2fcdea1f77	3255	Buče
00050000-5613-971c-aff0-229059fb17e2	8276	Bučka 
00050000-5613-971c-a468-3e7421c23ee0	9261	Cankova
00050000-5613-971c-7441-b369e5b8ac45	3000	Celje 
00050000-5613-971c-e84d-e2fffc8bbc03	3001	Celje - poštni predali
00050000-5613-971c-2029-36ade6d001ee	4207	Cerklje na Gorenjskem
00050000-5613-971c-b098-1ea06be22b05	8263	Cerklje ob Krki
00050000-5613-971c-a9f5-129fef4a09dd	1380	Cerknica
00050000-5613-971c-464d-dbd50cfa1219	5282	Cerkno
00050000-5613-971c-d695-cd3873e3a526	2236	Cerkvenjak
00050000-5613-971c-4e10-1b530300ecb6	2215	Ceršak
00050000-5613-971c-312d-c0912e6bd45e	2326	Cirkovce
00050000-5613-971c-eabc-d6e3051e4214	2282	Cirkulane
00050000-5613-971c-1a99-16e80f41cafd	5273	Col
00050000-5613-971c-863f-6c578c5986fc	8251	Čatež ob Savi
00050000-5613-971c-1e10-849359c7b493	1413	Čemšenik
00050000-5613-971c-0f5b-3ffe252fa9dd	5253	Čepovan
00050000-5613-971c-d883-95408bdb5b92	9232	Črenšovci
00050000-5613-971c-ad61-444ea82c9aa8	2393	Črna na Koroškem
00050000-5613-971c-d8f4-ebd15186615d	6275	Črni Kal
00050000-5613-971c-d0d6-ece0cbd41d9f	5274	Črni Vrh nad Idrijo
00050000-5613-971c-8283-2e714db54187	5262	Črniče
00050000-5613-971c-73d8-5ea7d57b7b9f	8340	Črnomelj
00050000-5613-971c-1ec8-071fcc07510e	6271	Dekani
00050000-5613-971c-f5fc-9c24f35e3f4d	5210	Deskle
00050000-5613-971c-cb78-5be60c239964	2253	Destrnik
00050000-5613-971c-99ad-ebea0ab7d419	6215	Divača
00050000-5613-971c-15c8-c94b89ebc7f1	1233	Dob
00050000-5613-971c-a180-6db4778484c2	3224	Dobje pri Planini
00050000-5613-971c-f23a-6e3cee93be65	8257	Dobova
00050000-5613-971c-a936-6412a0231540	1423	Dobovec
00050000-5613-971c-60fa-b6184c50fc34	5263	Dobravlje
00050000-5613-971c-8533-b19df8e15552	3204	Dobrna
00050000-5613-971c-42c8-d24f703c663a	8211	Dobrnič
00050000-5613-971c-45c5-38892c42f08e	1356	Dobrova
00050000-5613-971c-62ed-f14c351aff4b	9223	Dobrovnik/Dobronak 
00050000-5613-971c-e975-851eabd55204	5212	Dobrovo v Brdih
00050000-5613-971c-9bd1-ad758cdfe412	1431	Dol pri Hrastniku
00050000-5613-971c-0b6a-481edf728a85	1262	Dol pri Ljubljani
00050000-5613-971c-80cf-5cb65d4de6e5	1273	Dole pri Litiji
00050000-5613-971c-0998-a1faf0ebec5b	1331	Dolenja vas
00050000-5613-971c-de1d-f221bf0a06c7	8350	Dolenjske Toplice
00050000-5613-971c-0585-900abbe112d3	1230	Domžale
00050000-5613-971c-bdd7-aeb1a99eff2a	2252	Dornava
00050000-5613-971c-c188-0bf8f095e103	5294	Dornberk
00050000-5613-971c-0f5f-e1ca56f60f10	1319	Draga
00050000-5613-971c-a466-2a5c53a848ad	8343	Dragatuš
00050000-5613-971c-404a-87e741ac0b18	3222	Dramlje
00050000-5613-971c-e987-14f672b6e77a	2370	Dravograd
00050000-5613-971c-bca7-565e210882ba	4203	Duplje
00050000-5613-971c-4b29-1b141de25b5c	6221	Dutovlje
00050000-5613-971c-f500-b8d45b7e91e7	8361	Dvor
00050000-5613-971c-c2b1-526f58120d18	2343	Fala
00050000-5613-971c-be87-0158611d388e	9208	Fokovci
00050000-5613-971c-a41e-746c98f77ae9	2313	Fram
00050000-5613-971c-a385-758c3e39ccdf	3213	Frankolovo
00050000-5613-971c-ee4e-61e4452d3a32	1274	Gabrovka
00050000-5613-971c-f86a-f6427ce827a7	8254	Globoko
00050000-5613-971c-a58f-6bc6b4d18d14	5275	Godovič
00050000-5613-971c-7f9b-9c750f67080b	4204	Golnik
00050000-5613-971c-5697-a156501bc337	3303	Gomilsko
00050000-5613-971c-b0c3-a54b7f3d993b	4224	Gorenja vas
00050000-5613-971c-0331-84c0daa35284	3263	Gorica pri Slivnici
00050000-5613-971c-7196-c1a1a86d85ec	2272	Gorišnica
00050000-5613-971c-3acd-97a074f75232	9250	Gornja Radgona
00050000-5613-971c-2ce0-562aacbd9637	3342	Gornji Grad
00050000-5613-971c-406f-fbdc6686d382	4282	Gozd Martuljek
00050000-5613-971c-8043-33fb28d7dde1	6272	Gračišče
00050000-5613-971c-2a5a-d15b0a0c011f	9264	Grad
00050000-5613-971c-9047-b1c8c962c5e2	8332	Gradac
00050000-5613-971c-1a1c-77b7b8cf124b	1384	Grahovo
00050000-5613-971c-adfb-04eb95ab321b	5242	Grahovo ob Bači
00050000-5613-971c-56c9-a2142abf49e0	5251	Grgar
00050000-5613-971c-a58f-d710562339ff	3302	Griže
00050000-5613-971c-9b7d-76f20bae6bb6	3231	Grobelno
00050000-5613-971c-011b-f95d5b3c64f6	1290	Grosuplje
00050000-5613-971c-1864-bc8f34e4d699	2288	Hajdina
00050000-5613-971c-4962-0b25b28b55f7	8362	Hinje
00050000-5613-971c-fa54-80b3a1bd60c9	2311	Hoče
00050000-5613-971c-4c41-a89b2af450b7	9205	Hodoš/Hodos
00050000-5613-971c-a8f7-67215219ca89	1354	Horjul
00050000-5613-971c-b176-2777aca4cfc2	1372	Hotedršica
00050000-5613-971c-2d3f-9d449c50ef77	1430	Hrastnik
00050000-5613-971c-11b7-5a0ba84fbb9e	6225	Hruševje
00050000-5613-971c-4128-ef4bdd24c7bf	4276	Hrušica
00050000-5613-971c-a14f-737e55f8350c	5280	Idrija
00050000-5613-971c-edb6-6d94b5a6b5f9	1292	Ig
00050000-5613-971c-8f26-6db8f2431a75	6250	Ilirska Bistrica
00050000-5613-971c-d423-da1f2d97e962	6251	Ilirska Bistrica-Trnovo
00050000-5613-971c-3069-e839e72af835	1295	Ivančna Gorica
00050000-5613-971c-5f42-8501934546d5	2259	Ivanjkovci
00050000-5613-971c-750c-2227d19f8d8b	1411	Izlake
00050000-5613-971c-5de0-4e801cb58781	6310	Izola/Isola
00050000-5613-971c-b05d-55474f0e83cd	2222	Jakobski Dol
00050000-5613-971c-38ff-001d456aaf7d	2221	Jarenina
00050000-5613-971c-af57-feb8c7d39d92	6254	Jelšane
00050000-5613-971c-e75a-6bf0484ec8c4	4270	Jesenice
00050000-5613-971c-1259-031496ab8242	8261	Jesenice na Dolenjskem
00050000-5613-971c-f0fd-17f160c1d54d	3273	Jurklošter
00050000-5613-971c-99c7-bca4ee91a252	2223	Jurovski Dol
00050000-5613-971c-5194-9ffe65d4f545	2256	Juršinci
00050000-5613-971c-cb2c-6b4fe9b74c14	5214	Kal nad Kanalom
00050000-5613-971c-0b83-c96f1fae4859	3233	Kalobje
00050000-5613-971c-628f-9f2e59f81e31	4246	Kamna Gorica
00050000-5613-971c-b815-82ec4c1d7c04	2351	Kamnica
00050000-5613-971c-a3dd-674f0b8c9528	1241	Kamnik
00050000-5613-971c-e219-64c101ad5aaf	5213	Kanal
00050000-5613-971c-2009-9492dd0219b3	8258	Kapele
00050000-5613-971c-f34f-e2bf9a5a8c54	2362	Kapla
00050000-5613-971c-9263-e8ae109c10d7	2325	Kidričevo
00050000-5613-971c-6ca8-fb1fc57ccee1	1412	Kisovec
00050000-5613-971c-eaf2-9473b61ab798	6253	Knežak
00050000-5613-971c-bb96-58ed68c051c1	5222	Kobarid
00050000-5613-971c-b345-c504c760214f	9227	Kobilje
00050000-5613-971c-39d0-5c173f9305cc	1330	Kočevje
00050000-5613-971c-7a88-710b8982a974	1338	Kočevska Reka
00050000-5613-971c-9ae1-f49ca36e559f	2276	Kog
00050000-5613-971c-e2cb-714be3a6ca7d	5211	Kojsko
00050000-5613-971c-aa12-f7af837a471f	6223	Komen
00050000-5613-971c-b1bf-b7e1870c3b17	1218	Komenda
00050000-5613-971c-2db7-f6cd8956ce2b	6000	Koper/Capodistria 
00050000-5613-971c-9732-8ce15bd66eca	6001	Koper/Capodistria - poštni predali
00050000-5613-971c-ffea-6e6ec9d6c081	8282	Koprivnica
00050000-5613-971c-0a98-14f9799a0fc6	5296	Kostanjevica na Krasu
00050000-5613-971c-7479-91242a3e53af	8311	Kostanjevica na Krki
00050000-5613-971c-9ab6-40856ec7b17f	1336	Kostel
00050000-5613-971c-9ae0-d5cc48917884	6256	Košana
00050000-5613-971c-0056-0e6ac6786144	2394	Kotlje
00050000-5613-971c-8067-9cb58f0d70c7	6240	Kozina
00050000-5613-971c-bccf-211940aa7b35	3260	Kozje
00050000-5613-971c-0c02-41e9f6e021cd	4000	Kranj 
00050000-5613-971c-0956-a74574861aca	4001	Kranj - poštni predali
00050000-5613-971c-9645-e982e32c04f1	4280	Kranjska Gora
00050000-5613-971c-0853-593f9f233bd1	1281	Kresnice
00050000-5613-971c-b387-5c89467b216f	4294	Križe
00050000-5613-971c-6846-c4c12dd70ce9	9206	Križevci
00050000-5613-971c-fee4-c2c87bfb05b2	9242	Križevci pri Ljutomeru
00050000-5613-971c-e03f-3fa58e7c6875	1301	Krka
00050000-5613-971c-44bd-9981994dc7e5	8296	Krmelj
00050000-5613-971c-0e4b-82682dae5468	4245	Kropa
00050000-5613-971c-3e28-7ed316c2101a	8262	Krška vas
00050000-5613-971c-4e9c-aa53f85fa999	8270	Krško
00050000-5613-971c-a730-fa47a3fd678c	9263	Kuzma
00050000-5613-971c-7ee9-3bc5976fd54f	2318	Laporje
00050000-5613-971c-a1a5-961ee38684b2	3270	Laško
00050000-5613-971c-7d5f-8fb5d0636cf8	1219	Laze v Tuhinju
00050000-5613-971c-55e3-0f015e90cf84	2230	Lenart v Slovenskih goricah
00050000-5613-971c-7a28-4d68611fd72b	9220	Lendava/Lendva
00050000-5613-971c-6efa-41cd4e34348c	4248	Lesce
00050000-5613-971c-1a6d-df5879cb90f8	3261	Lesično
00050000-5613-971c-d89f-beba7adddf73	8273	Leskovec pri Krškem
00050000-5613-971c-48c1-48ea84605a90	2372	Libeliče
00050000-5613-971c-055c-dc8a82445163	2341	Limbuš
00050000-5613-971c-c6c3-faf5ed9b8ef4	1270	Litija
00050000-5613-971c-1419-8d0020afde14	3202	Ljubečna
00050000-5613-971c-b91d-fdb034dd1725	1000	Ljubljana 
00050000-5613-971c-5c58-c1191240850e	1001	Ljubljana - poštni predali
00050000-5613-971c-41c8-d5885258544a	1231	Ljubljana - Črnuče
00050000-5613-971c-67ee-f68482f02688	1261	Ljubljana - Dobrunje
00050000-5613-971c-1871-cbca646cf86d	1260	Ljubljana - Polje
00050000-5613-971c-f2ea-20c63cf51d81	1210	Ljubljana - Šentvid
00050000-5613-971c-7cf8-263c5bd9498d	1211	Ljubljana - Šmartno
00050000-5613-971c-c464-b959e7ed94d9	3333	Ljubno ob Savinji
00050000-5613-971c-93d7-78716d624062	9240	Ljutomer
00050000-5613-971c-1881-a327e159990f	3215	Loče
00050000-5613-971c-1b81-8c7e2b44d761	5231	Log pod Mangartom
00050000-5613-971c-66cf-2dae65d9fecd	1358	Log pri Brezovici
00050000-5613-971c-63d5-b813a75dad61	1370	Logatec
00050000-5613-971c-d8bd-6d317926ea91	1371	Logatec
00050000-5613-971c-cd35-c972def992f8	1434	Loka pri Zidanem Mostu
00050000-5613-971c-c76e-b2cd1d28b500	3223	Loka pri Žusmu
00050000-5613-971c-1fa8-a7e00bb023c9	6219	Lokev
00050000-5613-971c-4c58-292e83484e5e	1318	Loški Potok
00050000-5613-971c-da23-99da594c17de	2324	Lovrenc na Dravskem polju
00050000-5613-971c-f95b-62ef75bbad6f	2344	Lovrenc na Pohorju
00050000-5613-971c-1896-122c70a99427	3334	Luče
00050000-5613-971c-326a-183a7f26326f	1225	Lukovica
00050000-5613-971c-1e96-7dfb775a43be	9202	Mačkovci
00050000-5613-971c-1c65-26ddb9e4b534	2322	Majšperk
00050000-5613-971c-4d16-67086cadf297	2321	Makole
00050000-5613-971c-3652-ec2a963eae2a	9243	Mala Nedelja
00050000-5613-971c-ead2-2a87b5d86314	2229	Malečnik
00050000-5613-971c-b691-37208c8e184a	6273	Marezige
00050000-5613-971c-11e5-63f7a407af56	2000	Maribor 
00050000-5613-971c-0360-f0a30e3863ee	2001	Maribor - poštni predali
00050000-5613-971c-d4eb-d6b967a58e69	2206	Marjeta na Dravskem polju
00050000-5613-971c-af17-ae824a001788	2281	Markovci
00050000-5613-971c-f666-9275c8d3e7e0	9221	Martjanci
00050000-5613-971c-e8b3-b371e199f6a8	6242	Materija
00050000-5613-971c-56e4-a0c359621ef9	4211	Mavčiče
00050000-5613-971c-1fc8-35e76271cdbf	1215	Medvode
00050000-5613-971c-4caa-78613e1db0ba	1234	Mengeš
00050000-5613-971c-f1a7-03137e309cc4	8330	Metlika
00050000-5613-971c-7874-20d7aa387ef3	2392	Mežica
00050000-5613-971c-5fb9-40a8f4513342	2204	Miklavž na Dravskem polju
00050000-5613-971c-187f-39f9c3864816	2275	Miklavž pri Ormožu
00050000-5613-971c-09f5-bd044a57a7d3	5291	Miren
00050000-5613-971c-0026-75e57501482c	8233	Mirna
00050000-5613-971c-9153-f2e4c5d9eba3	8216	Mirna Peč
00050000-5613-971c-362c-7fff1d008d27	2382	Mislinja
00050000-5613-971c-b221-8329e320d9cc	4281	Mojstrana
00050000-5613-971c-9a41-489b1c99a426	8230	Mokronog
00050000-5613-971c-a9f7-e9f1889f176b	1251	Moravče
00050000-5613-971c-1e09-f78b36938e24	9226	Moravske Toplice
00050000-5613-971c-54f5-bea59762a0c3	5216	Most na Soči
00050000-5613-971c-e977-8e435a323e50	1221	Motnik
00050000-5613-971c-131a-9d9b7de8769d	3330	Mozirje
00050000-5613-971c-6168-0603b155a1ee	9000	Murska Sobota 
00050000-5613-971c-2a00-0dfc5e989a98	9001	Murska Sobota - poštni predali
00050000-5613-971c-05f7-19e8e615ee7c	2366	Muta
00050000-5613-971c-0c4e-813ab0c1cfb8	4202	Naklo
00050000-5613-971c-959d-d192cad53534	3331	Nazarje
00050000-5613-971c-39e2-9b9907ef7b76	1357	Notranje Gorice
00050000-5613-971c-022c-d9987110eba7	3203	Nova Cerkev
00050000-5613-971c-7acd-065cf38c37ac	5000	Nova Gorica 
00050000-5613-971c-07e2-638cb62696e2	5001	Nova Gorica - poštni predali
00050000-5613-971c-e368-490b5c41a5e9	1385	Nova vas
00050000-5613-971c-3208-62596df327bc	8000	Novo mesto
00050000-5613-971c-a6a1-17ed14d1c2d7	8001	Novo mesto - poštni predali
00050000-5613-971c-c88d-b3643f0c5709	6243	Obrov
00050000-5613-971c-3073-eb3ad74c781a	9233	Odranci
00050000-5613-971c-f555-611975334d2d	2317	Oplotnica
00050000-5613-971c-9a9f-aa0f90d99129	2312	Orehova vas
00050000-5613-971c-3a1d-7cdf44578a2b	2270	Ormož
00050000-5613-971c-7abb-fce426e313c8	1316	Ortnek
00050000-5613-971c-9bfc-2d4698f54c0b	1337	Osilnica
00050000-5613-971c-31f2-b15bd8b31891	8222	Otočec
00050000-5613-971c-8435-b886405ff9b7	2361	Ožbalt
00050000-5613-971c-dbde-fcaa4ca5908f	2231	Pernica
00050000-5613-971c-dccb-ad08d902832a	2211	Pesnica pri Mariboru
00050000-5613-971c-5d8a-da7348027eaa	9203	Petrovci
00050000-5613-971c-12c6-3c70e9e630e8	3301	Petrovče
00050000-5613-971c-5db9-73629ff0575d	6330	Piran/Pirano
00050000-5613-971c-d8e5-775c7a73e6dc	8255	Pišece
00050000-5613-971c-c19b-3a4128352aa6	6257	Pivka
00050000-5613-971c-f998-c7283cb320a4	6232	Planina
00050000-5613-971c-d710-9ea64bf2cd4c	3225	Planina pri Sevnici
00050000-5613-971c-4aa6-3dd89a9377b6	6276	Pobegi
00050000-5613-971c-4dcc-265cd9d8a3b8	8312	Podbočje
00050000-5613-971c-0abc-eded5e63826b	5243	Podbrdo
00050000-5613-971c-7c01-4046ea80d604	3254	Podčetrtek
00050000-5613-971c-f481-4ed0861d8e63	2273	Podgorci
00050000-5613-971c-9130-e7b870a933a6	6216	Podgorje
00050000-5613-971c-f72a-b7089b6436d0	2381	Podgorje pri Slovenj Gradcu
00050000-5613-971c-cfac-06830864389c	6244	Podgrad
00050000-5613-971c-49aa-d7eaa45f4b27	1414	Podkum
00050000-5613-971c-89c9-9d8427f37169	2286	Podlehnik
00050000-5613-971c-8271-0d73e530ab2b	5272	Podnanos
00050000-5613-971c-264b-f12155b6e524	4244	Podnart
00050000-5613-971c-0011-c3f129b27a94	3241	Podplat
00050000-5613-971c-8d72-456a28fc3fb7	3257	Podsreda
00050000-5613-971c-dd80-cfb86cc5452e	2363	Podvelka
00050000-5613-971c-ada7-132b6266a64b	2208	Pohorje
00050000-5613-971c-b5c3-afcbaef8189d	2257	Polenšak
00050000-5613-971c-f2f1-da98d37e3f9d	1355	Polhov Gradec
00050000-5613-971c-5dce-7ccb07c3f316	4223	Poljane nad Škofjo Loko
00050000-5613-971c-3aba-cddd385da665	2319	Poljčane
00050000-5613-971c-fffb-f5181fc95e15	1272	Polšnik
00050000-5613-971c-eead-fafca5c29469	3313	Polzela
00050000-5613-971c-7be0-94d975671299	3232	Ponikva
00050000-5613-971c-be29-581615ed3a25	6320	Portorož/Portorose
00050000-5613-971c-cf42-01b921eaeefd	6230	Postojna
00050000-5613-971c-3cb1-fb5a80a16264	2331	Pragersko
00050000-5613-971c-00a0-00f97e3753fb	3312	Prebold
00050000-5613-971c-8877-2e46042e8941	4205	Preddvor
00050000-5613-971c-163a-a28f1a488877	6255	Prem
00050000-5613-971c-1eb7-1891bb6ff062	1352	Preserje
00050000-5613-971c-a4c4-23b270f82aff	6258	Prestranek
00050000-5613-971c-19f3-22b47028895c	2391	Prevalje
00050000-5613-971c-f57b-19754602825a	3262	Prevorje
00050000-5613-971c-f06c-77e18e0ad8f0	1276	Primskovo 
00050000-5613-971c-fb9c-6d1311d443d7	3253	Pristava pri Mestinju
00050000-5613-971c-d050-e6e576c478f2	9207	Prosenjakovci/Partosfalva
00050000-5613-971c-b165-6a788ba0f69a	5297	Prvačina
00050000-5613-971c-6b95-c4f4164f6072	2250	Ptuj
00050000-5613-971c-9936-64936f5e3fb3	2323	Ptujska Gora
00050000-5613-971c-69db-a5de9e5896ac	9201	Puconci
00050000-5613-971c-15a8-5b386cb06595	2327	Rače
00050000-5613-971c-d1c2-17a4d5215b62	1433	Radeče
00050000-5613-971c-7c2b-bec78e85d18b	9252	Radenci
00050000-5613-971c-4bac-0b85d6a1978d	2360	Radlje ob Dravi
00050000-5613-971c-d287-3b5b29de77be	1235	Radomlje
00050000-5613-971c-cef7-ca8f7c167cc7	4240	Radovljica
00050000-5613-971c-2391-b5589a35ae1c	8274	Raka
00050000-5613-971c-e50c-f74b76ccac45	1381	Rakek
00050000-5613-971c-dd02-0d392645f7b0	4283	Rateče - Planica
00050000-5613-971c-fd45-4891af7aa109	2390	Ravne na Koroškem
00050000-5613-971c-6b9c-00e7e07c18f5	9246	Razkrižje
00050000-5613-971c-73c3-c8ed113be0da	3332	Rečica ob Savinji
00050000-5613-971c-d59a-70dc9d2ca11a	5292	Renče
00050000-5613-971c-335d-b36c2438763a	1310	Ribnica
00050000-5613-971c-3e94-000b7d3296a0	2364	Ribnica na Pohorju
00050000-5613-971c-440c-487a53713698	3272	Rimske Toplice
00050000-5613-971c-dfb1-23dd4020283c	1314	Rob
00050000-5613-971c-c90b-97d9aceb5051	5215	Ročinj
00050000-5613-971c-22b0-f10d002b2b46	3250	Rogaška Slatina
00050000-5613-971c-531b-2d8194b10446	9262	Rogašovci
00050000-5613-971c-b5a5-cb6b76faeb26	3252	Rogatec
00050000-5613-971c-3d7e-dafcfbd0b6ad	1373	Rovte
00050000-5613-971c-b0de-f8006f688cdd	2342	Ruše
00050000-5613-971c-0844-00e76c504972	1282	Sava
00050000-5613-971c-39f5-42b2d5b20a09	6333	Sečovlje/Sicciole
00050000-5613-971c-8f10-793e8fc356b3	4227	Selca
00050000-5613-971c-64c7-42692cc03492	2352	Selnica ob Dravi
00050000-5613-971c-395e-28222f5187e9	8333	Semič
00050000-5613-971c-3121-864cc5c15944	8281	Senovo
00050000-5613-971c-a6ab-386fefc0e29a	6224	Senožeče
00050000-5613-971c-d2ea-fb31637e96a5	8290	Sevnica
00050000-5613-971c-d9b2-3bc3c0d2ae7b	6210	Sežana
00050000-5613-971c-8ecf-35e7d7a6f0fd	2214	Sladki Vrh
00050000-5613-971c-f9db-41e0edd29b56	5283	Slap ob Idrijci
00050000-5613-971c-e805-2c18ac9301f2	2380	Slovenj Gradec
00050000-5613-971c-6b21-3e642fc38ecf	2310	Slovenska Bistrica
00050000-5613-971c-3d4c-d5bf2f28f673	3210	Slovenske Konjice
00050000-5613-971c-9198-9d73872a0a61	1216	Smlednik
00050000-5613-971c-9d49-b6787ce3e1f6	5232	Soča
00050000-5613-971c-9b89-6963681602ba	1317	Sodražica
00050000-5613-971c-51e2-42ba1ffb2f6e	3335	Solčava
00050000-5613-971c-96db-794bc119e6f3	5250	Solkan
00050000-5613-971c-f37e-587c57fd5d3f	4229	Sorica
00050000-5613-971c-1e2e-99018661d5ce	4225	Sovodenj
00050000-5613-971c-5c36-c29049a55ddf	5281	Spodnja Idrija
00050000-5613-971c-d2ed-203d2dd025d2	2241	Spodnji Duplek
00050000-5613-971c-5d56-89f76101698d	9245	Spodnji Ivanjci
00050000-5613-971c-46c0-4c1ec352b7ba	2277	Središče ob Dravi
00050000-5613-971c-358b-949ade28e88f	4267	Srednja vas v Bohinju
00050000-5613-971c-8e31-1222b72efbd1	8256	Sromlje 
00050000-5613-971c-ed27-edb2fa63ce56	5224	Srpenica
00050000-5613-971c-8840-9d44e689a32c	1242	Stahovica
00050000-5613-971c-ae50-6cf9f5fee7b7	1332	Stara Cerkev
00050000-5613-971c-d384-49752fdb8ede	8342	Stari trg ob Kolpi
00050000-5613-971c-e629-d348840478a7	1386	Stari trg pri Ložu
00050000-5613-971c-619a-1c4e869cf2bf	2205	Starše
00050000-5613-971c-8d81-1f9868b56101	2289	Stoperce
00050000-5613-971c-dff0-12fbac62a7d5	8322	Stopiče
00050000-5613-971c-5f83-cd6d1fa705fa	3206	Stranice
00050000-5613-971c-01a7-355077a7fd3f	8351	Straža
00050000-5613-971c-b5b6-23130dda140c	1313	Struge
00050000-5613-971c-dbbf-793a7f10e656	8293	Studenec
00050000-5613-971c-e819-27b03120600d	8331	Suhor
00050000-5613-971c-f51a-5e966164f3ae	2233	Sv. Ana v Slovenskih goricah
00050000-5613-971c-f0ed-a01800b2fc90	2235	Sv. Trojica v Slovenskih goricah
00050000-5613-971c-94a2-8425795ffe79	2353	Sveti Duh na Ostrem Vrhu
00050000-5613-971c-6559-fb29cf47a828	9244	Sveti Jurij ob Ščavnici
00050000-5613-971c-c9fb-d5b73021ec5b	3264	Sveti Štefan
00050000-5613-971c-2107-029ee049f736	2258	Sveti Tomaž
00050000-5613-971c-3b4f-185f076d606a	9204	Šalovci
00050000-5613-971c-7a08-9a1fd8d35fa5	5261	Šempas
00050000-5613-971c-0152-d6f0bdf21378	5290	Šempeter pri Gorici
00050000-5613-971c-8933-3d2efd4e843c	3311	Šempeter v Savinjski dolini
00050000-5613-971c-6505-f0d6f8423dd7	4208	Šenčur
00050000-5613-971c-25e5-ba5d6f6cee79	2212	Šentilj v Slovenskih goricah
00050000-5613-971c-b078-0cfe8ef7b208	8297	Šentjanž
00050000-5613-971c-93c8-ef1c015dc5e0	2373	Šentjanž pri Dravogradu
00050000-5613-971c-6403-82a3fd0aa194	8310	Šentjernej
00050000-5613-971c-07e9-812b8bcc19c7	3230	Šentjur
00050000-5613-971c-cb0d-1c87d1ae890b	3271	Šentrupert
00050000-5613-971c-931a-c9cd20e9df28	8232	Šentrupert
00050000-5613-971c-d39b-5640749c7a34	1296	Šentvid pri Stični
00050000-5613-971c-0be4-eb0efa95a9e8	8275	Škocjan
00050000-5613-971c-89f9-1b461bbb77ec	6281	Škofije
00050000-5613-971c-d726-59ac2ef4c76e	4220	Škofja Loka
00050000-5613-971c-cc67-06626ddcafdf	3211	Škofja vas
00050000-5613-971c-f162-0b7200a91a52	1291	Škofljica
00050000-5613-971c-2959-97e4dd9b093c	6274	Šmarje
00050000-5613-971c-920a-b1bbba59b571	1293	Šmarje - Sap
00050000-5613-971c-ca12-3a83e551a85a	3240	Šmarje pri Jelšah
00050000-5613-971c-39a1-b268fe10b659	8220	Šmarješke Toplice
00050000-5613-971c-2e8e-6b081d576c36	2315	Šmartno na Pohorju
00050000-5613-971c-d157-9ff1059de0f8	3341	Šmartno ob Dreti
00050000-5613-971c-64dc-3204819b3390	3327	Šmartno ob Paki
00050000-5613-971c-3d07-e8b563df1e8a	1275	Šmartno pri Litiji
00050000-5613-971c-4939-6b186d310bb7	2383	Šmartno pri Slovenj Gradcu
00050000-5613-971c-8c22-0f4189c606ea	3201	Šmartno v Rožni dolini
00050000-5613-971c-5ed9-6fadd742607c	3325	Šoštanj
00050000-5613-971c-7a87-576874b2babc	6222	Štanjel
00050000-5613-971c-2907-bd577de05c4d	3220	Štore
00050000-5613-971c-0631-e1f106e2a5c6	3304	Tabor
00050000-5613-971c-abee-831953357984	3221	Teharje
00050000-5613-971c-a9d3-2930ae87fd51	9251	Tišina
00050000-5613-971c-20b0-f99f5bbd493f	5220	Tolmin
00050000-5613-971c-5a80-268329f7fb79	3326	Topolšica
00050000-5613-971c-6980-f8be506b5541	2371	Trbonje
00050000-5613-971c-4368-ea94b726a2d7	1420	Trbovlje
00050000-5613-971c-9325-1f162880310e	8231	Trebelno 
00050000-5613-971c-ee6f-7d975f6e11f7	8210	Trebnje
00050000-5613-971c-1261-e9290edb6b45	5252	Trnovo pri Gorici
00050000-5613-971c-3290-29d4f02dc1a6	2254	Trnovska vas
00050000-5613-971c-9da4-859cc4a4e5bd	1222	Trojane
00050000-5613-971c-f6de-b7460fc97964	1236	Trzin
00050000-5613-971c-894c-b3f2d0c68965	4290	Tržič
00050000-5613-971c-eb21-6ee055fb5c49	8295	Tržišče
00050000-5613-971c-1c5d-cf21e7406e18	1311	Turjak
00050000-5613-971c-6085-8c36d0cc8a26	9224	Turnišče
00050000-5613-971c-062d-217ac81611ef	8323	Uršna sela
00050000-5613-971c-9419-7a95940f074d	1252	Vače
00050000-5613-971c-2582-23b05f7c92a1	3320	Velenje 
00050000-5613-971c-c2ec-00b80ec29055	3322	Velenje - poštni predali
00050000-5613-971c-f075-9a3da61c9f6d	8212	Velika Loka
00050000-5613-971c-12f4-3690b5d7ebd2	2274	Velika Nedelja
00050000-5613-971c-b23a-f450d37c339b	9225	Velika Polana
00050000-5613-971c-e8fd-8fa9dcf87730	1315	Velike Lašče
00050000-5613-971c-7cc2-e3dcc7096dd6	8213	Veliki Gaber
00050000-5613-971c-d8ec-8c2eee6b10ed	9241	Veržej
00050000-5613-971c-fa26-384e5bee4142	1312	Videm - Dobrepolje
00050000-5613-971c-e526-f6cd6b893abe	2284	Videm pri Ptuju
00050000-5613-971c-1f24-adb35ded71c4	8344	Vinica
00050000-5613-971c-a3a1-ce938522d896	5271	Vipava
00050000-5613-971c-dc00-627734b72c13	4212	Visoko
00050000-5613-971c-3d95-3594f0eaadc7	1294	Višnja Gora
00050000-5613-971c-6af8-328dc24e906a	3205	Vitanje
00050000-5613-971c-197f-8b91eb3689d9	2255	Vitomarci
00050000-5613-971c-5b45-0bcffeaa516b	1217	Vodice
00050000-5613-971c-e589-74a92711ba1d	3212	Vojnik\t
00050000-5613-971c-874d-1761937ee63c	5293	Volčja Draga
00050000-5613-971c-496b-249f2f25a81f	2232	Voličina
00050000-5613-971c-96be-13cc13bcc1dd	3305	Vransko
00050000-5613-971c-5dec-480c38c67dbf	6217	Vremski Britof
00050000-5613-971c-0c32-90ae01302fbd	1360	Vrhnika
00050000-5613-971c-b4c9-331e0f0538de	2365	Vuhred
00050000-5613-971c-7a8f-59a7b4aa67b5	2367	Vuzenica
00050000-5613-971c-21ba-24a535bb93cd	8292	Zabukovje 
00050000-5613-971c-f39a-a386bbf31163	1410	Zagorje ob Savi
00050000-5613-971c-1de3-6cb70591c40f	1303	Zagradec
00050000-5613-971c-afa6-5c35a5c889d8	2283	Zavrč
00050000-5613-971c-ebf9-f7a0b447e6df	8272	Zdole 
00050000-5613-971c-b444-65d7a5acd85f	4201	Zgornja Besnica
00050000-5613-971c-6a04-8e14684af840	2242	Zgornja Korena
00050000-5613-971c-a2be-87383c7b3e9c	2201	Zgornja Kungota
00050000-5613-971c-bcdc-761eb30cc088	2316	Zgornja Ložnica
00050000-5613-971c-da36-f0997e61fb3f	2314	Zgornja Polskava
00050000-5613-971c-f99a-4160883d00ab	2213	Zgornja Velka
00050000-5613-971c-29c2-7030375df54a	4247	Zgornje Gorje
00050000-5613-971c-7433-313b0c705d55	4206	Zgornje Jezersko
00050000-5613-971c-cfd6-00e60cd31d84	2285	Zgornji Leskovec
00050000-5613-971c-9fd0-d32efb4ece88	1432	Zidani Most
00050000-5613-971c-ba45-003a5ad01d39	3214	Zreče
00050000-5613-971c-d6b7-cb5786ce24ab	4209	Žabnica
00050000-5613-971c-dbe0-1a5d2cdc109c	3310	Žalec
00050000-5613-971c-52f0-15e518f9d724	4228	Železniki
00050000-5613-971c-1664-c7bfb9d920f0	2287	Žetale
00050000-5613-971c-b079-f2b97f24a575	4226	Žiri
00050000-5613-971c-955d-de4592e90270	4274	Žirovnica
00050000-5613-971c-bdb8-751064e68f67	8360	Žužemberk
\.


--
-- TOC entry 3031 (class 0 OID 21343039)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 21342658)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 21342438)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5613-971e-08b0-9c442b00aca6	00080000-5613-971e-5da2-33314d8aa50d	\N	00040000-5613-971c-7f0a-b05b33cd9502	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5613-971e-4aea-64613892f17f	00080000-5613-971e-5da2-33314d8aa50d	\N	00040000-5613-971c-7f0a-b05b33cd9502	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5613-971e-cc23-ae9db1721309	00080000-5613-971e-5c93-c92e791493a4	\N	00040000-5613-971c-7f0a-b05b33cd9502	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2993 (class 0 OID 21342542)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 21342670)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 21343053)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 21343063)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5613-971e-9574-6466064ff31e	00080000-5613-971e-6840-de44cd054d1d	0987	AK
00190000-5613-971e-9ca7-cb661eb1faed	00080000-5613-971e-5c93-c92e791493a4	0989	AK
00190000-5613-971e-2e71-c7edcb958c39	00080000-5613-971e-dde0-70b57cee6cc9	0986	AK
00190000-5613-971e-5987-04e328293455	00080000-5613-971e-dcb6-a2b87d4f23ab	0984	AK
00190000-5613-971e-a90e-164e4a4092a1	00080000-5613-971e-c4f2-4d9c42297100	0983	AK
00190000-5613-971e-4593-6823b4fc0034	00080000-5613-971e-051c-cc855d6b9e7b	0982	AK
00190000-5613-971f-7207-2cc1e5e5a352	00080000-5613-971f-58d3-fad7d4b04d72	1001	AK
\.


--
-- TOC entry 3030 (class 0 OID 21342996)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5613-971e-48ec-c93b5c74cd21	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3034 (class 0 OID 21343071)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 21342699)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5613-971e-ab1c-228188b403b0	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5613-971e-838f-ae15c3498b98	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5613-971e-e66f-eeb40404f81c	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5613-971e-bbb3-a95089a5bea0	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5613-971e-7cec-e51879bfe6ee	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5613-971e-34e3-d688440daf06	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5613-971e-bf87-ba61b78f3158	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3002 (class 0 OID 21342643)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 21342633)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 21342843)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 21342773)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 21342516)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 21342311)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5613-971f-58d3-fad7d4b04d72	00010000-5613-971d-112d-72cd3415ccf2	2015-10-06 11:40:47	INS	a:0:{}
2	App\\Entity\\Option	00000000-5613-971f-414b-e0aa66ef51e1	00010000-5613-971d-112d-72cd3415ccf2	2015-10-06 11:40:47	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5613-971f-7207-2cc1e5e5a352	00010000-5613-971d-112d-72cd3415ccf2	2015-10-06 11:40:47	INS	a:0:{}
\.


--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3011 (class 0 OID 21342712)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 21342349)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5613-971c-f783-573eeb87e234	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5613-971c-4560-9f5f22227d98	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5613-971c-7279-5594a429f188	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5613-971c-52f1-64856cb8770e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5613-971d-af92-bcb23be70d34	planer	Planer dogodkov v koledarju	t
00020000-5613-971d-609b-e964877f1955	kadrovska	Kadrovska služba	t
00020000-5613-971d-48be-695c186378c5	arhivar	Ažuriranje arhivalij	t
00020000-5613-971d-5d15-bc27eb551dfe	igralec	Igralec	t
00020000-5613-971d-81fa-8a83547b4593	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5613-971e-7149-2e574ace7f5d	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2976 (class 0 OID 21342333)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5613-971d-2cd2-239961e9cca5	00020000-5613-971c-7279-5594a429f188
00010000-5613-971d-112d-72cd3415ccf2	00020000-5613-971c-7279-5594a429f188
00010000-5613-971e-368f-4e2f5adb14ca	00020000-5613-971e-7149-2e574ace7f5d
\.


--
-- TOC entry 3013 (class 0 OID 21342726)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 21342664)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 21342610)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 21342298)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5613-971c-e4ef-370ad3aa7767	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5613-971c-6aec-288bdd573d15	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5613-971c-425e-4aaaa7ca41a9	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5613-971c-c18b-e6e23217b5f1	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5613-971c-f0d9-d60a1b1d5c6d	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2971 (class 0 OID 21342290)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5613-971c-148a-a480530bde1e	00230000-5613-971c-c18b-e6e23217b5f1	popa
00240000-5613-971c-383d-53b589f30a30	00230000-5613-971c-c18b-e6e23217b5f1	oseba
00240000-5613-971c-9798-544c7b7ee4a4	00230000-5613-971c-c18b-e6e23217b5f1	sezona
00240000-5613-971c-f0db-4bbb33336153	00230000-5613-971c-6aec-288bdd573d15	prostor
00240000-5613-971c-4921-e4a3cffebb5f	00230000-5613-971c-c18b-e6e23217b5f1	besedilo
00240000-5613-971c-c772-0e197cadd7b9	00230000-5613-971c-c18b-e6e23217b5f1	uprizoritev
00240000-5613-971c-cc09-22732195e641	00230000-5613-971c-c18b-e6e23217b5f1	funkcija
00240000-5613-971c-8418-00cc47e307ed	00230000-5613-971c-c18b-e6e23217b5f1	tipfunkcije
00240000-5613-971c-2684-3983da075ddc	00230000-5613-971c-c18b-e6e23217b5f1	alternacija
00240000-5613-971c-b819-b67871f22f92	00230000-5613-971c-e4ef-370ad3aa7767	pogodba
00240000-5613-971c-618b-ee4f76f7459b	00230000-5613-971c-c18b-e6e23217b5f1	zaposlitev
00240000-5613-971c-b557-914be4de1131	00230000-5613-971c-c18b-e6e23217b5f1	zvrstuprizoritve
00240000-5613-971c-bcca-1293a823060f	00230000-5613-971c-e4ef-370ad3aa7767	programdela
00240000-5613-971c-8773-0fe3f0fe751b	00230000-5613-971c-c18b-e6e23217b5f1	zapis
\.


--
-- TOC entry 2970 (class 0 OID 21342285)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
a1c6134c-b948-4065-b2b3-a859fab51bb0	00240000-5613-971c-148a-a480530bde1e	0	1001
\.


--
-- TOC entry 3019 (class 0 OID 21342790)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5613-971e-a6b6-a931f30a0fa7	000e0000-5613-971e-2f4a-d204b77f2a91	00080000-5613-971e-5da2-33314d8aa50d	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5613-971c-8641-bf9b7f2aca48
00270000-5613-971e-90da-fac904e7aeb1	000e0000-5613-971e-2f4a-d204b77f2a91	00080000-5613-971e-5da2-33314d8aa50d	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5613-971c-8641-bf9b7f2aca48
\.


--
-- TOC entry 2983 (class 0 OID 21342411)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 21342620)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5613-971e-a60c-16e2c2692ba1	00180000-5613-971e-3975-a3c95854392d	000c0000-5613-971e-be9d-55d7ad33fa5a	00090000-5613-971e-daaf-93d1a7813176	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5613-971e-0be9-bb772a3fa521	00180000-5613-971e-3975-a3c95854392d	000c0000-5613-971e-ba5a-674b1788234a	00090000-5613-971e-30cc-8337f37e2cdf	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5613-971e-27ca-7665d975561e	00180000-5613-971e-3975-a3c95854392d	000c0000-5613-971e-3f4b-3452834df03f	00090000-5613-971e-0537-93814b82763a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5613-971e-3ac3-5acc4b1bfaf4	00180000-5613-971e-3975-a3c95854392d	000c0000-5613-971e-7763-e2b4470a38ce	00090000-5613-971e-e6f3-0dcf37a56d6b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5613-971e-6aa2-97cc3fe56ade	00180000-5613-971e-3975-a3c95854392d	000c0000-5613-971e-68cf-118794af8fe7	00090000-5613-971e-c1f4-bd98b3dd170d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5613-971e-28d5-c7139e06f8ca	00180000-5613-971e-5646-e270022f3b4d	\N	00090000-5613-971e-c1f4-bd98b3dd170d	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3022 (class 0 OID 21342831)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5613-971c-ba44-7af0d1adb7f8	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5613-971c-58d3-830968cf871f	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5613-971c-92d9-14489d88e334	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5613-971c-7604-7dc011ea3163	04	Režija	Režija	Režija	umetnik	30
000f0000-5613-971c-7c41-3a6ed581b333	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5613-971c-927d-d11bf1b719d4	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5613-971c-6613-4bdc35958380	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5613-971c-33d7-114de08845db	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5613-971c-d456-a91738d364df	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5613-971c-69f3-889f9e2d3a07	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5613-971c-af25-6fa503ae26c9	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5613-971c-9cdc-f0d8ed010cf6	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5613-971c-9fad-8777c7397064	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5613-971c-ef8c-113dabb5caad	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5613-971c-1196-1c64e28dd0d8	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5613-971c-5fcf-181fb7ca4173	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5613-971c-1d53-2c39fb43bbbf	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5613-971c-ef41-3e52bd4aa334	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3035 (class 0 OID 21343082)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5613-971c-82de-9db830e2022b	01	Velika predstava	f	1.00	1.00
002b0000-5613-971c-c6c4-18b5e8b74ca7	02	Mala predstava	f	0.50	0.50
002b0000-5613-971c-75d7-7c5bc5cd3d78	03	Mala koprodukcija	t	0.40	1.00
002b0000-5613-971c-b45f-840a62d7967d	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5613-971c-2bf9-cbc65ab52366	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2988 (class 0 OID 21342473)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2975 (class 0 OID 21342320)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5613-971d-112d-72cd3415ccf2	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROGo.KAJeOH6YSNmOEj.W95OLeCRIgfsu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5613-971e-e617-64ebdec060d5	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5613-971e-5a7e-ec4aff4cf013	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5613-971e-d384-929a61a1d44b	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5613-971e-4b9b-b190a4d97bae	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5613-971e-2cda-9224d5eb88a2	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5613-971e-5d6d-b96e31e988b0	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5613-971e-55c9-7ea0b0d3d338	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5613-971e-3fbb-f59f4565da6f	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5613-971e-bba2-181f57abdcca	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5613-971e-368f-4e2f5adb14ca	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5613-971d-2cd2-239961e9cca5	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3026 (class 0 OID 21342881)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5613-971e-bfe3-333c04324c5d	00160000-5613-971e-988f-4cf858e31348	\N	00140000-5613-971c-8218-5b875c66af27	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5613-971e-7cec-e51879bfe6ee
000e0000-5613-971e-2f4a-d204b77f2a91	00160000-5613-971e-4a17-0a3d2a487677	\N	00140000-5613-971c-0753-5aa7368bc306	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5613-971e-34e3-d688440daf06
000e0000-5613-971e-bbbb-9c01aa2c7540	\N	\N	00140000-5613-971c-0753-5aa7368bc306	00190000-5613-971e-9574-6466064ff31e	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5613-971e-7cec-e51879bfe6ee
000e0000-5613-971e-e1d7-0db746b49d18	\N	\N	00140000-5613-971c-0753-5aa7368bc306	00190000-5613-971e-9574-6466064ff31e	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5613-971e-7cec-e51879bfe6ee
000e0000-5613-971e-612e-889e30cfb57a	\N	\N	00140000-5613-971c-0753-5aa7368bc306	00190000-5613-971e-9574-6466064ff31e	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5613-971e-ab1c-228188b403b0
000e0000-5613-971e-7845-a7628c830431	\N	\N	00140000-5613-971c-0753-5aa7368bc306	00190000-5613-971e-9574-6466064ff31e	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5613-971e-ab1c-228188b403b0
\.


--
-- TOC entry 2995 (class 0 OID 21342564)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5613-971e-12fb-b4317f683d86	000e0000-5613-971e-2f4a-d204b77f2a91	\N	1	
00200000-5613-971e-f098-4291a7d76578	000e0000-5613-971e-2f4a-d204b77f2a91	\N	2	
00200000-5613-971e-901c-2b3ff02697a0	000e0000-5613-971e-2f4a-d204b77f2a91	\N	3	
00200000-5613-971e-5d42-638f5a5ac753	000e0000-5613-971e-2f4a-d204b77f2a91	\N	4	
00200000-5613-971e-6dbc-5f3641202653	000e0000-5613-971e-2f4a-d204b77f2a91	\N	5	
\.


--
-- TOC entry 3009 (class 0 OID 21342691)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 21342804)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5613-971c-12c4-d3eeed166ead	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5613-971c-a5c0-1226963765bb	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5613-971c-69c4-8d7ec5e8e26e	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5613-971c-070c-aceb96b64008	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5613-971c-76c8-4d2725057f1c	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5613-971c-168c-0e48a4ca39aa	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5613-971c-c693-84ddd54c9700	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5613-971c-c6cc-48cd2222cd17	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5613-971c-8641-bf9b7f2aca48	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5613-971c-d74b-786b19c956b0	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5613-971c-c7de-2aeb37c65165	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5613-971c-9827-ef9125311bd6	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5613-971c-639f-87191dc8d878	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5613-971c-cbf9-389778a4636d	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5613-971c-148c-cc6099d21d22	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5613-971c-c0b9-3a803c53185f	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5613-971c-9ed5-361dce0382c7	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5613-971c-31a6-47926e4fd80f	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5613-971c-e814-54bbd8da82bf	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5613-971c-c3ed-263263bcf641	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5613-971c-81f8-dc05710af8e9	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5613-971c-0f6a-37048674e03f	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5613-971c-530f-a14bebd27356	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5613-971c-f259-c3d748aea040	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5613-971c-9ab8-5e4964309ecb	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5613-971c-6daa-3df2bccddb1c	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5613-971c-865a-1f945aacd297	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5613-971c-e1b3-8a75cef2b478	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3038 (class 0 OID 21343129)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 21343101)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 21343141)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 21342763)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5613-971e-6429-f34770092209	00090000-5613-971e-30cc-8337f37e2cdf	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-5613-971e-620a-83153834a2c3	00090000-5613-971e-0537-93814b82763a	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-5613-971e-a1c9-88578cde95e8	00090000-5613-971e-a90b-c2d833cf483d	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-5613-971e-1d13-a63384793387	00090000-5613-971e-d83e-83aa6ce0bec5	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-5613-971e-bc0d-fd7dd4a63143	00090000-5613-971e-daaf-93d1a7813176	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-5613-971e-f5cb-9874ef4790bd	00090000-5613-971e-297a-5728cebcac77	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 2997 (class 0 OID 21342599)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 21342871)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5613-971c-8218-5b875c66af27	01	Drama	drama (SURS 01)
00140000-5613-971c-b5a7-8a71ff29e4f2	02	Opera	opera (SURS 02)
00140000-5613-971c-a882-3c31963edeea	03	Balet	balet (SURS 03)
00140000-5613-971c-08d2-5b1820df6b49	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5613-971c-df77-a4c990324ad4	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5613-971c-0753-5aa7368bc306	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5613-971c-8656-a42f21389945	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3015 (class 0 OID 21342753)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2502 (class 2606 OID 21342374)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 21342930)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 21342920)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 21342787)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 21342829)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2751 (class 2606 OID 21343181)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 21342588)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 21342609)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 21343099)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 21342499)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 21342990)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 21342749)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 21342562)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 21342537)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 21342513)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 21342656)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 21343158)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 21343165)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2756 (class 2606 OID 21343189)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 21093462)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2614 (class 2606 OID 21342683)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 21342471)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 21342383)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 21342407)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 21342363)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2493 (class 2606 OID 21342348)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 21342689)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 21342725)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 21342866)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 21342435)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 21342459)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 21343051)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 21342662)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 21342449)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 21342550)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 21342674)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 21343060)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 21343068)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 21343038)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 21343080)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 21342707)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 21342647)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 21342638)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 21342853)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 21342780)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 21342525)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 21342319)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 21342716)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 21342337)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2495 (class 2606 OID 21342357)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 21342734)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 21342669)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 21342618)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 21342307)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 21342295)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 21342289)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 21342800)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 21342416)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 21342629)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 21342840)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 21343092)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 21342484)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 21342332)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 21342899)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 21342572)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 21342697)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 21342812)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 21343139)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 21343123)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 21343147)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 21342771)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 21342603)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 21342879)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 21342761)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 1259 OID 21342597)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2567 (class 1259 OID 21342598)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2568 (class 1259 OID 21342596)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2569 (class 1259 OID 21342595)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2570 (class 1259 OID 21342594)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2656 (class 1259 OID 21342801)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2657 (class 1259 OID 21342802)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2658 (class 1259 OID 21342803)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2742 (class 1259 OID 21343160)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2743 (class 1259 OID 21343159)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2516 (class 1259 OID 21342437)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2615 (class 1259 OID 21342690)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2729 (class 1259 OID 21343127)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2730 (class 1259 OID 21343126)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2731 (class 1259 OID 21343128)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2732 (class 1259 OID 21343125)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2733 (class 1259 OID 21343124)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2609 (class 1259 OID 21342676)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2610 (class 1259 OID 21342675)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2561 (class 1259 OID 21342573)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2639 (class 1259 OID 21342750)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2640 (class 1259 OID 21342752)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2641 (class 1259 OID 21342751)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2541 (class 1259 OID 21342515)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2542 (class 1259 OID 21342514)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2720 (class 1259 OID 21343081)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2672 (class 1259 OID 21342868)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 21342869)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2674 (class 1259 OID 21342870)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2739 (class 1259 OID 21343148)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2681 (class 1259 OID 21342904)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2682 (class 1259 OID 21342901)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2683 (class 1259 OID 21342905)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2684 (class 1259 OID 21342903)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2685 (class 1259 OID 21342902)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2531 (class 1259 OID 21342486)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2532 (class 1259 OID 21342485)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2507 (class 1259 OID 21342410)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2627 (class 1259 OID 21342717)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2497 (class 1259 OID 21342364)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2498 (class 1259 OID 21342365)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2632 (class 1259 OID 21342737)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2633 (class 1259 OID 21342736)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2634 (class 1259 OID 21342735)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2554 (class 1259 OID 21342551)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2555 (class 1259 OID 21342552)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2477 (class 1259 OID 21342297)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2589 (class 1259 OID 21342642)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2590 (class 1259 OID 21342640)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2591 (class 1259 OID 21342639)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2592 (class 1259 OID 21342641)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2488 (class 1259 OID 21342338)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2489 (class 1259 OID 21342339)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2618 (class 1259 OID 21342698)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2752 (class 1259 OID 21343182)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2654 (class 1259 OID 21342789)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2655 (class 1259 OID 21342788)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2753 (class 1259 OID 21343190)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2754 (class 1259 OID 21343191)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2604 (class 1259 OID 21342663)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2648 (class 1259 OID 21342781)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2649 (class 1259 OID 21342782)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2702 (class 1259 OID 21342995)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2703 (class 1259 OID 21342994)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2704 (class 1259 OID 21342991)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2705 (class 1259 OID 21342992)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2706 (class 1259 OID 21342993)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2520 (class 1259 OID 21342451)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2521 (class 1259 OID 21342450)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2522 (class 1259 OID 21342452)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2621 (class 1259 OID 21342711)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2622 (class 1259 OID 21342710)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2712 (class 1259 OID 21343061)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2713 (class 1259 OID 21343062)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2695 (class 1259 OID 21342934)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2696 (class 1259 OID 21342935)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2697 (class 1259 OID 21342932)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2698 (class 1259 OID 21342933)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2645 (class 1259 OID 21342772)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2595 (class 1259 OID 21342651)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2596 (class 1259 OID 21342650)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2597 (class 1259 OID 21342648)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2598 (class 1259 OID 21342649)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2691 (class 1259 OID 21342922)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2692 (class 1259 OID 21342921)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2545 (class 1259 OID 21342526)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2548 (class 1259 OID 21342540)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2549 (class 1259 OID 21342539)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2550 (class 1259 OID 21342538)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2551 (class 1259 OID 21342541)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2560 (class 1259 OID 21342563)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2709 (class 1259 OID 21343052)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2728 (class 1259 OID 21343100)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2746 (class 1259 OID 21343166)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2747 (class 1259 OID 21343167)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2503 (class 1259 OID 21342385)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2504 (class 1259 OID 21342384)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2512 (class 1259 OID 21342417)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2513 (class 1259 OID 21342418)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2576 (class 1259 OID 21342604)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2584 (class 1259 OID 21342632)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2585 (class 1259 OID 21342631)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2586 (class 1259 OID 21342630)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2571 (class 1259 OID 21342590)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2572 (class 1259 OID 21342591)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2573 (class 1259 OID 21342589)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2574 (class 1259 OID 21342593)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2575 (class 1259 OID 21342592)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2519 (class 1259 OID 21342436)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 21342500)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2538 (class 1259 OID 21342502)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2539 (class 1259 OID 21342501)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2540 (class 1259 OID 21342503)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2603 (class 1259 OID 21342657)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2677 (class 1259 OID 21342867)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2686 (class 1259 OID 21342900)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2668 (class 1259 OID 21342841)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 21342842)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2510 (class 1259 OID 21342408)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2511 (class 1259 OID 21342409)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2642 (class 1259 OID 21342762)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2483 (class 1259 OID 21342308)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2530 (class 1259 OID 21342472)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2480 (class 1259 OID 21342296)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2725 (class 1259 OID 21343093)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 21342709)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2626 (class 1259 OID 21342708)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2699 (class 1259 OID 21342931)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2527 (class 1259 OID 21342460)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2678 (class 1259 OID 21342880)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2736 (class 1259 OID 21343140)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2718 (class 1259 OID 21343069)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2719 (class 1259 OID 21343070)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2665 (class 1259 OID 21342830)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2583 (class 1259 OID 21342619)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2496 (class 1259 OID 21342358)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2787 (class 2606 OID 21343322)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2786 (class 2606 OID 21343327)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2782 (class 2606 OID 21343347)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2788 (class 2606 OID 21343317)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2784 (class 2606 OID 21343337)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2783 (class 2606 OID 21343342)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2785 (class 2606 OID 21343332)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2823 (class 2606 OID 21343512)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2822 (class 2606 OID 21343517)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2821 (class 2606 OID 21343522)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2855 (class 2606 OID 21343687)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2856 (class 2606 OID 21343682)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2768 (class 2606 OID 21343247)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2805 (class 2606 OID 21343432)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2850 (class 2606 OID 21343667)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2851 (class 2606 OID 21343662)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2849 (class 2606 OID 21343672)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2852 (class 2606 OID 21343657)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2853 (class 2606 OID 21343652)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2803 (class 2606 OID 21343427)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2804 (class 2606 OID 21343422)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2781 (class 2606 OID 21343312)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2815 (class 2606 OID 21343472)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2813 (class 2606 OID 21343482)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2814 (class 2606 OID 21343477)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2774 (class 2606 OID 21343282)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2775 (class 2606 OID 21343277)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2801 (class 2606 OID 21343412)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2847 (class 2606 OID 21343642)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2826 (class 2606 OID 21343527)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2825 (class 2606 OID 21343532)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2824 (class 2606 OID 21343537)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2854 (class 2606 OID 21343677)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2828 (class 2606 OID 21343557)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2831 (class 2606 OID 21343542)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2827 (class 2606 OID 21343562)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2829 (class 2606 OID 21343552)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2830 (class 2606 OID 21343547)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2772 (class 2606 OID 21343272)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2773 (class 2606 OID 21343267)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2764 (class 2606 OID 21343232)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2765 (class 2606 OID 21343227)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2809 (class 2606 OID 21343452)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2761 (class 2606 OID 21343207)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2760 (class 2606 OID 21343212)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2810 (class 2606 OID 21343467)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2811 (class 2606 OID 21343462)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2812 (class 2606 OID 21343457)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2779 (class 2606 OID 21343297)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2778 (class 2606 OID 21343302)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2757 (class 2606 OID 21343192)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2793 (class 2606 OID 21343387)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2795 (class 2606 OID 21343377)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2796 (class 2606 OID 21343372)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2794 (class 2606 OID 21343382)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2759 (class 2606 OID 21343197)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2758 (class 2606 OID 21343202)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2806 (class 2606 OID 21343437)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2859 (class 2606 OID 21343702)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2819 (class 2606 OID 21343507)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2820 (class 2606 OID 21343502)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2861 (class 2606 OID 21343707)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2860 (class 2606 OID 21343712)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2802 (class 2606 OID 21343417)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2818 (class 2606 OID 21343492)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2817 (class 2606 OID 21343497)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2838 (class 2606 OID 21343617)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2839 (class 2606 OID 21343612)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2842 (class 2606 OID 21343597)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2841 (class 2606 OID 21343602)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2840 (class 2606 OID 21343607)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2770 (class 2606 OID 21343257)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2771 (class 2606 OID 21343252)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2769 (class 2606 OID 21343262)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2807 (class 2606 OID 21343447)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2808 (class 2606 OID 21343442)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2845 (class 2606 OID 21343627)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2844 (class 2606 OID 21343632)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2835 (class 2606 OID 21343587)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2834 (class 2606 OID 21343592)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2837 (class 2606 OID 21343577)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2836 (class 2606 OID 21343582)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2816 (class 2606 OID 21343487)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2797 (class 2606 OID 21343407)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2798 (class 2606 OID 21343402)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2800 (class 2606 OID 21343392)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2799 (class 2606 OID 21343397)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2832 (class 2606 OID 21343572)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2833 (class 2606 OID 21343567)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2776 (class 2606 OID 21343287)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2777 (class 2606 OID 21343292)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2780 (class 2606 OID 21343307)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2843 (class 2606 OID 21343622)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2846 (class 2606 OID 21343637)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2848 (class 2606 OID 21343647)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2858 (class 2606 OID 21343692)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2857 (class 2606 OID 21343697)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2762 (class 2606 OID 21343222)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2763 (class 2606 OID 21343217)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2767 (class 2606 OID 21343237)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2766 (class 2606 OID 21343242)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2789 (class 2606 OID 21343352)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2790 (class 2606 OID 21343367)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2791 (class 2606 OID 21343362)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2792 (class 2606 OID 21343357)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-06 11:40:49 CEST

--
-- PostgreSQL database dump complete
--

