--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-09 11:30:10 CEST

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
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 245
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 21588178)
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
-- TOC entry 229 (class 1259 OID 21588735)
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
-- TOC entry 228 (class 1259 OID 21588718)
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
-- TOC entry 219 (class 1259 OID 21588595)
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
-- TOC entry 222 (class 1259 OID 21588625)
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
-- TOC entry 243 (class 1259 OID 21588994)
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
-- TOC entry 197 (class 1259 OID 21588386)
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
-- TOC entry 199 (class 1259 OID 21588417)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 21588920)
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
-- TOC entry 190 (class 1259 OID 21588299)
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
-- TOC entry 230 (class 1259 OID 21588748)
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
    obiskkoprgost integer DEFAULT 0 NOT NULL,
    obiskzamejo integer DEFAULT 0 NOT NULL,
    obiskkoprzamejo integer DEFAULT 0 NOT NULL,
    obiskint integer DEFAULT 0 NOT NULL,
    obiskkoprint integer DEFAULT 0 NOT NULL,
    ponovidoma integer DEFAULT 0 NOT NULL,
    ponovikopr integer DEFAULT 0 NOT NULL,
    ponovizamejo numeric(15,2) DEFAULT 0::numeric NOT NULL,
    ponovikoprzamejo numeric(15,2) DEFAULT 0::numeric NOT NULL,
    ponovigost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    ponovikoprgost numeric(15,2) DEFAULT 0::numeric NOT NULL,
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
-- TOC entry 215 (class 1259 OID 21588550)
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
-- TOC entry 195 (class 1259 OID 21588365)
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
-- TOC entry 193 (class 1259 OID 21588339)
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
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 191 (class 1259 OID 21588316)
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
-- TOC entry 204 (class 1259 OID 21588464)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 21588975)
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
-- TOC entry 242 (class 1259 OID 21588987)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 21589009)
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
-- TOC entry 208 (class 1259 OID 21588489)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 21588273)
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
-- TOC entry 182 (class 1259 OID 21588187)
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
-- TOC entry 183 (class 1259 OID 21588198)
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
-- TOC entry 178 (class 1259 OID 21588152)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 21588171)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 21588496)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 21588530)
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
-- TOC entry 225 (class 1259 OID 21588666)
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
-- TOC entry 185 (class 1259 OID 21588231)
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
-- TOC entry 187 (class 1259 OID 21588265)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 21588865)
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
-- TOC entry 205 (class 1259 OID 21588470)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 21588250)
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
-- TOC entry 194 (class 1259 OID 21588354)
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
-- TOC entry 207 (class 1259 OID 21588482)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 21588879)
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
-- TOC entry 234 (class 1259 OID 21588889)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 21588812)
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
    stizvnekomerc numeric(15,2) DEFAULT 0::numeric,
    stizvprem integer,
    stizvpremdoma integer,
    stizvpremkopr integer,
    stizvponprem numeric(15,2) DEFAULT 0::numeric,
    stizvponpremdoma integer,
    stizvponpremzamejo numeric(15,2) DEFAULT 0::numeric,
    stizvponpremgost numeric(15,2) DEFAULT 0::numeric,
    stizvponpremkopr integer,
    stizvponpremint integer,
    stizvponpremkoprint integer,
    stizvponprej numeric(15,2) DEFAULT 0::numeric,
    stizvponprejdoma integer,
    stizvponprejzamejo numeric(15,2) DEFAULT 0::numeric,
    stizvponprejgost numeric(15,2) DEFAULT 0::numeric,
    stizvponprejkopr integer,
    stizvponprejint integer,
    stizvponprejkoprint integer,
    stizvgostuj integer,
    stizvostalihnek numeric(15,2) DEFAULT 0::numeric,
    stizvgostovanjslo numeric(15,2) DEFAULT 0::numeric,
    stizvgostovanjzam numeric(15,2) DEFAULT 0::numeric,
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
-- TOC entry 235 (class 1259 OID 21588897)
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
-- TOC entry 211 (class 1259 OID 21588511)
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
-- TOC entry 203 (class 1259 OID 21588455)
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
-- TOC entry 202 (class 1259 OID 21588445)
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
-- TOC entry 224 (class 1259 OID 21588655)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 21588585)
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
-- TOC entry 192 (class 1259 OID 21588328)
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
-- TOC entry 175 (class 1259 OID 21588123)
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
-- TOC entry 174 (class 1259 OID 21588121)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 212 (class 1259 OID 21588524)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 21588161)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 21588145)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 21588538)
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
-- TOC entry 206 (class 1259 OID 21588476)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 21588422)
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
-- TOC entry 173 (class 1259 OID 21588110)
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
-- TOC entry 172 (class 1259 OID 21588102)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 21588097)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 21588602)
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
-- TOC entry 184 (class 1259 OID 21588223)
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
-- TOC entry 201 (class 1259 OID 21588432)
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
-- TOC entry 223 (class 1259 OID 21588643)
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
-- TOC entry 236 (class 1259 OID 21588908)
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
-- TOC entry 189 (class 1259 OID 21588285)
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
-- TOC entry 176 (class 1259 OID 21588132)
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
-- TOC entry 227 (class 1259 OID 21588693)
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
-- TOC entry 196 (class 1259 OID 21588376)
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
-- TOC entry 210 (class 1259 OID 21588503)
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
-- TOC entry 221 (class 1259 OID 21588616)
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
-- TOC entry 239 (class 1259 OID 21588955)
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
-- TOC entry 238 (class 1259 OID 21588927)
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
-- TOC entry 240 (class 1259 OID 21588967)
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
-- TOC entry 217 (class 1259 OID 21588575)
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
-- TOC entry 198 (class 1259 OID 21588411)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 21588683)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 21588565)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 21588126)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2994 (class 0 OID 21588178)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 21588735)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5617-891f-6168-ef89135f7d37	000d0000-5617-891f-6fad-b0c5645361d1	\N	00090000-5617-891f-8817-2f75f4d4876e	000b0000-5617-891f-ee6b-fab9d3240387	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5617-891f-0bd6-1b7bf2c78033	000d0000-5617-891f-9ec8-b65441e7afde	00100000-5617-891f-3f3f-f46862669c7f	00090000-5617-891f-b237-4f4a66d2bce7	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5617-891f-e39a-d7f908e4be9d	000d0000-5617-891f-b143-9a4111594969	00100000-5617-891f-e887-e19069db3491	00090000-5617-891f-c5aa-fb7807366f0b	\N	0003	t	\N	2015-10-09	\N	2	t	\N	f	f
000c0000-5617-891f-d7ff-e9e733446611	000d0000-5617-891f-90f9-752f1cd10002	\N	00090000-5617-891f-ef29-18de67463079	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5617-891f-a6ca-fd8e92f8596a	000d0000-5617-891f-a274-795657789b46	\N	00090000-5617-891f-623d-14c0502c24b6	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5617-891f-c749-843441b7523c	000d0000-5617-891f-0ca2-cf20dd515df5	\N	00090000-5617-891f-d9e3-e59326bc87ae	000b0000-5617-891f-ef6b-d9f348a13d60	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5617-891f-8fee-3d9fe5d89dd2	000d0000-5617-891f-27a0-06894810a2f1	00100000-5617-891f-c6e2-c978c8390cd0	00090000-5617-891f-589c-8508dfa567fd	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5617-891f-a88c-2c5a6ce244ba	000d0000-5617-891f-bc46-1b440817208f	\N	00090000-5617-891f-e3c2-a987667d6e7b	000b0000-5617-891f-a859-8e1d561c82eb	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5617-891f-6302-5996a653787c	000d0000-5617-891f-27a0-06894810a2f1	00100000-5617-891f-f1a4-e494adeacb96	00090000-5617-891f-6812-77a6861f0122	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5617-891f-23ca-878073d39666	000d0000-5617-891f-27a0-06894810a2f1	00100000-5617-891f-591e-ab551565c8ca	00090000-5617-891f-32d8-87ded9f4a4ac	\N	0010	t	\N	2015-10-09	\N	16	f	\N	f	t
000c0000-5617-891f-6041-c83937046259	000d0000-5617-891f-27a0-06894810a2f1	00100000-5617-891f-0ab6-ef953fe138d1	00090000-5617-891f-26bd-b5bea8880c99	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5617-891f-8761-549b73c1a920	000d0000-5617-891f-6760-a36cadbdcd9e	\N	00090000-5617-891f-b237-4f4a66d2bce7	000b0000-5617-891f-073b-8b32358b4675	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3041 (class 0 OID 21588718)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 21588595)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5617-891f-7c75-68a78ee2e6c2	00160000-5617-891f-f722-80c442e66140	00090000-5617-891f-cbac-44a2a140b60a	aizv	10	t
003d0000-5617-891f-c42d-e718814003ab	00160000-5617-891f-f722-80c442e66140	00090000-5617-891f-6e71-7361ec1904ae	apri	14	t
003d0000-5617-891f-bc0b-86814c8dc611	00160000-5617-891f-bdfa-6522b93158a5	00090000-5617-891f-9c0b-14b4d6ce2d66	aizv	11	t
003d0000-5617-891f-750a-dd332e9257c0	00160000-5617-891f-87dc-8118d7f836e8	00090000-5617-891f-adb6-ca9f4b31ae9f	aizv	12	t
003d0000-5617-891f-4cfc-f44b1d7f4aee	00160000-5617-891f-f722-80c442e66140	00090000-5617-891f-3cee-8f99a638217c	apri	18	f
\.


