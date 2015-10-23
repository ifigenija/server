--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-10-23 10:48:58 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 249 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3130 (class 0 OID 0)
-- Dependencies: 249
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 23171773)
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
-- TOC entry 233 (class 1259 OID 23172378)
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
-- TOC entry 232 (class 1259 OID 23172361)
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
-- TOC entry 223 (class 1259 OID 23172238)
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
-- TOC entry 226 (class 1259 OID 23172268)
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
-- TOC entry 247 (class 1259 OID 23172649)
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
-- TOC entry 200 (class 1259 OID 23172018)
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
-- TOC entry 202 (class 1259 OID 23172049)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 23172575)
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
-- TOC entry 191 (class 1259 OID 23171915)
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
-- TOC entry 234 (class 1259 OID 23172391)
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
-- TOC entry 219 (class 1259 OID 23172192)
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
-- TOC entry 197 (class 1259 OID 23171989)
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
-- TOC entry 194 (class 1259 OID 23171955)
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
-- TOC entry 3131 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 192 (class 1259 OID 23171932)
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
-- TOC entry 208 (class 1259 OID 23172106)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 245 (class 1259 OID 23172630)
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
-- TOC entry 246 (class 1259 OID 23172642)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 248 (class 1259 OID 23172664)
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
-- TOC entry 212 (class 1259 OID 23172131)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 189 (class 1259 OID 23171889)
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
-- TOC entry 182 (class 1259 OID 23171792)
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
-- TOC entry 186 (class 1259 OID 23171856)
-- Name: organizacijskaenota; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE organizacijskaenota (
    id uuid NOT NULL,
    parent_id uuid,
    vodja_id uuid,
    namestnik_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(50) DEFAULT NULL::character varying
);


--
-- TOC entry 183 (class 1259 OID 23171803)
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
-- TOC entry 177 (class 1259 OID 23171747)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 23171766)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 23172138)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 217 (class 1259 OID 23172172)
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
-- TOC entry 229 (class 1259 OID 23172309)
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
-- TOC entry 185 (class 1259 OID 23171836)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
    tipkli_id uuid,
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
-- TOC entry 188 (class 1259 OID 23171881)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 23172520)
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
-- TOC entry 209 (class 1259 OID 23172112)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 187 (class 1259 OID 23171866)
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
-- TOC entry 199 (class 1259 OID 23172010)
-- Name: praznik; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE praznik (
    id uuid NOT NULL,
    ime character varying(255) NOT NULL,
    dan character varying(255) NOT NULL,
    mesec integer NOT NULL,
    leto integer,
    delaprost boolean NOT NULL
);


--
-- TOC entry 195 (class 1259 OID 23171970)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    dezurni_id uuid,
    zaporedna integer,
    zaporednasez integer,
    objavljenzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    porocilo text
);


--
-- TOC entry 196 (class 1259 OID 23171982)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 23172124)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 23172534)
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
-- TOC entry 238 (class 1259 OID 23172544)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 23172459)
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
-- TOC entry 239 (class 1259 OID 23172552)
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
-- TOC entry 215 (class 1259 OID 23172153)
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
-- TOC entry 207 (class 1259 OID 23172097)
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
-- TOC entry 206 (class 1259 OID 23172087)
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
-- TOC entry 228 (class 1259 OID 23172298)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 222 (class 1259 OID 23172228)
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
-- TOC entry 193 (class 1259 OID 23171944)
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
-- TOC entry 174 (class 1259 OID 23171718)
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
-- TOC entry 173 (class 1259 OID 23171716)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3132 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 216 (class 1259 OID 23172166)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 23171756)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 23171740)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 23172180)
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
-- TOC entry 210 (class 1259 OID 23172118)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 204 (class 1259 OID 23172064)
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
-- TOC entry 172 (class 1259 OID 23171705)
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
-- TOC entry 171 (class 1259 OID 23171697)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 170 (class 1259 OID 23171692)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 224 (class 1259 OID 23172245)
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
-- TOC entry 184 (class 1259 OID 23171828)
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
-- TOC entry 205 (class 1259 OID 23172074)
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
    planiranotraja numeric(15,2) DEFAULT NULL::numeric,
    dezurni boolean,
    gost boolean
);


--
-- TOC entry 227 (class 1259 OID 23172286)
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
-- TOC entry 181 (class 1259 OID 23171782)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 240 (class 1259 OID 23172563)
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
-- TOC entry 203 (class 1259 OID 23172054)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 190 (class 1259 OID 23171901)
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
-- TOC entry 175 (class 1259 OID 23171727)
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
-- TOC entry 231 (class 1259 OID 23172336)
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
-- TOC entry 198 (class 1259 OID 23172000)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 214 (class 1259 OID 23172145)
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
-- TOC entry 225 (class 1259 OID 23172259)
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
-- TOC entry 243 (class 1259 OID 23172610)
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
-- TOC entry 242 (class 1259 OID 23172582)
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
-- TOC entry 244 (class 1259 OID 23172622)
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
-- TOC entry 221 (class 1259 OID 23172217)
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
    jenastopajoci boolean,
    organizacijskaenota_id uuid
);


--
-- TOC entry 201 (class 1259 OID 23172043)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 230 (class 1259 OID 23172326)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 220 (class 1259 OID 23172207)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2220 (class 2604 OID 23171721)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3055 (class 0 OID 23171773)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5629-f477-6252-bd254cdf4c9d	10	30	Otroci	Abonma za otroke	200
000a0000-5629-f477-ed8a-45685dda922d	20	60	Mladina	Abonma za mladino	400
000a0000-5629-f477-eccd-39f7f4ca38db	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3108 (class 0 OID 23172378)
-- Dependencies: 233
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5629-f477-0791-b63f7ec240a5	000d0000-5629-f477-bcbd-c276df28ee5f	\N	00090000-5629-f477-a02c-0d6639e11874	000b0000-5629-f477-ad55-e276116a0068	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5629-f477-dbba-059d07f207d2	000d0000-5629-f477-96f0-52ca28ac7e12	00100000-5629-f477-55ca-529843d98723	00090000-5629-f477-0fdc-48800e1e046e	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5629-f477-f200-4aa41870bd9d	000d0000-5629-f477-122d-c5796e734dbf	00100000-5629-f477-794f-251cbe1c9a8d	00090000-5629-f477-452b-e511bd57230e	\N	0003	t	\N	2015-10-23	\N	2	t	\N	f	f
000c0000-5629-f477-78ae-5f5740f9ecd8	000d0000-5629-f477-57d7-bc4e523add21	\N	00090000-5629-f477-e824-618b0efd7d60	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5629-f477-3569-e0b09bb62c94	000d0000-5629-f477-81a2-8236ba24cd29	\N	00090000-5629-f477-280c-4146cb2897ba	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5629-f477-b456-b0ad7834f137	000d0000-5629-f477-6374-41a3ec58be49	\N	00090000-5629-f477-e742-11db904e5f77	000b0000-5629-f477-f636-e8837ef427c9	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5629-f477-f65f-1b8e1afbcbbe	000d0000-5629-f477-38e1-c251736bb823	00100000-5629-f477-562d-6b52ced17580	00090000-5629-f477-5684-d8d3c34c3870	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5629-f477-a4b4-ea7954e8002e	000d0000-5629-f477-135e-8ca0ceeb9ffb	\N	00090000-5629-f477-4c4b-1cf5c4d9905c	000b0000-5629-f477-e26b-e51c5fd500c5	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5629-f477-76e4-e978dd27c32e	000d0000-5629-f477-38e1-c251736bb823	00100000-5629-f477-a14a-eebaf58b9cc7	00090000-5629-f477-14b9-15c04c3aea9c	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5629-f477-8f78-5cbe6ccfbaf9	000d0000-5629-f477-38e1-c251736bb823	00100000-5629-f477-d5c1-04f8996b6b86	00090000-5629-f477-f134-fa9c17ae23d2	\N	0010	t	\N	2015-10-23	\N	16	f	\N	f	t
000c0000-5629-f477-13d4-4755f1e76b72	000d0000-5629-f477-38e1-c251736bb823	00100000-5629-f477-9e24-8b85af91988a	00090000-5629-f477-0549-236fe1aa9597	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5629-f477-f061-dd88e16c7581	000d0000-5629-f477-ead6-58f854702314	\N	00090000-5629-f477-0fdc-48800e1e046e	000b0000-5629-f477-f22f-0d908b279aed	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3107 (class 0 OID 23172361)
-- Dependencies: 232
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 23172238)
-- Dependencies: 223
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5629-f477-369b-19ccdc03b858	00160000-5629-f477-97b5-42ec461d7ec2	00090000-5629-f477-f6da-5dd16fbfba07	aizv	10	t
003d0000-5629-f477-873a-a4521ce6900e	00160000-5629-f477-97b5-42ec461d7ec2	00090000-5629-f477-af8a-78690a6baa3f	apri	14	t
003d0000-5629-f477-331b-3a5599427bd0	00160000-5629-f477-0937-e63e96312c72	00090000-5629-f477-2eaf-d857f91507ed	aizv	11	t
003d0000-5629-f477-a18a-28158020e29d	00160000-5629-f477-6170-51a7922939f7	00090000-5629-f477-b18a-342ab59d8592	aizv	12	t
003d0000-5629-f477-c6ab-be0ac1048a0f	00160000-5629-f477-97b5-42ec461d7ec2	00090000-5629-f477-3294-2c0c967c9fe6	apri	18	f
\.


