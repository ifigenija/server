--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-06 08:40:21 CEST

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
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 245
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 21330872)
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
-- TOC entry 229 (class 1259 OID 21331429)
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
-- TOC entry 228 (class 1259 OID 21331412)
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
-- TOC entry 219 (class 1259 OID 21331289)
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
-- TOC entry 222 (class 1259 OID 21331319)
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
-- TOC entry 243 (class 1259 OID 21331673)
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
-- TOC entry 197 (class 1259 OID 21331080)
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
-- TOC entry 199 (class 1259 OID 21331111)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 21331599)
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
-- TOC entry 190 (class 1259 OID 21330993)
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
-- TOC entry 230 (class 1259 OID 21331442)
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
-- TOC entry 215 (class 1259 OID 21331244)
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
-- TOC entry 195 (class 1259 OID 21331059)
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
-- TOC entry 193 (class 1259 OID 21331033)
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
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 191 (class 1259 OID 21331010)
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
-- TOC entry 204 (class 1259 OID 21331158)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 21331654)
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
-- TOC entry 242 (class 1259 OID 21331666)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 21331688)
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
-- TOC entry 208 (class 1259 OID 21331183)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 21330967)
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
-- TOC entry 182 (class 1259 OID 21330881)
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
-- TOC entry 183 (class 1259 OID 21330892)
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
-- TOC entry 178 (class 1259 OID 21330846)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 21330865)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 21331190)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 21331224)
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
-- TOC entry 225 (class 1259 OID 21331360)
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
-- TOC entry 185 (class 1259 OID 21330925)
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
-- TOC entry 187 (class 1259 OID 21330959)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 21331544)
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
-- TOC entry 205 (class 1259 OID 21331164)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 21330944)
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
-- TOC entry 194 (class 1259 OID 21331048)
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
-- TOC entry 207 (class 1259 OID 21331176)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 21331558)
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
-- TOC entry 234 (class 1259 OID 21331568)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 21331501)
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
-- TOC entry 235 (class 1259 OID 21331576)
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
-- TOC entry 211 (class 1259 OID 21331205)
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
-- TOC entry 203 (class 1259 OID 21331149)
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
-- TOC entry 202 (class 1259 OID 21331139)
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
-- TOC entry 224 (class 1259 OID 21331349)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 21331279)
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
-- TOC entry 192 (class 1259 OID 21331022)
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
-- TOC entry 175 (class 1259 OID 21330817)
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
-- TOC entry 174 (class 1259 OID 21330815)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 212 (class 1259 OID 21331218)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 21330855)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 21330839)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 21331232)
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
-- TOC entry 206 (class 1259 OID 21331170)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 21331116)
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
-- TOC entry 173 (class 1259 OID 21330804)
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
-- TOC entry 172 (class 1259 OID 21330796)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 21330791)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 21331296)
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
-- TOC entry 184 (class 1259 OID 21330917)
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
-- TOC entry 201 (class 1259 OID 21331126)
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
-- TOC entry 223 (class 1259 OID 21331337)
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
-- TOC entry 236 (class 1259 OID 21331587)
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
-- TOC entry 189 (class 1259 OID 21330979)
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
-- TOC entry 176 (class 1259 OID 21330826)
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
-- TOC entry 227 (class 1259 OID 21331387)
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
-- TOC entry 196 (class 1259 OID 21331070)
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
-- TOC entry 210 (class 1259 OID 21331197)
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
-- TOC entry 221 (class 1259 OID 21331310)
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
-- TOC entry 239 (class 1259 OID 21331634)
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
-- TOC entry 238 (class 1259 OID 21331606)
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
-- TOC entry 240 (class 1259 OID 21331646)
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
-- TOC entry 217 (class 1259 OID 21331269)
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
-- TOC entry 198 (class 1259 OID 21331105)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 21331377)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 21331259)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 21330820)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2979 (class 0 OID 21330872)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 21331429)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5613-6cd3-e567-b66eb89cb684	000d0000-5613-6cd3-1f1e-731d8d3c8d08	\N	00090000-5613-6cd3-0526-6adb55eda434	000b0000-5613-6cd3-1407-60a4cc1e9595	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5613-6cd3-85b5-563631ec2ad6	000d0000-5613-6cd3-f33a-65dbb999cc70	00100000-5613-6cd3-64c6-36b15514d2ce	00090000-5613-6cd3-28bd-f247ec8581c9	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5613-6cd3-9c09-2cfa1c76dcf7	000d0000-5613-6cd3-7177-576a6de7fab8	00100000-5613-6cd3-9efe-0911b7b1f03a	00090000-5613-6cd3-b3f8-7c08919efd4c	\N	0003	t	\N	2015-10-06	\N	2	t	\N	f	f
000c0000-5613-6cd3-d0ad-b012649afb0c	000d0000-5613-6cd3-8700-f3115a15e431	\N	00090000-5613-6cd3-0d28-f61a55c06f0d	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5613-6cd3-9bb2-38597aae3ae4	000d0000-5613-6cd3-296a-181fd6839d11	\N	00090000-5613-6cd3-af81-5acf80414a0b	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5613-6cd3-9d68-1d29d6243f5a	000d0000-5613-6cd3-525d-1c89a492ddbc	\N	00090000-5613-6cd3-55b0-2c468f73bece	000b0000-5613-6cd3-fb07-62d3091de9e0	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5613-6cd3-45a5-d3b520a6363e	000d0000-5613-6cd3-5ded-5de044a4a7f5	00100000-5613-6cd3-f1ec-34825158e00d	00090000-5613-6cd3-b5ff-00bc05bdc521	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5613-6cd3-c951-1c200497e5c0	000d0000-5613-6cd3-9933-db4e39545e09	\N	00090000-5613-6cd3-93c9-a0669e5dcecb	000b0000-5613-6cd3-d426-456f2af9a21c	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5613-6cd3-cb13-9dae6d1bdfbd	000d0000-5613-6cd3-5ded-5de044a4a7f5	00100000-5613-6cd3-e19d-b7f4dd0ee6fe	00090000-5613-6cd3-10d7-65dd29f22738	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5613-6cd3-a6ac-71428ece06dd	000d0000-5613-6cd3-5ded-5de044a4a7f5	00100000-5613-6cd3-4dcb-a0d7a87b1e96	00090000-5613-6cd3-560a-efdd193aecd8	\N	0010	t	\N	2015-10-06	\N	16	f	\N	f	t
000c0000-5613-6cd3-6363-15b2762fbc21	000d0000-5613-6cd3-5ded-5de044a4a7f5	00100000-5613-6cd3-a3e5-b9e01ffbe459	00090000-5613-6cd3-0fb3-c9edf9e9931b	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5613-6cd3-fbf0-83bf83231e71	000d0000-5613-6cd3-097c-2acbdeb14c1b	\N	00090000-5613-6cd3-28bd-f247ec8581c9	000b0000-5613-6cd3-6ca0-73e83abe5d0c	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3026 (class 0 OID 21331412)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 21331289)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5613-6cd3-5465-0c5dae24e302	00160000-5613-6cd2-9345-a857411c7bb6	00090000-5613-6cd3-8191-5d040ce6e31a	aizv	10	t
003d0000-5613-6cd3-d6fd-18472a7d82e0	00160000-5613-6cd2-9345-a857411c7bb6	00090000-5613-6cd3-3d5d-86ee2c4fddde	apri	14	t
003d0000-5613-6cd3-8168-befab61aa36d	00160000-5613-6cd2-3ef9-5c7e75858a35	00090000-5613-6cd3-8ea5-49a0674bfe7b	aizv	11	t
003d0000-5613-6cd3-0e1d-f658e8bf7565	00160000-5613-6cd2-626d-567422925894	00090000-5613-6cd3-c9ed-2133b6d92561	aizv	12	t
003d0000-5613-6cd3-8dbe-4d57e8d15df2	00160000-5613-6cd2-9345-a857411c7bb6	00090000-5613-6cd3-a4b1-bd92bddec887	apri	18	f
\.


