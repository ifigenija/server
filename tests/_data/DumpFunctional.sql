--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-13 14:40:31 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 246 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3086 (class 0 OID 0)
-- Dependencies: 246
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 21844670)
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
-- TOC entry 230 (class 1259 OID 21845237)
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
-- TOC entry 229 (class 1259 OID 21845220)
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
-- TOC entry 220 (class 1259 OID 21845097)
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
-- TOC entry 223 (class 1259 OID 21845127)
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
-- TOC entry 244 (class 1259 OID 21845508)
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
-- TOC entry 198 (class 1259 OID 21844888)
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
-- TOC entry 200 (class 1259 OID 21844919)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 21845434)
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
-- TOC entry 191 (class 1259 OID 21844801)
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
-- TOC entry 231 (class 1259 OID 21845250)
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
    sthonorarnihzun integer DEFAULT 0,
    sthonorarnihzunigr integer DEFAULT 0,
    sthonorarnihzunigrtujjz integer DEFAULT 0,
    sthonorarnihzunsamoz integer DEFAULT 0,
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
-- TOC entry 216 (class 1259 OID 21845052)
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
-- TOC entry 196 (class 1259 OID 21844867)
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
-- TOC entry 194 (class 1259 OID 21844841)
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
-- TOC entry 3087 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 192 (class 1259 OID 21844818)
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
-- TOC entry 205 (class 1259 OID 21844966)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 21845489)
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
-- TOC entry 243 (class 1259 OID 21845501)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 21845523)
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
-- TOC entry 170 (class 1259 OID 21729914)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 21844991)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 189 (class 1259 OID 21844775)
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
-- TOC entry 183 (class 1259 OID 21844688)
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
-- TOC entry 184 (class 1259 OID 21844699)
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
-- TOC entry 178 (class 1259 OID 21844644)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 21844663)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 21844998)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 21845032)
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
-- TOC entry 226 (class 1259 OID 21845168)
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
-- TOC entry 186 (class 1259 OID 21844732)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    sifra character varying(4) NOT NULL,
    stakli character varying(2) DEFAULT NULL::character varying,
    tipkli character varying(255) DEFAULT NULL::character varying,
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
-- TOC entry 188 (class 1259 OID 21844767)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 21845379)
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
-- TOC entry 206 (class 1259 OID 21844972)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 187 (class 1259 OID 21844752)
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
-- TOC entry 195 (class 1259 OID 21844856)
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
-- TOC entry 208 (class 1259 OID 21844984)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 21845393)
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
-- TOC entry 235 (class 1259 OID 21845403)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 21845318)
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
    stpremiervelikih integer DEFAULT 0,
    stpremiermalih integer DEFAULT 0,
    stpremiermalihkopr integer DEFAULT 0,
    stpremiervelikihkopr integer DEFAULT 0,
    stpremiersredkopr integer DEFAULT 0,
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
    sthonorarnihzun integer DEFAULT 0,
    sthonorarnihzunigr integer DEFAULT 0,
    sthonorarnihzunigrtujjz integer,
    sthonorarnihzunsamoz integer DEFAULT 0,
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
-- TOC entry 236 (class 1259 OID 21845411)
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
-- TOC entry 212 (class 1259 OID 21845013)
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
-- TOC entry 204 (class 1259 OID 21844957)
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
-- TOC entry 203 (class 1259 OID 21844947)
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
-- TOC entry 225 (class 1259 OID 21845157)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 21845087)
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
-- TOC entry 193 (class 1259 OID 21844830)
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
-- TOC entry 175 (class 1259 OID 21844615)
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
-- TOC entry 174 (class 1259 OID 21844613)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 21845026)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 21844653)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 21844637)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 21845040)
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
-- TOC entry 207 (class 1259 OID 21844978)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 21844924)
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
-- TOC entry 173 (class 1259 OID 21844602)
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
-- TOC entry 172 (class 1259 OID 21844594)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 21844589)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 221 (class 1259 OID 21845104)
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
-- TOC entry 185 (class 1259 OID 21844724)
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
-- TOC entry 202 (class 1259 OID 21844934)
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
-- TOC entry 224 (class 1259 OID 21845145)
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
-- TOC entry 182 (class 1259 OID 21844679)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    ime character varying(255) NOT NULL,
    opis text,
    sort integer
);


--
-- TOC entry 237 (class 1259 OID 21845422)
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
-- TOC entry 190 (class 1259 OID 21844787)
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
-- TOC entry 176 (class 1259 OID 21844624)
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
-- TOC entry 228 (class 1259 OID 21845195)
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
-- TOC entry 197 (class 1259 OID 21844878)
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
-- TOC entry 211 (class 1259 OID 21845005)
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
-- TOC entry 222 (class 1259 OID 21845118)
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
-- TOC entry 240 (class 1259 OID 21845469)
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
-- TOC entry 239 (class 1259 OID 21845441)
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
-- TOC entry 241 (class 1259 OID 21845481)
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
-- TOC entry 218 (class 1259 OID 21845077)
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
-- TOC entry 199 (class 1259 OID 21844913)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 227 (class 1259 OID 21845185)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 21845067)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2206 (class 2604 OID 21844618)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3015 (class 0 OID 21844670)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3064 (class 0 OID 21845237)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-561c-fbbc-9fcf-f9411e2941ea	000d0000-561c-fbbc-a9fb-a93a0b4745a6	\N	00090000-561c-fbbc-0e2d-8c3aaf7dba9c	000b0000-561c-fbbc-3ca1-151d188c2fd0	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-561c-fbbc-af26-2d648f684ba0	000d0000-561c-fbbc-c664-ee49e2984e9d	00100000-561c-fbbc-c702-7fdec5459221	00090000-561c-fbbc-ea55-6d3ec389ce67	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-561c-fbbc-82d8-6d3799958744	000d0000-561c-fbbc-bcbf-44b84cc7bf6d	00100000-561c-fbbc-812e-71f3a0d478d0	00090000-561c-fbbc-5e13-d81418afff68	\N	0003	t	\N	2015-10-13	\N	2	t	\N	f	f
000c0000-561c-fbbc-19a6-f200b5c209c7	000d0000-561c-fbbc-e5e5-6fef15f23c80	\N	00090000-561c-fbbc-b42e-3f9040c2ada5	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-561c-fbbc-905e-6186e37cbc9e	000d0000-561c-fbbc-334a-e984bc6aaece	\N	00090000-561c-fbbc-92f2-be3b1b618dcc	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-561c-fbbc-a78d-2e50379e0589	000d0000-561c-fbbc-8981-ba981735703f	\N	00090000-561c-fbbc-e2ec-07fb416bfed0	000b0000-561c-fbbc-4c0c-6bacb626c8e5	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-561c-fbbc-4007-36040de55919	000d0000-561c-fbbc-8dfa-6c072e8f9b36	00100000-561c-fbbc-424a-7edbee2fc2ee	00090000-561c-fbbc-7e70-1d5ae27fd7bc	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-561c-fbbc-57c7-900f50ce07e2	000d0000-561c-fbbc-297b-476b9868a004	\N	00090000-561c-fbbc-22f4-cb175422409a	000b0000-561c-fbbc-f545-094af250058d	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-561c-fbbc-e4d3-16eb8dc2e87d	000d0000-561c-fbbc-8dfa-6c072e8f9b36	00100000-561c-fbbc-b3dd-0727dfe23632	00090000-561c-fbbc-afba-ac574e8b8fe0	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-561c-fbbc-fb28-cb49f1e1f345	000d0000-561c-fbbc-8dfa-6c072e8f9b36	00100000-561c-fbbc-4041-095196b8e055	00090000-561c-fbbc-28ff-e6aac4895e35	\N	0010	t	\N	2015-10-13	\N	16	f	\N	f	t
000c0000-561c-fbbc-7b31-1668fb9ead81	000d0000-561c-fbbc-8dfa-6c072e8f9b36	00100000-561c-fbbc-5cfb-1f704457706a	00090000-561c-fbbc-8f95-249daca62d15	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-561c-fbbc-1cd4-aff673ef4ba2	000d0000-561c-fbbc-2368-56b070de3849	\N	00090000-561c-fbbc-ea55-6d3ec389ce67	000b0000-561c-fbbc-17b8-134c57d36cf3	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3063 (class 0 OID 21845220)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 21845097)
-- Dependencies: 220
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-561c-fbbc-de0d-b64e48a4eb98	00160000-561c-fbbc-b12e-67b5aaccff43	00090000-561c-fbbc-b389-4ea729d21a99	aizv	10	t
003d0000-561c-fbbc-742f-a2421e5e065d	00160000-561c-fbbc-b12e-67b5aaccff43	00090000-561c-fbbc-bd00-6981442ae822	apri	14	t
003d0000-561c-fbbc-8f07-1c22be358f0f	00160000-561c-fbbc-e98d-788bab58727e	00090000-561c-fbbc-7e6f-561df4eef552	aizv	11	t
003d0000-561c-fbbc-2f59-19359ec51824	00160000-561c-fbbc-0209-bbe935371a4b	00090000-561c-fbbc-aaf8-91b748295a78	aizv	12	t
003d0000-561c-fbbc-dbd6-4368d08126d3	00160000-561c-fbbc-b12e-67b5aaccff43	00090000-561c-fbbc-79f8-097c6e179642	apri	18	f
\.