--
-- TOC entry 3035 (class 0 OID 21588625)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5617-891f-f722-80c442e66140	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5617-891f-bdfa-6522b93158a5	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5617-891f-87dc-8118d7f836e8	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3056 (class 0 OID 21588994)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 21588386)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5617-891f-a3a2-07b338d1453a	\N	\N	00200000-5617-891f-fafa-c955206dbfe8	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5617-891f-4005-f85f7ac2c573	\N	\N	00200000-5617-891f-5f7d-91e307d345dd	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5617-891f-d3cb-d3825002e291	\N	\N	00200000-5617-891f-6228-aa5a2d2bd88c	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5617-891f-f7f0-a26c5b1a972a	\N	\N	00200000-5617-891f-b110-3a9a037ddc4f	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5617-891f-20ba-b3455e6399db	\N	\N	00200000-5617-891f-ade7-7d32d2f7aa2c	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3012 (class 0 OID 21588417)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 21588920)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 21588299)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5617-891d-faa9-dbe23059b78e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5617-891d-dcf2-b633a9c91889	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5617-891d-1978-e69a72b59ed8	AL	ALB	008	Albania 	Albanija	\N
00040000-5617-891d-903d-94700560076b	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5617-891d-3255-702677bbb3b9	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5617-891d-0c5b-34ecac1d324d	AD	AND	020	Andorra 	Andora	\N
00040000-5617-891d-959e-0592564f1cba	AO	AGO	024	Angola 	Angola	\N
00040000-5617-891d-773f-fbe3424943ba	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5617-891d-e8aa-ea7dc8976887	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5617-891d-9909-00e59debc6d2	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5617-891d-88d0-9cf7608a2996	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5617-891d-3ea3-7f265cf42f4f	AM	ARM	051	Armenia 	Armenija	\N
00040000-5617-891d-6454-d1ca187d3dfd	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5617-891d-7d68-316f4dff8a3b	AU	AUS	036	Australia 	Avstralija	\N
00040000-5617-891d-f616-36a4bf386d2d	AT	AUT	040	Austria 	Avstrija	\N
00040000-5617-891d-e4f3-62e97f0b8f3b	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5617-891d-89e1-0cde05c97821	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5617-891d-7a8c-5c42a4f267bd	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5617-891d-c039-54829984287b	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5617-891d-8596-85297187ceeb	BB	BRB	052	Barbados 	Barbados	\N
00040000-5617-891d-9e4c-b419292f687a	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5617-891d-fda0-eff5f8f39756	BE	BEL	056	Belgium 	Belgija	\N
00040000-5617-891d-9294-1472318eff79	BZ	BLZ	084	Belize 	Belize	\N
00040000-5617-891d-b006-37d11f4ca2b6	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5617-891d-14a3-11d0d6a75a65	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5617-891d-ae95-d79699d07194	BT	BTN	064	Bhutan 	Butan	\N
00040000-5617-891d-47b6-9c327655e4de	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5617-891d-485e-fcdbcad3a585	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5617-891d-31e1-e0475de573ee	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5617-891d-7c66-b7cd607d01e5	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5617-891d-c016-b0dd177efbf1	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5617-891d-fb6e-13a690ed3a7c	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5617-891d-85ab-b9b1c6f19431	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5617-891d-0735-133600ee906a	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5617-891d-e2af-0ad5837aad82	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5617-891d-fd28-7a21528fe235	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5617-891d-bc05-fec4a9da3dcf	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5617-891d-42a4-69c1d16140de	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5617-891d-7511-70d4c2d91bc2	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5617-891d-4c69-933fd73bad8a	CA	CAN	124	Canada 	Kanada	\N
00040000-5617-891d-48ef-e572fd02aca4	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5617-891d-8986-cd81e48f90e5	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5617-891d-1ca6-42eef01f5d63	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5617-891d-7fce-5d40d600096a	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5617-891d-34b9-22dae39666ca	CL	CHL	152	Chile 	Čile	\N
00040000-5617-891d-b913-6ef5f95b1030	CN	CHN	156	China 	Kitajska	\N
00040000-5617-891d-51b0-3c912dd047d6	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5617-891d-d27e-4e0273247e1d	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5617-891d-56b1-26e6a73119f3	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5617-891d-ed5c-04ff99cbb83c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5617-891d-9c0a-1f0aaec69602	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5617-891d-1eb8-4d1a78d28470	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5617-891d-b988-92af45a051de	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5617-891d-ef0a-7274d9557853	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5617-891d-2ecd-a6248dd90aa1	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5617-891d-7ddb-64b21dd47323	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5617-891d-f7a7-d8d61be300c4	CU	CUB	192	Cuba 	Kuba	\N
00040000-5617-891d-958b-b15482bc6fa8	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5617-891d-2b3a-48fcfab515ca	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5617-891d-8281-93fc22499692	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5617-891d-49c7-5d6de88b498e	DK	DNK	208	Denmark 	Danska	\N
00040000-5617-891d-c29f-1aae1ad1cf8f	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5617-891d-6c97-49879d9562d4	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5617-891d-c67d-31c22c0e68d5	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5617-891d-1939-562e505463c0	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5617-891d-7a19-497b9cfeb387	EG	EGY	818	Egypt 	Egipt	\N
00040000-5617-891d-4d8a-9002891f77b2	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5617-891d-fdf4-321b6a0f85db	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5617-891d-6bf6-8acca3b6495d	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5617-891d-c586-ea314f92c4cd	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5617-891d-ad93-b8fa76aafc1b	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5617-891d-b6e8-926d9cc137d2	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5617-891d-9922-59bd173a32e6	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5617-891d-b8e2-195d37749bbc	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5617-891d-b353-af476b2d1f5b	FI	FIN	246	Finland 	Finska	\N
00040000-5617-891d-1e1d-21d57538b1bb	FR	FRA	250	France 	Francija	\N
00040000-5617-891d-c7c6-fc0b4d950faf	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5617-891d-9f96-4252a574f2b1	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5617-891d-2f62-6bcc2ad52f31	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5617-891d-5009-22b90168267c	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5617-891d-9693-46a6be042ee1	GA	GAB	266	Gabon 	Gabon	\N
00040000-5617-891d-48c9-762311d0bf5f	GM	GMB	270	Gambia 	Gambija	\N
00040000-5617-891d-b0fe-4470fa51d91c	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5617-891d-5d4b-cac06ef4e1d0	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5617-891d-9509-8f72742027db	GH	GHA	288	Ghana 	Gana	\N
00040000-5617-891d-4b97-9c9db40ab015	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5617-891d-b052-1401b127fb81	GR	GRC	300	Greece 	Grčija	\N
00040000-5617-891d-db30-d2c500067fe6	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5617-891d-0f2a-23b11778dc02	GD	GRD	308	Grenada 	Grenada	\N
00040000-5617-891d-464c-04c8c2652326	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5617-891d-b75a-67f2776d1355	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5617-891d-c529-3721fd7fa7ce	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5617-891d-5ad4-13e906f0f459	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5617-891d-63ae-339adf72a3be	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5617-891d-cde3-8d9f33add31e	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5617-891d-58c4-3adbc572d2f0	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5617-891d-58a5-29551da41279	HT	HTI	332	Haiti 	Haiti	\N
00040000-5617-891d-68c8-2b46c745dd05	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5617-891d-f92e-3c86674712dc	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5617-891d-9e8a-b28d323206a3	HN	HND	340	Honduras 	Honduras	\N
00040000-5617-891d-d734-b02dcd293e98	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5617-891d-e3ca-4dce2a50a139	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5617-891d-6257-6202f20b54d9	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5617-891d-26f8-c83e5899a8de	IN	IND	356	India 	Indija	\N
00040000-5617-891d-119c-ea3485cf8312	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5617-891d-8ae7-18c32d57a249	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5617-891d-0046-3d37437e776e	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5617-891d-02a8-74552cf32f61	IE	IRL	372	Ireland 	Irska	\N
00040000-5617-891d-19a4-c5b32e103e47	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5617-891d-491a-02dfe5a49a06	IL	ISR	376	Israel 	Izrael	\N
00040000-5617-891d-b280-912ce20e3d76	IT	ITA	380	Italy 	Italija	\N
00040000-5617-891d-f9d0-6353ef2f4968	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5617-891d-ea4b-9e46be5e03cb	JP	JPN	392	Japan 	Japonska	\N
00040000-5617-891d-0180-ada2121c4af4	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5617-891d-fe42-8a97a722c956	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5617-891d-da7d-de9484860f9e	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5617-891d-e0cb-61e3e2eb3c3b	KE	KEN	404	Kenya 	Kenija	\N
00040000-5617-891d-94ca-215a1e39ab34	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5617-891d-5fcc-4ab89487bd02	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5617-891d-247d-e5d5887da724	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5617-891d-b208-d36c6489b2f1	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5617-891d-838e-97340c47c079	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5617-891d-2325-b4910a9653da	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5617-891d-d684-31b8d680d030	LV	LVA	428	Latvia 	Latvija	\N
00040000-5617-891d-a0b9-db028c61cda5	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5617-891d-2c52-4f8b3229ce08	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5617-891d-8d27-9e7867377665	LR	LBR	430	Liberia 	Liberija	\N
00040000-5617-891d-befa-fc512a36ea8f	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5617-891d-eba2-4013c5c5d2fd	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5617-891d-8ba1-a65a04fc4189	LT	LTU	440	Lithuania 	Litva	\N
00040000-5617-891d-8a6e-a1b46323ebd2	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5617-891d-1950-321c5981beeb	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5617-891d-2844-e0d84a2a5795	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5617-891d-8f9b-00e33c27be21	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5617-891d-84d6-43ad17b9eaa1	MW	MWI	454	Malawi 	Malavi	\N
00040000-5617-891d-736b-97d03527e1e1	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5617-891d-f8c0-e20a7dc17dda	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5617-891d-c3d3-a484285fa5d9	ML	MLI	466	Mali 	Mali	\N
00040000-5617-891d-1ab8-89d32d311e8c	MT	MLT	470	Malta 	Malta	\N
00040000-5617-891d-b58a-47dafcbcba24	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5617-891d-29e3-028247335560	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5617-891d-9222-dd77ee05d3d4	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5617-891d-3da5-ca16ca079952	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5617-891d-5b5f-09d21caf6da2	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5617-891d-71bf-4dfe2f344d48	MX	MEX	484	Mexico 	Mehika	\N
00040000-5617-891d-7c17-4a74d6b69021	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5617-891d-24c2-b5bdb2ffa4d3	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5617-891d-e6b0-eca726a57292	MC	MCO	492	Monaco 	Monako	\N
00040000-5617-891d-5a01-0ca2c442261e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5617-891d-b9c3-8bbb9a2b82bf	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5617-891d-0c18-4f54e2f84ad6	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5617-891d-9f0b-52ef8130a683	MA	MAR	504	Morocco 	Maroko	\N
00040000-5617-891d-a9e5-fa18c4a079e9	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5617-891d-1895-b6bb81823332	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5617-891d-185f-3e20c287c275	NA	NAM	516	Namibia 	Namibija	\N
00040000-5617-891d-4e5f-249176de2546	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5617-891d-0819-877fe50a1b90	NP	NPL	524	Nepal 	Nepal	\N
00040000-5617-891d-7378-5f84b6931320	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5617-891d-ebc2-eb8d9aff0979	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5617-891d-d4d8-e205ac551099	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5617-891d-7605-f7d701b3dbd9	NE	NER	562	Niger 	Niger 	\N
00040000-5617-891d-3eea-c3c9cd8902b8	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5617-891d-635c-18fe0eaf5d4f	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5617-891d-4be2-6b4905af2dba	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5617-891d-ce27-2b5446effdb7	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5617-891d-d835-818ba446b5a7	NO	NOR	578	Norway 	Norveška	\N
00040000-5617-891d-e959-28cfb8a6e5ca	OM	OMN	512	Oman 	Oman	\N
00040000-5617-891d-8dbe-76139a9ce43b	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5617-891d-0538-003100b388ba	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5617-891d-0f53-f69258aef476	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5617-891d-f66e-1b62ea86352a	PA	PAN	591	Panama 	Panama	\N
00040000-5617-891d-d515-e9fcef5e5047	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5617-891d-3775-bb461573ebe6	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5617-891d-69f7-19a4cf735726	PE	PER	604	Peru 	Peru	\N
00040000-5617-891d-fa26-69018e5c36c5	PH	PHL	608	Philippines 	Filipini	\N
00040000-5617-891d-3cd4-bf4d7f41273a	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5617-891d-4312-351f079525c6	PL	POL	616	Poland 	Poljska	\N
00040000-5617-891d-955b-966ab8f75495	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5617-891d-0681-a10cf5031197	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5617-891d-76ae-c349669fe0ff	QA	QAT	634	Qatar 	Katar	\N
00040000-5617-891d-39b4-3f2a83ab3f01	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5617-891d-cd76-1132224a6894	RO	ROU	642	Romania 	Romunija	\N
00040000-5617-891d-51af-894d5ef195ec	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5617-891d-798c-c0531922f8d1	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5617-891d-7573-700ceb9271e6	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5617-891d-f63c-0201544acda4	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5617-891d-e326-9c43910a4f7f	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5617-891d-a4d8-c06432bcb115	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5617-891d-8d1f-c0e5a48df949	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5617-891d-f2f7-7a9f83057455	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5617-891d-d57f-bd3b49a604c2	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5617-891d-2351-bfe358d5d000	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5617-891d-89f2-6510f37f8f0a	SM	SMR	674	San Marino 	San Marino	\N
00040000-5617-891d-1517-2cbc3dd78be4	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5617-891d-27a2-1cb8f4f5431b	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5617-891d-811d-a2f1533ad1b6	SN	SEN	686	Senegal 	Senegal	\N
00040000-5617-891d-e9a6-d661aa59c5f8	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5617-891d-a597-c8fa831b9ccd	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5617-891d-eff7-0fdc972097a3	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5617-891d-1af9-0a784e88b08d	SG	SGP	702	Singapore 	Singapur	\N
00040000-5617-891d-ce5e-6a1f861b12ec	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5617-891d-6dae-77d227c76af7	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5617-891d-62c8-675625d895a3	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5617-891d-b1cf-d5cb5d7cbaad	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5617-891d-7810-8870620d2ad0	SO	SOM	706	Somalia 	Somalija	\N
00040000-5617-891d-6fb0-aceeda049df2	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5617-891d-6a5b-37c10d194d8b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5617-891d-3e1f-087c515beb94	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5617-891d-fc7e-714e69e356ff	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5617-891d-280e-f2ce4fa0f4e1	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5617-891d-139f-0ba3827b9c6c	SD	SDN	729	Sudan 	Sudan	\N
00040000-5617-891d-33a5-734e43c24c19	SR	SUR	740	Suriname 	Surinam	\N
00040000-5617-891d-443d-dfadfa6061f2	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5617-891d-2ba9-65859d3da5f8	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5617-891d-4895-9ad44b2eec94	SE	SWE	752	Sweden 	Švedska	\N
00040000-5617-891d-7a0f-7c565bb39037	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5617-891d-3330-169499feccd5	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5617-891d-c1c4-ef0e07616100	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5617-891d-5217-a36d41a01d22	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5617-891d-6809-66bf25053ad9	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5617-891d-1465-e00bc735b215	TH	THA	764	Thailand 	Tajska	\N
00040000-5617-891d-1c19-a11a9d8d2921	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5617-891d-3a3f-18159da8b684	TG	TGO	768	Togo 	Togo	\N
00040000-5617-891d-04dc-1794cc9b19cf	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5617-891d-d249-aea0716f8455	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5617-891d-f345-95e1e511e528	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5617-891d-02e4-b7339e8056c3	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5617-891d-54d2-bf601d5ea412	TR	TUR	792	Turkey 	Turčija	\N
00040000-5617-891d-477f-22f42f4ac383	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5617-891d-6e9d-c491ad5bb7e7	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5617-891d-0db1-189ddc0509f1	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5617-891d-a166-2f18acb75692	UG	UGA	800	Uganda 	Uganda	\N
00040000-5617-891d-bbb3-aa9deffa290f	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5617-891d-c04f-8bc5e0837f23	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5617-891d-ff3c-350d5fd7ab52	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5617-891d-dcda-b42157def08d	US	USA	840	United States 	Združene države Amerike	\N
00040000-5617-891d-4d67-09c60dc3d970	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5617-891d-db90-9299096ac3df	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5617-891d-1e23-baa61a6a3847	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5617-891d-27c8-79e50106816f	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5617-891d-40f1-d7e601807903	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5617-891d-6d6e-feb72cd8dff2	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5617-891d-506c-506c5583a21f	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5617-891d-ac67-2c1c8e6f31e1	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5617-891d-3fc2-11e8676f7617	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5617-891d-30d5-cd62db6f71fc	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5617-891d-93e1-ed6dcb3a43a4	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5617-891d-9864-94a605819c6b	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5617-891d-709b-6ed8ee6c9831	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3043 (class 0 OID 21588748)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5617-891f-1756-a48d5a694e0a	000e0000-5617-891f-bef1-77f7e6f66194	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5617-891d-bd5f-f98d08ea92b5	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5617-891f-125f-cf6bac2dbfc2	000e0000-5617-891f-602e-8d3232ef3cf1	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5617-891d-616f-d20d7405a2ae	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5617-891f-cac7-e2a301a399cd	000e0000-5617-891f-6ca5-9fa8d1d0c3c0	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5617-891d-bd5f-f98d08ea92b5	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5617-891f-280d-19c4917a41c0	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5617-891f-3343-b4b2cd308519	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3028 (class 0 OID 21588550)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5617-891f-6fad-b0c5645361d1	000e0000-5617-891f-602e-8d3232ef3cf1	000c0000-5617-891f-6168-ef89135f7d37	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5617-891d-14af-b7db400f0e48
000d0000-5617-891f-9ec8-b65441e7afde	000e0000-5617-891f-602e-8d3232ef3cf1	000c0000-5617-891f-0bd6-1b7bf2c78033	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5617-891d-f589-9d93d502dd16
000d0000-5617-891f-b143-9a4111594969	000e0000-5617-891f-602e-8d3232ef3cf1	000c0000-5617-891f-e39a-d7f908e4be9d	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5617-891d-f36b-6531c37fea54
000d0000-5617-891f-90f9-752f1cd10002	000e0000-5617-891f-602e-8d3232ef3cf1	000c0000-5617-891f-d7ff-e9e733446611	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5617-891d-33ad-a8a8e1a34a7e
000d0000-5617-891f-a274-795657789b46	000e0000-5617-891f-602e-8d3232ef3cf1	000c0000-5617-891f-a6ca-fd8e92f8596a	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5617-891d-33ad-a8a8e1a34a7e
000d0000-5617-891f-0ca2-cf20dd515df5	000e0000-5617-891f-602e-8d3232ef3cf1	000c0000-5617-891f-c749-843441b7523c	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5617-891d-14af-b7db400f0e48
000d0000-5617-891f-27a0-06894810a2f1	000e0000-5617-891f-602e-8d3232ef3cf1	000c0000-5617-891f-6302-5996a653787c	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5617-891d-14af-b7db400f0e48
000d0000-5617-891f-bc46-1b440817208f	000e0000-5617-891f-602e-8d3232ef3cf1	000c0000-5617-891f-a88c-2c5a6ce244ba	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5617-891d-299d-7ddcdc7bd994
000d0000-5617-891f-6760-a36cadbdcd9e	000e0000-5617-891f-602e-8d3232ef3cf1	000c0000-5617-891f-8761-549b73c1a920	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5617-891d-01f0-336dacd68c16
\.


--
-- TOC entry 3008 (class 0 OID 21588365)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 21588339)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 21588316)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5617-891f-2251-3a176d22a0dc	00080000-5617-891f-fb7a-2ac569aadeff	00090000-5617-891f-32d8-87ded9f4a4ac	AK		igralka
\.