--
-- TOC entry 3020 (class 0 OID 21331319)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5613-6cd2-9345-a857411c7bb6	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5613-6cd2-3ef9-5c7e75858a35	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5613-6cd2-626d-567422925894	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3041 (class 0 OID 21331673)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 21331080)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5613-6cd3-15a7-a0d058fc7d6b	\N	\N	00200000-5613-6cd3-b0cd-93c4fec667c3	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5613-6cd3-5268-b222fd5f26df	\N	\N	00200000-5613-6cd3-8a59-e83f2098e393	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5613-6cd3-5aca-1b98c494744a	\N	\N	00200000-5613-6cd3-8478-6a16b02782e9	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5613-6cd3-8779-883653122f68	\N	\N	00200000-5613-6cd3-7e90-f13e134b91a4	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5613-6cd3-4ada-9de506e4f7fc	\N	\N	00200000-5613-6cd3-c829-2fc82cd8862d	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2997 (class 0 OID 21331111)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 21331599)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 21330993)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5613-6cd1-b81d-170009f8cdaa	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5613-6cd1-d627-d8dc2b96f8e1	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5613-6cd1-bce6-df2e4f4af84e	AL	ALB	008	Albania 	Albanija	\N
00040000-5613-6cd1-5ed2-8779625ae4b6	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5613-6cd1-9504-6ed47a4478b1	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5613-6cd1-b991-93caa9f09661	AD	AND	020	Andorra 	Andora	\N
00040000-5613-6cd1-8f9c-f72023a5ac76	AO	AGO	024	Angola 	Angola	\N
00040000-5613-6cd1-837e-48385151e9f1	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5613-6cd1-9312-98aace7d4114	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5613-6cd1-9d7c-4ed1fed13181	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5613-6cd1-e856-3fea669fae6b	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5613-6cd1-1d20-6d62f9db2cf1	AM	ARM	051	Armenia 	Armenija	\N
00040000-5613-6cd1-a06f-03d0a9322f46	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5613-6cd1-81da-afda50778280	AU	AUS	036	Australia 	Avstralija	\N
00040000-5613-6cd1-e3b4-f82e2604629a	AT	AUT	040	Austria 	Avstrija	\N
00040000-5613-6cd1-3158-3a3b7380baeb	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5613-6cd1-e126-8f285203045d	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5613-6cd1-3122-0698679669e4	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5613-6cd1-b1ab-903a32363b36	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5613-6cd1-3e12-3f69fae36d87	BB	BRB	052	Barbados 	Barbados	\N
00040000-5613-6cd1-29a9-563f0306589a	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5613-6cd1-383a-22fbd8e7bbab	BE	BEL	056	Belgium 	Belgija	\N
00040000-5613-6cd1-f2d4-a42513582fbc	BZ	BLZ	084	Belize 	Belize	\N
00040000-5613-6cd1-d229-904dae650715	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5613-6cd1-1db7-a5f266653f75	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5613-6cd1-a60b-4cc4b70c7d5a	BT	BTN	064	Bhutan 	Butan	\N
00040000-5613-6cd1-5977-4c7b801e66ca	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5613-6cd1-7577-4c1e2c0b7e0a	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5613-6cd1-65c7-053a625de783	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5613-6cd1-4064-c5c8fbbb9f2e	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5613-6cd1-9bcb-a4596e96526a	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5613-6cd1-dd26-96f275648383	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5613-6cd1-7710-06797eec67e3	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5613-6cd1-b3c6-ea51f820cf9b	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5613-6cd1-796d-f95115b4e68d	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5613-6cd1-afe1-e2458def76dd	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5613-6cd1-4e6a-a5f9baf4e5be	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5613-6cd1-7b0b-40741a4e92b4	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5613-6cd1-503f-4db5b74facc5	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5613-6cd1-14aa-4a84aae4c13d	CA	CAN	124	Canada 	Kanada	\N
00040000-5613-6cd1-9c96-4b465d52c411	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5613-6cd1-f09c-3487d9cf93fc	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5613-6cd1-8759-f9ae16fbc327	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5613-6cd1-1226-5b36a16caa1f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5613-6cd1-2657-093bcac660ca	CL	CHL	152	Chile 	Čile	\N
00040000-5613-6cd1-f902-eea06ef0c46c	CN	CHN	156	China 	Kitajska	\N
00040000-5613-6cd1-7925-fecf568d48e8	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5613-6cd1-9f0a-1351da223cd2	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5613-6cd1-01b8-58a4352d8e94	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5613-6cd1-767c-0612d3a1dca8	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5613-6cd1-415f-ebe5ca6ba591	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5613-6cd1-2a5a-31b95513e231	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5613-6cd1-14cf-3960142eeb56	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5613-6cd1-8432-ea6f7d99b7cd	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5613-6cd1-522a-fc3048e07dff	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5613-6cd1-36db-e3e14e39473d	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5613-6cd1-8d60-8a586f4c9a20	CU	CUB	192	Cuba 	Kuba	\N
00040000-5613-6cd1-859f-d99a4996acfc	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5613-6cd1-507c-d9be29c0bcdf	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5613-6cd1-15b5-9de99ae231e5	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5613-6cd1-4ca9-712698f14bef	DK	DNK	208	Denmark 	Danska	\N
00040000-5613-6cd1-fb5f-a49a6d59bbf3	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5613-6cd1-789b-51e1bcf6303a	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5613-6cd1-a59f-28e51f347d74	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5613-6cd1-9655-d92ad2ada108	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5613-6cd1-7764-dbda0e57deee	EG	EGY	818	Egypt 	Egipt	\N
00040000-5613-6cd1-0bc1-ca1f49285c4b	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5613-6cd1-3b04-5c270c572365	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5613-6cd1-716f-68607e2f04be	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5613-6cd1-4cf0-43fb43c4283c	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5613-6cd1-7266-95a8a712b8bd	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5613-6cd1-0192-f69541a94eea	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5613-6cd1-c341-bb876064c1cd	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5613-6cd1-973f-5379afda43f3	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5613-6cd1-94c4-7f1c0182671a	FI	FIN	246	Finland 	Finska	\N
00040000-5613-6cd1-ff68-22e1e840ccd1	FR	FRA	250	France 	Francija	\N
00040000-5613-6cd1-811c-e61a6bd3bd4a	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5613-6cd1-f08c-357e17d04405	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5613-6cd1-6703-dafef2599a79	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5613-6cd1-db48-60a0c185785e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5613-6cd1-a3eb-640bd669ad8d	GA	GAB	266	Gabon 	Gabon	\N
00040000-5613-6cd1-f9dd-a330bb01169a	GM	GMB	270	Gambia 	Gambija	\N
00040000-5613-6cd1-4549-7c8e4fa07f6c	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5613-6cd1-53c0-4e2f5c3e291e	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5613-6cd1-ca37-ff4644d1fadc	GH	GHA	288	Ghana 	Gana	\N
00040000-5613-6cd1-e1f1-22195d71576b	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5613-6cd1-ca9b-7792c156abf7	GR	GRC	300	Greece 	Grčija	\N
00040000-5613-6cd1-1de5-2f00a66ed678	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5613-6cd1-8577-4334b429cde8	GD	GRD	308	Grenada 	Grenada	\N
00040000-5613-6cd1-2af6-eea076b37baf	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5613-6cd1-8363-395f7fe34360	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5613-6cd1-885d-310a520eb787	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5613-6cd1-0f18-b55b6df7aa16	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5613-6cd1-0f0c-9cc8e44e10c2	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5613-6cd1-5368-981b43525c1e	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5613-6cd1-ad96-4264484a74ef	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5613-6cd1-d7c6-811830c643dc	HT	HTI	332	Haiti 	Haiti	\N
00040000-5613-6cd1-be9d-57d2cdb9fdd2	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5613-6cd1-ce86-878e0e1e45ba	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5613-6cd1-0964-f066c7efa7d6	HN	HND	340	Honduras 	Honduras	\N
00040000-5613-6cd1-8dba-c18863f56c4e	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5613-6cd1-41a1-9a7dbbf31c4b	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5613-6cd1-44af-3edb1df14114	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5613-6cd1-889f-ba065f60454c	IN	IND	356	India 	Indija	\N
00040000-5613-6cd1-2094-2af272096725	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5613-6cd1-024c-31e2a2702159	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5613-6cd1-8a7b-418976f015fb	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5613-6cd1-bcaa-5a19bffa3376	IE	IRL	372	Ireland 	Irska	\N
00040000-5613-6cd1-ddd4-9c1030cc6765	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5613-6cd1-c9e6-b27fd55a5473	IL	ISR	376	Israel 	Izrael	\N
00040000-5613-6cd1-78b9-64b0436cfb31	IT	ITA	380	Italy 	Italija	\N
00040000-5613-6cd1-8d2d-3241a3e4f2e6	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5613-6cd1-20ef-a70c23a246e1	JP	JPN	392	Japan 	Japonska	\N
00040000-5613-6cd1-751a-603a827264b4	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5613-6cd1-f902-ec372fedc361	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5613-6cd1-2909-953333d92415	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5613-6cd1-dff6-99f4ee1b5100	KE	KEN	404	Kenya 	Kenija	\N
00040000-5613-6cd1-77a1-1972bf63e3d5	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5613-6cd1-a37d-200345b801d4	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5613-6cd1-fc9d-6fd993692f3d	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5613-6cd1-94c4-7646629a83d2	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5613-6cd1-0125-804bd7f8c779	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5613-6cd1-5309-2c3832a474e3	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5613-6cd1-fa9e-c1bfe9e44547	LV	LVA	428	Latvia 	Latvija	\N
00040000-5613-6cd1-6ca5-81de58519488	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5613-6cd1-757a-0363d4463783	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5613-6cd1-8fb3-b5f84d2c096a	LR	LBR	430	Liberia 	Liberija	\N
00040000-5613-6cd1-2845-53756b9daf1e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5613-6cd1-fec6-28cf18156033	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5613-6cd1-df1d-0fcb28a4b6e9	LT	LTU	440	Lithuania 	Litva	\N
00040000-5613-6cd1-3fd5-6fbed48a3b22	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5613-6cd1-41f0-124564d70bad	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5613-6cd1-5b9d-ab7ea6308fe8	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5613-6cd1-6ea9-7528b2606858	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5613-6cd1-0e24-1fe71c71c75a	MW	MWI	454	Malawi 	Malavi	\N
00040000-5613-6cd1-c678-ffd916e7b894	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5613-6cd1-7458-8cd6a6fb40d0	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5613-6cd1-48fd-bf6d82bcb966	ML	MLI	466	Mali 	Mali	\N
00040000-5613-6cd1-0d98-9d430f30f4b5	MT	MLT	470	Malta 	Malta	\N
00040000-5613-6cd1-54d2-aa92c5f52046	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5613-6cd1-8300-6ec86835e91b	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5613-6cd1-3331-97e4a86ad6e3	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5613-6cd1-9203-9d87685714e9	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5613-6cd1-5ea8-8163217b5bac	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5613-6cd1-93f3-858d99f0f638	MX	MEX	484	Mexico 	Mehika	\N
00040000-5613-6cd1-3509-a7354469ae70	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5613-6cd1-32c4-8a4ae9262073	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5613-6cd1-ce70-4142100d1db7	MC	MCO	492	Monaco 	Monako	\N
00040000-5613-6cd1-86cb-ec9cf8415fe6	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5613-6cd1-c965-3b49503d8cc0	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5613-6cd1-097c-26d9987968f2	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5613-6cd1-d45e-ce97825b6b23	MA	MAR	504	Morocco 	Maroko	\N
00040000-5613-6cd1-9ae2-d6bc6b5fa4d5	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5613-6cd1-8cc6-73ab068ee201	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5613-6cd1-3668-9eb3aab031fe	NA	NAM	516	Namibia 	Namibija	\N
00040000-5613-6cd1-66a2-2fe5bee9ed87	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5613-6cd1-5357-e63bd76b400a	NP	NPL	524	Nepal 	Nepal	\N
00040000-5613-6cd1-7429-16d33de3185e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5613-6cd1-0c18-3736aba6c6e6	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5613-6cd1-eaf5-94976b2a4841	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5613-6cd1-7d17-bdd1e0f66fe9	NE	NER	562	Niger 	Niger 	\N
00040000-5613-6cd1-2933-8fdb2ca7297c	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5613-6cd1-8d8a-e16a444f9eee	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5613-6cd1-fc41-b764ca9490fa	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5613-6cd1-702b-59451c90d455	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5613-6cd1-e0d6-414bf2927dac	NO	NOR	578	Norway 	Norveška	\N
00040000-5613-6cd1-5976-8f07c155c2a6	OM	OMN	512	Oman 	Oman	\N
00040000-5613-6cd1-a3b6-21fd8cef2b4c	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5613-6cd1-c4cd-67599d7d7cc5	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5613-6cd1-3616-f741e6a3de9f	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5613-6cd1-2bca-68a189798ec1	PA	PAN	591	Panama 	Panama	\N
00040000-5613-6cd1-fd4a-247da441182c	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5613-6cd1-2364-b8e4972932ce	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5613-6cd1-c283-e738f613d09e	PE	PER	604	Peru 	Peru	\N
00040000-5613-6cd1-009d-6f675fb33cf4	PH	PHL	608	Philippines 	Filipini	\N
00040000-5613-6cd1-2776-7d3f4f059469	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5613-6cd1-3048-24ed1e8f582b	PL	POL	616	Poland 	Poljska	\N
00040000-5613-6cd1-12a5-802e2aa19c02	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5613-6cd1-7e26-62dc3d0bdc85	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5613-6cd1-2bb2-c82f6324146a	QA	QAT	634	Qatar 	Katar	\N
00040000-5613-6cd1-ae86-5d333b724e71	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5613-6cd1-1078-d9e8526b4995	RO	ROU	642	Romania 	Romunija	\N
00040000-5613-6cd1-8a45-c48d2b4d4274	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5613-6cd1-0ff1-89276643846a	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5613-6cd1-fee8-ddf27141e955	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5613-6cd1-ff70-0bdc1d61602f	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5613-6cd1-11da-53cef8461c53	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5613-6cd1-2eca-2aadcb9af8ab	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5613-6cd1-0d48-34414c296613	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5613-6cd1-0e4e-42c1bdbc7ef3	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5613-6cd1-4137-e28d8e99589b	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5613-6cd1-1f50-fac16c9ee986	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5613-6cd1-ffc3-f51c4d3ba758	SM	SMR	674	San Marino 	San Marino	\N
00040000-5613-6cd1-6ee5-244f7b40c09a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5613-6cd1-eb69-45cc76524b55	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5613-6cd1-b03e-42e7d0cfdd5b	SN	SEN	686	Senegal 	Senegal	\N
00040000-5613-6cd1-0303-ed5a0979d2b5	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5613-6cd1-c6e9-99c1cfe3a42e	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5613-6cd1-63aa-ab02202274a6	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5613-6cd1-22ae-f0c2f30091d0	SG	SGP	702	Singapore 	Singapur	\N
00040000-5613-6cd1-a169-ed045a21f795	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5613-6cd1-1c23-e19777355bd7	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5613-6cd1-c923-b8e971757f3b	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5613-6cd1-0046-608bd3d9f6ed	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5613-6cd1-eb5f-c99359291dfd	SO	SOM	706	Somalia 	Somalija	\N
00040000-5613-6cd1-f217-8ecb97142a37	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5613-6cd1-3490-f7ba6a4ac784	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5613-6cd1-62db-d66c0f84e689	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5613-6cd1-a7bd-1860b2adcaf8	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5613-6cd1-6099-ef6e533b6436	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5613-6cd1-b05a-a1925cad3cd3	SD	SDN	729	Sudan 	Sudan	\N
00040000-5613-6cd1-d34b-dce29ab2908b	SR	SUR	740	Suriname 	Surinam	\N
00040000-5613-6cd1-e2ef-e81038a32978	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5613-6cd1-d51f-ddd8a020d71b	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5613-6cd1-7475-562e29602745	SE	SWE	752	Sweden 	Švedska	\N
00040000-5613-6cd1-6054-ac0fa6e20533	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5613-6cd1-f305-53cd2e2c1a81	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5613-6cd1-558d-0cabc5e00f7c	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5613-6cd1-2b8d-a4cc5efa1510	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5613-6cd1-d9b8-ae4d958351d3	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5613-6cd1-5547-9643a251e79e	TH	THA	764	Thailand 	Tajska	\N
00040000-5613-6cd1-769d-f9069727f502	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5613-6cd1-429f-d0df3d0db22b	TG	TGO	768	Togo 	Togo	\N
00040000-5613-6cd1-10f0-d930fcbf9711	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5613-6cd1-184c-ed58123ff87c	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5613-6cd1-0e21-213eb7d011c2	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5613-6cd1-0ce1-4d2f51c95bcb	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5613-6cd1-4e23-c7f39cbf0dde	TR	TUR	792	Turkey 	Turčija	\N
00040000-5613-6cd1-e180-0f98982849a7	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5613-6cd1-cee1-6671475deeee	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5613-6cd1-cc46-dc3d0e81fe21	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5613-6cd1-a9dc-0a00c67dab28	UG	UGA	800	Uganda 	Uganda	\N
00040000-5613-6cd1-88c8-52d06e70ffea	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5613-6cd1-4697-ed8030172295	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5613-6cd1-425d-1e97d1eeaec8	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5613-6cd1-7375-90364bafd2fc	US	USA	840	United States 	Združene države Amerike	\N
00040000-5613-6cd1-d7f0-2a5e28deed4f	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5613-6cd1-3325-5e47c2edd2d2	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5613-6cd1-bb5c-1c1261f02352	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5613-6cd1-acd8-c5840ebf29ab	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5613-6cd1-333f-480aa766bf9c	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5613-6cd1-3a55-6d14eaaddb50	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5613-6cd1-96eb-2b8eada09523	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5613-6cd1-5fde-fe37490d0c1b	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5613-6cd1-c3ce-22457feec906	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5613-6cd1-3e17-0ad411cc3992	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5613-6cd1-7cc8-6ea3d5c405b6	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5613-6cd1-1d64-d777add99b74	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5613-6cd1-89ac-d6172ecc89b9	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3028 (class 0 OID 21331442)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5613-6cd3-5458-0bb846eadf7d	000e0000-5613-6cd3-ca57-9ed8e1a661a7	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5613-6cd0-6e1b-50c20434597b	premiera	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5613-6cd3-65d2-7d4bae6601c5	000e0000-5613-6cd3-f667-cc5293b08054	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5613-6cd0-7f0a-adcff1202638	premiera	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5613-6cd3-cc78-5cf3e50d67c2	000e0000-5613-6cd3-6860-669721152ea6	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5613-6cd0-6e1b-50c20434597b	premiera	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5613-6cd3-e7b8-2e1c917be4aa	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5613-6cd3-a233-ecf3bceb4fd6	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3013 (class 0 OID 21331244)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5613-6cd3-1f1e-731d8d3c8d08	000e0000-5613-6cd3-f667-cc5293b08054	000c0000-5613-6cd3-e567-b66eb89cb684	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5613-6cd0-b949-8cfa6c1bff0e
000d0000-5613-6cd3-f33a-65dbb999cc70	000e0000-5613-6cd3-f667-cc5293b08054	000c0000-5613-6cd3-85b5-563631ec2ad6	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5613-6cd0-9251-0b8f7f2c3fd2
000d0000-5613-6cd3-7177-576a6de7fab8	000e0000-5613-6cd3-f667-cc5293b08054	000c0000-5613-6cd3-9c09-2cfa1c76dcf7	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5613-6cd0-87c5-b24abdc67f36
000d0000-5613-6cd3-8700-f3115a15e431	000e0000-5613-6cd3-f667-cc5293b08054	000c0000-5613-6cd3-d0ad-b012649afb0c	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5613-6cd0-d76c-7fc36acf6e5f
000d0000-5613-6cd3-296a-181fd6839d11	000e0000-5613-6cd3-f667-cc5293b08054	000c0000-5613-6cd3-9bb2-38597aae3ae4	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5613-6cd0-d76c-7fc36acf6e5f
000d0000-5613-6cd3-525d-1c89a492ddbc	000e0000-5613-6cd3-f667-cc5293b08054	000c0000-5613-6cd3-9d68-1d29d6243f5a	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5613-6cd0-b949-8cfa6c1bff0e
000d0000-5613-6cd3-5ded-5de044a4a7f5	000e0000-5613-6cd3-f667-cc5293b08054	000c0000-5613-6cd3-cb13-9dae6d1bdfbd	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5613-6cd0-b949-8cfa6c1bff0e
000d0000-5613-6cd3-9933-db4e39545e09	000e0000-5613-6cd3-f667-cc5293b08054	000c0000-5613-6cd3-c951-1c200497e5c0	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5613-6cd0-34b8-818b368db005
000d0000-5613-6cd3-097c-2acbdeb14c1b	000e0000-5613-6cd3-f667-cc5293b08054	000c0000-5613-6cd3-fbf0-83bf83231e71	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5613-6cd0-bb67-3ac8657b3e22
\.


--
-- TOC entry 2993 (class 0 OID 21331059)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 21331033)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 21331010)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5613-6cd3-f120-7e13a8361be2	00080000-5613-6cd2-971c-5805af1683ad	00090000-5613-6cd3-560a-efdd193aecd8	AK		igralka
\.