--
-- TOC entry 3057 (class 0 OID 21845127)
-- Dependencies: 223
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-561c-fbbc-b12e-67b5aaccff43	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-561c-fbbc-e98d-788bab58727e	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-561c-fbbc-0209-bbe935371a4b	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3078 (class 0 OID 21845508)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 21844888)
-- Dependencies: 198
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-561c-fbbc-4c4b-4c865e64cb18	\N	\N	00200000-561c-fbbc-1d1f-810bfd728c04	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-561c-fbbc-8d7d-46c4fcc55ba2	\N	\N	00200000-561c-fbbc-492c-8cb0e19faafa	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-561c-fbbc-0468-88294ab404cb	\N	\N	00200000-561c-fbbc-643f-64f42d0b2dd8	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-561c-fbbc-2c61-0200ae8d265e	\N	\N	00200000-561c-fbbc-3e2f-8e3783214108	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-561c-fbbc-4a15-7bca6e058cf8	\N	\N	00200000-561c-fbbc-672f-495ae8b7714f	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3034 (class 0 OID 21844919)
-- Dependencies: 200
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3072 (class 0 OID 21845434)
-- Dependencies: 238
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 21844801)
-- Dependencies: 191
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-561c-fbba-1ecf-76f9f2041810	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-561c-fbba-2dc1-2f99cc10d248	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-561c-fbba-44ad-775c90a18fe0	AL	ALB	008	Albania 	Albanija	\N
00040000-561c-fbba-f850-358ffb3ba176	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-561c-fbba-0b4a-eda022cfd9c3	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-561c-fbba-ab16-1eb972c7c6d7	AD	AND	020	Andorra 	Andora	\N
00040000-561c-fbba-e178-cbff2f73c7fe	AO	AGO	024	Angola 	Angola	\N
00040000-561c-fbba-37c2-5b20e378ffbc	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-561c-fbba-5a10-68c7b2313a0e	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-561c-fbba-8012-d3f2144cf59b	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-561c-fbba-7655-f56da6716566	AR	ARG	032	Argentina 	Argenitna	\N
00040000-561c-fbba-5a54-b77bf8a6ed8d	AM	ARM	051	Armenia 	Armenija	\N
00040000-561c-fbba-c945-b3d01d9bdd28	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-561c-fbba-4127-d77350062dd3	AU	AUS	036	Australia 	Avstralija	\N
00040000-561c-fbba-1d44-6574cbdcd257	AT	AUT	040	Austria 	Avstrija	\N
00040000-561c-fbba-7bec-b85864d9a343	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-561c-fbba-72cb-fd69d36fab6f	BS	BHS	044	Bahamas 	Bahami	\N
00040000-561c-fbba-fbce-f398935b2241	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-561c-fbba-b3e1-2fdd52e9f601	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-561c-fbba-7eac-d85dedb7d4b5	BB	BRB	052	Barbados 	Barbados	\N
00040000-561c-fbba-2531-ec2ffaae1cff	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-561c-fbba-d5b6-5fafb922ef22	BE	BEL	056	Belgium 	Belgija	\N
00040000-561c-fbba-736c-c56d0c2c9f7e	BZ	BLZ	084	Belize 	Belize	\N
00040000-561c-fbba-1be3-62479b89b51b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-561c-fbba-e125-b691bd14b425	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-561c-fbba-338a-d6c1011fbb82	BT	BTN	064	Bhutan 	Butan	\N
00040000-561c-fbba-31b4-bb317e9cead6	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-561c-fbba-7782-5133191bd6f4	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-561c-fbba-f495-37fd9bc18766	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-561c-fbba-3680-390aa29710c9	BW	BWA	072	Botswana 	Bocvana	\N
00040000-561c-fbba-06e7-e305f66bb019	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-561c-fbba-58b2-cdf62748b113	BR	BRA	076	Brazil 	Brazilija	\N
00040000-561c-fbba-1b3f-559753de7e65	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-561c-fbba-c0bb-1196633625af	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-561c-fbba-9fe2-3369b2ba3f89	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-561c-fbba-7e93-875833e70ebc	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-561c-fbba-3af3-1f680bfb4ee2	BI	BDI	108	Burundi 	Burundi 	\N
00040000-561c-fbba-dc8f-3df5d5f30bf7	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-561c-fbba-245f-f95c977d8bd8	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-561c-fbba-9588-b82c04f71fd4	CA	CAN	124	Canada 	Kanada	\N
00040000-561c-fbba-8b13-95efd7a5eb41	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-561c-fbba-81fc-002c6d4c8b76	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-561c-fbba-e13e-b7a22a7fdb13	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-561c-fbba-a67f-bcb2839a203c	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-561c-fbba-70fc-5b2d5140292b	CL	CHL	152	Chile 	Čile	\N
00040000-561c-fbba-746c-a93ef40c5315	CN	CHN	156	China 	Kitajska	\N
00040000-561c-fbba-7063-d0b43dc99f75	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-561c-fbba-a946-294bf8d4d7ee	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-561c-fbba-4423-244f3d9375de	CO	COL	170	Colombia 	Kolumbija	\N
00040000-561c-fbba-4732-49cb9741d03c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-561c-fbba-57e0-d3e609010de4	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-561c-fbba-0699-d2c56ea1e7d6	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-561c-fbba-ed4a-11dfea519c0b	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-561c-fbba-20c7-91933f00d4cf	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-561c-fbba-a575-f34e47507586	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-561c-fbba-ab80-c1ccd66f3122	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-561c-fbba-ae72-8dea78c1caf3	CU	CUB	192	Cuba 	Kuba	\N
00040000-561c-fbba-b7d2-224e69ab4a8b	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-561c-fbba-2a71-7302e28ae380	CY	CYP	196	Cyprus 	Ciper	\N
00040000-561c-fbba-95e5-99182ce36ed8	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-561c-fbba-cf28-5e2aa7ea7150	DK	DNK	208	Denmark 	Danska	\N
00040000-561c-fbba-4712-a08865c4874f	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-561c-fbba-00d2-d268b25114ad	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-561c-fbba-9347-58232ea1ec63	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-561c-fbba-9e66-8c17f1899951	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-561c-fbba-355d-ebc931de411b	EG	EGY	818	Egypt 	Egipt	\N
00040000-561c-fbba-c41a-ce2d5f3ac6d0	SV	SLV	222	El Salvador 	Salvador	\N
00040000-561c-fbba-7047-1dae8516d9e1	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-561c-fbba-13b9-29e5ad25c26b	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-561c-fbba-684b-06ed8354fbd3	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-561c-fbba-05f7-8fd6a44ae213	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-561c-fbba-8316-113e9b41cf5e	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-561c-fbba-55d1-57ed7aa86dbb	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-561c-fbba-d096-c805682cc49b	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-561c-fbba-8ed8-6f2817e1495d	FI	FIN	246	Finland 	Finska	\N
00040000-561c-fbba-d099-fb56a1b8383c	FR	FRA	250	France 	Francija	\N
00040000-561c-fbba-a778-34afe5dc93ae	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-561c-fbba-89e4-ec4557c76910	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-561c-fbba-52aa-8895d3cf4be2	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-561c-fbba-7df6-d5a21f66f24e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-561c-fbba-f193-784e71559af8	GA	GAB	266	Gabon 	Gabon	\N
00040000-561c-fbba-6c05-b58ae7c620fd	GM	GMB	270	Gambia 	Gambija	\N
00040000-561c-fbba-2804-dbd9454ed99e	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-561c-fbba-85c5-863c78099fce	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-561c-fbba-0f51-54e73a5b39d8	GH	GHA	288	Ghana 	Gana	\N
00040000-561c-fbba-85e5-a1710664ad55	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-561c-fbba-765f-f95e6d2a206c	GR	GRC	300	Greece 	Grčija	\N
00040000-561c-fbba-afdd-ee4c29dca2df	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-561c-fbba-23f2-306c81c60eb3	GD	GRD	308	Grenada 	Grenada	\N
00040000-561c-fbba-45fd-d66eac469615	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-561c-fbba-e138-84fcd1372603	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-561c-fbba-7f0a-c3e5f00d56d5	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-561c-fbba-3ec0-1c015033cdae	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-561c-fbba-7fe6-0e6df38875ae	GN	GIN	324	Guinea 	Gvineja	\N
00040000-561c-fbba-7f66-c03a9dfe19b7	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-561c-fbba-69cf-62de2f067a11	GY	GUY	328	Guyana 	Gvajana	\N
00040000-561c-fbba-3695-bb09dcb99aa2	HT	HTI	332	Haiti 	Haiti	\N
00040000-561c-fbba-0ba3-18b3ac6015bc	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-561c-fbba-1730-b7c0453ce092	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-561c-fbba-16a2-98e348a8b01a	HN	HND	340	Honduras 	Honduras	\N
00040000-561c-fbba-6a80-44db68886250	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-561c-fbba-a6c3-2e591bf3b1c3	HU	HUN	348	Hungary 	Madžarska	\N
00040000-561c-fbba-30a4-ddebadc49dad	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-561c-fbba-fa24-55ec862b29b1	IN	IND	356	India 	Indija	\N
00040000-561c-fbba-e1fa-18756d727f62	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-561c-fbba-430c-58339eea73af	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-561c-fbba-40be-26e052810ffc	IQ	IRQ	368	Iraq 	Irak	\N
00040000-561c-fbba-d174-0fb6d20cec39	IE	IRL	372	Ireland 	Irska	\N
00040000-561c-fbba-370f-0cab1337034c	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-561c-fbba-666c-06862cec7ee7	IL	ISR	376	Israel 	Izrael	\N
00040000-561c-fbba-de26-0763541215de	IT	ITA	380	Italy 	Italija	\N
00040000-561c-fbba-de9a-3204527e7208	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-561c-fbba-2fbd-fc271a6eea13	JP	JPN	392	Japan 	Japonska	\N
00040000-561c-fbba-ca29-896ae29bb8d0	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-561c-fbba-5af7-fb5d5aed58dd	JO	JOR	400	Jordan 	Jordanija	\N
00040000-561c-fbba-94b7-d669a24c5f76	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-561c-fbba-c0a6-158f251a6b60	KE	KEN	404	Kenya 	Kenija	\N
00040000-561c-fbba-0668-2d8afcd58274	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-561c-fbba-4712-93f5f31d7f1a	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-561c-fbba-7148-5a4b322f09d6	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-561c-fbba-7744-9f6fc9fc40aa	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-561c-fbba-0293-056d82a1bc89	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-561c-fbba-52bb-042ccb87d0f0	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-561c-fbba-2ecb-d174c3b3da16	LV	LVA	428	Latvia 	Latvija	\N
00040000-561c-fbba-8d72-50a0e31e2ddf	LB	LBN	422	Lebanon 	Libanon	\N
00040000-561c-fbba-dac5-e3cc1ceff515	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-561c-fbba-6144-08ca73c3d765	LR	LBR	430	Liberia 	Liberija	\N
00040000-561c-fbba-5b3e-28e5a9ad6256	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-561c-fbba-c4c6-96073c0a9bb9	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-561c-fbba-ff5c-fb45173928f7	LT	LTU	440	Lithuania 	Litva	\N
00040000-561c-fbba-fa2e-a86fb96c2c75	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-561c-fbba-af28-6698c1c77598	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-561c-fbba-c9bf-67e8619c8251	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-561c-fbba-de00-5f1e9677f70e	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-561c-fbba-0390-07bc9d60b196	MW	MWI	454	Malawi 	Malavi	\N
00040000-561c-fbba-d6fe-135fd0c1db38	MY	MYS	458	Malaysia 	Malezija	\N
00040000-561c-fbba-d59a-c4196d200b6a	MV	MDV	462	Maldives 	Maldivi	\N
00040000-561c-fbba-4184-e65399aeda30	ML	MLI	466	Mali 	Mali	\N
00040000-561c-fbba-f6b2-caff448b3965	MT	MLT	470	Malta 	Malta	\N
00040000-561c-fbba-3ee9-66e797983489	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-561c-fbba-4c39-6115b6de4b1a	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-561c-fbba-fff7-d4b803ef063f	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-561c-fbba-0519-27ca8bf32b3c	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-561c-fbba-4448-7e7d49e1307e	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-561c-fbba-03a9-ae2a4eb1d48a	MX	MEX	484	Mexico 	Mehika	\N
00040000-561c-fbba-fa57-2c1f7e1cddfe	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-561c-fbba-db4b-fa95bf24649a	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-561c-fbba-c2ed-bf89f3733577	MC	MCO	492	Monaco 	Monako	\N
00040000-561c-fbba-bbc4-09c3f791880c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-561c-fbba-0a08-7f1009bcf5e2	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-561c-fbba-a8d6-33344aca1f8f	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-561c-fbba-a6e2-ca7c6d61b01a	MA	MAR	504	Morocco 	Maroko	\N
00040000-561c-fbba-b03e-b88efa76dd44	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-561c-fbba-c6cb-56186c0b20d5	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-561c-fbba-6076-30221badfa16	NA	NAM	516	Namibia 	Namibija	\N
00040000-561c-fbba-e748-011dbb3faf5b	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-561c-fbba-29b3-72a620517fdc	NP	NPL	524	Nepal 	Nepal	\N
00040000-561c-fbba-0ac9-4fe6b3c264ef	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-561c-fbba-233f-e34f303cddab	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-561c-fbba-a913-27a68ec29278	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-561c-fbba-0433-f8913e5a6742	NE	NER	562	Niger 	Niger 	\N
00040000-561c-fbba-dc32-01129ddbda2c	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-561c-fbba-4482-0e592626de24	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-561c-fbba-d585-3a4edd3ce355	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-561c-fbba-9e9d-b2d8d3e6f30f	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-561c-fbba-e097-42a7ccc73454	NO	NOR	578	Norway 	Norveška	\N
00040000-561c-fbba-058c-383804e35b4f	OM	OMN	512	Oman 	Oman	\N
00040000-561c-fbba-bdb8-abfb7848b27a	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-561c-fbba-de53-1c9f751de993	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-561c-fbba-b5a9-a8ac73abccc3	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-561c-fbba-108f-78b16c48eceb	PA	PAN	591	Panama 	Panama	\N
00040000-561c-fbba-4130-89be53b485d3	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-561c-fbba-43d1-8e17c13a77fb	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-561c-fbba-6678-1ce968ed3b0b	PE	PER	604	Peru 	Peru	\N
00040000-561c-fbba-751c-c2f501e8fdcc	PH	PHL	608	Philippines 	Filipini	\N
00040000-561c-fbba-cc5d-23e1377bfd8f	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-561c-fbba-edbb-2a60e3ed8fd7	PL	POL	616	Poland 	Poljska	\N
00040000-561c-fbba-61a8-3bf4ba5a92ca	PT	PRT	620	Portugal 	Portugalska	\N
00040000-561c-fbba-f88a-24767524a89e	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-561c-fbba-8fe9-aa29c776f69a	QA	QAT	634	Qatar 	Katar	\N
00040000-561c-fbba-6ab3-a07bfbd3fe57	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-561c-fbba-b259-6470f62205c3	RO	ROU	642	Romania 	Romunija	\N
00040000-561c-fbba-2b23-3bbce93a0848	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-561c-fbba-8f92-c8ebfbdecb71	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-561c-fbba-1ee4-9b94dc2d596c	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-561c-fbba-8d39-66ac3ad3bf16	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-561c-fbba-0c7e-5b6e247c7bf1	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-561c-fbba-abe0-b9f2244c8612	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-561c-fbba-d072-937ae60fc5e5	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-561c-fbba-ca79-c20f0ab4ca14	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-561c-fbba-094e-cb661f0b97ac	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-561c-fbba-01fa-d22e6f777ab0	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-561c-fbba-8fc8-427ee466dfb5	SM	SMR	674	San Marino 	San Marino	\N
00040000-561c-fbba-7fa7-b7cbef8e2b02	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-561c-fbba-8150-f31ffbd35dd3	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-561c-fbba-6c45-f5c71d4571be	SN	SEN	686	Senegal 	Senegal	\N
00040000-561c-fbba-a201-34a77edc1049	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-561c-fbba-8266-3c4f918714ff	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-561c-fbba-6289-2c6af2b2a4b5	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-561c-fbba-13f0-83e9eca6e0b2	SG	SGP	702	Singapore 	Singapur	\N
00040000-561c-fbba-0eea-307d04d4113c	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-561c-fbba-df3b-087cbd22bddb	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-561c-fbba-17b9-da6b05115150	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-561c-fbba-c009-3d260e8bbfc9	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-561c-fbba-14c5-ef49a2d4da0a	SO	SOM	706	Somalia 	Somalija	\N
00040000-561c-fbba-e98b-5113f09a3fb6	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-561c-fbba-e3cb-1197066481db	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-561c-fbba-974e-974b00576b2b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-561c-fbba-80cf-44881a6f4c70	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-561c-fbba-f91f-6f4e679dac79	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-561c-fbba-9391-cdc0b9afafc0	SD	SDN	729	Sudan 	Sudan	\N
00040000-561c-fbba-c783-12880b8cf21c	SR	SUR	740	Suriname 	Surinam	\N
00040000-561c-fbba-f5e6-aa9cdf2b1945	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-561c-fbba-ec83-bb2d81b42702	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-561c-fbba-65a7-598e244869e0	SE	SWE	752	Sweden 	Švedska	\N
00040000-561c-fbba-5f35-945a92483a32	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-561c-fbba-36ac-38f3a900c74c	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-561c-fbba-0350-bdcdc197567a	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-561c-fbba-b9ac-f31ed2307f9a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-561c-fbba-f779-63b8f1e83fdb	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-561c-fbba-aaf3-0eb6062e6e05	TH	THA	764	Thailand 	Tajska	\N
00040000-561c-fbba-de8b-2298ea4a33c3	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-561c-fbba-5088-ee97a0132310	TG	TGO	768	Togo 	Togo	\N
00040000-561c-fbba-0d5c-aa10dd4e13fb	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-561c-fbba-ff30-e24a0bf72e7f	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-561c-fbba-c5c8-f2256c7018a4	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-561c-fbba-9ca8-c0fa27d431ea	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-561c-fbba-eb87-5cf4cf11e708	TR	TUR	792	Turkey 	Turčija	\N
00040000-561c-fbba-a2e2-d98b6d46744f	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-561c-fbba-f562-e71fef4f24bd	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-561c-fbba-fad2-4cd2bd343db7	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-561c-fbba-7123-095b02f70aee	UG	UGA	800	Uganda 	Uganda	\N
00040000-561c-fbba-9be6-838ac2d9e805	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-561c-fbba-74cc-d856327d9110	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-561c-fbba-fa35-b12e3aaa1b8e	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-561c-fbba-b6a7-c7882a2d184d	US	USA	840	United States 	Združene države Amerike	\N
00040000-561c-fbba-9c96-6323b4189bd6	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-561c-fbba-f8e7-456629e6570b	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-561c-fbba-1eef-488cf6025bab	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-561c-fbba-2bfd-c9c39b1292fe	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-561c-fbba-f13a-e525e22e2b16	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-561c-fbba-fde5-e3f97b6d3208	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-561c-fbba-31a1-945a439beab3	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-561c-fbba-e244-627781a05c63	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-561c-fbba-70a7-3438e69b07de	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-561c-fbba-ee88-29b1dab69968	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-561c-fbba-c927-9cfd078cc3ea	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-561c-fbba-2d03-0fa612f63ee0	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-561c-fbba-04f0-ef67bacd6c6a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3065 (class 0 OID 21845250)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-561c-fbbc-fa30-7d44e3d733cf	000e0000-561c-fbbc-e4be-8a851886d8a7	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561c-fbba-a2c9-2b136374b50a	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561c-fbbc-f993-4fcfdb0b3f83	000e0000-561c-fbbc-5fac-8f28ab2af300	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561c-fbba-0fc4-2983ba80c0ae	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561c-fbbc-ee99-f81fde6a14d8	000e0000-561c-fbbc-11c9-f59c3bfef5fa	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561c-fbba-a2c9-2b136374b50a	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-561c-fbbc-4920-d21d721967d2	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-561c-fbbc-2b94-8f72515c28cc	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3050 (class 0 OID 21845052)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-561c-fbbc-a9fb-a93a0b4745a6	000e0000-561c-fbbc-5fac-8f28ab2af300	000c0000-561c-fbbc-9fcf-f9411e2941ea	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-561c-fbba-d6b4-6837f871e955
000d0000-561c-fbbc-c664-ee49e2984e9d	000e0000-561c-fbbc-5fac-8f28ab2af300	000c0000-561c-fbbc-af26-2d648f684ba0	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-561c-fbba-789f-31f4b1e31487
000d0000-561c-fbbc-bcbf-44b84cc7bf6d	000e0000-561c-fbbc-5fac-8f28ab2af300	000c0000-561c-fbbc-82d8-6d3799958744	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-561c-fbba-c212-3398c8d858d1
000d0000-561c-fbbc-e5e5-6fef15f23c80	000e0000-561c-fbbc-5fac-8f28ab2af300	000c0000-561c-fbbc-19a6-f200b5c209c7	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-561c-fbba-63fc-0f458f4189c9
000d0000-561c-fbbc-334a-e984bc6aaece	000e0000-561c-fbbc-5fac-8f28ab2af300	000c0000-561c-fbbc-905e-6186e37cbc9e	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-561c-fbba-63fc-0f458f4189c9
000d0000-561c-fbbc-8981-ba981735703f	000e0000-561c-fbbc-5fac-8f28ab2af300	000c0000-561c-fbbc-a78d-2e50379e0589	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-561c-fbba-d6b4-6837f871e955
000d0000-561c-fbbc-8dfa-6c072e8f9b36	000e0000-561c-fbbc-5fac-8f28ab2af300	000c0000-561c-fbbc-e4d3-16eb8dc2e87d	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-561c-fbba-d6b4-6837f871e955
000d0000-561c-fbbc-297b-476b9868a004	000e0000-561c-fbbc-5fac-8f28ab2af300	000c0000-561c-fbbc-57c7-900f50ce07e2	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-561c-fbba-a855-c66f60c02a8f
000d0000-561c-fbbc-2368-56b070de3849	000e0000-561c-fbbc-5fac-8f28ab2af300	000c0000-561c-fbbc-1cd4-aff673ef4ba2	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-561c-fbba-5dc4-2a52ccf200b6
\.


--
-- TOC entry 3030 (class 0 OID 21844867)
-- Dependencies: 196
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 21844841)
-- Dependencies: 194
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 21844818)
-- Dependencies: 192
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-561c-fbbc-993e-0cb095aeefba	00080000-561c-fbbc-63ea-229fd105a91a	00090000-561c-fbbc-28ff-e6aac4895e35	AK		igralka
\.


--
-- TOC entry 3039 (class 0 OID 21844966)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3076 (class 0 OID 21845489)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3077 (class 0 OID 21845501)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3079 (class 0 OID 21845523)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 21729914)
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
20150930165014
\.