--
-- TOC entry 3101 (class 0 OID 23172268)
-- Dependencies: 226
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5629-f477-97b5-42ec461d7ec2	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5629-f477-0937-e63e96312c72	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5629-f477-6170-51a7922939f7	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3122 (class 0 OID 23172649)
-- Dependencies: 247
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3075 (class 0 OID 23172018)
-- Dependencies: 200
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5629-f477-45f0-861110b0e4a7	\N	\N	00200000-5629-f477-4141-c4e15be22f71	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5629-f477-5f28-355f5c0c0d08	\N	\N	00200000-5629-f477-6b3f-d84a11f8acd7	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5629-f477-59e9-d874757c8075	\N	\N	00200000-5629-f477-b6c4-6840dbb80100	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5629-f477-64c9-b1678b93e9b8	\N	\N	00200000-5629-f477-13ee-b796fcbf9ea5	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5629-f477-f23d-7eeacb4904a4	\N	\N	00200000-5629-f477-9b94-6efdb691b9d9	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3077 (class 0 OID 23172049)
-- Dependencies: 202
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 23172575)
-- Dependencies: 241
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3066 (class 0 OID 23171915)
-- Dependencies: 191
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5629-f475-3b41-1fe9b8048e3e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5629-f475-ba1f-cc2e47b9687c	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5629-f475-5b0e-c95eec51f613	AL	ALB	008	Albania 	Albanija	\N
00040000-5629-f475-4a8e-dae6d5f8b131	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5629-f475-5933-b5219d7409d5	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5629-f475-e6f9-cfbd6c682cb6	AD	AND	020	Andorra 	Andora	\N
00040000-5629-f475-5bda-bc3517a30e85	AO	AGO	024	Angola 	Angola	\N
00040000-5629-f475-4422-99ab8c97d87f	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5629-f475-9c17-036f67f51460	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5629-f475-c83b-efda6534f77f	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5629-f475-8804-45b6aa82fe86	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5629-f475-5fcd-2731c2d43e05	AM	ARM	051	Armenia 	Armenija	\N
00040000-5629-f475-5978-86f1f1f7b739	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5629-f475-576b-690029e30144	AU	AUS	036	Australia 	Avstralija	\N
00040000-5629-f475-447e-ede5d46f2101	AT	AUT	040	Austria 	Avstrija	\N
00040000-5629-f475-350c-a681626ad02a	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5629-f475-629d-cf024e887963	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5629-f475-f578-a634dbb90339	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5629-f475-46c0-ddbd7a64285d	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5629-f475-5390-8ae27678346f	BB	BRB	052	Barbados 	Barbados	\N
00040000-5629-f475-4240-655047af4af6	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5629-f475-ad53-0ef74f441a56	BE	BEL	056	Belgium 	Belgija	\N
00040000-5629-f475-9ba2-f40b995791c7	BZ	BLZ	084	Belize 	Belize	\N
00040000-5629-f475-f89c-ec2d4f4f03df	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5629-f475-3404-141f2bcc516c	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5629-f475-4150-03ca92e4deac	BT	BTN	064	Bhutan 	Butan	\N
00040000-5629-f475-202a-99e99a9ec336	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5629-f475-74ce-e33495d39b9e	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5629-f475-f506-71eee0520295	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5629-f475-ac8b-e6aeb3015115	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5629-f475-25a9-04314991c20b	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5629-f475-0846-6e395762bf24	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5629-f475-e2eb-3e7e12411fa9	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5629-f475-3b28-7d8082f24ddf	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5629-f475-5af7-1de5a36cbf07	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5629-f475-97d3-751b7aff46c5	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5629-f475-dcdb-1ba542a136c0	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5629-f475-1ae5-44e867a43dcd	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5629-f475-9580-9f01ba813645	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5629-f475-e02e-394127937fff	CA	CAN	124	Canada 	Kanada	\N
00040000-5629-f475-5db1-31a5388d5f5c	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5629-f475-9ae5-276c07064761	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5629-f475-16c2-cdae9db73779	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5629-f475-88db-9ea7d7ccfe7d	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5629-f475-f1b8-ce42a17ab4fb	CL	CHL	152	Chile 	Čile	\N
00040000-5629-f475-8abd-b40dcc40c519	CN	CHN	156	China 	Kitajska	\N
00040000-5629-f475-95be-1cf98df62355	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5629-f475-b32d-9b94c8138260	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5629-f475-ec3a-32ba23b069bb	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5629-f475-6dc6-2ef74e184c7c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5629-f475-0c5e-e19131f83c6f	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5629-f475-b2c5-ba3278021699	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5629-f475-a31c-cea3a553a0da	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5629-f475-cc99-553c8b90c704	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5629-f475-5499-084efc53d151	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5629-f475-9923-ee865595ed9a	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5629-f475-a842-b33b0aa69775	CU	CUB	192	Cuba 	Kuba	\N
00040000-5629-f475-b2fd-e86dc698914a	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5629-f475-6225-d306da5c702f	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5629-f475-f5c2-fb2b5da93d51	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5629-f475-aac8-9f77e9da217f	DK	DNK	208	Denmark 	Danska	\N
00040000-5629-f475-b429-db26ce876178	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5629-f475-0a4e-93e37e6eda85	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5629-f475-e152-31177d7c7794	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5629-f475-52bc-7cbeec73b800	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5629-f475-73ad-fff04cebcef0	EG	EGY	818	Egypt 	Egipt	\N
00040000-5629-f475-7d3a-2327a8b14d9c	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5629-f475-bbd4-fee1a38e27c2	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5629-f475-0cb5-5a3c3f7755fd	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5629-f475-4d70-181d5cc40889	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5629-f475-f63c-d73a39418345	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5629-f475-77b3-c91e255f6b15	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5629-f475-662b-816ffbe9bbc3	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5629-f475-e366-3e2152de788d	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5629-f475-d1dd-291ad057e028	FI	FIN	246	Finland 	Finska	\N
00040000-5629-f475-5ec1-97c8d2f9f919	FR	FRA	250	France 	Francija	\N
00040000-5629-f475-91f8-03e211dc5e47	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5629-f475-815c-d9371fc117c0	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5629-f475-66d0-bb702a1e3069	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5629-f475-abe9-2ca273c54aa1	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5629-f475-9836-5f843fe60c28	GA	GAB	266	Gabon 	Gabon	\N
00040000-5629-f475-530e-493b85af663a	GM	GMB	270	Gambia 	Gambija	\N
00040000-5629-f475-b671-e70aa1a93a1a	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5629-f475-7772-9789f96b2642	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5629-f475-d83d-60692d3512e3	GH	GHA	288	Ghana 	Gana	\N
00040000-5629-f475-a6dd-5aa662b23ece	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5629-f475-11ab-e22c20bd6a83	GR	GRC	300	Greece 	Grčija	\N
00040000-5629-f475-0067-9649c49a6e20	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5629-f475-0451-70651b359e49	GD	GRD	308	Grenada 	Grenada	\N
00040000-5629-f475-fee0-2b8574d6a068	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5629-f475-c0b2-da46a64515bd	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5629-f475-3349-73fefe2d6b79	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5629-f475-c736-063e28304e7c	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5629-f475-8b8e-e05e617ea7b3	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5629-f475-aac7-aa51c4c39244	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5629-f475-f8ca-969276c5dd30	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5629-f475-9d1e-716ab8609fbe	HT	HTI	332	Haiti 	Haiti	\N
00040000-5629-f475-8c22-0b1562555ce9	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5629-f475-73ee-91b8c6478c9b	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5629-f475-4c51-193c6ce54ddb	HN	HND	340	Honduras 	Honduras	\N
00040000-5629-f475-9a2f-b15945bfd174	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5629-f475-53e1-45d3c17a5f7d	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5629-f475-24b6-b510c4c33127	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5629-f475-0aa2-e9d8ae2b42ff	IN	IND	356	India 	Indija	\N
00040000-5629-f475-6980-045cc47c5b5c	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5629-f475-829f-72d3aa0180c8	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5629-f475-57fa-677ff6884cee	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5629-f475-e441-e65c7f132ee3	IE	IRL	372	Ireland 	Irska	\N
00040000-5629-f475-26fc-23a2debb02c9	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5629-f475-046b-0f1629503761	IL	ISR	376	Israel 	Izrael	\N
00040000-5629-f475-a527-74aeb1dd7bb3	IT	ITA	380	Italy 	Italija	\N
00040000-5629-f475-914e-2068d50be958	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5629-f475-0952-5e2c21628025	JP	JPN	392	Japan 	Japonska	\N
00040000-5629-f475-434e-d49f421ac48b	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5629-f475-2e57-e55a82e45827	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5629-f475-cd6e-08bebe3a49dd	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5629-f475-8535-e44e3cca573b	KE	KEN	404	Kenya 	Kenija	\N
00040000-5629-f475-6c93-e2f62df40239	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5629-f475-9c94-f4d847411229	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5629-f475-7d2d-f4019c6e4f72	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5629-f475-6315-d844c3f51858	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5629-f475-b177-a800b06b3427	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5629-f475-a85c-284b33f9cad4	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5629-f475-c6d9-180684d986d8	LV	LVA	428	Latvia 	Latvija	\N
00040000-5629-f475-4c4f-5ef14b44f048	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5629-f475-f689-f1ecc8207a68	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5629-f475-84ac-95cbd61e8aa5	LR	LBR	430	Liberia 	Liberija	\N
00040000-5629-f475-3129-da8744776740	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5629-f475-9e64-3805839eae2d	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5629-f475-f1f7-d3520051e431	LT	LTU	440	Lithuania 	Litva	\N
00040000-5629-f475-8707-573b60ecf94d	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5629-f475-ea04-67f6296c8cba	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5629-f475-8c2b-c7a5ca1ab392	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5629-f475-bcbc-2a9965672069	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5629-f475-c78a-0dd1da5f754b	MW	MWI	454	Malawi 	Malavi	\N
00040000-5629-f475-a574-7fed8bbde785	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5629-f475-662c-0270f217a0db	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5629-f475-1eeb-b7f847301c80	ML	MLI	466	Mali 	Mali	\N
00040000-5629-f475-4b95-69a74caa17ea	MT	MLT	470	Malta 	Malta	\N
00040000-5629-f475-777e-d2f0cd847295	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5629-f475-9967-e72914a56138	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5629-f475-6d41-98b0dfd5ebb0	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5629-f475-c068-3dcadfc7f548	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5629-f475-63af-dac7bae739ac	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5629-f475-9b7b-16ba2b359264	MX	MEX	484	Mexico 	Mehika	\N
00040000-5629-f475-b4a0-19311c9d9304	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5629-f475-8cbe-2acc86048f82	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5629-f475-7cb1-a09f006eb45d	MC	MCO	492	Monaco 	Monako	\N
00040000-5629-f475-de04-d436375ede8c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5629-f475-ca16-f48098a3c3f9	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5629-f475-62fe-f22c10bec0ce	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5629-f475-1fa4-a9243a9b6fe5	MA	MAR	504	Morocco 	Maroko	\N
00040000-5629-f475-1733-465c86c72707	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5629-f475-c7d0-728acd756273	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5629-f475-d0b5-361f1b8225db	NA	NAM	516	Namibia 	Namibija	\N
00040000-5629-f475-7cbd-2a534c815a9f	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5629-f475-5a4a-f6af007aa30b	NP	NPL	524	Nepal 	Nepal	\N
00040000-5629-f475-f1bf-e9cd965c1872	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5629-f475-3f17-c6a343743afb	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5629-f475-32e3-cb9c5d046f8d	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5629-f475-37ff-a7eefaa99b68	NE	NER	562	Niger 	Niger 	\N
00040000-5629-f475-7916-e9875f8b4408	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5629-f475-aff9-d8c0ec8eb1f7	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5629-f475-384a-bb93bdc87565	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5629-f475-56bf-5750a4a6c0d5	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5629-f475-c023-b2176e505eda	NO	NOR	578	Norway 	Norveška	\N
00040000-5629-f475-114e-2feb5dc7977e	OM	OMN	512	Oman 	Oman	\N
00040000-5629-f475-dc02-2e9029528b6d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5629-f475-7c23-300bc69b4afc	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5629-f475-b75b-e7fdd2c0f401	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5629-f475-5e23-5dc8338087c3	PA	PAN	591	Panama 	Panama	\N
00040000-5629-f475-b41d-6c3b82166b7b	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5629-f475-a693-9d56862d0151	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5629-f475-46f9-ff8ebb6d0595	PE	PER	604	Peru 	Peru	\N
00040000-5629-f475-9c6c-8302231bb707	PH	PHL	608	Philippines 	Filipini	\N
00040000-5629-f475-0944-fd8f83d007b5	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5629-f475-b049-a887320f502e	PL	POL	616	Poland 	Poljska	\N
00040000-5629-f475-d08e-43bd742208d6	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5629-f475-abc2-43570b907d88	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5629-f475-89a5-84def97610fd	QA	QAT	634	Qatar 	Katar	\N
00040000-5629-f475-fc64-bad0cd677538	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5629-f475-77d2-d0197ce80e44	RO	ROU	642	Romania 	Romunija	\N
00040000-5629-f475-6bce-ceeab804a865	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5629-f475-08e2-15ad0166a01b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5629-f475-7e8e-1d8249b177a8	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5629-f475-f216-63df222f427a	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5629-f475-f64a-590663ecb5fd	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5629-f475-ba89-5fbebc6009ec	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5629-f475-26c7-1336f0273735	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5629-f475-6860-af85adf79c12	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5629-f475-d952-d635247802dc	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5629-f475-33ba-215a573f7a15	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5629-f475-acec-ff6e69b0e562	SM	SMR	674	San Marino 	San Marino	\N
00040000-5629-f475-6d4f-44a99f2d0992	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5629-f475-71d6-a879c3060606	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5629-f475-7bba-c1189b312150	SN	SEN	686	Senegal 	Senegal	\N
00040000-5629-f475-418c-50e5ff344906	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5629-f475-b1b1-f8443d92007c	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5629-f475-e480-7c5b778752fc	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5629-f475-b43d-8243f51ee9a8	SG	SGP	702	Singapore 	Singapur	\N
00040000-5629-f475-2992-103549640a94	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5629-f475-ccb8-e13807991a21	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5629-f475-b9d7-54f257d6118e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5629-f475-24d0-98b2e41fe59a	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5629-f475-17c8-4ae6841953f3	SO	SOM	706	Somalia 	Somalija	\N
00040000-5629-f475-bac8-51d21143d1aa	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5629-f475-e9c4-f56db2e3e5a4	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5629-f475-90e7-8385c70d40e4	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5629-f475-acb8-1d89b72c5d51	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5629-f475-57b0-4b43bdfee93e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5629-f475-b7ac-67bc19058d98	SD	SDN	729	Sudan 	Sudan	\N
00040000-5629-f475-a17c-3fd9a505faa4	SR	SUR	740	Suriname 	Surinam	\N
00040000-5629-f475-cf06-09e7b8238c88	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5629-f475-ea27-030f3c9e3ca6	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5629-f475-b7dd-0dbd3cf1f41c	SE	SWE	752	Sweden 	Švedska	\N
00040000-5629-f475-96e7-7b73deff3b72	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5629-f475-1f38-ac13fc45212c	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5629-f475-577f-b70622e0bd62	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5629-f475-6977-de27e26694fd	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5629-f475-46c2-ab04a83d67a4	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5629-f475-5257-de46b2f91f01	TH	THA	764	Thailand 	Tajska	\N
00040000-5629-f475-0319-32916e522f0a	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5629-f475-030e-bd0a95b1ea0d	TG	TGO	768	Togo 	Togo	\N
00040000-5629-f475-eaba-eebe48f2f513	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5629-f475-6b3d-911814010e9c	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5629-f475-6f88-7a763b5b1a02	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5629-f475-f3ab-0b2d7fd7e4dc	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5629-f475-711d-d38042cd01c4	TR	TUR	792	Turkey 	Turčija	\N
00040000-5629-f475-b540-2973bffe274c	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5629-f475-74d8-7e5d4b49ace0	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5629-f475-4b2c-326f9919c29d	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5629-f475-7946-d959863643c2	UG	UGA	800	Uganda 	Uganda	\N
00040000-5629-f475-0cd2-a2409c955501	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5629-f475-99cf-b2f669ab6c42	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5629-f475-bb42-74841a989132	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5629-f475-0c1d-6e03f8f15fdb	US	USA	840	United States 	Združene države Amerike	\N
00040000-5629-f475-5966-ad9a042cf4e2	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5629-f475-5967-6a671d931b3b	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5629-f475-5fe6-99b35856296f	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5629-f475-44fb-6f5c68d8b43e	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5629-f475-9735-8c89d36bc3ea	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5629-f475-dcc7-7ac2704ff47a	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5629-f475-4354-c279789d5685	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5629-f475-235f-b4c2549e70bc	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5629-f475-dba5-fa3b0b13feaa	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5629-f475-11f4-c50d4079f749	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5629-f475-cc1b-0f56a9063df7	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5629-f475-7cb3-6dfef5db289b	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5629-f475-7528-18d042b4284c	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3109 (class 0 OID 23172391)
-- Dependencies: 234
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5629-f477-8089-a422c321fce5	000e0000-5629-f477-3070-4f4980032825	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5629-f474-bef8-98623e17b4b6	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5629-f477-1e5e-dfa9f92db595	000e0000-5629-f477-9c55-34c91f139cd9	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5629-f474-f67d-09fce2740f43	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5629-f477-1ea6-fc7090abbbec	000e0000-5629-f477-dcf8-dbd2b8129d4f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5629-f474-bef8-98623e17b4b6	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5629-f477-5744-6b06ac48e1a1	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5629-f477-5544-28b44873e47a	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3094 (class 0 OID 23172192)
-- Dependencies: 219
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5629-f477-bcbd-c276df28ee5f	000e0000-5629-f477-9c55-34c91f139cd9	000c0000-5629-f477-0791-b63f7ec240a5	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5629-f475-345b-057ff3b80e63
000d0000-5629-f477-96f0-52ca28ac7e12	000e0000-5629-f477-9c55-34c91f139cd9	000c0000-5629-f477-dbba-059d07f207d2	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5629-f474-55e0-a02e460d9c40
000d0000-5629-f477-122d-c5796e734dbf	000e0000-5629-f477-9c55-34c91f139cd9	000c0000-5629-f477-f200-4aa41870bd9d	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5629-f475-77a8-2af891f2df0c
000d0000-5629-f477-57d7-bc4e523add21	000e0000-5629-f477-9c55-34c91f139cd9	000c0000-5629-f477-78ae-5f5740f9ecd8	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5629-f475-833b-6186d89ed20a
000d0000-5629-f477-81a2-8236ba24cd29	000e0000-5629-f477-9c55-34c91f139cd9	000c0000-5629-f477-3569-e0b09bb62c94	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5629-f475-833b-6186d89ed20a
000d0000-5629-f477-6374-41a3ec58be49	000e0000-5629-f477-9c55-34c91f139cd9	000c0000-5629-f477-b456-b0ad7834f137	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5629-f475-345b-057ff3b80e63
000d0000-5629-f477-38e1-c251736bb823	000e0000-5629-f477-9c55-34c91f139cd9	000c0000-5629-f477-76e4-e978dd27c32e	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5629-f475-345b-057ff3b80e63
000d0000-5629-f477-135e-8ca0ceeb9ffb	000e0000-5629-f477-9c55-34c91f139cd9	000c0000-5629-f477-a4b4-ea7954e8002e	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5629-f475-89f6-e9ede190ac3f
000d0000-5629-f477-ead6-58f854702314	000e0000-5629-f477-9c55-34c91f139cd9	000c0000-5629-f477-f061-dd88e16c7581	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5629-f474-52af-926d34ebee09
\.


--
-- TOC entry 3072 (class 0 OID 23171989)
-- Dependencies: 197
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3069 (class 0 OID 23171955)
-- Dependencies: 194
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3067 (class 0 OID 23171932)
-- Dependencies: 192
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5629-f477-5a04-20b588af1b70	00080000-5629-f477-605c-f1abaecac668	00090000-5629-f477-f134-fa9c17ae23d2	AK		igralka
\.


--
-- TOC entry 3083 (class 0 OID 23172106)
-- Dependencies: 208
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 23172630)
-- Dependencies: 245
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 23172642)
-- Dependencies: 246
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 23172664)
-- Dependencies: 248
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3087 (class 0 OID 23172131)
-- Dependencies: 212
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3064 (class 0 OID 23171889)
-- Dependencies: 189
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5629-f475-1e75-26aa832c951d	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5629-f475-aa7d-02b787d85d4d	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5629-f475-2223-db00aea9a7bd	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5629-f475-9ef9-f1d744388360	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5629-f475-3672-d98aad35a5c3	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5629-f475-aa57-27f467464094	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5629-f475-dd36-b4b0ad3ea00d	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5629-f475-a88e-c9503ceb2463	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5629-f475-0508-e74655c7e44e	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5629-f475-902c-1d7cacde3b60	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5629-f475-ccea-b8e4f2eb9464	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5629-f475-2a9d-41d58af39cd4	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5629-f475-c97a-1efe19620321	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5629-f475-322c-72b8f89d0fa9	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5629-f475-ea25-566afee3d898	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5629-f477-aa2a-2a828a9acced	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5629-f477-49e7-e457e24b981c	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5629-f477-bd44-61dddee288cd	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5629-f477-3751-8b4f47f0d566	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5629-f477-b141-50f7c6a301fe	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5629-f478-110e-a566c74842b3	application.tenant.maticnopodjetje	string	s:36:"00080000-5629-f478-e6ac-68b95d9b0607";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3057 (class 0 OID 23171792)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5629-f477-7b19-5c4b2ea0600d	00000000-5629-f477-aa2a-2a828a9acced	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5629-f477-ce0c-c8cd519e1389	00000000-5629-f477-aa2a-2a828a9acced	00010000-5629-f475-fbea-5b701bf1a18f	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5629-f477-9fff-2edd572eca66	00000000-5629-f477-49e7-e457e24b981c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3061 (class 0 OID 23171856)
-- Dependencies: 186
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5629-f477-080f-ff4330dc0d1e	\N	00100000-5629-f477-55ca-529843d98723	00100000-5629-f477-794f-251cbe1c9a8d	01	Gledališče Nimbis
00410000-5629-f477-beb7-30eff1cdb9c3	00410000-5629-f477-080f-ff4330dc0d1e	00100000-5629-f477-55ca-529843d98723	00100000-5629-f477-794f-251cbe1c9a8d	02	Tehnika
\.