--
-- TOC entry 3002 (class 0 OID 21331158)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 21331654)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 21331666)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 21331688)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 21093458)
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
-- TOC entry 3006 (class 0 OID 21331183)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 21330967)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5613-6cd1-1c6b-33d92d2807a6	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5613-6cd1-4763-f82df849635d	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5613-6cd1-81b2-740ddeedbe12	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5613-6cd1-b11e-471537253878	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5613-6cd1-cdba-394c76b03c46	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5613-6cd1-010a-6fe39bd5d6d2	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5613-6cd1-9fc0-4eed60012433	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5613-6cd1-5d08-d6322798f3c6	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5613-6cd1-defb-c29e1a47a14b	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5613-6cd1-5ebb-562f21de67a8	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5613-6cd1-2cc0-ff5aa6f5777e	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5613-6cd1-4f29-c712f7262462	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5613-6cd1-89c3-c765cf7e06a3	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5613-6cd1-971d-b72543c01773	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5613-6cd1-a8bf-3e5782ffb7fb	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5613-6cd2-4db9-c62858fbb056	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5613-6cd2-e632-e13d4827dea3	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5613-6cd2-3440-33cad113b2e9	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5613-6cd2-e982-33abb583a44c	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5613-6cd2-3a27-fe0af75bb97a	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5613-6cd4-7626-3d36c1d7642d	application.tenant.maticnopodjetje	string	s:36:"00080000-5613-6cd4-d9ae-4a3bb47ce142";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 2980 (class 0 OID 21330881)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5613-6cd2-066a-8cc0e25816ff	00000000-5613-6cd2-4db9-c62858fbb056	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5613-6cd2-be29-d0fc629eea4d	00000000-5613-6cd2-4db9-c62858fbb056	00010000-5613-6cd1-e68f-6caf6d4642fb	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5613-6cd2-7e12-adc71ceaa36f	00000000-5613-6cd2-e632-e13d4827dea3	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2981 (class 0 OID 21330892)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5613-6cd3-0526-6adb55eda434	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5613-6cd3-0d28-f61a55c06f0d	00010000-5613-6cd2-c889-0ba75eb2543e	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5613-6cd3-b3f8-7c08919efd4c	00010000-5613-6cd2-8633-defe49ebcc5b	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5613-6cd3-10d7-65dd29f22738	00010000-5613-6cd3-721e-d24c341e14c6	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5613-6cd3-508b-24cc3efdf012	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5613-6cd3-55b0-2c468f73bece	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5613-6cd3-0fb3-c9edf9e9931b	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5613-6cd3-b5ff-00bc05bdc521	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5613-6cd3-560a-efdd193aecd8	00010000-5613-6cd3-80ed-0a2dc7420d47	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5613-6cd3-28bd-f247ec8581c9	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5613-6cd3-bb44-7057baeb19c0	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5613-6cd3-af81-5acf80414a0b	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5613-6cd3-93c9-a0669e5dcecb	00010000-5613-6cd3-e75a-bfb38b7d0ea9	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5613-6cd3-8191-5d040ce6e31a	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5613-6cd3-3d5d-86ee2c4fddde	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5613-6cd3-8ea5-49a0674bfe7b	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5613-6cd3-c9ed-2133b6d92561	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5613-6cd3-a4b1-bd92bddec887	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2976 (class 0 OID 21330846)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5613-6cd1-a20c-ffb501d85b2b	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5613-6cd1-6292-6addc749b1fb	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5613-6cd1-da0d-4ca71063e527	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5613-6cd1-8708-beb7843e0614	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5613-6cd1-c480-d2246bacf650	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5613-6cd1-453f-b660877f73d9	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5613-6cd1-e278-37324b44a9f5	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5613-6cd1-8840-21ea08a4b9fd	Abonma-read	Abonma - branje	f
00030000-5613-6cd1-11ba-6a99c4125b1b	Abonma-write	Abonma - spreminjanje	f
00030000-5613-6cd1-aa1f-8d78094dfd5f	Alternacija-read	Alternacija - branje	f
00030000-5613-6cd1-9c86-3a7729c98f73	Alternacija-write	Alternacija - spreminjanje	f
00030000-5613-6cd1-6012-444e2b48a3ca	Arhivalija-read	Arhivalija - branje	f
00030000-5613-6cd1-dd64-c346fac6bf66	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5613-6cd1-ecda-60eccec3e999	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5613-6cd1-e025-ab2d78b382de	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5613-6cd1-404d-aaba10daa2d3	Besedilo-read	Besedilo - branje	f
00030000-5613-6cd1-c2db-da6dc729027f	Besedilo-write	Besedilo - spreminjanje	f
00030000-5613-6cd1-f3a3-ec46b186e0e0	DogodekIzven-read	DogodekIzven - branje	f
00030000-5613-6cd1-5f86-65ba6e6a6269	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5613-6cd1-a2a4-46b8283c8fda	Dogodek-read	Dogodek - branje	f
00030000-5613-6cd1-9817-cfe0ed26b39d	Dogodek-write	Dogodek - spreminjanje	f
00030000-5613-6cd1-bfb8-d7e34f706446	DrugiVir-read	DrugiVir - branje	f
00030000-5613-6cd1-cfdc-2d28d5610e00	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5613-6cd1-f840-0003a45aae65	Drzava-read	Drzava - branje	f
00030000-5613-6cd1-bdd9-32cb1cf4b594	Drzava-write	Drzava - spreminjanje	f
00030000-5613-6cd1-53ea-46c97d16ae17	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5613-6cd1-1cca-a631b2d56c30	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5613-6cd1-c78b-17f15e0c5297	Funkcija-read	Funkcija - branje	f
00030000-5613-6cd1-95c2-c376897529a0	Funkcija-write	Funkcija - spreminjanje	f
00030000-5613-6cd1-7f40-200fd2eb7d56	Gostovanje-read	Gostovanje - branje	f
00030000-5613-6cd1-2655-ad98c4d2e93a	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5613-6cd1-ca06-71f8763839f3	Gostujoca-read	Gostujoca - branje	f
00030000-5613-6cd1-a089-395e24669a40	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5613-6cd1-ddb7-c8ea90405c78	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5613-6cd1-d19f-bb2d2c894bed	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5613-6cd1-5707-01498cbf1263	Kupec-read	Kupec - branje	f
00030000-5613-6cd1-8947-e1cf321b0b8c	Kupec-write	Kupec - spreminjanje	f
00030000-5613-6cd1-3b2e-981f8fe44f20	NacinPlacina-read	NacinPlacina - branje	f
00030000-5613-6cd1-1147-4d6ee51d642c	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5613-6cd1-d149-15dac77c21ab	Option-read	Option - branje	f
00030000-5613-6cd1-295b-0c51a0c5f435	Option-write	Option - spreminjanje	f
00030000-5613-6cd1-a16b-5be15c6cbbc1	OptionValue-read	OptionValue - branje	f
00030000-5613-6cd1-8cc4-0a6ed94376f0	OptionValue-write	OptionValue - spreminjanje	f
00030000-5613-6cd1-b03a-268cf053618f	Oseba-read	Oseba - branje	f
00030000-5613-6cd1-4c78-1aaf84cedb37	Oseba-write	Oseba - spreminjanje	f
00030000-5613-6cd1-b057-577b211b3d54	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5613-6cd1-5605-895e8fb69d83	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5613-6cd1-4ab3-249d0bf4b18f	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5613-6cd1-aa59-a5600d4132ff	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5613-6cd1-8837-9a6a12e07a07	Pogodba-read	Pogodba - branje	f
00030000-5613-6cd1-d1fe-a7840c1366cc	Pogodba-write	Pogodba - spreminjanje	f
00030000-5613-6cd1-be24-d1219d59c6fe	Popa-read	Popa - branje	f
00030000-5613-6cd1-fbee-fcf95ca867ee	Popa-write	Popa - spreminjanje	f
00030000-5613-6cd1-edd7-e70e465c0f1c	Posta-read	Posta - branje	f
00030000-5613-6cd1-fe6a-16b5a3026dd7	Posta-write	Posta - spreminjanje	f
00030000-5613-6cd1-cb75-2b43633f8249	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5613-6cd1-c02b-ea3acb09a2ff	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5613-6cd1-5f82-6dfb3b626fc7	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5613-6cd1-1eef-1c19ee2c9b1a	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5613-6cd1-3c13-dde4dcb12cfe	PostniNaslov-read	PostniNaslov - branje	f
00030000-5613-6cd1-1b6a-93c3698a5626	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5613-6cd1-1f6d-359cc382a018	Predstava-read	Predstava - branje	f
00030000-5613-6cd1-e7c7-b0b6dcb8a03c	Predstava-write	Predstava - spreminjanje	f
00030000-5613-6cd1-f90f-6c3280ba9355	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5613-6cd1-5fe2-af33d448c090	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5613-6cd1-ee3e-579775d7fca2	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5613-6cd1-0837-77738894c52b	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5613-6cd1-7cd8-2f9c7130fb3e	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5613-6cd1-7ab7-fec3aa7cfe96	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5613-6cd1-3ebf-e91a37815b73	ProgramDela-read	ProgramDela - branje	f
00030000-5613-6cd1-47f5-dab1c1777d2f	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5613-6cd1-c889-6e592b59de86	ProgramFestival-read	ProgramFestival - branje	f
00030000-5613-6cd1-32d7-8fc0fce83108	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5613-6cd1-e1b2-cb96a6448bc2	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5613-6cd1-c258-7f697ebde08c	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5613-6cd1-0f48-84f0b278abcd	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5613-6cd1-0db7-4a4a18276e3c	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5613-6cd1-78bf-3b3c39700a14	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5613-6cd1-8dbf-ef45f90f5fcf	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5613-6cd1-9c0e-545238a1ca80	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5613-6cd1-bfb1-cf7f35f6a4b8	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5613-6cd1-7a85-bb07702147a6	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5613-6cd1-18da-63b4a2196ce5	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5613-6cd1-4b00-3fc5c742b96c	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5613-6cd1-2ebd-bcfcc4101839	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5613-6cd1-7b2d-26f977ad4097	ProgramRazno-read	ProgramRazno - branje	f
00030000-5613-6cd1-2136-2506e1da70b4	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5613-6cd1-4872-1ce186663888	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5613-6cd1-37d9-bf51fe012cf7	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5613-6cd1-ee62-2b386ef14b7e	Prostor-read	Prostor - branje	f
00030000-5613-6cd1-d7d7-562a62cb88eb	Prostor-write	Prostor - spreminjanje	f
00030000-5613-6cd1-310c-f55b24440edb	Racun-read	Racun - branje	f
00030000-5613-6cd1-0bc6-c3681511d371	Racun-write	Racun - spreminjanje	f
00030000-5613-6cd1-6115-178e70df66bb	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5613-6cd1-2c69-b9a26041f596	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5613-6cd1-9744-eefc2097f9fa	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5613-6cd1-6276-4bcd82d353a9	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5613-6cd1-9506-7d13bd515419	Rekvizit-read	Rekvizit - branje	f
00030000-5613-6cd1-da1b-8a93cce03da6	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5613-6cd1-2f95-93a3b02ac227	Revizija-read	Revizija - branje	f
00030000-5613-6cd1-deff-1603ba1d3b38	Revizija-write	Revizija - spreminjanje	f
00030000-5613-6cd1-7d4e-72a261231ab3	Rezervacija-read	Rezervacija - branje	f
00030000-5613-6cd1-de53-d510c9abc9c1	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5613-6cd1-54cb-2de15a00ad73	SedezniRed-read	SedezniRed - branje	f
00030000-5613-6cd1-fe48-d8c499c3d996	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5613-6cd1-1d38-6105e4ce0c05	Sedez-read	Sedez - branje	f
00030000-5613-6cd1-561d-0714c73a04d7	Sedez-write	Sedez - spreminjanje	f
00030000-5613-6cd1-fc2d-e1fd8029ce00	Sezona-read	Sezona - branje	f
00030000-5613-6cd1-43e6-db80dec2965f	Sezona-write	Sezona - spreminjanje	f
00030000-5613-6cd1-46ee-fcba8df59eb7	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5613-6cd1-9510-4d836f901818	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5613-6cd1-e0a5-d6bd3dac68fe	Stevilcenje-read	Stevilcenje - branje	f
00030000-5613-6cd1-fc8e-6c24bb989868	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5613-6cd1-99c1-67a26053c77a	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5613-6cd1-4436-e16f9edac1db	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5613-6cd1-97bf-b863c01ff302	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5613-6cd1-5043-b654fd5c1d9a	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5613-6cd1-9ec0-9628c36a8eac	Telefonska-read	Telefonska - branje	f
00030000-5613-6cd1-7a6a-210f3ffc4d6b	Telefonska-write	Telefonska - spreminjanje	f
00030000-5613-6cd1-5e42-40ba345a5f9c	TerminStoritve-read	TerminStoritve - branje	f
00030000-5613-6cd1-8eef-77bd573333f1	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5613-6cd1-1955-a8156c0e18f9	TipFunkcije-read	TipFunkcije - branje	f
00030000-5613-6cd1-26e5-a2c63e4cb495	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5613-6cd1-4307-6176057bb291	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5613-6cd1-1566-e4e226174174	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5613-6cd1-e73f-6575a177db45	Trr-read	Trr - branje	f
00030000-5613-6cd1-82a4-d34f8b947321	Trr-write	Trr - spreminjanje	f
00030000-5613-6cd1-f400-49bfb1e7b672	Uprizoritev-read	Uprizoritev - branje	f
00030000-5613-6cd1-9a30-be2790345cfe	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5613-6cd1-37b1-352cd6d2ff05	Vaja-read	Vaja - branje	f
00030000-5613-6cd1-423b-21f38a2f91b6	Vaja-write	Vaja - spreminjanje	f
00030000-5613-6cd1-7008-03ff771f3312	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5613-6cd1-5695-522f6a59e589	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5613-6cd1-49f8-3f6d434c8b63	VrstaStroska-read	VrstaStroska - branje	f
00030000-5613-6cd1-4df4-4ef165630f1e	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5613-6cd1-0f6f-b8d1d7096f19	Zaposlitev-read	Zaposlitev - branje	f
00030000-5613-6cd1-dfdd-8cafb9a33d2b	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5613-6cd1-f773-63d4111d7cc7	Zasedenost-read	Zasedenost - branje	f
00030000-5613-6cd1-3557-37e50815cce5	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5613-6cd1-d5b7-1c44e6bd66fd	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5613-6cd1-6268-c2e83573e292	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5613-6cd1-f169-3838328a8eef	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5613-6cd1-8865-4e9425b02572	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5613-6cd1-0aba-a54e0a79803e	Job-read	Branje opravil - samo zase - branje	f
00030000-5613-6cd1-bfc7-d4bc88c2cf54	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5613-6cd1-8607-961e64769cac	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5613-6cd1-8076-10f5851e118d	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5613-6cd1-d8fa-d6beef15bf7a	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5613-6cd1-362b-a75266b1beb2	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5613-6cd1-b59c-85d3ee63e54b	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5613-6cd1-d08f-f536c76b84ac	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5613-6cd1-7123-e8be0e40008a	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5613-6cd1-86f9-e36a24f12e13	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5613-6cd1-2430-ec24410d8b6f	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5613-6cd1-0493-22de95ee7d04	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5613-6cd1-3fc7-cd008479cb90	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5613-6cd1-e0ee-b265f40242e1	Datoteka-write	Datoteka - spreminjanje	f
00030000-5613-6cd1-ccb1-6eb894763d48	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2978 (class 0 OID 21330865)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5613-6cd1-f0e6-a72be34de19f	00030000-5613-6cd1-6292-6addc749b1fb
00020000-5613-6cd1-f2b9-57dfa5cb6116	00030000-5613-6cd1-f840-0003a45aae65
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-8840-21ea08a4b9fd
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-11ba-6a99c4125b1b
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-aa1f-8d78094dfd5f
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-9c86-3a7729c98f73
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-6012-444e2b48a3ca
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-a2a4-46b8283c8fda
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-8708-beb7843e0614
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-9817-cfe0ed26b39d
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-f840-0003a45aae65
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-bdd9-32cb1cf4b594
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-c78b-17f15e0c5297
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-95c2-c376897529a0
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-7f40-200fd2eb7d56
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-2655-ad98c4d2e93a
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-ca06-71f8763839f3
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-a089-395e24669a40
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-ddb7-c8ea90405c78
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-d19f-bb2d2c894bed
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-d149-15dac77c21ab
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-a16b-5be15c6cbbc1
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-b03a-268cf053618f
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-4c78-1aaf84cedb37
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-be24-d1219d59c6fe
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-fbee-fcf95ca867ee
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-edd7-e70e465c0f1c
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-fe6a-16b5a3026dd7
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-3c13-dde4dcb12cfe
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-1b6a-93c3698a5626
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-1f6d-359cc382a018
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-e7c7-b0b6dcb8a03c
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-7cd8-2f9c7130fb3e
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-7ab7-fec3aa7cfe96
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-ee62-2b386ef14b7e
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-d7d7-562a62cb88eb
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-9744-eefc2097f9fa
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-6276-4bcd82d353a9
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-9506-7d13bd515419
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-da1b-8a93cce03da6
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-fc2d-e1fd8029ce00
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-43e6-db80dec2965f
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-1955-a8156c0e18f9
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-f400-49bfb1e7b672
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-9a30-be2790345cfe
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-37b1-352cd6d2ff05
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-423b-21f38a2f91b6
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-f773-63d4111d7cc7
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-3557-37e50815cce5
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-d5b7-1c44e6bd66fd
00020000-5613-6cd1-9d8a-c7a83d536c6b	00030000-5613-6cd1-f169-3838328a8eef
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-8840-21ea08a4b9fd
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-6012-444e2b48a3ca
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-a2a4-46b8283c8fda
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-f840-0003a45aae65
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-7f40-200fd2eb7d56
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-ca06-71f8763839f3
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-ddb7-c8ea90405c78
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-d19f-bb2d2c894bed
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-d149-15dac77c21ab
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-a16b-5be15c6cbbc1
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-b03a-268cf053618f
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-4c78-1aaf84cedb37
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-be24-d1219d59c6fe
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-edd7-e70e465c0f1c
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-3c13-dde4dcb12cfe
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-1b6a-93c3698a5626
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-1f6d-359cc382a018
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-ee62-2b386ef14b7e
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-9744-eefc2097f9fa
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-9506-7d13bd515419
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-fc2d-e1fd8029ce00
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-9ec0-9628c36a8eac
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-7a6a-210f3ffc4d6b
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-e73f-6575a177db45
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-82a4-d34f8b947321
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-0f6f-b8d1d7096f19
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-dfdd-8cafb9a33d2b
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-d5b7-1c44e6bd66fd
00020000-5613-6cd1-a135-ac9a09fcadc6	00030000-5613-6cd1-f169-3838328a8eef
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-8840-21ea08a4b9fd
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-aa1f-8d78094dfd5f
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-6012-444e2b48a3ca
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-dd64-c346fac6bf66
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-404d-aaba10daa2d3
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-f3a3-ec46b186e0e0
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-a2a4-46b8283c8fda
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-f840-0003a45aae65
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-c78b-17f15e0c5297
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-7f40-200fd2eb7d56
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-ca06-71f8763839f3
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-ddb7-c8ea90405c78
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-d149-15dac77c21ab
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-a16b-5be15c6cbbc1
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-b03a-268cf053618f
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-be24-d1219d59c6fe
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-edd7-e70e465c0f1c
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-1f6d-359cc382a018
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-7cd8-2f9c7130fb3e
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-ee62-2b386ef14b7e
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-9744-eefc2097f9fa
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-9506-7d13bd515419
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-fc2d-e1fd8029ce00
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-1955-a8156c0e18f9
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-37b1-352cd6d2ff05
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-f773-63d4111d7cc7
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-d5b7-1c44e6bd66fd
00020000-5613-6cd1-bef4-8d453ee2e484	00030000-5613-6cd1-f169-3838328a8eef
00020000-5613-6cd1-4738-f1dc967bf579	00030000-5613-6cd1-8840-21ea08a4b9fd
00020000-5613-6cd1-4738-f1dc967bf579	00030000-5613-6cd1-11ba-6a99c4125b1b
00020000-5613-6cd1-4738-f1dc967bf579	00030000-5613-6cd1-9c86-3a7729c98f73
00020000-5613-6cd1-4738-f1dc967bf579	00030000-5613-6cd1-6012-444e2b48a3ca
00020000-5613-6cd1-4738-f1dc967bf579	00030000-5613-6cd1-a2a4-46b8283c8fda
00020000-5613-6cd1-4738-f1dc967bf579	00030000-5613-6cd1-f840-0003a45aae65
00020000-5613-6cd1-4738-f1dc967bf579	00030000-5613-6cd1-7f40-200fd2eb7d56
00020000-5613-6cd1-4738-f1dc967bf579	00030000-5613-6cd1-ca06-71f8763839f3
00020000-5613-6cd1-4738-f1dc967bf579	00030000-5613-6cd1-d149-15dac77c21ab
00020000-5613-6cd1-4738-f1dc967bf579	00030000-5613-6cd1-a16b-5be15c6cbbc1
00020000-5613-6cd1-4738-f1dc967bf579	00030000-5613-6cd1-be24-d1219d59c6fe
00020000-5613-6cd1-4738-f1dc967bf579	00030000-5613-6cd1-edd7-e70e465c0f1c
00020000-5613-6cd1-4738-f1dc967bf579	00030000-5613-6cd1-1f6d-359cc382a018
00020000-5613-6cd1-4738-f1dc967bf579	00030000-5613-6cd1-ee62-2b386ef14b7e
00020000-5613-6cd1-4738-f1dc967bf579	00030000-5613-6cd1-9744-eefc2097f9fa
00020000-5613-6cd1-4738-f1dc967bf579	00030000-5613-6cd1-9506-7d13bd515419
00020000-5613-6cd1-4738-f1dc967bf579	00030000-5613-6cd1-fc2d-e1fd8029ce00
00020000-5613-6cd1-4738-f1dc967bf579	00030000-5613-6cd1-1955-a8156c0e18f9
00020000-5613-6cd1-4738-f1dc967bf579	00030000-5613-6cd1-d5b7-1c44e6bd66fd
00020000-5613-6cd1-4738-f1dc967bf579	00030000-5613-6cd1-f169-3838328a8eef
00020000-5613-6cd1-a60a-010ec498e94c	00030000-5613-6cd1-8840-21ea08a4b9fd
00020000-5613-6cd1-a60a-010ec498e94c	00030000-5613-6cd1-6012-444e2b48a3ca
00020000-5613-6cd1-a60a-010ec498e94c	00030000-5613-6cd1-a2a4-46b8283c8fda
00020000-5613-6cd1-a60a-010ec498e94c	00030000-5613-6cd1-f840-0003a45aae65
00020000-5613-6cd1-a60a-010ec498e94c	00030000-5613-6cd1-7f40-200fd2eb7d56
00020000-5613-6cd1-a60a-010ec498e94c	00030000-5613-6cd1-ca06-71f8763839f3
00020000-5613-6cd1-a60a-010ec498e94c	00030000-5613-6cd1-d149-15dac77c21ab
00020000-5613-6cd1-a60a-010ec498e94c	00030000-5613-6cd1-a16b-5be15c6cbbc1
00020000-5613-6cd1-a60a-010ec498e94c	00030000-5613-6cd1-be24-d1219d59c6fe
00020000-5613-6cd1-a60a-010ec498e94c	00030000-5613-6cd1-edd7-e70e465c0f1c
00020000-5613-6cd1-a60a-010ec498e94c	00030000-5613-6cd1-1f6d-359cc382a018
00020000-5613-6cd1-a60a-010ec498e94c	00030000-5613-6cd1-ee62-2b386ef14b7e
00020000-5613-6cd1-a60a-010ec498e94c	00030000-5613-6cd1-9744-eefc2097f9fa
00020000-5613-6cd1-a60a-010ec498e94c	00030000-5613-6cd1-9506-7d13bd515419
00020000-5613-6cd1-a60a-010ec498e94c	00030000-5613-6cd1-fc2d-e1fd8029ce00
00020000-5613-6cd1-a60a-010ec498e94c	00030000-5613-6cd1-5e42-40ba345a5f9c
00020000-5613-6cd1-a60a-010ec498e94c	00030000-5613-6cd1-da0d-4ca71063e527
00020000-5613-6cd1-a60a-010ec498e94c	00030000-5613-6cd1-1955-a8156c0e18f9
00020000-5613-6cd1-a60a-010ec498e94c	00030000-5613-6cd1-d5b7-1c44e6bd66fd
00020000-5613-6cd1-a60a-010ec498e94c	00030000-5613-6cd1-f169-3838328a8eef
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-a20c-ffb501d85b2b
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-6292-6addc749b1fb
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-da0d-4ca71063e527
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-8708-beb7843e0614
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-c480-d2246bacf650
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-453f-b660877f73d9
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-e278-37324b44a9f5
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-8840-21ea08a4b9fd
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-11ba-6a99c4125b1b
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-aa1f-8d78094dfd5f
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-9c86-3a7729c98f73
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-6012-444e2b48a3ca
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-dd64-c346fac6bf66
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-404d-aaba10daa2d3
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-c2db-da6dc729027f
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-f3a3-ec46b186e0e0
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-5f86-65ba6e6a6269
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-a2a4-46b8283c8fda
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-9817-cfe0ed26b39d
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-f840-0003a45aae65
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-bdd9-32cb1cf4b594
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-bfb8-d7e34f706446
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-cfdc-2d28d5610e00
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-53ea-46c97d16ae17
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-1cca-a631b2d56c30
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-c78b-17f15e0c5297
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-95c2-c376897529a0
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-7f40-200fd2eb7d56
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-2655-ad98c4d2e93a
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-ca06-71f8763839f3
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-a089-395e24669a40
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-ddb7-c8ea90405c78
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-d19f-bb2d2c894bed
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-5707-01498cbf1263
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-8947-e1cf321b0b8c
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-3b2e-981f8fe44f20
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-1147-4d6ee51d642c
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-d149-15dac77c21ab
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-295b-0c51a0c5f435
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-a16b-5be15c6cbbc1
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-8cc4-0a6ed94376f0
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-b03a-268cf053618f
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-4c78-1aaf84cedb37
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-b057-577b211b3d54
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-5605-895e8fb69d83
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-4ab3-249d0bf4b18f
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-aa59-a5600d4132ff
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-8837-9a6a12e07a07
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-d1fe-a7840c1366cc
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-be24-d1219d59c6fe
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-fbee-fcf95ca867ee
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-edd7-e70e465c0f1c
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-fe6a-16b5a3026dd7
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-cb75-2b43633f8249
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-c02b-ea3acb09a2ff
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-5f82-6dfb3b626fc7
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-1eef-1c19ee2c9b1a
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-3c13-dde4dcb12cfe
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-1b6a-93c3698a5626
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-1f6d-359cc382a018
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-e7c7-b0b6dcb8a03c
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-f90f-6c3280ba9355
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-5fe2-af33d448c090
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-ee3e-579775d7fca2
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-0837-77738894c52b
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-7cd8-2f9c7130fb3e
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-7ab7-fec3aa7cfe96
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-3ebf-e91a37815b73
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-47f5-dab1c1777d2f
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-c889-6e592b59de86
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-32d7-8fc0fce83108
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-e1b2-cb96a6448bc2
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-c258-7f697ebde08c
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-0f48-84f0b278abcd
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-0db7-4a4a18276e3c
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-78bf-3b3c39700a14
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-8dbf-ef45f90f5fcf
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-9c0e-545238a1ca80
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-bfb1-cf7f35f6a4b8
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-7a85-bb07702147a6
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-18da-63b4a2196ce5
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-4b00-3fc5c742b96c
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-2ebd-bcfcc4101839
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-7b2d-26f977ad4097
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-2136-2506e1da70b4
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-4872-1ce186663888
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-37d9-bf51fe012cf7
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-ee62-2b386ef14b7e
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-d7d7-562a62cb88eb
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-310c-f55b24440edb
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-0bc6-c3681511d371
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-6115-178e70df66bb
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-2c69-b9a26041f596
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-9744-eefc2097f9fa
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-6276-4bcd82d353a9
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-9506-7d13bd515419
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-da1b-8a93cce03da6
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-2f95-93a3b02ac227
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-deff-1603ba1d3b38
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-7d4e-72a261231ab3
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-de53-d510c9abc9c1
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-54cb-2de15a00ad73
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-fe48-d8c499c3d996
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-1d38-6105e4ce0c05
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-561d-0714c73a04d7
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-fc2d-e1fd8029ce00
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-43e6-db80dec2965f
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-46ee-fcba8df59eb7
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-9510-4d836f901818
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-e0a5-d6bd3dac68fe
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-fc8e-6c24bb989868
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-99c1-67a26053c77a
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-4436-e16f9edac1db
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-97bf-b863c01ff302
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-5043-b654fd5c1d9a
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-9ec0-9628c36a8eac
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-7a6a-210f3ffc4d6b
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-5e42-40ba345a5f9c
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-8eef-77bd573333f1
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-1955-a8156c0e18f9
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-26e5-a2c63e4cb495
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-4307-6176057bb291
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-1566-e4e226174174
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-e73f-6575a177db45
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-82a4-d34f8b947321
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-f400-49bfb1e7b672
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-9a30-be2790345cfe
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-37b1-352cd6d2ff05
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-423b-21f38a2f91b6
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-7008-03ff771f3312
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-5695-522f6a59e589
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-49f8-3f6d434c8b63
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-4df4-4ef165630f1e
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-0f6f-b8d1d7096f19
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-dfdd-8cafb9a33d2b
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-f773-63d4111d7cc7
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-3557-37e50815cce5
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-d5b7-1c44e6bd66fd
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-6268-c2e83573e292
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-f169-3838328a8eef
00020000-5613-6cd2-44fb-9050fa145030	00030000-5613-6cd1-8865-4e9425b02572
\.