--
-- TOC entry 3043 (class 0 OID 21844991)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 21844775)
-- Dependencies: 189
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-561c-fbbb-87b1-bbb716e6c750	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-561c-fbbb-e7d9-dc9c78a15e08	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-561c-fbbb-f5b7-87934f6be982	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-561c-fbbb-5f97-aec88d589152	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-561c-fbbb-2672-96a760e8d38a	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-561c-fbbb-d223-7b24955a9da9	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-561c-fbbb-f122-d5aa4437715d	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-561c-fbbb-7c1e-c16c26583d97	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-561c-fbbb-9310-00f24100efc5	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-561c-fbbb-f617-cc87e106b8b4	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-561c-fbbb-59aa-3fa22fc8802c	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-561c-fbbb-6a3c-786cdb50627e	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-561c-fbbb-6b88-e4bc8f23a3af	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-561c-fbbb-1131-fe35c3c72ecc	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-561c-fbbb-32b3-2dfc5814302d	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-561c-fbbc-bf5f-6362e73a96df	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-561c-fbbc-3ac7-1c489dfef1e7	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-561c-fbbc-104f-67240b7d0025	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-561c-fbbc-f01c-35a1ffacc87f	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-561c-fbbc-a683-ca7d74bb30cb	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-561c-fbbe-d427-fc6f44cbd413	application.tenant.maticnopodjetje	string	s:36:"00080000-561c-fbbe-221b-796142af9ddc";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3017 (class 0 OID 21844688)
-- Dependencies: 183
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-561c-fbbc-3b5d-57a8e34c33e6	00000000-561c-fbbc-bf5f-6362e73a96df	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-561c-fbbc-9468-f21ad742c4c1	00000000-561c-fbbc-bf5f-6362e73a96df	00010000-561c-fbbb-027d-e35da84d9b48	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-561c-fbbc-841e-8d716a5e6f36	00000000-561c-fbbc-3ac7-1c489dfef1e7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3018 (class 0 OID 21844699)
-- Dependencies: 184
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-561c-fbbc-0e2d-8c3aaf7dba9c	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-561c-fbbc-b42e-3f9040c2ada5	00010000-561c-fbbc-354e-a0077120ae82	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-561c-fbbc-5e13-d81418afff68	00010000-561c-fbbc-7c76-bbabfe3489c4	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-561c-fbbc-afba-ac574e8b8fe0	00010000-561c-fbbc-f271-034364ddca84	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-561c-fbbc-95a0-96f2001ea468	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-561c-fbbc-e2ec-07fb416bfed0	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-561c-fbbc-8f95-249daca62d15	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-561c-fbbc-7e70-1d5ae27fd7bc	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-561c-fbbc-28ff-e6aac4895e35	00010000-561c-fbbc-268c-b83b594bd06c	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-561c-fbbc-ea55-6d3ec389ce67	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-561c-fbbc-c34d-6434fb510eb2	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-561c-fbbc-92f2-be3b1b618dcc	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-561c-fbbc-22f4-cb175422409a	00010000-561c-fbbc-d840-f60a47a71e07	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-561c-fbbc-b389-4ea729d21a99	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-561c-fbbc-bd00-6981442ae822	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-561c-fbbc-7e6f-561df4eef552	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-561c-fbbc-aaf8-91b748295a78	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-561c-fbbc-79f8-097c6e179642	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 3012 (class 0 OID 21844644)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-561c-fbba-47d2-79a1c5d242df	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-561c-fbba-3f4b-80149f306082	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-561c-fbba-6294-8ec502d85a87	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-561c-fbba-8a3f-3eb537237c75	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-561c-fbba-c98b-b213ac731651	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-561c-fbba-29f3-42db105adfd2	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-561c-fbba-d30f-fb5a821e5365	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-561c-fbba-3212-b8e10a294035	Abonma-read	Abonma - branje	f
00030000-561c-fbba-0b63-bc2a96fd106f	Abonma-write	Abonma - spreminjanje	f
00030000-561c-fbba-9975-4dd8ddd8a521	Alternacija-read	Alternacija - branje	f
00030000-561c-fbba-b281-98b709394368	Alternacija-write	Alternacija - spreminjanje	f
00030000-561c-fbba-db0b-296a16f9e845	Arhivalija-read	Arhivalija - branje	f
00030000-561c-fbba-de3c-33e543676977	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-561c-fbba-b656-166888baadb6	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-561c-fbba-1058-3ccc3421da5a	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-561c-fbba-2e15-633a45769ae5	Besedilo-read	Besedilo - branje	f
00030000-561c-fbba-200e-b7f6df820eb5	Besedilo-write	Besedilo - spreminjanje	f
00030000-561c-fbba-0b2e-b7f96d56acbd	DogodekIzven-read	DogodekIzven - branje	f
00030000-561c-fbba-cdb8-e70cb6dc3bc7	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-561c-fbba-5d58-bf32498a19ca	Dogodek-read	Dogodek - branje	f
00030000-561c-fbba-eab4-d40c7e3c3b82	Dogodek-write	Dogodek - spreminjanje	f
00030000-561c-fbba-6a81-77820f62ebbf	DrugiVir-read	DrugiVir - branje	f
00030000-561c-fbba-9561-01303ed8d2c8	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-561c-fbba-fa7f-9a08b698d8e7	Drzava-read	Drzava - branje	f
00030000-561c-fbba-54c2-55975c3088d5	Drzava-write	Drzava - spreminjanje	f
00030000-561c-fbba-13fe-f194785af75b	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-561c-fbba-a90c-8975d6b49b13	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-561c-fbba-af9e-838ac8a83c4b	Funkcija-read	Funkcija - branje	f
00030000-561c-fbba-5f6b-15f7a6df42e6	Funkcija-write	Funkcija - spreminjanje	f
00030000-561c-fbba-f0f3-1ba9fcd07bd9	Gostovanje-read	Gostovanje - branje	f
00030000-561c-fbba-96df-718f54170bd5	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-561c-fbba-ccd9-f9023ec384e9	Gostujoca-read	Gostujoca - branje	f
00030000-561c-fbba-a25b-27b7a324ca87	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-561c-fbba-bf96-b8944df220b2	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-561c-fbba-b6d9-7c059d127d9b	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-561c-fbba-f541-fb4a88fd511d	Kupec-read	Kupec - branje	f
00030000-561c-fbba-2cc0-e356fe0475af	Kupec-write	Kupec - spreminjanje	f
00030000-561c-fbba-580f-cc2daa6939c7	NacinPlacina-read	NacinPlacina - branje	f
00030000-561c-fbba-8d97-717b56598cbc	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-561c-fbba-9449-0d263b6f8bea	Option-read	Option - branje	f
00030000-561c-fbba-d8be-635adf276692	Option-write	Option - spreminjanje	f
00030000-561c-fbba-23ae-086d3067492e	OptionValue-read	OptionValue - branje	f
00030000-561c-fbba-1f5a-449287622a34	OptionValue-write	OptionValue - spreminjanje	f
00030000-561c-fbba-e7b6-18d5c91e57eb	Oseba-read	Oseba - branje	f
00030000-561c-fbba-b630-756fb77a5f87	Oseba-write	Oseba - spreminjanje	f
00030000-561c-fbba-cf73-accb6a794628	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-561c-fbba-2efb-e49b8c888405	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-561c-fbba-91b6-ba2397e1cbbd	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-561c-fbba-2a63-bd96b524375a	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-561c-fbba-b1da-4cab30680af2	Pogodba-read	Pogodba - branje	f
00030000-561c-fbba-8fb0-9969bbc9e0c8	Pogodba-write	Pogodba - spreminjanje	f
00030000-561c-fbba-f669-ea3f62976704	Popa-read	Popa - branje	f
00030000-561c-fbba-f68e-6e608e8cfa49	Popa-write	Popa - spreminjanje	f
00030000-561c-fbba-149d-c073b6c183d4	Posta-read	Posta - branje	f
00030000-561c-fbba-0f7e-d03b548b2ab1	Posta-write	Posta - spreminjanje	f
00030000-561c-fbba-e48e-16e2c33d08a2	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-561c-fbba-08ce-1ee403d74b50	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-561c-fbba-68d6-93f2719ca95c	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-561c-fbba-33b9-d3b7f8633962	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-561c-fbba-0e14-f324761bec78	PostniNaslov-read	PostniNaslov - branje	f
00030000-561c-fbba-1944-84c114bc2ec0	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-561c-fbba-20b3-ef8df3177389	Predstava-read	Predstava - branje	f
00030000-561c-fbba-a6a6-65bc1ed4f669	Predstava-write	Predstava - spreminjanje	f
00030000-561c-fbba-80b6-67a468191411	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-561c-fbba-a4f5-7b1a33691720	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-561c-fbba-3df2-c733993efac4	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-561c-fbba-ccfa-bdd6de751f9e	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-561c-fbba-e3ca-b983ed5b766a	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-561c-fbba-189e-22844511de69	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-561c-fbba-7467-df38f9eb2dd8	ProgramDela-read	ProgramDela - branje	f
00030000-561c-fbba-1560-f250ea0a8bba	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-561c-fbba-f847-2d27fe59d5d8	ProgramFestival-read	ProgramFestival - branje	f
00030000-561c-fbba-9aa2-81345a2dc197	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-561c-fbba-4153-3b35dca3d072	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-561c-fbba-c594-d14663faa15d	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-561c-fbba-fdb9-04c31db2a3db	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-561c-fbba-3758-aa25e5c9ba84	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-561c-fbba-1be0-2247ceb6af36	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-561c-fbba-0a89-f3964451dda0	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-561c-fbba-a84a-a6d83219300f	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-561c-fbba-ef27-1591e88d6516	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-561c-fbba-472a-2ac8991ee67f	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-561c-fbba-7fec-849561708750	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-561c-fbba-72d7-0193b473d015	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-561c-fbba-9e49-ad4d8d2dfee3	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-561c-fbba-cbe0-0dca58e2fb43	ProgramRazno-read	ProgramRazno - branje	f
00030000-561c-fbba-5111-988d51d75283	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-561c-fbba-a8d2-6542c349a868	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-561c-fbba-7256-ee90608fb864	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-561c-fbba-0750-07d25b28999d	Prostor-read	Prostor - branje	f
00030000-561c-fbba-cc88-40c97de48e73	Prostor-write	Prostor - spreminjanje	f
00030000-561c-fbba-c9bc-1307ead22fe5	Racun-read	Racun - branje	f
00030000-561c-fbba-05c7-6048147e7b06	Racun-write	Racun - spreminjanje	f
00030000-561c-fbba-3159-5872350af962	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-561c-fbba-0912-4076298543e9	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-561c-fbba-5198-2e45f4fc5d75	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-561c-fbba-43a7-c4992dd09db6	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-561c-fbba-f923-37cd3ac3147b	Rekvizit-read	Rekvizit - branje	f
00030000-561c-fbba-77a0-1c634fc0a960	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-561c-fbba-3bf3-b881363b7950	Revizija-read	Revizija - branje	f
00030000-561c-fbba-832f-20c746e345fd	Revizija-write	Revizija - spreminjanje	f
00030000-561c-fbba-7587-3463cd40b331	Rezervacija-read	Rezervacija - branje	f
00030000-561c-fbba-c49a-c60a82c7f0db	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-561c-fbba-b7a1-825f9ec6387c	SedezniRed-read	SedezniRed - branje	f
00030000-561c-fbba-f40f-02751fd74b78	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-561c-fbba-c190-4627e28c0d62	Sedez-read	Sedez - branje	f
00030000-561c-fbba-b68b-328f0bac92c5	Sedez-write	Sedez - spreminjanje	f
00030000-561c-fbba-3846-513a63d1500f	Sezona-read	Sezona - branje	f
00030000-561c-fbba-62f3-d30688ed09c5	Sezona-write	Sezona - spreminjanje	f
00030000-561c-fbba-b1b8-83262ae81505	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-561c-fbba-5b6f-a84c360da2b1	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-561c-fbba-b740-c6d53cf5164e	Stevilcenje-read	Stevilcenje - branje	f
00030000-561c-fbba-5804-cb2d5a2a831e	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-561c-fbba-81e2-66874e9eaad3	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-561c-fbba-8c33-1731b344918d	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-561c-fbba-0f0b-919a2ffac037	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-561c-fbba-77dd-ad8a7b51ffd2	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-561c-fbba-7198-cefc24d06b68	Telefonska-read	Telefonska - branje	f
00030000-561c-fbba-7bad-0723c52126cd	Telefonska-write	Telefonska - spreminjanje	f
00030000-561c-fbba-7192-094f3d210a48	TerminStoritve-read	TerminStoritve - branje	f
00030000-561c-fbba-b5c6-d617dab3499e	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-561c-fbba-fb3f-1244d06dd50b	TipFunkcije-read	TipFunkcije - branje	f
00030000-561c-fbba-9cc8-bf943b70bc33	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-561c-fbba-8bc3-78fcc866642e	TipPopa-read	TipPopa - branje	f
00030000-561c-fbba-30ec-bc820b34e712	TipPopa-write	TipPopa - spreminjanje	f
00030000-561c-fbba-bbb3-ad611c04eb3e	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-561c-fbba-6eb8-5f38e7a901c0	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-561c-fbba-d9e6-e2339701ebc9	Trr-read	Trr - branje	f
00030000-561c-fbba-13c4-82288198ed1d	Trr-write	Trr - spreminjanje	f
00030000-561c-fbba-c66f-bf72da4c3a1c	Uprizoritev-read	Uprizoritev - branje	f
00030000-561c-fbba-2b6e-ae786925f6b6	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-561c-fbba-186f-dfb4644e1ead	Vaja-read	Vaja - branje	f
00030000-561c-fbba-c65e-9465997d0f37	Vaja-write	Vaja - spreminjanje	f
00030000-561c-fbba-2e88-9f165ac298bc	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-561c-fbba-30df-8ef7c12b29cb	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-561c-fbba-99ea-2880a3d21a22	VrstaStroska-read	VrstaStroska - branje	f
00030000-561c-fbba-cfe0-4cfc9f62aae4	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-561c-fbba-c9ef-04067b62e862	Zaposlitev-read	Zaposlitev - branje	f
00030000-561c-fbba-2216-53fe719d790d	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-561c-fbba-f78e-0761d92059e7	Zasedenost-read	Zasedenost - branje	f
00030000-561c-fbba-1b45-6b9fa3a7f08e	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-561c-fbba-6f4d-1164fa3bd84f	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-561c-fbba-8883-d48f3a311756	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-561c-fbba-f2db-0a2b9de413e6	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-561c-fbba-29ec-ba77ccfe274e	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-561c-fbba-aaab-d55762083685	Job-read	Branje opravil - samo zase - branje	f
00030000-561c-fbba-28be-204a883c336a	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-561c-fbba-dd6b-81ca6a681760	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-561c-fbba-3cff-51469187f33c	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-561c-fbba-95db-4c0ae3b596b9	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-561c-fbba-4cd0-07dd6f646ad8	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-561c-fbba-8429-9a6d4061007f	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-561c-fbba-ba50-384a4dceb2db	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-561c-fbba-f08b-73dad497e47f	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-561c-fbba-4aa3-67f05688e967	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-561c-fbba-6d1a-c815c3440901	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-561c-fbba-16e6-3956ee3f6067	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-561c-fbba-f2c1-71adf94d9db7	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-561c-fbba-432b-41ea8f9fe6e0	Datoteka-write	Datoteka - spreminjanje	f
00030000-561c-fbba-1e9b-d94a73594354	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3014 (class 0 OID 21844663)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-561c-fbba-e7ca-c85524157521	00030000-561c-fbba-3f4b-80149f306082
00020000-561c-fbba-56d4-f018fde0356e	00030000-561c-fbba-fa7f-9a08b698d8e7
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-3212-b8e10a294035
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-0b63-bc2a96fd106f
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-9975-4dd8ddd8a521
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-b281-98b709394368
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-db0b-296a16f9e845
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-5d58-bf32498a19ca
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-8a3f-3eb537237c75
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-eab4-d40c7e3c3b82
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-fa7f-9a08b698d8e7
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-54c2-55975c3088d5
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-af9e-838ac8a83c4b
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-5f6b-15f7a6df42e6
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-f0f3-1ba9fcd07bd9
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-96df-718f54170bd5
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-ccd9-f9023ec384e9
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-a25b-27b7a324ca87
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-bf96-b8944df220b2
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-b6d9-7c059d127d9b
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-9449-0d263b6f8bea
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-23ae-086d3067492e
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-e7b6-18d5c91e57eb
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-b630-756fb77a5f87
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-f669-ea3f62976704
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-f68e-6e608e8cfa49
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-149d-c073b6c183d4
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-0f7e-d03b548b2ab1
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-0e14-f324761bec78
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-1944-84c114bc2ec0
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-20b3-ef8df3177389
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-a6a6-65bc1ed4f669
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-e3ca-b983ed5b766a
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-189e-22844511de69
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-0750-07d25b28999d
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-cc88-40c97de48e73
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-5198-2e45f4fc5d75
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-43a7-c4992dd09db6
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-f923-37cd3ac3147b
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-77a0-1c634fc0a960
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-3846-513a63d1500f
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-62f3-d30688ed09c5
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-fb3f-1244d06dd50b
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-c66f-bf72da4c3a1c
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-2b6e-ae786925f6b6
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-186f-dfb4644e1ead
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-c65e-9465997d0f37
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-f78e-0761d92059e7
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-1b45-6b9fa3a7f08e
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-6f4d-1164fa3bd84f
00020000-561c-fbbb-8d11-1d4d3f496e05	00030000-561c-fbba-f2db-0a2b9de413e6
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-3212-b8e10a294035
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-db0b-296a16f9e845
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-5d58-bf32498a19ca
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-fa7f-9a08b698d8e7
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-f0f3-1ba9fcd07bd9
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-ccd9-f9023ec384e9
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-bf96-b8944df220b2
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-b6d9-7c059d127d9b
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-9449-0d263b6f8bea
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-23ae-086d3067492e
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-e7b6-18d5c91e57eb
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-b630-756fb77a5f87
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-f669-ea3f62976704
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-149d-c073b6c183d4
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-0e14-f324761bec78
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-1944-84c114bc2ec0
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-20b3-ef8df3177389
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-0750-07d25b28999d
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-5198-2e45f4fc5d75
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-f923-37cd3ac3147b
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-3846-513a63d1500f
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-7198-cefc24d06b68
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-7bad-0723c52126cd
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-d9e6-e2339701ebc9
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-13c4-82288198ed1d
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-c9ef-04067b62e862
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-2216-53fe719d790d
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-6f4d-1164fa3bd84f
00020000-561c-fbbb-ed87-ecae852bb447	00030000-561c-fbba-f2db-0a2b9de413e6
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-3212-b8e10a294035
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-9975-4dd8ddd8a521
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-db0b-296a16f9e845
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-de3c-33e543676977
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-2e15-633a45769ae5
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-0b2e-b7f96d56acbd
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-5d58-bf32498a19ca
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-fa7f-9a08b698d8e7
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-af9e-838ac8a83c4b
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-f0f3-1ba9fcd07bd9
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-ccd9-f9023ec384e9
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-bf96-b8944df220b2
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-9449-0d263b6f8bea
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-23ae-086d3067492e
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-e7b6-18d5c91e57eb
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-f669-ea3f62976704
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-149d-c073b6c183d4
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-20b3-ef8df3177389
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-e3ca-b983ed5b766a
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-0750-07d25b28999d
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-5198-2e45f4fc5d75
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-f923-37cd3ac3147b
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-3846-513a63d1500f
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-fb3f-1244d06dd50b
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-186f-dfb4644e1ead
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-f78e-0761d92059e7
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-6f4d-1164fa3bd84f
00020000-561c-fbbb-5b36-59cd87502691	00030000-561c-fbba-f2db-0a2b9de413e6
00020000-561c-fbbb-4409-526787ebd351	00030000-561c-fbba-3212-b8e10a294035
00020000-561c-fbbb-4409-526787ebd351	00030000-561c-fbba-0b63-bc2a96fd106f
00020000-561c-fbbb-4409-526787ebd351	00030000-561c-fbba-b281-98b709394368
00020000-561c-fbbb-4409-526787ebd351	00030000-561c-fbba-db0b-296a16f9e845
00020000-561c-fbbb-4409-526787ebd351	00030000-561c-fbba-5d58-bf32498a19ca
00020000-561c-fbbb-4409-526787ebd351	00030000-561c-fbba-fa7f-9a08b698d8e7
00020000-561c-fbbb-4409-526787ebd351	00030000-561c-fbba-f0f3-1ba9fcd07bd9
00020000-561c-fbbb-4409-526787ebd351	00030000-561c-fbba-ccd9-f9023ec384e9
00020000-561c-fbbb-4409-526787ebd351	00030000-561c-fbba-9449-0d263b6f8bea
00020000-561c-fbbb-4409-526787ebd351	00030000-561c-fbba-23ae-086d3067492e
00020000-561c-fbbb-4409-526787ebd351	00030000-561c-fbba-f669-ea3f62976704
00020000-561c-fbbb-4409-526787ebd351	00030000-561c-fbba-149d-c073b6c183d4
00020000-561c-fbbb-4409-526787ebd351	00030000-561c-fbba-20b3-ef8df3177389
00020000-561c-fbbb-4409-526787ebd351	00030000-561c-fbba-0750-07d25b28999d
00020000-561c-fbbb-4409-526787ebd351	00030000-561c-fbba-5198-2e45f4fc5d75
00020000-561c-fbbb-4409-526787ebd351	00030000-561c-fbba-f923-37cd3ac3147b
00020000-561c-fbbb-4409-526787ebd351	00030000-561c-fbba-3846-513a63d1500f
00020000-561c-fbbb-4409-526787ebd351	00030000-561c-fbba-fb3f-1244d06dd50b
00020000-561c-fbbb-4409-526787ebd351	00030000-561c-fbba-6f4d-1164fa3bd84f
00020000-561c-fbbb-4409-526787ebd351	00030000-561c-fbba-f2db-0a2b9de413e6
00020000-561c-fbbb-5e75-b27ddc5321a1	00030000-561c-fbba-3212-b8e10a294035
00020000-561c-fbbb-5e75-b27ddc5321a1	00030000-561c-fbba-db0b-296a16f9e845
00020000-561c-fbbb-5e75-b27ddc5321a1	00030000-561c-fbba-5d58-bf32498a19ca
00020000-561c-fbbb-5e75-b27ddc5321a1	00030000-561c-fbba-fa7f-9a08b698d8e7
00020000-561c-fbbb-5e75-b27ddc5321a1	00030000-561c-fbba-f0f3-1ba9fcd07bd9
00020000-561c-fbbb-5e75-b27ddc5321a1	00030000-561c-fbba-ccd9-f9023ec384e9
00020000-561c-fbbb-5e75-b27ddc5321a1	00030000-561c-fbba-9449-0d263b6f8bea
00020000-561c-fbbb-5e75-b27ddc5321a1	00030000-561c-fbba-23ae-086d3067492e
00020000-561c-fbbb-5e75-b27ddc5321a1	00030000-561c-fbba-f669-ea3f62976704
00020000-561c-fbbb-5e75-b27ddc5321a1	00030000-561c-fbba-149d-c073b6c183d4
00020000-561c-fbbb-5e75-b27ddc5321a1	00030000-561c-fbba-20b3-ef8df3177389
00020000-561c-fbbb-5e75-b27ddc5321a1	00030000-561c-fbba-0750-07d25b28999d
00020000-561c-fbbb-5e75-b27ddc5321a1	00030000-561c-fbba-5198-2e45f4fc5d75
00020000-561c-fbbb-5e75-b27ddc5321a1	00030000-561c-fbba-f923-37cd3ac3147b
00020000-561c-fbbb-5e75-b27ddc5321a1	00030000-561c-fbba-3846-513a63d1500f
00020000-561c-fbbb-5e75-b27ddc5321a1	00030000-561c-fbba-7192-094f3d210a48
00020000-561c-fbbb-5e75-b27ddc5321a1	00030000-561c-fbba-6294-8ec502d85a87
00020000-561c-fbbb-5e75-b27ddc5321a1	00030000-561c-fbba-fb3f-1244d06dd50b
00020000-561c-fbbb-5e75-b27ddc5321a1	00030000-561c-fbba-6f4d-1164fa3bd84f
00020000-561c-fbbb-5e75-b27ddc5321a1	00030000-561c-fbba-f2db-0a2b9de413e6
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-47d2-79a1c5d242df
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-3f4b-80149f306082
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-6294-8ec502d85a87
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-8a3f-3eb537237c75
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-c98b-b213ac731651
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-29f3-42db105adfd2
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-d30f-fb5a821e5365
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-3212-b8e10a294035
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-0b63-bc2a96fd106f
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-9975-4dd8ddd8a521
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-b281-98b709394368
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-db0b-296a16f9e845
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-de3c-33e543676977
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-2e15-633a45769ae5
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-200e-b7f6df820eb5
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-0b2e-b7f96d56acbd
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-cdb8-e70cb6dc3bc7
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-5d58-bf32498a19ca
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-eab4-d40c7e3c3b82
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-fa7f-9a08b698d8e7
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-54c2-55975c3088d5
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-6a81-77820f62ebbf
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-9561-01303ed8d2c8
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-13fe-f194785af75b
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-a90c-8975d6b49b13
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-af9e-838ac8a83c4b
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-5f6b-15f7a6df42e6
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-f0f3-1ba9fcd07bd9
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-96df-718f54170bd5
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-ccd9-f9023ec384e9
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-a25b-27b7a324ca87
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-bf96-b8944df220b2
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-b6d9-7c059d127d9b
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-f541-fb4a88fd511d
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-2cc0-e356fe0475af
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-580f-cc2daa6939c7
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-8d97-717b56598cbc
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-9449-0d263b6f8bea
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-d8be-635adf276692
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-23ae-086d3067492e
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-1f5a-449287622a34
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-e7b6-18d5c91e57eb
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-b630-756fb77a5f87
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-cf73-accb6a794628
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-2efb-e49b8c888405
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-91b6-ba2397e1cbbd
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-2a63-bd96b524375a
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-b1da-4cab30680af2
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-8fb0-9969bbc9e0c8
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-f669-ea3f62976704
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-f68e-6e608e8cfa49
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-149d-c073b6c183d4
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-0f7e-d03b548b2ab1
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-e48e-16e2c33d08a2
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-08ce-1ee403d74b50
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-68d6-93f2719ca95c
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-33b9-d3b7f8633962
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-0e14-f324761bec78
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-1944-84c114bc2ec0
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-20b3-ef8df3177389
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-a6a6-65bc1ed4f669
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-80b6-67a468191411
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-a4f5-7b1a33691720
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-3df2-c733993efac4
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-ccfa-bdd6de751f9e
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-e3ca-b983ed5b766a
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-189e-22844511de69
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-7467-df38f9eb2dd8
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-1560-f250ea0a8bba
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-f847-2d27fe59d5d8
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-9aa2-81345a2dc197
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-4153-3b35dca3d072
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-c594-d14663faa15d
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-fdb9-04c31db2a3db
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-3758-aa25e5c9ba84
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-1be0-2247ceb6af36
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-0a89-f3964451dda0
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-a84a-a6d83219300f
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-ef27-1591e88d6516
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-472a-2ac8991ee67f
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-7fec-849561708750
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-72d7-0193b473d015
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-9e49-ad4d8d2dfee3
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-cbe0-0dca58e2fb43
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-5111-988d51d75283
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-a8d2-6542c349a868
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-7256-ee90608fb864
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-0750-07d25b28999d
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-cc88-40c97de48e73
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-c9bc-1307ead22fe5
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-05c7-6048147e7b06
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-3159-5872350af962
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-0912-4076298543e9
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-5198-2e45f4fc5d75
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-43a7-c4992dd09db6
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-f923-37cd3ac3147b
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-77a0-1c634fc0a960
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-3bf3-b881363b7950
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-832f-20c746e345fd
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-7587-3463cd40b331
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-c49a-c60a82c7f0db
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-b7a1-825f9ec6387c
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-f40f-02751fd74b78
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-c190-4627e28c0d62
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-b68b-328f0bac92c5
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-3846-513a63d1500f
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-62f3-d30688ed09c5
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-b1b8-83262ae81505
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-5b6f-a84c360da2b1
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-b740-c6d53cf5164e
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-5804-cb2d5a2a831e
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-81e2-66874e9eaad3
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-8c33-1731b344918d
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-0f0b-919a2ffac037
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-77dd-ad8a7b51ffd2
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-7198-cefc24d06b68
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-7bad-0723c52126cd
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-7192-094f3d210a48
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-b5c6-d617dab3499e
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-fb3f-1244d06dd50b
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-9cc8-bf943b70bc33
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-bbb3-ad611c04eb3e
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-6eb8-5f38e7a901c0
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-d9e6-e2339701ebc9
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-13c4-82288198ed1d
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-c66f-bf72da4c3a1c
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-2b6e-ae786925f6b6
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-186f-dfb4644e1ead
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-c65e-9465997d0f37
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-2e88-9f165ac298bc
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-30df-8ef7c12b29cb
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-99ea-2880a3d21a22
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-cfe0-4cfc9f62aae4
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-c9ef-04067b62e862
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-2216-53fe719d790d
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-f78e-0761d92059e7
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-1b45-6b9fa3a7f08e
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-6f4d-1164fa3bd84f
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-8883-d48f3a311756
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-f2db-0a2b9de413e6
00020000-561c-fbbc-8bde-7b17f503b0e0	00030000-561c-fbba-29ec-ba77ccfe274e
\.