--
-- TOC entry 3058 (class 0 OID 23171803)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5629-f477-a02c-0d6639e11874	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5629-f477-e824-618b0efd7d60	00010000-5629-f477-c3bd-0bb612bb078d	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5629-f477-452b-e511bd57230e	00010000-5629-f477-3079-9a6a24c80d53	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5629-f477-14b9-15c04c3aea9c	00010000-5629-f477-0ac3-6f1c5a571f1a	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5629-f477-8222-b9bb49d95bf3	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5629-f477-e742-11db904e5f77	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5629-f477-0549-236fe1aa9597	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5629-f477-5684-d8d3c34c3870	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5629-f477-f134-fa9c17ae23d2	00010000-5629-f477-4a8a-3ed07b78fc66	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5629-f477-0fdc-48800e1e046e	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5629-f477-13b4-46ba4f2e643a	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5629-f477-280c-4146cb2897ba	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5629-f477-4c4b-1cf5c4d9905c	00010000-5629-f477-ae50-751b9133a04c	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5629-f477-f6da-5dd16fbfba07	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5629-f477-af8a-78690a6baa3f	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5629-f477-2eaf-d857f91507ed	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5629-f477-b18a-342ab59d8592	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5629-f477-3294-2c0c967c9fe6	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5629-f477-de2a-6efbd4eb8216	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N	\N	\N	\N	M		\N	\N	\N
00090000-5629-f477-7726-2aff1cd320d0	\N	\N	0020		Luka	Novak			Luka  Novak		\N	\N	\N	\N	M		\N	\N	\N
00090000-5629-f477-707b-eda158b4e62e	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N	\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3052 (class 0 OID 23171747)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5629-f475-8abf-e082d8915554	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5629-f475-4001-4acd65bc7eb6	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5629-f475-20f8-e9e0b8572a23	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5629-f475-5d00-d084f2515427	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5629-f475-7128-1088a61ba713	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5629-f475-ce81-a99051c374d3	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5629-f475-b222-db86c85fccce	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5629-f475-2499-dab09af7f1ce	Abonma-read	Abonma - branje	f
00030000-5629-f475-4bca-90b8c0bdfffb	Abonma-write	Abonma - spreminjanje	f
00030000-5629-f475-3560-0f47f1ba0bf3	Alternacija-read	Alternacija - branje	f
00030000-5629-f475-a0e7-58547af67bc6	Alternacija-write	Alternacija - spreminjanje	f
00030000-5629-f475-e571-6ec97b44f423	Arhivalija-read	Arhivalija - branje	f
00030000-5629-f475-26d0-1cc86660e2ac	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5629-f475-77d9-f2fc47711c81	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5629-f475-85d5-62987f0af964	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5629-f475-6d71-8b6d3598c2de	Besedilo-read	Besedilo - branje	f
00030000-5629-f475-3d14-545b11b72d67	Besedilo-write	Besedilo - spreminjanje	f
00030000-5629-f475-4128-c4e4ccf669ec	DogodekIzven-read	DogodekIzven - branje	f
00030000-5629-f475-bf6a-c419cb6c8ea7	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5629-f475-a0d3-6fa6c29f30e9	Dogodek-read	Dogodek - branje	f
00030000-5629-f475-1bfe-1dd615e1dcb5	Dogodek-write	Dogodek - spreminjanje	f
00030000-5629-f475-8571-0d539791dfef	DrugiVir-read	DrugiVir - branje	f
00030000-5629-f475-7549-0f4b1cae98ee	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5629-f475-bfa6-f2a57207a8a8	Drzava-read	Drzava - branje	f
00030000-5629-f475-572e-7705773379e9	Drzava-write	Drzava - spreminjanje	f
00030000-5629-f475-e53e-d694263e2d69	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5629-f475-e2a6-eb861590a77c	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5629-f475-978a-a37c662fe896	Funkcija-read	Funkcija - branje	f
00030000-5629-f475-e177-5751ac8e9dd6	Funkcija-write	Funkcija - spreminjanje	f
00030000-5629-f475-074f-d47c7a5e5157	Gostovanje-read	Gostovanje - branje	f
00030000-5629-f475-338d-acfde7b17c74	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5629-f475-dc10-094dbd7e6874	Gostujoca-read	Gostujoca - branje	f
00030000-5629-f475-7977-8a830afa2280	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5629-f475-e513-8de6503b4656	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5629-f475-eff0-08199127ff91	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5629-f475-3182-3a16a6c3f703	Kupec-read	Kupec - branje	f
00030000-5629-f475-32b4-7ed433f6f875	Kupec-write	Kupec - spreminjanje	f
00030000-5629-f475-f3cf-d3fefbd754fa	NacinPlacina-read	NacinPlacina - branje	f
00030000-5629-f475-0ed5-f116f85f87ff	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5629-f475-10c9-8a0ff2e8f5ea	Option-read	Option - branje	f
00030000-5629-f475-fb50-0c4c7588f7a3	Option-write	Option - spreminjanje	f
00030000-5629-f475-a749-f63e312e4973	OptionValue-read	OptionValue - branje	f
00030000-5629-f475-0ffa-b39c33995b7e	OptionValue-write	OptionValue - spreminjanje	f
00030000-5629-f475-040b-f59aea5546c4	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	f
00030000-5629-f475-de60-d2a310f480c8	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	f
00030000-5629-f475-7e62-4a829e5a50b0	Oseba-read	Oseba - branje	f
00030000-5629-f475-547b-21eb88e28a00	Oseba-write	Oseba - spreminjanje	f
00030000-5629-f475-e4e7-bbe3c373e955	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5629-f475-ccbc-04ddddabc201	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5629-f475-d31c-743421d54203	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5629-f475-1b36-d4cad8455ad4	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5629-f475-c090-8ae2b676c36d	Pogodba-read	Pogodba - branje	f
00030000-5629-f475-f494-7b83d82e7ed6	Pogodba-write	Pogodba - spreminjanje	f
00030000-5629-f475-7482-2fba4616ec0f	Popa-read	Popa - branje	f
00030000-5629-f475-7b69-7c3e950718e2	Popa-write	Popa - spreminjanje	f
00030000-5629-f475-c60d-7e724ab4ad7d	Posta-read	Posta - branje	f
00030000-5629-f475-87a2-01c8c42b7749	Posta-write	Posta - spreminjanje	f
00030000-5629-f475-dec0-09c24d90130c	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5629-f475-7cab-3d360f4d5119	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5629-f475-b55b-ae01ad7cc865	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5629-f475-9bde-76eb865a1f8c	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5629-f475-5a13-28bc90b755e9	PostniNaslov-read	PostniNaslov - branje	f
00030000-5629-f475-d9ea-e0eb204cc4fa	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5629-f475-916f-fefdc496873e	Predstava-read	Predstava - branje	f
00030000-5629-f475-d22d-bd884b332a64	Predstava-write	Predstava - spreminjanje	f
00030000-5629-f475-a124-2e6b222f1491	Praznik-read	Praznik - branje	f
00030000-5629-f475-b068-e3a2c9c329de	Praznik-write	Praznik - spreminjanje	f
00030000-5629-f475-e15a-b8515a436e60	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5629-f475-b964-cab9798e077a	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5629-f475-e2c8-90beaa876a31	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5629-f475-9e02-99ef19093d56	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5629-f475-d006-9a4559a93eca	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5629-f475-5bb2-e9d643bbe0cc	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5629-f475-c19e-23dff0062e7b	ProgramDela-read	ProgramDela - branje	f
00030000-5629-f475-d7b6-1ab5ac2a802e	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5629-f475-148e-9075c3a69550	ProgramFestival-read	ProgramFestival - branje	f
00030000-5629-f475-17b0-74b7b90f670b	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5629-f475-399b-f2e1ca3f29e2	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5629-f475-98d3-e89be864dd7a	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5629-f475-d7ab-b6aa355478e6	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5629-f475-9af9-23ec2c98310a	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5629-f475-708e-c4dfea6592ef	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5629-f475-75c6-0dab4aeb52a9	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5629-f475-3a70-b30011893115	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5629-f475-206a-b7df5cfeebed	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5629-f475-4927-8ba5b5cc4ab4	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5629-f475-997d-b0d6747fd540	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5629-f475-a7d1-987d68e7decc	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5629-f475-e791-17cf56b30ea6	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5629-f475-1a04-acca28261f1b	ProgramRazno-read	ProgramRazno - branje	f
00030000-5629-f475-2b82-fa26865a3498	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5629-f475-2120-bffebd378179	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5629-f475-4362-c042e23503ad	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5629-f475-3c3f-a87b9ad2d500	Prostor-read	Prostor - branje	f
00030000-5629-f475-98be-6248e593f4d0	Prostor-write	Prostor - spreminjanje	f
00030000-5629-f475-012a-7242c573ecfe	Racun-read	Racun - branje	f
00030000-5629-f475-1fb3-8fcf4f8c5279	Racun-write	Racun - spreminjanje	f
00030000-5629-f475-c08e-efb0a16401c7	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5629-f475-31b6-4e242420f2fb	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5629-f475-6993-515b2e6d2334	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5629-f475-4f22-1b3fb0d193c5	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5629-f475-453c-b0b08ab8693b	Rekvizit-read	Rekvizit - branje	f
00030000-5629-f475-344a-0b9c2296ad25	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5629-f475-22dd-d8e84e66d797	Revizija-read	Revizija - branje	f
00030000-5629-f475-37c1-67db930ee933	Revizija-write	Revizija - spreminjanje	f
00030000-5629-f475-1005-147fee42f0ef	Rezervacija-read	Rezervacija - branje	f
00030000-5629-f475-395b-4e0629285328	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5629-f475-2a71-6ca7709de976	SedezniRed-read	SedezniRed - branje	f
00030000-5629-f475-c715-c3c738cff4e2	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5629-f475-3df3-c92c0672dd7a	Sedez-read	Sedez - branje	f
00030000-5629-f475-ffd6-2645df974ff2	Sedez-write	Sedez - spreminjanje	f
00030000-5629-f475-145b-1594c63b1c88	Sezona-read	Sezona - branje	f
00030000-5629-f475-50e8-1d88be1de78f	Sezona-write	Sezona - spreminjanje	f
00030000-5629-f475-e7f3-7e1a0c039c34	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5629-f475-f48c-9cb1512a70ac	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5629-f475-7de3-8573640ec4b5	Stevilcenje-read	Stevilcenje - branje	f
00030000-5629-f475-f07c-f66cc0fdcf1a	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5629-f475-8a5d-e1c08b054d15	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5629-f475-be8a-fcc4721fdee6	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5629-f475-b7e6-51d555706b9c	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5629-f475-7f12-36ae32f5da36	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5629-f475-e576-6d9a6c2c60ce	Telefonska-read	Telefonska - branje	f
00030000-5629-f475-3017-09710f6952c6	Telefonska-write	Telefonska - spreminjanje	f
00030000-5629-f475-dacb-f50fc8bcff42	TerminStoritve-read	TerminStoritve - branje	f
00030000-5629-f475-5410-0e1df4b5f79b	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5629-f475-b611-47317d0b5f5d	TipFunkcije-read	TipFunkcije - branje	f
00030000-5629-f475-a1af-fe46129e56a8	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5629-f475-00f2-34875fdb504a	TipPopa-read	TipPopa - branje	f
00030000-5629-f475-9159-58413fd975c7	TipPopa-write	TipPopa - spreminjanje	f
00030000-5629-f475-4a8f-db388e1f08ae	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5629-f475-bc49-5fa52052061e	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5629-f475-f407-321f278eac42	TipVaje-read	TipVaje - branje	f
00030000-5629-f475-8d41-c22664ae89c2	TipVaje-write	TipVaje - spreminjanje	f
00030000-5629-f475-898a-39cc5fa151b6	Trr-read	Trr - branje	f
00030000-5629-f475-0f4d-8958ca7a32fc	Trr-write	Trr - spreminjanje	f
00030000-5629-f475-a499-e27f1019a925	Uprizoritev-read	Uprizoritev - branje	f
00030000-5629-f475-3761-66602580ce65	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5629-f475-6072-5c7f5b9fa747	Vaja-read	Vaja - branje	f
00030000-5629-f475-61a1-a5b620d06bf7	Vaja-write	Vaja - spreminjanje	f
00030000-5629-f475-96e4-045cfcff7640	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5629-f475-d231-7b0465a5ef56	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5629-f475-46b5-c40a2666760b	VrstaStroska-read	VrstaStroska - branje	f
00030000-5629-f475-6f03-260f56d23049	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5629-f475-838a-afd503c461c7	Zaposlitev-read	Zaposlitev - branje	f
00030000-5629-f475-2b95-b1c167b19d1a	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5629-f475-b4e1-f35cfd48ddad	Zasedenost-read	Zasedenost - branje	f
00030000-5629-f475-5eb3-57e5001fe1c8	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5629-f475-432c-8dafd347fe37	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5629-f475-8b0c-f271624dbe82	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5629-f475-5fb6-706b3c9aa131	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5629-f475-9788-27866fb35a0f	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5629-f475-f989-9a4a831f22b0	Job-read	Branje opravil - samo zase - branje	f
00030000-5629-f475-45e2-08d654a570b4	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5629-f475-307c-ded75c02c0e6	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5629-f475-28ba-6f8a79a7133c	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5629-f475-46ba-4e9eec6dc634	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5629-f475-b4ab-9b8acd7824f8	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5629-f475-5d93-3b433fd4a0ef	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5629-f475-85f4-9de83ef7a16c	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5629-f475-6f07-23dd6dd8ec9f	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5629-f475-fc30-450e9576a718	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5629-f475-6007-a5c7cfccad28	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5629-f475-083b-6bc54f3841a6	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5629-f475-4f73-7d99bf702a17	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5629-f475-7a5e-3e9f1abc2c7b	Datoteka-write	Datoteka - spreminjanje	f
00030000-5629-f475-bcc0-1dead14d0b7e	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3054 (class 0 OID 23171766)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5629-f475-2ddc-241f0ec8cfd5	00030000-5629-f475-4001-4acd65bc7eb6
00020000-5629-f475-95f1-74782506be6f	00030000-5629-f475-bfa6-f2a57207a8a8
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-2499-dab09af7f1ce
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-4bca-90b8c0bdfffb
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-3560-0f47f1ba0bf3
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-a0e7-58547af67bc6
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-e571-6ec97b44f423
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-a0d3-6fa6c29f30e9
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-5d00-d084f2515427
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-1bfe-1dd615e1dcb5
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-bfa6-f2a57207a8a8
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-572e-7705773379e9
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-978a-a37c662fe896
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-e177-5751ac8e9dd6
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-074f-d47c7a5e5157
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-338d-acfde7b17c74
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-dc10-094dbd7e6874
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-7977-8a830afa2280
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-e513-8de6503b4656
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-eff0-08199127ff91
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-10c9-8a0ff2e8f5ea
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-a749-f63e312e4973
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-7e62-4a829e5a50b0
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-547b-21eb88e28a00
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-7482-2fba4616ec0f
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-7b69-7c3e950718e2
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-c60d-7e724ab4ad7d
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-87a2-01c8c42b7749
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-5a13-28bc90b755e9
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-d9ea-e0eb204cc4fa
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-916f-fefdc496873e
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-d22d-bd884b332a64
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-d006-9a4559a93eca
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-5bb2-e9d643bbe0cc
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-3c3f-a87b9ad2d500
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-98be-6248e593f4d0
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-6993-515b2e6d2334
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-4f22-1b3fb0d193c5
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-453c-b0b08ab8693b
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-344a-0b9c2296ad25
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-145b-1594c63b1c88
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-50e8-1d88be1de78f
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-b611-47317d0b5f5d
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-a499-e27f1019a925
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-3761-66602580ce65
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-6072-5c7f5b9fa747
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-61a1-a5b620d06bf7
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-b4e1-f35cfd48ddad
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-5eb3-57e5001fe1c8
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-432c-8dafd347fe37
00020000-5629-f475-5e4f-78382811f4c2	00030000-5629-f475-5fb6-706b3c9aa131
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-2499-dab09af7f1ce
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-e571-6ec97b44f423
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-a0d3-6fa6c29f30e9
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-bfa6-f2a57207a8a8
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-074f-d47c7a5e5157
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-dc10-094dbd7e6874
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-e513-8de6503b4656
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-eff0-08199127ff91
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-10c9-8a0ff2e8f5ea
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-a749-f63e312e4973
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-7e62-4a829e5a50b0
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-547b-21eb88e28a00
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-7482-2fba4616ec0f
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-c60d-7e724ab4ad7d
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-5a13-28bc90b755e9
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-d9ea-e0eb204cc4fa
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-916f-fefdc496873e
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-3c3f-a87b9ad2d500
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-6993-515b2e6d2334
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-453c-b0b08ab8693b
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-145b-1594c63b1c88
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-e576-6d9a6c2c60ce
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-3017-09710f6952c6
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-898a-39cc5fa151b6
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-0f4d-8958ca7a32fc
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-838a-afd503c461c7
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-2b95-b1c167b19d1a
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-432c-8dafd347fe37
00020000-5629-f475-3fab-4bfb406453fb	00030000-5629-f475-5fb6-706b3c9aa131
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-2499-dab09af7f1ce
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-3560-0f47f1ba0bf3
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-e571-6ec97b44f423
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-26d0-1cc86660e2ac
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-6d71-8b6d3598c2de
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-4128-c4e4ccf669ec
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-a0d3-6fa6c29f30e9
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-bfa6-f2a57207a8a8
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-978a-a37c662fe896
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-074f-d47c7a5e5157
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-dc10-094dbd7e6874
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-e513-8de6503b4656
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-10c9-8a0ff2e8f5ea
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-a749-f63e312e4973
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-7e62-4a829e5a50b0
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-7482-2fba4616ec0f
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-c60d-7e724ab4ad7d
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-916f-fefdc496873e
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-d006-9a4559a93eca
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-3c3f-a87b9ad2d500
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-6993-515b2e6d2334
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-453c-b0b08ab8693b
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-145b-1594c63b1c88
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-b611-47317d0b5f5d
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-6072-5c7f5b9fa747
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-b4e1-f35cfd48ddad
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-432c-8dafd347fe37
00020000-5629-f475-5542-4d89af55a177	00030000-5629-f475-5fb6-706b3c9aa131
00020000-5629-f475-ab0a-43aa47f8cdf1	00030000-5629-f475-2499-dab09af7f1ce
00020000-5629-f475-ab0a-43aa47f8cdf1	00030000-5629-f475-4bca-90b8c0bdfffb
00020000-5629-f475-ab0a-43aa47f8cdf1	00030000-5629-f475-a0e7-58547af67bc6
00020000-5629-f475-ab0a-43aa47f8cdf1	00030000-5629-f475-e571-6ec97b44f423
00020000-5629-f475-ab0a-43aa47f8cdf1	00030000-5629-f475-a0d3-6fa6c29f30e9
00020000-5629-f475-ab0a-43aa47f8cdf1	00030000-5629-f475-bfa6-f2a57207a8a8
00020000-5629-f475-ab0a-43aa47f8cdf1	00030000-5629-f475-074f-d47c7a5e5157
00020000-5629-f475-ab0a-43aa47f8cdf1	00030000-5629-f475-dc10-094dbd7e6874
00020000-5629-f475-ab0a-43aa47f8cdf1	00030000-5629-f475-10c9-8a0ff2e8f5ea
00020000-5629-f475-ab0a-43aa47f8cdf1	00030000-5629-f475-a749-f63e312e4973
00020000-5629-f475-ab0a-43aa47f8cdf1	00030000-5629-f475-7482-2fba4616ec0f
00020000-5629-f475-ab0a-43aa47f8cdf1	00030000-5629-f475-c60d-7e724ab4ad7d
00020000-5629-f475-ab0a-43aa47f8cdf1	00030000-5629-f475-916f-fefdc496873e
00020000-5629-f475-ab0a-43aa47f8cdf1	00030000-5629-f475-3c3f-a87b9ad2d500
00020000-5629-f475-ab0a-43aa47f8cdf1	00030000-5629-f475-6993-515b2e6d2334
00020000-5629-f475-ab0a-43aa47f8cdf1	00030000-5629-f475-453c-b0b08ab8693b
00020000-5629-f475-ab0a-43aa47f8cdf1	00030000-5629-f475-145b-1594c63b1c88
00020000-5629-f475-ab0a-43aa47f8cdf1	00030000-5629-f475-b611-47317d0b5f5d
00020000-5629-f475-ab0a-43aa47f8cdf1	00030000-5629-f475-432c-8dafd347fe37
00020000-5629-f475-ab0a-43aa47f8cdf1	00030000-5629-f475-5fb6-706b3c9aa131
00020000-5629-f475-6a4d-d6ddfe9f363e	00030000-5629-f475-2499-dab09af7f1ce
00020000-5629-f475-6a4d-d6ddfe9f363e	00030000-5629-f475-e571-6ec97b44f423
00020000-5629-f475-6a4d-d6ddfe9f363e	00030000-5629-f475-a0d3-6fa6c29f30e9
00020000-5629-f475-6a4d-d6ddfe9f363e	00030000-5629-f475-bfa6-f2a57207a8a8
00020000-5629-f475-6a4d-d6ddfe9f363e	00030000-5629-f475-074f-d47c7a5e5157
00020000-5629-f475-6a4d-d6ddfe9f363e	00030000-5629-f475-dc10-094dbd7e6874
00020000-5629-f475-6a4d-d6ddfe9f363e	00030000-5629-f475-10c9-8a0ff2e8f5ea
00020000-5629-f475-6a4d-d6ddfe9f363e	00030000-5629-f475-a749-f63e312e4973
00020000-5629-f475-6a4d-d6ddfe9f363e	00030000-5629-f475-7482-2fba4616ec0f
00020000-5629-f475-6a4d-d6ddfe9f363e	00030000-5629-f475-c60d-7e724ab4ad7d
00020000-5629-f475-6a4d-d6ddfe9f363e	00030000-5629-f475-916f-fefdc496873e
00020000-5629-f475-6a4d-d6ddfe9f363e	00030000-5629-f475-3c3f-a87b9ad2d500
00020000-5629-f475-6a4d-d6ddfe9f363e	00030000-5629-f475-6993-515b2e6d2334
00020000-5629-f475-6a4d-d6ddfe9f363e	00030000-5629-f475-453c-b0b08ab8693b
00020000-5629-f475-6a4d-d6ddfe9f363e	00030000-5629-f475-145b-1594c63b1c88
00020000-5629-f475-6a4d-d6ddfe9f363e	00030000-5629-f475-dacb-f50fc8bcff42
00020000-5629-f475-6a4d-d6ddfe9f363e	00030000-5629-f475-20f8-e9e0b8572a23
00020000-5629-f475-6a4d-d6ddfe9f363e	00030000-5629-f475-b611-47317d0b5f5d
00020000-5629-f475-6a4d-d6ddfe9f363e	00030000-5629-f475-432c-8dafd347fe37
00020000-5629-f475-6a4d-d6ddfe9f363e	00030000-5629-f475-5fb6-706b3c9aa131
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-8abf-e082d8915554
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-4001-4acd65bc7eb6
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-2499-dab09af7f1ce
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-4bca-90b8c0bdfffb
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-3560-0f47f1ba0bf3
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-a0e7-58547af67bc6
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-e571-6ec97b44f423
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-26d0-1cc86660e2ac
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-77d9-f2fc47711c81
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-85d5-62987f0af964
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-6d71-8b6d3598c2de
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-3d14-545b11b72d67
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-4128-c4e4ccf669ec
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-bf6a-c419cb6c8ea7
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-a0d3-6fa6c29f30e9
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-5d00-d084f2515427
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-1bfe-1dd615e1dcb5
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-8571-0d539791dfef
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-7549-0f4b1cae98ee
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-bfa6-f2a57207a8a8
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-572e-7705773379e9
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-e53e-d694263e2d69
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-e2a6-eb861590a77c
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-978a-a37c662fe896
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-e177-5751ac8e9dd6
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-074f-d47c7a5e5157
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-338d-acfde7b17c74
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-dc10-094dbd7e6874
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-7977-8a830afa2280
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-e513-8de6503b4656
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-eff0-08199127ff91
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-3182-3a16a6c3f703
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-32b4-7ed433f6f875
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-f3cf-d3fefbd754fa
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-0ed5-f116f85f87ff
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-10c9-8a0ff2e8f5ea
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-a749-f63e312e4973
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-0ffa-b39c33995b7e
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-fb50-0c4c7588f7a3
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-040b-f59aea5546c4
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-de60-d2a310f480c8
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-7e62-4a829e5a50b0
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-7128-1088a61ba713
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-547b-21eb88e28a00
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-e4e7-bbe3c373e955
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-ccbc-04ddddabc201
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-d31c-743421d54203
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-1b36-d4cad8455ad4
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-c090-8ae2b676c36d
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-f494-7b83d82e7ed6
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-7482-2fba4616ec0f
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-7b69-7c3e950718e2
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-c60d-7e724ab4ad7d
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-dec0-09c24d90130c
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-7cab-3d360f4d5119
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-b55b-ae01ad7cc865
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-9bde-76eb865a1f8c
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-87a2-01c8c42b7749
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-5a13-28bc90b755e9
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-d9ea-e0eb204cc4fa
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-a124-2e6b222f1491
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-b068-e3a2c9c329de
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-916f-fefdc496873e
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-d22d-bd884b332a64
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-e15a-b8515a436e60
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-b964-cab9798e077a
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-e2c8-90beaa876a31
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-9e02-99ef19093d56
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-d006-9a4559a93eca
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-5bb2-e9d643bbe0cc
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-ce81-a99051c374d3
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-c19e-23dff0062e7b
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-b222-db86c85fccce
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-d7b6-1ab5ac2a802e
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-148e-9075c3a69550
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-17b0-74b7b90f670b
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-399b-f2e1ca3f29e2
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-98d3-e89be864dd7a
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-d7ab-b6aa355478e6
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-9af9-23ec2c98310a
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-708e-c4dfea6592ef
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-75c6-0dab4aeb52a9
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-3a70-b30011893115
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-206a-b7df5cfeebed
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-4927-8ba5b5cc4ab4
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-997d-b0d6747fd540
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-a7d1-987d68e7decc
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-e791-17cf56b30ea6
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-1a04-acca28261f1b
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-2b82-fa26865a3498
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-2120-bffebd378179
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-4362-c042e23503ad
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-3c3f-a87b9ad2d500
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-98be-6248e593f4d0
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-012a-7242c573ecfe
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-1fb3-8fcf4f8c5279
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-c08e-efb0a16401c7
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-31b6-4e242420f2fb
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-6993-515b2e6d2334
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-4f22-1b3fb0d193c5
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-453c-b0b08ab8693b
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-344a-0b9c2296ad25
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-22dd-d8e84e66d797
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-37c1-67db930ee933
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-1005-147fee42f0ef
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-395b-4e0629285328
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-2a71-6ca7709de976
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-c715-c3c738cff4e2
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-3df3-c92c0672dd7a
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-ffd6-2645df974ff2
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-145b-1594c63b1c88
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-50e8-1d88be1de78f
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-e7f3-7e1a0c039c34
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-f48c-9cb1512a70ac
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-7de3-8573640ec4b5
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-8a5d-e1c08b054d15
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-be8a-fcc4721fdee6
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-f07c-f66cc0fdcf1a
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-b7e6-51d555706b9c
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-7f12-36ae32f5da36
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-e576-6d9a6c2c60ce
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-3017-09710f6952c6
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-dacb-f50fc8bcff42
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-20f8-e9e0b8572a23
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-5410-0e1df4b5f79b
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-b611-47317d0b5f5d
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-a1af-fe46129e56a8
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-00f2-34875fdb504a
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-9159-58413fd975c7
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-4a8f-db388e1f08ae
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-bc49-5fa52052061e
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-f407-321f278eac42
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-8d41-c22664ae89c2
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-898a-39cc5fa151b6
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-0f4d-8958ca7a32fc
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-a499-e27f1019a925
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-3761-66602580ce65
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-6072-5c7f5b9fa747
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-61a1-a5b620d06bf7
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-96e4-045cfcff7640
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-d231-7b0465a5ef56
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-46b5-c40a2666760b
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-6f03-260f56d23049
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-838a-afd503c461c7
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-2b95-b1c167b19d1a
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-b4e1-f35cfd48ddad
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-5eb3-57e5001fe1c8
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-432c-8dafd347fe37
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-8b0c-f271624dbe82
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-5fb6-706b3c9aa131
00020000-5629-f477-4c78-f7870786e51c	00030000-5629-f475-9788-27866fb35a0f
\.