--
-- TOC entry 3007 (class 0 OID 21331190)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 21331224)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 21331360)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5613-6cd3-1407-60a4cc1e9595	00090000-5613-6cd3-0526-6adb55eda434	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5613-6cd3-fb07-62d3091de9e0	00090000-5613-6cd3-55b0-2c468f73bece	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5613-6cd3-d426-456f2af9a21c	00090000-5613-6cd3-93c9-a0669e5dcecb	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5613-6cd3-6ca0-73e83abe5d0c	00090000-5613-6cd3-28bd-f247ec8581c9	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2983 (class 0 OID 21330925)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5613-6cd2-971c-5805af1683ad	00040000-5613-6cd1-c923-b8e971757f3b	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-6cd2-49cb-20f9fcbd4939	00040000-5613-6cd1-c923-b8e971757f3b	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5613-6cd2-55a9-6b8713807f0d	00040000-5613-6cd1-c923-b8e971757f3b	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-6cd2-5a53-4c3b3aef6fc3	00040000-5613-6cd1-c923-b8e971757f3b	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-6cd2-ba84-20ab12eb86d0	00040000-5613-6cd1-c923-b8e971757f3b	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-6cd2-6893-0f1acdcc6005	00040000-5613-6cd1-e856-3fea669fae6b	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-6cd2-5220-093b50d3e88b	00040000-5613-6cd1-36db-e3e14e39473d	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-6cd2-873e-d381c91abd7d	00040000-5613-6cd1-e3b4-f82e2604629a	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-6cd2-d051-d23d22bf8f3e	00040000-5613-6cd1-53c0-4e2f5c3e291e	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-6cd4-d9ae-4a3bb47ce142	00040000-5613-6cd1-c923-b8e971757f3b	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2985 (class 0 OID 21330959)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5613-6cd0-0b75-fe8780abbf46	8341	Adlešiči
00050000-5613-6cd0-c0ff-58b50ee17d33	5270	Ajdovščina
00050000-5613-6cd0-580a-28ec6f4dd798	6280	Ankaran/Ancarano
00050000-5613-6cd0-a437-d56c0aaca54b	9253	Apače
00050000-5613-6cd0-d8ee-b62ff40f797d	8253	Artiče
00050000-5613-6cd0-a819-cf69ef4de029	4275	Begunje na Gorenjskem
00050000-5613-6cd0-f13f-9e977b41f87f	1382	Begunje pri Cerknici
00050000-5613-6cd0-52a8-c0ceefc72621	9231	Beltinci
00050000-5613-6cd0-0138-3b025987d881	2234	Benedikt
00050000-5613-6cd0-1622-7fd12c9b7d69	2345	Bistrica ob Dravi
00050000-5613-6cd0-80c7-7c13b878ea3e	3256	Bistrica ob Sotli
00050000-5613-6cd0-19a4-50472526c513	8259	Bizeljsko
00050000-5613-6cd0-7235-f9caacfe6efa	1223	Blagovica
00050000-5613-6cd0-faa2-2f14739496d9	8283	Blanca
00050000-5613-6cd0-b1d6-1cecfbd24f76	4260	Bled
00050000-5613-6cd0-e3d7-24f5efa0a6cb	4273	Blejska Dobrava
00050000-5613-6cd0-a0ea-d74263e326c8	9265	Bodonci
00050000-5613-6cd0-d2ab-73ae55244088	9222	Bogojina
00050000-5613-6cd0-b2bb-5f65ffe31b0c	4263	Bohinjska Bela
00050000-5613-6cd0-6960-486853d0ecc1	4264	Bohinjska Bistrica
00050000-5613-6cd0-35e8-9cdd1881f74b	4265	Bohinjsko jezero
00050000-5613-6cd0-fb34-1423c774dfed	1353	Borovnica
00050000-5613-6cd0-8918-25324d106c76	8294	Boštanj
00050000-5613-6cd0-36bc-98613741b2b1	5230	Bovec
00050000-5613-6cd0-6a5e-e7dcadba39a7	5295	Branik
00050000-5613-6cd0-becb-d84552b82474	3314	Braslovče
00050000-5613-6cd0-e68d-7f360e101387	5223	Breginj
00050000-5613-6cd0-cddb-a92db2a2ef65	8280	Brestanica
00050000-5613-6cd0-c34d-5a7a05820712	2354	Bresternica
00050000-5613-6cd0-ee64-c894631f4664	4243	Brezje
00050000-5613-6cd0-92d6-9a9623a39770	1351	Brezovica pri Ljubljani
00050000-5613-6cd0-4967-6981b108ff1d	8250	Brežice
00050000-5613-6cd0-d65c-84e808f20340	4210	Brnik - Aerodrom
00050000-5613-6cd0-a874-d1f44a0a0db5	8321	Brusnice
00050000-5613-6cd0-2537-048c47484be8	3255	Buče
00050000-5613-6cd0-705e-babe76335d79	8276	Bučka 
00050000-5613-6cd0-4559-b36c37362409	9261	Cankova
00050000-5613-6cd0-f1e7-514129687587	3000	Celje 
00050000-5613-6cd0-de9d-1500610937ed	3001	Celje - poštni predali
00050000-5613-6cd0-e66e-9fa610875821	4207	Cerklje na Gorenjskem
00050000-5613-6cd0-f341-3819adc01dfd	8263	Cerklje ob Krki
00050000-5613-6cd0-d7f7-fd41b60810f8	1380	Cerknica
00050000-5613-6cd0-244e-98bd2b3397c4	5282	Cerkno
00050000-5613-6cd0-9ea4-99c890684df3	2236	Cerkvenjak
00050000-5613-6cd0-2a8a-c8cb2fad781a	2215	Ceršak
00050000-5613-6cd0-e9bb-8890f5b3a8c7	2326	Cirkovce
00050000-5613-6cd0-c05d-a401d26f8509	2282	Cirkulane
00050000-5613-6cd0-6d6a-73e850e304a3	5273	Col
00050000-5613-6cd0-f348-1279f52327ed	8251	Čatež ob Savi
00050000-5613-6cd0-16fb-8cebd0f50e37	1413	Čemšenik
00050000-5613-6cd0-fcda-f09eae80315e	5253	Čepovan
00050000-5613-6cd0-feac-299f3156762d	9232	Črenšovci
00050000-5613-6cd0-1307-bc3521262121	2393	Črna na Koroškem
00050000-5613-6cd0-4fcc-db5e697bfc35	6275	Črni Kal
00050000-5613-6cd0-b86d-9a4b397d42d6	5274	Črni Vrh nad Idrijo
00050000-5613-6cd0-9f39-4ab5adcc213c	5262	Črniče
00050000-5613-6cd0-029b-b91850546eab	8340	Črnomelj
00050000-5613-6cd0-fc57-89b95171d345	6271	Dekani
00050000-5613-6cd0-dad5-6939115dd57d	5210	Deskle
00050000-5613-6cd0-bbf0-954272c91ce0	2253	Destrnik
00050000-5613-6cd0-66b8-5d46e0673a89	6215	Divača
00050000-5613-6cd0-a9b6-5b29e4cd0323	1233	Dob
00050000-5613-6cd0-e289-abcaf998e613	3224	Dobje pri Planini
00050000-5613-6cd0-7bbd-bc9e71780647	8257	Dobova
00050000-5613-6cd0-ef92-9e9f433984a6	1423	Dobovec
00050000-5613-6cd0-28e2-61793958d605	5263	Dobravlje
00050000-5613-6cd0-d05d-445870ec828a	3204	Dobrna
00050000-5613-6cd0-a150-a7a0e6ba4fad	8211	Dobrnič
00050000-5613-6cd0-34e0-a3fa41ba9773	1356	Dobrova
00050000-5613-6cd0-25c1-d288518a4585	9223	Dobrovnik/Dobronak 
00050000-5613-6cd0-2791-ab4490d4e464	5212	Dobrovo v Brdih
00050000-5613-6cd0-5141-37aa3a480902	1431	Dol pri Hrastniku
00050000-5613-6cd0-0096-e57b3c1577e6	1262	Dol pri Ljubljani
00050000-5613-6cd0-7021-6235a48ae3e4	1273	Dole pri Litiji
00050000-5613-6cd0-a337-134d66181b89	1331	Dolenja vas
00050000-5613-6cd0-eb66-01531fe28c10	8350	Dolenjske Toplice
00050000-5613-6cd0-71be-79521ecbbf7e	1230	Domžale
00050000-5613-6cd0-6716-cc0f327f26cc	2252	Dornava
00050000-5613-6cd0-e1df-02e143088fd2	5294	Dornberk
00050000-5613-6cd0-39d1-96fe7f70889a	1319	Draga
00050000-5613-6cd0-d2db-0064be056b08	8343	Dragatuš
00050000-5613-6cd0-338e-8edecfc73bc4	3222	Dramlje
00050000-5613-6cd0-ff10-830d3e656a68	2370	Dravograd
00050000-5613-6cd0-d261-fcb96ef806b9	4203	Duplje
00050000-5613-6cd0-282a-bf5ad91d3f2a	6221	Dutovlje
00050000-5613-6cd0-772b-e4d6d1daa95b	8361	Dvor
00050000-5613-6cd0-ef07-92967865b6bd	2343	Fala
00050000-5613-6cd0-9122-f8d3dd84e146	9208	Fokovci
00050000-5613-6cd0-02f4-7cbf3dba8da3	2313	Fram
00050000-5613-6cd0-8c5b-32f6e7f0d5f9	3213	Frankolovo
00050000-5613-6cd0-3875-a70c88e63bea	1274	Gabrovka
00050000-5613-6cd0-915e-7282bbea6477	8254	Globoko
00050000-5613-6cd0-0090-bba1990b799f	5275	Godovič
00050000-5613-6cd0-01fc-97261ff0ccb0	4204	Golnik
00050000-5613-6cd0-9a8d-5695273a9882	3303	Gomilsko
00050000-5613-6cd0-da36-17625eb5e022	4224	Gorenja vas
00050000-5613-6cd0-93b9-273f95be0236	3263	Gorica pri Slivnici
00050000-5613-6cd0-4f23-d0bff5d91090	2272	Gorišnica
00050000-5613-6cd0-df31-318aa3b10370	9250	Gornja Radgona
00050000-5613-6cd0-5160-a1c8d29c8992	3342	Gornji Grad
00050000-5613-6cd0-a990-c5f4958dbead	4282	Gozd Martuljek
00050000-5613-6cd0-3d29-39782df37242	6272	Gračišče
00050000-5613-6cd0-40d4-bbed95093a34	9264	Grad
00050000-5613-6cd0-1e8d-325fc55db6cf	8332	Gradac
00050000-5613-6cd0-e3b1-2b781b8ea649	1384	Grahovo
00050000-5613-6cd0-2239-8efe693f1973	5242	Grahovo ob Bači
00050000-5613-6cd0-acd9-a1517401cfc7	5251	Grgar
00050000-5613-6cd0-b116-1e0f903cf8c1	3302	Griže
00050000-5613-6cd0-61b1-a1016758e8b1	3231	Grobelno
00050000-5613-6cd0-0545-1437e749ccba	1290	Grosuplje
00050000-5613-6cd0-2a3c-780dab1b2039	2288	Hajdina
00050000-5613-6cd0-66bb-427d9c0cd316	8362	Hinje
00050000-5613-6cd0-6b4f-999b523428d8	2311	Hoče
00050000-5613-6cd0-6112-c5ace52c1de0	9205	Hodoš/Hodos
00050000-5613-6cd0-481c-6fcd2446dc09	1354	Horjul
00050000-5613-6cd0-7033-e7c75e07d7ec	1372	Hotedršica
00050000-5613-6cd0-cf59-88aaadc1a7cb	1430	Hrastnik
00050000-5613-6cd0-8153-c96198f98e90	6225	Hruševje
00050000-5613-6cd0-56b3-169003c0c4f2	4276	Hrušica
00050000-5613-6cd0-c183-e211fe6bacf6	5280	Idrija
00050000-5613-6cd0-1c3e-2eab95bbbc1f	1292	Ig
00050000-5613-6cd0-1776-11b09f09f88b	6250	Ilirska Bistrica
00050000-5613-6cd0-f74d-75210f1f8d3d	6251	Ilirska Bistrica-Trnovo
00050000-5613-6cd0-fb5a-5c6d33fc3b91	1295	Ivančna Gorica
00050000-5613-6cd0-8a83-88bf3d6b4d77	2259	Ivanjkovci
00050000-5613-6cd0-70ac-046f1a43a757	1411	Izlake
00050000-5613-6cd0-e791-09b04554f768	6310	Izola/Isola
00050000-5613-6cd0-46f9-6f824a042287	2222	Jakobski Dol
00050000-5613-6cd0-b00e-2868b1a923e2	2221	Jarenina
00050000-5613-6cd0-f6c9-63c9435aed9f	6254	Jelšane
00050000-5613-6cd0-a74a-ae905c7373ec	4270	Jesenice
00050000-5613-6cd0-d6f3-43084f9dba2e	8261	Jesenice na Dolenjskem
00050000-5613-6cd0-73bc-f2cf552273b6	3273	Jurklošter
00050000-5613-6cd0-cf9a-3dd2897a5687	2223	Jurovski Dol
00050000-5613-6cd0-d061-77dd34a0439e	2256	Juršinci
00050000-5613-6cd0-a348-065521710b13	5214	Kal nad Kanalom
00050000-5613-6cd0-843b-9812508a5183	3233	Kalobje
00050000-5613-6cd0-60b3-0cd013fafe66	4246	Kamna Gorica
00050000-5613-6cd0-8d23-724b986eb37c	2351	Kamnica
00050000-5613-6cd0-c31a-f529d174f415	1241	Kamnik
00050000-5613-6cd0-d93d-7ac55d6fce7b	5213	Kanal
00050000-5613-6cd0-7995-86197f45f173	8258	Kapele
00050000-5613-6cd0-7b71-9b2fd894e446	2362	Kapla
00050000-5613-6cd0-19eb-f4007bd9cfa6	2325	Kidričevo
00050000-5613-6cd0-f237-d982046fcbe4	1412	Kisovec
00050000-5613-6cd0-0fa9-6e0c9d92b11e	6253	Knežak
00050000-5613-6cd0-8d3e-1a2d309c2838	5222	Kobarid
00050000-5613-6cd0-1ab4-ae76b1bd932e	9227	Kobilje
00050000-5613-6cd0-1b0a-b066b628d9d0	1330	Kočevje
00050000-5613-6cd0-02a4-b890b68f9820	1338	Kočevska Reka
00050000-5613-6cd0-4ca3-61cead3005b7	2276	Kog
00050000-5613-6cd0-8d7e-204e2a00f29d	5211	Kojsko
00050000-5613-6cd0-d73b-f05dc546cccc	6223	Komen
00050000-5613-6cd0-062a-99136a6f6030	1218	Komenda
00050000-5613-6cd0-01d8-8465fbfdb207	6000	Koper/Capodistria 
00050000-5613-6cd0-310d-1a5f456387c3	6001	Koper/Capodistria - poštni predali
00050000-5613-6cd0-4cbc-8fc112911b66	8282	Koprivnica
00050000-5613-6cd0-8de5-e8438f822df2	5296	Kostanjevica na Krasu
00050000-5613-6cd0-f09c-510948564d35	8311	Kostanjevica na Krki
00050000-5613-6cd0-4f87-945bcca21f82	1336	Kostel
00050000-5613-6cd0-9182-1b054b374d84	6256	Košana
00050000-5613-6cd0-4129-95210c33b467	2394	Kotlje
00050000-5613-6cd0-5c9f-77fc7ff06e54	6240	Kozina
00050000-5613-6cd0-581c-84f778593dfc	3260	Kozje
00050000-5613-6cd0-c8df-4753deb224f5	4000	Kranj 
00050000-5613-6cd0-96d1-f2a01a8c88a7	4001	Kranj - poštni predali
00050000-5613-6cd0-1c2e-212005068cc5	4280	Kranjska Gora
00050000-5613-6cd0-db1b-0bf7f47d0a8a	1281	Kresnice
00050000-5613-6cd0-5f82-e096a9d65d07	4294	Križe
00050000-5613-6cd0-26df-71133089e89f	9206	Križevci
00050000-5613-6cd0-e187-5e1820940af3	9242	Križevci pri Ljutomeru
00050000-5613-6cd0-4edc-9544a2b5e327	1301	Krka
00050000-5613-6cd0-ac50-73e33087c8e9	8296	Krmelj
00050000-5613-6cd0-fd33-92673685559e	4245	Kropa
00050000-5613-6cd0-cb9e-ebdf1b3758a5	8262	Krška vas
00050000-5613-6cd0-15d1-fdd11dd80785	8270	Krško
00050000-5613-6cd0-2874-f2fe97c68b1f	9263	Kuzma
00050000-5613-6cd0-9527-79414fb6cff5	2318	Laporje
00050000-5613-6cd0-94c3-c383057516db	3270	Laško
00050000-5613-6cd0-27eb-3c673617e630	1219	Laze v Tuhinju
00050000-5613-6cd0-8c58-d2ece04108c9	2230	Lenart v Slovenskih goricah
00050000-5613-6cd0-0937-b01e76c85dcd	9220	Lendava/Lendva
00050000-5613-6cd0-3bad-29ace5994005	4248	Lesce
00050000-5613-6cd0-357e-61e6ad5e2980	3261	Lesično
00050000-5613-6cd0-5a83-a892f64f34fd	8273	Leskovec pri Krškem
00050000-5613-6cd0-193d-013a78db9f61	2372	Libeliče
00050000-5613-6cd0-dd10-cb5139243e69	2341	Limbuš
00050000-5613-6cd0-4be7-59129ba11fc2	1270	Litija
00050000-5613-6cd0-310d-61f02ef147f0	3202	Ljubečna
00050000-5613-6cd0-9061-ef8df7262a37	1000	Ljubljana 
00050000-5613-6cd0-450e-151ab753ecf7	1001	Ljubljana - poštni predali
00050000-5613-6cd0-0ca6-d5fc0edaa2b2	1231	Ljubljana - Črnuče
00050000-5613-6cd0-06b9-10dd30ed6c33	1261	Ljubljana - Dobrunje
00050000-5613-6cd0-2c41-ffbbfb6ae1fa	1260	Ljubljana - Polje
00050000-5613-6cd0-a4d6-9f4feed2f21b	1210	Ljubljana - Šentvid
00050000-5613-6cd0-e657-0da35e78cd7d	1211	Ljubljana - Šmartno
00050000-5613-6cd0-78cd-6170ff8bce33	3333	Ljubno ob Savinji
00050000-5613-6cd0-d624-fa29532d3253	9240	Ljutomer
00050000-5613-6cd0-c01b-b32bb2449800	3215	Loče
00050000-5613-6cd0-556f-df0a47a22992	5231	Log pod Mangartom
00050000-5613-6cd0-852c-dd768e6fc76a	1358	Log pri Brezovici
00050000-5613-6cd0-d6c8-e55cfa0894a5	1370	Logatec
00050000-5613-6cd0-ddbb-45f5c27c45dd	1371	Logatec
00050000-5613-6cd0-d10f-1d3595162387	1434	Loka pri Zidanem Mostu
00050000-5613-6cd0-50fa-d43ebc599791	3223	Loka pri Žusmu
00050000-5613-6cd0-b841-b7b11f365aba	6219	Lokev
00050000-5613-6cd0-a8e0-ac6e652678ed	1318	Loški Potok
00050000-5613-6cd0-a88a-a07dc856b378	2324	Lovrenc na Dravskem polju
00050000-5613-6cd0-0ab0-28f19e7668b8	2344	Lovrenc na Pohorju
00050000-5613-6cd0-108d-cd96b6574012	3334	Luče
00050000-5613-6cd0-149b-3dd98b827ddd	1225	Lukovica
00050000-5613-6cd0-df5e-a8ab90bc8fb6	9202	Mačkovci
00050000-5613-6cd0-570b-20915d73ccd6	2322	Majšperk
00050000-5613-6cd0-0f7d-c3047c65c677	2321	Makole
00050000-5613-6cd0-35d1-35baf0c9bda9	9243	Mala Nedelja
00050000-5613-6cd0-8d3d-b6385c613350	2229	Malečnik
00050000-5613-6cd0-6dfa-52c8e5271abe	6273	Marezige
00050000-5613-6cd0-e10c-0661377f2961	2000	Maribor 
00050000-5613-6cd0-4465-3fd14a978393	2001	Maribor - poštni predali
00050000-5613-6cd0-ca85-da45c0a9cf7c	2206	Marjeta na Dravskem polju
00050000-5613-6cd0-0005-3dd064ec5522	2281	Markovci
00050000-5613-6cd0-19f6-fe18b8ca0032	9221	Martjanci
00050000-5613-6cd0-c1e3-7a7ed8ec9bd5	6242	Materija
00050000-5613-6cd0-39f0-d337e981c996	4211	Mavčiče
00050000-5613-6cd0-7818-1f5a4cb09a98	1215	Medvode
00050000-5613-6cd0-1692-a6d01cff084c	1234	Mengeš
00050000-5613-6cd0-0515-fa2ae72e5636	8330	Metlika
00050000-5613-6cd0-c628-e5bac41144bd	2392	Mežica
00050000-5613-6cd0-2299-57828c555d0f	2204	Miklavž na Dravskem polju
00050000-5613-6cd0-7254-e454604daf7a	2275	Miklavž pri Ormožu
00050000-5613-6cd0-8451-b8bcccff2f86	5291	Miren
00050000-5613-6cd0-cd21-e513d779f123	8233	Mirna
00050000-5613-6cd0-b508-27b35d916cc6	8216	Mirna Peč
00050000-5613-6cd0-c2f0-238372b1905a	2382	Mislinja
00050000-5613-6cd0-d8a0-ced9b0125d01	4281	Mojstrana
00050000-5613-6cd0-1be6-97905c33f0e0	8230	Mokronog
00050000-5613-6cd0-323c-0e040bb66615	1251	Moravče
00050000-5613-6cd0-8ce8-6a9b817e22fc	9226	Moravske Toplice
00050000-5613-6cd0-5a1c-da0735efab7f	5216	Most na Soči
00050000-5613-6cd0-6601-3d12b6f55b18	1221	Motnik
00050000-5613-6cd0-e77e-315f08b14f03	3330	Mozirje
00050000-5613-6cd0-208e-90ef11f43d15	9000	Murska Sobota 
00050000-5613-6cd0-b82a-57eb449ab11e	9001	Murska Sobota - poštni predali
00050000-5613-6cd0-7340-6a1344311bcf	2366	Muta
00050000-5613-6cd0-aefe-e4313a913672	4202	Naklo
00050000-5613-6cd0-bc05-d6982b710a99	3331	Nazarje
00050000-5613-6cd0-f8fb-2d5e81715253	1357	Notranje Gorice
00050000-5613-6cd0-282b-cfd9ae5c52a4	3203	Nova Cerkev
00050000-5613-6cd0-cf65-6803bd40c8bf	5000	Nova Gorica 
00050000-5613-6cd0-1872-6b0e7092fff0	5001	Nova Gorica - poštni predali
00050000-5613-6cd0-162f-5a4a8ef91a78	1385	Nova vas
00050000-5613-6cd0-d773-fae3aa6d24dc	8000	Novo mesto
00050000-5613-6cd0-adbf-adc294c06d5a	8001	Novo mesto - poštni predali
00050000-5613-6cd0-5df1-76ac3d58a05d	6243	Obrov
00050000-5613-6cd0-7942-3b174b5fb4f3	9233	Odranci
00050000-5613-6cd0-b5b2-bbee600b8b88	2317	Oplotnica
00050000-5613-6cd0-63cc-a3b5edb79995	2312	Orehova vas
00050000-5613-6cd0-3b97-a3dea51f992b	2270	Ormož
00050000-5613-6cd0-1281-53802a57c870	1316	Ortnek
00050000-5613-6cd0-f143-a072a40a3e82	1337	Osilnica
00050000-5613-6cd0-8cdd-5ceb0ba18f32	8222	Otočec
00050000-5613-6cd0-d98d-fed4a3f167d4	2361	Ožbalt
00050000-5613-6cd0-30f5-d8a06ec8f971	2231	Pernica
00050000-5613-6cd0-b2da-a1f57b3c9013	2211	Pesnica pri Mariboru
00050000-5613-6cd0-638c-ed764401eaa9	9203	Petrovci
00050000-5613-6cd0-5dab-3b1548534c2b	3301	Petrovče
00050000-5613-6cd0-e630-ede2b4b115b2	6330	Piran/Pirano
00050000-5613-6cd0-6a44-84cbed8071c5	8255	Pišece
00050000-5613-6cd0-3030-cef84fdbf66d	6257	Pivka
00050000-5613-6cd0-463c-ec39b2b435e1	6232	Planina
00050000-5613-6cd0-f2c7-5359939539fa	3225	Planina pri Sevnici
00050000-5613-6cd0-4e0d-c55b1498087e	6276	Pobegi
00050000-5613-6cd0-44d2-72dca8061171	8312	Podbočje
00050000-5613-6cd0-0a3e-9661b4bdb9a3	5243	Podbrdo
00050000-5613-6cd0-7154-9f18ba7e27c9	3254	Podčetrtek
00050000-5613-6cd0-8213-ac9de21b64d9	2273	Podgorci
00050000-5613-6cd0-063a-02fe5018223d	6216	Podgorje
00050000-5613-6cd0-2a68-73a1015a65a4	2381	Podgorje pri Slovenj Gradcu
00050000-5613-6cd0-2658-9f51b838ef01	6244	Podgrad
00050000-5613-6cd0-9be5-c99b5a0825c2	1414	Podkum
00050000-5613-6cd0-a531-b6fa55f0d02e	2286	Podlehnik
00050000-5613-6cd0-83f2-8c8614de6b36	5272	Podnanos
00050000-5613-6cd0-01fa-e88b719fc0b2	4244	Podnart
00050000-5613-6cd0-5861-de602ef76fa0	3241	Podplat
00050000-5613-6cd0-840e-8eb6457ad553	3257	Podsreda
00050000-5613-6cd0-fc3c-35683b3cf39f	2363	Podvelka
00050000-5613-6cd0-aadc-7951ca8edd76	2208	Pohorje
00050000-5613-6cd0-191b-69317c473fe9	2257	Polenšak
00050000-5613-6cd0-7d3a-633f08cd6930	1355	Polhov Gradec
00050000-5613-6cd0-a2c4-b021e3d3d61c	4223	Poljane nad Škofjo Loko
00050000-5613-6cd0-89d1-88b4aa0ec420	2319	Poljčane
00050000-5613-6cd0-79fe-f5bcd448fd95	1272	Polšnik
00050000-5613-6cd0-14d1-3a3851aac67b	3313	Polzela
00050000-5613-6cd0-dba3-b7674d86630a	3232	Ponikva
00050000-5613-6cd0-2215-b263eebb0cde	6320	Portorož/Portorose
00050000-5613-6cd0-bf58-f0c6dc7738fa	6230	Postojna
00050000-5613-6cd0-8d54-b00ac60e596c	2331	Pragersko
00050000-5613-6cd0-89ae-abbb85cc600f	3312	Prebold
00050000-5613-6cd0-4bbd-45810602f9ec	4205	Preddvor
00050000-5613-6cd0-4ca2-1646790410d9	6255	Prem
00050000-5613-6cd0-fe35-2a38ca084e38	1352	Preserje
00050000-5613-6cd0-ac2d-696883bfe4a2	6258	Prestranek
00050000-5613-6cd0-941b-3257d677255a	2391	Prevalje
00050000-5613-6cd0-298f-388513cacc0b	3262	Prevorje
00050000-5613-6cd0-077d-9eedc5838033	1276	Primskovo 
00050000-5613-6cd0-f505-ca7d77452f15	3253	Pristava pri Mestinju
00050000-5613-6cd0-75a8-3f056a8b8e35	9207	Prosenjakovci/Partosfalva
00050000-5613-6cd0-537a-ffd46699ebb4	5297	Prvačina
00050000-5613-6cd0-ffce-7400cd7e20a4	2250	Ptuj
00050000-5613-6cd0-a7fc-e1eaa6a0cee0	2323	Ptujska Gora
00050000-5613-6cd0-33de-d9ee89af0052	9201	Puconci
00050000-5613-6cd0-4fea-4f4d2a2b5b2b	2327	Rače
00050000-5613-6cd0-e813-0f18e7e1d5f5	1433	Radeče
00050000-5613-6cd0-b70e-85b5e6ccdfce	9252	Radenci
00050000-5613-6cd0-d894-cc1e17bc7593	2360	Radlje ob Dravi
00050000-5613-6cd0-1138-5be343ef4021	1235	Radomlje
00050000-5613-6cd0-98fa-883cdbca218a	4240	Radovljica
00050000-5613-6cd0-700c-8e29e6201d6e	8274	Raka
00050000-5613-6cd0-cc41-30ec1e8c65da	1381	Rakek
00050000-5613-6cd0-55f8-6c28c7304cbf	4283	Rateče - Planica
00050000-5613-6cd0-de1d-323b3805b322	2390	Ravne na Koroškem
00050000-5613-6cd0-1e46-4855142e9735	9246	Razkrižje
00050000-5613-6cd0-bf20-d4146283b223	3332	Rečica ob Savinji
00050000-5613-6cd0-ca30-ba4c62e247d9	5292	Renče
00050000-5613-6cd0-a183-c9e023f35856	1310	Ribnica
00050000-5613-6cd0-4104-b9fd9caf48c0	2364	Ribnica na Pohorju
00050000-5613-6cd0-6495-ec181258c8e7	3272	Rimske Toplice
00050000-5613-6cd0-db1a-5ddd016b9d87	1314	Rob
00050000-5613-6cd0-190c-3df1b487ef95	5215	Ročinj
00050000-5613-6cd0-bc24-d9c271309c55	3250	Rogaška Slatina
00050000-5613-6cd0-bdec-b62d80706701	9262	Rogašovci
00050000-5613-6cd0-bbca-a4cd719cfc1a	3252	Rogatec
00050000-5613-6cd0-a9d6-0dfc9a3a2ec0	1373	Rovte
00050000-5613-6cd0-7f76-39f0618546db	2342	Ruše
00050000-5613-6cd0-c50a-5929c07a522c	1282	Sava
00050000-5613-6cd0-7917-620454d64574	6333	Sečovlje/Sicciole
00050000-5613-6cd0-4ebc-290b6f6c433c	4227	Selca
00050000-5613-6cd0-2dc6-ed695cc68e07	2352	Selnica ob Dravi
00050000-5613-6cd0-264a-85c1a5dd3e97	8333	Semič
00050000-5613-6cd0-c2f1-64038caa63fb	8281	Senovo
00050000-5613-6cd0-33e3-bd6c55dabac0	6224	Senožeče
00050000-5613-6cd0-afb1-4d496e8e5146	8290	Sevnica
00050000-5613-6cd0-365f-12945ecee9d7	6210	Sežana
00050000-5613-6cd0-71d5-40d3543c59f4	2214	Sladki Vrh
00050000-5613-6cd0-91a0-8e0fc819286e	5283	Slap ob Idrijci
00050000-5613-6cd0-15be-4469ad05343b	2380	Slovenj Gradec
00050000-5613-6cd0-21eb-c8a1e064b45f	2310	Slovenska Bistrica
00050000-5613-6cd0-7e95-831b12fb1417	3210	Slovenske Konjice
00050000-5613-6cd0-8afd-628e11255735	1216	Smlednik
00050000-5613-6cd0-3906-c1fdfc41d474	5232	Soča
00050000-5613-6cd0-c92d-774a0875b8f8	1317	Sodražica
00050000-5613-6cd0-54bb-3555f1192abf	3335	Solčava
00050000-5613-6cd0-eba4-3cb9b6ee5634	5250	Solkan
00050000-5613-6cd0-8bd1-8bb6ea7b18c5	4229	Sorica
00050000-5613-6cd0-6fcb-2732c9d9ab9c	4225	Sovodenj
00050000-5613-6cd0-c1f6-d9d18b768d77	5281	Spodnja Idrija
00050000-5613-6cd0-81a8-c4efbfc9c224	2241	Spodnji Duplek
00050000-5613-6cd0-1b3e-7af9d6ea46e6	9245	Spodnji Ivanjci
00050000-5613-6cd0-a245-b8adb2a6ed5c	2277	Središče ob Dravi
00050000-5613-6cd0-a3a4-92a307717748	4267	Srednja vas v Bohinju
00050000-5613-6cd0-6ad0-3df1586bfa95	8256	Sromlje 
00050000-5613-6cd0-94ac-5c927ef6c999	5224	Srpenica
00050000-5613-6cd0-9a38-d451abcd895c	1242	Stahovica
00050000-5613-6cd0-9b17-b33b1d73a444	1332	Stara Cerkev
00050000-5613-6cd0-407d-aae8ad4343b3	8342	Stari trg ob Kolpi
00050000-5613-6cd0-a9bf-b12d6e8dece5	1386	Stari trg pri Ložu
00050000-5613-6cd0-90bf-c3685e7c0c59	2205	Starše
00050000-5613-6cd0-2e28-b3ef2ea5a3d3	2289	Stoperce
00050000-5613-6cd0-8547-bc517ab6253d	8322	Stopiče
00050000-5613-6cd0-c101-57bb45644af4	3206	Stranice
00050000-5613-6cd0-8067-bf979a269113	8351	Straža
00050000-5613-6cd0-3d9c-6903abeca68d	1313	Struge
00050000-5613-6cd0-3843-00995e237f48	8293	Studenec
00050000-5613-6cd0-83b6-d61c2753a48c	8331	Suhor
00050000-5613-6cd0-0ad6-a4130bf1b49d	2233	Sv. Ana v Slovenskih goricah
00050000-5613-6cd0-d7e7-c11647a6e437	2235	Sv. Trojica v Slovenskih goricah
00050000-5613-6cd0-8d40-1e587fb85ffb	2353	Sveti Duh na Ostrem Vrhu
00050000-5613-6cd0-945f-2253e6c801a8	9244	Sveti Jurij ob Ščavnici
00050000-5613-6cd0-373b-8dc63d37ba6e	3264	Sveti Štefan
00050000-5613-6cd0-b21f-457b30c21972	2258	Sveti Tomaž
00050000-5613-6cd0-0296-9e4f5f122667	9204	Šalovci
00050000-5613-6cd0-61d7-8eb10506239b	5261	Šempas
00050000-5613-6cd0-c520-a51aa4103ac1	5290	Šempeter pri Gorici
00050000-5613-6cd0-f223-f5a5fcbc7cfd	3311	Šempeter v Savinjski dolini
00050000-5613-6cd0-a3ca-7e0569f72e12	4208	Šenčur
00050000-5613-6cd0-2c72-9117487a563e	2212	Šentilj v Slovenskih goricah
00050000-5613-6cd0-2e7f-3c63aae821a2	8297	Šentjanž
00050000-5613-6cd0-66fc-3537a6a561b2	2373	Šentjanž pri Dravogradu
00050000-5613-6cd0-b896-f698f366f722	8310	Šentjernej
00050000-5613-6cd0-d44b-f741ea109880	3230	Šentjur
00050000-5613-6cd0-cc25-7ca7a8b2c648	3271	Šentrupert
00050000-5613-6cd0-67ec-8201c53b2387	8232	Šentrupert
00050000-5613-6cd0-5fef-5541916154af	1296	Šentvid pri Stični
00050000-5613-6cd0-df63-96fe3ab2edaf	8275	Škocjan
00050000-5613-6cd0-7f36-23bf8b6a9162	6281	Škofije
00050000-5613-6cd0-a40c-950243492cd7	4220	Škofja Loka
00050000-5613-6cd0-7c82-b483f8beb46f	3211	Škofja vas
00050000-5613-6cd0-930f-acba4deee2a4	1291	Škofljica
00050000-5613-6cd0-714e-4d9d4b5f6d29	6274	Šmarje
00050000-5613-6cd0-9520-93c18cf5dccc	1293	Šmarje - Sap
00050000-5613-6cd0-6e56-20c602e87ac1	3240	Šmarje pri Jelšah
00050000-5613-6cd0-af7d-a1ffab869262	8220	Šmarješke Toplice
00050000-5613-6cd0-5aea-237678531e43	2315	Šmartno na Pohorju
00050000-5613-6cd0-1c17-ab5b61e03438	3341	Šmartno ob Dreti
00050000-5613-6cd0-0b8e-ffc9418ed13e	3327	Šmartno ob Paki
00050000-5613-6cd0-e97c-764dbf0aae34	1275	Šmartno pri Litiji
00050000-5613-6cd0-8358-103d3e20bf38	2383	Šmartno pri Slovenj Gradcu
00050000-5613-6cd0-30f9-6aa7eb016baf	3201	Šmartno v Rožni dolini
00050000-5613-6cd0-9260-f9992fd42d11	3325	Šoštanj
00050000-5613-6cd0-a355-4c3202ef7fa6	6222	Štanjel
00050000-5613-6cd0-e8e2-641ed1fa2c0a	3220	Štore
00050000-5613-6cd0-d44a-3a10449c19fc	3304	Tabor
00050000-5613-6cd0-8932-102cb68ca5ff	3221	Teharje
00050000-5613-6cd0-4a3d-b18712e8fe0d	9251	Tišina
00050000-5613-6cd0-c2df-7292f0f59ff5	5220	Tolmin
00050000-5613-6cd0-245a-0b4fdf91938f	3326	Topolšica
00050000-5613-6cd0-c651-48d1e8b39ce3	2371	Trbonje
00050000-5613-6cd0-b552-76dc4ebd9f94	1420	Trbovlje
00050000-5613-6cd0-631c-53fcb3951d50	8231	Trebelno 
00050000-5613-6cd0-7a1b-df6c813f5bb2	8210	Trebnje
00050000-5613-6cd0-e85c-7071ae6920c6	5252	Trnovo pri Gorici
00050000-5613-6cd0-8425-e7466b52eca9	2254	Trnovska vas
00050000-5613-6cd0-7dc5-1f61c38cd329	1222	Trojane
00050000-5613-6cd0-66ea-d7521afb22f0	1236	Trzin
00050000-5613-6cd0-d698-6c36e4af0275	4290	Tržič
00050000-5613-6cd0-e4e2-1ceaac1ca116	8295	Tržišče
00050000-5613-6cd0-db45-13ffdf484f3f	1311	Turjak
00050000-5613-6cd0-7361-41f20a18f91b	9224	Turnišče
00050000-5613-6cd0-af1f-4cd3d7b9eaa0	8323	Uršna sela
00050000-5613-6cd0-1d57-bdf0bc963c7f	1252	Vače
00050000-5613-6cd0-3a4e-c14db5c25814	3320	Velenje 
00050000-5613-6cd0-4e07-48fdf178d1bd	3322	Velenje - poštni predali
00050000-5613-6cd0-d79b-ec7e969db454	8212	Velika Loka
00050000-5613-6cd0-d612-8b8696f77768	2274	Velika Nedelja
00050000-5613-6cd0-da8b-ad767b985623	9225	Velika Polana
00050000-5613-6cd0-f098-36ad91b038a7	1315	Velike Lašče
00050000-5613-6cd0-a635-e46aea8c68e1	8213	Veliki Gaber
00050000-5613-6cd0-3bd5-77a703514dae	9241	Veržej
00050000-5613-6cd0-6dac-a6d3b26bccc3	1312	Videm - Dobrepolje
00050000-5613-6cd0-ed28-38b1e5209037	2284	Videm pri Ptuju
00050000-5613-6cd0-3ede-81ca3f07ff00	8344	Vinica
00050000-5613-6cd0-5bff-2384591b48c9	5271	Vipava
00050000-5613-6cd0-f815-e9e6d25fbf49	4212	Visoko
00050000-5613-6cd0-aee1-ad0cae97775d	1294	Višnja Gora
00050000-5613-6cd0-2e21-32fbfb8174fe	3205	Vitanje
00050000-5613-6cd0-a2f7-a26454c329a3	2255	Vitomarci
00050000-5613-6cd0-50f9-b0b3b4b05bb0	1217	Vodice
00050000-5613-6cd0-fee8-e0fcf54469e7	3212	Vojnik\t
00050000-5613-6cd0-5191-e8f6dc4dce7e	5293	Volčja Draga
00050000-5613-6cd0-7fc2-e224c1e46182	2232	Voličina
00050000-5613-6cd0-9196-3b3b7a283adc	3305	Vransko
00050000-5613-6cd0-a0f5-93294fd050d7	6217	Vremski Britof
00050000-5613-6cd0-7e44-0917d8b9a8da	1360	Vrhnika
00050000-5613-6cd0-b954-e46c87f65881	2365	Vuhred
00050000-5613-6cd0-349a-8c13376260a4	2367	Vuzenica
00050000-5613-6cd0-76e9-c28968b1f7d7	8292	Zabukovje 
00050000-5613-6cd0-ba83-bc5088a96bf4	1410	Zagorje ob Savi
00050000-5613-6cd0-fb0b-b1db6ab039e9	1303	Zagradec
00050000-5613-6cd0-e0b7-5e70815b713e	2283	Zavrč
00050000-5613-6cd0-93e8-9f216282332e	8272	Zdole 
00050000-5613-6cd0-629d-a151f120e0a9	4201	Zgornja Besnica
00050000-5613-6cd0-a589-c6316e3abe45	2242	Zgornja Korena
00050000-5613-6cd0-e7b3-56bda5d88efe	2201	Zgornja Kungota
00050000-5613-6cd0-6fb9-0320341cab04	2316	Zgornja Ložnica
00050000-5613-6cd0-d851-58599a6b2238	2314	Zgornja Polskava
00050000-5613-6cd0-6a34-c09992992f19	2213	Zgornja Velka
00050000-5613-6cd0-0a23-bcb31a017168	4247	Zgornje Gorje
00050000-5613-6cd0-a936-2591053d3daa	4206	Zgornje Jezersko
00050000-5613-6cd0-afbb-cdb5a2dba59a	2285	Zgornji Leskovec
00050000-5613-6cd0-4e36-dceaeec83f1e	1432	Zidani Most
00050000-5613-6cd0-a315-c6a0806e48d9	3214	Zreče
00050000-5613-6cd0-c445-b8d7089f8aec	4209	Žabnica
00050000-5613-6cd0-75cc-3c39a3809225	3310	Žalec
00050000-5613-6cd0-a6de-38c5ce3a145b	4228	Železniki
00050000-5613-6cd0-ca71-3f0f64cd5f1c	2287	Žetale
00050000-5613-6cd0-17f9-931b8267d92f	4226	Žiri
00050000-5613-6cd0-6d0d-a579d3026f9d	4274	Žirovnica
00050000-5613-6cd0-f5c5-c3aa05729972	8360	Žužemberk
\.