--
-- TOC entry 3044 (class 0 OID 21844998)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3048 (class 0 OID 21845032)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3060 (class 0 OID 21845168)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-561c-fbbc-3ca1-151d188c2fd0	00090000-561c-fbbc-0e2d-8c3aaf7dba9c	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-561c-fbbc-4c0c-6bacb626c8e5	00090000-561c-fbbc-e2ec-07fb416bfed0	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-561c-fbbc-f545-094af250058d	00090000-561c-fbbc-22f4-cb175422409a	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-561c-fbbc-17b8-134c57d36cf3	00090000-561c-fbbc-ea55-6d3ec389ce67	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3020 (class 0 OID 21844732)
-- Dependencies: 186
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, tipkli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-561c-fbbc-63ea-229fd105a91a	00040000-561c-fbba-17b9-da6b05115150	0988	AK	\N	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561c-fbbc-fa98-a21c0b1f2825	00040000-561c-fbba-17b9-da6b05115150	0989	AK	\N	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-561c-fbbc-3cff-d4dfee5deea1	00040000-561c-fbba-17b9-da6b05115150	0987	AK	\N	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561c-fbbc-3595-136d1e385222	00040000-561c-fbba-17b9-da6b05115150	0986	AK	\N	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561c-fbbc-9d27-2fa0547b72f1	00040000-561c-fbba-17b9-da6b05115150	0985	AK	\N	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561c-fbbc-f35a-f3b71d35ace1	00040000-561c-fbba-7655-f56da6716566	0984	AK	\N	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561c-fbbc-16dc-0eb0ba027094	00040000-561c-fbba-ab80-c1ccd66f3122	0983	AK	\N	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561c-fbbc-1bb6-09743820f11f	00040000-561c-fbba-1d44-6574cbdcd257	0982	AK	\N	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561c-fbbc-5447-1563c7667f78	00040000-561c-fbba-85c5-863c78099fce	9999	AK	\N	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561c-fbbe-221b-796142af9ddc	00040000-561c-fbba-17b9-da6b05115150	1001	AK	\N	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3022 (class 0 OID 21844767)
-- Dependencies: 188
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-561c-fbba-3f8b-8a72f915c613	8341	Adlešiči
00050000-561c-fbba-d5f6-95f801e97e05	5270	Ajdovščina
00050000-561c-fbba-d5d9-0e1d6630c338	6280	Ankaran/Ancarano
00050000-561c-fbba-70b3-38ba27fc9ff8	9253	Apače
00050000-561c-fbba-49b6-ca4c193a357c	8253	Artiče
00050000-561c-fbba-7ee4-62e466cea498	4275	Begunje na Gorenjskem
00050000-561c-fbba-0425-61f0225ac73e	1382	Begunje pri Cerknici
00050000-561c-fbba-4ed4-e23bb84fb13f	9231	Beltinci
00050000-561c-fbba-49e8-01f7dacf83d9	2234	Benedikt
00050000-561c-fbba-7897-8c4b30b3b3f6	2345	Bistrica ob Dravi
00050000-561c-fbba-0e5e-ca3b463a84cf	3256	Bistrica ob Sotli
00050000-561c-fbba-f4e8-0326c8f5ce05	8259	Bizeljsko
00050000-561c-fbba-fd40-7462c0fff2b2	1223	Blagovica
00050000-561c-fbba-27d8-4027b4140a9e	8283	Blanca
00050000-561c-fbba-2df6-9224bb3e505e	4260	Bled
00050000-561c-fbba-fef1-c40087a8d60a	4273	Blejska Dobrava
00050000-561c-fbba-bca8-96234fc62bf5	9265	Bodonci
00050000-561c-fbba-bd5f-7da8accafa4f	9222	Bogojina
00050000-561c-fbba-9205-c9a018bee63e	4263	Bohinjska Bela
00050000-561c-fbba-8b15-ebdd86384a93	4264	Bohinjska Bistrica
00050000-561c-fbba-3c64-fa166dc18b49	4265	Bohinjsko jezero
00050000-561c-fbba-272a-49269e11ef55	1353	Borovnica
00050000-561c-fbba-7743-5b262ddbdd16	8294	Boštanj
00050000-561c-fbba-3076-e1204f5fda72	5230	Bovec
00050000-561c-fbba-5d8c-d5a555d49f24	5295	Branik
00050000-561c-fbba-9bbd-9f784ccf8d57	3314	Braslovče
00050000-561c-fbba-b10a-539ce30422a6	5223	Breginj
00050000-561c-fbba-ad92-993202d90781	8280	Brestanica
00050000-561c-fbba-73ba-8862e74c2103	2354	Bresternica
00050000-561c-fbba-0e6c-88e8f3751703	4243	Brezje
00050000-561c-fbba-ace3-ef81ed6da4e6	1351	Brezovica pri Ljubljani
00050000-561c-fbba-b6b8-7dedc3d4c553	8250	Brežice
00050000-561c-fbba-6076-04f29bd80e31	4210	Brnik - Aerodrom
00050000-561c-fbba-7009-9c7736a45be5	8321	Brusnice
00050000-561c-fbba-e127-fd7dfd655ef7	3255	Buče
00050000-561c-fbba-1fdb-2d62e78702ca	8276	Bučka 
00050000-561c-fbba-e2a1-ca60ecad2ad0	9261	Cankova
00050000-561c-fbba-05da-cdd68df28ad9	3000	Celje 
00050000-561c-fbba-a16c-2b31b3ca85b1	3001	Celje - poštni predali
00050000-561c-fbba-8398-7b2e04521ef6	4207	Cerklje na Gorenjskem
00050000-561c-fbba-75d6-56942025987f	8263	Cerklje ob Krki
00050000-561c-fbba-237f-c099fb20f5ec	1380	Cerknica
00050000-561c-fbba-3fd2-9513685dc1e5	5282	Cerkno
00050000-561c-fbba-df2e-9ddcbb9dac08	2236	Cerkvenjak
00050000-561c-fbba-2e55-e5175563e6a6	2215	Ceršak
00050000-561c-fbba-38c3-70733adfecda	2326	Cirkovce
00050000-561c-fbba-1252-2b00f5b49a81	2282	Cirkulane
00050000-561c-fbba-6262-7fde906b8df2	5273	Col
00050000-561c-fbba-dcb9-6410eada3ba2	8251	Čatež ob Savi
00050000-561c-fbba-0406-fe38b0cd5b43	1413	Čemšenik
00050000-561c-fbba-4b59-cb525c171347	5253	Čepovan
00050000-561c-fbba-a00b-67caccc5f4a3	9232	Črenšovci
00050000-561c-fbba-7531-bec7d1d195f1	2393	Črna na Koroškem
00050000-561c-fbba-79c5-2135be8cfce0	6275	Črni Kal
00050000-561c-fbba-0c38-97e991cbd4ab	5274	Črni Vrh nad Idrijo
00050000-561c-fbba-c300-d1de5d963d3f	5262	Črniče
00050000-561c-fbba-f87f-82c8d160bfac	8340	Črnomelj
00050000-561c-fbba-9eef-135703230a1f	6271	Dekani
00050000-561c-fbba-0999-d4e7913f2dbf	5210	Deskle
00050000-561c-fbba-981a-be04aea73edc	2253	Destrnik
00050000-561c-fbba-d024-b7d31e08a205	6215	Divača
00050000-561c-fbba-53da-46f14a591d03	1233	Dob
00050000-561c-fbba-7a03-0fdf0b3e35e4	3224	Dobje pri Planini
00050000-561c-fbba-4151-c9c8b573481c	8257	Dobova
00050000-561c-fbba-a9c4-827da72d280e	1423	Dobovec
00050000-561c-fbba-93e6-826a9815bd03	5263	Dobravlje
00050000-561c-fbba-5693-773d0b1936ff	3204	Dobrna
00050000-561c-fbba-5c84-d543175c9145	8211	Dobrnič
00050000-561c-fbba-4c2c-63a814b55caa	1356	Dobrova
00050000-561c-fbba-b80f-794adfad0c31	9223	Dobrovnik/Dobronak 
00050000-561c-fbba-5a0b-b507462362f9	5212	Dobrovo v Brdih
00050000-561c-fbba-e90d-71bb5225bf47	1431	Dol pri Hrastniku
00050000-561c-fbba-0771-265d2ff8f962	1262	Dol pri Ljubljani
00050000-561c-fbba-9c1f-b10d8aabd538	1273	Dole pri Litiji
00050000-561c-fbba-bc64-f535b3ac14b1	1331	Dolenja vas
00050000-561c-fbba-3dd4-8601725e5420	8350	Dolenjske Toplice
00050000-561c-fbba-5918-fb20a05f2f47	1230	Domžale
00050000-561c-fbba-d538-7cb45a415164	2252	Dornava
00050000-561c-fbba-7825-a64efc4985d4	5294	Dornberk
00050000-561c-fbba-0356-ef3ee2341b4f	1319	Draga
00050000-561c-fbba-70ca-d8d676a05676	8343	Dragatuš
00050000-561c-fbba-8a81-c8e9a800a006	3222	Dramlje
00050000-561c-fbba-79b8-fb7451c4591c	2370	Dravograd
00050000-561c-fbba-50b8-42a6ba84f3de	4203	Duplje
00050000-561c-fbba-31ff-06ab58e5e7ec	6221	Dutovlje
00050000-561c-fbba-b098-d1d60d99cf38	8361	Dvor
00050000-561c-fbba-2bbc-72c7e5e6c018	2343	Fala
00050000-561c-fbba-83c0-7cc47a8829a8	9208	Fokovci
00050000-561c-fbba-49dd-491a8330b56f	2313	Fram
00050000-561c-fbba-9f65-c7af2a14f731	3213	Frankolovo
00050000-561c-fbba-b815-240202965e79	1274	Gabrovka
00050000-561c-fbba-da33-dbd306a224b4	8254	Globoko
00050000-561c-fbba-32eb-3135b1fe4cb5	5275	Godovič
00050000-561c-fbba-54f6-dab50b892f62	4204	Golnik
00050000-561c-fbba-c909-420bddef0514	3303	Gomilsko
00050000-561c-fbba-a9d3-53efcfd0e6af	4224	Gorenja vas
00050000-561c-fbba-e820-13ced2a68f35	3263	Gorica pri Slivnici
00050000-561c-fbba-727b-7c2f47ad83a6	2272	Gorišnica
00050000-561c-fbba-8d48-eaefb27fc4d4	9250	Gornja Radgona
00050000-561c-fbba-9134-016c015015d2	3342	Gornji Grad
00050000-561c-fbba-3c1c-b1aecdb6ad15	4282	Gozd Martuljek
00050000-561c-fbba-1c54-e7e9958eb4fe	6272	Gračišče
00050000-561c-fbba-7d7c-98c64c898b6e	9264	Grad
00050000-561c-fbba-160c-1c090e6377dc	8332	Gradac
00050000-561c-fbba-e236-7b71d08c1959	1384	Grahovo
00050000-561c-fbba-7005-1b743ee16557	5242	Grahovo ob Bači
00050000-561c-fbba-b90e-0026712b849a	5251	Grgar
00050000-561c-fbba-aa93-bb8b72b20924	3302	Griže
00050000-561c-fbba-9666-e4ef8286709d	3231	Grobelno
00050000-561c-fbba-af36-035d79019d38	1290	Grosuplje
00050000-561c-fbba-21e4-82a4dfef4e32	2288	Hajdina
00050000-561c-fbba-e8bc-60f302d966b8	8362	Hinje
00050000-561c-fbba-7b82-5b4975f34f40	2311	Hoče
00050000-561c-fbba-b31b-1d00acda66dd	9205	Hodoš/Hodos
00050000-561c-fbba-5cdf-99eb0bd75940	1354	Horjul
00050000-561c-fbba-d319-9df9a27e5b33	1372	Hotedršica
00050000-561c-fbba-4d0f-076a3cbc5278	1430	Hrastnik
00050000-561c-fbba-314f-948ca2e84ae4	6225	Hruševje
00050000-561c-fbba-0770-cd88610f1c08	4276	Hrušica
00050000-561c-fbba-9e82-e1e19d9684ce	5280	Idrija
00050000-561c-fbba-9488-2f3e6c461a63	1292	Ig
00050000-561c-fbba-a5ee-d7cf801e5341	6250	Ilirska Bistrica
00050000-561c-fbba-54d7-08175fd626df	6251	Ilirska Bistrica-Trnovo
00050000-561c-fbba-771c-3b6d6e3b6834	1295	Ivančna Gorica
00050000-561c-fbba-8545-b06e91a3332f	2259	Ivanjkovci
00050000-561c-fbba-cb69-642c1914e94e	1411	Izlake
00050000-561c-fbba-f28b-9cbe5a8c1d53	6310	Izola/Isola
00050000-561c-fbba-d575-d9ecb15349d3	2222	Jakobski Dol
00050000-561c-fbba-212f-35b084b96dea	2221	Jarenina
00050000-561c-fbba-5717-f14002e6bad2	6254	Jelšane
00050000-561c-fbba-60d0-03744c50740a	4270	Jesenice
00050000-561c-fbba-6172-a46ac0044ee7	8261	Jesenice na Dolenjskem
00050000-561c-fbba-3ef0-072ec1ecb959	3273	Jurklošter
00050000-561c-fbba-e31f-21b39aa44940	2223	Jurovski Dol
00050000-561c-fbba-b4ad-0bce4de04c28	2256	Juršinci
00050000-561c-fbba-6d3d-4cbc116e9c45	5214	Kal nad Kanalom
00050000-561c-fbba-d050-5bf702b3b9e7	3233	Kalobje
00050000-561c-fbba-2789-a669cfd0bea9	4246	Kamna Gorica
00050000-561c-fbba-dbc1-e671912481e1	2351	Kamnica
00050000-561c-fbba-ca62-15a69a1cef25	1241	Kamnik
00050000-561c-fbba-5f9e-22d103569e78	5213	Kanal
00050000-561c-fbba-a1cc-04fdd1b40ea5	8258	Kapele
00050000-561c-fbba-65ae-5e02141882e3	2362	Kapla
00050000-561c-fbba-b41c-ca11c1532be3	2325	Kidričevo
00050000-561c-fbba-00e8-726ec1afa558	1412	Kisovec
00050000-561c-fbba-968d-1e73ebd235c7	6253	Knežak
00050000-561c-fbba-dcdb-a7f344f9b277	5222	Kobarid
00050000-561c-fbba-f3fd-4ce7819d79f0	9227	Kobilje
00050000-561c-fbba-471e-0892325cc2e1	1330	Kočevje
00050000-561c-fbba-9409-0473b11bb2b4	1338	Kočevska Reka
00050000-561c-fbba-e1ce-06741ccc656d	2276	Kog
00050000-561c-fbba-a2b8-4f42e60f9619	5211	Kojsko
00050000-561c-fbba-fa81-b40b8a47b3f3	6223	Komen
00050000-561c-fbba-4bf5-e450207e48b3	1218	Komenda
00050000-561c-fbba-b9a0-74aef4ed07de	6000	Koper/Capodistria 
00050000-561c-fbba-3d4c-212b23055b95	6001	Koper/Capodistria - poštni predali
00050000-561c-fbba-a713-a8f62e8aa25e	8282	Koprivnica
00050000-561c-fbba-b565-79b165083c38	5296	Kostanjevica na Krasu
00050000-561c-fbba-31ed-220920532180	8311	Kostanjevica na Krki
00050000-561c-fbba-3e47-427a17002d02	1336	Kostel
00050000-561c-fbba-8486-87d19416cc80	6256	Košana
00050000-561c-fbba-4593-18f23b8c4499	2394	Kotlje
00050000-561c-fbba-37ae-fffe04cbd745	6240	Kozina
00050000-561c-fbba-3e86-b66c48f01b67	3260	Kozje
00050000-561c-fbba-68ef-f389ee1149df	4000	Kranj 
00050000-561c-fbba-c327-ed3332ca819c	4001	Kranj - poštni predali
00050000-561c-fbba-8558-427f51db2342	4280	Kranjska Gora
00050000-561c-fbba-180a-739fd67729d9	1281	Kresnice
00050000-561c-fbba-e023-7e203d51404e	4294	Križe
00050000-561c-fbba-4d8d-2281937d5ac2	9206	Križevci
00050000-561c-fbba-45d2-08a38227222d	9242	Križevci pri Ljutomeru
00050000-561c-fbba-d466-95c024d4b327	1301	Krka
00050000-561c-fbba-d13f-56f3dbd3a584	8296	Krmelj
00050000-561c-fbba-8051-a0a9b38aefc9	4245	Kropa
00050000-561c-fbba-d54e-ca2701cf18bd	8262	Krška vas
00050000-561c-fbba-2535-f9f168e6ef24	8270	Krško
00050000-561c-fbba-6f60-37333977a3e3	9263	Kuzma
00050000-561c-fbba-a4cd-db597c02e6ce	2318	Laporje
00050000-561c-fbba-aefc-2933bf79f5fa	3270	Laško
00050000-561c-fbba-ba06-b485478f60ff	1219	Laze v Tuhinju
00050000-561c-fbba-b86e-a28ae3593bc9	2230	Lenart v Slovenskih goricah
00050000-561c-fbba-577c-8ee841059cd9	9220	Lendava/Lendva
00050000-561c-fbba-f0e2-474399d26535	4248	Lesce
00050000-561c-fbba-45fa-5390dd7c5721	3261	Lesično
00050000-561c-fbba-3ccc-e612eb510642	8273	Leskovec pri Krškem
00050000-561c-fbba-ee85-93bf531426a8	2372	Libeliče
00050000-561c-fbba-0ea1-ed39a33ab77c	2341	Limbuš
00050000-561c-fbba-cb85-34294aadc72c	1270	Litija
00050000-561c-fbba-adc7-bb6c780c4d43	3202	Ljubečna
00050000-561c-fbba-85b4-96270d38c235	1000	Ljubljana 
00050000-561c-fbba-b18e-192aa25ad1fb	1001	Ljubljana - poštni predali
00050000-561c-fbba-d449-0640b155602c	1231	Ljubljana - Črnuče
00050000-561c-fbba-386e-5b5d0dd03506	1261	Ljubljana - Dobrunje
00050000-561c-fbba-b2d9-e4a8e7174795	1260	Ljubljana - Polje
00050000-561c-fbba-9321-2f04ddac2e8e	1210	Ljubljana - Šentvid
00050000-561c-fbba-c2da-59c1387a3602	1211	Ljubljana - Šmartno
00050000-561c-fbba-2da5-8e301653b3a8	3333	Ljubno ob Savinji
00050000-561c-fbba-8bd9-b12f5c9198cd	9240	Ljutomer
00050000-561c-fbba-0e67-cda4413e3f84	3215	Loče
00050000-561c-fbba-95d4-e93b0fd304e1	5231	Log pod Mangartom
00050000-561c-fbba-c85e-66aa8da21a45	1358	Log pri Brezovici
00050000-561c-fbba-1f07-ee7340f93f56	1370	Logatec
00050000-561c-fbba-10c1-08886f0591cf	1371	Logatec
00050000-561c-fbba-4d17-e5ffca973807	1434	Loka pri Zidanem Mostu
00050000-561c-fbba-dd1c-09147610c3d7	3223	Loka pri Žusmu
00050000-561c-fbba-ac0c-d59586053e1c	6219	Lokev
00050000-561c-fbba-cc1e-76470ebd9bda	1318	Loški Potok
00050000-561c-fbba-5d5e-2298dd373405	2324	Lovrenc na Dravskem polju
00050000-561c-fbba-5c82-b9ec3b2d39e0	2344	Lovrenc na Pohorju
00050000-561c-fbba-3321-ff400d1686b9	3334	Luče
00050000-561c-fbba-e0c4-9d25e4d9e273	1225	Lukovica
00050000-561c-fbba-6970-67284ea0d789	9202	Mačkovci
00050000-561c-fbba-8829-734516ada806	2322	Majšperk
00050000-561c-fbba-28ab-f0c312079905	2321	Makole
00050000-561c-fbba-6146-5d74043ffbd7	9243	Mala Nedelja
00050000-561c-fbba-c7d7-3f0dcfc65bb3	2229	Malečnik
00050000-561c-fbba-be26-023a7f069cc2	6273	Marezige
00050000-561c-fbba-15ab-cc2a02370191	2000	Maribor 
00050000-561c-fbba-01c4-ccbfbfde75dd	2001	Maribor - poštni predali
00050000-561c-fbba-60af-9bfe81e6c0db	2206	Marjeta na Dravskem polju
00050000-561c-fbba-1595-edbb01da9520	2281	Markovci
00050000-561c-fbba-89e0-ea0c55c2a795	9221	Martjanci
00050000-561c-fbba-a57b-cc25894b8540	6242	Materija
00050000-561c-fbba-2408-33fef6543ef5	4211	Mavčiče
00050000-561c-fbba-d32e-80861fef9eb5	1215	Medvode
00050000-561c-fbba-7c7b-a4f5dca3221a	1234	Mengeš
00050000-561c-fbba-07a2-d9d3da49dd58	8330	Metlika
00050000-561c-fbba-91c4-f1fced2e1384	2392	Mežica
00050000-561c-fbba-b605-62295fa19a8b	2204	Miklavž na Dravskem polju
00050000-561c-fbba-aa19-cbf0787f9b5a	2275	Miklavž pri Ormožu
00050000-561c-fbba-6ada-0cf8c9a59f8a	5291	Miren
00050000-561c-fbba-142a-aa9827000fc6	8233	Mirna
00050000-561c-fbba-59c4-faa4c0dbd9f0	8216	Mirna Peč
00050000-561c-fbba-e7cf-799a90ac0d5d	2382	Mislinja
00050000-561c-fbba-1f07-dafbf87e2613	4281	Mojstrana
00050000-561c-fbba-4a73-fdfeab7e29a5	8230	Mokronog
00050000-561c-fbba-cf24-92b2a12464e3	1251	Moravče
00050000-561c-fbba-7c9a-6828634248b2	9226	Moravske Toplice
00050000-561c-fbba-5fdd-d360e8a81d22	5216	Most na Soči
00050000-561c-fbba-89ef-cf7988a2acbf	1221	Motnik
00050000-561c-fbba-3691-cbe9c6310336	3330	Mozirje
00050000-561c-fbba-8a10-3b87664846d9	9000	Murska Sobota 
00050000-561c-fbba-1414-ff340abe6d3f	9001	Murska Sobota - poštni predali
00050000-561c-fbba-7ee7-536f369d4a84	2366	Muta
00050000-561c-fbba-7812-e4e5748ce3b4	4202	Naklo
00050000-561c-fbba-df4a-6b1ad3a6969e	3331	Nazarje
00050000-561c-fbba-c9cb-d5b2d9401e77	1357	Notranje Gorice
00050000-561c-fbba-3815-d56cce9e9930	3203	Nova Cerkev
00050000-561c-fbba-895b-283c01f9b50c	5000	Nova Gorica 
00050000-561c-fbba-bd5e-00e32675d1a4	5001	Nova Gorica - poštni predali
00050000-561c-fbba-2800-8152356ce8a3	1385	Nova vas
00050000-561c-fbba-f2d3-4a37ef48c80b	8000	Novo mesto
00050000-561c-fbba-498a-8f0bcf3b128c	8001	Novo mesto - poštni predali
00050000-561c-fbba-caa1-b50c61394b4e	6243	Obrov
00050000-561c-fbba-11f2-ef1258239a2a	9233	Odranci
00050000-561c-fbba-cc26-5c142d83787a	2317	Oplotnica
00050000-561c-fbba-c4c5-9e4b0bb8862a	2312	Orehova vas
00050000-561c-fbba-1681-c23e35e87069	2270	Ormož
00050000-561c-fbba-f411-5164a90240ba	1316	Ortnek
00050000-561c-fbba-2467-d6fc9e46284f	1337	Osilnica
00050000-561c-fbba-3f98-d1519aef3bbf	8222	Otočec
00050000-561c-fbba-5cd1-d247df0db67e	2361	Ožbalt
00050000-561c-fbba-5d40-786d5a3af6f6	2231	Pernica
00050000-561c-fbba-2b30-72cc1ec28413	2211	Pesnica pri Mariboru
00050000-561c-fbba-120e-553142289f17	9203	Petrovci
00050000-561c-fbba-f4c6-276d5c0caae1	3301	Petrovče
00050000-561c-fbba-7226-5018351d2944	6330	Piran/Pirano
00050000-561c-fbba-6152-6757009befbb	8255	Pišece
00050000-561c-fbba-ff5f-ef0531ae613e	6257	Pivka
00050000-561c-fbba-04c5-3824d54edfb0	6232	Planina
00050000-561c-fbba-8f06-4a196b017168	3225	Planina pri Sevnici
00050000-561c-fbba-bbe7-1d1cb0fa6dab	6276	Pobegi
00050000-561c-fbba-d26c-c20d9da4cc78	8312	Podbočje
00050000-561c-fbba-f842-7be8f3bf3e38	5243	Podbrdo
00050000-561c-fbba-4453-b1b4132af034	3254	Podčetrtek
00050000-561c-fbba-a341-8bea02997120	2273	Podgorci
00050000-561c-fbba-91c8-83f279836d72	6216	Podgorje
00050000-561c-fbba-0ae2-cdf8a91dedea	2381	Podgorje pri Slovenj Gradcu
00050000-561c-fbba-76bb-b00d26e2e62d	6244	Podgrad
00050000-561c-fbba-519c-e68f79b9a1a4	1414	Podkum
00050000-561c-fbba-c7f8-d49031e20edc	2286	Podlehnik
00050000-561c-fbba-d2a0-ada8dc45467b	5272	Podnanos
00050000-561c-fbba-09dd-a6702eb88fe0	4244	Podnart
00050000-561c-fbba-757c-b26e1572f1a6	3241	Podplat
00050000-561c-fbba-9471-72ced64fcb24	3257	Podsreda
00050000-561c-fbba-00b1-925ffa01eada	2363	Podvelka
00050000-561c-fbba-9073-4291dad5b22c	2208	Pohorje
00050000-561c-fbba-6141-04b984b59891	2257	Polenšak
00050000-561c-fbba-f06a-3fd9eb7332aa	1355	Polhov Gradec
00050000-561c-fbba-354e-2e285451a897	4223	Poljane nad Škofjo Loko
00050000-561c-fbba-fca6-bc9ac756e9dd	2319	Poljčane
00050000-561c-fbba-12fe-124b30273706	1272	Polšnik
00050000-561c-fbba-d20e-69c3d4f62a16	3313	Polzela
00050000-561c-fbba-02c9-5b6ba35f9442	3232	Ponikva
00050000-561c-fbba-d219-7ca9024c46b4	6320	Portorož/Portorose
00050000-561c-fbba-acbb-534ee8f67f18	6230	Postojna
00050000-561c-fbba-8570-893d48f8d1af	2331	Pragersko
00050000-561c-fbba-c52e-df6c2c6bd386	3312	Prebold
00050000-561c-fbba-b359-f936bfe9e378	4205	Preddvor
00050000-561c-fbba-2a45-195c999a2062	6255	Prem
00050000-561c-fbba-ca3b-cc20c3998383	1352	Preserje
00050000-561c-fbba-5fb9-344ae6e01a2f	6258	Prestranek
00050000-561c-fbba-30f9-0340f02241d3	2391	Prevalje
00050000-561c-fbba-7404-027cac79ccdb	3262	Prevorje
00050000-561c-fbba-c911-28e08b682c77	1276	Primskovo 
00050000-561c-fbba-3330-6f83d9e3cd7a	3253	Pristava pri Mestinju
00050000-561c-fbba-efe4-2224251a70cc	9207	Prosenjakovci/Partosfalva
00050000-561c-fbba-02be-773fdc2ac237	5297	Prvačina
00050000-561c-fbba-2c3b-af735a490860	2250	Ptuj
00050000-561c-fbba-3468-a30e85583a8c	2323	Ptujska Gora
00050000-561c-fbba-e9fe-c19a34e6ded2	9201	Puconci
00050000-561c-fbba-f379-1b6736e0c056	2327	Rače
00050000-561c-fbba-2857-5aa28497bf91	1433	Radeče
00050000-561c-fbba-e76a-8aaa318a6500	9252	Radenci
00050000-561c-fbba-8168-72f3b02f79ae	2360	Radlje ob Dravi
00050000-561c-fbba-9240-e83f1721fe6c	1235	Radomlje
00050000-561c-fbba-aa45-6baac3bb73ce	4240	Radovljica
00050000-561c-fbba-0f09-a74e7b9c1963	8274	Raka
00050000-561c-fbba-72c6-fe87b1f1a42d	1381	Rakek
00050000-561c-fbba-1ae0-3b6b8064699c	4283	Rateče - Planica
00050000-561c-fbba-074b-dbf22f228809	2390	Ravne na Koroškem
00050000-561c-fbba-1acc-153d02b02f21	9246	Razkrižje
00050000-561c-fbba-8eaf-992a0eac2692	3332	Rečica ob Savinji
00050000-561c-fbba-fd16-a67db676f407	5292	Renče
00050000-561c-fbba-7512-ee3e003720a1	1310	Ribnica
00050000-561c-fbba-51a1-416e73287d56	2364	Ribnica na Pohorju
00050000-561c-fbba-651b-17965bb41abe	3272	Rimske Toplice
00050000-561c-fbba-7120-361cfec83f5c	1314	Rob
00050000-561c-fbba-088e-8b82d5c7010d	5215	Ročinj
00050000-561c-fbba-022a-b49bf513547f	3250	Rogaška Slatina
00050000-561c-fbba-3fca-14284a9656a8	9262	Rogašovci
00050000-561c-fbba-e33e-129b07fe9a47	3252	Rogatec
00050000-561c-fbba-c5da-70da6e04c1c4	1373	Rovte
00050000-561c-fbba-cf3d-39fb16ce4d30	2342	Ruše
00050000-561c-fbba-d879-d6e1889f5a1f	1282	Sava
00050000-561c-fbba-a369-598bf9e5ad0d	6333	Sečovlje/Sicciole
00050000-561c-fbba-d0d2-5fddc06b4d04	4227	Selca
00050000-561c-fbba-b2bb-c32d807b8cd8	2352	Selnica ob Dravi
00050000-561c-fbba-1cde-77b05c0b3fa7	8333	Semič
00050000-561c-fbba-d637-0c0b59e14b7f	8281	Senovo
00050000-561c-fbba-b877-8987ae345190	6224	Senožeče
00050000-561c-fbba-f665-b9dfd2f1473e	8290	Sevnica
00050000-561c-fbba-fe1b-972415b41f41	6210	Sežana
00050000-561c-fbba-c4c8-eb70c7decc98	2214	Sladki Vrh
00050000-561c-fbba-cc62-c8c91554b1ab	5283	Slap ob Idrijci
00050000-561c-fbba-f67d-ef4173220bbf	2380	Slovenj Gradec
00050000-561c-fbba-f00d-48f922a51f82	2310	Slovenska Bistrica
00050000-561c-fbba-37d2-f703f97006e0	3210	Slovenske Konjice
00050000-561c-fbba-0c09-0d75efbbd58d	1216	Smlednik
00050000-561c-fbba-d2e2-5e201f55e663	5232	Soča
00050000-561c-fbba-657c-34c4ce93912f	1317	Sodražica
00050000-561c-fbba-ed1c-f76be0bf2c97	3335	Solčava
00050000-561c-fbba-1307-4fa999b9f4ec	5250	Solkan
00050000-561c-fbba-cabc-04bf7f17c01c	4229	Sorica
00050000-561c-fbba-b32d-959e38f9cc65	4225	Sovodenj
00050000-561c-fbba-9379-ded516c1f5bc	5281	Spodnja Idrija
00050000-561c-fbba-9991-0ec8af3aad83	2241	Spodnji Duplek
00050000-561c-fbba-a0a4-326368f15e26	9245	Spodnji Ivanjci
00050000-561c-fbba-a967-dbad22ebbe62	2277	Središče ob Dravi
00050000-561c-fbba-8bb2-cbc95f68e6cc	4267	Srednja vas v Bohinju
00050000-561c-fbba-068a-421bbd5bf8e6	8256	Sromlje 
00050000-561c-fbba-eb60-18ff6bf21d15	5224	Srpenica
00050000-561c-fbba-d3fe-5f92cbce3638	1242	Stahovica
00050000-561c-fbba-46f6-6c2b1200bad2	1332	Stara Cerkev
00050000-561c-fbba-09dc-28ca8afae6d2	8342	Stari trg ob Kolpi
00050000-561c-fbba-2285-40e1941dfcc3	1386	Stari trg pri Ložu
00050000-561c-fbba-120e-2e17ce8bf5cf	2205	Starše
00050000-561c-fbba-a732-74aab70b2895	2289	Stoperce
00050000-561c-fbba-aac9-c4c90d601dba	8322	Stopiče
00050000-561c-fbba-71b8-812e19bc1ea9	3206	Stranice
00050000-561c-fbba-adf4-11176d91d282	8351	Straža
00050000-561c-fbba-43fd-01f4bf0e3b0f	1313	Struge
00050000-561c-fbba-a314-8f1e922297d2	8293	Studenec
00050000-561c-fbba-2a43-eeeaa3937698	8331	Suhor
00050000-561c-fbba-fbc1-e3b798d9ab5e	2233	Sv. Ana v Slovenskih goricah
00050000-561c-fbba-bb3b-151ede5bcfae	2235	Sv. Trojica v Slovenskih goricah
00050000-561c-fbba-34ba-2a3bc22d393d	2353	Sveti Duh na Ostrem Vrhu
00050000-561c-fbba-c139-acb61d9d31e8	9244	Sveti Jurij ob Ščavnici
00050000-561c-fbba-3c34-40d89953c3c9	3264	Sveti Štefan
00050000-561c-fbba-8b2c-e3992364493d	2258	Sveti Tomaž
00050000-561c-fbba-6654-88625d5f7666	9204	Šalovci
00050000-561c-fbba-5de6-c95717a63e16	5261	Šempas
00050000-561c-fbba-1d33-96c2319a948a	5290	Šempeter pri Gorici
00050000-561c-fbba-cfb6-7498b86adf4f	3311	Šempeter v Savinjski dolini
00050000-561c-fbba-84a7-46b590dd725b	4208	Šenčur
00050000-561c-fbba-4736-db8c7ba61190	2212	Šentilj v Slovenskih goricah
00050000-561c-fbba-ccf7-78df82a5bb8d	8297	Šentjanž
00050000-561c-fbba-ff7f-706f235ed2a8	2373	Šentjanž pri Dravogradu
00050000-561c-fbba-ae02-ea3d0b92abf1	8310	Šentjernej
00050000-561c-fbba-1dc5-16a125ff426c	3230	Šentjur
00050000-561c-fbba-b97d-ec9d49621138	3271	Šentrupert
00050000-561c-fbba-8c60-e5177bf478fa	8232	Šentrupert
00050000-561c-fbba-10bf-7fd4ec4f6f3a	1296	Šentvid pri Stični
00050000-561c-fbba-277a-c96463a7b93d	8275	Škocjan
00050000-561c-fbba-bcf9-23c15f930e28	6281	Škofije
00050000-561c-fbba-5830-86c5c5ff9418	4220	Škofja Loka
00050000-561c-fbba-91cb-3db006621601	3211	Škofja vas
00050000-561c-fbba-a0b4-abfb0eb20437	1291	Škofljica
00050000-561c-fbba-6f21-a7337b60fedc	6274	Šmarje
00050000-561c-fbba-b2ef-9967b750b1ba	1293	Šmarje - Sap
00050000-561c-fbba-1a38-086bb87617f9	3240	Šmarje pri Jelšah
00050000-561c-fbba-b5a7-5a8c32de7dcf	8220	Šmarješke Toplice
00050000-561c-fbba-41c6-e3660f377f2c	2315	Šmartno na Pohorju
00050000-561c-fbba-12df-9e66216f782b	3341	Šmartno ob Dreti
00050000-561c-fbba-b660-db90277fc81f	3327	Šmartno ob Paki
00050000-561c-fbba-a5a5-14165e3be65d	1275	Šmartno pri Litiji
00050000-561c-fbba-717d-4932beab675e	2383	Šmartno pri Slovenj Gradcu
00050000-561c-fbba-48c4-4feb0c76ab87	3201	Šmartno v Rožni dolini
00050000-561c-fbba-b830-f7378f4c9f8b	3325	Šoštanj
00050000-561c-fbba-1dff-e72ae479df64	6222	Štanjel
00050000-561c-fbba-2fa6-5f38f22f8639	3220	Štore
00050000-561c-fbba-2a2b-452eecf8f3f5	3304	Tabor
00050000-561c-fbba-00bc-5ad400dae9c2	3221	Teharje
00050000-561c-fbba-9af1-5d24cb673a8f	9251	Tišina
00050000-561c-fbba-5867-a743cdfdc38d	5220	Tolmin
00050000-561c-fbba-e126-1a3860e7c845	3326	Topolšica
00050000-561c-fbba-902c-20995670d96b	2371	Trbonje
00050000-561c-fbba-4696-cf0c545851b8	1420	Trbovlje
00050000-561c-fbba-8202-8ff0b5886704	8231	Trebelno 
00050000-561c-fbba-178f-7d39c7339131	8210	Trebnje
00050000-561c-fbba-18aa-9411da3352d1	5252	Trnovo pri Gorici
00050000-561c-fbba-9a73-3fc40cc2e8d8	2254	Trnovska vas
00050000-561c-fbba-7137-ca6b5b63525c	1222	Trojane
00050000-561c-fbba-c353-d0a8bde71d85	1236	Trzin
00050000-561c-fbba-dce7-f04e8ff21092	4290	Tržič
00050000-561c-fbba-8033-0857c4074c00	8295	Tržišče
00050000-561c-fbba-d15e-6645bdb2321e	1311	Turjak
00050000-561c-fbba-3c44-4896789faa4d	9224	Turnišče
00050000-561c-fbba-1ac2-db4dd015583b	8323	Uršna sela
00050000-561c-fbba-339d-498e1fee7f2e	1252	Vače
00050000-561c-fbba-9406-0b9478835c82	3320	Velenje 
00050000-561c-fbba-b549-4a60952f8346	3322	Velenje - poštni predali
00050000-561c-fbba-d143-c2a82f779fe3	8212	Velika Loka
00050000-561c-fbba-f972-60a48a53a899	2274	Velika Nedelja
00050000-561c-fbba-1d86-55c12722f00a	9225	Velika Polana
00050000-561c-fbba-a708-d36c9cc79583	1315	Velike Lašče
00050000-561c-fbba-5bcf-92a0d24a3fd5	8213	Veliki Gaber
00050000-561c-fbba-ebc1-1b6c768ff42f	9241	Veržej
00050000-561c-fbba-93dd-e54ee0e1a95d	1312	Videm - Dobrepolje
00050000-561c-fbba-fe2f-fdb636404509	2284	Videm pri Ptuju
00050000-561c-fbba-13ab-763b2c1d48dd	8344	Vinica
00050000-561c-fbba-bd67-17d91cd82980	5271	Vipava
00050000-561c-fbba-bbd5-1076cf4442ef	4212	Visoko
00050000-561c-fbba-6ca6-06161a3c2e7b	1294	Višnja Gora
00050000-561c-fbba-bd15-06b86d5c4a56	3205	Vitanje
00050000-561c-fbba-3d28-ca6903c42cad	2255	Vitomarci
00050000-561c-fbba-aa6c-67202d421222	1217	Vodice
00050000-561c-fbba-ac73-0587612fce3e	3212	Vojnik\t
00050000-561c-fbba-2fd8-90328b0add78	5293	Volčja Draga
00050000-561c-fbba-9555-7688cc08f237	2232	Voličina
00050000-561c-fbba-9060-f4de36d5ea3d	3305	Vransko
00050000-561c-fbba-5054-d23abbfd55eb	6217	Vremski Britof
00050000-561c-fbba-698d-d0d7c2615559	1360	Vrhnika
00050000-561c-fbba-c271-1308d7be91bb	2365	Vuhred
00050000-561c-fbba-1d31-492ddf4f2b98	2367	Vuzenica
00050000-561c-fbba-48a3-9289466c6f81	8292	Zabukovje 
00050000-561c-fbba-cb20-98db48317562	1410	Zagorje ob Savi
00050000-561c-fbba-f485-f2d0fb03ebdc	1303	Zagradec
00050000-561c-fbba-0470-faa8a38667d1	2283	Zavrč
00050000-561c-fbba-f9f0-ce4c0bd71b17	8272	Zdole 
00050000-561c-fbba-701e-2bad54d2bb3c	4201	Zgornja Besnica
00050000-561c-fbba-ec2d-abaf0ef6818a	2242	Zgornja Korena
00050000-561c-fbba-a1c9-f86744de04dd	2201	Zgornja Kungota
00050000-561c-fbba-590a-dc3d2a70e1d9	2316	Zgornja Ložnica
00050000-561c-fbba-546f-53f8cd74003a	2314	Zgornja Polskava
00050000-561c-fbba-c445-f930fc0e9b3b	2213	Zgornja Velka
00050000-561c-fbba-93f1-d4a67ae3050f	4247	Zgornje Gorje
00050000-561c-fbba-2077-de46cec9c953	4206	Zgornje Jezersko
00050000-561c-fbba-2a20-248b612294d2	2285	Zgornji Leskovec
00050000-561c-fbba-f2bf-0d1c56b522ee	1432	Zidani Most
00050000-561c-fbba-8fcf-02ed3ace94cc	3214	Zreče
00050000-561c-fbba-2afd-c52e288e7092	4209	Žabnica
00050000-561c-fbba-985c-1cc2c14c77f2	3310	Žalec
00050000-561c-fbba-7cf0-5eb9a6f518be	4228	Železniki
00050000-561c-fbba-a3e3-9ce299b7898b	2287	Žetale
00050000-561c-fbba-eb17-d958b9dc7511	4226	Žiri
00050000-561c-fbba-2cdf-7baf41fa4620	4274	Žirovnica
00050000-561c-fbba-5c6c-04eb385abbe6	8360	Žužemberk
\.