--
-- TOC entry 3088 (class 0 OID 23172138)
-- Dependencies: 213
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3092 (class 0 OID 23172172)
-- Dependencies: 217
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 23172309)
-- Dependencies: 229
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5629-f477-ad55-e276116a0068	00090000-5629-f477-a02c-0d6639e11874	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5629-f477-f636-e8837ef427c9	00090000-5629-f477-e742-11db904e5f77	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5629-f477-e26b-e51c5fd500c5	00090000-5629-f477-4c4b-1cf5c4d9905c	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5629-f477-f22f-0d908b279aed	00090000-5629-f477-0fdc-48800e1e046e	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3060 (class 0 OID 23171836)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5629-f477-605c-f1abaecac668	\N	00040000-5629-f475-b9d7-54f257d6118e	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5629-f477-7392-5fbf61b48acd	\N	00040000-5629-f475-b9d7-54f257d6118e	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5629-f477-6c6f-91a7ef6a6b84	\N	00040000-5629-f475-b9d7-54f257d6118e	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5629-f477-b6dd-ae46120c19f8	\N	00040000-5629-f475-b9d7-54f257d6118e	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5629-f477-28e8-8eeb6f4e9f89	\N	00040000-5629-f475-b9d7-54f257d6118e	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5629-f477-4439-27bc6b7a9163	\N	00040000-5629-f475-8804-45b6aa82fe86	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5629-f477-01d6-03089448546f	\N	00040000-5629-f475-9923-ee865595ed9a	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5629-f477-654c-134909426da8	\N	00040000-5629-f475-447e-ede5d46f2101	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5629-f477-6aea-b35b11826d13	\N	00040000-5629-f475-7772-9789f96b2642	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5629-f478-e6ac-68b95d9b0607	\N	00040000-5629-f475-b9d7-54f257d6118e	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3063 (class 0 OID 23171881)
-- Dependencies: 188
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5629-f474-d7ab-65aae3996c61	8341	Adlešiči
00050000-5629-f474-1a4f-4026936d3624	5270	Ajdovščina
00050000-5629-f474-4a94-0b93850baf6a	6280	Ankaran/Ancarano
00050000-5629-f474-ae5a-6f80e7cce128	9253	Apače
00050000-5629-f474-09ac-14821516e927	8253	Artiče
00050000-5629-f474-09e3-82c071a23220	4275	Begunje na Gorenjskem
00050000-5629-f474-783e-c93ad1605c3f	1382	Begunje pri Cerknici
00050000-5629-f474-5f0a-69db529848c8	9231	Beltinci
00050000-5629-f474-063c-68f84b58d57a	2234	Benedikt
00050000-5629-f474-5462-464b34ce378c	2345	Bistrica ob Dravi
00050000-5629-f474-191c-77366e5b220f	3256	Bistrica ob Sotli
00050000-5629-f474-7486-41be96d7dff1	8259	Bizeljsko
00050000-5629-f474-b3d1-07e62b675697	1223	Blagovica
00050000-5629-f474-317e-87bb707a8497	8283	Blanca
00050000-5629-f474-562b-f97ff9ffe959	4260	Bled
00050000-5629-f474-7360-5c353ff748fe	4273	Blejska Dobrava
00050000-5629-f474-b03e-928a10c9d916	9265	Bodonci
00050000-5629-f474-93d5-914c3f66ed9d	9222	Bogojina
00050000-5629-f474-f18a-d640ae020043	4263	Bohinjska Bela
00050000-5629-f474-e213-619d6c1bc60f	4264	Bohinjska Bistrica
00050000-5629-f474-c41a-97acf9f6c720	4265	Bohinjsko jezero
00050000-5629-f474-d8b1-5ced24372276	1353	Borovnica
00050000-5629-f474-9ab4-d82a3c5d61e3	8294	Boštanj
00050000-5629-f474-7a6e-f9524ae4d135	5230	Bovec
00050000-5629-f474-cdc4-514d326bafa2	5295	Branik
00050000-5629-f474-7c74-1c376d3eddc1	3314	Braslovče
00050000-5629-f474-7897-b3e642b50ab9	5223	Breginj
00050000-5629-f474-fde7-7e2d581bd897	8280	Brestanica
00050000-5629-f474-440f-8cef19ae8a82	2354	Bresternica
00050000-5629-f474-9591-3b641a4f2b43	4243	Brezje
00050000-5629-f474-c926-8c565e217bd7	1351	Brezovica pri Ljubljani
00050000-5629-f474-87f8-1553ea24a021	8250	Brežice
00050000-5629-f474-5b9e-20378b9c246a	4210	Brnik - Aerodrom
00050000-5629-f474-1873-486ae4ab486f	8321	Brusnice
00050000-5629-f474-8ace-f4c5100016d7	3255	Buče
00050000-5629-f474-ae76-9482659e6d4b	8276	Bučka 
00050000-5629-f474-d446-d2565f7f22e1	9261	Cankova
00050000-5629-f474-9eb0-2745b28c8108	3000	Celje 
00050000-5629-f474-e52f-5130ddcaf613	3001	Celje - poštni predali
00050000-5629-f474-1fb9-26331f9dbf48	4207	Cerklje na Gorenjskem
00050000-5629-f474-e438-c2f208a9018a	8263	Cerklje ob Krki
00050000-5629-f474-d628-6e42919f5c08	1380	Cerknica
00050000-5629-f474-eb14-93b688538980	5282	Cerkno
00050000-5629-f474-7b13-a0a68a2c3eae	2236	Cerkvenjak
00050000-5629-f474-ec85-15002bb621cf	2215	Ceršak
00050000-5629-f474-7b51-884e101a38e2	2326	Cirkovce
00050000-5629-f474-7dc2-f9e803fb16cc	2282	Cirkulane
00050000-5629-f474-725d-e2dcab62f916	5273	Col
00050000-5629-f474-9699-6b7a77f20bbe	8251	Čatež ob Savi
00050000-5629-f474-b07c-0a9e2e843113	1413	Čemšenik
00050000-5629-f474-4f07-f9c76a5075e6	5253	Čepovan
00050000-5629-f474-5bcd-c3341ba3f200	9232	Črenšovci
00050000-5629-f474-f906-1014ca74eb70	2393	Črna na Koroškem
00050000-5629-f474-da0b-faec53ac129f	6275	Črni Kal
00050000-5629-f474-0cb5-0d23a9e6c068	5274	Črni Vrh nad Idrijo
00050000-5629-f474-6b4d-5041d961a57d	5262	Črniče
00050000-5629-f474-dc1f-b631389dde73	8340	Črnomelj
00050000-5629-f474-2035-377bf82e1da4	6271	Dekani
00050000-5629-f474-5dbe-ab6cf715fa8f	5210	Deskle
00050000-5629-f474-8d0f-7cfff89ce948	2253	Destrnik
00050000-5629-f474-fc46-cbed40aa83f5	6215	Divača
00050000-5629-f474-6b20-089433835268	1233	Dob
00050000-5629-f474-9a4c-c7b7d9264be4	3224	Dobje pri Planini
00050000-5629-f474-07f8-953368cf7c2b	8257	Dobova
00050000-5629-f474-aab9-a2dee14331ed	1423	Dobovec
00050000-5629-f474-b7a9-f537e6e0cac1	5263	Dobravlje
00050000-5629-f474-88eb-e6b398750d21	3204	Dobrna
00050000-5629-f474-b3c9-b31f7639deed	8211	Dobrnič
00050000-5629-f474-20c9-efc0c6ee60eb	1356	Dobrova
00050000-5629-f474-9fc4-1424d22fb821	9223	Dobrovnik/Dobronak 
00050000-5629-f474-533b-332de17b149f	5212	Dobrovo v Brdih
00050000-5629-f474-0532-3446faf5126c	1431	Dol pri Hrastniku
00050000-5629-f474-5fbd-cd80f3ddd46d	1262	Dol pri Ljubljani
00050000-5629-f474-10f0-b4e924b383de	1273	Dole pri Litiji
00050000-5629-f474-2225-3ec9f6212d38	1331	Dolenja vas
00050000-5629-f474-1109-704e87f3aacd	8350	Dolenjske Toplice
00050000-5629-f474-47ae-ce3cbde9da68	1230	Domžale
00050000-5629-f474-878f-bddbacb312e5	2252	Dornava
00050000-5629-f474-c484-19a71859d658	5294	Dornberk
00050000-5629-f474-23a5-08c49cee4e63	1319	Draga
00050000-5629-f474-fb49-814a9d96f9f2	8343	Dragatuš
00050000-5629-f474-8f05-4ec29e9bd130	3222	Dramlje
00050000-5629-f474-3dd6-d62deb6d04c8	2370	Dravograd
00050000-5629-f474-3b95-95a3bb9a7ada	4203	Duplje
00050000-5629-f474-1b91-2e7763d79a28	6221	Dutovlje
00050000-5629-f474-8244-d175220e9670	8361	Dvor
00050000-5629-f474-5185-c1762ffd3c31	2343	Fala
00050000-5629-f474-dda2-1dcb95415e01	9208	Fokovci
00050000-5629-f474-332b-c19359f79689	2313	Fram
00050000-5629-f474-f1c8-b687a90e442d	3213	Frankolovo
00050000-5629-f474-a58d-8bb9cfdb2570	1274	Gabrovka
00050000-5629-f474-fae6-9ddf1bdf5800	8254	Globoko
00050000-5629-f474-b1bf-c5740eea61df	5275	Godovič
00050000-5629-f474-220f-e5eb4efa7cd3	4204	Golnik
00050000-5629-f474-2191-e1f90434a5f7	3303	Gomilsko
00050000-5629-f474-8f93-0f14a57abbfd	4224	Gorenja vas
00050000-5629-f474-ac39-18f459e53aac	3263	Gorica pri Slivnici
00050000-5629-f474-ea62-263d35598465	2272	Gorišnica
00050000-5629-f474-bb96-0c21714e7b1e	9250	Gornja Radgona
00050000-5629-f474-df53-0c0edd1aa56b	3342	Gornji Grad
00050000-5629-f474-8442-2088ad8b3205	4282	Gozd Martuljek
00050000-5629-f474-3220-838cb01e0412	6272	Gračišče
00050000-5629-f474-1a00-14de6c8478cf	9264	Grad
00050000-5629-f474-9c91-ab248b520aa7	8332	Gradac
00050000-5629-f474-d658-9a5cf5b99bbc	1384	Grahovo
00050000-5629-f474-1d62-34ece633738e	5242	Grahovo ob Bači
00050000-5629-f474-28ef-acf227614220	5251	Grgar
00050000-5629-f474-eb53-419ac176d32f	3302	Griže
00050000-5629-f474-3542-104dc7a458dc	3231	Grobelno
00050000-5629-f474-5503-9fc4007aa82c	1290	Grosuplje
00050000-5629-f474-f3cc-7e9b0895d19f	2288	Hajdina
00050000-5629-f474-ef69-717bc2c1ef4f	8362	Hinje
00050000-5629-f474-e6bd-bd09a7adba01	2311	Hoče
00050000-5629-f474-8027-0c4e1f8ec121	9205	Hodoš/Hodos
00050000-5629-f474-87f7-c5b857666900	1354	Horjul
00050000-5629-f474-c539-ced95e499008	1372	Hotedršica
00050000-5629-f474-0b8d-d68226c586a5	1430	Hrastnik
00050000-5629-f474-380a-551a5024b34c	6225	Hruševje
00050000-5629-f474-2bad-19e0c2b6f652	4276	Hrušica
00050000-5629-f474-c027-1a4235bf72a5	5280	Idrija
00050000-5629-f474-c6f6-ac4d3a498145	1292	Ig
00050000-5629-f474-978e-603d24342564	6250	Ilirska Bistrica
00050000-5629-f474-9fad-0f1421d72310	6251	Ilirska Bistrica-Trnovo
00050000-5629-f474-e569-e8c94507901b	1295	Ivančna Gorica
00050000-5629-f474-7c0a-b4060308289f	2259	Ivanjkovci
00050000-5629-f474-416c-3045a8e646aa	1411	Izlake
00050000-5629-f474-6934-549fa4859588	6310	Izola/Isola
00050000-5629-f474-2159-938689d3273b	2222	Jakobski Dol
00050000-5629-f474-e99c-fd80aa0723f5	2221	Jarenina
00050000-5629-f474-27df-77fa2c22bb98	6254	Jelšane
00050000-5629-f474-a040-f612237d8e1b	4270	Jesenice
00050000-5629-f474-9845-9b582c27c8fb	8261	Jesenice na Dolenjskem
00050000-5629-f474-b23f-a0e3552b798e	3273	Jurklošter
00050000-5629-f474-7647-6f3085cbbe1b	2223	Jurovski Dol
00050000-5629-f474-232f-28c5f7c1b41d	2256	Juršinci
00050000-5629-f474-85e5-10c0cd39ebdd	5214	Kal nad Kanalom
00050000-5629-f474-3afa-99b53573060a	3233	Kalobje
00050000-5629-f474-b715-ea35ddfdf1a6	4246	Kamna Gorica
00050000-5629-f474-f267-de7bd48deafe	2351	Kamnica
00050000-5629-f474-3627-9a29f35ed50b	1241	Kamnik
00050000-5629-f474-9f68-d9f86f61dcc2	5213	Kanal
00050000-5629-f474-a2a0-47654750ace5	8258	Kapele
00050000-5629-f474-50ab-fa302b1c7388	2362	Kapla
00050000-5629-f474-5912-9f665269ba51	2325	Kidričevo
00050000-5629-f474-fadd-e42806cf86ff	1412	Kisovec
00050000-5629-f474-8ea9-878ea25af6b8	6253	Knežak
00050000-5629-f474-8f9d-3bd2d6ebe5d4	5222	Kobarid
00050000-5629-f474-2305-d0214de9c0bc	9227	Kobilje
00050000-5629-f474-4a6b-81a23cf7c084	1330	Kočevje
00050000-5629-f474-7feb-ce9c290e3238	1338	Kočevska Reka
00050000-5629-f474-846b-5cd94654ad82	2276	Kog
00050000-5629-f474-c6eb-36341c361e26	5211	Kojsko
00050000-5629-f474-95fd-69e059b16068	6223	Komen
00050000-5629-f474-d2c8-5acb5049d61d	1218	Komenda
00050000-5629-f474-56a2-6a0618f3e91d	6000	Koper/Capodistria 
00050000-5629-f474-8540-e34253b63e56	6001	Koper/Capodistria - poštni predali
00050000-5629-f474-4031-6a76b8164a20	8282	Koprivnica
00050000-5629-f474-d54c-6d1df6e73486	5296	Kostanjevica na Krasu
00050000-5629-f474-3ff1-bb8397a03e0d	8311	Kostanjevica na Krki
00050000-5629-f474-d6cd-e4a39049de85	1336	Kostel
00050000-5629-f474-9977-1bb39548dc43	6256	Košana
00050000-5629-f474-4193-3810856fafdf	2394	Kotlje
00050000-5629-f474-b1cc-8fafb69f9b15	6240	Kozina
00050000-5629-f474-b5d8-4d879b284977	3260	Kozje
00050000-5629-f474-3df8-d3281fa7f084	4000	Kranj 
00050000-5629-f474-db22-0bc6ae71703c	4001	Kranj - poštni predali
00050000-5629-f474-b61d-fecc50a717d7	4280	Kranjska Gora
00050000-5629-f474-9ff4-18a0270b5465	1281	Kresnice
00050000-5629-f474-cc5b-2b088edd30c4	4294	Križe
00050000-5629-f474-535c-c8e876acf050	9206	Križevci
00050000-5629-f474-a7ed-5f4cedbaff4c	9242	Križevci pri Ljutomeru
00050000-5629-f474-4953-4186682ad256	1301	Krka
00050000-5629-f474-8f5f-1676424a39ad	8296	Krmelj
00050000-5629-f474-2320-999a099335cb	4245	Kropa
00050000-5629-f474-da63-dd00e6dcf444	8262	Krška vas
00050000-5629-f474-78e5-c2e131f808f0	8270	Krško
00050000-5629-f474-0a19-d93503bb49df	9263	Kuzma
00050000-5629-f474-eb14-a1cca044190e	2318	Laporje
00050000-5629-f474-bda6-63fd19126868	3270	Laško
00050000-5629-f474-6163-4eb193c316fb	1219	Laze v Tuhinju
00050000-5629-f474-7d9b-5e41dced20de	2230	Lenart v Slovenskih goricah
00050000-5629-f474-d376-edbdc6014ed9	9220	Lendava/Lendva
00050000-5629-f474-902b-93f60a6bce58	4248	Lesce
00050000-5629-f474-be52-7721a70d1de9	3261	Lesično
00050000-5629-f474-a239-ab802bbd1fb4	8273	Leskovec pri Krškem
00050000-5629-f474-ee4d-d3695a30e7e9	2372	Libeliče
00050000-5629-f474-7364-5ad473b263df	2341	Limbuš
00050000-5629-f474-7041-ed0a33d5a548	1270	Litija
00050000-5629-f474-e641-9db6ead1c134	3202	Ljubečna
00050000-5629-f474-0e4a-90e1c2e08e21	1000	Ljubljana 
00050000-5629-f474-b1ce-49f5fc63e4ba	1001	Ljubljana - poštni predali
00050000-5629-f474-7c09-d18f654120f9	1231	Ljubljana - Črnuče
00050000-5629-f474-e6aa-b5bc2041259f	1261	Ljubljana - Dobrunje
00050000-5629-f474-1d39-aba34feb6565	1260	Ljubljana - Polje
00050000-5629-f474-dfe0-830a7ce7960c	1210	Ljubljana - Šentvid
00050000-5629-f474-7631-6613b43456b6	1211	Ljubljana - Šmartno
00050000-5629-f474-8b78-11292aa8c094	3333	Ljubno ob Savinji
00050000-5629-f474-27ed-4b922dd3c8eb	9240	Ljutomer
00050000-5629-f474-626b-4247cd61cd79	3215	Loče
00050000-5629-f474-1630-428c6fb04c33	5231	Log pod Mangartom
00050000-5629-f474-57d5-a92f5b6f816a	1358	Log pri Brezovici
00050000-5629-f474-69d3-8a81e547823e	1370	Logatec
00050000-5629-f474-641c-efebaaaed5b7	1371	Logatec
00050000-5629-f474-a4c5-5b14ec982a1d	1434	Loka pri Zidanem Mostu
00050000-5629-f474-d305-04f114be8e35	3223	Loka pri Žusmu
00050000-5629-f474-cb89-858ad9443112	6219	Lokev
00050000-5629-f474-c317-6e132ccc2cbd	1318	Loški Potok
00050000-5629-f474-8d26-67fc73d90911	2324	Lovrenc na Dravskem polju
00050000-5629-f474-ce75-3addf6bef0d5	2344	Lovrenc na Pohorju
00050000-5629-f474-c4d5-2088433c7ca7	3334	Luče
00050000-5629-f474-d403-011534f60ee6	1225	Lukovica
00050000-5629-f474-2849-93a565252bbb	9202	Mačkovci
00050000-5629-f474-d7f4-690c47e21a2a	2322	Majšperk
00050000-5629-f474-9e22-476c1557327b	2321	Makole
00050000-5629-f474-afc4-787c697d1a4b	9243	Mala Nedelja
00050000-5629-f474-d459-75f3592d07fd	2229	Malečnik
00050000-5629-f474-b32e-5ca839189d29	6273	Marezige
00050000-5629-f474-ad89-f1d5c9baa5a0	2000	Maribor 
00050000-5629-f474-c71f-b75b7ade7f00	2001	Maribor - poštni predali
00050000-5629-f474-48ad-bcb189b2bbe1	2206	Marjeta na Dravskem polju
00050000-5629-f474-13de-e19e3f8e1a91	2281	Markovci
00050000-5629-f474-1186-7f96f22b64af	9221	Martjanci
00050000-5629-f474-811b-1721acfa6195	6242	Materija
00050000-5629-f474-e502-4596e3fb5701	4211	Mavčiče
00050000-5629-f474-e419-5c08d1c32ce4	1215	Medvode
00050000-5629-f474-f4ae-6f7bc5f20889	1234	Mengeš
00050000-5629-f474-f078-08ad17f246c3	8330	Metlika
00050000-5629-f474-94b9-899c1df92a7a	2392	Mežica
00050000-5629-f474-8830-37c673fb045b	2204	Miklavž na Dravskem polju
00050000-5629-f474-6c7e-d9aa3d77cde0	2275	Miklavž pri Ormožu
00050000-5629-f474-277c-0f386bb74382	5291	Miren
00050000-5629-f474-f568-895a14fd4489	8233	Mirna
00050000-5629-f474-aeca-12de577dcb6f	8216	Mirna Peč
00050000-5629-f474-64cf-0bcb2effc186	2382	Mislinja
00050000-5629-f474-2775-716756ab028f	4281	Mojstrana
00050000-5629-f474-986d-b4225d9b6aaa	8230	Mokronog
00050000-5629-f474-62cd-f5ab6ab5571b	1251	Moravče
00050000-5629-f474-c7d2-b205c982a493	9226	Moravske Toplice
00050000-5629-f474-79f0-73d8bc9394d9	5216	Most na Soči
00050000-5629-f474-cb80-1f7eacc24d53	1221	Motnik
00050000-5629-f474-7de5-4fc8129fdcb4	3330	Mozirje
00050000-5629-f474-58ae-3313539ba536	9000	Murska Sobota 
00050000-5629-f474-9a02-d947d429f6b0	9001	Murska Sobota - poštni predali
00050000-5629-f474-54a6-c1df5964bb7a	2366	Muta
00050000-5629-f474-3a3f-dce64c8164ab	4202	Naklo
00050000-5629-f474-3cb3-dbd000792be7	3331	Nazarje
00050000-5629-f474-acce-6307ebdb4f87	1357	Notranje Gorice
00050000-5629-f474-b943-1339862a44c9	3203	Nova Cerkev
00050000-5629-f474-51d5-6c3b4a8eeb3a	5000	Nova Gorica 
00050000-5629-f474-1a4a-f4255ee81ae7	5001	Nova Gorica - poštni predali
00050000-5629-f474-c363-1a4da760beee	1385	Nova vas
00050000-5629-f474-063f-b930f2b56530	8000	Novo mesto
00050000-5629-f474-42f8-55b83dc228d0	8001	Novo mesto - poštni predali
00050000-5629-f474-36e8-c9b798d26cdc	6243	Obrov
00050000-5629-f474-b012-aac423a5a378	9233	Odranci
00050000-5629-f474-6b4c-57a870c2c889	2317	Oplotnica
00050000-5629-f474-e64d-20bb13971da4	2312	Orehova vas
00050000-5629-f474-701b-3703b5e5a962	2270	Ormož
00050000-5629-f474-082f-59ddb9c4b7ad	1316	Ortnek
00050000-5629-f474-0d93-739a8627f51d	1337	Osilnica
00050000-5629-f474-b16f-a19b35b7ce60	8222	Otočec
00050000-5629-f474-4e35-e5ab5b593078	2361	Ožbalt
00050000-5629-f474-49b2-9fbe03ca958e	2231	Pernica
00050000-5629-f474-958e-b003fa7f3447	2211	Pesnica pri Mariboru
00050000-5629-f474-bd10-b488a9ef4838	9203	Petrovci
00050000-5629-f474-bdde-38f72f991d79	3301	Petrovče
00050000-5629-f474-ce09-44ed32e7ab87	6330	Piran/Pirano
00050000-5629-f474-6787-0a682c06fa11	8255	Pišece
00050000-5629-f474-e906-dd8738ba854e	6257	Pivka
00050000-5629-f474-81a6-cb6a100864d4	6232	Planina
00050000-5629-f474-af52-2caeedbcc758	3225	Planina pri Sevnici
00050000-5629-f474-c8e4-1e0554c2cbb3	6276	Pobegi
00050000-5629-f474-541c-5064b3af5b70	8312	Podbočje
00050000-5629-f474-1ba0-4ce057a81300	5243	Podbrdo
00050000-5629-f474-ff15-6b0107cd03f6	3254	Podčetrtek
00050000-5629-f474-7a35-67ef54b10cdd	2273	Podgorci
00050000-5629-f474-e4bd-35be61031a6f	6216	Podgorje
00050000-5629-f474-50dc-caac2f6431ee	2381	Podgorje pri Slovenj Gradcu
00050000-5629-f474-c430-99b59af71393	6244	Podgrad
00050000-5629-f474-d6e3-ed37a35fe952	1414	Podkum
00050000-5629-f474-7eb3-e35a2763516b	2286	Podlehnik
00050000-5629-f474-7969-3896624d351d	5272	Podnanos
00050000-5629-f474-6568-fcd4db4216ab	4244	Podnart
00050000-5629-f474-3216-d54f0621ff1e	3241	Podplat
00050000-5629-f474-818d-66f9826b4f4c	3257	Podsreda
00050000-5629-f474-0531-ab590bf9e775	2363	Podvelka
00050000-5629-f474-341d-d4a72778bd82	2208	Pohorje
00050000-5629-f474-0995-c37f5ae36339	2257	Polenšak
00050000-5629-f474-a9d9-8a416c079dcf	1355	Polhov Gradec
00050000-5629-f474-0f62-c13781ec0c76	4223	Poljane nad Škofjo Loko
00050000-5629-f474-3cfb-8030d2bfa779	2319	Poljčane
00050000-5629-f474-d08d-e4af4cf93b9f	1272	Polšnik
00050000-5629-f474-00b0-d8da3ed3dfe9	3313	Polzela
00050000-5629-f474-9b0a-da839f5ee689	3232	Ponikva
00050000-5629-f474-cd55-33068c91ea9d	6320	Portorož/Portorose
00050000-5629-f474-f0a4-d2d7204a758b	6230	Postojna
00050000-5629-f474-4f9f-5b4036050892	2331	Pragersko
00050000-5629-f474-8eb9-ba1d9de7f164	3312	Prebold
00050000-5629-f474-c486-0d251fd1ff4c	4205	Preddvor
00050000-5629-f474-ce79-82539765da6f	6255	Prem
00050000-5629-f474-8ebf-f47e494ee6ee	1352	Preserje
00050000-5629-f474-aa43-a02986512fc6	6258	Prestranek
00050000-5629-f474-7a66-6e2f3ce00fb0	2391	Prevalje
00050000-5629-f474-7a19-aece35fa6946	3262	Prevorje
00050000-5629-f474-5618-95f1e8120e59	1276	Primskovo 
00050000-5629-f474-a8f6-bc6963c137ea	3253	Pristava pri Mestinju
00050000-5629-f474-0330-bf35d33da680	9207	Prosenjakovci/Partosfalva
00050000-5629-f474-3a50-74afa2548ab8	5297	Prvačina
00050000-5629-f474-5b96-daee630fb7e4	2250	Ptuj
00050000-5629-f474-7dd1-d6f7da9890d3	2323	Ptujska Gora
00050000-5629-f474-f862-48072e607942	9201	Puconci
00050000-5629-f474-aeec-5f587ffdb3d9	2327	Rače
00050000-5629-f474-8525-2929b1968b1d	1433	Radeče
00050000-5629-f474-eb59-1b2a9e4b7e81	9252	Radenci
00050000-5629-f474-ec4c-91bcc0bde78a	2360	Radlje ob Dravi
00050000-5629-f474-9e4e-846d84f4c636	1235	Radomlje
00050000-5629-f474-09a5-5ab18a5358f0	4240	Radovljica
00050000-5629-f474-aa8f-684ce3570d0c	8274	Raka
00050000-5629-f474-fbe4-987c1dc48a60	1381	Rakek
00050000-5629-f474-8171-b8089ead73bb	4283	Rateče - Planica
00050000-5629-f474-46b9-e2ce6d0126b9	2390	Ravne na Koroškem
00050000-5629-f474-49f1-b41822458d4a	9246	Razkrižje
00050000-5629-f474-0707-6b977fb16c3e	3332	Rečica ob Savinji
00050000-5629-f474-896a-a0f635771650	5292	Renče
00050000-5629-f474-c66f-55f82dd0ec98	1310	Ribnica
00050000-5629-f474-f178-f762861e16ad	2364	Ribnica na Pohorju
00050000-5629-f474-5494-0786cabb1ab7	3272	Rimske Toplice
00050000-5629-f474-0a90-b9e85b156ad7	1314	Rob
00050000-5629-f474-6b3a-603e8cac109a	5215	Ročinj
00050000-5629-f474-fd96-c00abea2d554	3250	Rogaška Slatina
00050000-5629-f474-979b-61944b5f55c2	9262	Rogašovci
00050000-5629-f474-8ee6-d1ace67acbe5	3252	Rogatec
00050000-5629-f474-1a2f-0357545eca58	1373	Rovte
00050000-5629-f474-ff4b-ab9b117f807c	2342	Ruše
00050000-5629-f474-9df9-b9c2775c6883	1282	Sava
00050000-5629-f474-1f96-d08058ed3a71	6333	Sečovlje/Sicciole
00050000-5629-f474-cccd-61e463b68c06	4227	Selca
00050000-5629-f474-e2ee-534e4f79a746	2352	Selnica ob Dravi
00050000-5629-f474-31ce-973f6cec8013	8333	Semič
00050000-5629-f474-8d69-3758c84e0555	8281	Senovo
00050000-5629-f474-aeeb-0ff1c94ffc8d	6224	Senožeče
00050000-5629-f474-d16b-5b64a5478b54	8290	Sevnica
00050000-5629-f474-5943-e8b6c1c57c89	6210	Sežana
00050000-5629-f474-1c0f-78fc6553bf67	2214	Sladki Vrh
00050000-5629-f474-b0a8-01bc97adaa1c	5283	Slap ob Idrijci
00050000-5629-f474-7641-9420b2d188f4	2380	Slovenj Gradec
00050000-5629-f474-e472-82f80a88596a	2310	Slovenska Bistrica
00050000-5629-f474-4398-72519be707ed	3210	Slovenske Konjice
00050000-5629-f474-5389-771898891841	1216	Smlednik
00050000-5629-f474-68a9-5b273c028626	5232	Soča
00050000-5629-f474-1d30-8a53bde30714	1317	Sodražica
00050000-5629-f474-56fc-9242553cb39e	3335	Solčava
00050000-5629-f474-aa75-d5db36354fa5	5250	Solkan
00050000-5629-f474-d1f8-6388cbf4ac88	4229	Sorica
00050000-5629-f474-e3ff-59fac0ebf702	4225	Sovodenj
00050000-5629-f474-f6b9-a583536e2cc5	5281	Spodnja Idrija
00050000-5629-f474-1be4-72c5a590aa8e	2241	Spodnji Duplek
00050000-5629-f474-1176-dde96ca86916	9245	Spodnji Ivanjci
00050000-5629-f474-659f-8910bb241982	2277	Središče ob Dravi
00050000-5629-f474-b5e3-e60ad8cb3d6a	4267	Srednja vas v Bohinju
00050000-5629-f474-0a82-5a6eabdffacf	8256	Sromlje 
00050000-5629-f474-7a67-fa29084efe07	5224	Srpenica
00050000-5629-f474-b9f7-91f40610030d	1242	Stahovica
00050000-5629-f474-8696-748f2b826aa2	1332	Stara Cerkev
00050000-5629-f474-cfba-7abfa98a03d0	8342	Stari trg ob Kolpi
00050000-5629-f474-6d8b-2f8b72181842	1386	Stari trg pri Ložu
00050000-5629-f474-04a0-e10f74b4aafe	2205	Starše
00050000-5629-f474-8f98-06bf6a6df6c9	2289	Stoperce
00050000-5629-f474-949d-67dea1a23270	8322	Stopiče
00050000-5629-f474-ebc8-5ea9f36c8937	3206	Stranice
00050000-5629-f474-7812-28574659fb02	8351	Straža
00050000-5629-f474-1e80-32a4bd126f7f	1313	Struge
00050000-5629-f474-9a0b-481370f86597	8293	Studenec
00050000-5629-f474-df03-68e8b6823d04	8331	Suhor
00050000-5629-f474-747e-10f9e3c75ed6	2233	Sv. Ana v Slovenskih goricah
00050000-5629-f474-d9ea-f52b84f9165b	2235	Sv. Trojica v Slovenskih goricah
00050000-5629-f474-da21-30bc07b0c2d2	2353	Sveti Duh na Ostrem Vrhu
00050000-5629-f474-7b08-812259708862	9244	Sveti Jurij ob Ščavnici
00050000-5629-f474-5be1-72c25a8b4417	3264	Sveti Štefan
00050000-5629-f474-6bcc-1262964ce3d6	2258	Sveti Tomaž
00050000-5629-f474-b819-c7a2091068e7	9204	Šalovci
00050000-5629-f474-8aa1-8f8b3b8918d2	5261	Šempas
00050000-5629-f474-b903-edf8fd5e6d38	5290	Šempeter pri Gorici
00050000-5629-f474-2981-6a29e950cee5	3311	Šempeter v Savinjski dolini
00050000-5629-f474-05d9-b6b21f47122d	4208	Šenčur
00050000-5629-f474-85dc-16c05a9d655f	2212	Šentilj v Slovenskih goricah
00050000-5629-f474-f8ec-74b22a099366	8297	Šentjanž
00050000-5629-f474-434e-84786cf5d15d	2373	Šentjanž pri Dravogradu
00050000-5629-f474-7632-b515e1e82d0a	8310	Šentjernej
00050000-5629-f474-f325-787f690c23bd	3230	Šentjur
00050000-5629-f474-0af9-e19e787b3822	3271	Šentrupert
00050000-5629-f474-f5f2-8e9cabb66746	8232	Šentrupert
00050000-5629-f474-4934-266f79b2e0e6	1296	Šentvid pri Stični
00050000-5629-f474-2f6a-ee9a4e2b209e	8275	Škocjan
00050000-5629-f474-78cf-3368f5ace2cb	6281	Škofije
00050000-5629-f474-d86e-fe396b5c8ce1	4220	Škofja Loka
00050000-5629-f474-2042-64a995f3dcbe	3211	Škofja vas
00050000-5629-f474-daa8-f742f1af125f	1291	Škofljica
00050000-5629-f474-7f62-3ed87fe74d95	6274	Šmarje
00050000-5629-f474-a56f-8e0ea93bcd97	1293	Šmarje - Sap
00050000-5629-f474-ade0-8fe23acc791f	3240	Šmarje pri Jelšah
00050000-5629-f474-03c9-fc65c86e2c6e	8220	Šmarješke Toplice
00050000-5629-f474-f118-283f178b80d8	2315	Šmartno na Pohorju
00050000-5629-f474-2605-6cf2990dcfc3	3341	Šmartno ob Dreti
00050000-5629-f474-621b-01e723ba55f7	3327	Šmartno ob Paki
00050000-5629-f474-81eb-17d743efa905	1275	Šmartno pri Litiji
00050000-5629-f474-de5e-65e961fb6497	2383	Šmartno pri Slovenj Gradcu
00050000-5629-f474-a45c-bd2fdf2f4bdb	3201	Šmartno v Rožni dolini
00050000-5629-f474-5744-2e807e2ede9d	3325	Šoštanj
00050000-5629-f474-b756-ad3dd9ae9a4b	6222	Štanjel
00050000-5629-f474-fca9-5653b52cdc7b	3220	Štore
00050000-5629-f474-91de-757655cef060	3304	Tabor
00050000-5629-f474-19c8-72eff23e0aa6	3221	Teharje
00050000-5629-f474-abcf-0a02b66833d6	9251	Tišina
00050000-5629-f474-a87a-ff62ff87465b	5220	Tolmin
00050000-5629-f474-b51e-fbcf16562943	3326	Topolšica
00050000-5629-f474-2c59-4ed6d2057970	2371	Trbonje
00050000-5629-f474-a70d-999acb706a5d	1420	Trbovlje
00050000-5629-f474-cb60-ecd4b0f88ec7	8231	Trebelno 
00050000-5629-f474-cc74-04ab50087d95	8210	Trebnje
00050000-5629-f474-143f-fe3d26487109	5252	Trnovo pri Gorici
00050000-5629-f474-a907-603f09c132af	2254	Trnovska vas
00050000-5629-f474-bfd9-589a24ba9f9f	1222	Trojane
00050000-5629-f474-5581-eebb60c0ba97	1236	Trzin
00050000-5629-f474-d00c-b3a0f8c1076d	4290	Tržič
00050000-5629-f474-c18b-2d8d43c52c49	8295	Tržišče
00050000-5629-f474-2415-9822e0272b2c	1311	Turjak
00050000-5629-f474-2670-cd454d81fdce	9224	Turnišče
00050000-5629-f474-fbfc-6221ee788407	8323	Uršna sela
00050000-5629-f474-56fb-29babc19ecdb	1252	Vače
00050000-5629-f474-e4a8-443322df7759	3320	Velenje 
00050000-5629-f474-49d4-bf544e61a9c5	3322	Velenje - poštni predali
00050000-5629-f474-bbd5-2696edc605ae	8212	Velika Loka
00050000-5629-f474-d301-8304dcc75831	2274	Velika Nedelja
00050000-5629-f474-ca77-9244e732f9bf	9225	Velika Polana
00050000-5629-f474-96cb-6ae0b920a9e8	1315	Velike Lašče
00050000-5629-f474-76ac-c19fe43a72a8	8213	Veliki Gaber
00050000-5629-f474-cabb-5096e0d1ed8e	9241	Veržej
00050000-5629-f474-af6c-662ecc7d6977	1312	Videm - Dobrepolje
00050000-5629-f474-b311-dc4b4cbb4885	2284	Videm pri Ptuju
00050000-5629-f474-b824-209387db6a54	8344	Vinica
00050000-5629-f474-8097-1d2245fee8fb	5271	Vipava
00050000-5629-f474-ab74-809b20a61286	4212	Visoko
00050000-5629-f474-25ac-663bacfdd160	1294	Višnja Gora
00050000-5629-f474-0891-373bc08cf7d9	3205	Vitanje
00050000-5629-f474-9039-4183df373b7b	2255	Vitomarci
00050000-5629-f474-04cf-88a9c714cb97	1217	Vodice
00050000-5629-f474-f41a-02015ceb5fad	3212	Vojnik\t
00050000-5629-f474-6660-0cc57d49aa65	5293	Volčja Draga
00050000-5629-f474-dfad-27755e37dbd6	2232	Voličina
00050000-5629-f474-ec2c-1725721ba5ec	3305	Vransko
00050000-5629-f474-2fad-0166d1e9d0b8	6217	Vremski Britof
00050000-5629-f474-5784-aa27b02d1454	1360	Vrhnika
00050000-5629-f474-4512-248933f2a4bd	2365	Vuhred
00050000-5629-f474-8994-3c3a86ad6928	2367	Vuzenica
00050000-5629-f474-6e5f-a016aabad690	8292	Zabukovje 
00050000-5629-f474-51e6-a7bd065de1e0	1410	Zagorje ob Savi
00050000-5629-f474-166e-6f5863a24cf5	1303	Zagradec
00050000-5629-f474-462d-1c00331e6935	2283	Zavrč
00050000-5629-f474-517f-5815e8ad3e4d	8272	Zdole 
00050000-5629-f474-77c1-cb0856ea4f0b	4201	Zgornja Besnica
00050000-5629-f474-214c-943dcd9d36d9	2242	Zgornja Korena
00050000-5629-f474-3ccd-8db864ffa14c	2201	Zgornja Kungota
00050000-5629-f474-02d8-09bdb0290da9	2316	Zgornja Ložnica
00050000-5629-f474-496e-dd75accf0f91	2314	Zgornja Polskava
00050000-5629-f474-ab40-b9af910aea17	2213	Zgornja Velka
00050000-5629-f474-c779-57e7a6b983f1	4247	Zgornje Gorje
00050000-5629-f474-ce5b-18d334b26c89	4206	Zgornje Jezersko
00050000-5629-f474-e23d-62c98cec61da	2285	Zgornji Leskovec
00050000-5629-f474-a715-06239a3dadc3	1432	Zidani Most
00050000-5629-f474-8a09-5b560caba60b	3214	Zreče
00050000-5629-f474-dfef-b049dea6bcb7	4209	Žabnica
00050000-5629-f474-d865-03b21effe906	3310	Žalec
00050000-5629-f474-a4f5-204491a38f6c	4228	Železniki
00050000-5629-f474-e80a-45945c12421f	2287	Žetale
00050000-5629-f474-19ab-688b6ceee823	4226	Žiri
00050000-5629-f474-9399-9c8382beda17	4274	Žirovnica
00050000-5629-f474-7bf9-a2673e2f7695	8360	Žužemberk
\.