--
-- TOC entry 3030 (class 0 OID 21331544)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 21331164)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 21330944)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5613-6cd3-4d94-ec458a7242d4	00080000-5613-6cd2-971c-5805af1683ad	\N	00040000-5613-6cd1-c923-b8e971757f3b	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5613-6cd3-9755-fd9b832a6ca1	00080000-5613-6cd2-971c-5805af1683ad	\N	00040000-5613-6cd1-c923-b8e971757f3b	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5613-6cd3-ee7e-aa74e4bcb971	00080000-5613-6cd2-49cb-20f9fcbd4939	\N	00040000-5613-6cd1-c923-b8e971757f3b	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2992 (class 0 OID 21331048)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 21331176)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 21331558)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 21331568)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5613-6cd3-fce8-9fe37cacd4a3	00080000-5613-6cd2-55a9-6b8713807f0d	0987	AK
00190000-5613-6cd3-d399-6dcb21f68f44	00080000-5613-6cd2-49cb-20f9fcbd4939	0989	AK
00190000-5613-6cd3-2502-fcb4b2503f94	00080000-5613-6cd2-5a53-4c3b3aef6fc3	0986	AK
00190000-5613-6cd3-2677-f59764bceb56	00080000-5613-6cd2-6893-0f1acdcc6005	0984	AK
00190000-5613-6cd3-12f8-6493554d0959	00080000-5613-6cd2-5220-093b50d3e88b	0983	AK
00190000-5613-6cd3-821e-29f67916a660	00080000-5613-6cd2-873e-d381c91abd7d	0982	AK
00190000-5613-6cd4-8fa1-da7ac2e408f2	00080000-5613-6cd4-d9ae-4a3bb47ce142	1001	AK
\.