--
-- TOC entry 3067 (class 0 OID 21845379)
-- Dependencies: 233
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 21844972)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 21844752)
-- Dependencies: 187
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-561c-fbbc-d870-e8a107b4020b	00080000-561c-fbbc-63ea-229fd105a91a	\N	00040000-561c-fbba-17b9-da6b05115150	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-561c-fbbc-fbe8-1214e7e71fdf	00080000-561c-fbbc-63ea-229fd105a91a	\N	00040000-561c-fbba-17b9-da6b05115150	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-561c-fbbc-5401-67f2649101e7	00080000-561c-fbbc-fa98-a21c0b1f2825	\N	00040000-561c-fbba-17b9-da6b05115150	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3029 (class 0 OID 21844856)
-- Dependencies: 195
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 21844984)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3068 (class 0 OID 21845393)
-- Dependencies: 234
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3069 (class 0 OID 21845403)
-- Dependencies: 235
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-561c-fbbc-6f7e-da47d8bd002a	00080000-561c-fbbc-3cff-d4dfee5deea1	0987	AK
00190000-561c-fbbc-7e63-cbee6718eb1a	00080000-561c-fbbc-fa98-a21c0b1f2825	0989	AK
00190000-561c-fbbc-8b48-336e2fa57869	00080000-561c-fbbc-3595-136d1e385222	0986	AK
00190000-561c-fbbc-69f5-86298f2ec4e3	00080000-561c-fbbc-f35a-f3b71d35ace1	0984	AK
00190000-561c-fbbc-5f10-950dd1bc922b	00080000-561c-fbbc-16dc-0eb0ba027094	0983	AK
00190000-561c-fbbc-c1b4-436828d438e7	00080000-561c-fbbc-1bb6-09743820f11f	0982	AK
00190000-561c-fbbe-3824-80b1d39a2251	00080000-561c-fbbe-221b-796142af9ddc	1001	AK
\.