--
-- TOC entry 3017 (class 0 OID 21588464)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 21588975)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 21588987)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 21589009)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 21093458)
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
-- TOC entry 3021 (class 0 OID 21588489)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 21588273)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5617-891d-df0a-e1b5fd3907fa	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5617-891d-fdaa-72bfac3a6f08	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5617-891d-5bf7-d772147acc36	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5617-891d-b8a9-a0a8fcb7514a	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5617-891d-31d0-de3abfe5d462	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5617-891d-b469-3437a0f40643	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5617-891d-3b88-37b3a8db0118	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5617-891d-51b6-9e52fe62e51b	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5617-891d-59f0-bf2ed7c4db6f	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5617-891d-e8ff-c64236aac777	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5617-891d-f170-f9ab8de74620	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5617-891d-5964-83a958903f6a	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5617-891d-2963-9718554355d8	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5617-891d-4476-803ec11450a2	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5617-891d-aa2b-a85923e9ec12	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5617-891f-4169-611d1df100bf	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5617-891f-7644-8ab61b8498c7	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5617-891f-9e58-3286a48a17b7	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5617-891f-87c4-62d3b3146b54	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5617-891f-053f-e33bcdeb4ae5	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5617-8921-355e-e5e933db0d6b	application.tenant.maticnopodjetje	string	s:36:"00080000-5617-8921-27c8-a20a9d94513b";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 2995 (class 0 OID 21588187)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5617-891f-f5ec-25f2401075ff	00000000-5617-891f-4169-611d1df100bf	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5617-891f-d25a-e0ca55c4a595	00000000-5617-891f-4169-611d1df100bf	00010000-5617-891d-2275-fdb3dacd5ff4	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5617-891f-6908-690f1259cf65	00000000-5617-891f-7644-8ab61b8498c7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2996 (class 0 OID 21588198)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5617-891f-8817-2f75f4d4876e	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5617-891f-ef29-18de67463079	00010000-5617-891f-1de0-c4f17d36a8db	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5617-891f-c5aa-fb7807366f0b	00010000-5617-891f-7823-a4441247d293	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5617-891f-6812-77a6861f0122	00010000-5617-891f-ecda-6c8a6f9fb8b5	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5617-891f-1093-3617b6163644	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5617-891f-d9e3-e59326bc87ae	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5617-891f-26bd-b5bea8880c99	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5617-891f-589c-8508dfa567fd	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5617-891f-32d8-87ded9f4a4ac	00010000-5617-891f-374e-25f7c9429ab4	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5617-891f-b237-4f4a66d2bce7	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5617-891f-b94c-5cba9d2f3158	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5617-891f-623d-14c0502c24b6	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5617-891f-e3c2-a987667d6e7b	00010000-5617-891f-2db5-87079807eca1	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5617-891f-cbac-44a2a140b60a	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5617-891f-6e71-7361ec1904ae	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5617-891f-9c0b-14b4d6ce2d66	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5617-891f-adb6-ca9f4b31ae9f	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5617-891f-3cee-8f99a638217c	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2991 (class 0 OID 21588152)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5617-891d-50f4-9f4a61815e41	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5617-891d-a146-0e1c66b886ef	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5617-891d-c603-d65cd09119cc	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5617-891d-4524-da00c1f5a207	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5617-891d-3065-45faad49f6a7	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5617-891d-91dc-e24e46afdd84	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5617-891d-8797-f709ce4ecdd2	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5617-891d-ee11-27aa5c91bc6a	Abonma-read	Abonma - branje	f
00030000-5617-891d-d5a0-55baa30031be	Abonma-write	Abonma - spreminjanje	f
00030000-5617-891d-ef44-58f07d11a816	Alternacija-read	Alternacija - branje	f
00030000-5617-891d-616c-440eefdd0382	Alternacija-write	Alternacija - spreminjanje	f
00030000-5617-891d-98be-c9483adee140	Arhivalija-read	Arhivalija - branje	f
00030000-5617-891d-0486-d020984d9a52	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5617-891d-529f-e88fb716a691	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5617-891d-8e8e-754fe037e558	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5617-891d-fb8b-8c34cc36cbc4	Besedilo-read	Besedilo - branje	f
00030000-5617-891d-9ebc-2144c135e63a	Besedilo-write	Besedilo - spreminjanje	f
00030000-5617-891d-5bf1-0f436569be47	DogodekIzven-read	DogodekIzven - branje	f
00030000-5617-891d-81f3-888953f1c2c8	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5617-891d-160e-47b3a1f80cb4	Dogodek-read	Dogodek - branje	f
00030000-5617-891d-26f6-558dfc67d246	Dogodek-write	Dogodek - spreminjanje	f
00030000-5617-891d-b9b1-d0e74ef93a00	DrugiVir-read	DrugiVir - branje	f
00030000-5617-891d-3ca2-256861a879d7	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5617-891d-27c4-41669c623cc5	Drzava-read	Drzava - branje	f
00030000-5617-891d-ce65-aa0aa9a186b0	Drzava-write	Drzava - spreminjanje	f
00030000-5617-891d-baca-128c12d3024a	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5617-891d-29e6-beb660a606a3	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5617-891d-26c7-93e43a9a2d1e	Funkcija-read	Funkcija - branje	f
00030000-5617-891d-4c37-2a725021f959	Funkcija-write	Funkcija - spreminjanje	f
00030000-5617-891d-b9ea-a48ecbbb39fe	Gostovanje-read	Gostovanje - branje	f
00030000-5617-891d-61fb-325afa97b5ad	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5617-891d-dece-863da89e8e45	Gostujoca-read	Gostujoca - branje	f
00030000-5617-891d-231d-e8f98cbd929a	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5617-891d-9c7f-1ce792400da5	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5617-891d-a00c-4c7615d331ef	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5617-891d-6acc-b6520bbf867e	Kupec-read	Kupec - branje	f
00030000-5617-891d-dc79-5d1804e94e02	Kupec-write	Kupec - spreminjanje	f
00030000-5617-891d-d7a5-cb51d4f72d45	NacinPlacina-read	NacinPlacina - branje	f
00030000-5617-891d-b124-9a5d93b751ac	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5617-891d-350e-46b8526a759f	Option-read	Option - branje	f
00030000-5617-891d-0a6a-6b36756eabdc	Option-write	Option - spreminjanje	f
00030000-5617-891d-040e-ac98663add7a	OptionValue-read	OptionValue - branje	f
00030000-5617-891d-031b-4b107279a9c5	OptionValue-write	OptionValue - spreminjanje	f
00030000-5617-891d-3222-75007c1bb8f3	Oseba-read	Oseba - branje	f
00030000-5617-891d-c2f9-3e371f963125	Oseba-write	Oseba - spreminjanje	f
00030000-5617-891d-54a9-9898a10b1259	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5617-891d-ab27-259348b38fe0	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5617-891d-62b1-9cb41f40d65d	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5617-891d-cc92-3dbb3605eeff	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5617-891d-4891-f990b7626862	Pogodba-read	Pogodba - branje	f
00030000-5617-891d-f757-81b26d721360	Pogodba-write	Pogodba - spreminjanje	f
00030000-5617-891d-743a-763d862eb220	Popa-read	Popa - branje	f
00030000-5617-891d-43d9-b52eb2364e2e	Popa-write	Popa - spreminjanje	f
00030000-5617-891d-babb-40dfaebde3b8	Posta-read	Posta - branje	f
00030000-5617-891d-3929-68f99c09fa4c	Posta-write	Posta - spreminjanje	f
00030000-5617-891d-255f-1b31936c1c9c	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5617-891d-c2f5-a6a4b06d072e	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5617-891d-fcf8-16249ac88dd0	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5617-891d-5d84-d6eef837354c	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5617-891d-aa66-ab90070f9f03	PostniNaslov-read	PostniNaslov - branje	f
00030000-5617-891d-9e16-7f3613e96862	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5617-891d-66de-c9f4cf570c0e	Predstava-read	Predstava - branje	f
00030000-5617-891d-0457-0312feead78f	Predstava-write	Predstava - spreminjanje	f
00030000-5617-891d-6394-16ff1e1f5aba	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5617-891d-c98a-0807a3dbf7e4	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5617-891d-333d-f3dc0c220378	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5617-891d-7b18-1f22412ed1b4	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5617-891d-407a-9cf354283c73	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5617-891d-ef1a-18a9b672920f	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5617-891d-a818-23062ec661ad	ProgramDela-read	ProgramDela - branje	f
00030000-5617-891d-08b8-748faea88033	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5617-891d-2c6d-56d8060d823c	ProgramFestival-read	ProgramFestival - branje	f
00030000-5617-891d-8352-f60837ad0fb8	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5617-891d-c216-d76b676a803f	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5617-891d-f0f8-120b12fd6c73	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5617-891d-ef9e-1d19e72d12bf	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5617-891d-c4d6-78b61b630485	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5617-891d-9452-52df5228418b	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5617-891d-c6a3-7a16da67a55d	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5617-891d-e510-90c9a8f8339e	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5617-891d-8405-1edf10d15fa2	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5617-891d-b2dc-db86739a484e	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5617-891d-40ab-6a56d1e310ea	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5617-891d-f8c4-15a74444f8d2	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5617-891d-b7ae-2dbea690bdfe	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5617-891d-eb1c-c6eab043421f	ProgramRazno-read	ProgramRazno - branje	f
00030000-5617-891d-b345-1587f19b7c0c	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5617-891d-b7af-147828397467	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5617-891d-47bd-aac302ba07de	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5617-891d-3cd1-f94e65284a53	Prostor-read	Prostor - branje	f
00030000-5617-891d-0abf-eb06318635de	Prostor-write	Prostor - spreminjanje	f
00030000-5617-891d-4114-556ffe32de28	Racun-read	Racun - branje	f
00030000-5617-891d-d867-0f23dae7bdfc	Racun-write	Racun - spreminjanje	f
00030000-5617-891d-dfaa-41240fce01df	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5617-891d-4dba-a6eeeba15062	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5617-891d-ca02-ecf53e65cd74	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5617-891d-43d5-96a31542481f	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5617-891d-b77f-29464339398e	Rekvizit-read	Rekvizit - branje	f
00030000-5617-891d-bb6d-8fee3bcef722	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5617-891d-0de5-4b43953a4543	Revizija-read	Revizija - branje	f
00030000-5617-891d-d2db-471c5c887a36	Revizija-write	Revizija - spreminjanje	f
00030000-5617-891d-dcf6-df3195d30eef	Rezervacija-read	Rezervacija - branje	f
00030000-5617-891d-1ed2-d874e71011b2	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5617-891d-b93f-be2da2586f0a	SedezniRed-read	SedezniRed - branje	f
00030000-5617-891d-6d56-6305a7f985b1	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5617-891d-b391-cc14e2a181fc	Sedez-read	Sedez - branje	f
00030000-5617-891d-47e5-d0654367b763	Sedez-write	Sedez - spreminjanje	f
00030000-5617-891d-cafe-6c72d1629784	Sezona-read	Sezona - branje	f
00030000-5617-891d-27d7-5db51f0e32a2	Sezona-write	Sezona - spreminjanje	f
00030000-5617-891d-1d93-62f6ac03f5f5	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5617-891d-96d1-4eec9f297682	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5617-891d-04c6-10c9b069468a	Stevilcenje-read	Stevilcenje - branje	f
00030000-5617-891d-9324-567dbd9a946d	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5617-891d-e9a8-00fe6d05d9e3	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5617-891d-9c04-c38fa0273e80	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5617-891d-4c26-b5b28e888750	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5617-891d-d20a-8ecc432dae49	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5617-891d-59fb-41fdf2216355	Telefonska-read	Telefonska - branje	f
00030000-5617-891d-75cc-b6f22d40d446	Telefonska-write	Telefonska - spreminjanje	f
00030000-5617-891d-4d20-9b518d9658b1	TerminStoritve-read	TerminStoritve - branje	f
00030000-5617-891d-2bf3-1430bf5162c9	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5617-891d-c104-6c7ec1a9b855	TipFunkcije-read	TipFunkcije - branje	f
00030000-5617-891d-7877-1c83e7befdf4	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5617-891d-88b3-4a4a479819e6	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5617-891d-7864-56c3522d7788	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5617-891d-d2ba-c6d382c7a686	Trr-read	Trr - branje	f
00030000-5617-891d-2d6c-b29295663dfe	Trr-write	Trr - spreminjanje	f
00030000-5617-891d-5b0b-fa5df5b493c3	Uprizoritev-read	Uprizoritev - branje	f
00030000-5617-891d-3d3e-ff4169c326bd	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5617-891d-5785-4aa92dfb2dc8	Vaja-read	Vaja - branje	f
00030000-5617-891d-46d8-f3d6c53dd76b	Vaja-write	Vaja - spreminjanje	f
00030000-5617-891d-ebb6-e8ae40c74408	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5617-891d-46ee-cdfe3e365e7a	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5617-891d-fe13-048fe55d6114	VrstaStroska-read	VrstaStroska - branje	f
00030000-5617-891d-9334-b1f32d89691d	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5617-891d-7fc8-38faf126bb2e	Zaposlitev-read	Zaposlitev - branje	f
00030000-5617-891d-57f9-c97802398321	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5617-891d-c179-0fdaf6bf8bda	Zasedenost-read	Zasedenost - branje	f
00030000-5617-891d-b37b-5be569003d3d	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5617-891d-4667-992b2735b966	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5617-891d-c4c6-888a9b7ff798	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5617-891d-52bf-d7fd9b505c13	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5617-891d-dee0-f86473d6b70e	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5617-891d-6a63-43aa5ad5c61f	Job-read	Branje opravil - samo zase - branje	f
00030000-5617-891d-95da-841f120744c3	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5617-891d-dba5-9cc38d189506	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5617-891d-657a-31bb7bf74b13	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5617-891d-7dfe-5be2423531ee	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5617-891d-c8b1-e1001e6e7611	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5617-891d-d622-3b0bed061c27	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5617-891d-3aed-27a6fdd71860	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5617-891d-d69f-9684e9f570e1	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5617-891d-58ca-3ac2f0fdc04a	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5617-891d-a700-2d3028f5b834	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5617-891d-6595-b77b2ff0e064	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5617-891d-2339-5fbf436b61fb	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5617-891d-4795-4b0e21a84379	Datoteka-write	Datoteka - spreminjanje	f
00030000-5617-891d-f9d2-748205cc5ddc	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2993 (class 0 OID 21588171)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5617-891d-5bb9-bf3053b09463	00030000-5617-891d-a146-0e1c66b886ef
00020000-5617-891d-667e-227121f968cb	00030000-5617-891d-27c4-41669c623cc5
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-ee11-27aa5c91bc6a
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-d5a0-55baa30031be
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-ef44-58f07d11a816
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-616c-440eefdd0382
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-98be-c9483adee140
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-160e-47b3a1f80cb4
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-4524-da00c1f5a207
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-26f6-558dfc67d246
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-27c4-41669c623cc5
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-ce65-aa0aa9a186b0
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-26c7-93e43a9a2d1e
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-4c37-2a725021f959
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-b9ea-a48ecbbb39fe
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-61fb-325afa97b5ad
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-dece-863da89e8e45
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-231d-e8f98cbd929a
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-9c7f-1ce792400da5
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-a00c-4c7615d331ef
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-350e-46b8526a759f
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-040e-ac98663add7a
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-3222-75007c1bb8f3
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-c2f9-3e371f963125
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-743a-763d862eb220
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-43d9-b52eb2364e2e
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-babb-40dfaebde3b8
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-3929-68f99c09fa4c
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-aa66-ab90070f9f03
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-9e16-7f3613e96862
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-66de-c9f4cf570c0e
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-0457-0312feead78f
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-407a-9cf354283c73
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-ef1a-18a9b672920f
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-3cd1-f94e65284a53
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-0abf-eb06318635de
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-ca02-ecf53e65cd74
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-43d5-96a31542481f
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-b77f-29464339398e
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-bb6d-8fee3bcef722
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-cafe-6c72d1629784
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-27d7-5db51f0e32a2
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-c104-6c7ec1a9b855
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-5b0b-fa5df5b493c3
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-3d3e-ff4169c326bd
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-5785-4aa92dfb2dc8
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-46d8-f3d6c53dd76b
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-c179-0fdaf6bf8bda
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-b37b-5be569003d3d
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-4667-992b2735b966
00020000-5617-891d-9505-76000e50575b	00030000-5617-891d-52bf-d7fd9b505c13
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-ee11-27aa5c91bc6a
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-98be-c9483adee140
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-160e-47b3a1f80cb4
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-27c4-41669c623cc5
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-b9ea-a48ecbbb39fe
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-dece-863da89e8e45
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-9c7f-1ce792400da5
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-a00c-4c7615d331ef
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-350e-46b8526a759f
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-040e-ac98663add7a
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-3222-75007c1bb8f3
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-c2f9-3e371f963125
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-743a-763d862eb220
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-babb-40dfaebde3b8
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-aa66-ab90070f9f03
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-9e16-7f3613e96862
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-66de-c9f4cf570c0e
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-3cd1-f94e65284a53
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-ca02-ecf53e65cd74
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-b77f-29464339398e
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-cafe-6c72d1629784
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-59fb-41fdf2216355
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-75cc-b6f22d40d446
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-d2ba-c6d382c7a686
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-2d6c-b29295663dfe
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-7fc8-38faf126bb2e
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-57f9-c97802398321
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-4667-992b2735b966
00020000-5617-891d-d063-ab6dadac18f3	00030000-5617-891d-52bf-d7fd9b505c13
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-ee11-27aa5c91bc6a
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-ef44-58f07d11a816
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-98be-c9483adee140
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-0486-d020984d9a52
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-fb8b-8c34cc36cbc4
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-5bf1-0f436569be47
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-160e-47b3a1f80cb4
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-27c4-41669c623cc5
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-26c7-93e43a9a2d1e
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-b9ea-a48ecbbb39fe
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-dece-863da89e8e45
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-9c7f-1ce792400da5
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-350e-46b8526a759f
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-040e-ac98663add7a
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-3222-75007c1bb8f3
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-743a-763d862eb220
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-babb-40dfaebde3b8
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-66de-c9f4cf570c0e
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-407a-9cf354283c73
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-3cd1-f94e65284a53
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-ca02-ecf53e65cd74
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-b77f-29464339398e
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-cafe-6c72d1629784
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-c104-6c7ec1a9b855
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-5785-4aa92dfb2dc8
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-c179-0fdaf6bf8bda
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-4667-992b2735b966
00020000-5617-891d-1510-33d8ec20a241	00030000-5617-891d-52bf-d7fd9b505c13
00020000-5617-891d-b023-19a93cb9bac6	00030000-5617-891d-ee11-27aa5c91bc6a
00020000-5617-891d-b023-19a93cb9bac6	00030000-5617-891d-d5a0-55baa30031be
00020000-5617-891d-b023-19a93cb9bac6	00030000-5617-891d-616c-440eefdd0382
00020000-5617-891d-b023-19a93cb9bac6	00030000-5617-891d-98be-c9483adee140
00020000-5617-891d-b023-19a93cb9bac6	00030000-5617-891d-160e-47b3a1f80cb4
00020000-5617-891d-b023-19a93cb9bac6	00030000-5617-891d-27c4-41669c623cc5
00020000-5617-891d-b023-19a93cb9bac6	00030000-5617-891d-b9ea-a48ecbbb39fe
00020000-5617-891d-b023-19a93cb9bac6	00030000-5617-891d-dece-863da89e8e45
00020000-5617-891d-b023-19a93cb9bac6	00030000-5617-891d-350e-46b8526a759f
00020000-5617-891d-b023-19a93cb9bac6	00030000-5617-891d-040e-ac98663add7a
00020000-5617-891d-b023-19a93cb9bac6	00030000-5617-891d-743a-763d862eb220
00020000-5617-891d-b023-19a93cb9bac6	00030000-5617-891d-babb-40dfaebde3b8
00020000-5617-891d-b023-19a93cb9bac6	00030000-5617-891d-66de-c9f4cf570c0e
00020000-5617-891d-b023-19a93cb9bac6	00030000-5617-891d-3cd1-f94e65284a53
00020000-5617-891d-b023-19a93cb9bac6	00030000-5617-891d-ca02-ecf53e65cd74
00020000-5617-891d-b023-19a93cb9bac6	00030000-5617-891d-b77f-29464339398e
00020000-5617-891d-b023-19a93cb9bac6	00030000-5617-891d-cafe-6c72d1629784
00020000-5617-891d-b023-19a93cb9bac6	00030000-5617-891d-c104-6c7ec1a9b855
00020000-5617-891d-b023-19a93cb9bac6	00030000-5617-891d-4667-992b2735b966
00020000-5617-891d-b023-19a93cb9bac6	00030000-5617-891d-52bf-d7fd9b505c13
00020000-5617-891d-e755-eee11950ef6b	00030000-5617-891d-ee11-27aa5c91bc6a
00020000-5617-891d-e755-eee11950ef6b	00030000-5617-891d-98be-c9483adee140
00020000-5617-891d-e755-eee11950ef6b	00030000-5617-891d-160e-47b3a1f80cb4
00020000-5617-891d-e755-eee11950ef6b	00030000-5617-891d-27c4-41669c623cc5
00020000-5617-891d-e755-eee11950ef6b	00030000-5617-891d-b9ea-a48ecbbb39fe
00020000-5617-891d-e755-eee11950ef6b	00030000-5617-891d-dece-863da89e8e45
00020000-5617-891d-e755-eee11950ef6b	00030000-5617-891d-350e-46b8526a759f
00020000-5617-891d-e755-eee11950ef6b	00030000-5617-891d-040e-ac98663add7a
00020000-5617-891d-e755-eee11950ef6b	00030000-5617-891d-743a-763d862eb220
00020000-5617-891d-e755-eee11950ef6b	00030000-5617-891d-babb-40dfaebde3b8
00020000-5617-891d-e755-eee11950ef6b	00030000-5617-891d-66de-c9f4cf570c0e
00020000-5617-891d-e755-eee11950ef6b	00030000-5617-891d-3cd1-f94e65284a53
00020000-5617-891d-e755-eee11950ef6b	00030000-5617-891d-ca02-ecf53e65cd74
00020000-5617-891d-e755-eee11950ef6b	00030000-5617-891d-b77f-29464339398e
00020000-5617-891d-e755-eee11950ef6b	00030000-5617-891d-cafe-6c72d1629784
00020000-5617-891d-e755-eee11950ef6b	00030000-5617-891d-4d20-9b518d9658b1
00020000-5617-891d-e755-eee11950ef6b	00030000-5617-891d-c603-d65cd09119cc
00020000-5617-891d-e755-eee11950ef6b	00030000-5617-891d-c104-6c7ec1a9b855
00020000-5617-891d-e755-eee11950ef6b	00030000-5617-891d-4667-992b2735b966
00020000-5617-891d-e755-eee11950ef6b	00030000-5617-891d-52bf-d7fd9b505c13
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-50f4-9f4a61815e41
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-a146-0e1c66b886ef
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-c603-d65cd09119cc
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-4524-da00c1f5a207
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-3065-45faad49f6a7
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-91dc-e24e46afdd84
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-8797-f709ce4ecdd2
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-ee11-27aa5c91bc6a
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-d5a0-55baa30031be
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-ef44-58f07d11a816
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-616c-440eefdd0382
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-98be-c9483adee140
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-0486-d020984d9a52
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-fb8b-8c34cc36cbc4
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-9ebc-2144c135e63a
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-5bf1-0f436569be47
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-81f3-888953f1c2c8
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-160e-47b3a1f80cb4
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-26f6-558dfc67d246
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-27c4-41669c623cc5
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-ce65-aa0aa9a186b0
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-b9b1-d0e74ef93a00
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-3ca2-256861a879d7
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-baca-128c12d3024a
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-29e6-beb660a606a3
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-26c7-93e43a9a2d1e
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-4c37-2a725021f959
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-b9ea-a48ecbbb39fe
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-61fb-325afa97b5ad
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-dece-863da89e8e45
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-231d-e8f98cbd929a
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-9c7f-1ce792400da5
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-a00c-4c7615d331ef
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-6acc-b6520bbf867e
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-dc79-5d1804e94e02
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-d7a5-cb51d4f72d45
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-b124-9a5d93b751ac
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-350e-46b8526a759f
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-0a6a-6b36756eabdc
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-040e-ac98663add7a
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-031b-4b107279a9c5
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-3222-75007c1bb8f3
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-c2f9-3e371f963125
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-54a9-9898a10b1259
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-ab27-259348b38fe0
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-62b1-9cb41f40d65d
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-cc92-3dbb3605eeff
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-4891-f990b7626862
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-f757-81b26d721360
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-743a-763d862eb220
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-43d9-b52eb2364e2e
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-babb-40dfaebde3b8
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-3929-68f99c09fa4c
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-255f-1b31936c1c9c
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-c2f5-a6a4b06d072e
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-fcf8-16249ac88dd0
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-5d84-d6eef837354c
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-aa66-ab90070f9f03
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-9e16-7f3613e96862
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-66de-c9f4cf570c0e
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-0457-0312feead78f
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-6394-16ff1e1f5aba
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-c98a-0807a3dbf7e4
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-333d-f3dc0c220378
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-7b18-1f22412ed1b4
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-407a-9cf354283c73
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-ef1a-18a9b672920f
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-a818-23062ec661ad
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-08b8-748faea88033
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-2c6d-56d8060d823c
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-8352-f60837ad0fb8
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-c216-d76b676a803f
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-f0f8-120b12fd6c73
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-ef9e-1d19e72d12bf
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-c4d6-78b61b630485
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-9452-52df5228418b
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-c6a3-7a16da67a55d
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-e510-90c9a8f8339e
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-8405-1edf10d15fa2
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-b2dc-db86739a484e
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-40ab-6a56d1e310ea
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-f8c4-15a74444f8d2
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-b7ae-2dbea690bdfe
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-eb1c-c6eab043421f
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-b345-1587f19b7c0c
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-b7af-147828397467
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-47bd-aac302ba07de
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-3cd1-f94e65284a53
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-0abf-eb06318635de
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-4114-556ffe32de28
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-d867-0f23dae7bdfc
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-dfaa-41240fce01df
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-4dba-a6eeeba15062
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-ca02-ecf53e65cd74
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-43d5-96a31542481f
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-b77f-29464339398e
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-bb6d-8fee3bcef722
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-0de5-4b43953a4543
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-d2db-471c5c887a36
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-dcf6-df3195d30eef
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-1ed2-d874e71011b2
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-b93f-be2da2586f0a
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-6d56-6305a7f985b1
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-b391-cc14e2a181fc
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-47e5-d0654367b763
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-cafe-6c72d1629784
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-27d7-5db51f0e32a2
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-1d93-62f6ac03f5f5
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-96d1-4eec9f297682
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-04c6-10c9b069468a
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-9324-567dbd9a946d
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-e9a8-00fe6d05d9e3
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-9c04-c38fa0273e80
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-4c26-b5b28e888750
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-d20a-8ecc432dae49
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-59fb-41fdf2216355
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-75cc-b6f22d40d446
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-4d20-9b518d9658b1
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-2bf3-1430bf5162c9
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-c104-6c7ec1a9b855
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-7877-1c83e7befdf4
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-88b3-4a4a479819e6
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-7864-56c3522d7788
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-d2ba-c6d382c7a686
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-2d6c-b29295663dfe
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-5b0b-fa5df5b493c3
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-3d3e-ff4169c326bd
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-5785-4aa92dfb2dc8
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-46d8-f3d6c53dd76b
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-ebb6-e8ae40c74408
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-46ee-cdfe3e365e7a
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-fe13-048fe55d6114
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-9334-b1f32d89691d
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-7fc8-38faf126bb2e
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-57f9-c97802398321
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-c179-0fdaf6bf8bda
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-b37b-5be569003d3d
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-4667-992b2735b966
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-c4c6-888a9b7ff798
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-52bf-d7fd9b505c13
00020000-5617-891f-f35a-d793ca9bf814	00030000-5617-891d-dee0-f86473d6b70e
\.