--
-- TOC entry 3029 (class 0 OID 21331501)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5613-6cd3-b5e7-59a8bfffd45d	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3033 (class 0 OID 21331576)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 21331205)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5613-6cd2-5dfd-d148fa6b0f55	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5613-6cd2-77d2-c3b87623c1d1	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5613-6cd2-ddea-a36fd46013d4	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5613-6cd2-15a9-93b829b22575	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5613-6cd2-6811-f3961da53bf8	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5613-6cd2-952e-b8d5852373ba	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5613-6cd2-9707-c4e360ffb320	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3001 (class 0 OID 21331149)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 21331139)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 21331349)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 21331279)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 21331022)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 21330817)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5613-6cd4-d9ae-4a3bb47ce142	00010000-5613-6cd1-bd92-a0a2c32d7b3c	2015-10-06 08:40:20	INS	a:0:{}
2	App\\Entity\\Option	00000000-5613-6cd4-7626-3d36c1d7642d	00010000-5613-6cd1-bd92-a0a2c32d7b3c	2015-10-06 08:40:20	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5613-6cd4-8fa1-da7ac2e408f2	00010000-5613-6cd1-bd92-a0a2c32d7b3c	2015-10-06 08:40:20	INS	a:0:{}
\.


--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3010 (class 0 OID 21331218)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 21330855)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5613-6cd1-f0e6-a72be34de19f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5613-6cd1-f2b9-57dfa5cb6116	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5613-6cd1-a38a-7655e0fb46b5	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5613-6cd1-6218-821c0377a71a	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5613-6cd1-9d8a-c7a83d536c6b	planer	Planer dogodkov v koledarju	t
00020000-5613-6cd1-a135-ac9a09fcadc6	kadrovska	Kadrovska služba	t
00020000-5613-6cd1-bef4-8d453ee2e484	arhivar	Ažuriranje arhivalij	t
00020000-5613-6cd1-4738-f1dc967bf579	igralec	Igralec	t
00020000-5613-6cd1-a60a-010ec498e94c	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5613-6cd2-44fb-9050fa145030	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2975 (class 0 OID 21330839)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5613-6cd1-e68f-6caf6d4642fb	00020000-5613-6cd1-a38a-7655e0fb46b5
00010000-5613-6cd1-bd92-a0a2c32d7b3c	00020000-5613-6cd1-a38a-7655e0fb46b5
00010000-5613-6cd3-056b-1a178c732e8d	00020000-5613-6cd2-44fb-9050fa145030
\.