--
-- TOC entry 3066 (class 0 OID 21845318)
-- Dependencies: 232
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-561c-fbbc-6211-c8d8ba8b52bd	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3070 (class 0 OID 21845411)
-- Dependencies: 236
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3046 (class 0 OID 21845013)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-561c-fbbc-c5eb-dcaa8217b98d	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-561c-fbbc-276b-34bf1b63112e	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-561c-fbbc-f9ae-edd1de593ec7	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-561c-fbbc-d158-376481af07f9	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-561c-fbbc-ebd0-08bf6287927f	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-561c-fbbc-9135-15c8f0de5a43	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-561c-fbbc-24a0-a0c183fe83c4	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3038 (class 0 OID 21844957)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 21844947)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3059 (class 0 OID 21845157)
-- Dependencies: 225
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 21845087)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 21844830)
-- Dependencies: 193
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 21844615)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-561c-fbbe-221b-796142af9ddc	00010000-561c-fbbb-4fbd-a7e4836d7500	2015-10-13 14:40:30	INS	a:0:{}
2	App\\Entity\\Option	00000000-561c-fbbe-d427-fc6f44cbd413	00010000-561c-fbbb-4fbd-a7e4836d7500	2015-10-13 14:40:30	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-561c-fbbe-3824-80b1d39a2251	00010000-561c-fbbb-4fbd-a7e4836d7500	2015-10-13 14:40:30	INS	a:0:{}
\.