--
-- TOC entry 3022 (class 0 OID 21588496)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 21588530)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 21588666)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5617-891f-ee6b-fab9d3240387	00090000-5617-891f-8817-2f75f4d4876e	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5617-891f-ef6b-d9f348a13d60	00090000-5617-891f-d9e3-e59326bc87ae	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5617-891f-a859-8e1d561c82eb	00090000-5617-891f-e3c2-a987667d6e7b	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5617-891f-073b-8b32358b4675	00090000-5617-891f-b237-4f4a66d2bce7	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2998 (class 0 OID 21588231)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5617-891f-fb7a-2ac569aadeff	00040000-5617-891d-62c8-675625d895a3	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5617-891f-f57a-99bbfad28fb2	00040000-5617-891d-62c8-675625d895a3	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5617-891f-7687-1c328c8d99c0	00040000-5617-891d-62c8-675625d895a3	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5617-891f-2f79-77d3861571f1	00040000-5617-891d-62c8-675625d895a3	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5617-891f-b53b-35e8f4749fe7	00040000-5617-891d-62c8-675625d895a3	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5617-891f-3abd-acf2f13320f6	00040000-5617-891d-88d0-9cf7608a2996	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5617-891f-830e-e7df5efa96da	00040000-5617-891d-7ddb-64b21dd47323	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5617-891f-9679-30247a0c44af	00040000-5617-891d-f616-36a4bf386d2d	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5617-891f-9040-667e9dbcb04b	00040000-5617-891d-5d4b-cac06ef4e1d0	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5617-8921-27c8-a20a9d94513b	00040000-5617-891d-62c8-675625d895a3	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3000 (class 0 OID 21588265)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5617-891c-a147-304d8787d800	8341	Adlešiči
00050000-5617-891c-902f-ac6ef0b7a2c0	5270	Ajdovščina
00050000-5617-891c-44be-6605339651a7	6280	Ankaran/Ancarano
00050000-5617-891c-d536-0374710514c5	9253	Apače
00050000-5617-891c-ae14-cad67c86fc0d	8253	Artiče
00050000-5617-891c-3003-b56ebc81dc77	4275	Begunje na Gorenjskem
00050000-5617-891c-1846-c365a76949f6	1382	Begunje pri Cerknici
00050000-5617-891c-9842-2c419a4259f4	9231	Beltinci
00050000-5617-891c-64f5-b862d891d2f2	2234	Benedikt
00050000-5617-891c-e7e6-53c25848134f	2345	Bistrica ob Dravi
00050000-5617-891c-8a76-b768411d72d2	3256	Bistrica ob Sotli
00050000-5617-891c-5e66-94e1de8ba436	8259	Bizeljsko
00050000-5617-891c-2625-383dde11b97d	1223	Blagovica
00050000-5617-891c-d0c9-b0608b685c0a	8283	Blanca
00050000-5617-891c-4d1c-d291981186c6	4260	Bled
00050000-5617-891c-1a8f-ad68bafe1a1e	4273	Blejska Dobrava
00050000-5617-891c-6525-55daedc823c4	9265	Bodonci
00050000-5617-891c-5f7d-99960d669573	9222	Bogojina
00050000-5617-891c-a496-387ef4f8c369	4263	Bohinjska Bela
00050000-5617-891c-a25f-28589b3fd0a4	4264	Bohinjska Bistrica
00050000-5617-891c-047c-0d74253ff2f1	4265	Bohinjsko jezero
00050000-5617-891c-9bc9-f26380ac04df	1353	Borovnica
00050000-5617-891c-980f-bc5c47aa1dfa	8294	Boštanj
00050000-5617-891c-7579-de2d353fb196	5230	Bovec
00050000-5617-891c-5510-1a7b000521b1	5295	Branik
00050000-5617-891c-60c8-b9fcea7b2cf6	3314	Braslovče
00050000-5617-891c-fa88-85a9de06412d	5223	Breginj
00050000-5617-891c-9288-482cbaa35c87	8280	Brestanica
00050000-5617-891c-1731-fc21fdc33a9d	2354	Bresternica
00050000-5617-891c-1c02-cbbf25a09421	4243	Brezje
00050000-5617-891c-d891-f5115b10e8b2	1351	Brezovica pri Ljubljani
00050000-5617-891c-fc7e-7bbe6a026dba	8250	Brežice
00050000-5617-891c-6ba4-73fce30c5a6b	4210	Brnik - Aerodrom
00050000-5617-891c-7a98-4cd7d7b49890	8321	Brusnice
00050000-5617-891c-f520-9de39287c4b1	3255	Buče
00050000-5617-891c-2f3b-6591501fcfd0	8276	Bučka 
00050000-5617-891c-081e-6e9d4d954a9d	9261	Cankova
00050000-5617-891c-5d7d-1fd0e90d2952	3000	Celje 
00050000-5617-891c-8a06-dceed8dcaf48	3001	Celje - poštni predali
00050000-5617-891c-b8ef-2d86174fbb2d	4207	Cerklje na Gorenjskem
00050000-5617-891c-c777-369c63cc61e6	8263	Cerklje ob Krki
00050000-5617-891c-3146-a5d242a077f9	1380	Cerknica
00050000-5617-891c-6596-d2bb2c57fd70	5282	Cerkno
00050000-5617-891c-5dbb-cc8df48c7426	2236	Cerkvenjak
00050000-5617-891c-b06b-c9c1edf751be	2215	Ceršak
00050000-5617-891c-f621-2d8e7de53d51	2326	Cirkovce
00050000-5617-891c-1cec-46889576eb63	2282	Cirkulane
00050000-5617-891c-c5f9-b12cb4de56ec	5273	Col
00050000-5617-891c-07f5-a6eef0cc23df	8251	Čatež ob Savi
00050000-5617-891c-404e-17bd7245ccbb	1413	Čemšenik
00050000-5617-891c-69d4-dd0cda8b0c7b	5253	Čepovan
00050000-5617-891c-533d-bd1017d200d4	9232	Črenšovci
00050000-5617-891c-431d-38d4322a48ef	2393	Črna na Koroškem
00050000-5617-891c-7811-7d27c2346593	6275	Črni Kal
00050000-5617-891c-7837-536036cd2971	5274	Črni Vrh nad Idrijo
00050000-5617-891c-0294-c85d5f8796ea	5262	Črniče
00050000-5617-891c-c83f-a714abf799d7	8340	Črnomelj
00050000-5617-891c-d26d-88a0afb93840	6271	Dekani
00050000-5617-891c-1a1c-003cd007c732	5210	Deskle
00050000-5617-891c-3a20-e46bb8dfd67a	2253	Destrnik
00050000-5617-891c-3b72-0b0d8fa9ad0f	6215	Divača
00050000-5617-891c-bd41-f0c1a919b2f3	1233	Dob
00050000-5617-891c-466f-936535c209e2	3224	Dobje pri Planini
00050000-5617-891c-f615-3b28db5716e8	8257	Dobova
00050000-5617-891c-1176-8f632a7806a0	1423	Dobovec
00050000-5617-891c-abde-acb9cdad28f2	5263	Dobravlje
00050000-5617-891c-de3e-7c502dd8a94c	3204	Dobrna
00050000-5617-891c-d4e9-548ee38c80b2	8211	Dobrnič
00050000-5617-891c-717b-3e065939458f	1356	Dobrova
00050000-5617-891c-17c8-d1bd067aebd8	9223	Dobrovnik/Dobronak 
00050000-5617-891c-504b-8185a1b140b6	5212	Dobrovo v Brdih
00050000-5617-891c-8db9-398a38f62ea3	1431	Dol pri Hrastniku
00050000-5617-891c-0482-6cca5a26ee01	1262	Dol pri Ljubljani
00050000-5617-891c-8eab-db75fbe92d6d	1273	Dole pri Litiji
00050000-5617-891c-3d9c-0fb9daf973dc	1331	Dolenja vas
00050000-5617-891c-b644-5e366e5e8f5b	8350	Dolenjske Toplice
00050000-5617-891c-a3b6-0aa8d001542d	1230	Domžale
00050000-5617-891c-d9d5-824a35e05f4d	2252	Dornava
00050000-5617-891c-d352-f42a10ac3f2b	5294	Dornberk
00050000-5617-891c-4c39-e817baa223dd	1319	Draga
00050000-5617-891c-5695-0931f02ce82d	8343	Dragatuš
00050000-5617-891c-6521-ac2e0bc13b50	3222	Dramlje
00050000-5617-891c-e5de-18d3d0b13b28	2370	Dravograd
00050000-5617-891c-de72-8c6200bfc231	4203	Duplje
00050000-5617-891c-37fa-bf49113d8cb8	6221	Dutovlje
00050000-5617-891c-c6fe-7b19a869cd12	8361	Dvor
00050000-5617-891c-4f1e-9642fad6b446	2343	Fala
00050000-5617-891c-98eb-1d5aa2451e36	9208	Fokovci
00050000-5617-891c-0e1e-f8bef6eb11ea	2313	Fram
00050000-5617-891c-2477-078269757b1c	3213	Frankolovo
00050000-5617-891c-c176-df91a41f52c3	1274	Gabrovka
00050000-5617-891c-8a5e-b8f3ad4195ba	8254	Globoko
00050000-5617-891c-4465-3fd98c494ec3	5275	Godovič
00050000-5617-891c-6a9c-1b7ecb83a632	4204	Golnik
00050000-5617-891c-b879-e1a18c2dc83e	3303	Gomilsko
00050000-5617-891c-0c63-7f610cd91e0e	4224	Gorenja vas
00050000-5617-891c-9514-b50b63312be0	3263	Gorica pri Slivnici
00050000-5617-891c-9b61-31f3c540fc59	2272	Gorišnica
00050000-5617-891c-e75b-bc6f27d29786	9250	Gornja Radgona
00050000-5617-891c-003d-f8e99f7a990d	3342	Gornji Grad
00050000-5617-891c-2f03-49e86b62733e	4282	Gozd Martuljek
00050000-5617-891c-48df-d14c3d1dede2	6272	Gračišče
00050000-5617-891c-f03a-421e7bfaa78b	9264	Grad
00050000-5617-891c-7122-504e48a3979c	8332	Gradac
00050000-5617-891c-2c07-503cfd43e50f	1384	Grahovo
00050000-5617-891c-bd18-fd40f0036761	5242	Grahovo ob Bači
00050000-5617-891c-f83a-4a01aee54a20	5251	Grgar
00050000-5617-891c-4270-7eec811946cb	3302	Griže
00050000-5617-891c-42a6-c4d34bce0671	3231	Grobelno
00050000-5617-891c-13fa-7f7cfe154035	1290	Grosuplje
00050000-5617-891c-3684-b49f852fd002	2288	Hajdina
00050000-5617-891c-cfa5-193789e40042	8362	Hinje
00050000-5617-891c-9a60-6e42493ce3ac	2311	Hoče
00050000-5617-891c-3a07-108c47445237	9205	Hodoš/Hodos
00050000-5617-891c-b5bf-2a1f57f33816	1354	Horjul
00050000-5617-891c-d9e4-8b9ff5a153da	1372	Hotedršica
00050000-5617-891c-f096-f51c45c55011	1430	Hrastnik
00050000-5617-891c-55ea-e73e88feeea2	6225	Hruševje
00050000-5617-891c-50b2-45e7208f4308	4276	Hrušica
00050000-5617-891c-1a0e-95e492aad7a4	5280	Idrija
00050000-5617-891c-671b-9250d45d6ed2	1292	Ig
00050000-5617-891c-1bd0-0cc0c6f65b25	6250	Ilirska Bistrica
00050000-5617-891c-fd74-c4df4e84e703	6251	Ilirska Bistrica-Trnovo
00050000-5617-891c-c4fe-c7b744f64f9e	1295	Ivančna Gorica
00050000-5617-891c-9f7c-d29c373a3b91	2259	Ivanjkovci
00050000-5617-891c-5611-5e62e0677b6c	1411	Izlake
00050000-5617-891c-513e-a719516bf00f	6310	Izola/Isola
00050000-5617-891c-b3f5-a88b2e407b3f	2222	Jakobski Dol
00050000-5617-891c-857a-a4e666d31525	2221	Jarenina
00050000-5617-891c-f69d-5f0d0861a938	6254	Jelšane
00050000-5617-891c-dca2-21ce2fb0f30e	4270	Jesenice
00050000-5617-891c-773b-8dbbc9cc4edf	8261	Jesenice na Dolenjskem
00050000-5617-891c-259d-9a166de711d9	3273	Jurklošter
00050000-5617-891c-dc45-dffda0ae7ca3	2223	Jurovski Dol
00050000-5617-891c-bd23-e8f27e2d630b	2256	Juršinci
00050000-5617-891c-0e57-89b273641c44	5214	Kal nad Kanalom
00050000-5617-891c-6e9f-233999140b2b	3233	Kalobje
00050000-5617-891c-75c9-80c97d58bb4e	4246	Kamna Gorica
00050000-5617-891c-be86-c3d9c63585a5	2351	Kamnica
00050000-5617-891c-e281-dca160a16277	1241	Kamnik
00050000-5617-891c-5e6d-7ca479564a82	5213	Kanal
00050000-5617-891c-2aaf-6d046864bb89	8258	Kapele
00050000-5617-891c-1c12-45d30667a3cf	2362	Kapla
00050000-5617-891c-f97b-786a29347a5d	2325	Kidričevo
00050000-5617-891c-b19d-ad738c9d9f3c	1412	Kisovec
00050000-5617-891c-600c-7b0f174d90a2	6253	Knežak
00050000-5617-891c-b6e8-8b5f5318f023	5222	Kobarid
00050000-5617-891c-c8d8-77dd8e7e4e29	9227	Kobilje
00050000-5617-891c-6d26-747ec9b17ae4	1330	Kočevje
00050000-5617-891c-5756-25127fa30346	1338	Kočevska Reka
00050000-5617-891c-67ce-a0acce0e2588	2276	Kog
00050000-5617-891c-77e0-29aa7637ffd8	5211	Kojsko
00050000-5617-891c-3fb6-cd890f3416ab	6223	Komen
00050000-5617-891c-8055-c37d082b9e01	1218	Komenda
00050000-5617-891c-96d2-a9fd4f67124c	6000	Koper/Capodistria 
00050000-5617-891c-42dd-132449a3d6ce	6001	Koper/Capodistria - poštni predali
00050000-5617-891c-853e-58a0905fe361	8282	Koprivnica
00050000-5617-891c-b368-6513a1a07b68	5296	Kostanjevica na Krasu
00050000-5617-891c-745e-b2e085ead4ac	8311	Kostanjevica na Krki
00050000-5617-891c-44f8-e3bad44f35da	1336	Kostel
00050000-5617-891c-db13-1c6799e6cf60	6256	Košana
00050000-5617-891c-6668-acf7edec13ab	2394	Kotlje
00050000-5617-891c-1770-88f7677d3224	6240	Kozina
00050000-5617-891c-06d4-62d6e9876ed8	3260	Kozje
00050000-5617-891c-ecb7-4fe1736e16e2	4000	Kranj 
00050000-5617-891c-469d-4cb898fa807d	4001	Kranj - poštni predali
00050000-5617-891c-2766-d1dea420fa00	4280	Kranjska Gora
00050000-5617-891c-6eee-a28c346ef0f5	1281	Kresnice
00050000-5617-891c-124d-0b15be045d3f	4294	Križe
00050000-5617-891c-d0a5-235c595c53e9	9206	Križevci
00050000-5617-891c-4eaa-a895bd9ee383	9242	Križevci pri Ljutomeru
00050000-5617-891c-7103-3b4e9deb36bf	1301	Krka
00050000-5617-891c-1932-3ef8c35e673d	8296	Krmelj
00050000-5617-891c-19c6-a52483343cfb	4245	Kropa
00050000-5617-891c-8759-2e3246630a2b	8262	Krška vas
00050000-5617-891c-21f1-3f1cb968c41b	8270	Krško
00050000-5617-891c-1946-d6f21a16c6f4	9263	Kuzma
00050000-5617-891c-9f98-6ca9ab51da40	2318	Laporje
00050000-5617-891c-5735-c6ac79952fbb	3270	Laško
00050000-5617-891c-1b84-b8d041b894a7	1219	Laze v Tuhinju
00050000-5617-891c-c71f-61d7de93aaa4	2230	Lenart v Slovenskih goricah
00050000-5617-891c-33b2-61356fedf60f	9220	Lendava/Lendva
00050000-5617-891c-88fd-11e7a13b3be7	4248	Lesce
00050000-5617-891c-8cb3-9353c18e6ef0	3261	Lesično
00050000-5617-891c-5eb3-cc36c0cfad3c	8273	Leskovec pri Krškem
00050000-5617-891c-57e6-b794e8164852	2372	Libeliče
00050000-5617-891c-9d58-3587e1e6db1e	2341	Limbuš
00050000-5617-891c-770f-f3ffbc9159ef	1270	Litija
00050000-5617-891c-dae6-a1e048dfeaf6	3202	Ljubečna
00050000-5617-891c-987d-4b67f4e76fb3	1000	Ljubljana 
00050000-5617-891c-0764-7443f3cb6229	1001	Ljubljana - poštni predali
00050000-5617-891c-a718-771e2e1a2de7	1231	Ljubljana - Črnuče
00050000-5617-891c-3d97-a56e93a0ef48	1261	Ljubljana - Dobrunje
00050000-5617-891c-0014-1d29fba44917	1260	Ljubljana - Polje
00050000-5617-891c-8898-66aaa60b8f66	1210	Ljubljana - Šentvid
00050000-5617-891c-aee9-80219f676cd3	1211	Ljubljana - Šmartno
00050000-5617-891c-a2d9-396e5d28346e	3333	Ljubno ob Savinji
00050000-5617-891c-8b1b-f2d0f486314f	9240	Ljutomer
00050000-5617-891c-9d2d-9ff336c3e699	3215	Loče
00050000-5617-891c-8085-546cd50351bf	5231	Log pod Mangartom
00050000-5617-891c-8176-def040405928	1358	Log pri Brezovici
00050000-5617-891c-2dff-069971c783e3	1370	Logatec
00050000-5617-891c-45f6-244c260154fb	1371	Logatec
00050000-5617-891c-f391-10ce7dbb64d7	1434	Loka pri Zidanem Mostu
00050000-5617-891c-bd63-55435afe9bbe	3223	Loka pri Žusmu
00050000-5617-891c-c938-ea5f3c4f7fe7	6219	Lokev
00050000-5617-891c-6acf-f88e4bbb8b2c	1318	Loški Potok
00050000-5617-891c-4ed2-7278e207f6f9	2324	Lovrenc na Dravskem polju
00050000-5617-891c-0e39-45096b7c7939	2344	Lovrenc na Pohorju
00050000-5617-891c-1ae9-be6ed9db8a37	3334	Luče
00050000-5617-891c-402b-362ed0b9aabf	1225	Lukovica
00050000-5617-891c-dd4a-60c1b314ccd6	9202	Mačkovci
00050000-5617-891c-0cd6-c25bc2cf9299	2322	Majšperk
00050000-5617-891c-2f63-426d152e222a	2321	Makole
00050000-5617-891c-30de-c7ac5b849d65	9243	Mala Nedelja
00050000-5617-891c-9368-492f7f3fb525	2229	Malečnik
00050000-5617-891c-c6bc-56f99e0fcaf7	6273	Marezige
00050000-5617-891c-adb0-2bd79a99b506	2000	Maribor 
00050000-5617-891c-065a-a4c4fb26d1a2	2001	Maribor - poštni predali
00050000-5617-891c-482b-a26c3d0ff497	2206	Marjeta na Dravskem polju
00050000-5617-891c-a4e3-3e23397809d5	2281	Markovci
00050000-5617-891c-9dda-4e4a00a7e78e	9221	Martjanci
00050000-5617-891c-43a1-7320b43ca93e	6242	Materija
00050000-5617-891c-d448-5e2614807a12	4211	Mavčiče
00050000-5617-891c-0a8a-c0ae83611c51	1215	Medvode
00050000-5617-891c-c81d-243f801fec3b	1234	Mengeš
00050000-5617-891c-f1ed-072706c9b4fb	8330	Metlika
00050000-5617-891c-5345-8f5f5715062f	2392	Mežica
00050000-5617-891c-ca1b-41b1930d170d	2204	Miklavž na Dravskem polju
00050000-5617-891c-8556-76186f545b94	2275	Miklavž pri Ormožu
00050000-5617-891c-0406-d3e9d2d7f33c	5291	Miren
00050000-5617-891c-ebb1-a8ac81444fc4	8233	Mirna
00050000-5617-891c-3f45-ce151586db11	8216	Mirna Peč
00050000-5617-891c-c1a6-be0ce1e751ea	2382	Mislinja
00050000-5617-891c-6e17-09119ae825ff	4281	Mojstrana
00050000-5617-891c-1c89-b842dfc79c6e	8230	Mokronog
00050000-5617-891c-c745-12d1e0fbeabd	1251	Moravče
00050000-5617-891c-d1b5-002833bf46a2	9226	Moravske Toplice
00050000-5617-891c-57cf-d9de13b2dec8	5216	Most na Soči
00050000-5617-891c-3fd5-e5082098ff6f	1221	Motnik
00050000-5617-891c-e45a-fea70dfe8b43	3330	Mozirje
00050000-5617-891c-3f41-7ce1337f8847	9000	Murska Sobota 
00050000-5617-891c-a507-17244ae88fa9	9001	Murska Sobota - poštni predali
00050000-5617-891c-c7c6-7610db9269a1	2366	Muta
00050000-5617-891c-8e37-c64212180ff9	4202	Naklo
00050000-5617-891c-ac49-50fbca3cfba4	3331	Nazarje
00050000-5617-891c-addf-7505e220c82f	1357	Notranje Gorice
00050000-5617-891c-412e-690a65cd452f	3203	Nova Cerkev
00050000-5617-891c-2bec-b9629b2ecfa1	5000	Nova Gorica 
00050000-5617-891c-ea64-8362a74dedcc	5001	Nova Gorica - poštni predali
00050000-5617-891c-5f14-cbe6286ed09f	1385	Nova vas
00050000-5617-891c-77dd-d6a52fc80709	8000	Novo mesto
00050000-5617-891c-b57e-e27c40e646e5	8001	Novo mesto - poštni predali
00050000-5617-891c-fb30-025b24344da4	6243	Obrov
00050000-5617-891c-4f17-5723c00e1b56	9233	Odranci
00050000-5617-891c-9d63-22f01e18e9ff	2317	Oplotnica
00050000-5617-891c-e2f9-d90699701bc1	2312	Orehova vas
00050000-5617-891c-687f-712713cd9888	2270	Ormož
00050000-5617-891c-6df6-6e7aa3e1e5e4	1316	Ortnek
00050000-5617-891c-b8ae-08214448c50b	1337	Osilnica
00050000-5617-891c-1154-9c27c8af04c0	8222	Otočec
00050000-5617-891c-c192-ea3253162a12	2361	Ožbalt
00050000-5617-891c-b861-d7b361f408d5	2231	Pernica
00050000-5617-891c-6914-632ff50acb1b	2211	Pesnica pri Mariboru
00050000-5617-891c-4ebe-91e97cda47aa	9203	Petrovci
00050000-5617-891c-5c56-5a56e1e08296	3301	Petrovče
00050000-5617-891c-3748-aef43bf47ff9	6330	Piran/Pirano
00050000-5617-891c-d7bb-8312f2b4e559	8255	Pišece
00050000-5617-891c-7c0b-de0bcd4ab89e	6257	Pivka
00050000-5617-891c-516d-b7e3c94e4b1b	6232	Planina
00050000-5617-891c-f657-b2c7b043188f	3225	Planina pri Sevnici
00050000-5617-891c-96bd-ba9ca135c94c	6276	Pobegi
00050000-5617-891c-d44a-0b0ea85b032e	8312	Podbočje
00050000-5617-891c-7215-0a5de2c17d5b	5243	Podbrdo
00050000-5617-891c-e2fc-da208c9a2d5f	3254	Podčetrtek
00050000-5617-891c-7731-422ddf17bd8b	2273	Podgorci
00050000-5617-891c-18c8-786609e0d8e7	6216	Podgorje
00050000-5617-891c-78e6-2d8b96140e4f	2381	Podgorje pri Slovenj Gradcu
00050000-5617-891c-412b-d46679f2eb80	6244	Podgrad
00050000-5617-891c-3bbc-8d1ffa91fb24	1414	Podkum
00050000-5617-891c-914c-c5ca143f1f50	2286	Podlehnik
00050000-5617-891c-eb80-801d95d27bc9	5272	Podnanos
00050000-5617-891c-e06a-92e5bcfcf8ad	4244	Podnart
00050000-5617-891c-b9a2-da64bd10caab	3241	Podplat
00050000-5617-891c-6aef-d4b8460693a5	3257	Podsreda
00050000-5617-891c-f92f-5b7e5f1217dc	2363	Podvelka
00050000-5617-891c-348c-c9d462c1c235	2208	Pohorje
00050000-5617-891c-4525-d7426ef15211	2257	Polenšak
00050000-5617-891c-28d1-d1a67e63cf60	1355	Polhov Gradec
00050000-5617-891c-f1f6-a2d5373def8b	4223	Poljane nad Škofjo Loko
00050000-5617-891c-fc83-b4b124c4cb55	2319	Poljčane
00050000-5617-891c-6214-00ad9a8ff339	1272	Polšnik
00050000-5617-891c-9481-aca53c896648	3313	Polzela
00050000-5617-891c-c537-fe5faa106744	3232	Ponikva
00050000-5617-891c-9e7b-d47bf3760ea3	6320	Portorož/Portorose
00050000-5617-891c-ab82-6cb3adbf0774	6230	Postojna
00050000-5617-891c-7980-9a5bc30ffcd4	2331	Pragersko
00050000-5617-891c-bd47-03f7acdd7954	3312	Prebold
00050000-5617-891c-02f0-2c9859accb5c	4205	Preddvor
00050000-5617-891c-811f-8c1c18693fc5	6255	Prem
00050000-5617-891c-841e-f50bc18aed21	1352	Preserje
00050000-5617-891c-90bc-05fd06639fd0	6258	Prestranek
00050000-5617-891c-8a6c-d567089cba1b	2391	Prevalje
00050000-5617-891c-937f-fdde8c0f3103	3262	Prevorje
00050000-5617-891c-05bf-ec4d7259256a	1276	Primskovo 
00050000-5617-891c-d6b0-d9809ef76d3a	3253	Pristava pri Mestinju
00050000-5617-891c-6b42-a7a940ab4f66	9207	Prosenjakovci/Partosfalva
00050000-5617-891c-9b75-a678aea988c2	5297	Prvačina
00050000-5617-891c-42a7-ced1036017b8	2250	Ptuj
00050000-5617-891c-6967-c4806d49d426	2323	Ptujska Gora
00050000-5617-891c-94cc-3a7c44d6dbcb	9201	Puconci
00050000-5617-891c-e7a2-bd37318617bb	2327	Rače
00050000-5617-891c-0d1d-4637052c50db	1433	Radeče
00050000-5617-891c-71ff-c6828e032151	9252	Radenci
00050000-5617-891c-4574-5fefb320ed4e	2360	Radlje ob Dravi
00050000-5617-891c-0f01-ef5bea7fa183	1235	Radomlje
00050000-5617-891c-441b-766fb2c355be	4240	Radovljica
00050000-5617-891c-bdae-55159902f939	8274	Raka
00050000-5617-891c-713a-92e666ab4824	1381	Rakek
00050000-5617-891c-c014-d2d0c5c418de	4283	Rateče - Planica
00050000-5617-891c-9f94-de4b341e63bf	2390	Ravne na Koroškem
00050000-5617-891c-7424-3f4ff1e8e1d7	9246	Razkrižje
00050000-5617-891c-1ed4-265d3a4981b5	3332	Rečica ob Savinji
00050000-5617-891c-d508-b41c05bf8f01	5292	Renče
00050000-5617-891c-a9e9-7e684d25a13e	1310	Ribnica
00050000-5617-891c-7c66-74497706237f	2364	Ribnica na Pohorju
00050000-5617-891c-5c9e-65d65fe23dad	3272	Rimske Toplice
00050000-5617-891c-cfe8-fadabb758e36	1314	Rob
00050000-5617-891c-d108-44083df79b69	5215	Ročinj
00050000-5617-891c-e81c-fd137ffd560c	3250	Rogaška Slatina
00050000-5617-891c-9bbd-fbd2245475f4	9262	Rogašovci
00050000-5617-891c-cfb2-23a37d026f99	3252	Rogatec
00050000-5617-891c-33cf-6b8b20945473	1373	Rovte
00050000-5617-891c-a116-205fc5c1d7e3	2342	Ruše
00050000-5617-891c-cdbb-d30f50d9ca81	1282	Sava
00050000-5617-891c-3fef-d39a4c9efc96	6333	Sečovlje/Sicciole
00050000-5617-891c-d0fd-0035577754e1	4227	Selca
00050000-5617-891c-b456-e0b682a44fb5	2352	Selnica ob Dravi
00050000-5617-891c-f260-2e5d414311be	8333	Semič
00050000-5617-891c-208e-2973c1c5e803	8281	Senovo
00050000-5617-891c-a01d-195ceb7d6e99	6224	Senožeče
00050000-5617-891c-59bc-c1ef1bdc9d3f	8290	Sevnica
00050000-5617-891c-2cd6-2a81e66c3f16	6210	Sežana
00050000-5617-891c-323b-3013737543f1	2214	Sladki Vrh
00050000-5617-891c-8a9f-c2b95eeba7de	5283	Slap ob Idrijci
00050000-5617-891c-6225-dec51708910e	2380	Slovenj Gradec
00050000-5617-891c-4a5c-c4ac49ca0d7d	2310	Slovenska Bistrica
00050000-5617-891c-9ab3-b6e22bbc5452	3210	Slovenske Konjice
00050000-5617-891c-071d-afc3b98ee0d3	1216	Smlednik
00050000-5617-891c-4dde-89d3a8fcaa0d	5232	Soča
00050000-5617-891c-f376-0ba5ec9727ff	1317	Sodražica
00050000-5617-891c-8ace-2fca6812c7df	3335	Solčava
00050000-5617-891c-53a2-d16021f4b318	5250	Solkan
00050000-5617-891c-c19b-5abcd911c1f3	4229	Sorica
00050000-5617-891c-89a3-96297557b7de	4225	Sovodenj
00050000-5617-891c-4bbb-ced8b90fe667	5281	Spodnja Idrija
00050000-5617-891c-e8bf-b19ba3b8997b	2241	Spodnji Duplek
00050000-5617-891c-29e3-583de97f84ad	9245	Spodnji Ivanjci
00050000-5617-891c-433e-37d4d84b140f	2277	Središče ob Dravi
00050000-5617-891c-2f8a-df2fa76dc237	4267	Srednja vas v Bohinju
00050000-5617-891c-d074-c42c8c30a4f6	8256	Sromlje 
00050000-5617-891c-20f6-3f5c0d5b46d3	5224	Srpenica
00050000-5617-891c-af4a-1c44371ee114	1242	Stahovica
00050000-5617-891c-9705-36ba4c99312f	1332	Stara Cerkev
00050000-5617-891c-544d-d038960af3f3	8342	Stari trg ob Kolpi
00050000-5617-891c-05d4-ee6b39f1f59c	1386	Stari trg pri Ložu
00050000-5617-891c-ed8f-fe8beaf2b43d	2205	Starše
00050000-5617-891c-bcea-5ba4a4438c6f	2289	Stoperce
00050000-5617-891c-2252-8b5a61385635	8322	Stopiče
00050000-5617-891c-b84f-521563fd4949	3206	Stranice
00050000-5617-891c-444f-6d831888af0b	8351	Straža
00050000-5617-891c-2d0a-52d0b84bcab4	1313	Struge
00050000-5617-891c-4020-d4f738d213e2	8293	Studenec
00050000-5617-891c-5d43-ebcf4aca7fa7	8331	Suhor
00050000-5617-891c-83cb-095ea60a3867	2233	Sv. Ana v Slovenskih goricah
00050000-5617-891c-ab86-28f956dfdb0d	2235	Sv. Trojica v Slovenskih goricah
00050000-5617-891c-13ec-e160b4588be7	2353	Sveti Duh na Ostrem Vrhu
00050000-5617-891c-cad0-e27c087e5a87	9244	Sveti Jurij ob Ščavnici
00050000-5617-891c-b21c-149f1462ef51	3264	Sveti Štefan
00050000-5617-891c-3b85-649405111ecd	2258	Sveti Tomaž
00050000-5617-891c-0c17-08ba4c403e67	9204	Šalovci
00050000-5617-891c-e860-18905230449a	5261	Šempas
00050000-5617-891c-5546-f60a83cf6c29	5290	Šempeter pri Gorici
00050000-5617-891c-278b-3b23b4540d2d	3311	Šempeter v Savinjski dolini
00050000-5617-891c-a064-ffb0dfee216d	4208	Šenčur
00050000-5617-891c-2768-e36bb8a3b1fe	2212	Šentilj v Slovenskih goricah
00050000-5617-891c-2c3b-33d3da7a7327	8297	Šentjanž
00050000-5617-891c-9b04-0c7bb9f773de	2373	Šentjanž pri Dravogradu
00050000-5617-891c-affa-82028c0d8eb6	8310	Šentjernej
00050000-5617-891c-e053-a3b2d2339f5d	3230	Šentjur
00050000-5617-891c-b0fe-2c1e5ac45a57	3271	Šentrupert
00050000-5617-891c-6bf7-183b748159f1	8232	Šentrupert
00050000-5617-891c-da8e-972f12d3cd27	1296	Šentvid pri Stični
00050000-5617-891c-9a9d-f9b663b30ffb	8275	Škocjan
00050000-5617-891c-9866-af6f0fe8d7b8	6281	Škofije
00050000-5617-891c-c094-f09b43b75eef	4220	Škofja Loka
00050000-5617-891c-55e9-1dacbf2c44c0	3211	Škofja vas
00050000-5617-891c-9517-b71bb65ab3f6	1291	Škofljica
00050000-5617-891c-d631-8caabe61374e	6274	Šmarje
00050000-5617-891c-6e21-0948391d9eea	1293	Šmarje - Sap
00050000-5617-891c-c88f-cc889dc4e2e9	3240	Šmarje pri Jelšah
00050000-5617-891c-f927-2bd82cdcbcff	8220	Šmarješke Toplice
00050000-5617-891c-7850-1f0046329721	2315	Šmartno na Pohorju
00050000-5617-891c-4686-06f0e073def1	3341	Šmartno ob Dreti
00050000-5617-891c-8a71-5287983439f7	3327	Šmartno ob Paki
00050000-5617-891c-46f8-cd7bfd01b586	1275	Šmartno pri Litiji
00050000-5617-891c-088c-75072947f058	2383	Šmartno pri Slovenj Gradcu
00050000-5617-891c-4bbb-7e785f1b4bff	3201	Šmartno v Rožni dolini
00050000-5617-891c-014b-21a7d8c6b775	3325	Šoštanj
00050000-5617-891c-ae1c-6ffe74831908	6222	Štanjel
00050000-5617-891c-959a-5d5e2c2e34cc	3220	Štore
00050000-5617-891c-004e-d0c76b353025	3304	Tabor
00050000-5617-891c-1285-29e0e372ba19	3221	Teharje
00050000-5617-891c-e16b-3dd058dd6744	9251	Tišina
00050000-5617-891c-a79e-db590c74a849	5220	Tolmin
00050000-5617-891c-a46c-43e8cb7f3cd8	3326	Topolšica
00050000-5617-891c-98e5-ee65434896f8	2371	Trbonje
00050000-5617-891c-cfb8-8c4c18b16555	1420	Trbovlje
00050000-5617-891c-0667-791a5c2fad18	8231	Trebelno 
00050000-5617-891c-ccbf-e8be0111852b	8210	Trebnje
00050000-5617-891c-044f-0614fc5c9f5f	5252	Trnovo pri Gorici
00050000-5617-891c-fb97-bc0c4e48ab40	2254	Trnovska vas
00050000-5617-891c-2261-67fd14b8fb9f	1222	Trojane
00050000-5617-891c-4b6e-de70be39f35c	1236	Trzin
00050000-5617-891c-4259-e588cda2e50c	4290	Tržič
00050000-5617-891d-0541-28e92b679930	8295	Tržišče
00050000-5617-891d-5c3a-9e13dfca2d9d	1311	Turjak
00050000-5617-891d-33cd-98ab1cf0b6c2	9224	Turnišče
00050000-5617-891d-0e3b-e4d451d8880d	8323	Uršna sela
00050000-5617-891d-d54d-89a6dacbb340	1252	Vače
00050000-5617-891d-c797-5d6e25daab23	3320	Velenje 
00050000-5617-891d-ec4f-23afefd9a74b	3322	Velenje - poštni predali
00050000-5617-891d-32e7-c2c44bcfd4bd	8212	Velika Loka
00050000-5617-891d-6207-bcd731be88ab	2274	Velika Nedelja
00050000-5617-891d-0f44-6561d4cc3faa	9225	Velika Polana
00050000-5617-891d-900d-b6594f35bbc0	1315	Velike Lašče
00050000-5617-891d-d280-5083c484809a	8213	Veliki Gaber
00050000-5617-891d-b2aa-0021d5b03fd1	9241	Veržej
00050000-5617-891d-7671-4f71342838a0	1312	Videm - Dobrepolje
00050000-5617-891d-dfc3-8e7e23ccded6	2284	Videm pri Ptuju
00050000-5617-891d-2d16-dc864a54d7a2	8344	Vinica
00050000-5617-891d-7189-b03c781faae8	5271	Vipava
00050000-5617-891d-54b6-997eaa81badd	4212	Visoko
00050000-5617-891d-5560-bffa255e3e96	1294	Višnja Gora
00050000-5617-891d-63a7-815e95c073ab	3205	Vitanje
00050000-5617-891d-5adf-671d1dcb9645	2255	Vitomarci
00050000-5617-891d-d109-d8135e827f4f	1217	Vodice
00050000-5617-891d-627c-144a4d2f0886	3212	Vojnik\t
00050000-5617-891d-58ab-229658f60394	5293	Volčja Draga
00050000-5617-891d-4f61-9692ad336393	2232	Voličina
00050000-5617-891d-5351-b40219f22439	3305	Vransko
00050000-5617-891d-ee6f-f259ba911fc9	6217	Vremski Britof
00050000-5617-891d-d5d8-f7923c884805	1360	Vrhnika
00050000-5617-891d-abaf-c6612ecf58d3	2365	Vuhred
00050000-5617-891d-9b11-b79c3a893214	2367	Vuzenica
00050000-5617-891d-de8a-de2b71f828d6	8292	Zabukovje 
00050000-5617-891d-3209-d12776203ad1	1410	Zagorje ob Savi
00050000-5617-891d-7ecd-77d8ea461494	1303	Zagradec
00050000-5617-891d-f5d4-05ebfc3c100d	2283	Zavrč
00050000-5617-891d-3c9b-bf11045637f2	8272	Zdole 
00050000-5617-891d-e133-c8c4cad0419e	4201	Zgornja Besnica
00050000-5617-891d-7558-ad0ea6495448	2242	Zgornja Korena
00050000-5617-891d-703a-89d1101c60f5	2201	Zgornja Kungota
00050000-5617-891d-4e6c-43e539f10942	2316	Zgornja Ložnica
00050000-5617-891d-5120-0ba9f15120d9	2314	Zgornja Polskava
00050000-5617-891d-8eb7-955685ab51f2	2213	Zgornja Velka
00050000-5617-891d-82bd-3e0825388c1a	4247	Zgornje Gorje
00050000-5617-891d-e91b-e1d6dd6df74c	4206	Zgornje Jezersko
00050000-5617-891d-b53d-71e894d6ede7	2285	Zgornji Leskovec
00050000-5617-891d-497c-c90f5f8d43cd	1432	Zidani Most
00050000-5617-891d-8356-4744ffe0431d	3214	Zreče
00050000-5617-891d-bb7e-d299f2b6307b	4209	Žabnica
00050000-5617-891d-294e-595061a7085f	3310	Žalec
00050000-5617-891d-a922-c77e15545cb2	4228	Železniki
00050000-5617-891d-0865-2e399ea96c0e	2287	Žetale
00050000-5617-891d-d01b-a6053e5173db	4226	Žiri
00050000-5617-891d-0c13-b1d9b1cf3dc3	4274	Žirovnica
00050000-5617-891d-bef9-06a15f652fe1	8360	Žužemberk
\.