--
-- TOC entry 3111 (class 0 OID 23172520)
-- Dependencies: 236
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3084 (class 0 OID 23172112)
-- Dependencies: 209
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3062 (class 0 OID 23171866)
-- Dependencies: 187
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5629-f477-f006-d472a59ea76b	00080000-5629-f477-605c-f1abaecac668	\N	00040000-5629-f475-b9d7-54f257d6118e	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5629-f477-611e-5f7b74af0d2a	00080000-5629-f477-605c-f1abaecac668	\N	00040000-5629-f475-b9d7-54f257d6118e	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5629-f477-6c76-6f108845962b	00080000-5629-f477-7392-5fbf61b48acd	\N	00040000-5629-f475-b9d7-54f257d6118e	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3074 (class 0 OID 23172010)
-- Dependencies: 199
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5629-f475-c010-230077951979	novo leto	1	1	\N	t
00430000-5629-f475-4ee5-f5d750bdb0de	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5629-f475-d13e-3dffd96ceb8f	dan upora proti okupatorju	27	4	\N	t
00430000-5629-f475-4f29-8c717c8f7acb	praznik dela	1	5	\N	t
00430000-5629-f475-7978-621b432cd210	praznik dela	2	5	\N	t
00430000-5629-f475-8821-fd1f17e34924	dan Primoža Trubarja	8	6	\N	f
00430000-5629-f475-dfa8-5f7694a787e0	dan državnosti	25	6	\N	t
00430000-5629-f475-1043-92386c75b2b8	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5629-f475-9881-3ffe436c2ef6	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5629-f475-bc79-bb694e33f43c	dan suverenosti	25	10	\N	f
00430000-5629-f475-518a-44d642fa7505	dan spomina na mrtve	1	11	\N	t
00430000-5629-f475-0fbe-a3caf05dcd7d	dan Rudolfa Maistra	23	11	\N	f
00430000-5629-f475-1fb6-59c518287da8	božič	25	12	\N	t
00430000-5629-f475-270e-65a7a65e6c80	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5629-f475-bbde-b84f629a8748	Marijino vnebovzetje	15	8	\N	t
00430000-5629-f475-b3e6-bde83e7fa18c	dan reformacije	31	10	\N	t
00430000-5629-f475-96b3-152d86beef29	velikonočna nedelja	27	3	2016	t
00430000-5629-f475-bba7-a52ffede6057	velikonočna nedelja	16	4	2017	t
00430000-5629-f475-c22a-120d6e767396	velikonočna nedelja	1	4	2018	t
00430000-5629-f475-e09c-179784f8840f	velikonočna nedelja	21	4	2019	t
00430000-5629-f475-1a69-286726dc1bc3	velikonočna nedelja	12	4	2020	t
00430000-5629-f475-912f-01c784d4d746	velikonočna nedelja	4	4	2021	t
00430000-5629-f475-fbbd-08e4348a6b51	velikonočna nedelja	17	4	2022	t
00430000-5629-f475-d167-43eeb9727b2f	velikonočna nedelja	9	4	2023	t
00430000-5629-f475-ad18-a22fdd13232f	velikonočna nedelja	31	3	2024	t
00430000-5629-f475-9cb1-4a92b8ca56ce	velikonočna nedelja	20	4	2025	t
00430000-5629-f475-24b8-7731359ce42e	velikonočna nedelja	5	4	2026	t
00430000-5629-f475-55a3-9429cb267416	velikonočna nedelja	28	3	2027	t
00430000-5629-f475-a170-9acd87836906	velikonočna nedelja	16	4	2028	t
00430000-5629-f475-577c-86e3a0558efb	velikonočna nedelja	1	4	2029	t
00430000-5629-f475-9b98-8a0ab3ba011f	velikonočna nedelja	21	4	2030	t
00430000-5629-f475-387f-f2636abb0c7a	velikonočni ponedeljek	28	3	2016	t
00430000-5629-f475-edd3-9bc3a3cc5477	velikonočni ponedeljek	17	4	2017	t
00430000-5629-f475-2b7a-79b4c3c1341a	velikonočni ponedeljek	2	4	2018	t
00430000-5629-f475-0f33-3d200759f36d	velikonočni ponedeljek	22	4	2019	t
00430000-5629-f475-7719-c3bd83ce5140	velikonočni ponedeljek	13	4	2020	t
00430000-5629-f475-201a-2c55ed558c8f	velikonočni ponedeljek	5	4	2021	t
00430000-5629-f475-12e7-c170bd57b5fc	velikonočni ponedeljek	18	4	2022	t
00430000-5629-f475-10be-dc1ae4c9676c	velikonočni ponedeljek	10	4	2023	t
00430000-5629-f475-a03c-3eb8193cb502	velikonočni ponedeljek	1	4	2024	t
00430000-5629-f475-81a0-f0ea3c1450c2	velikonočni ponedeljek	21	4	2025	t
00430000-5629-f475-d968-58c4d074998f	velikonočni ponedeljek	6	4	2026	t
00430000-5629-f475-8441-ea73703d1df1	velikonočni ponedeljek	29	3	2027	t
00430000-5629-f475-e5d9-c3cbc2e86e05	velikonočni ponedeljek	17	4	2028	t
00430000-5629-f475-1d25-98e1c34e7a6f	velikonočni ponedeljek	2	4	2029	t
00430000-5629-f475-e882-2b6919c8ee16	velikonočni ponedeljek	22	4	2030	t
00430000-5629-f475-f502-fc063584a7de	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5629-f475-4bbc-0a6167b0e412	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5629-f475-b4ba-90b83ca358f0	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5629-f475-bf24-858751a08c6a	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5629-f475-bdec-1dc543c9391a	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5629-f475-b5cd-1b5d28ac3d8c	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5629-f475-1182-a720f4650149	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5629-f475-2abc-103d073a38d3	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5629-f475-42b0-45c41ff0683c	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5629-f475-8a32-bb841dce492c	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5629-f475-40ea-b2e0c214ac1c	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5629-f475-c5bf-eec872ee7cdf	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5629-f475-e9dd-77fe901674d5	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5629-f475-3f75-3e052686724d	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5629-f475-0c9b-ef0bd0b86333	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3070 (class 0 OID 23171970)
-- Dependencies: 195
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3071 (class 0 OID 23171982)
-- Dependencies: 196
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3086 (class 0 OID 23172124)
-- Dependencies: 211
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 23172534)
-- Dependencies: 237
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 23172544)
-- Dependencies: 238
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5629-f477-9db2-19f6b73410fb	00080000-5629-f477-6c6f-91a7ef6a6b84	0987	AK
00190000-5629-f477-0a7e-88e7136b3da3	00080000-5629-f477-7392-5fbf61b48acd	0989	AK
00190000-5629-f477-12ad-c5faa3184e09	00080000-5629-f477-b6dd-ae46120c19f8	0986	AK
00190000-5629-f477-eaba-4f72f44076ce	00080000-5629-f477-4439-27bc6b7a9163	0984	AK
00190000-5629-f477-5342-84d8e7eb6ba5	00080000-5629-f477-01d6-03089448546f	0983	AK
00190000-5629-f477-61fc-e111fc3647b9	00080000-5629-f477-654c-134909426da8	0982	AK
00190000-5629-f478-f811-59176490319f	00080000-5629-f478-e6ac-68b95d9b0607	1001	AK
\.