--
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3047 (class 0 OID 21845026)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 21844653)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-561c-fbba-e7ca-c85524157521	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-561c-fbba-56d4-f018fde0356e	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-561c-fbba-06b2-9ba0a10dc348	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-561c-fbba-c837-7e0e57f4f8d4	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-561c-fbbb-8d11-1d4d3f496e05	planer	Planer dogodkov v koledarju	t
00020000-561c-fbbb-ed87-ecae852bb447	kadrovska	Kadrovska služba	t
00020000-561c-fbbb-5b36-59cd87502691	arhivar	Ažuriranje arhivalij	t
00020000-561c-fbbb-4409-526787ebd351	igralec	Igralec	t
00020000-561c-fbbb-5e75-b27ddc5321a1	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-561c-fbbc-8bde-7b17f503b0e0	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3011 (class 0 OID 21844637)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-561c-fbbb-027d-e35da84d9b48	00020000-561c-fbba-06b2-9ba0a10dc348
00010000-561c-fbbb-4fbd-a7e4836d7500	00020000-561c-fbba-06b2-9ba0a10dc348
00010000-561c-fbbc-ad2f-9027be7e81b1	00020000-561c-fbbc-8bde-7b17f503b0e0
\.


--
-- TOC entry 3049 (class 0 OID 21845040)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3041 (class 0 OID 21844978)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 21844924)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 21844602)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-561c-fbba-1f81-dabee18ea2ac	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-561c-fbba-2c87-2c1f20746db2	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-561c-fbba-ac79-349afbe8c3c0	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-561c-fbba-e2bf-e3a4232ba761	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-561c-fbba-c530-b566686a4fe3	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3006 (class 0 OID 21844594)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-561c-fbba-465e-d7dcebee305a	00230000-561c-fbba-e2bf-e3a4232ba761	popa
00240000-561c-fbba-27df-30d51c2da286	00230000-561c-fbba-e2bf-e3a4232ba761	oseba
00240000-561c-fbba-9dd2-4dbc7cd4df6f	00230000-561c-fbba-e2bf-e3a4232ba761	sezona
00240000-561c-fbba-2f82-2f2beefc7004	00230000-561c-fbba-2c87-2c1f20746db2	prostor
00240000-561c-fbba-30e2-380c04ff8f49	00230000-561c-fbba-e2bf-e3a4232ba761	besedilo
00240000-561c-fbba-5cd3-275e5ecaa4eb	00230000-561c-fbba-e2bf-e3a4232ba761	uprizoritev
00240000-561c-fbba-ec0d-02ed9d3a1bd7	00230000-561c-fbba-e2bf-e3a4232ba761	funkcija
00240000-561c-fbba-3458-a645db787411	00230000-561c-fbba-e2bf-e3a4232ba761	tipfunkcije
00240000-561c-fbba-3052-0113c6a962e8	00230000-561c-fbba-e2bf-e3a4232ba761	alternacija
00240000-561c-fbba-4013-bb3d3b316ab2	00230000-561c-fbba-1f81-dabee18ea2ac	pogodba
00240000-561c-fbba-9ca2-2f6e89b1498f	00230000-561c-fbba-e2bf-e3a4232ba761	zaposlitev
00240000-561c-fbba-af9d-bf7565aebd6d	00230000-561c-fbba-e2bf-e3a4232ba761	zvrstuprizoritve
00240000-561c-fbba-d9a9-22eaf44bcf9e	00230000-561c-fbba-1f81-dabee18ea2ac	programdela
00240000-561c-fbba-4fb8-6e5c69c58823	00230000-561c-fbba-e2bf-e3a4232ba761	zapis
\.


--
-- TOC entry 3005 (class 0 OID 21844589)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
fc2bf074-83e1-43dd-b200-b6e1960fa7c5	00240000-561c-fbba-465e-d7dcebee305a	0	1001
\.


--
-- TOC entry 3055 (class 0 OID 21845104)
-- Dependencies: 221
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-561c-fbbc-c6af-3a5563bb4e45	000e0000-561c-fbbc-5fac-8f28ab2af300	00080000-561c-fbbc-63ea-229fd105a91a	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-561c-fbba-4182-d09767b5e42f
00270000-561c-fbbc-20e3-8539b108a19c	000e0000-561c-fbbc-5fac-8f28ab2af300	00080000-561c-fbbc-63ea-229fd105a91a	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-561c-fbba-4182-d09767b5e42f
\.


--
-- TOC entry 3019 (class 0 OID 21844724)
-- Dependencies: 185
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 21844934)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-561c-fbbd-7ccd-8d52b8f195c7	00180000-561c-fbbc-4c4b-4c865e64cb18	000c0000-561c-fbbc-9fcf-f9411e2941ea	00090000-561c-fbbc-28ff-e6aac4895e35	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561c-fbbd-3159-1782ed27125f	00180000-561c-fbbc-4c4b-4c865e64cb18	000c0000-561c-fbbc-af26-2d648f684ba0	00090000-561c-fbbc-ea55-6d3ec389ce67	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561c-fbbd-9373-80c1f28e595d	00180000-561c-fbbc-4c4b-4c865e64cb18	000c0000-561c-fbbc-82d8-6d3799958744	00090000-561c-fbbc-5e13-d81418afff68	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561c-fbbd-a5ce-6b77278692a0	00180000-561c-fbbc-4c4b-4c865e64cb18	000c0000-561c-fbbc-19a6-f200b5c209c7	00090000-561c-fbbc-b42e-3f9040c2ada5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561c-fbbd-3d00-a9587ee993ec	00180000-561c-fbbc-4c4b-4c865e64cb18	000c0000-561c-fbbc-905e-6186e37cbc9e	00090000-561c-fbbc-92f2-be3b1b618dcc	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561c-fbbd-1e13-b6e1ebef1529	00180000-561c-fbbc-0468-88294ab404cb	\N	00090000-561c-fbbc-92f2-be3b1b618dcc	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3058 (class 0 OID 21845145)
-- Dependencies: 224
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-561c-fbba-5dc4-2a52ccf200b6	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-561c-fbba-d953-fac57116f12c	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-561c-fbba-b99d-6d18221a1582	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-561c-fbba-789f-31f4b1e31487	04	Režija	Režija	Režija	umetnik	30
000f0000-561c-fbba-f54a-17430b19a4c2	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-561c-fbba-6453-5803063d498b	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-561c-fbba-37ff-4c91e6004c08	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-561c-fbba-37fd-1801948bbc23	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-561c-fbba-ed19-ecc485dbde1d	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-561c-fbba-db29-8b66e6d257d7	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-561c-fbba-a855-c66f60c02a8f	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-561c-fbba-664e-1d238b06dc74	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-561c-fbba-3726-770acd682b25	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-561c-fbba-d604-530910559d8f	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-561c-fbba-d6b4-6837f871e955	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-561c-fbba-78fa-ed364bcaf3e8	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-561c-fbba-63fc-0f458f4189c9	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-561c-fbba-c212-3398c8d858d1	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3016 (class 0 OID 21844679)
-- Dependencies: 182
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, ime, opis, sort) FROM stdin;
00400000-561c-fbbc-fac8-25ffb2091b9f	šola	osnovna ali srednja šola	1
00400000-561c-fbbc-b282-f0becc1215ca	gledalec	gledalec, ki ima abonma ali podobno	2
00400000-561c-fbbc-ebcb-4ce8934e0096	sponzor	sponzor dogodkov	3
\.


--
-- TOC entry 3071 (class 0 OID 21845422)
-- Dependencies: 237
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-561c-fbba-7608-9ff7ea129432	01	Velika predstava	f	1.00	1.00
002b0000-561c-fbba-6907-9d9de94942f5	02	Mala predstava	f	0.50	0.50
002b0000-561c-fbba-7c18-654898471b0f	03	Mala koprodukcija	t	0.40	1.00
002b0000-561c-fbba-a2c9-2b136374b50a	04	Srednja koprodukcija	t	0.70	2.00
002b0000-561c-fbba-0fc4-2983ba80c0ae	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3024 (class 0 OID 21844787)
-- Dependencies: 190
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 21844624)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-561c-fbbb-4fbd-a7e4836d7500	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROIpG0ER.phnrK4rxGoU2xnsDC0aXk6R6	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-561c-fbbc-7c76-bbabfe3489c4	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-561c-fbbc-354e-a0077120ae82	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-561c-fbbc-268c-b83b594bd06c	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-561c-fbbc-d840-f60a47a71e07	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-561c-fbbc-f271-034364ddca84	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-561c-fbbc-6803-07e8d3f122c0	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-561c-fbbc-bf81-f91ae2bc5319	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-561c-fbbc-059b-f14bd8ad0c8c	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-561c-fbbc-8baf-c4dadc237b78	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-561c-fbbc-ad2f-9027be7e81b1	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-561c-fbbb-027d-e35da84d9b48	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3062 (class 0 OID 21845195)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-561c-fbbc-e4be-8a851886d8a7	00160000-561c-fbbc-b12e-67b5aaccff43	\N	00140000-561c-fbba-cb71-a06230eb6d9d	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-561c-fbbc-ebd0-08bf6287927f
000e0000-561c-fbbc-5fac-8f28ab2af300	00160000-561c-fbbc-0209-bbe935371a4b	\N	00140000-561c-fbba-9a93-38e64e334403	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-561c-fbbc-9135-15c8f0de5a43
000e0000-561c-fbbc-11c9-f59c3bfef5fa	\N	\N	00140000-561c-fbba-9a93-38e64e334403	00190000-561c-fbbc-6f7e-da47d8bd002a	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-561c-fbbc-ebd0-08bf6287927f
000e0000-561c-fbbc-389e-c0819d2b2aa9	\N	\N	00140000-561c-fbba-9a93-38e64e334403	00190000-561c-fbbc-6f7e-da47d8bd002a	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-561c-fbbc-ebd0-08bf6287927f
000e0000-561c-fbbc-99d5-838bac5c71cc	\N	\N	00140000-561c-fbba-9a93-38e64e334403	00190000-561c-fbbc-6f7e-da47d8bd002a	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-561c-fbbc-c5eb-dcaa8217b98d
000e0000-561c-fbbc-2f81-64cd7ee35227	\N	\N	00140000-561c-fbba-9a93-38e64e334403	00190000-561c-fbbc-6f7e-da47d8bd002a	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-561c-fbbc-c5eb-dcaa8217b98d
\.