--
-- TOC entry 3045 (class 0 OID 21588865)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 21588470)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 21588250)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5617-891f-0a05-4cf61288794c	00080000-5617-891f-fb7a-2ac569aadeff	\N	00040000-5617-891d-62c8-675625d895a3	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5617-891f-6b95-de3d6602087d	00080000-5617-891f-fb7a-2ac569aadeff	\N	00040000-5617-891d-62c8-675625d895a3	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5617-891f-6efc-ad8d547cbe82	00080000-5617-891f-f57a-99bbfad28fb2	\N	00040000-5617-891d-62c8-675625d895a3	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3007 (class 0 OID 21588354)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 21588482)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3046 (class 0 OID 21588879)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3047 (class 0 OID 21588889)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5617-891f-cafc-93ffafe00d9a	00080000-5617-891f-7687-1c328c8d99c0	0987	AK
00190000-5617-891f-1242-45911853d201	00080000-5617-891f-f57a-99bbfad28fb2	0989	AK
00190000-5617-891f-6e3f-d3e4016d7e15	00080000-5617-891f-2f79-77d3861571f1	0986	AK
00190000-5617-891f-9bb0-9a3dd01c6179	00080000-5617-891f-3abd-acf2f13320f6	0984	AK
00190000-5617-891f-2f89-887f490fce84	00080000-5617-891f-830e-e7df5efa96da	0983	AK
00190000-5617-891f-8b59-c65859974faa	00080000-5617-891f-9679-30247a0c44af	0982	AK
00190000-5617-8921-88b5-948fae7720f3	00080000-5617-8921-27c8-a20a9d94513b	1001	AK
\.