--
-- TOC entry 3110 (class 0 OID 23172459)
-- Dependencies: 235
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5629-f477-9ad8-845098fdd3fd	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3114 (class 0 OID 23172552)
-- Dependencies: 239
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3090 (class 0 OID 23172153)
-- Dependencies: 215
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5629-f477-b1aa-0a4aa1ca592c	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5629-f477-a4b1-d137c4db26e7	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5629-f477-e759-2dc0d7310653	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5629-f477-a3fd-a49021dfc162	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5629-f477-ce68-3eec9dd58dca	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5629-f477-9ed0-c9a7bedffa8a	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5629-f477-4ca4-f94d17593395	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3082 (class 0 OID 23172097)
-- Dependencies: 207
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3081 (class 0 OID 23172087)
-- Dependencies: 206
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 23172298)
-- Dependencies: 228
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 23172228)
-- Dependencies: 222
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3068 (class 0 OID 23171944)
-- Dependencies: 193
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3049 (class 0 OID 23171718)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5629-f478-e6ac-68b95d9b0607	00010000-5629-f475-c64e-10354b453e96	2015-10-23 10:48:56	INS	a:0:{}
2	App\\Entity\\Option	00000000-5629-f478-110e-a566c74842b3	00010000-5629-f475-c64e-10354b453e96	2015-10-23 10:48:56	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5629-f478-f811-59176490319f	00010000-5629-f475-c64e-10354b453e96	2015-10-23 10:48:56	INS	a:0:{}
\.