--
-- TOC entry 3012 (class 0 OID 21331232)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 21331170)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 21331116)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 21330804)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5613-6cd0-36db-3641c7acc255	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5613-6cd0-a03a-e63b50cbeffb	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5613-6cd0-c3cb-f8f42ace85df	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5613-6cd0-d29e-8b6e0bcbcf65	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5613-6cd0-ab96-66fe670de784	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2970 (class 0 OID 21330796)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5613-6cd0-3d44-0acc27a9db04	00230000-5613-6cd0-d29e-8b6e0bcbcf65	popa
00240000-5613-6cd0-6387-821b63d12f5e	00230000-5613-6cd0-d29e-8b6e0bcbcf65	oseba
00240000-5613-6cd1-2e37-83e5f1a87e6d	00230000-5613-6cd0-d29e-8b6e0bcbcf65	sezona
00240000-5613-6cd1-3689-21171d4de9e2	00230000-5613-6cd0-a03a-e63b50cbeffb	prostor
00240000-5613-6cd1-a79b-6b5375aa3d9e	00230000-5613-6cd0-d29e-8b6e0bcbcf65	besedilo
00240000-5613-6cd1-0ce7-827f74cd1762	00230000-5613-6cd0-d29e-8b6e0bcbcf65	uprizoritev
00240000-5613-6cd1-0b9a-bb62d543fa00	00230000-5613-6cd0-d29e-8b6e0bcbcf65	funkcija
00240000-5613-6cd1-8ba9-7fc8ded3ccf5	00230000-5613-6cd0-d29e-8b6e0bcbcf65	tipfunkcije
00240000-5613-6cd1-4dfe-8733234074d4	00230000-5613-6cd0-d29e-8b6e0bcbcf65	alternacija
00240000-5613-6cd1-a5d1-6c4a14304c0f	00230000-5613-6cd0-36db-3641c7acc255	pogodba
00240000-5613-6cd1-121c-4f82de8bbc4f	00230000-5613-6cd0-d29e-8b6e0bcbcf65	zaposlitev
00240000-5613-6cd1-3ef5-b2d47604608a	00230000-5613-6cd0-d29e-8b6e0bcbcf65	zvrstuprizoritve
00240000-5613-6cd1-fbc8-0084af643756	00230000-5613-6cd0-36db-3641c7acc255	programdela
00240000-5613-6cd1-4d28-4aec94dda640	00230000-5613-6cd0-d29e-8b6e0bcbcf65	zapis
\.


--
-- TOC entry 2969 (class 0 OID 21330791)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
5c216b38-5714-4aab-b77a-4193e7f64f3c	00240000-5613-6cd0-3d44-0acc27a9db04	0	1001
\.


--
-- TOC entry 3018 (class 0 OID 21331296)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5613-6cd3-40b5-2a1d0c778b33	000e0000-5613-6cd3-f667-cc5293b08054	00080000-5613-6cd2-971c-5805af1683ad	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5613-6cd1-80fc-f67c680c7a58
00270000-5613-6cd3-0ae0-3584e75da744	000e0000-5613-6cd3-f667-cc5293b08054	00080000-5613-6cd2-971c-5805af1683ad	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5613-6cd1-80fc-f67c680c7a58
\.


--
-- TOC entry 2982 (class 0 OID 21330917)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 21331126)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5613-6cd3-f075-0637f1b5a037	00180000-5613-6cd3-15a7-a0d058fc7d6b	000c0000-5613-6cd3-e567-b66eb89cb684	00090000-5613-6cd3-560a-efdd193aecd8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5613-6cd3-15ff-1fc121a5e19a	00180000-5613-6cd3-15a7-a0d058fc7d6b	000c0000-5613-6cd3-85b5-563631ec2ad6	00090000-5613-6cd3-28bd-f247ec8581c9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5613-6cd3-1e0c-5fa4c3d8eabe	00180000-5613-6cd3-15a7-a0d058fc7d6b	000c0000-5613-6cd3-9c09-2cfa1c76dcf7	00090000-5613-6cd3-b3f8-7c08919efd4c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5613-6cd3-02a8-b60d23ccee0e	00180000-5613-6cd3-15a7-a0d058fc7d6b	000c0000-5613-6cd3-d0ad-b012649afb0c	00090000-5613-6cd3-0d28-f61a55c06f0d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5613-6cd3-8f1f-4a84a205ec4f	00180000-5613-6cd3-15a7-a0d058fc7d6b	000c0000-5613-6cd3-9bb2-38597aae3ae4	00090000-5613-6cd3-af81-5acf80414a0b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5613-6cd3-63b3-3ad306acf614	00180000-5613-6cd3-5aca-1b98c494744a	\N	00090000-5613-6cd3-af81-5acf80414a0b	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3021 (class 0 OID 21331337)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5613-6cd0-bb67-3ac8657b3e22	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5613-6cd0-0c51-0e46c33ac53c	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5613-6cd0-b74b-9cb3d9c49e99	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5613-6cd0-9251-0b8f7f2c3fd2	04	Režija	Režija	Režija	umetnik	30
000f0000-5613-6cd0-fbe7-c48c16b0574a	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5613-6cd0-17ec-c79044a3c16c	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5613-6cd0-de59-a1d7a631deda	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5613-6cd0-ba98-80c5293414ce	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5613-6cd0-7277-696e07762d80	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5613-6cd0-07d7-6e6a1b0d356e	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5613-6cd0-34b8-818b368db005	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5613-6cd0-3034-642b0cf1d0dc	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5613-6cd0-00d0-75e6bb3a17cc	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5613-6cd0-12c3-c2ea62e9bb9c	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5613-6cd0-b949-8cfa6c1bff0e	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5613-6cd0-c595-2a4b38db2472	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5613-6cd0-d76c-7fc36acf6e5f	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5613-6cd0-87c5-b24abdc67f36	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3034 (class 0 OID 21331587)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5613-6cd0-d75a-8215f2a1c3c5	01	Velika predstava	f	1.00	1.00
002b0000-5613-6cd0-a34f-41f9e093a1d0	02	Mala predstava	f	0.50	0.50
002b0000-5613-6cd0-40b3-2689a58a6031	03	Mala koprodukcija	t	0.40	1.00
002b0000-5613-6cd0-6e1b-50c20434597b	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5613-6cd0-7f0a-adcff1202638	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2987 (class 0 OID 21330979)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 21330826)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5613-6cd1-bd92-a0a2c32d7b3c	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROMJV0rkQzGi2ndm48imgJrT5U80uCLqy	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5613-6cd2-8633-defe49ebcc5b	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5613-6cd2-c889-0ba75eb2543e	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5613-6cd3-80ed-0a2dc7420d47	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5613-6cd3-e75a-bfb38b7d0ea9	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5613-6cd3-721e-d24c341e14c6	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5613-6cd3-4273-2b3aeeaa9798	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5613-6cd3-7f64-af30c1024901	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5613-6cd3-8b32-bfb787c8afad	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5613-6cd3-939c-0c29654c9c12	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5613-6cd3-056b-1a178c732e8d	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5613-6cd1-e68f-6caf6d4642fb	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3025 (class 0 OID 21331387)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5613-6cd3-ca57-9ed8e1a661a7	00160000-5613-6cd2-9345-a857411c7bb6	\N	00140000-5613-6cd1-3b66-9beb8095c036	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5613-6cd2-6811-f3961da53bf8
000e0000-5613-6cd3-f667-cc5293b08054	00160000-5613-6cd2-626d-567422925894	\N	00140000-5613-6cd1-032e-62a3925558c5	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5613-6cd2-952e-b8d5852373ba
000e0000-5613-6cd3-6860-669721152ea6	\N	\N	00140000-5613-6cd1-032e-62a3925558c5	00190000-5613-6cd3-fce8-9fe37cacd4a3	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5613-6cd2-6811-f3961da53bf8
000e0000-5613-6cd3-57f8-672349ab705b	\N	\N	00140000-5613-6cd1-032e-62a3925558c5	00190000-5613-6cd3-fce8-9fe37cacd4a3	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5613-6cd2-6811-f3961da53bf8
000e0000-5613-6cd3-de27-ee627174c695	\N	\N	00140000-5613-6cd1-032e-62a3925558c5	00190000-5613-6cd3-fce8-9fe37cacd4a3	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5613-6cd2-5dfd-d148fa6b0f55
000e0000-5613-6cd3-d3c4-4f3de67e5a03	\N	\N	00140000-5613-6cd1-032e-62a3925558c5	00190000-5613-6cd3-fce8-9fe37cacd4a3	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5613-6cd2-5dfd-d148fa6b0f55
\.