--
-- TOC entry 3044 (class 0 OID 21588812)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5617-891f-4e8b-60af110a25bf	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3048 (class 0 OID 21588897)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 21588511)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5617-891f-11e4-1f5957c46452	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5617-891f-1af8-5198bbc1ff12	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5617-891f-0211-bb2f2eaaa642	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5617-891f-a662-a98e4ca81321	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5617-891f-1fed-40eee9fc69a5	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5617-891f-cd83-c99973c4d6ee	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5617-891f-0d5e-8e55d95561f6	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3016 (class 0 OID 21588455)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 21588445)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 21588655)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 21588585)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 21588328)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 21588123)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5617-8921-27c8-a20a9d94513b	00010000-5617-891d-80fe-744493c75ed1	2015-10-09 11:30:09	INS	a:0:{}
2	App\\Entity\\Option	00000000-5617-8921-355e-e5e933db0d6b	00010000-5617-891d-80fe-744493c75ed1	2015-10-09 11:30:09	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5617-8921-88b5-948fae7720f3	00010000-5617-891d-80fe-744493c75ed1	2015-10-09 11:30:09	INS	a:0:{}
\.


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3025 (class 0 OID 21588524)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 21588161)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5617-891d-5bb9-bf3053b09463	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5617-891d-667e-227121f968cb	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5617-891d-e695-ef524e9f60f2	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5617-891d-989c-be947e485818	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5617-891d-9505-76000e50575b	planer	Planer dogodkov v koledarju	t
00020000-5617-891d-d063-ab6dadac18f3	kadrovska	Kadrovska služba	t
00020000-5617-891d-1510-33d8ec20a241	arhivar	Ažuriranje arhivalij	t
00020000-5617-891d-b023-19a93cb9bac6	igralec	Igralec	t
00020000-5617-891d-e755-eee11950ef6b	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5617-891f-f35a-d793ca9bf814	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2990 (class 0 OID 21588145)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5617-891d-2275-fdb3dacd5ff4	00020000-5617-891d-e695-ef524e9f60f2
00010000-5617-891d-80fe-744493c75ed1	00020000-5617-891d-e695-ef524e9f60f2
00010000-5617-891f-715a-c70d047b5925	00020000-5617-891f-f35a-d793ca9bf814
\.