--
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3091 (class 0 OID 23172166)
-- Dependencies: 216
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 23171756)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5629-f475-2ddc-241f0ec8cfd5	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5629-f475-95f1-74782506be6f	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5629-f475-5cf8-ed21df0db203	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5629-f475-6e5c-d6177cbb8166	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5629-f475-5e4f-78382811f4c2	planer	Planer dogodkov v koledarju	t
00020000-5629-f475-3fab-4bfb406453fb	kadrovska	Kadrovska služba	t
00020000-5629-f475-5542-4d89af55a177	arhivar	Ažuriranje arhivalij	t
00020000-5629-f475-ab0a-43aa47f8cdf1	igralec	Igralec	t
00020000-5629-f475-6a4d-d6ddfe9f363e	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5629-f477-4c78-f7870786e51c	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3051 (class 0 OID 23171740)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5629-f475-fbea-5b701bf1a18f	00020000-5629-f475-5cf8-ed21df0db203
00010000-5629-f475-c64e-10354b453e96	00020000-5629-f475-5cf8-ed21df0db203
00010000-5629-f477-a651-f2f2b0d24391	00020000-5629-f477-4c78-f7870786e51c
\.


--
-- TOC entry 3093 (class 0 OID 23172180)
-- Dependencies: 218
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3085 (class 0 OID 23172118)
-- Dependencies: 210
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3079 (class 0 OID 23172064)
-- Dependencies: 204
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5629-f477-2233-c6ed7f2abdf2	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5629-f477-5674-f7ff328ffcc1	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5629-f477-7818-930a36f7fbd5	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3047 (class 0 OID 23171705)
-- Dependencies: 172
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5629-f475-70eb-1504351b108a	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5629-f475-b406-71b41c98f9b6	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5629-f475-3ba6-644984198b6e	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5629-f475-a26d-45c9556ecdf9	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5629-f475-3a2a-5fe227cc8f80	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3046 (class 0 OID 23171697)
-- Dependencies: 171
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5629-f475-c9b3-9c17ec69c1ec	00230000-5629-f475-a26d-45c9556ecdf9	popa
00240000-5629-f475-dd46-e1743e379ba4	00230000-5629-f475-a26d-45c9556ecdf9	oseba
00240000-5629-f475-2ef8-9857516d9c3b	00230000-5629-f475-a26d-45c9556ecdf9	tippopa
00240000-5629-f475-3d10-10c212b3226f	00230000-5629-f475-a26d-45c9556ecdf9	organizacijskaenota
00240000-5629-f475-c8b3-bfb5933b83d4	00230000-5629-f475-a26d-45c9556ecdf9	sezona
00240000-5629-f475-afdb-b738ef10e1ff	00230000-5629-f475-a26d-45c9556ecdf9	tipvaje
00240000-5629-f475-18d6-65bf14de626c	00230000-5629-f475-b406-71b41c98f9b6	prostor
00240000-5629-f475-6953-8710f9c63a69	00230000-5629-f475-a26d-45c9556ecdf9	besedilo
00240000-5629-f475-f990-5597416e11a6	00230000-5629-f475-a26d-45c9556ecdf9	uprizoritev
00240000-5629-f475-117e-9a153e5056be	00230000-5629-f475-a26d-45c9556ecdf9	funkcija
00240000-5629-f475-88a0-82f552831594	00230000-5629-f475-a26d-45c9556ecdf9	tipfunkcije
00240000-5629-f475-d2e1-aec91691cd61	00230000-5629-f475-a26d-45c9556ecdf9	alternacija
00240000-5629-f475-187e-34b54e57727f	00230000-5629-f475-70eb-1504351b108a	pogodba
00240000-5629-f475-edec-694021987fb9	00230000-5629-f475-a26d-45c9556ecdf9	zaposlitev
00240000-5629-f475-c7b2-b3ba5a75e92a	00230000-5629-f475-a26d-45c9556ecdf9	zvrstuprizoritve
00240000-5629-f475-904f-25c4be6721e2	00230000-5629-f475-70eb-1504351b108a	programdela
00240000-5629-f475-31b1-a6b93b2ebe27	00230000-5629-f475-a26d-45c9556ecdf9	zapis
\.


--
-- TOC entry 3045 (class 0 OID 23171692)
-- Dependencies: 170
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
ddf7ebed-2305-42aa-b4ad-510ad6892f62	00240000-5629-f475-c9b3-9c17ec69c1ec	0	1001
\.


--
-- TOC entry 3099 (class 0 OID 23172245)
-- Dependencies: 224
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5629-f477-a29a-5d4a94b11797	000e0000-5629-f477-9c55-34c91f139cd9	00080000-5629-f477-605c-f1abaecac668	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5629-f475-cfeb-725ad01b61a9
00270000-5629-f477-9934-3f4a6babbe65	000e0000-5629-f477-9c55-34c91f139cd9	00080000-5629-f477-605c-f1abaecac668	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5629-f475-cfeb-725ad01b61a9
\.


--
-- TOC entry 3059 (class 0 OID 23171828)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3080 (class 0 OID 23172074)
-- Dependencies: 205
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5629-f477-43f2-7c1c60d9ea98	00180000-5629-f477-45f0-861110b0e4a7	000c0000-5629-f477-0791-b63f7ec240a5	00090000-5629-f477-a02c-0d6639e11874	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5629-f477-e300-4165a8f37f5c	00180000-5629-f477-45f0-861110b0e4a7	000c0000-5629-f477-dbba-059d07f207d2	00090000-5629-f477-0fdc-48800e1e046e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5629-f477-f93b-8c958a87b47a	00180000-5629-f477-45f0-861110b0e4a7	000c0000-5629-f477-f200-4aa41870bd9d	00090000-5629-f477-452b-e511bd57230e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5629-f477-e2ec-610e0baec0ea	00180000-5629-f477-45f0-861110b0e4a7	000c0000-5629-f477-78ae-5f5740f9ecd8	00090000-5629-f477-e824-618b0efd7d60	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5629-f477-afaa-73a33b934053	00180000-5629-f477-45f0-861110b0e4a7	000c0000-5629-f477-3569-e0b09bb62c94	00090000-5629-f477-280c-4146cb2897ba	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5629-f477-eb54-10e49acbef18	00180000-5629-f477-59e9-d874757c8075	\N	00090000-5629-f477-280c-4146cb2897ba	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5629-f477-1943-8fae79b833ca	00180000-5629-f477-59e9-d874757c8075	\N	00090000-5629-f477-0fdc-48800e1e046e	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3102 (class 0 OID 23172286)
-- Dependencies: 227
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5629-f474-52af-926d34ebee09	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5629-f474-0afa-c7fc9e52fcaf	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5629-f474-8157-9149595c3e25	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5629-f474-55e0-a02e460d9c40	04	Režija	Režija	Režija	umetnik	30
000f0000-5629-f474-638b-99c666441c81	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5629-f474-2378-5e9e4354f302	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5629-f474-25e6-47876a6c92ca	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5629-f474-40b1-8ddc1dccf431	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5629-f475-8c7d-94f0197c7df3	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5629-f475-0dc3-56699ab461bc	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5629-f475-89f6-e9ede190ac3f	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5629-f475-d0f6-f3467a3f4cf0	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5629-f475-7fc6-66d78534d222	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5629-f475-43f8-2f1afc019bfd	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5629-f475-345b-057ff3b80e63	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5629-f475-ee81-d9b78173b0ba	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5629-f475-833b-6186d89ed20a	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5629-f475-77a8-2af891f2df0c	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3056 (class 0 OID 23171782)
-- Dependencies: 181
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5629-f477-0e90-d7b3dc9a7664	0001	šola	osnovna ali srednja šola
00400000-5629-f477-09d1-cbd757c1dcf5	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5629-f477-357b-c6466c322e8f	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3115 (class 0 OID 23172563)
-- Dependencies: 240
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5629-f474-aaa8-d0b8d51f90fb	01	Velika predstava	f	1.00	1.00
002b0000-5629-f474-24a2-1d4b0ddf4118	02	Mala predstava	f	0.50	0.50
002b0000-5629-f474-d318-3a04d1e4c452	03	Mala koprodukcija	t	0.40	1.00
002b0000-5629-f474-bef8-98623e17b4b6	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5629-f474-f67d-09fce2740f43	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3078 (class 0 OID 23172054)
-- Dependencies: 203
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5629-f474-ed45-e4cc1a1c38bf	0001	prva vaja	prva vaja
00420000-5629-f474-7cc3-9108f3456d77	0002	tehnična vaja	tehnična vaja
00420000-5629-f474-24a8-7596b79f8b37	0003	lučna vaja	lučna vaja
00420000-5629-f474-b3c5-4ff2a4cc8f2a	0004	kostumska vaja	kostumska vaja
00420000-5629-f474-89a1-6884ade7601c	0005	foto vaja	foto vaja
00420000-5629-f474-130b-1dfc0a727f8a	0006	1. glavna vaja	1. glavna vaja
00420000-5629-f474-5e7d-b313bfd9e488	0007	2. glavna vaja	2. glavna vaja
00420000-5629-f474-e67b-1565c3ad24c7	0008	1. generalka	1. generalka
00420000-5629-f474-e660-41fc3b3a676e	0009	2. generalka	2. generalka
00420000-5629-f474-486a-d0aac2517f81	0010	odprta generalka	odprta generalka
00420000-5629-f474-30ac-ef6722650952	0011	obnovitvena vaja	obnovitvena vaja
00420000-5629-f474-f89e-d01cf54de1ae	0012	pevska vaja	pevska vaja
00420000-5629-f474-0b5b-87c6464d08a9	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5629-f474-2615-5eb7732f19c0	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3065 (class 0 OID 23171901)
-- Dependencies: 190
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 23171727)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5629-f475-c64e-10354b453e96	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROKvbSHuKQI0Rxf2SRECr1wkPDNBgfMLO	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5629-f477-3079-9a6a24c80d53	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5629-f477-c3bd-0bb612bb078d	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5629-f477-4a8a-3ed07b78fc66	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5629-f477-ae50-751b9133a04c	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5629-f477-0ac3-6f1c5a571f1a	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5629-f477-4ae3-a2e2415d767d	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5629-f477-778a-5729942d0df1	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5629-f477-1fc8-65bfdd354bfb	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5629-f477-25af-173e123f6166	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5629-f477-a651-f2f2b0d24391	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5629-f475-fbea-5b701bf1a18f	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3106 (class 0 OID 23172336)
-- Dependencies: 231
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5629-f477-3070-4f4980032825	00160000-5629-f477-97b5-42ec461d7ec2	\N	00140000-5629-f475-036c-8fd389832cf2	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5629-f477-ce68-3eec9dd58dca
000e0000-5629-f477-9c55-34c91f139cd9	00160000-5629-f477-6170-51a7922939f7	\N	00140000-5629-f475-5613-e5a1cd52ac59	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5629-f477-9ed0-c9a7bedffa8a
000e0000-5629-f477-dcf8-dbd2b8129d4f	\N	\N	00140000-5629-f475-5613-e5a1cd52ac59	00190000-5629-f477-9db2-19f6b73410fb	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5629-f477-ce68-3eec9dd58dca
000e0000-5629-f477-582c-356e2d5b71bb	\N	\N	00140000-5629-f475-5613-e5a1cd52ac59	00190000-5629-f477-9db2-19f6b73410fb	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5629-f477-ce68-3eec9dd58dca
000e0000-5629-f477-2b9f-4245d6a3d1b8	\N	\N	00140000-5629-f475-5613-e5a1cd52ac59	00190000-5629-f477-9db2-19f6b73410fb	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5629-f477-b1aa-0a4aa1ca592c
000e0000-5629-f477-60fc-f25db7ba5ea1	\N	\N	00140000-5629-f475-5613-e5a1cd52ac59	00190000-5629-f477-9db2-19f6b73410fb	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5629-f477-b1aa-0a4aa1ca592c
\.