--
-- TOC entry 2994 (class 0 OID 21331070)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5613-6cd3-b0cd-93c4fec667c3	000e0000-5613-6cd3-f667-cc5293b08054	\N	1	
00200000-5613-6cd3-8a59-e83f2098e393	000e0000-5613-6cd3-f667-cc5293b08054	\N	2	
00200000-5613-6cd3-8478-6a16b02782e9	000e0000-5613-6cd3-f667-cc5293b08054	\N	3	
00200000-5613-6cd3-7e90-f13e134b91a4	000e0000-5613-6cd3-f667-cc5293b08054	\N	4	
00200000-5613-6cd3-c829-2fc82cd8862d	000e0000-5613-6cd3-f667-cc5293b08054	\N	5	
\.


--
-- TOC entry 3008 (class 0 OID 21331197)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 21331310)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5613-6cd1-deaf-66eaed2b3c69	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5613-6cd1-9fa6-24838385e08e	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5613-6cd1-e26c-891c4b163732	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5613-6cd1-2ea7-a9a2cee25f27	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5613-6cd1-a8a1-743845bd3993	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5613-6cd1-5e9d-3cef2f0199ac	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5613-6cd1-a91d-4560fd031a26	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5613-6cd1-688d-a909f68a9aa8	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5613-6cd1-80fc-f67c680c7a58	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5613-6cd1-9341-a5c45422a668	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5613-6cd1-4a73-82f54f5db97d	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5613-6cd1-fe10-f8fb8ce1bf20	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5613-6cd1-f115-ec3f83ef78a4	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5613-6cd1-6968-863011eefc8a	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5613-6cd1-7092-cbd036e5da99	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5613-6cd1-55c5-27aebf453e7b	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5613-6cd1-ae80-8cf65cb78381	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5613-6cd1-f50e-8d925ba953bf	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5613-6cd1-99e4-a024e86f8a90	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5613-6cd1-1859-abd8c94e0516	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5613-6cd1-785d-c9129beb949c	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5613-6cd1-48c0-99d148fb0194	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5613-6cd1-3ebd-e822b73cd71a	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5613-6cd1-d69c-170eab34c98c	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5613-6cd1-86b8-80fa79ff0659	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5613-6cd1-395d-af42ef830e12	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5613-6cd1-ee7e-57cfc6e0ec29	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5613-6cd1-acd8-a8beda83e198	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3037 (class 0 OID 21331634)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 21331606)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 21331646)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 21331269)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5613-6cd3-64c6-36b15514d2ce	00090000-5613-6cd3-28bd-f247ec8581c9	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-5613-6cd3-9efe-0911b7b1f03a	00090000-5613-6cd3-b3f8-7c08919efd4c	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-5613-6cd3-f1ec-34825158e00d	00090000-5613-6cd3-b5ff-00bc05bdc521	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-5613-6cd3-e19d-b7f4dd0ee6fe	00090000-5613-6cd3-10d7-65dd29f22738	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-5613-6cd3-4dcb-a0d7a87b1e96	00090000-5613-6cd3-560a-efdd193aecd8	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-5613-6cd3-a3e5-b9e01ffbe459	00090000-5613-6cd3-0fb3-c9edf9e9931b	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 2996 (class 0 OID 21331105)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 21331377)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5613-6cd1-3b66-9beb8095c036	01	Drama	drama (SURS 01)
00140000-5613-6cd1-be58-175328b86037	02	Opera	opera (SURS 02)
00140000-5613-6cd1-6109-d47b80d37c86	03	Balet	balet (SURS 03)
00140000-5613-6cd1-85e1-59a90a4ea40b	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5613-6cd1-06b5-c8edd125962a	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5613-6cd1-032e-62a3925558c5	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5613-6cd1-13f1-af308f12bfac	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3014 (class 0 OID 21331259)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2501 (class 2606 OID 21330880)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 21331436)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 21331426)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 21331293)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 21331335)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 21331686)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 21331094)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 21331115)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 21331604)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 21331005)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 21331495)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 21331255)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 21331068)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 21331043)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 21331019)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 21331162)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 21331663)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 21331670)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2755 (class 2606 OID 21331694)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 21093462)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2613 (class 2606 OID 21331189)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 21330977)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 21330889)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 21330913)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 21330869)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2492 (class 2606 OID 21330854)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 21331195)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 21331231)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 21331372)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 21330941)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 21330965)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 21331556)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 21331168)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 21330955)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 21331056)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 21331180)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 21331565)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 21331573)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 21331543)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 21331585)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 21331213)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 21331153)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 21331144)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 21331359)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 21331286)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 21331031)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 21330825)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 21331222)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 21330843)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2494 (class 2606 OID 21330863)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 21331240)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 21331175)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 21331124)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 21330813)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 21330801)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 21330795)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 21331306)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 21330922)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 21331135)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 21331346)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 21331597)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 21330990)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 21330838)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 21331405)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 21331078)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 21331203)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 21331318)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 21331644)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 21331628)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 21331652)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 21331277)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 21331109)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 21331385)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 21331267)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 1259 OID 21331103)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2566 (class 1259 OID 21331104)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2567 (class 1259 OID 21331102)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2568 (class 1259 OID 21331101)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2569 (class 1259 OID 21331100)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2655 (class 1259 OID 21331307)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2656 (class 1259 OID 21331308)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2657 (class 1259 OID 21331309)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2741 (class 1259 OID 21331665)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2742 (class 1259 OID 21331664)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2515 (class 1259 OID 21330943)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2614 (class 1259 OID 21331196)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2728 (class 1259 OID 21331632)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2729 (class 1259 OID 21331631)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2730 (class 1259 OID 21331633)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2731 (class 1259 OID 21331630)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2732 (class 1259 OID 21331629)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2608 (class 1259 OID 21331182)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2609 (class 1259 OID 21331181)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2560 (class 1259 OID 21331079)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2638 (class 1259 OID 21331256)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2639 (class 1259 OID 21331258)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2640 (class 1259 OID 21331257)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2540 (class 1259 OID 21331021)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2541 (class 1259 OID 21331020)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2719 (class 1259 OID 21331586)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2671 (class 1259 OID 21331374)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2672 (class 1259 OID 21331375)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2673 (class 1259 OID 21331376)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2738 (class 1259 OID 21331653)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2680 (class 1259 OID 21331410)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2681 (class 1259 OID 21331407)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2682 (class 1259 OID 21331411)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2683 (class 1259 OID 21331409)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2684 (class 1259 OID 21331408)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2530 (class 1259 OID 21330992)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2531 (class 1259 OID 21330991)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2506 (class 1259 OID 21330916)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2626 (class 1259 OID 21331223)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2496 (class 1259 OID 21330870)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2497 (class 1259 OID 21330871)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2631 (class 1259 OID 21331243)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2632 (class 1259 OID 21331242)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2633 (class 1259 OID 21331241)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2553 (class 1259 OID 21331057)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2554 (class 1259 OID 21331058)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2476 (class 1259 OID 21330803)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2588 (class 1259 OID 21331148)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2589 (class 1259 OID 21331146)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2590 (class 1259 OID 21331145)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2591 (class 1259 OID 21331147)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2487 (class 1259 OID 21330844)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2488 (class 1259 OID 21330845)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2617 (class 1259 OID 21331204)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2751 (class 1259 OID 21331687)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2653 (class 1259 OID 21331295)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2654 (class 1259 OID 21331294)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2752 (class 1259 OID 21331695)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2753 (class 1259 OID 21331696)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2603 (class 1259 OID 21331169)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2647 (class 1259 OID 21331287)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2648 (class 1259 OID 21331288)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2701 (class 1259 OID 21331500)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2702 (class 1259 OID 21331499)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2703 (class 1259 OID 21331496)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2704 (class 1259 OID 21331497)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2705 (class 1259 OID 21331498)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2519 (class 1259 OID 21330957)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 21330956)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2521 (class 1259 OID 21330958)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2620 (class 1259 OID 21331217)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2621 (class 1259 OID 21331216)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2711 (class 1259 OID 21331566)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2712 (class 1259 OID 21331567)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2694 (class 1259 OID 21331440)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2695 (class 1259 OID 21331441)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2696 (class 1259 OID 21331438)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2697 (class 1259 OID 21331439)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2644 (class 1259 OID 21331278)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 21331157)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2595 (class 1259 OID 21331156)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2596 (class 1259 OID 21331154)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2597 (class 1259 OID 21331155)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2690 (class 1259 OID 21331428)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2691 (class 1259 OID 21331427)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2544 (class 1259 OID 21331032)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2547 (class 1259 OID 21331046)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2548 (class 1259 OID 21331045)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2549 (class 1259 OID 21331044)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2550 (class 1259 OID 21331047)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2559 (class 1259 OID 21331069)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2708 (class 1259 OID 21331557)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2727 (class 1259 OID 21331605)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2745 (class 1259 OID 21331671)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2746 (class 1259 OID 21331672)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2502 (class 1259 OID 21330891)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2503 (class 1259 OID 21330890)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2511 (class 1259 OID 21330923)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2512 (class 1259 OID 21330924)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2575 (class 1259 OID 21331110)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2583 (class 1259 OID 21331138)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2584 (class 1259 OID 21331137)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2585 (class 1259 OID 21331136)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2570 (class 1259 OID 21331096)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2571 (class 1259 OID 21331097)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2572 (class 1259 OID 21331095)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2573 (class 1259 OID 21331099)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2574 (class 1259 OID 21331098)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2518 (class 1259 OID 21330942)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2536 (class 1259 OID 21331006)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 21331008)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2538 (class 1259 OID 21331007)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2539 (class 1259 OID 21331009)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2602 (class 1259 OID 21331163)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2676 (class 1259 OID 21331373)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2685 (class 1259 OID 21331406)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2667 (class 1259 OID 21331347)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2668 (class 1259 OID 21331348)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2509 (class 1259 OID 21330914)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2510 (class 1259 OID 21330915)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2641 (class 1259 OID 21331268)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 21330814)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2529 (class 1259 OID 21330978)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2479 (class 1259 OID 21330802)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2724 (class 1259 OID 21331598)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 21331215)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2625 (class 1259 OID 21331214)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2698 (class 1259 OID 21331437)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2526 (class 1259 OID 21330966)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2677 (class 1259 OID 21331386)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2735 (class 1259 OID 21331645)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2717 (class 1259 OID 21331574)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2718 (class 1259 OID 21331575)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2664 (class 1259 OID 21331336)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2582 (class 1259 OID 21331125)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2495 (class 1259 OID 21330864)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2786 (class 2606 OID 21331827)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2785 (class 2606 OID 21331832)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2781 (class 2606 OID 21331852)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2787 (class 2606 OID 21331822)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2783 (class 2606 OID 21331842)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2782 (class 2606 OID 21331847)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2784 (class 2606 OID 21331837)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2822 (class 2606 OID 21332017)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2821 (class 2606 OID 21332022)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2820 (class 2606 OID 21332027)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2854 (class 2606 OID 21332192)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2855 (class 2606 OID 21332187)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2767 (class 2606 OID 21331752)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2804 (class 2606 OID 21331937)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2849 (class 2606 OID 21332172)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2850 (class 2606 OID 21332167)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2848 (class 2606 OID 21332177)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2851 (class 2606 OID 21332162)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2852 (class 2606 OID 21332157)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2802 (class 2606 OID 21331932)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2803 (class 2606 OID 21331927)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2780 (class 2606 OID 21331817)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2814 (class 2606 OID 21331977)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2812 (class 2606 OID 21331987)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2813 (class 2606 OID 21331982)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2773 (class 2606 OID 21331787)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2774 (class 2606 OID 21331782)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2800 (class 2606 OID 21331917)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2846 (class 2606 OID 21332147)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2825 (class 2606 OID 21332032)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2824 (class 2606 OID 21332037)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2823 (class 2606 OID 21332042)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2853 (class 2606 OID 21332182)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2827 (class 2606 OID 21332062)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2830 (class 2606 OID 21332047)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2826 (class 2606 OID 21332067)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2828 (class 2606 OID 21332057)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2829 (class 2606 OID 21332052)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2771 (class 2606 OID 21331777)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2772 (class 2606 OID 21331772)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2763 (class 2606 OID 21331737)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2764 (class 2606 OID 21331732)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2808 (class 2606 OID 21331957)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2760 (class 2606 OID 21331712)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2759 (class 2606 OID 21331717)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2809 (class 2606 OID 21331972)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2810 (class 2606 OID 21331967)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2811 (class 2606 OID 21331962)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2778 (class 2606 OID 21331802)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2777 (class 2606 OID 21331807)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2756 (class 2606 OID 21331697)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2792 (class 2606 OID 21331892)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2794 (class 2606 OID 21331882)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2795 (class 2606 OID 21331877)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2793 (class 2606 OID 21331887)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2758 (class 2606 OID 21331702)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2757 (class 2606 OID 21331707)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2805 (class 2606 OID 21331942)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2858 (class 2606 OID 21332207)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2818 (class 2606 OID 21332012)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2819 (class 2606 OID 21332007)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2860 (class 2606 OID 21332212)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2859 (class 2606 OID 21332217)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2801 (class 2606 OID 21331922)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2817 (class 2606 OID 21331997)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2816 (class 2606 OID 21332002)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2837 (class 2606 OID 21332122)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2838 (class 2606 OID 21332117)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2841 (class 2606 OID 21332102)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2840 (class 2606 OID 21332107)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2839 (class 2606 OID 21332112)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2769 (class 2606 OID 21331762)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2770 (class 2606 OID 21331757)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2768 (class 2606 OID 21331767)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2806 (class 2606 OID 21331952)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2807 (class 2606 OID 21331947)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2844 (class 2606 OID 21332132)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2843 (class 2606 OID 21332137)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2834 (class 2606 OID 21332092)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2833 (class 2606 OID 21332097)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2836 (class 2606 OID 21332082)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2835 (class 2606 OID 21332087)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2815 (class 2606 OID 21331992)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2796 (class 2606 OID 21331912)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2797 (class 2606 OID 21331907)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2799 (class 2606 OID 21331897)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2798 (class 2606 OID 21331902)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2831 (class 2606 OID 21332077)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2832 (class 2606 OID 21332072)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2775 (class 2606 OID 21331792)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2776 (class 2606 OID 21331797)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2779 (class 2606 OID 21331812)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2842 (class 2606 OID 21332127)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2845 (class 2606 OID 21332142)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2847 (class 2606 OID 21332152)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2857 (class 2606 OID 21332197)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2856 (class 2606 OID 21332202)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2761 (class 2606 OID 21331727)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2762 (class 2606 OID 21331722)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2766 (class 2606 OID 21331742)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2765 (class 2606 OID 21331747)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2788 (class 2606 OID 21331857)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2789 (class 2606 OID 21331872)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2790 (class 2606 OID 21331867)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2791 (class 2606 OID 21331862)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-06 08:40:22 CEST

--
-- PostgreSQL database dump complete
--