--
-- TOC entry 3027 (class 0 OID 21588538)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 21588476)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 21588422)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 21588110)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5617-891d-a3f6-c6a1500639e7	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5617-891d-170d-ed464f311d73	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5617-891d-67a3-f2fd1a91e251	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5617-891d-9711-3b6d6543f225	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5617-891d-d477-7e39490673f0	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2985 (class 0 OID 21588102)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5617-891d-0709-fcad3fad3a52	00230000-5617-891d-9711-3b6d6543f225	popa
00240000-5617-891d-a1d5-aea36a172a57	00230000-5617-891d-9711-3b6d6543f225	oseba
00240000-5617-891d-d862-a917b371e083	00230000-5617-891d-9711-3b6d6543f225	sezona
00240000-5617-891d-346b-126f4c384b66	00230000-5617-891d-170d-ed464f311d73	prostor
00240000-5617-891d-030d-44b0b8267356	00230000-5617-891d-9711-3b6d6543f225	besedilo
00240000-5617-891d-269b-32ff48ce2fc7	00230000-5617-891d-9711-3b6d6543f225	uprizoritev
00240000-5617-891d-0cea-eff89935d9cd	00230000-5617-891d-9711-3b6d6543f225	funkcija
00240000-5617-891d-1c25-4b2f1f819449	00230000-5617-891d-9711-3b6d6543f225	tipfunkcije
00240000-5617-891d-670c-360ff916e101	00230000-5617-891d-9711-3b6d6543f225	alternacija
00240000-5617-891d-48e4-20528fa30e66	00230000-5617-891d-a3f6-c6a1500639e7	pogodba
00240000-5617-891d-9575-f8b2dd99c1ae	00230000-5617-891d-9711-3b6d6543f225	zaposlitev
00240000-5617-891d-6102-e1f22b02213d	00230000-5617-891d-9711-3b6d6543f225	zvrstuprizoritve
00240000-5617-891d-d58e-c3a13e60e9ec	00230000-5617-891d-a3f6-c6a1500639e7	programdela
00240000-5617-891d-abf8-5474a29a9c32	00230000-5617-891d-9711-3b6d6543f225	zapis
\.


--
-- TOC entry 2984 (class 0 OID 21588097)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
5b9935e2-9756-4fca-950f-b1046c64f63f	00240000-5617-891d-0709-fcad3fad3a52	0	1001
\.


--
-- TOC entry 3033 (class 0 OID 21588602)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5617-891f-2b06-57588ee9b591	000e0000-5617-891f-602e-8d3232ef3cf1	00080000-5617-891f-fb7a-2ac569aadeff	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5617-891d-9acc-482488ec6d53
00270000-5617-891f-1eaf-25933b89d7ae	000e0000-5617-891f-602e-8d3232ef3cf1	00080000-5617-891f-fb7a-2ac569aadeff	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5617-891d-9acc-482488ec6d53
\.


--
-- TOC entry 2997 (class 0 OID 21588223)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 21588432)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5617-891f-6a6c-7d60d8057f6b	00180000-5617-891f-a3a2-07b338d1453a	000c0000-5617-891f-6168-ef89135f7d37	00090000-5617-891f-32d8-87ded9f4a4ac	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5617-891f-e4e0-a0a438eb6370	00180000-5617-891f-a3a2-07b338d1453a	000c0000-5617-891f-0bd6-1b7bf2c78033	00090000-5617-891f-b237-4f4a66d2bce7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5617-891f-f9b8-d718147fcf23	00180000-5617-891f-a3a2-07b338d1453a	000c0000-5617-891f-e39a-d7f908e4be9d	00090000-5617-891f-c5aa-fb7807366f0b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5617-891f-9cc1-c4b8292ebe5e	00180000-5617-891f-a3a2-07b338d1453a	000c0000-5617-891f-d7ff-e9e733446611	00090000-5617-891f-ef29-18de67463079	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5617-891f-f0ce-06ceeab8dfe1	00180000-5617-891f-a3a2-07b338d1453a	000c0000-5617-891f-a6ca-fd8e92f8596a	00090000-5617-891f-623d-14c0502c24b6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5617-891f-f083-ad0ab6811190	00180000-5617-891f-d3cb-d3825002e291	\N	00090000-5617-891f-623d-14c0502c24b6	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3036 (class 0 OID 21588643)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5617-891d-01f0-336dacd68c16	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5617-891d-8214-1f33b1babd3b	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5617-891d-9019-00d1e4a1ad71	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5617-891d-f589-9d93d502dd16	04	Režija	Režija	Režija	umetnik	30
000f0000-5617-891d-6ff7-68ec4586fa78	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5617-891d-0b3f-ee29b5b2f8c5	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5617-891d-c54c-ec2dcd51ebd4	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5617-891d-a6ef-98b0ca3d4429	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5617-891d-5309-96b3f840506c	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5617-891d-d87f-fb0ffc387df6	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5617-891d-299d-7ddcdc7bd994	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5617-891d-a64a-860694d3fe17	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5617-891d-6ca7-19382cb8a747	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5617-891d-b545-ad5e07400dd4	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5617-891d-14af-b7db400f0e48	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5617-891d-8549-4cb45f25b7ff	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5617-891d-33ad-a8a8e1a34a7e	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5617-891d-f36b-6531c37fea54	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3049 (class 0 OID 21588908)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5617-891d-fc4d-9ebca6a1daf8	01	Velika predstava	f	1.00	1.00
002b0000-5617-891d-4570-1c9512b8da00	02	Mala predstava	f	0.50	0.50
002b0000-5617-891d-ae67-b7dc9b84b996	03	Mala koprodukcija	t	0.40	1.00
002b0000-5617-891d-bd5f-f98d08ea92b5	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5617-891d-616f-d20d7405a2ae	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3002 (class 0 OID 21588285)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 21588132)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5617-891d-80fe-744493c75ed1	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO.IL8sFQbuDnjOVI.6dGKnW7AMgf.hIa	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5617-891f-7823-a4441247d293	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5617-891f-1de0-c4f17d36a8db	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5617-891f-374e-25f7c9429ab4	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5617-891f-2db5-87079807eca1	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5617-891f-ecda-6c8a6f9fb8b5	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5617-891f-a1a3-a6c7b533bf57	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5617-891f-d3b8-ea3b1dff2012	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5617-891f-08c9-2b008971f3fc	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5617-891f-ffca-a93173a44e84	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5617-891f-715a-c70d047b5925	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5617-891d-2275-fdb3dacd5ff4	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3040 (class 0 OID 21588693)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5617-891f-bef1-77f7e6f66194	00160000-5617-891f-f722-80c442e66140	\N	00140000-5617-891d-eed3-3b918f94c736	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5617-891f-1fed-40eee9fc69a5
000e0000-5617-891f-602e-8d3232ef3cf1	00160000-5617-891f-87dc-8118d7f836e8	\N	00140000-5617-891d-23ac-341e929ad8e9	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5617-891f-cd83-c99973c4d6ee
000e0000-5617-891f-6ca5-9fa8d1d0c3c0	\N	\N	00140000-5617-891d-23ac-341e929ad8e9	00190000-5617-891f-cafc-93ffafe00d9a	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5617-891f-1fed-40eee9fc69a5
000e0000-5617-891f-071a-6bdf551ddd74	\N	\N	00140000-5617-891d-23ac-341e929ad8e9	00190000-5617-891f-cafc-93ffafe00d9a	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5617-891f-1fed-40eee9fc69a5
000e0000-5617-891f-479b-93977f0297fe	\N	\N	00140000-5617-891d-23ac-341e929ad8e9	00190000-5617-891f-cafc-93ffafe00d9a	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5617-891f-11e4-1f5957c46452
000e0000-5617-891f-03b2-22fc1dfc8416	\N	\N	00140000-5617-891d-23ac-341e929ad8e9	00190000-5617-891f-cafc-93ffafe00d9a	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5617-891f-11e4-1f5957c46452
\.