--
-- TOC entry 3073 (class 0 OID 23172000)
-- Dependencies: 198
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5629-f477-4141-c4e15be22f71	\N	000e0000-5629-f477-9c55-34c91f139cd9	1	
00200000-5629-f477-6b3f-d84a11f8acd7	\N	000e0000-5629-f477-9c55-34c91f139cd9	2	
00200000-5629-f477-b6c4-6840dbb80100	\N	000e0000-5629-f477-9c55-34c91f139cd9	3	
00200000-5629-f477-13ee-b796fcbf9ea5	\N	000e0000-5629-f477-9c55-34c91f139cd9	4	
00200000-5629-f477-9b94-6efdb691b9d9	\N	000e0000-5629-f477-9c55-34c91f139cd9	5	
\.


--
-- TOC entry 3089 (class 0 OID 23172145)
-- Dependencies: 214
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 23172259)
-- Dependencies: 225
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5629-f475-9f18-9d916a3e563d	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5629-f475-6eb3-7de7d0d39463	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5629-f475-09ed-2bad20e31fc0	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5629-f475-a87d-1d58fdd420bd	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5629-f475-f717-db83c8934e93	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5629-f475-31f6-5049fefa5583	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5629-f475-2d34-1bc33d15e532	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5629-f475-55b2-32849894cdf0	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5629-f475-cfeb-725ad01b61a9	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5629-f475-1955-ba20e3d9f574	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5629-f475-31d6-3b16b3ece75c	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5629-f475-9cd7-0747178517c0	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5629-f475-4eb6-72939d210a3f	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5629-f475-af5b-0549f07bac13	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5629-f475-943b-4af5e5afbaeb	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5629-f475-84fa-1572bdccfc48	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5629-f475-e983-32d6bc482048	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5629-f475-ea5a-b18eea2dc6f3	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5629-f475-698e-6c9fe4e73171	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5629-f475-d097-652b99d5efd5	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5629-f475-9cff-1cd1002cf3c3	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5629-f475-02bc-3d8d5873ec60	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5629-f475-cf54-0684e54cbe5a	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5629-f475-0c60-723bd8339a7f	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5629-f475-f2d3-8b5d52180990	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5629-f475-6f27-a38b466029d8	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5629-f475-7168-6a2d7dd984ad	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5629-f475-7c13-5b20d975503c	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3118 (class 0 OID 23172610)
-- Dependencies: 243
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 23172582)
-- Dependencies: 242
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 23172622)
-- Dependencies: 244
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3096 (class 0 OID 23172217)
-- Dependencies: 221
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5629-f477-55ca-529843d98723	00090000-5629-f477-0fdc-48800e1e046e	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5629-f477-794f-251cbe1c9a8d	00090000-5629-f477-452b-e511bd57230e	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5629-f477-562d-6b52ced17580	00090000-5629-f477-5684-d8d3c34c3870	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5629-f477-a14a-eebaf58b9cc7	00090000-5629-f477-14b9-15c04c3aea9c	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5629-f477-d5c1-04f8996b6b86	00090000-5629-f477-f134-fa9c17ae23d2	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5629-f477-9e24-8b85af91988a	00090000-5629-f477-0549-236fe1aa9597	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3076 (class 0 OID 23172043)
-- Dependencies: 201
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 23172326)
-- Dependencies: 230
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5629-f475-036c-8fd389832cf2	01	Drama	drama (SURS 01)
00140000-5629-f475-7a8c-ccb2bcb25b85	02	Opera	opera (SURS 02)
00140000-5629-f475-d9b4-5837f559e121	03	Balet	balet (SURS 03)
00140000-5629-f475-163a-a734d32a1235	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5629-f475-4f72-3f474deb5fde	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5629-f475-5613-e5a1cd52ac59	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5629-f475-61cf-5b1f16d8de25	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3095 (class 0 OID 23172207)
-- Dependencies: 220
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2545 (class 2606 OID 23171781)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 23172385)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 23172375)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 23172242)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 23172284)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 23172662)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 23172032)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 23172053)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 23172580)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 23171927)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 23172453)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 23172203)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 23171998)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 23171965)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 23171941)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 23172110)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2812 (class 2606 OID 23172639)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 23172646)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2823 (class 2606 OID 23172670)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 23172137)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 23171899)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 23171800)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 23171861)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 23171824)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 23171770)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2536 (class 2606 OID 23171755)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 23172143)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 23172179)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 23172321)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 23171852)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 23171887)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 23172532)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 23172116)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 23171877)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 23172017)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 23171986)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2612 (class 2606 OID 23171978)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 23172128)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 23172541)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 23172549)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 23172519)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 23172561)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 23172161)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 23172101)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 23172092)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 23172308)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 23172235)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 23171953)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 23171726)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 23172170)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 23171744)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2538 (class 2606 OID 23171764)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 23172188)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 23172123)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 23172072)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 23171714)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 23171702)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 23171696)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 23172255)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 23171833)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 23172083)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 23172295)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 23171789)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 23172573)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 23172061)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 23171912)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 23171739)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 23172354)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 23172007)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 23172151)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 23172267)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 23172620)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 23172604)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 23172628)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 23172225)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 23172047)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 23172334)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 23172215)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 1259 OID 23172041)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2629 (class 1259 OID 23172042)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2630 (class 1259 OID 23172040)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2631 (class 1259 OID 23172039)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2632 (class 1259 OID 23172038)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2723 (class 1259 OID 23172256)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2724 (class 1259 OID 23172257)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2725 (class 1259 OID 23172258)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2809 (class 1259 OID 23172641)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2810 (class 1259 OID 23172640)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2563 (class 1259 OID 23171854)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2564 (class 1259 OID 23171855)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2681 (class 1259 OID 23172144)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2796 (class 1259 OID 23172608)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2797 (class 1259 OID 23172607)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2798 (class 1259 OID 23172609)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2799 (class 1259 OID 23172606)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2800 (class 1259 OID 23172605)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2675 (class 1259 OID 23172130)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2676 (class 1259 OID 23172129)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2620 (class 1259 OID 23172008)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2621 (class 1259 OID 23172009)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2705 (class 1259 OID 23172204)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2706 (class 1259 OID 23172206)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2707 (class 1259 OID 23172205)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2595 (class 1259 OID 23171943)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2596 (class 1259 OID 23171942)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2787 (class 1259 OID 23172562)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2739 (class 1259 OID 23172323)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2740 (class 1259 OID 23172324)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2741 (class 1259 OID 23172325)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2806 (class 1259 OID 23172629)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2748 (class 1259 OID 23172359)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2749 (class 1259 OID 23172356)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2750 (class 1259 OID 23172360)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2751 (class 1259 OID 23172358)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2752 (class 1259 OID 23172357)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2585 (class 1259 OID 23171914)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2586 (class 1259 OID 23171913)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2554 (class 1259 OID 23171827)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2693 (class 1259 OID 23172171)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2540 (class 1259 OID 23171771)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2541 (class 1259 OID 23171772)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2698 (class 1259 OID 23172191)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2699 (class 1259 OID 23172190)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2700 (class 1259 OID 23172189)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2568 (class 1259 OID 23171864)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2569 (class 1259 OID 23171863)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2570 (class 1259 OID 23171865)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2608 (class 1259 OID 23171981)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2609 (class 1259 OID 23171979)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2610 (class 1259 OID 23171980)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2520 (class 1259 OID 23171704)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2655 (class 1259 OID 23172096)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2656 (class 1259 OID 23172094)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2657 (class 1259 OID 23172093)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2658 (class 1259 OID 23172095)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2531 (class 1259 OID 23171745)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2532 (class 1259 OID 23171746)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2684 (class 1259 OID 23172152)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2819 (class 1259 OID 23172663)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2721 (class 1259 OID 23172244)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2722 (class 1259 OID 23172243)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2820 (class 1259 OID 23172671)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2821 (class 1259 OID 23172672)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2670 (class 1259 OID 23172117)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2715 (class 1259 OID 23172236)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2716 (class 1259 OID 23172237)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2769 (class 1259 OID 23172458)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2770 (class 1259 OID 23172457)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2771 (class 1259 OID 23172454)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2772 (class 1259 OID 23172455)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2773 (class 1259 OID 23172456)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2574 (class 1259 OID 23171879)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2575 (class 1259 OID 23171878)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2576 (class 1259 OID 23171880)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2687 (class 1259 OID 23172165)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2688 (class 1259 OID 23172164)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2779 (class 1259 OID 23172542)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2780 (class 1259 OID 23172543)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2762 (class 1259 OID 23172389)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2763 (class 1259 OID 23172390)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2764 (class 1259 OID 23172387)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2765 (class 1259 OID 23172388)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2711 (class 1259 OID 23172226)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2712 (class 1259 OID 23172227)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2661 (class 1259 OID 23172105)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2662 (class 1259 OID 23172104)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2663 (class 1259 OID 23172102)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2664 (class 1259 OID 23172103)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2758 (class 1259 OID 23172377)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2759 (class 1259 OID 23172376)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2599 (class 1259 OID 23171954)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2602 (class 1259 OID 23171968)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2603 (class 1259 OID 23171967)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2604 (class 1259 OID 23171966)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2605 (class 1259 OID 23171969)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2619 (class 1259 OID 23171999)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2613 (class 1259 OID 23171987)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2614 (class 1259 OID 23171988)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2776 (class 1259 OID 23172533)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2795 (class 1259 OID 23172581)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2813 (class 1259 OID 23172647)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2814 (class 1259 OID 23172648)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2550 (class 1259 OID 23171802)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2551 (class 1259 OID 23171801)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2559 (class 1259 OID 23171834)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2560 (class 1259 OID 23171835)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2638 (class 1259 OID 23172048)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2650 (class 1259 OID 23172086)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2651 (class 1259 OID 23172085)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2652 (class 1259 OID 23172084)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2633 (class 1259 OID 23172034)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2634 (class 1259 OID 23172035)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2635 (class 1259 OID 23172033)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2636 (class 1259 OID 23172037)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2637 (class 1259 OID 23172036)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2567 (class 1259 OID 23171853)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2548 (class 1259 OID 23171790)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2549 (class 1259 OID 23171791)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2591 (class 1259 OID 23171928)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 23171930)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2593 (class 1259 OID 23171929)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2594 (class 1259 OID 23171931)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2669 (class 1259 OID 23172111)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2744 (class 1259 OID 23172322)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2753 (class 1259 OID 23172355)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2735 (class 1259 OID 23172296)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2736 (class 1259 OID 23172297)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2557 (class 1259 OID 23171825)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2558 (class 1259 OID 23171826)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2708 (class 1259 OID 23172216)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2526 (class 1259 OID 23171715)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2584 (class 1259 OID 23171900)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2573 (class 1259 OID 23171862)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2523 (class 1259 OID 23171703)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2792 (class 1259 OID 23172574)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 23172163)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2692 (class 1259 OID 23172162)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2645 (class 1259 OID 23172062)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2646 (class 1259 OID 23172063)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2766 (class 1259 OID 23172386)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2581 (class 1259 OID 23171888)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2745 (class 1259 OID 23172335)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2803 (class 1259 OID 23172621)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2785 (class 1259 OID 23172550)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2786 (class 1259 OID 23172551)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2732 (class 1259 OID 23172285)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2649 (class 1259 OID 23172073)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2539 (class 1259 OID 23171765)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2858 (class 2606 OID 23172843)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2859 (class 2606 OID 23172848)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2863 (class 2606 OID 23172868)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2857 (class 2606 OID 23172838)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2861 (class 2606 OID 23172858)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2862 (class 2606 OID 23172863)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2860 (class 2606 OID 23172853)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2897 (class 2606 OID 23173038)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2898 (class 2606 OID 23173043)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2899 (class 2606 OID 23173048)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2932 (class 2606 OID 23173213)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2931 (class 2606 OID 23173208)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2835 (class 2606 OID 23172728)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2836 (class 2606 OID 23172733)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2880 (class 2606 OID 23172953)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2928 (class 2606 OID 23173193)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2927 (class 2606 OID 23173188)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2929 (class 2606 OID 23173198)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2926 (class 2606 OID 23173183)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2925 (class 2606 OID 23173178)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2879 (class 2606 OID 23172948)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2878 (class 2606 OID 23172943)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2855 (class 2606 OID 23172828)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2856 (class 2606 OID 23172833)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2888 (class 2606 OID 23172993)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2890 (class 2606 OID 23173003)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2889 (class 2606 OID 23172998)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2846 (class 2606 OID 23172783)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2845 (class 2606 OID 23172778)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2876 (class 2606 OID 23172933)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2923 (class 2606 OID 23173168)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2900 (class 2606 OID 23173053)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2901 (class 2606 OID 23173058)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2902 (class 2606 OID 23173063)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2930 (class 2606 OID 23173203)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2906 (class 2606 OID 23173083)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2903 (class 2606 OID 23173068)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2907 (class 2606 OID 23173088)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2905 (class 2606 OID 23173078)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2904 (class 2606 OID 23173073)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2844 (class 2606 OID 23172773)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2843 (class 2606 OID 23172768)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2832 (class 2606 OID 23172713)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2831 (class 2606 OID 23172708)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 23172973)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2827 (class 2606 OID 23172688)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2828 (class 2606 OID 23172693)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2887 (class 2606 OID 23172988)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2886 (class 2606 OID 23172983)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2885 (class 2606 OID 23172978)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2838 (class 2606 OID 23172743)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2837 (class 2606 OID 23172738)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2839 (class 2606 OID 23172748)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2851 (class 2606 OID 23172808)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2849 (class 2606 OID 23172798)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2850 (class 2606 OID 23172803)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2824 (class 2606 OID 23172673)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2871 (class 2606 OID 23172908)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2869 (class 2606 OID 23172898)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2868 (class 2606 OID 23172893)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2870 (class 2606 OID 23172903)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2825 (class 2606 OID 23172678)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2826 (class 2606 OID 23172683)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2881 (class 2606 OID 23172958)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2935 (class 2606 OID 23173228)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2896 (class 2606 OID 23173033)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2895 (class 2606 OID 23173028)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2936 (class 2606 OID 23173233)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2937 (class 2606 OID 23173238)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2877 (class 2606 OID 23172938)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2893 (class 2606 OID 23173018)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2894 (class 2606 OID 23173023)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2918 (class 2606 OID 23173143)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2917 (class 2606 OID 23173138)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2914 (class 2606 OID 23173123)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2915 (class 2606 OID 23173128)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2916 (class 2606 OID 23173133)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2841 (class 2606 OID 23172758)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2840 (class 2606 OID 23172753)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2842 (class 2606 OID 23172763)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2883 (class 2606 OID 23172968)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2882 (class 2606 OID 23172963)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2920 (class 2606 OID 23173153)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2921 (class 2606 OID 23173158)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2912 (class 2606 OID 23173113)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 23173118)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2910 (class 2606 OID 23173103)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2911 (class 2606 OID 23173108)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2891 (class 2606 OID 23173008)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 23173013)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2875 (class 2606 OID 23172928)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2874 (class 2606 OID 23172923)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2872 (class 2606 OID 23172913)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2873 (class 2606 OID 23172918)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2909 (class 2606 OID 23173098)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2908 (class 2606 OID 23173093)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2847 (class 2606 OID 23172788)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2848 (class 2606 OID 23172793)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2854 (class 2606 OID 23172823)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2852 (class 2606 OID 23172813)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2853 (class 2606 OID 23172818)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2919 (class 2606 OID 23173148)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2922 (class 2606 OID 23173163)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 23173173)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2933 (class 2606 OID 23173218)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2934 (class 2606 OID 23173223)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2830 (class 2606 OID 23172703)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2829 (class 2606 OID 23172698)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2833 (class 2606 OID 23172718)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2834 (class 2606 OID 23172723)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2864 (class 2606 OID 23172873)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2867 (class 2606 OID 23172888)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2866 (class 2606 OID 23172883)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2865 (class 2606 OID 23172878)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-23 10:48:58 CEST

--
-- PostgreSQL database dump complete
--