--
-- TOC entry 3031 (class 0 OID 21844878)
-- Dependencies: 197
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-561c-fbbc-1d1f-810bfd728c04	000e0000-561c-fbbc-5fac-8f28ab2af300	\N	1	
00200000-561c-fbbc-492c-8cb0e19faafa	000e0000-561c-fbbc-5fac-8f28ab2af300	\N	2	
00200000-561c-fbbc-643f-64f42d0b2dd8	000e0000-561c-fbbc-5fac-8f28ab2af300	\N	3	
00200000-561c-fbbc-3e2f-8e3783214108	000e0000-561c-fbbc-5fac-8f28ab2af300	\N	4	
00200000-561c-fbbc-672f-495ae8b7714f	000e0000-561c-fbbc-5fac-8f28ab2af300	\N	5	
\.


--
-- TOC entry 3045 (class 0 OID 21845005)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 21845118)
-- Dependencies: 222
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-561c-fbba-3616-39e0300f56ae	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-561c-fbba-c4e5-35a7ad649dbd	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-561c-fbba-7397-35d8ea50aa3c	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-561c-fbba-e638-bd7f5feb40c9	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-561c-fbba-67c6-0d5f77751570	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-561c-fbba-2327-da1d40589ad2	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-561c-fbba-35f0-01ef2e0a70c2	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-561c-fbba-3ab0-630d097f0f68	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-561c-fbba-4182-d09767b5e42f	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-561c-fbba-2f24-ef5dc999f600	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-561c-fbba-5ec4-42340139198d	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-561c-fbba-2d7c-f126b0eefadb	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-561c-fbba-1215-a2d325b3e2c2	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-561c-fbba-e968-7f890690c885	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-561c-fbba-6871-bac4a7f53cd5	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-561c-fbba-93c4-acafe5ca0027	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-561c-fbba-5066-80fe0f2f442d	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-561c-fbba-ad75-2cd8f6db92bb	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-561c-fbba-7a70-efbd344b64cb	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-561c-fbba-a560-35a8f7e3e94c	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-561c-fbba-d934-ddaab5ca26ce	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-561c-fbba-1676-ff148a91d6a2	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-561c-fbba-a0fa-2bf8ea3ae830	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-561c-fbba-0b0a-3345151efd3e	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-561c-fbba-ff86-bacd8a5c6523	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-561c-fbba-4c84-df5e4be97a8b	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-561c-fbba-b8f9-8349411bd3df	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-561c-fbba-934d-dc0f91a5df87	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3074 (class 0 OID 21845469)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3073 (class 0 OID 21845441)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3075 (class 0 OID 21845481)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3052 (class 0 OID 21845077)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-561c-fbbc-c702-7fdec5459221	00090000-561c-fbbc-ea55-6d3ec389ce67	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-561c-fbbc-812e-71f3a0d478d0	00090000-561c-fbbc-5e13-d81418afff68	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-561c-fbbc-424a-7edbee2fc2ee	00090000-561c-fbbc-7e70-1d5ae27fd7bc	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-561c-fbbc-b3dd-0727dfe23632	00090000-561c-fbbc-afba-ac574e8b8fe0	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-561c-fbbc-4041-095196b8e055	00090000-561c-fbbc-28ff-e6aac4895e35	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-561c-fbbc-5cfb-1f704457706a	00090000-561c-fbbc-8f95-249daca62d15	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 3033 (class 0 OID 21844913)
-- Dependencies: 199
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3061 (class 0 OID 21845185)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-561c-fbba-cb71-a06230eb6d9d	01	Drama	drama (SURS 01)
00140000-561c-fbba-1523-28c03a666e66	02	Opera	opera (SURS 02)
00140000-561c-fbba-2001-4873cb4df1fc	03	Balet	balet (SURS 03)
00140000-561c-fbba-ce66-3be6111870d7	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-561c-fbba-5cd5-4fbe4a5d1faf	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-561c-fbba-9a93-38e64e334403	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-561c-fbba-9398-5b71b70b166f	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3051 (class 0 OID 21845067)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2534 (class 2606 OID 21844678)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 21845244)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 21845234)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 21845101)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 21845143)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 21845521)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 21844902)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 21844923)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 21845439)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 21844813)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 21845312)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 21845063)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 21844876)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 21844851)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 21844827)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 21844970)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 21845498)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 21845505)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2791 (class 2606 OID 21845529)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 21729918)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2649 (class 2606 OID 21844997)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 21844785)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 21844696)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 21844720)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 21844667)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2525 (class 2606 OID 21844652)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 21845003)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 21845039)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 21845180)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 21844749)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 21844773)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 21845391)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 21844976)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 21844763)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 21844864)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 21844988)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 21845400)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 21845408)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 21845378)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 21845420)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 21845021)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 21844961)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 21844952)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 21845167)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 21845094)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 21844839)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 21844623)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 21845030)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 21844641)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2527 (class 2606 OID 21844661)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 21845048)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 21844983)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 21844932)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 21844611)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 21844599)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 21844593)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 21845114)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 21844729)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 21844943)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 21845154)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 21844686)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 21845432)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 21844798)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 21844636)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 21845213)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 21844886)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 21845011)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 21845126)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 21845479)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 21845463)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 21845487)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 21845085)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 21844917)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 21845193)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 21845075)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 1259 OID 21844911)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2602 (class 1259 OID 21844912)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2603 (class 1259 OID 21844910)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2604 (class 1259 OID 21844909)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2605 (class 1259 OID 21844908)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2691 (class 1259 OID 21845115)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2692 (class 1259 OID 21845116)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2693 (class 1259 OID 21845117)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2777 (class 1259 OID 21845500)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2778 (class 1259 OID 21845499)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2551 (class 1259 OID 21844751)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2650 (class 1259 OID 21845004)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2764 (class 1259 OID 21845467)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2765 (class 1259 OID 21845466)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2766 (class 1259 OID 21845468)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2767 (class 1259 OID 21845465)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2768 (class 1259 OID 21845464)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2644 (class 1259 OID 21844990)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2645 (class 1259 OID 21844989)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2596 (class 1259 OID 21844887)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2674 (class 1259 OID 21845064)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2675 (class 1259 OID 21845066)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2676 (class 1259 OID 21845065)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2576 (class 1259 OID 21844829)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2577 (class 1259 OID 21844828)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2755 (class 1259 OID 21845421)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2707 (class 1259 OID 21845182)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2708 (class 1259 OID 21845183)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2709 (class 1259 OID 21845184)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2774 (class 1259 OID 21845488)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2716 (class 1259 OID 21845218)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2717 (class 1259 OID 21845215)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2718 (class 1259 OID 21845219)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2719 (class 1259 OID 21845217)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2720 (class 1259 OID 21845216)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2566 (class 1259 OID 21844800)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2567 (class 1259 OID 21844799)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2542 (class 1259 OID 21844723)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2662 (class 1259 OID 21845031)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2529 (class 1259 OID 21844668)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2530 (class 1259 OID 21844669)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2667 (class 1259 OID 21845051)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2668 (class 1259 OID 21845050)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2669 (class 1259 OID 21845049)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2589 (class 1259 OID 21844865)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2590 (class 1259 OID 21844866)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2509 (class 1259 OID 21844601)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2624 (class 1259 OID 21844956)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2625 (class 1259 OID 21844954)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2626 (class 1259 OID 21844953)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2627 (class 1259 OID 21844955)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2520 (class 1259 OID 21844642)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2521 (class 1259 OID 21844643)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2653 (class 1259 OID 21845012)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2787 (class 1259 OID 21845522)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2689 (class 1259 OID 21845103)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2690 (class 1259 OID 21845102)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2788 (class 1259 OID 21845530)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2789 (class 1259 OID 21845531)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2639 (class 1259 OID 21844977)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2683 (class 1259 OID 21845095)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2684 (class 1259 OID 21845096)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2737 (class 1259 OID 21845317)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2738 (class 1259 OID 21845316)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2739 (class 1259 OID 21845313)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2740 (class 1259 OID 21845314)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2741 (class 1259 OID 21845315)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2555 (class 1259 OID 21844765)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2556 (class 1259 OID 21844764)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2557 (class 1259 OID 21844766)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2656 (class 1259 OID 21845025)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2657 (class 1259 OID 21845024)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2747 (class 1259 OID 21845401)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2748 (class 1259 OID 21845402)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2730 (class 1259 OID 21845248)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2731 (class 1259 OID 21845249)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2732 (class 1259 OID 21845246)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2733 (class 1259 OID 21845247)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2680 (class 1259 OID 21845086)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2630 (class 1259 OID 21844965)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2631 (class 1259 OID 21844964)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2632 (class 1259 OID 21844962)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2633 (class 1259 OID 21844963)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2726 (class 1259 OID 21845236)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2727 (class 1259 OID 21845235)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2580 (class 1259 OID 21844840)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2583 (class 1259 OID 21844854)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2584 (class 1259 OID 21844853)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2585 (class 1259 OID 21844852)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2586 (class 1259 OID 21844855)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2595 (class 1259 OID 21844877)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2744 (class 1259 OID 21845392)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2763 (class 1259 OID 21845440)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2781 (class 1259 OID 21845506)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2782 (class 1259 OID 21845507)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2538 (class 1259 OID 21844698)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2539 (class 1259 OID 21844697)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2547 (class 1259 OID 21844730)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2548 (class 1259 OID 21844731)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2611 (class 1259 OID 21844918)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2619 (class 1259 OID 21844946)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2620 (class 1259 OID 21844945)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2621 (class 1259 OID 21844944)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2606 (class 1259 OID 21844904)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2607 (class 1259 OID 21844905)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2608 (class 1259 OID 21844903)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2609 (class 1259 OID 21844907)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2610 (class 1259 OID 21844906)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2554 (class 1259 OID 21844750)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 21844687)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2572 (class 1259 OID 21844814)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2573 (class 1259 OID 21844816)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2574 (class 1259 OID 21844815)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2575 (class 1259 OID 21844817)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2638 (class 1259 OID 21844971)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2712 (class 1259 OID 21845181)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 21845214)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2703 (class 1259 OID 21845155)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 21845156)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2545 (class 1259 OID 21844721)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2546 (class 1259 OID 21844722)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2677 (class 1259 OID 21845076)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2515 (class 1259 OID 21844612)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2565 (class 1259 OID 21844786)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2512 (class 1259 OID 21844600)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2760 (class 1259 OID 21845433)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2660 (class 1259 OID 21845023)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2661 (class 1259 OID 21845022)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2734 (class 1259 OID 21845245)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2562 (class 1259 OID 21844774)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2713 (class 1259 OID 21845194)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2771 (class 1259 OID 21845480)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2753 (class 1259 OID 21845409)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2754 (class 1259 OID 21845410)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2700 (class 1259 OID 21845144)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2618 (class 1259 OID 21844933)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2528 (class 1259 OID 21844662)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2822 (class 2606 OID 21845662)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2821 (class 2606 OID 21845667)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2817 (class 2606 OID 21845687)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2823 (class 2606 OID 21845657)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2819 (class 2606 OID 21845677)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2818 (class 2606 OID 21845682)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2820 (class 2606 OID 21845672)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2858 (class 2606 OID 21845852)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2857 (class 2606 OID 21845857)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2856 (class 2606 OID 21845862)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2890 (class 2606 OID 21846027)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2891 (class 2606 OID 21846022)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2803 (class 2606 OID 21845587)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2840 (class 2606 OID 21845772)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2885 (class 2606 OID 21846007)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2886 (class 2606 OID 21846002)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2884 (class 2606 OID 21846012)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2887 (class 2606 OID 21845997)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2888 (class 2606 OID 21845992)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2838 (class 2606 OID 21845767)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2839 (class 2606 OID 21845762)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2816 (class 2606 OID 21845652)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2850 (class 2606 OID 21845812)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2848 (class 2606 OID 21845822)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2849 (class 2606 OID 21845817)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2809 (class 2606 OID 21845622)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2810 (class 2606 OID 21845617)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2836 (class 2606 OID 21845752)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2882 (class 2606 OID 21845982)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2861 (class 2606 OID 21845867)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2860 (class 2606 OID 21845872)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2859 (class 2606 OID 21845877)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2889 (class 2606 OID 21846017)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2863 (class 2606 OID 21845897)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2866 (class 2606 OID 21845882)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2862 (class 2606 OID 21845902)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2864 (class 2606 OID 21845892)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2865 (class 2606 OID 21845887)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2807 (class 2606 OID 21845612)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2808 (class 2606 OID 21845607)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2799 (class 2606 OID 21845572)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2800 (class 2606 OID 21845567)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2844 (class 2606 OID 21845792)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2796 (class 2606 OID 21845547)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2795 (class 2606 OID 21845552)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2845 (class 2606 OID 21845807)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2846 (class 2606 OID 21845802)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2847 (class 2606 OID 21845797)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2814 (class 2606 OID 21845637)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2813 (class 2606 OID 21845642)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2792 (class 2606 OID 21845532)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2828 (class 2606 OID 21845727)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2830 (class 2606 OID 21845717)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2831 (class 2606 OID 21845712)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2829 (class 2606 OID 21845722)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2794 (class 2606 OID 21845537)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2793 (class 2606 OID 21845542)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2841 (class 2606 OID 21845777)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2894 (class 2606 OID 21846042)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2854 (class 2606 OID 21845847)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2855 (class 2606 OID 21845842)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2896 (class 2606 OID 21846047)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2895 (class 2606 OID 21846052)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2837 (class 2606 OID 21845757)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2853 (class 2606 OID 21845832)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2852 (class 2606 OID 21845837)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2873 (class 2606 OID 21845957)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2874 (class 2606 OID 21845952)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2877 (class 2606 OID 21845937)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2876 (class 2606 OID 21845942)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2875 (class 2606 OID 21845947)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2805 (class 2606 OID 21845597)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2806 (class 2606 OID 21845592)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2804 (class 2606 OID 21845602)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2842 (class 2606 OID 21845787)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2843 (class 2606 OID 21845782)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2880 (class 2606 OID 21845967)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2879 (class 2606 OID 21845972)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2870 (class 2606 OID 21845927)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2869 (class 2606 OID 21845932)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2872 (class 2606 OID 21845917)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2871 (class 2606 OID 21845922)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2851 (class 2606 OID 21845827)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2832 (class 2606 OID 21845747)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2833 (class 2606 OID 21845742)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2835 (class 2606 OID 21845732)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2834 (class 2606 OID 21845737)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2867 (class 2606 OID 21845912)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2868 (class 2606 OID 21845907)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2811 (class 2606 OID 21845627)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2812 (class 2606 OID 21845632)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2815 (class 2606 OID 21845647)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2878 (class 2606 OID 21845962)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2881 (class 2606 OID 21845977)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2883 (class 2606 OID 21845987)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2893 (class 2606 OID 21846032)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2892 (class 2606 OID 21846037)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2797 (class 2606 OID 21845562)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2798 (class 2606 OID 21845557)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2802 (class 2606 OID 21845577)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2801 (class 2606 OID 21845582)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2824 (class 2606 OID 21845692)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2825 (class 2606 OID 21845707)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2826 (class 2606 OID 21845702)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2827 (class 2606 OID 21845697)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-13 14:40:31 CEST

--
-- PostgreSQL database dump complete
--