--
-- TOC entry 3009 (class 0 OID 21588376)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5617-891f-fafa-c955206dbfe8	000e0000-5617-891f-602e-8d3232ef3cf1	\N	1	
00200000-5617-891f-5f7d-91e307d345dd	000e0000-5617-891f-602e-8d3232ef3cf1	\N	2	
00200000-5617-891f-6228-aa5a2d2bd88c	000e0000-5617-891f-602e-8d3232ef3cf1	\N	3	
00200000-5617-891f-b110-3a9a037ddc4f	000e0000-5617-891f-602e-8d3232ef3cf1	\N	4	
00200000-5617-891f-ade7-7d32d2f7aa2c	000e0000-5617-891f-602e-8d3232ef3cf1	\N	5	
\.


--
-- TOC entry 3023 (class 0 OID 21588503)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 21588616)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5617-891d-306b-ae44fecd8cb4	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5617-891d-eab0-2c8ea14b592f	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5617-891d-f05b-3f0ddcc08cf8	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5617-891d-9508-593e37882acf	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5617-891d-771f-36585b50a4ef	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5617-891d-48e1-2dccbc21ef74	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5617-891d-334a-ca9e0b0f2644	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5617-891d-b93e-6ebcb663c8d2	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5617-891d-9acc-482488ec6d53	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5617-891d-da87-8d771fdf0af4	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5617-891d-c7f1-22aac2bfbe5a	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5617-891d-607f-576ba194e953	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5617-891d-7880-6c1b2bd1e762	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5617-891d-1451-642018eea06f	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5617-891d-389f-0dfcd981256a	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5617-891d-05fc-db91f3e52d8a	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5617-891d-f54a-03a8a37e204c	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5617-891d-558e-3637027692f9	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5617-891d-e450-42a42287ddd0	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5617-891d-64c6-3128dcf21f23	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5617-891d-13fb-9ec86f784cad	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5617-891d-ac5a-f2ed32260b26	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5617-891d-5071-3022e20aa58e	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5617-891d-116d-1a029fc9aac2	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5617-891d-6d42-b0ef610747a9	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5617-891d-27d8-d11090258a93	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5617-891d-165c-596b2daa6851	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5617-891d-1e33-1a45a276cc75	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3052 (class 0 OID 21588955)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3051 (class 0 OID 21588927)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 21588967)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 21588575)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5617-891f-3f3f-f46862669c7f	00090000-5617-891f-b237-4f4a66d2bce7	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-5617-891f-e887-e19069db3491	00090000-5617-891f-c5aa-fb7807366f0b	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-5617-891f-c6e2-c978c8390cd0	00090000-5617-891f-589c-8508dfa567fd	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-5617-891f-f1a4-e494adeacb96	00090000-5617-891f-6812-77a6861f0122	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-5617-891f-591e-ab551565c8ca	00090000-5617-891f-32d8-87ded9f4a4ac	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-5617-891f-0ab6-ef953fe138d1	00090000-5617-891f-26bd-b5bea8880c99	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 3011 (class 0 OID 21588411)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 21588683)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5617-891d-eed3-3b918f94c736	01	Drama	drama (SURS 01)
00140000-5617-891d-1891-b7a1d60c6cc8	02	Opera	opera (SURS 02)
00140000-5617-891d-6573-81c17c1b8651	03	Balet	balet (SURS 03)
00140000-5617-891d-445f-c4b5c94f591e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5617-891d-f431-85addbaee9f8	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5617-891d-23ac-341e929ad8e9	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5617-891d-2313-3301eb5233e3	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3029 (class 0 OID 21588565)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2516 (class 2606 OID 21588186)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 21588742)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 21588732)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 21588599)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 21588641)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2765 (class 2606 OID 21589007)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 21588400)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 21588421)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 21588925)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 21588311)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 21588806)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 21588561)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 21588374)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 21588349)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 21588325)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 21588468)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 21588984)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 21588991)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2770 (class 2606 OID 21589015)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 21093462)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2628 (class 2606 OID 21588495)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 21588283)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 21588195)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 21588219)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 21588175)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2507 (class 2606 OID 21588160)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 21588501)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 21588537)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 21588678)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 21588247)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 21588271)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 21588877)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 21588474)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 21588261)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 21588362)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 21588486)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 21588886)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 21588894)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 21588864)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 21588906)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 21588519)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 21588459)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 21588450)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 21588665)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 21588592)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 21588337)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 21588131)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 21588528)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 21588149)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2509 (class 2606 OID 21588169)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 21588546)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 21588481)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 21588430)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 21588119)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 21588107)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 21588101)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 21588612)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 21588228)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 21588441)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 21588652)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 21588918)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 21588296)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 21588144)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 21588711)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 21588384)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 21588509)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 21588624)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 21588965)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 21588949)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 21588973)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 21588583)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 21588415)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 21588691)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 21588573)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 1259 OID 21588409)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2581 (class 1259 OID 21588410)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2582 (class 1259 OID 21588408)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2583 (class 1259 OID 21588407)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2584 (class 1259 OID 21588406)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2670 (class 1259 OID 21588613)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2671 (class 1259 OID 21588614)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2672 (class 1259 OID 21588615)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2756 (class 1259 OID 21588986)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2757 (class 1259 OID 21588985)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2530 (class 1259 OID 21588249)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2629 (class 1259 OID 21588502)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2743 (class 1259 OID 21588953)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2744 (class 1259 OID 21588952)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2745 (class 1259 OID 21588954)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2746 (class 1259 OID 21588951)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2747 (class 1259 OID 21588950)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2623 (class 1259 OID 21588488)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2624 (class 1259 OID 21588487)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2575 (class 1259 OID 21588385)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 21588562)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2654 (class 1259 OID 21588564)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2655 (class 1259 OID 21588563)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2555 (class 1259 OID 21588327)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2556 (class 1259 OID 21588326)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2734 (class 1259 OID 21588907)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2686 (class 1259 OID 21588680)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2687 (class 1259 OID 21588681)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2688 (class 1259 OID 21588682)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2753 (class 1259 OID 21588974)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2695 (class 1259 OID 21588716)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2696 (class 1259 OID 21588713)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2697 (class 1259 OID 21588717)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2698 (class 1259 OID 21588715)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2699 (class 1259 OID 21588714)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2545 (class 1259 OID 21588298)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2546 (class 1259 OID 21588297)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2521 (class 1259 OID 21588222)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2641 (class 1259 OID 21588529)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2511 (class 1259 OID 21588176)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2512 (class 1259 OID 21588177)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2646 (class 1259 OID 21588549)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2647 (class 1259 OID 21588548)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2648 (class 1259 OID 21588547)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2568 (class 1259 OID 21588363)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 21588364)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2491 (class 1259 OID 21588109)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2603 (class 1259 OID 21588454)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2604 (class 1259 OID 21588452)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2605 (class 1259 OID 21588451)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2606 (class 1259 OID 21588453)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2502 (class 1259 OID 21588150)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2503 (class 1259 OID 21588151)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2632 (class 1259 OID 21588510)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2766 (class 1259 OID 21589008)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2668 (class 1259 OID 21588601)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2669 (class 1259 OID 21588600)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2767 (class 1259 OID 21589016)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2768 (class 1259 OID 21589017)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2618 (class 1259 OID 21588475)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2662 (class 1259 OID 21588593)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2663 (class 1259 OID 21588594)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2716 (class 1259 OID 21588811)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2717 (class 1259 OID 21588810)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2718 (class 1259 OID 21588807)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2719 (class 1259 OID 21588808)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2720 (class 1259 OID 21588809)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2534 (class 1259 OID 21588263)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2535 (class 1259 OID 21588262)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2536 (class 1259 OID 21588264)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2635 (class 1259 OID 21588523)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2636 (class 1259 OID 21588522)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2726 (class 1259 OID 21588887)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2727 (class 1259 OID 21588888)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2709 (class 1259 OID 21588746)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2710 (class 1259 OID 21588747)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2711 (class 1259 OID 21588744)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2712 (class 1259 OID 21588745)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2659 (class 1259 OID 21588584)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2609 (class 1259 OID 21588463)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2610 (class 1259 OID 21588462)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2611 (class 1259 OID 21588460)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2612 (class 1259 OID 21588461)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2705 (class 1259 OID 21588734)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2706 (class 1259 OID 21588733)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2559 (class 1259 OID 21588338)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2562 (class 1259 OID 21588352)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2563 (class 1259 OID 21588351)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2564 (class 1259 OID 21588350)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2565 (class 1259 OID 21588353)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2574 (class 1259 OID 21588375)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2723 (class 1259 OID 21588878)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2742 (class 1259 OID 21588926)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2760 (class 1259 OID 21588992)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2761 (class 1259 OID 21588993)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2517 (class 1259 OID 21588197)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2518 (class 1259 OID 21588196)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2526 (class 1259 OID 21588229)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2527 (class 1259 OID 21588230)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 21588416)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2598 (class 1259 OID 21588444)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2599 (class 1259 OID 21588443)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2600 (class 1259 OID 21588442)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2585 (class 1259 OID 21588402)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2586 (class 1259 OID 21588403)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2587 (class 1259 OID 21588401)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2588 (class 1259 OID 21588405)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2589 (class 1259 OID 21588404)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2533 (class 1259 OID 21588248)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2551 (class 1259 OID 21588312)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2552 (class 1259 OID 21588314)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2553 (class 1259 OID 21588313)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2554 (class 1259 OID 21588315)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2617 (class 1259 OID 21588469)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2691 (class 1259 OID 21588679)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2700 (class 1259 OID 21588712)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2682 (class 1259 OID 21588653)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2683 (class 1259 OID 21588654)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2524 (class 1259 OID 21588220)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2525 (class 1259 OID 21588221)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2656 (class 1259 OID 21588574)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2497 (class 1259 OID 21588120)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2544 (class 1259 OID 21588284)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2494 (class 1259 OID 21588108)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2739 (class 1259 OID 21588919)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2639 (class 1259 OID 21588521)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2640 (class 1259 OID 21588520)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2713 (class 1259 OID 21588743)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2541 (class 1259 OID 21588272)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 21588692)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 21588966)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2732 (class 1259 OID 21588895)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 21588896)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2679 (class 1259 OID 21588642)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2597 (class 1259 OID 21588431)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2510 (class 1259 OID 21588170)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2801 (class 2606 OID 21589148)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2800 (class 2606 OID 21589153)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2796 (class 2606 OID 21589173)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2802 (class 2606 OID 21589143)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2798 (class 2606 OID 21589163)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2797 (class 2606 OID 21589168)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2799 (class 2606 OID 21589158)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2837 (class 2606 OID 21589338)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2836 (class 2606 OID 21589343)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2835 (class 2606 OID 21589348)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2869 (class 2606 OID 21589513)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2870 (class 2606 OID 21589508)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2782 (class 2606 OID 21589073)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2819 (class 2606 OID 21589258)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2864 (class 2606 OID 21589493)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2865 (class 2606 OID 21589488)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2863 (class 2606 OID 21589498)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2866 (class 2606 OID 21589483)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2867 (class 2606 OID 21589478)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2817 (class 2606 OID 21589253)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2818 (class 2606 OID 21589248)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2795 (class 2606 OID 21589138)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2829 (class 2606 OID 21589298)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2827 (class 2606 OID 21589308)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2828 (class 2606 OID 21589303)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2788 (class 2606 OID 21589108)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2789 (class 2606 OID 21589103)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2815 (class 2606 OID 21589238)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2861 (class 2606 OID 21589468)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2840 (class 2606 OID 21589353)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2839 (class 2606 OID 21589358)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2838 (class 2606 OID 21589363)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2868 (class 2606 OID 21589503)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2842 (class 2606 OID 21589383)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2845 (class 2606 OID 21589368)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2841 (class 2606 OID 21589388)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2843 (class 2606 OID 21589378)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2844 (class 2606 OID 21589373)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2786 (class 2606 OID 21589098)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 21589093)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2778 (class 2606 OID 21589058)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2779 (class 2606 OID 21589053)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2823 (class 2606 OID 21589278)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2775 (class 2606 OID 21589033)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2774 (class 2606 OID 21589038)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2824 (class 2606 OID 21589293)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2825 (class 2606 OID 21589288)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2826 (class 2606 OID 21589283)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2793 (class 2606 OID 21589123)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2792 (class 2606 OID 21589128)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2771 (class 2606 OID 21589018)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2807 (class 2606 OID 21589213)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2809 (class 2606 OID 21589203)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2810 (class 2606 OID 21589198)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2808 (class 2606 OID 21589208)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2773 (class 2606 OID 21589023)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2772 (class 2606 OID 21589028)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2820 (class 2606 OID 21589263)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2873 (class 2606 OID 21589528)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2833 (class 2606 OID 21589333)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2834 (class 2606 OID 21589328)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2875 (class 2606 OID 21589533)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2874 (class 2606 OID 21589538)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2816 (class 2606 OID 21589243)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2832 (class 2606 OID 21589318)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2831 (class 2606 OID 21589323)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2852 (class 2606 OID 21589443)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2853 (class 2606 OID 21589438)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2856 (class 2606 OID 21589423)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2855 (class 2606 OID 21589428)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2854 (class 2606 OID 21589433)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2784 (class 2606 OID 21589083)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2785 (class 2606 OID 21589078)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2783 (class 2606 OID 21589088)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2821 (class 2606 OID 21589273)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2822 (class 2606 OID 21589268)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2859 (class 2606 OID 21589453)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2858 (class 2606 OID 21589458)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2849 (class 2606 OID 21589413)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2848 (class 2606 OID 21589418)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2851 (class 2606 OID 21589403)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2850 (class 2606 OID 21589408)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2830 (class 2606 OID 21589313)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2811 (class 2606 OID 21589233)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2812 (class 2606 OID 21589228)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2814 (class 2606 OID 21589218)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2813 (class 2606 OID 21589223)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2846 (class 2606 OID 21589398)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2847 (class 2606 OID 21589393)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2790 (class 2606 OID 21589113)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2791 (class 2606 OID 21589118)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2794 (class 2606 OID 21589133)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2857 (class 2606 OID 21589448)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2860 (class 2606 OID 21589463)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2862 (class 2606 OID 21589473)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2872 (class 2606 OID 21589518)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2871 (class 2606 OID 21589523)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2776 (class 2606 OID 21589048)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2777 (class 2606 OID 21589043)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2781 (class 2606 OID 21589063)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2780 (class 2606 OID 21589068)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2803 (class 2606 OID 21589178)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2804 (class 2606 OID 21589193)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2805 (class 2606 OID 21589188)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2806 (class 2606 OID 21589183)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-09 11:30:11 CEST

--
-- PostgreSQL database dump complete
--

