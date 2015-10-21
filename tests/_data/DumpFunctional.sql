--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-10-21 17:14:52 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 250 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3137 (class 0 OID 0)
-- Dependencies: 250
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 23107306)
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
-- TOC entry 234 (class 1259 OID 23107911)
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
-- TOC entry 233 (class 1259 OID 23107894)
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
-- TOC entry 224 (class 1259 OID 23107771)
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
-- TOC entry 227 (class 1259 OID 23107801)
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
-- TOC entry 248 (class 1259 OID 23108182)
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
-- TOC entry 201 (class 1259 OID 23107551)
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
-- TOC entry 203 (class 1259 OID 23107582)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 242 (class 1259 OID 23108108)
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
-- TOC entry 192 (class 1259 OID 23107448)
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
-- TOC entry 235 (class 1259 OID 23107924)
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
-- TOC entry 220 (class 1259 OID 23107725)
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
-- TOC entry 198 (class 1259 OID 23107522)
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
-- TOC entry 195 (class 1259 OID 23107488)
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
-- TOC entry 3138 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 193 (class 1259 OID 23107465)
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
-- TOC entry 209 (class 1259 OID 23107639)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 246 (class 1259 OID 23108163)
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
-- TOC entry 247 (class 1259 OID 23108175)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 23108197)
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
-- TOC entry 170 (class 1259 OID 22757748)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 23107664)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 23107422)
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
-- TOC entry 183 (class 1259 OID 23107325)
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
-- TOC entry 187 (class 1259 OID 23107389)
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
-- TOC entry 184 (class 1259 OID 23107336)
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
-- TOC entry 178 (class 1259 OID 23107280)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 23107299)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 23107671)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 23107705)
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
-- TOC entry 230 (class 1259 OID 23107842)
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
-- TOC entry 186 (class 1259 OID 23107369)
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
-- TOC entry 189 (class 1259 OID 23107414)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 237 (class 1259 OID 23108053)
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
-- TOC entry 210 (class 1259 OID 23107645)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 188 (class 1259 OID 23107399)
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
-- TOC entry 200 (class 1259 OID 23107543)
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
-- TOC entry 196 (class 1259 OID 23107503)
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
-- TOC entry 197 (class 1259 OID 23107515)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 23107657)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 23108067)
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
-- TOC entry 239 (class 1259 OID 23108077)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 23107992)
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
-- TOC entry 240 (class 1259 OID 23108085)
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
-- TOC entry 216 (class 1259 OID 23107686)
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
-- TOC entry 208 (class 1259 OID 23107630)
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
-- TOC entry 207 (class 1259 OID 23107620)
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
-- TOC entry 229 (class 1259 OID 23107831)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 223 (class 1259 OID 23107761)
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
-- TOC entry 194 (class 1259 OID 23107477)
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
-- TOC entry 175 (class 1259 OID 23107251)
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
-- TOC entry 174 (class 1259 OID 23107249)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3139 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 217 (class 1259 OID 23107699)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 23107289)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 23107273)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 23107713)
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
-- TOC entry 211 (class 1259 OID 23107651)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 205 (class 1259 OID 23107597)
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
-- TOC entry 173 (class 1259 OID 23107238)
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
-- TOC entry 172 (class 1259 OID 23107230)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 23107225)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 225 (class 1259 OID 23107778)
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
-- TOC entry 185 (class 1259 OID 23107361)
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
-- TOC entry 206 (class 1259 OID 23107607)
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
-- TOC entry 228 (class 1259 OID 23107819)
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
-- TOC entry 182 (class 1259 OID 23107315)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 241 (class 1259 OID 23108096)
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
-- TOC entry 204 (class 1259 OID 23107587)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 191 (class 1259 OID 23107434)
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
-- TOC entry 176 (class 1259 OID 23107260)
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
-- TOC entry 232 (class 1259 OID 23107869)
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
-- TOC entry 199 (class 1259 OID 23107533)
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
-- TOC entry 215 (class 1259 OID 23107678)
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
-- TOC entry 226 (class 1259 OID 23107792)
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
-- TOC entry 244 (class 1259 OID 23108143)
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
-- TOC entry 243 (class 1259 OID 23108115)
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
-- TOC entry 245 (class 1259 OID 23108155)
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
-- TOC entry 222 (class 1259 OID 23107750)
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
-- TOC entry 202 (class 1259 OID 23107576)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 231 (class 1259 OID 23107859)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 221 (class 1259 OID 23107740)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2224 (class 2604 OID 23107254)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3062 (class 0 OID 23107306)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5627-abe9-d04f-185a36c4c844	10	30	Otroci	Abonma za otroke	200
000a0000-5627-abe9-6183-7071ac05bca3	20	60	Mladina	Abonma za mladino	400
000a0000-5627-abe9-bb16-102142c40c56	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3115 (class 0 OID 23107911)
-- Dependencies: 234
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5627-abea-9ce6-15dba8d5990a	000d0000-5627-abe9-d1e6-495e1a305c43	\N	00090000-5627-abe9-f005-94a0b4d930a6	000b0000-5627-abe9-12bb-c1c20c286f91	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5627-abea-4eaf-38edeaad1a20	000d0000-5627-abe9-e567-13a3ec2c07cf	00100000-5627-abe9-7fe1-f92713b1351b	00090000-5627-abe9-f4b4-02e4a31eb6f4	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5627-abea-95ad-efe77577ae4f	000d0000-5627-abe9-3253-6d458eb20d30	00100000-5627-abe9-2ac1-429431c908a4	00090000-5627-abe9-e780-dcb159636edd	\N	0003	t	\N	2015-10-21	\N	2	t	\N	f	f
000c0000-5627-abea-713f-5dc809c765d5	000d0000-5627-abe9-1d23-ee63cfc36837	\N	00090000-5627-abe9-579f-4c6e25f8b2a8	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5627-abea-6815-faf58294c0f7	000d0000-5627-abe9-b930-b9b9a1017134	\N	00090000-5627-abe9-f838-f206603f31fe	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5627-abea-1795-ff8ef38c244e	000d0000-5627-abe9-3e9e-94f9dddd2527	\N	00090000-5627-abe9-7b3d-6ec2a22d3d33	000b0000-5627-abe9-5ac4-31fd5627b673	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5627-abea-35b8-ed5812e8aae8	000d0000-5627-abe9-7e96-e3042623438c	00100000-5627-abe9-f623-3703165bfd51	00090000-5627-abe9-a2c3-4607abd47d13	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5627-abea-ee98-d1be03edaac1	000d0000-5627-abe9-1147-0aef7669ac90	\N	00090000-5627-abe9-d144-aee37a7e8572	000b0000-5627-abe9-6f45-c1e2871656c6	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5627-abea-1768-8d4a6b91d791	000d0000-5627-abe9-7e96-e3042623438c	00100000-5627-abe9-275e-f5a7ffd85dcc	00090000-5627-abe9-a8a0-fbd32edc03ce	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5627-abea-11e3-71dfa6ad6d37	000d0000-5627-abe9-7e96-e3042623438c	00100000-5627-abe9-c251-a871e27178d4	00090000-5627-abe9-f981-040631845dac	\N	0010	t	\N	2015-10-21	\N	16	f	\N	f	t
000c0000-5627-abea-cafe-b9fcc35863ce	000d0000-5627-abe9-7e96-e3042623438c	00100000-5627-abe9-c944-c9bda3dfd2b2	00090000-5627-abe9-2b97-e5bcd788684a	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5627-abea-078e-f97c54c6e048	000d0000-5627-abe9-481e-4a459f78d3b2	\N	00090000-5627-abe9-f4b4-02e4a31eb6f4	000b0000-5627-abe9-479d-c01c6cf4de75	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3114 (class 0 OID 23107894)
-- Dependencies: 233
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 23107771)
-- Dependencies: 224
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5627-abe9-0a74-49a29f6d9486	00160000-5627-abe9-a512-a24a976cd201	00090000-5627-abe9-9704-4dc73b2d5b9d	aizv	10	t
003d0000-5627-abe9-f4ad-8dcaececd6b4	00160000-5627-abe9-a512-a24a976cd201	00090000-5627-abe9-b359-95e0ba611a90	apri	14	t
003d0000-5627-abe9-ed7f-50a185aeeb7d	00160000-5627-abe9-4af0-54bf47d91b5c	00090000-5627-abe9-e644-959b28224eda	aizv	11	t
003d0000-5627-abe9-9e22-6f4b878c8475	00160000-5627-abe9-1a5b-3aa019940944	00090000-5627-abe9-a0fb-038d2b27c900	aizv	12	t
003d0000-5627-abe9-bf01-415df4d7b0bd	00160000-5627-abe9-a512-a24a976cd201	00090000-5627-abe9-1db3-103e1e8c6759	apri	18	f
\.


--
-- TOC entry 3108 (class 0 OID 23107801)
-- Dependencies: 227
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5627-abe9-a512-a24a976cd201	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5627-abe9-4af0-54bf47d91b5c	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5627-abe9-1a5b-3aa019940944	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3129 (class 0 OID 23108182)
-- Dependencies: 248
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3082 (class 0 OID 23107551)
-- Dependencies: 201
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5627-abea-b8b6-1a8222188106	\N	\N	00200000-5627-abe9-17eb-4c8e860fce25	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5627-abea-9c9b-a29912ab7cd9	\N	\N	00200000-5627-abe9-3c1f-a52238c4657c	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5627-abea-53b3-2947c92cbece	\N	\N	00200000-5627-abe9-9bdf-7ae785346c62	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5627-abea-cb2c-f7a6bfc956e1	\N	\N	00200000-5627-abe9-6648-a06fd3a9e126	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5627-abea-c61f-fcdc35c7e4ee	\N	\N	00200000-5627-abe9-cbd0-38dd121ec6c7	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3084 (class 0 OID 23107582)
-- Dependencies: 203
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 23108108)
-- Dependencies: 242
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3073 (class 0 OID 23107448)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5627-abe7-182a-3215f3150b50	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5627-abe7-9d62-823e92cc3663	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5627-abe7-6e08-2b60bad0d42d	AL	ALB	008	Albania 	Albanija	\N
00040000-5627-abe7-c567-daf6c77a57ae	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5627-abe7-8b54-7868853472ad	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5627-abe7-4775-f932b3c7912c	AD	AND	020	Andorra 	Andora	\N
00040000-5627-abe7-4968-1cca23af0473	AO	AGO	024	Angola 	Angola	\N
00040000-5627-abe7-eeed-2e93b27a3600	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5627-abe7-1eaf-e1dfd1944799	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5627-abe7-178a-0ea5a9384a4b	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5627-abe7-cedc-f0b87625990d	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5627-abe7-c1b8-501842961f64	AM	ARM	051	Armenia 	Armenija	\N
00040000-5627-abe7-862b-92106de2be25	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5627-abe7-5235-ca25a72a907a	AU	AUS	036	Australia 	Avstralija	\N
00040000-5627-abe7-de72-d6e9cc5488ab	AT	AUT	040	Austria 	Avstrija	\N
00040000-5627-abe7-2879-19616378e6ac	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5627-abe7-dcd9-74827b41c980	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5627-abe7-0af6-29d3b6ff0360	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5627-abe7-4761-3d200cab1d1f	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5627-abe7-c5c0-984a3886e2f3	BB	BRB	052	Barbados 	Barbados	\N
00040000-5627-abe7-3bad-9533a4a73e53	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5627-abe7-5c1a-62f1063689d2	BE	BEL	056	Belgium 	Belgija	\N
00040000-5627-abe7-5942-8b927fb7866e	BZ	BLZ	084	Belize 	Belize	\N
00040000-5627-abe7-6fc4-575e2f7873da	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5627-abe7-ace3-7805724bb9e8	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5627-abe7-a641-37328c043838	BT	BTN	064	Bhutan 	Butan	\N
00040000-5627-abe7-9707-b176b161a576	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5627-abe7-2b79-b4739bbc2457	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5627-abe7-7fba-0c878cc87174	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5627-abe7-f040-a61fc49850ef	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5627-abe7-c880-dab1ab3aff34	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5627-abe7-31f2-26e401606e10	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5627-abe7-c9a7-b354397d5801	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5627-abe7-075e-66d4b86587c0	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5627-abe7-28e7-28657f94bc91	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5627-abe7-53fa-73d705d0e34c	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5627-abe7-41cb-b5adf768d79f	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5627-abe7-dd2f-c632993c62f5	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5627-abe7-d6a8-1db7e1a9f4f3	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5627-abe7-de63-66561d1ee54b	CA	CAN	124	Canada 	Kanada	\N
00040000-5627-abe7-3ef9-48f19b289f61	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5627-abe7-80d0-f03159304860	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5627-abe7-f6ec-4e70461d328f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5627-abe7-2b21-ddc1a807582e	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5627-abe7-c7dd-1791ed58a05c	CL	CHL	152	Chile 	Čile	\N
00040000-5627-abe7-35d8-27d28888eeeb	CN	CHN	156	China 	Kitajska	\N
00040000-5627-abe7-905d-8dbd65abfb6d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5627-abe7-22a2-0adc6cc4882a	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5627-abe7-9c63-f5b055ef76cb	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5627-abe7-3a80-5fe3d00c10ea	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5627-abe7-80c0-a89ad69fd7a6	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5627-abe7-c058-d087440c8335	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5627-abe7-dd94-e22e12bc75c4	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5627-abe7-c4bc-78f548d8f52b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5627-abe7-1764-4ee345f1744e	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5627-abe7-4993-9390aa396213	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5627-abe7-a8ce-875c996a475c	CU	CUB	192	Cuba 	Kuba	\N
00040000-5627-abe7-5cd0-7fac7a9dc043	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5627-abe7-db32-57c2befc37f0	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5627-abe7-6f44-fcbfd71c58b0	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5627-abe7-dc1d-d5056727d005	DK	DNK	208	Denmark 	Danska	\N
00040000-5627-abe7-7afc-07ad339595ed	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5627-abe7-535e-51bf7037a37d	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5627-abe7-0cdd-3afac0b897cf	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5627-abe7-76d0-45bd69889bf3	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5627-abe7-37e4-25436cb2d1c7	EG	EGY	818	Egypt 	Egipt	\N
00040000-5627-abe7-e246-f9431b83e397	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5627-abe7-cc63-d235d398db2f	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5627-abe7-d355-e19ccf2df6aa	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5627-abe7-9059-f93bf1a9dcac	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5627-abe7-8245-f884adbb011b	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5627-abe7-ae53-70cbebd49caa	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5627-abe7-77b5-7eb7719e1b40	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5627-abe7-baa3-5be0c855489d	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5627-abe7-043e-070ff72b2f7b	FI	FIN	246	Finland 	Finska	\N
00040000-5627-abe7-4732-b33dfd926f9a	FR	FRA	250	France 	Francija	\N
00040000-5627-abe7-0fb6-96fec0abc73c	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5627-abe7-c506-9bd12113efff	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5627-abe7-715d-39b8617f7b96	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5627-abe7-1457-8a9af8c05634	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5627-abe7-71ef-289c4460898f	GA	GAB	266	Gabon 	Gabon	\N
00040000-5627-abe7-2736-46cb24960422	GM	GMB	270	Gambia 	Gambija	\N
00040000-5627-abe7-df21-c5ba93bab72a	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5627-abe7-3b3d-8590d4af287a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5627-abe7-a3bd-c5884ce38131	GH	GHA	288	Ghana 	Gana	\N
00040000-5627-abe7-cb1f-b5f185c838c2	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5627-abe7-d76b-2135d94ba6aa	GR	GRC	300	Greece 	Grčija	\N
00040000-5627-abe7-890f-2e6b7243b918	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5627-abe7-853a-a9950c575414	GD	GRD	308	Grenada 	Grenada	\N
00040000-5627-abe7-e78e-1cb48009ea73	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5627-abe7-9996-8b91b4afffa9	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5627-abe7-51df-3d14c348c5e0	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5627-abe7-0478-91f29fb4975b	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5627-abe7-5a9a-8db2c33112c7	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5627-abe7-6f7d-6e3560298fd7	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5627-abe7-fe73-1d1031084d6a	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5627-abe7-4ddf-65651105e32c	HT	HTI	332	Haiti 	Haiti	\N
00040000-5627-abe7-43e6-eb7061d1f9f9	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5627-abe7-9b67-1fd846b708be	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5627-abe7-a503-87c45da85b88	HN	HND	340	Honduras 	Honduras	\N
00040000-5627-abe7-c5b9-dfe29adb250c	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5627-abe7-fdd8-15f4d2190513	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5627-abe7-8750-bb9f4ca03147	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5627-abe7-e712-4b14717a4e03	IN	IND	356	India 	Indija	\N
00040000-5627-abe7-3728-60699a396c07	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5627-abe7-f69c-4eee13f48ee4	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5627-abe7-944b-d40bc275c4af	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5627-abe7-fb8c-ab87c4ea1434	IE	IRL	372	Ireland 	Irska	\N
00040000-5627-abe7-2fb0-f9f88d33b5b4	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5627-abe7-43d0-5774c37c8190	IL	ISR	376	Israel 	Izrael	\N
00040000-5627-abe7-7a12-4a3dcf4bfd0f	IT	ITA	380	Italy 	Italija	\N
00040000-5627-abe7-63c3-d890a9ea45df	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5627-abe7-de18-695db74087ab	JP	JPN	392	Japan 	Japonska	\N
00040000-5627-abe7-8d84-f79f47ad536d	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5627-abe7-dc6d-096eb34b56d9	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5627-abe7-eaef-662580d35cbd	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5627-abe7-7b7e-8152f6bd0499	KE	KEN	404	Kenya 	Kenija	\N
00040000-5627-abe7-334b-44d49e53ede7	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5627-abe7-f6ba-00e5ca3f1628	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5627-abe7-40c2-c9c5a3f0903b	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5627-abe7-1b55-0bce9d2e8c13	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5627-abe7-ae44-993fd213b621	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5627-abe7-076d-0717a95c398e	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5627-abe7-4d63-aba325d79a0f	LV	LVA	428	Latvia 	Latvija	\N
00040000-5627-abe7-bcfd-1b1f3790198d	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5627-abe7-879d-44616eee5d31	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5627-abe7-aa41-def233748c1c	LR	LBR	430	Liberia 	Liberija	\N
00040000-5627-abe7-ecd4-c7e52024b12b	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5627-abe7-c9f5-3fe120536f30	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5627-abe7-e543-bc84a0ca92dc	LT	LTU	440	Lithuania 	Litva	\N
00040000-5627-abe7-ef96-a8158252d7f6	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5627-abe7-c245-f5fcfa4af021	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5627-abe7-5aca-79b930ff19f7	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5627-abe7-cf27-82c0d44c1ea3	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5627-abe7-5ac4-38e62bae6a5a	MW	MWI	454	Malawi 	Malavi	\N
00040000-5627-abe7-9284-c7477e15f223	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5627-abe7-e2f4-45c208ef5f8c	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5627-abe7-1a28-99df5911ff57	ML	MLI	466	Mali 	Mali	\N
00040000-5627-abe7-903c-e342c1ad2248	MT	MLT	470	Malta 	Malta	\N
00040000-5627-abe7-7d77-13dca413da97	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5627-abe7-a0d1-3c3fbdf89210	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5627-abe7-92d6-03679445a428	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5627-abe7-2e7a-d5bb50a5cef1	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5627-abe7-303f-614faeb6822e	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5627-abe7-9638-5cad3443c1f4	MX	MEX	484	Mexico 	Mehika	\N
00040000-5627-abe7-e862-6643794c8b83	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5627-abe7-4103-3af8bda77ae9	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5627-abe7-2473-864ea341e2ff	MC	MCO	492	Monaco 	Monako	\N
00040000-5627-abe7-a3a9-dccea3e9097f	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5627-abe7-5a43-a0cfd369d49c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5627-abe7-239c-1faed62c6add	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5627-abe7-796b-7d1358da7929	MA	MAR	504	Morocco 	Maroko	\N
00040000-5627-abe7-cd1b-dc2316531c2a	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5627-abe7-168b-66ccb6dec0b6	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5627-abe7-d7c8-248c64b06a0f	NA	NAM	516	Namibia 	Namibija	\N
00040000-5627-abe7-e2af-075d664dfde8	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5627-abe7-1a08-5e9406054742	NP	NPL	524	Nepal 	Nepal	\N
00040000-5627-abe7-f4e3-61e4465b9646	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5627-abe7-443a-be56951fcb98	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5627-abe7-3c51-621b052e1f4a	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5627-abe7-4b12-98e3adf02996	NE	NER	562	Niger 	Niger 	\N
00040000-5627-abe7-a774-b254df3f15c7	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5627-abe7-1a6d-6934622c5ecc	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5627-abe7-7a06-98734ad76e73	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5627-abe7-1813-6b4be9ad5216	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5627-abe7-4809-27546d1d3566	NO	NOR	578	Norway 	Norveška	\N
00040000-5627-abe7-e2db-df9e858d9a06	OM	OMN	512	Oman 	Oman	\N
00040000-5627-abe7-a79e-fc872a23c524	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5627-abe7-66f2-12bc4127db18	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5627-abe7-3d87-59b6afee7f82	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5627-abe7-2326-79224907b780	PA	PAN	591	Panama 	Panama	\N
00040000-5627-abe7-d103-4caa5a6aa7ba	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5627-abe7-a950-b2b0c8c3d019	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5627-abe7-17bd-c85b753ff369	PE	PER	604	Peru 	Peru	\N
00040000-5627-abe7-99a7-a64bf084d8d9	PH	PHL	608	Philippines 	Filipini	\N
00040000-5627-abe7-5a65-036ea30ba761	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5627-abe7-f91e-d5a0d8542552	PL	POL	616	Poland 	Poljska	\N
00040000-5627-abe7-c549-57accecd7449	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5627-abe7-a9e2-4e0bfb992997	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5627-abe7-25c6-f361081101ce	QA	QAT	634	Qatar 	Katar	\N
00040000-5627-abe7-343b-558547a2a6c6	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5627-abe7-c9f3-723e11f25df3	RO	ROU	642	Romania 	Romunija	\N
00040000-5627-abe7-d97e-c5b126b13208	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5627-abe7-4a7a-2b4c7e2ec41e	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5627-abe7-8c4f-8faccc2c246a	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5627-abe7-f88b-0cc5fa91599e	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5627-abe7-ac46-0a0845f41820	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5627-abe7-c70f-7cf864163013	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5627-abe7-1d50-eec5005a6fd3	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5627-abe7-cd49-6a7acb01f97c	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5627-abe7-36a2-cdcb626e51c2	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5627-abe7-4029-02573fc4bbc7	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5627-abe7-7834-e73a6e034cb9	SM	SMR	674	San Marino 	San Marino	\N
00040000-5627-abe7-a3fb-1b806b18c277	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5627-abe7-8c62-3b3383dc8829	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5627-abe7-481a-33645f75bb7b	SN	SEN	686	Senegal 	Senegal	\N
00040000-5627-abe7-0309-8e9cef45e95c	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5627-abe7-6006-3e2008211360	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5627-abe7-cda3-6b7615b88e8c	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5627-abe7-3c92-4a5dbbe099fd	SG	SGP	702	Singapore 	Singapur	\N
00040000-5627-abe7-44ee-b33f610750a2	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5627-abe7-4d5c-f5d18f0aa9a6	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5627-abe7-6f7b-3b5b7ce3ba27	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5627-abe7-d5fb-153c9ea34ed1	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5627-abe7-007d-16554a4f5e22	SO	SOM	706	Somalia 	Somalija	\N
00040000-5627-abe7-488f-da75e1dec44f	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5627-abe7-3b1d-7182b83d79fe	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5627-abe7-a8c9-14bbf3aad0fe	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5627-abe7-e861-c187bd63cd99	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5627-abe7-3a9d-ff0af2633e61	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5627-abe7-7cad-cc33ae2a4fdf	SD	SDN	729	Sudan 	Sudan	\N
00040000-5627-abe7-ddda-0b5dcac59f53	SR	SUR	740	Suriname 	Surinam	\N
00040000-5627-abe7-4cd0-6cf2f0d0d9e5	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5627-abe7-9056-f3e58a3c0223	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5627-abe7-08eb-5725008c5206	SE	SWE	752	Sweden 	Švedska	\N
00040000-5627-abe7-daf1-77a63c56b184	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5627-abe7-3876-f4c2f3c3e422	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5627-abe7-6b0e-ed67072b01df	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5627-abe7-3025-a603c031d45d	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5627-abe7-f0ca-308cf8969364	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5627-abe7-3bc1-77247a7a101b	TH	THA	764	Thailand 	Tajska	\N
00040000-5627-abe7-da29-3c4c4b3c04c9	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5627-abe7-fa5c-e427b7b5b67a	TG	TGO	768	Togo 	Togo	\N
00040000-5627-abe7-e11e-ed1c9369f427	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5627-abe7-19f3-ace94b80ab0f	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5627-abe7-9e2c-954f90f385f0	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5627-abe7-9931-cc3078217c3b	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5627-abe7-18a4-02b2c8878f0b	TR	TUR	792	Turkey 	Turčija	\N
00040000-5627-abe7-c27a-04241fda2bd1	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5627-abe7-f8af-726e28829ad4	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5627-abe7-d537-75b367fe4392	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5627-abe7-ee13-950d0bcdc1ac	UG	UGA	800	Uganda 	Uganda	\N
00040000-5627-abe7-8cab-732bbe9b2021	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5627-abe7-4757-72fc8564b2e3	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5627-abe7-40e0-79876cf08bda	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5627-abe7-2dce-f664b5975029	US	USA	840	United States 	Združene države Amerike	\N
00040000-5627-abe7-6f6e-6af4c9c73051	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5627-abe7-2816-40f64b03c832	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5627-abe7-8d2a-140d44f79c37	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5627-abe7-82a9-374b320b70cf	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5627-abe7-8326-ebc327bb4424	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5627-abe7-d604-f338cc36740e	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5627-abe7-b318-96773077ee63	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5627-abe7-7419-985511c06f6c	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5627-abe7-2b9f-c8a716237f8b	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5627-abe7-9ac8-8a4ebea0a95c	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5627-abe7-b4ba-c7270c2432ba	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5627-abe7-d6b9-907d02d87802	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5627-abe7-b050-9e766702b5ae	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3116 (class 0 OID 23107924)
-- Dependencies: 235
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5627-abe9-a848-aea46819c93a	000e0000-5627-abe9-0120-9e4fda6f5a07	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5627-abe7-3141-5f5adee9bf30	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5627-abe9-b859-8a75f6ace124	000e0000-5627-abe9-7469-4d6aee2cc776	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5627-abe7-1191-100bd0e0c94f	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5627-abea-53c7-cf673de2a9f6	000e0000-5627-abe9-e6cf-82b142576538	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5627-abe7-3141-5f5adee9bf30	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5627-abea-45cf-89bb3be39665	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5627-abea-ffd3-d2b6c0049755	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3101 (class 0 OID 23107725)
-- Dependencies: 220
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5627-abe9-d1e6-495e1a305c43	000e0000-5627-abe9-7469-4d6aee2cc776	000c0000-5627-abea-9ce6-15dba8d5990a	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5627-abe7-c50a-790cd863dc2e
000d0000-5627-abe9-e567-13a3ec2c07cf	000e0000-5627-abe9-7469-4d6aee2cc776	000c0000-5627-abea-4eaf-38edeaad1a20	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5627-abe7-8a52-270f1376c9d0
000d0000-5627-abe9-3253-6d458eb20d30	000e0000-5627-abe9-7469-4d6aee2cc776	000c0000-5627-abea-95ad-efe77577ae4f	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5627-abe7-ce97-df31f850e86d
000d0000-5627-abe9-1d23-ee63cfc36837	000e0000-5627-abe9-7469-4d6aee2cc776	000c0000-5627-abea-713f-5dc809c765d5	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5627-abe7-c6eb-1e05486b32ec
000d0000-5627-abe9-b930-b9b9a1017134	000e0000-5627-abe9-7469-4d6aee2cc776	000c0000-5627-abea-6815-faf58294c0f7	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5627-abe7-c6eb-1e05486b32ec
000d0000-5627-abe9-3e9e-94f9dddd2527	000e0000-5627-abe9-7469-4d6aee2cc776	000c0000-5627-abea-1795-ff8ef38c244e	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5627-abe7-c50a-790cd863dc2e
000d0000-5627-abe9-7e96-e3042623438c	000e0000-5627-abe9-7469-4d6aee2cc776	000c0000-5627-abea-1768-8d4a6b91d791	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5627-abe7-c50a-790cd863dc2e
000d0000-5627-abe9-1147-0aef7669ac90	000e0000-5627-abe9-7469-4d6aee2cc776	000c0000-5627-abea-ee98-d1be03edaac1	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5627-abe7-0888-3111c3fae609
000d0000-5627-abe9-481e-4a459f78d3b2	000e0000-5627-abe9-7469-4d6aee2cc776	000c0000-5627-abea-078e-f97c54c6e048	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5627-abe7-437f-dfa3bcba21f2
\.


--
-- TOC entry 3079 (class 0 OID 23107522)
-- Dependencies: 198
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3076 (class 0 OID 23107488)
-- Dependencies: 195
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3074 (class 0 OID 23107465)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5627-abe9-2533-cc94d44fd931	00080000-5627-abe9-530f-28cd2615a3c9	00090000-5627-abe9-f981-040631845dac	AK		igralka
\.


--
-- TOC entry 3090 (class 0 OID 23107639)
-- Dependencies: 209
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 23108163)
-- Dependencies: 246
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 23108175)
-- Dependencies: 247
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 23108197)
-- Dependencies: 249
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3051 (class 0 OID 22757748)
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
20151012154609
20151013160827
20151015150048
\.


--
-- TOC entry 3094 (class 0 OID 23107664)
-- Dependencies: 213
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3071 (class 0 OID 23107422)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5627-abe8-2fb7-c8521a7885f9	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5627-abe8-0f8b-b1ea99fdbae7	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5627-abe8-c1cf-bad6e4ea4211	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5627-abe8-dcda-5502904ba919	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5627-abe8-8d10-ba0f66bb5552	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5627-abe8-0991-7f04b1856b40	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5627-abe8-772d-8247a609cf19	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5627-abe8-c994-560982aa341e	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5627-abe8-29c1-3c7b61c44122	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5627-abe8-eb76-c60886ef3b6e	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5627-abe8-ecf4-fa75b1effaf5	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5627-abe8-f0ec-858f48b1de22	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5627-abe8-8eb8-ecc2587462cd	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5627-abe8-8039-d4759e55a7f4	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5627-abe8-a997-9c3b255e8106	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5627-abe9-e951-4a625e8a277d	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5627-abe9-8011-7e39cb58bfcc	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5627-abe9-a7b6-1c9c9a016be4	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5627-abe9-7c51-8050f08015db	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5627-abe9-7d0e-2fa2f9048765	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5627-abeb-b400-41a1c2bbf924	application.tenant.maticnopodjetje	string	s:36:"00080000-5627-abeb-1a8a-d4619369367f";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3064 (class 0 OID 23107325)
-- Dependencies: 183
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5627-abe9-3d15-2c02bf40510c	00000000-5627-abe9-e951-4a625e8a277d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5627-abe9-c4b0-09ca96c0819d	00000000-5627-abe9-e951-4a625e8a277d	00010000-5627-abe8-0753-8ea939dae2ba	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5627-abe9-0a50-f715f11ddfb5	00000000-5627-abe9-8011-7e39cb58bfcc	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3068 (class 0 OID 23107389)
-- Dependencies: 187
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5627-abe9-d98c-79346f44c103	\N	00100000-5627-abe9-7fe1-f92713b1351b	00100000-5627-abe9-2ac1-429431c908a4	01	Gledališče Nimbis
00410000-5627-abe9-016b-21cbcf59913d	00410000-5627-abe9-d98c-79346f44c103	00100000-5627-abe9-7fe1-f92713b1351b	00100000-5627-abe9-2ac1-429431c908a4	02	Tehnika
\.


--
-- TOC entry 3065 (class 0 OID 23107336)
-- Dependencies: 184
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5627-abe9-f005-94a0b4d930a6	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5627-abe9-579f-4c6e25f8b2a8	00010000-5627-abe9-711e-3e6b9aebced4	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5627-abe9-e780-dcb159636edd	00010000-5627-abe9-5298-a7779dea0514	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5627-abe9-a8a0-fbd32edc03ce	00010000-5627-abe9-3113-e4f4ad97febd	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5627-abe9-a0b4-5e8f481edcf2	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5627-abe9-7b3d-6ec2a22d3d33	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5627-abe9-2b97-e5bcd788684a	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5627-abe9-a2c3-4607abd47d13	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5627-abe9-f981-040631845dac	00010000-5627-abe9-02f6-97ddde327f21	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5627-abe9-f4b4-02e4a31eb6f4	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5627-abe9-e4ed-56a8bfc14aee	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5627-abe9-f838-f206603f31fe	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5627-abe9-d144-aee37a7e8572	00010000-5627-abe9-44e6-ad519cdfe439	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5627-abe9-9704-4dc73b2d5b9d	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5627-abe9-b359-95e0ba611a90	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5627-abe9-e644-959b28224eda	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5627-abe9-a0fb-038d2b27c900	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5627-abe9-1db3-103e1e8c6759	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5627-abe9-94de-da2f741b2e6d	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N	\N	\N	\N	M		\N	\N	\N
00090000-5627-abe9-b313-ad7053622ee0	\N	\N	0020		Luka	Novak			Luka  Novak		\N	\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3059 (class 0 OID 23107280)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5627-abe7-6e92-6d32ce5fa5b3	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5627-abe7-051c-a7087fa5c08e	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5627-abe7-8771-e96ebc5903c7	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5627-abe7-4b69-5b461c40b64e	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5627-abe7-8a07-ccae110ae131	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5627-abe7-5c44-84b45daf7f9a	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5627-abe7-7601-86dd8169bec4	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5627-abe7-86c8-a64dd487c415	Abonma-read	Abonma - branje	f
00030000-5627-abe7-143c-cc2f4d0d418a	Abonma-write	Abonma - spreminjanje	f
00030000-5627-abe7-16a3-745c5b521a7f	Alternacija-read	Alternacija - branje	f
00030000-5627-abe7-8d68-c0cd9fcbc2e7	Alternacija-write	Alternacija - spreminjanje	f
00030000-5627-abe7-d616-f557dd20fb1d	Arhivalija-read	Arhivalija - branje	f
00030000-5627-abe7-078a-22ca2a3de85d	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5627-abe7-fc85-78608fbc450e	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5627-abe7-d21c-3ab474a325bc	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5627-abe7-6704-9c1c331c8c6f	Besedilo-read	Besedilo - branje	f
00030000-5627-abe7-45da-17784493b98f	Besedilo-write	Besedilo - spreminjanje	f
00030000-5627-abe7-9ae2-e203d8a82f62	DogodekIzven-read	DogodekIzven - branje	f
00030000-5627-abe7-658f-8f1d824390d2	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5627-abe7-77a1-8b9ce5cec0b4	Dogodek-read	Dogodek - branje	f
00030000-5627-abe7-6dc9-62ca53ee7c22	Dogodek-write	Dogodek - spreminjanje	f
00030000-5627-abe7-24cc-93619daf9232	DrugiVir-read	DrugiVir - branje	f
00030000-5627-abe7-31fe-6e13ba57e9a5	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5627-abe7-1e69-e90e041a453d	Drzava-read	Drzava - branje	f
00030000-5627-abe7-3281-c26115703fd9	Drzava-write	Drzava - spreminjanje	f
00030000-5627-abe7-ec08-f8b282052c4d	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5627-abe7-5965-d1272d5111c0	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5627-abe7-91e6-4d4b2ec9867d	Funkcija-read	Funkcija - branje	f
00030000-5627-abe7-12a2-34db74df8d99	Funkcija-write	Funkcija - spreminjanje	f
00030000-5627-abe7-102f-726d440c03bb	Gostovanje-read	Gostovanje - branje	f
00030000-5627-abe7-df05-03a36662180a	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5627-abe7-b09c-b197575bdb31	Gostujoca-read	Gostujoca - branje	f
00030000-5627-abe7-6dcb-63b4ff11f65b	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5627-abe7-ab68-f90764e9b7a8	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5627-abe7-0c1e-ed6ed27e1634	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5627-abe7-3361-f8502b5d737f	Kupec-read	Kupec - branje	f
00030000-5627-abe7-31e0-6f02df93206c	Kupec-write	Kupec - spreminjanje	f
00030000-5627-abe7-1b24-8b10337108ee	NacinPlacina-read	NacinPlacina - branje	f
00030000-5627-abe7-ca6d-08fc4ccbe297	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5627-abe7-0bc1-a66426463b1e	Option-read	Option - branje	f
00030000-5627-abe7-eb99-90eed97fbf18	Option-write	Option - spreminjanje	f
00030000-5627-abe7-9ead-8fdce7d8e94e	OptionValue-read	OptionValue - branje	f
00030000-5627-abe7-fbe3-667f5cd3321f	OptionValue-write	OptionValue - spreminjanje	f
00030000-5627-abe7-7bc0-9af31a5edf54	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	f
00030000-5627-abe7-c0e9-c95ddec6bea3	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	f
00030000-5627-abe7-2c7e-c6a813efdbb1	Oseba-read	Oseba - branje	f
00030000-5627-abe7-82cc-0572f0065930	Oseba-write	Oseba - spreminjanje	f
00030000-5627-abe7-4ba7-18bd1adc67d2	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5627-abe7-3858-6fa67d13cf09	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5627-abe8-dbfe-6dd2978c55dc	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5627-abe8-6cae-66c0ac033998	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5627-abe8-a8e7-47017abf6c0e	Pogodba-read	Pogodba - branje	f
00030000-5627-abe8-e80f-761d08d67f48	Pogodba-write	Pogodba - spreminjanje	f
00030000-5627-abe8-537b-ad109603a536	Popa-read	Popa - branje	f
00030000-5627-abe8-2243-0efd73441228	Popa-write	Popa - spreminjanje	f
00030000-5627-abe8-4235-a4732b1d873a	Posta-read	Posta - branje	f
00030000-5627-abe8-4bc9-3065e16029c1	Posta-write	Posta - spreminjanje	f
00030000-5627-abe8-6338-1694f01ffd51	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5627-abe8-20ef-e0ab7a2fb698	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5627-abe8-0200-8f5652d08e90	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5627-abe8-42d7-5e9d765b88d8	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5627-abe8-62a5-c1c276db9c71	PostniNaslov-read	PostniNaslov - branje	f
00030000-5627-abe8-f7dd-9103b51128f3	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5627-abe8-7c98-8aaf318d40e0	Predstava-read	Predstava - branje	f
00030000-5627-abe8-e483-027b9a4b1308	Predstava-write	Predstava - spreminjanje	f
00030000-5627-abe8-ccb7-fee38a498a98	Praznik-read	Praznik - branje	f
00030000-5627-abe8-e11b-bb79696786dc	Praznik-write	Praznik - spreminjanje	f
00030000-5627-abe8-4e08-f4a33530c11a	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5627-abe8-09d5-5ee7a9667252	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5627-abe8-c2f8-e2ae73161f0a	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5627-abe8-e53c-4a156179fd3e	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5627-abe8-5468-a96be3df100d	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5627-abe8-f3a4-b436d152d66c	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5627-abe8-c463-d1c87267285e	ProgramDela-read	ProgramDela - branje	f
00030000-5627-abe8-70e1-d3c3f2a83cd6	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5627-abe8-ab77-72cf7237d085	ProgramFestival-read	ProgramFestival - branje	f
00030000-5627-abe8-36b3-f6fea8372cf0	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5627-abe8-a86d-bd1cfa33d95d	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5627-abe8-5208-49c5d89aef16	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5627-abe8-efdf-6f0de7c5964b	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5627-abe8-39f4-0ae8b12215eb	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5627-abe8-01e9-c71c7d911329	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5627-abe8-b241-d83cbcd1a22e	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5627-abe8-e2d3-bae28eb9858c	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5627-abe8-e2c8-806387a9b3ea	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5627-abe8-9dfb-35bccd6192fb	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5627-abe8-398c-5cbdc2ad3986	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5627-abe8-e5e2-abc8ec06a183	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5627-abe8-dcd5-29507eb08e85	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5627-abe8-f0aa-5ffd0d36b08b	ProgramRazno-read	ProgramRazno - branje	f
00030000-5627-abe8-a12b-b9914af144b0	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5627-abe8-2b99-0fc580d5e42c	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5627-abe8-f858-f24158b7e04e	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5627-abe8-db00-adc232300478	Prostor-read	Prostor - branje	f
00030000-5627-abe8-d689-67ce25e1547c	Prostor-write	Prostor - spreminjanje	f
00030000-5627-abe8-fec6-50e89af73f2e	Racun-read	Racun - branje	f
00030000-5627-abe8-e642-7b86ef327a40	Racun-write	Racun - spreminjanje	f
00030000-5627-abe8-de36-cf40ae19fd12	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5627-abe8-3632-653d5015305a	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5627-abe8-f2e8-148563f4449c	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5627-abe8-b6be-9dc0f523cc82	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5627-abe8-1752-d0b408f5d406	Rekvizit-read	Rekvizit - branje	f
00030000-5627-abe8-51b9-c1a679526e96	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5627-abe8-9c43-af83a92e2174	Revizija-read	Revizija - branje	f
00030000-5627-abe8-c6d4-91a66829490f	Revizija-write	Revizija - spreminjanje	f
00030000-5627-abe8-3173-2316dc1c50ae	Rezervacija-read	Rezervacija - branje	f
00030000-5627-abe8-6e26-b6def7b147d9	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5627-abe8-7c55-17d0ca5ca28e	SedezniRed-read	SedezniRed - branje	f
00030000-5627-abe8-9962-a40221d24ede	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5627-abe8-04fe-ddb7d01fb77f	Sedez-read	Sedez - branje	f
00030000-5627-abe8-c12f-56408d8c2819	Sedez-write	Sedez - spreminjanje	f
00030000-5627-abe8-084c-8fd392fa0fd4	Sezona-read	Sezona - branje	f
00030000-5627-abe8-dae1-46b972d0a9d0	Sezona-write	Sezona - spreminjanje	f
00030000-5627-abe8-e01c-5e7a43af39f1	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5627-abe8-3a3e-e911f706fabf	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5627-abe8-b01a-4b39bad14f96	Stevilcenje-read	Stevilcenje - branje	f
00030000-5627-abe8-3c43-4688eecf911a	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5627-abe8-152a-c70049b50cdf	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5627-abe8-17b7-349eaa6d5d92	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5627-abe8-300b-880bcb069393	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5627-abe8-0b4f-c9ba3d677854	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5627-abe8-c3d5-457b60d26bf9	Telefonska-read	Telefonska - branje	f
00030000-5627-abe8-de86-3edf153ebee1	Telefonska-write	Telefonska - spreminjanje	f
00030000-5627-abe8-e89e-d826a66b4dac	TerminStoritve-read	TerminStoritve - branje	f
00030000-5627-abe8-c8ef-ecc7ce42da86	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5627-abe8-3b40-53408bf37bc1	TipFunkcije-read	TipFunkcije - branje	f
00030000-5627-abe8-6f8f-01c6fd0a7bfd	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5627-abe8-2da7-784f7749d858	TipPopa-read	TipPopa - branje	f
00030000-5627-abe8-f29e-90eebd9f39ba	TipPopa-write	TipPopa - spreminjanje	f
00030000-5627-abe8-fecf-53b9f0565c46	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5627-abe8-c584-31ad8cbdd4f1	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5627-abe8-eee7-cba610a7c25b	TipVaje-read	TipVaje - branje	f
00030000-5627-abe8-3f72-1e8c1b469c89	TipVaje-write	TipVaje - spreminjanje	f
00030000-5627-abe8-9b11-65b4701af34e	Trr-read	Trr - branje	f
00030000-5627-abe8-a31a-a2e700bac969	Trr-write	Trr - spreminjanje	f
00030000-5627-abe8-5078-3de9e19e703f	Uprizoritev-read	Uprizoritev - branje	f
00030000-5627-abe8-3279-0ee54f78ea47	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5627-abe8-ab68-a7a4ad74890c	Vaja-read	Vaja - branje	f
00030000-5627-abe8-87c2-d9747ca3a4f0	Vaja-write	Vaja - spreminjanje	f
00030000-5627-abe8-a4da-4c1a0e10272f	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5627-abe8-1107-b78f7a8a3646	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5627-abe8-7d7a-277f953eaee0	VrstaStroska-read	VrstaStroska - branje	f
00030000-5627-abe8-bda8-e76bf57eef95	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5627-abe8-da46-652bb507e67f	Zaposlitev-read	Zaposlitev - branje	f
00030000-5627-abe8-2d73-9500567b8e2a	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5627-abe8-5316-6fa9f6e8862b	Zasedenost-read	Zasedenost - branje	f
00030000-5627-abe8-5815-0fea963dc096	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5627-abe8-8ead-2773b30c8939	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5627-abe8-73ea-e71822aa2e55	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5627-abe8-abe3-9979e6339532	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5627-abe8-f703-c315c0d40600	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5627-abe8-8e4a-d5c22c1b4836	Job-read	Branje opravil - samo zase - branje	f
00030000-5627-abe8-8c11-110d950ce2b5	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5627-abe8-3087-b24d505adf3b	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5627-abe8-d87b-ece2b3bff3d7	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5627-abe8-96b0-aaa482b7fa0a	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5627-abe8-f571-f1e0b7d4f612	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5627-abe8-1736-c5c53c30be77	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5627-abe8-041c-f545ce44c680	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5627-abe8-fca2-276ae8288eaf	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5627-abe8-046c-1afc93dcec8f	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5627-abe8-31fd-8e1ace7576c3	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5627-abe8-8912-f9f2a62c4f29	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5627-abe8-260a-c8b6008c5ebf	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5627-abe8-c9b6-f380792db5e4	Datoteka-write	Datoteka - spreminjanje	f
00030000-5627-abe8-91be-65c56120a1a0	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3061 (class 0 OID 23107299)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5627-abe8-e5d7-1b6ca9bcdab2	00030000-5627-abe7-051c-a7087fa5c08e
00020000-5627-abe8-de20-e076abf65fc5	00030000-5627-abe7-1e69-e90e041a453d
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe7-86c8-a64dd487c415
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe7-143c-cc2f4d0d418a
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe7-16a3-745c5b521a7f
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe7-8d68-c0cd9fcbc2e7
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe7-d616-f557dd20fb1d
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe7-77a1-8b9ce5cec0b4
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe7-4b69-5b461c40b64e
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe7-6dc9-62ca53ee7c22
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe7-1e69-e90e041a453d
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe7-3281-c26115703fd9
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe7-91e6-4d4b2ec9867d
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe7-12a2-34db74df8d99
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe7-102f-726d440c03bb
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe7-df05-03a36662180a
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe7-b09c-b197575bdb31
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe7-6dcb-63b4ff11f65b
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe7-ab68-f90764e9b7a8
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe7-0c1e-ed6ed27e1634
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe7-0bc1-a66426463b1e
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe7-9ead-8fdce7d8e94e
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe7-2c7e-c6a813efdbb1
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe7-82cc-0572f0065930
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-537b-ad109603a536
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-2243-0efd73441228
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-4235-a4732b1d873a
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-4bc9-3065e16029c1
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-62a5-c1c276db9c71
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-f7dd-9103b51128f3
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-7c98-8aaf318d40e0
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-e483-027b9a4b1308
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-5468-a96be3df100d
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-f3a4-b436d152d66c
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-db00-adc232300478
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-d689-67ce25e1547c
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-f2e8-148563f4449c
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-b6be-9dc0f523cc82
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-1752-d0b408f5d406
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-51b9-c1a679526e96
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-084c-8fd392fa0fd4
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-dae1-46b972d0a9d0
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-3b40-53408bf37bc1
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-5078-3de9e19e703f
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-3279-0ee54f78ea47
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-ab68-a7a4ad74890c
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-87c2-d9747ca3a4f0
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-5316-6fa9f6e8862b
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-5815-0fea963dc096
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-8ead-2773b30c8939
00020000-5627-abe8-5316-170b94e3318d	00030000-5627-abe8-abe3-9979e6339532
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe7-86c8-a64dd487c415
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe7-d616-f557dd20fb1d
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe7-77a1-8b9ce5cec0b4
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe7-1e69-e90e041a453d
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe7-102f-726d440c03bb
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe7-b09c-b197575bdb31
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe7-ab68-f90764e9b7a8
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe7-0c1e-ed6ed27e1634
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe7-0bc1-a66426463b1e
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe7-9ead-8fdce7d8e94e
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe7-2c7e-c6a813efdbb1
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe7-82cc-0572f0065930
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe8-537b-ad109603a536
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe8-4235-a4732b1d873a
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe8-62a5-c1c276db9c71
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe8-f7dd-9103b51128f3
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe8-7c98-8aaf318d40e0
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe8-db00-adc232300478
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe8-f2e8-148563f4449c
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe8-1752-d0b408f5d406
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe8-084c-8fd392fa0fd4
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe8-c3d5-457b60d26bf9
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe8-de86-3edf153ebee1
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe8-9b11-65b4701af34e
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe8-a31a-a2e700bac969
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe8-da46-652bb507e67f
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe8-2d73-9500567b8e2a
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe8-8ead-2773b30c8939
00020000-5627-abe8-0ce9-a12671eaf1b8	00030000-5627-abe8-abe3-9979e6339532
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe7-86c8-a64dd487c415
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe7-16a3-745c5b521a7f
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe7-d616-f557dd20fb1d
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe7-078a-22ca2a3de85d
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe7-6704-9c1c331c8c6f
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe7-9ae2-e203d8a82f62
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe7-77a1-8b9ce5cec0b4
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe7-1e69-e90e041a453d
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe7-91e6-4d4b2ec9867d
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe7-102f-726d440c03bb
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe7-b09c-b197575bdb31
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe7-ab68-f90764e9b7a8
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe7-0bc1-a66426463b1e
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe7-9ead-8fdce7d8e94e
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe7-2c7e-c6a813efdbb1
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe8-537b-ad109603a536
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe8-4235-a4732b1d873a
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe8-7c98-8aaf318d40e0
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe8-5468-a96be3df100d
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe8-db00-adc232300478
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe8-f2e8-148563f4449c
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe8-1752-d0b408f5d406
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe8-084c-8fd392fa0fd4
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe8-3b40-53408bf37bc1
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe8-ab68-a7a4ad74890c
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe8-5316-6fa9f6e8862b
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe8-8ead-2773b30c8939
00020000-5627-abe8-9dc8-abe9bbcb8e70	00030000-5627-abe8-abe3-9979e6339532
00020000-5627-abe8-b32e-18d235d80135	00030000-5627-abe7-86c8-a64dd487c415
00020000-5627-abe8-b32e-18d235d80135	00030000-5627-abe7-143c-cc2f4d0d418a
00020000-5627-abe8-b32e-18d235d80135	00030000-5627-abe7-8d68-c0cd9fcbc2e7
00020000-5627-abe8-b32e-18d235d80135	00030000-5627-abe7-d616-f557dd20fb1d
00020000-5627-abe8-b32e-18d235d80135	00030000-5627-abe7-77a1-8b9ce5cec0b4
00020000-5627-abe8-b32e-18d235d80135	00030000-5627-abe7-1e69-e90e041a453d
00020000-5627-abe8-b32e-18d235d80135	00030000-5627-abe7-102f-726d440c03bb
00020000-5627-abe8-b32e-18d235d80135	00030000-5627-abe7-b09c-b197575bdb31
00020000-5627-abe8-b32e-18d235d80135	00030000-5627-abe7-0bc1-a66426463b1e
00020000-5627-abe8-b32e-18d235d80135	00030000-5627-abe7-9ead-8fdce7d8e94e
00020000-5627-abe8-b32e-18d235d80135	00030000-5627-abe8-537b-ad109603a536
00020000-5627-abe8-b32e-18d235d80135	00030000-5627-abe8-4235-a4732b1d873a
00020000-5627-abe8-b32e-18d235d80135	00030000-5627-abe8-7c98-8aaf318d40e0
00020000-5627-abe8-b32e-18d235d80135	00030000-5627-abe8-db00-adc232300478
00020000-5627-abe8-b32e-18d235d80135	00030000-5627-abe8-f2e8-148563f4449c
00020000-5627-abe8-b32e-18d235d80135	00030000-5627-abe8-1752-d0b408f5d406
00020000-5627-abe8-b32e-18d235d80135	00030000-5627-abe8-084c-8fd392fa0fd4
00020000-5627-abe8-b32e-18d235d80135	00030000-5627-abe8-3b40-53408bf37bc1
00020000-5627-abe8-b32e-18d235d80135	00030000-5627-abe8-8ead-2773b30c8939
00020000-5627-abe8-b32e-18d235d80135	00030000-5627-abe8-abe3-9979e6339532
00020000-5627-abe8-8c3d-ff7780e3ad84	00030000-5627-abe7-86c8-a64dd487c415
00020000-5627-abe8-8c3d-ff7780e3ad84	00030000-5627-abe7-d616-f557dd20fb1d
00020000-5627-abe8-8c3d-ff7780e3ad84	00030000-5627-abe7-77a1-8b9ce5cec0b4
00020000-5627-abe8-8c3d-ff7780e3ad84	00030000-5627-abe7-1e69-e90e041a453d
00020000-5627-abe8-8c3d-ff7780e3ad84	00030000-5627-abe7-102f-726d440c03bb
00020000-5627-abe8-8c3d-ff7780e3ad84	00030000-5627-abe7-b09c-b197575bdb31
00020000-5627-abe8-8c3d-ff7780e3ad84	00030000-5627-abe7-0bc1-a66426463b1e
00020000-5627-abe8-8c3d-ff7780e3ad84	00030000-5627-abe7-9ead-8fdce7d8e94e
00020000-5627-abe8-8c3d-ff7780e3ad84	00030000-5627-abe8-537b-ad109603a536
00020000-5627-abe8-8c3d-ff7780e3ad84	00030000-5627-abe8-4235-a4732b1d873a
00020000-5627-abe8-8c3d-ff7780e3ad84	00030000-5627-abe8-7c98-8aaf318d40e0
00020000-5627-abe8-8c3d-ff7780e3ad84	00030000-5627-abe8-db00-adc232300478
00020000-5627-abe8-8c3d-ff7780e3ad84	00030000-5627-abe8-f2e8-148563f4449c
00020000-5627-abe8-8c3d-ff7780e3ad84	00030000-5627-abe8-1752-d0b408f5d406
00020000-5627-abe8-8c3d-ff7780e3ad84	00030000-5627-abe8-084c-8fd392fa0fd4
00020000-5627-abe8-8c3d-ff7780e3ad84	00030000-5627-abe8-e89e-d826a66b4dac
00020000-5627-abe8-8c3d-ff7780e3ad84	00030000-5627-abe7-8771-e96ebc5903c7
00020000-5627-abe8-8c3d-ff7780e3ad84	00030000-5627-abe8-3b40-53408bf37bc1
00020000-5627-abe8-8c3d-ff7780e3ad84	00030000-5627-abe8-8ead-2773b30c8939
00020000-5627-abe8-8c3d-ff7780e3ad84	00030000-5627-abe8-abe3-9979e6339532
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-6e92-6d32ce5fa5b3
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-051c-a7087fa5c08e
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-86c8-a64dd487c415
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-143c-cc2f4d0d418a
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-16a3-745c5b521a7f
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-8d68-c0cd9fcbc2e7
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-d616-f557dd20fb1d
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-078a-22ca2a3de85d
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-fc85-78608fbc450e
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-d21c-3ab474a325bc
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-6704-9c1c331c8c6f
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-45da-17784493b98f
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-9ae2-e203d8a82f62
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-658f-8f1d824390d2
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-77a1-8b9ce5cec0b4
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-4b69-5b461c40b64e
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-6dc9-62ca53ee7c22
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-24cc-93619daf9232
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-31fe-6e13ba57e9a5
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-1e69-e90e041a453d
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-3281-c26115703fd9
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-ec08-f8b282052c4d
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-5965-d1272d5111c0
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-91e6-4d4b2ec9867d
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-12a2-34db74df8d99
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-102f-726d440c03bb
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-df05-03a36662180a
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-b09c-b197575bdb31
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-6dcb-63b4ff11f65b
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-ab68-f90764e9b7a8
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-0c1e-ed6ed27e1634
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-3361-f8502b5d737f
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-31e0-6f02df93206c
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-1b24-8b10337108ee
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-ca6d-08fc4ccbe297
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-0bc1-a66426463b1e
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-9ead-8fdce7d8e94e
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-fbe3-667f5cd3321f
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-eb99-90eed97fbf18
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-7bc0-9af31a5edf54
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-c0e9-c95ddec6bea3
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-2c7e-c6a813efdbb1
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-8a07-ccae110ae131
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-82cc-0572f0065930
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-4ba7-18bd1adc67d2
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-3858-6fa67d13cf09
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-dbfe-6dd2978c55dc
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-6cae-66c0ac033998
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-a8e7-47017abf6c0e
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-e80f-761d08d67f48
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-537b-ad109603a536
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-2243-0efd73441228
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-4235-a4732b1d873a
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-6338-1694f01ffd51
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-20ef-e0ab7a2fb698
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-0200-8f5652d08e90
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-42d7-5e9d765b88d8
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-4bc9-3065e16029c1
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-62a5-c1c276db9c71
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-f7dd-9103b51128f3
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-ccb7-fee38a498a98
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-e11b-bb79696786dc
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-7c98-8aaf318d40e0
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-e483-027b9a4b1308
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-4e08-f4a33530c11a
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-09d5-5ee7a9667252
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-c2f8-e2ae73161f0a
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-e53c-4a156179fd3e
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-5468-a96be3df100d
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-f3a4-b436d152d66c
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-5c44-84b45daf7f9a
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-c463-d1c87267285e
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-7601-86dd8169bec4
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-70e1-d3c3f2a83cd6
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-ab77-72cf7237d085
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-36b3-f6fea8372cf0
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-a86d-bd1cfa33d95d
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-5208-49c5d89aef16
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-efdf-6f0de7c5964b
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-39f4-0ae8b12215eb
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-01e9-c71c7d911329
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-b241-d83cbcd1a22e
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-e2d3-bae28eb9858c
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-e2c8-806387a9b3ea
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-9dfb-35bccd6192fb
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-398c-5cbdc2ad3986
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-e5e2-abc8ec06a183
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-dcd5-29507eb08e85
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-f0aa-5ffd0d36b08b
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-a12b-b9914af144b0
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-2b99-0fc580d5e42c
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-f858-f24158b7e04e
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-db00-adc232300478
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-d689-67ce25e1547c
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-fec6-50e89af73f2e
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-e642-7b86ef327a40
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-de36-cf40ae19fd12
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-3632-653d5015305a
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-f2e8-148563f4449c
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-b6be-9dc0f523cc82
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-1752-d0b408f5d406
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-51b9-c1a679526e96
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-9c43-af83a92e2174
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-c6d4-91a66829490f
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-3173-2316dc1c50ae
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-6e26-b6def7b147d9
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-7c55-17d0ca5ca28e
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-9962-a40221d24ede
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-04fe-ddb7d01fb77f
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-c12f-56408d8c2819
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-084c-8fd392fa0fd4
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-dae1-46b972d0a9d0
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-e01c-5e7a43af39f1
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-3a3e-e911f706fabf
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-b01a-4b39bad14f96
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-152a-c70049b50cdf
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-17b7-349eaa6d5d92
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-3c43-4688eecf911a
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-300b-880bcb069393
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-0b4f-c9ba3d677854
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-c3d5-457b60d26bf9
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-de86-3edf153ebee1
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-e89e-d826a66b4dac
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe7-8771-e96ebc5903c7
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-c8ef-ecc7ce42da86
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-3b40-53408bf37bc1
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-6f8f-01c6fd0a7bfd
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-2da7-784f7749d858
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-f29e-90eebd9f39ba
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-fecf-53b9f0565c46
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-c584-31ad8cbdd4f1
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-eee7-cba610a7c25b
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-3f72-1e8c1b469c89
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-9b11-65b4701af34e
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-a31a-a2e700bac969
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-5078-3de9e19e703f
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-3279-0ee54f78ea47
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-ab68-a7a4ad74890c
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-87c2-d9747ca3a4f0
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-a4da-4c1a0e10272f
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-1107-b78f7a8a3646
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-7d7a-277f953eaee0
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-bda8-e76bf57eef95
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-da46-652bb507e67f
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-2d73-9500567b8e2a
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-5316-6fa9f6e8862b
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-5815-0fea963dc096
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-8ead-2773b30c8939
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-73ea-e71822aa2e55
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-abe3-9979e6339532
00020000-5627-abe9-f9bf-7de06ffd5550	00030000-5627-abe8-f703-c315c0d40600
\.


--
-- TOC entry 3095 (class 0 OID 23107671)
-- Dependencies: 214
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 23107705)
-- Dependencies: 218
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 23107842)
-- Dependencies: 230
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5627-abe9-12bb-c1c20c286f91	00090000-5627-abe9-f005-94a0b4d930a6	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5627-abe9-5ac4-31fd5627b673	00090000-5627-abe9-7b3d-6ec2a22d3d33	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5627-abe9-6f45-c1e2871656c6	00090000-5627-abe9-d144-aee37a7e8572	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5627-abe9-479d-c01c6cf4de75	00090000-5627-abe9-f4b4-02e4a31eb6f4	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3067 (class 0 OID 23107369)
-- Dependencies: 186
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5627-abe9-530f-28cd2615a3c9	\N	00040000-5627-abe7-6f7b-3b5b7ce3ba27	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5627-abe9-de38-4f7e81495262	\N	00040000-5627-abe7-6f7b-3b5b7ce3ba27	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5627-abe9-6586-6f3564e60915	\N	00040000-5627-abe7-6f7b-3b5b7ce3ba27	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5627-abe9-bc03-02a2d5cb5a1f	\N	00040000-5627-abe7-6f7b-3b5b7ce3ba27	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5627-abe9-a3c6-fb7fc8699c41	\N	00040000-5627-abe7-6f7b-3b5b7ce3ba27	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5627-abe9-ab84-08b6a2428d50	\N	00040000-5627-abe7-cedc-f0b87625990d	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5627-abe9-2afc-51c5b7285fa9	\N	00040000-5627-abe7-4993-9390aa396213	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5627-abe9-99fb-d132491715d9	\N	00040000-5627-abe7-de72-d6e9cc5488ab	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5627-abe9-209c-e78c1b763e55	\N	00040000-5627-abe7-3b3d-8590d4af287a	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5627-abeb-1a8a-d4619369367f	\N	00040000-5627-abe7-6f7b-3b5b7ce3ba27	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3070 (class 0 OID 23107414)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5627-abe7-5324-65bcfa021a52	8341	Adlešiči
00050000-5627-abe7-1b6b-ac7e1f946596	5270	Ajdovščina
00050000-5627-abe7-06e9-507d206d3b8b	6280	Ankaran/Ancarano
00050000-5627-abe7-9790-f4fb4c3823c7	9253	Apače
00050000-5627-abe7-746b-8bb8e83c1822	8253	Artiče
00050000-5627-abe7-4d2e-e2645b8cd514	4275	Begunje na Gorenjskem
00050000-5627-abe7-c640-9b04cabe2ddf	1382	Begunje pri Cerknici
00050000-5627-abe7-9a69-448333e11b15	9231	Beltinci
00050000-5627-abe7-9539-37c2fedc94b3	2234	Benedikt
00050000-5627-abe7-d253-fa6fb9cbfb39	2345	Bistrica ob Dravi
00050000-5627-abe7-6717-dd42b8111f81	3256	Bistrica ob Sotli
00050000-5627-abe7-8e58-6ff51da530bf	8259	Bizeljsko
00050000-5627-abe7-9e34-707b8df491a7	1223	Blagovica
00050000-5627-abe7-3af5-2526862f3602	8283	Blanca
00050000-5627-abe7-f2ee-ff2226475ce0	4260	Bled
00050000-5627-abe7-66e0-b193a8232d4d	4273	Blejska Dobrava
00050000-5627-abe7-7a1d-0ea52511a361	9265	Bodonci
00050000-5627-abe7-81f9-0e097a1137af	9222	Bogojina
00050000-5627-abe7-9c99-a95f45026590	4263	Bohinjska Bela
00050000-5627-abe7-cec8-aca4093f01cc	4264	Bohinjska Bistrica
00050000-5627-abe7-0239-6536d084b4a1	4265	Bohinjsko jezero
00050000-5627-abe7-6263-107f89b43e59	1353	Borovnica
00050000-5627-abe7-9d9a-9156f87090bc	8294	Boštanj
00050000-5627-abe7-30ab-8bfa0937794e	5230	Bovec
00050000-5627-abe7-3d61-6295f18b9972	5295	Branik
00050000-5627-abe7-7854-2344171dbd96	3314	Braslovče
00050000-5627-abe7-3911-cdfcce4d2e4d	5223	Breginj
00050000-5627-abe7-eddd-7cf0fda74e67	8280	Brestanica
00050000-5627-abe7-703f-2d5e1251e67e	2354	Bresternica
00050000-5627-abe7-24ea-aac9285bd303	4243	Brezje
00050000-5627-abe7-057d-e247fa63c2e4	1351	Brezovica pri Ljubljani
00050000-5627-abe7-1307-738752ba00fa	8250	Brežice
00050000-5627-abe7-30a2-6e15d18518d9	4210	Brnik - Aerodrom
00050000-5627-abe7-f02c-c5f2f7947394	8321	Brusnice
00050000-5627-abe7-765f-25de9a45ee82	3255	Buče
00050000-5627-abe7-1525-85f2c64eefa9	8276	Bučka 
00050000-5627-abe7-83dc-4bcc77cd97e8	9261	Cankova
00050000-5627-abe7-4cff-c78bea8edcf6	3000	Celje 
00050000-5627-abe7-d6c1-55a49d3012bc	3001	Celje - poštni predali
00050000-5627-abe7-2735-b7da27f97467	4207	Cerklje na Gorenjskem
00050000-5627-abe7-c0a4-2a25ca463bce	8263	Cerklje ob Krki
00050000-5627-abe7-63c3-e15d01de3033	1380	Cerknica
00050000-5627-abe7-9aa3-939e97342fa1	5282	Cerkno
00050000-5627-abe7-b671-199d60234988	2236	Cerkvenjak
00050000-5627-abe7-5b97-c4890728ce93	2215	Ceršak
00050000-5627-abe7-0bbe-84c4ccd23b39	2326	Cirkovce
00050000-5627-abe7-068a-44e8cba1767d	2282	Cirkulane
00050000-5627-abe7-5118-eaa80b2882d5	5273	Col
00050000-5627-abe7-0ee3-d3a00893629f	8251	Čatež ob Savi
00050000-5627-abe7-1e93-4845b229568f	1413	Čemšenik
00050000-5627-abe7-b13b-598e9b9fe7ab	5253	Čepovan
00050000-5627-abe7-217f-9aaf13610239	9232	Črenšovci
00050000-5627-abe7-d9f0-aac61ddaf1de	2393	Črna na Koroškem
00050000-5627-abe7-5990-ce0e0c1f06a5	6275	Črni Kal
00050000-5627-abe7-4372-41f2f89118ae	5274	Črni Vrh nad Idrijo
00050000-5627-abe7-d856-266a42cefe69	5262	Črniče
00050000-5627-abe7-7544-c43be572596b	8340	Črnomelj
00050000-5627-abe7-d357-42966984e86f	6271	Dekani
00050000-5627-abe7-7add-3d0eb8e4d6b2	5210	Deskle
00050000-5627-abe7-4351-781b3869b37f	2253	Destrnik
00050000-5627-abe7-b4c5-15c5a6a18d19	6215	Divača
00050000-5627-abe7-b0c2-08b319cbfeed	1233	Dob
00050000-5627-abe7-906d-9692fae7d8a2	3224	Dobje pri Planini
00050000-5627-abe7-d09a-acfa7e43b524	8257	Dobova
00050000-5627-abe7-2120-ed09e3e38796	1423	Dobovec
00050000-5627-abe7-bd3d-bbf580b0a6b6	5263	Dobravlje
00050000-5627-abe7-af0c-21ac04a28f8e	3204	Dobrna
00050000-5627-abe7-11d1-ac8bc600d0a6	8211	Dobrnič
00050000-5627-abe7-9bc0-6a0568fe1647	1356	Dobrova
00050000-5627-abe7-4708-c08ff0e6be14	9223	Dobrovnik/Dobronak 
00050000-5627-abe7-023a-353b72ab5327	5212	Dobrovo v Brdih
00050000-5627-abe7-9f2f-2d126b7ce70d	1431	Dol pri Hrastniku
00050000-5627-abe7-333a-8bce5f0d4575	1262	Dol pri Ljubljani
00050000-5627-abe7-7d05-5d0628310dd3	1273	Dole pri Litiji
00050000-5627-abe7-918d-3a413001afae	1331	Dolenja vas
00050000-5627-abe7-630b-36cfe8c7c91c	8350	Dolenjske Toplice
00050000-5627-abe7-39ea-4b1aa94ec498	1230	Domžale
00050000-5627-abe7-f84d-cba239b3c061	2252	Dornava
00050000-5627-abe7-ac26-22cab478498b	5294	Dornberk
00050000-5627-abe7-c6a2-4c3ce6047375	1319	Draga
00050000-5627-abe7-4cd5-4b989810ba7d	8343	Dragatuš
00050000-5627-abe7-2297-1e72b49a60d3	3222	Dramlje
00050000-5627-abe7-7b69-091b4537d676	2370	Dravograd
00050000-5627-abe7-225f-e844d7dfcaae	4203	Duplje
00050000-5627-abe7-b5f7-bc9f9930dc63	6221	Dutovlje
00050000-5627-abe7-2597-40e193aab4b3	8361	Dvor
00050000-5627-abe7-055c-6cc1daedf83c	2343	Fala
00050000-5627-abe7-4124-afc0770ce9cd	9208	Fokovci
00050000-5627-abe7-9440-44f432e91059	2313	Fram
00050000-5627-abe7-1841-eb786c4fe22b	3213	Frankolovo
00050000-5627-abe7-0385-9f0ba6ada4c0	1274	Gabrovka
00050000-5627-abe7-5073-8c82bc0670bb	8254	Globoko
00050000-5627-abe7-5180-313baf2b4421	5275	Godovič
00050000-5627-abe7-f67f-e3df4e8f30db	4204	Golnik
00050000-5627-abe7-2ce8-c4290d499799	3303	Gomilsko
00050000-5627-abe7-1d05-341444d6dd78	4224	Gorenja vas
00050000-5627-abe7-312d-8a8921b8caad	3263	Gorica pri Slivnici
00050000-5627-abe7-7254-a35c3598db17	2272	Gorišnica
00050000-5627-abe7-8c75-717b1775b71a	9250	Gornja Radgona
00050000-5627-abe7-c94b-559a5f67e61a	3342	Gornji Grad
00050000-5627-abe7-5824-8b3cf6cc8749	4282	Gozd Martuljek
00050000-5627-abe7-4fdf-8747466ba7e9	6272	Gračišče
00050000-5627-abe7-b46a-be7668bdf92c	9264	Grad
00050000-5627-abe7-776f-4bc6370f3f76	8332	Gradac
00050000-5627-abe7-bfa4-210da94b86e0	1384	Grahovo
00050000-5627-abe7-6319-514efc029ac0	5242	Grahovo ob Bači
00050000-5627-abe7-4e3c-536a79b677f8	5251	Grgar
00050000-5627-abe7-a213-c3de26890adf	3302	Griže
00050000-5627-abe7-8726-dbf597cd51fe	3231	Grobelno
00050000-5627-abe7-5b38-c99bce354ce7	1290	Grosuplje
00050000-5627-abe7-80c3-edea5154be51	2288	Hajdina
00050000-5627-abe7-d675-5b4e2bd7957c	8362	Hinje
00050000-5627-abe7-f348-c9b80c893607	2311	Hoče
00050000-5627-abe7-9bfe-d79aeec06a4e	9205	Hodoš/Hodos
00050000-5627-abe7-3119-f514c40570a8	1354	Horjul
00050000-5627-abe7-476a-aaadbd64e2a6	1372	Hotedršica
00050000-5627-abe7-1884-be669ce866ca	1430	Hrastnik
00050000-5627-abe7-9dd5-baae55c51623	6225	Hruševje
00050000-5627-abe7-c6af-bf488ec5ae24	4276	Hrušica
00050000-5627-abe7-57be-f36239c3e8d1	5280	Idrija
00050000-5627-abe7-2e91-c315db314cc2	1292	Ig
00050000-5627-abe7-ec67-1281411f465c	6250	Ilirska Bistrica
00050000-5627-abe7-0495-f36e4af6a6db	6251	Ilirska Bistrica-Trnovo
00050000-5627-abe7-a86a-ef9863194284	1295	Ivančna Gorica
00050000-5627-abe7-3779-87ab7f27e0ee	2259	Ivanjkovci
00050000-5627-abe7-1807-69291310e74c	1411	Izlake
00050000-5627-abe7-d963-70233c51f322	6310	Izola/Isola
00050000-5627-abe7-d973-2948c5aa59cc	2222	Jakobski Dol
00050000-5627-abe7-13b7-38d4c09dae07	2221	Jarenina
00050000-5627-abe7-c59d-f5958414cc3b	6254	Jelšane
00050000-5627-abe7-44c0-be23b8ded0ac	4270	Jesenice
00050000-5627-abe7-6c09-a2a6fcfa359e	8261	Jesenice na Dolenjskem
00050000-5627-abe7-9a56-6825fd26a1cd	3273	Jurklošter
00050000-5627-abe7-2aed-da39573a7f2b	2223	Jurovski Dol
00050000-5627-abe7-76c2-7c4a7890c331	2256	Juršinci
00050000-5627-abe7-56c7-66da06722cd0	5214	Kal nad Kanalom
00050000-5627-abe7-e222-906eba84bbcf	3233	Kalobje
00050000-5627-abe7-ee12-2714c976023c	4246	Kamna Gorica
00050000-5627-abe7-7ecb-68fc02d22f29	2351	Kamnica
00050000-5627-abe7-72e9-857a65751e4a	1241	Kamnik
00050000-5627-abe7-da0c-ff647f5ac764	5213	Kanal
00050000-5627-abe7-b4a3-794b0089693c	8258	Kapele
00050000-5627-abe7-129f-8c576c7516e9	2362	Kapla
00050000-5627-abe7-a9b0-45e3d31ba406	2325	Kidričevo
00050000-5627-abe7-d39d-12e2f0d506a0	1412	Kisovec
00050000-5627-abe7-5060-4fdada2b96a7	6253	Knežak
00050000-5627-abe7-9704-b5fbb03898f7	5222	Kobarid
00050000-5627-abe7-503c-184546f3aff6	9227	Kobilje
00050000-5627-abe7-6f87-2458c35bb0f2	1330	Kočevje
00050000-5627-abe7-21d7-96e7edf1d968	1338	Kočevska Reka
00050000-5627-abe7-d1f5-b1538b710623	2276	Kog
00050000-5627-abe7-f224-9b2e9a49b708	5211	Kojsko
00050000-5627-abe7-4332-8674e99d21b7	6223	Komen
00050000-5627-abe7-1545-1ebc3b96a848	1218	Komenda
00050000-5627-abe7-b862-e7e3af5749e9	6000	Koper/Capodistria 
00050000-5627-abe7-369b-c8981c49c983	6001	Koper/Capodistria - poštni predali
00050000-5627-abe7-a0c6-17553de60137	8282	Koprivnica
00050000-5627-abe7-74bd-1dfc2e33f6f2	5296	Kostanjevica na Krasu
00050000-5627-abe7-e57c-c738080e4c74	8311	Kostanjevica na Krki
00050000-5627-abe7-8102-812a49a96da2	1336	Kostel
00050000-5627-abe7-8116-eac1cc6ea8b1	6256	Košana
00050000-5627-abe7-43d6-7dddd7be7277	2394	Kotlje
00050000-5627-abe7-36b6-5450af9ba88c	6240	Kozina
00050000-5627-abe7-47d6-ef0fa569fc81	3260	Kozje
00050000-5627-abe7-4726-4255e0497db0	4000	Kranj 
00050000-5627-abe7-3fbd-b3a77e5d62c4	4001	Kranj - poštni predali
00050000-5627-abe7-e2f4-253b2885780c	4280	Kranjska Gora
00050000-5627-abe7-637c-f36e84703078	1281	Kresnice
00050000-5627-abe7-b1a6-e6b62dba4d60	4294	Križe
00050000-5627-abe7-304e-646433db1b87	9206	Križevci
00050000-5627-abe7-11e9-941b9dfae561	9242	Križevci pri Ljutomeru
00050000-5627-abe7-f044-a4ea358c28c4	1301	Krka
00050000-5627-abe7-c2b3-0fff55dcaad6	8296	Krmelj
00050000-5627-abe7-4d32-a99f746eeee4	4245	Kropa
00050000-5627-abe7-5ad2-6ca897f0a216	8262	Krška vas
00050000-5627-abe7-2df7-4ce00521d01d	8270	Krško
00050000-5627-abe7-c3e1-930d611ac56d	9263	Kuzma
00050000-5627-abe7-febe-63d9c4e25027	2318	Laporje
00050000-5627-abe7-93a1-55effa6f677a	3270	Laško
00050000-5627-abe7-0c7c-bed441c2bce4	1219	Laze v Tuhinju
00050000-5627-abe7-ac1d-9a1c8c65c67c	2230	Lenart v Slovenskih goricah
00050000-5627-abe7-b47d-173f2241cb84	9220	Lendava/Lendva
00050000-5627-abe7-21e1-ad59ddead6f1	4248	Lesce
00050000-5627-abe7-53c2-0ccea4380de1	3261	Lesično
00050000-5627-abe7-86fb-77986673f9ca	8273	Leskovec pri Krškem
00050000-5627-abe7-4367-fe0e79e7eab8	2372	Libeliče
00050000-5627-abe7-4230-c096a7bdf2d7	2341	Limbuš
00050000-5627-abe7-58ff-7a9bea40e744	1270	Litija
00050000-5627-abe7-fc89-c0158e16353b	3202	Ljubečna
00050000-5627-abe7-9a7a-280b77f60eea	1000	Ljubljana 
00050000-5627-abe7-f029-07726a51e79b	1001	Ljubljana - poštni predali
00050000-5627-abe7-0eaf-c6f2375815c0	1231	Ljubljana - Črnuče
00050000-5627-abe7-abec-b1702603d82f	1261	Ljubljana - Dobrunje
00050000-5627-abe7-ef03-52377f184a6f	1260	Ljubljana - Polje
00050000-5627-abe7-4371-da36d801a422	1210	Ljubljana - Šentvid
00050000-5627-abe7-189c-37fa08224d12	1211	Ljubljana - Šmartno
00050000-5627-abe7-ea30-0ebab2e27a98	3333	Ljubno ob Savinji
00050000-5627-abe7-7531-42fbca34e0c8	9240	Ljutomer
00050000-5627-abe7-7b6a-3b2ef262da36	3215	Loče
00050000-5627-abe7-a23f-b5127b6f3468	5231	Log pod Mangartom
00050000-5627-abe7-3513-41d30cdcb4f3	1358	Log pri Brezovici
00050000-5627-abe7-1816-33094b2f9b78	1370	Logatec
00050000-5627-abe7-eb99-8b13d070aece	1371	Logatec
00050000-5627-abe7-9d58-84977f8a1308	1434	Loka pri Zidanem Mostu
00050000-5627-abe7-6b35-863ed49c34ff	3223	Loka pri Žusmu
00050000-5627-abe7-e32b-483db97aa3d9	6219	Lokev
00050000-5627-abe7-940d-5034ee210cd8	1318	Loški Potok
00050000-5627-abe7-529b-7579a7d7df5e	2324	Lovrenc na Dravskem polju
00050000-5627-abe7-32a2-b00cd1fdf296	2344	Lovrenc na Pohorju
00050000-5627-abe7-ab46-5f9977ea2f11	3334	Luče
00050000-5627-abe7-02a5-d30fd5465c18	1225	Lukovica
00050000-5627-abe7-968e-37155ea706d6	9202	Mačkovci
00050000-5627-abe7-ba98-d2b20b1dce8d	2322	Majšperk
00050000-5627-abe7-892c-1447ca9a1c5c	2321	Makole
00050000-5627-abe7-da3b-c3d924f94760	9243	Mala Nedelja
00050000-5627-abe7-8c5e-26becce40469	2229	Malečnik
00050000-5627-abe7-96c0-7d22edc25ad4	6273	Marezige
00050000-5627-abe7-07d1-ca5b78d7c842	2000	Maribor 
00050000-5627-abe7-dcbf-98c9355e1e44	2001	Maribor - poštni predali
00050000-5627-abe7-9f68-7e06dd96902b	2206	Marjeta na Dravskem polju
00050000-5627-abe7-305c-ad1bbd350619	2281	Markovci
00050000-5627-abe7-4c6e-de58e54ab02a	9221	Martjanci
00050000-5627-abe7-bdc6-8fcd26a8eefb	6242	Materija
00050000-5627-abe7-0a12-e7981ee711ce	4211	Mavčiče
00050000-5627-abe7-07a0-9d0e8de23d4a	1215	Medvode
00050000-5627-abe7-665f-00114a88c250	1234	Mengeš
00050000-5627-abe7-0bec-cd5a528a5e78	8330	Metlika
00050000-5627-abe7-81ba-4ad494380afe	2392	Mežica
00050000-5627-abe7-b1d3-7844f950b2e8	2204	Miklavž na Dravskem polju
00050000-5627-abe7-9c28-d4d79a1a208d	2275	Miklavž pri Ormožu
00050000-5627-abe7-9a95-cbddfddad1e8	5291	Miren
00050000-5627-abe7-495f-2ea1a57d8e2b	8233	Mirna
00050000-5627-abe7-87e3-c90541859d1b	8216	Mirna Peč
00050000-5627-abe7-044c-0ae131d6795e	2382	Mislinja
00050000-5627-abe7-0075-d709b8bf5d3e	4281	Mojstrana
00050000-5627-abe7-527d-9ef18f5821fe	8230	Mokronog
00050000-5627-abe7-c3bc-665b6e14af03	1251	Moravče
00050000-5627-abe7-a958-91571b1b2f5c	9226	Moravske Toplice
00050000-5627-abe7-c3c0-d53628bdb275	5216	Most na Soči
00050000-5627-abe7-1e94-fab439ec3554	1221	Motnik
00050000-5627-abe7-e1ec-263483479d9e	3330	Mozirje
00050000-5627-abe7-8001-36cb6184b7a2	9000	Murska Sobota 
00050000-5627-abe7-4158-32b6666cfb8b	9001	Murska Sobota - poštni predali
00050000-5627-abe7-3c6f-5e67715a78f7	2366	Muta
00050000-5627-abe7-cd29-cc1a2f643ed4	4202	Naklo
00050000-5627-abe7-4a3c-46e24a8d2b6d	3331	Nazarje
00050000-5627-abe7-1ff0-214a701bf5ec	1357	Notranje Gorice
00050000-5627-abe7-8540-c5b3860d50a6	3203	Nova Cerkev
00050000-5627-abe7-c07f-a28a95aecbec	5000	Nova Gorica 
00050000-5627-abe7-1088-59cd4c6763a1	5001	Nova Gorica - poštni predali
00050000-5627-abe7-40f7-a5613e982ac3	1385	Nova vas
00050000-5627-abe7-f611-125acd8387cb	8000	Novo mesto
00050000-5627-abe7-51e4-dadee3b1d350	8001	Novo mesto - poštni predali
00050000-5627-abe7-413c-b1d63e440bd7	6243	Obrov
00050000-5627-abe7-5b96-13e483079721	9233	Odranci
00050000-5627-abe7-cd62-51f53c1601de	2317	Oplotnica
00050000-5627-abe7-236b-93c04bc87cfa	2312	Orehova vas
00050000-5627-abe7-700a-ceab7ca86592	2270	Ormož
00050000-5627-abe7-27c4-86ac8c5c3339	1316	Ortnek
00050000-5627-abe7-21b9-4e2f54ce857c	1337	Osilnica
00050000-5627-abe7-98e4-5f4557ca6da6	8222	Otočec
00050000-5627-abe7-16d1-9f91b4b1b058	2361	Ožbalt
00050000-5627-abe7-3f71-91e971246c88	2231	Pernica
00050000-5627-abe7-c2dc-97d1cea1faeb	2211	Pesnica pri Mariboru
00050000-5627-abe7-3987-5ed77f77d517	9203	Petrovci
00050000-5627-abe7-f07d-a8d0b9f94080	3301	Petrovče
00050000-5627-abe7-6880-e04e16d24bf2	6330	Piran/Pirano
00050000-5627-abe7-e7c7-29fc0487c3c5	8255	Pišece
00050000-5627-abe7-bfcd-a4e5d2f6175c	6257	Pivka
00050000-5627-abe7-91d9-867b554d12f1	6232	Planina
00050000-5627-abe7-1c6a-6dfa86a2825a	3225	Planina pri Sevnici
00050000-5627-abe7-de4c-6e3f903246ae	6276	Pobegi
00050000-5627-abe7-b04f-a011e1006b40	8312	Podbočje
00050000-5627-abe7-d7f5-97a48f76659f	5243	Podbrdo
00050000-5627-abe7-860a-bf3be481db33	3254	Podčetrtek
00050000-5627-abe7-7b07-6a10ab545ddb	2273	Podgorci
00050000-5627-abe7-175b-6453c1494156	6216	Podgorje
00050000-5627-abe7-ff5a-90223f433213	2381	Podgorje pri Slovenj Gradcu
00050000-5627-abe7-a5b3-a3897eecf576	6244	Podgrad
00050000-5627-abe7-5191-66853e69fdfb	1414	Podkum
00050000-5627-abe7-a525-b478acf90ef4	2286	Podlehnik
00050000-5627-abe7-9287-b69cd41aff3c	5272	Podnanos
00050000-5627-abe7-0bcd-8706496756fa	4244	Podnart
00050000-5627-abe7-2ca1-8b3585f513ae	3241	Podplat
00050000-5627-abe7-f1de-27d20bd3308b	3257	Podsreda
00050000-5627-abe7-e197-1f1ea67f12d7	2363	Podvelka
00050000-5627-abe7-5bd5-3d62998d136d	2208	Pohorje
00050000-5627-abe7-7107-3853eea1e406	2257	Polenšak
00050000-5627-abe7-100b-f49bd8886e39	1355	Polhov Gradec
00050000-5627-abe7-5082-9c0cb3ea1b67	4223	Poljane nad Škofjo Loko
00050000-5627-abe7-0947-6f45b7edaa8b	2319	Poljčane
00050000-5627-abe7-2524-d53c4aa47e23	1272	Polšnik
00050000-5627-abe7-5b22-619277b17660	3313	Polzela
00050000-5627-abe7-cfd2-c1993db3b025	3232	Ponikva
00050000-5627-abe7-59f5-e35d508ce02a	6320	Portorož/Portorose
00050000-5627-abe7-6988-1dd6b5b8fb98	6230	Postojna
00050000-5627-abe7-725d-5d2fc8cd5cee	2331	Pragersko
00050000-5627-abe7-3e44-b7fedc2d5129	3312	Prebold
00050000-5627-abe7-5c11-fe23a4089f89	4205	Preddvor
00050000-5627-abe7-5803-48a4e1b9dde0	6255	Prem
00050000-5627-abe7-593f-1531e83b998b	1352	Preserje
00050000-5627-abe7-541c-b7006726dd9b	6258	Prestranek
00050000-5627-abe7-120d-e12df2017781	2391	Prevalje
00050000-5627-abe7-5e38-fdf58438d342	3262	Prevorje
00050000-5627-abe7-6fc8-42cd9cdccb75	1276	Primskovo 
00050000-5627-abe7-90e8-f5767778b8d6	3253	Pristava pri Mestinju
00050000-5627-abe7-aa32-cd999b5d88a8	9207	Prosenjakovci/Partosfalva
00050000-5627-abe7-89f3-49f7c8bd62c6	5297	Prvačina
00050000-5627-abe7-9516-fe0dd8417722	2250	Ptuj
00050000-5627-abe7-f74e-92668f9ed6b8	2323	Ptujska Gora
00050000-5627-abe7-2818-6da4bfc485c1	9201	Puconci
00050000-5627-abe7-b025-ae42431718d0	2327	Rače
00050000-5627-abe7-6259-693f2790cdff	1433	Radeče
00050000-5627-abe7-bc29-31945ce9c4be	9252	Radenci
00050000-5627-abe7-8736-0443d2cc9a0e	2360	Radlje ob Dravi
00050000-5627-abe7-527d-3a4046dddcff	1235	Radomlje
00050000-5627-abe7-7048-36ff02e9d449	4240	Radovljica
00050000-5627-abe7-b157-1d7a270f9cc8	8274	Raka
00050000-5627-abe7-27b3-de57aab2a817	1381	Rakek
00050000-5627-abe7-13f2-a579d462f546	4283	Rateče - Planica
00050000-5627-abe7-8f1b-2cff7d2ce641	2390	Ravne na Koroškem
00050000-5627-abe7-3ebc-3270cec66892	9246	Razkrižje
00050000-5627-abe7-d0ea-17f3543b9b6c	3332	Rečica ob Savinji
00050000-5627-abe7-d407-42f516c4fc21	5292	Renče
00050000-5627-abe7-98f8-91e9943a376b	1310	Ribnica
00050000-5627-abe7-5fe0-92409d474d17	2364	Ribnica na Pohorju
00050000-5627-abe7-6ec8-7435a6a87411	3272	Rimske Toplice
00050000-5627-abe7-5fc1-d13d2614a57e	1314	Rob
00050000-5627-abe7-9dfe-a5b8a12e2ba1	5215	Ročinj
00050000-5627-abe7-4707-8135dcba2bf5	3250	Rogaška Slatina
00050000-5627-abe7-4fc2-db40bb20323d	9262	Rogašovci
00050000-5627-abe7-aa72-1cc0854f75c9	3252	Rogatec
00050000-5627-abe7-9a66-cd91d2cadbcc	1373	Rovte
00050000-5627-abe7-8f5d-ac0876995d59	2342	Ruše
00050000-5627-abe7-b11c-a9cd76824706	1282	Sava
00050000-5627-abe7-c586-153a69bf7c3e	6333	Sečovlje/Sicciole
00050000-5627-abe7-68a6-cc77b3db1c79	4227	Selca
00050000-5627-abe7-9ca1-2963690c6bc3	2352	Selnica ob Dravi
00050000-5627-abe7-2114-fc59be368b7a	8333	Semič
00050000-5627-abe7-2e9c-0d4526ebefe9	8281	Senovo
00050000-5627-abe7-4e92-9530b6601b28	6224	Senožeče
00050000-5627-abe7-2df2-9229d8c0d1ae	8290	Sevnica
00050000-5627-abe7-efc9-414415b70f12	6210	Sežana
00050000-5627-abe7-42cb-f28f4f6b8d83	2214	Sladki Vrh
00050000-5627-abe7-085e-5c5ed988169e	5283	Slap ob Idrijci
00050000-5627-abe7-e3ea-52223019034d	2380	Slovenj Gradec
00050000-5627-abe7-b937-d88bcf7914f0	2310	Slovenska Bistrica
00050000-5627-abe7-1bc9-b1df9a4aa144	3210	Slovenske Konjice
00050000-5627-abe7-c0f6-558fc5b7edfa	1216	Smlednik
00050000-5627-abe7-d4bd-e9248febd8e3	5232	Soča
00050000-5627-abe7-dd53-f7f776717187	1317	Sodražica
00050000-5627-abe7-4f63-3e2cc7a22b34	3335	Solčava
00050000-5627-abe7-8168-fbb6a55f3a28	5250	Solkan
00050000-5627-abe7-8670-09772dbfe798	4229	Sorica
00050000-5627-abe7-27e8-0fc717771523	4225	Sovodenj
00050000-5627-abe7-2a47-0b58073aeaad	5281	Spodnja Idrija
00050000-5627-abe7-a22d-049fac21ee42	2241	Spodnji Duplek
00050000-5627-abe7-81d7-6a4c171fecf8	9245	Spodnji Ivanjci
00050000-5627-abe7-2199-e3977bf27799	2277	Središče ob Dravi
00050000-5627-abe7-7038-fc8b116d1f3a	4267	Srednja vas v Bohinju
00050000-5627-abe7-f947-deef48d9096b	8256	Sromlje 
00050000-5627-abe7-5ca0-8687ee919549	5224	Srpenica
00050000-5627-abe7-e380-21efaca618e4	1242	Stahovica
00050000-5627-abe7-aeaa-1520c214086e	1332	Stara Cerkev
00050000-5627-abe7-ff9c-a667596f42de	8342	Stari trg ob Kolpi
00050000-5627-abe7-4a09-978ac6af4a55	1386	Stari trg pri Ložu
00050000-5627-abe7-4567-255011b552a6	2205	Starše
00050000-5627-abe7-43d8-64d3cd028b52	2289	Stoperce
00050000-5627-abe7-90b6-fdf2255a87b7	8322	Stopiče
00050000-5627-abe7-fc2c-e30128a86e4b	3206	Stranice
00050000-5627-abe7-bdd8-e72a4df306a5	8351	Straža
00050000-5627-abe7-27af-bef28a8f9bf9	1313	Struge
00050000-5627-abe7-0f25-cf46e182e293	8293	Studenec
00050000-5627-abe7-0c57-32c3084e805a	8331	Suhor
00050000-5627-abe7-963e-7b645969e1ba	2233	Sv. Ana v Slovenskih goricah
00050000-5627-abe7-026b-fbb59ee22d6a	2235	Sv. Trojica v Slovenskih goricah
00050000-5627-abe7-39c1-7e6b77ee9743	2353	Sveti Duh na Ostrem Vrhu
00050000-5627-abe7-8a60-7144ce93596b	9244	Sveti Jurij ob Ščavnici
00050000-5627-abe7-82e4-d674696ff8ab	3264	Sveti Štefan
00050000-5627-abe7-7f96-887ae657efee	2258	Sveti Tomaž
00050000-5627-abe7-ead6-fc7b76a0508c	9204	Šalovci
00050000-5627-abe7-f8ea-ca4083fcaca2	5261	Šempas
00050000-5627-abe7-9d36-94537f642bf1	5290	Šempeter pri Gorici
00050000-5627-abe7-63bd-c0c947884e56	3311	Šempeter v Savinjski dolini
00050000-5627-abe7-bc74-fe02536ce407	4208	Šenčur
00050000-5627-abe7-46c0-ced918728607	2212	Šentilj v Slovenskih goricah
00050000-5627-abe7-2552-a424ac34cec6	8297	Šentjanž
00050000-5627-abe7-e9a2-1e223e4b2605	2373	Šentjanž pri Dravogradu
00050000-5627-abe7-5ec1-072628981e11	8310	Šentjernej
00050000-5627-abe7-99ed-37adf4ce3e52	3230	Šentjur
00050000-5627-abe7-4986-6c8cef9b200a	3271	Šentrupert
00050000-5627-abe7-8d5e-f0e36cad84e3	8232	Šentrupert
00050000-5627-abe7-b881-bc501a9e1a34	1296	Šentvid pri Stični
00050000-5627-abe7-1ed4-9c00543514d5	8275	Škocjan
00050000-5627-abe7-2edc-6529f82dc14a	6281	Škofije
00050000-5627-abe7-f5d1-95c3752cd338	4220	Škofja Loka
00050000-5627-abe7-1820-9c6a6220fbff	3211	Škofja vas
00050000-5627-abe7-1612-6539a47711c7	1291	Škofljica
00050000-5627-abe7-c029-4a258311c019	6274	Šmarje
00050000-5627-abe7-f8be-f060b060225a	1293	Šmarje - Sap
00050000-5627-abe7-e83a-66ca0e712bee	3240	Šmarje pri Jelšah
00050000-5627-abe7-11af-ec28e12e7e86	8220	Šmarješke Toplice
00050000-5627-abe7-1d98-01f36f574d2e	2315	Šmartno na Pohorju
00050000-5627-abe7-e0d3-297e0fc7f562	3341	Šmartno ob Dreti
00050000-5627-abe7-ed8e-e21d8b0e5c72	3327	Šmartno ob Paki
00050000-5627-abe7-573f-ed32df16cf04	1275	Šmartno pri Litiji
00050000-5627-abe7-7198-874870850b7f	2383	Šmartno pri Slovenj Gradcu
00050000-5627-abe7-1cf1-88b6c358db61	3201	Šmartno v Rožni dolini
00050000-5627-abe7-3861-fd737d937517	3325	Šoštanj
00050000-5627-abe7-8e5c-f447fc4f1d39	6222	Štanjel
00050000-5627-abe7-95b0-2bdfd77bea0d	3220	Štore
00050000-5627-abe7-8214-49a2ced3df25	3304	Tabor
00050000-5627-abe7-11f2-e751d23733bc	3221	Teharje
00050000-5627-abe7-baea-abf5a49c03ed	9251	Tišina
00050000-5627-abe7-5bc0-adfa7addf5ee	5220	Tolmin
00050000-5627-abe7-8c08-44f656f45494	3326	Topolšica
00050000-5627-abe7-be0b-c8b075b79950	2371	Trbonje
00050000-5627-abe7-e443-00ef23b4d207	1420	Trbovlje
00050000-5627-abe7-3ae2-dc640d2ade24	8231	Trebelno 
00050000-5627-abe7-5d50-570bd74112e7	8210	Trebnje
00050000-5627-abe7-5529-a7984d7db4c3	5252	Trnovo pri Gorici
00050000-5627-abe7-8c53-a8be2eaa08b0	2254	Trnovska vas
00050000-5627-abe7-eba6-78e68b9f0936	1222	Trojane
00050000-5627-abe7-a5f1-17bd692db8e4	1236	Trzin
00050000-5627-abe7-0174-b0f3ba77cecd	4290	Tržič
00050000-5627-abe7-7105-9772f269c19b	8295	Tržišče
00050000-5627-abe7-3caa-2be38c0e01ca	1311	Turjak
00050000-5627-abe7-ccbe-4cb5339a8712	9224	Turnišče
00050000-5627-abe7-5304-2af10f86508b	8323	Uršna sela
00050000-5627-abe7-5e0c-09dda74310e5	1252	Vače
00050000-5627-abe7-f060-7baf2801e829	3320	Velenje 
00050000-5627-abe7-a2d3-d6cee263c1ee	3322	Velenje - poštni predali
00050000-5627-abe7-0302-a7011a5777b1	8212	Velika Loka
00050000-5627-abe7-3e53-81c75d7b9777	2274	Velika Nedelja
00050000-5627-abe7-69eb-bb4799a40724	9225	Velika Polana
00050000-5627-abe7-a24d-b40e38e946ff	1315	Velike Lašče
00050000-5627-abe7-181c-d58fe52cf162	8213	Veliki Gaber
00050000-5627-abe7-9db3-8cfaaafd3866	9241	Veržej
00050000-5627-abe7-2c1c-8e493c2a4175	1312	Videm - Dobrepolje
00050000-5627-abe7-d459-1d1ba7107836	2284	Videm pri Ptuju
00050000-5627-abe7-1dba-7efea53fa891	8344	Vinica
00050000-5627-abe7-ea23-86338bb83c1e	5271	Vipava
00050000-5627-abe7-d4b0-349751911321	4212	Visoko
00050000-5627-abe7-42f6-4170b73719f3	1294	Višnja Gora
00050000-5627-abe7-2fd5-1bb7efccb091	3205	Vitanje
00050000-5627-abe7-17e8-d3f965a8c82b	2255	Vitomarci
00050000-5627-abe7-821d-755f03cce36c	1217	Vodice
00050000-5627-abe7-3b68-cc6960888c8c	3212	Vojnik\t
00050000-5627-abe7-b297-9f0ebb872c1f	5293	Volčja Draga
00050000-5627-abe7-1025-1b3ca9de0de6	2232	Voličina
00050000-5627-abe7-bec0-843e31aee290	3305	Vransko
00050000-5627-abe7-30ad-f01baf8441f5	6217	Vremski Britof
00050000-5627-abe7-ac23-3efcf135ea1d	1360	Vrhnika
00050000-5627-abe7-df9a-285bbb9058a8	2365	Vuhred
00050000-5627-abe7-7a2c-f33dadc0ee30	2367	Vuzenica
00050000-5627-abe7-e13d-3827d1d13b78	8292	Zabukovje 
00050000-5627-abe7-136b-d1ab64ed5dd7	1410	Zagorje ob Savi
00050000-5627-abe7-2fe4-2a06785e4556	1303	Zagradec
00050000-5627-abe7-d8b9-df0ad8be96a2	2283	Zavrč
00050000-5627-abe7-c8a0-2796e6ded0ec	8272	Zdole 
00050000-5627-abe7-c42d-ea5187054ae4	4201	Zgornja Besnica
00050000-5627-abe7-d708-af1c95bc6e85	2242	Zgornja Korena
00050000-5627-abe7-b4d3-f5e1bd500c4b	2201	Zgornja Kungota
00050000-5627-abe7-5732-7d178c70d3f4	2316	Zgornja Ložnica
00050000-5627-abe7-6622-7bc9c138ec20	2314	Zgornja Polskava
00050000-5627-abe7-42bb-373a52fbebc9	2213	Zgornja Velka
00050000-5627-abe7-e8b2-cf2e29b8a08d	4247	Zgornje Gorje
00050000-5627-abe7-8260-f86cafcdb113	4206	Zgornje Jezersko
00050000-5627-abe7-44c8-f87e0d5ae14e	2285	Zgornji Leskovec
00050000-5627-abe7-af36-2fd8b3f84731	1432	Zidani Most
00050000-5627-abe7-8942-425b81b7c75d	3214	Zreče
00050000-5627-abe7-03db-861ab4735ad7	4209	Žabnica
00050000-5627-abe7-572c-c64fc330bc52	3310	Žalec
00050000-5627-abe7-6729-67fe2a3b3d61	4228	Železniki
00050000-5627-abe7-1bae-b0473ae88e81	2287	Žetale
00050000-5627-abe7-713d-b8451ed1ef77	4226	Žiri
00050000-5627-abe7-d408-866af165ed8d	4274	Žirovnica
00050000-5627-abe7-b742-a62e02df2a22	8360	Žužemberk
\.


--
-- TOC entry 3118 (class 0 OID 23108053)
-- Dependencies: 237
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3091 (class 0 OID 23107645)
-- Dependencies: 210
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3069 (class 0 OID 23107399)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5627-abe9-b27f-3b3aa48bc631	00080000-5627-abe9-530f-28cd2615a3c9	\N	00040000-5627-abe7-6f7b-3b5b7ce3ba27	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5627-abe9-20fb-3a7d675bb630	00080000-5627-abe9-530f-28cd2615a3c9	\N	00040000-5627-abe7-6f7b-3b5b7ce3ba27	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5627-abe9-6bbd-4c115a3fdbde	00080000-5627-abe9-de38-4f7e81495262	\N	00040000-5627-abe7-6f7b-3b5b7ce3ba27	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3081 (class 0 OID 23107543)
-- Dependencies: 200
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5627-abe7-f194-7919539de64c	novo leto	1	1	\N	t
00430000-5627-abe7-543c-a0dc5a889d31	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5627-abe7-ca11-468d52540b5b	dan upora proti okupatorju	27	4	\N	t
00430000-5627-abe7-22bd-d379d6ba8ced	praznik dela	1	5	\N	t
00430000-5627-abe7-2c66-339eda883eae	praznik dela	2	5	\N	t
00430000-5627-abe7-5825-2ea27bd7c5ff	dan Primoža Trubarja	8	6	\N	f
00430000-5627-abe7-6c27-56e610e70a4c	dan državnosti	25	6	\N	t
00430000-5627-abe7-c0f9-f7d72df10b2c	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5627-abe7-8153-167c774a18f7	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5627-abe7-88f3-600c1e8c37b2	dan suverenosti	25	10	\N	f
00430000-5627-abe7-c71d-ff5811994a1f	dan spomina na mrtve	1	11	\N	t
00430000-5627-abe7-7502-97373ef0cb8d	dan Rudolfa Maistra	23	11	\N	f
00430000-5627-abe7-4459-4ff49d3fde0c	božič	25	12	\N	t
00430000-5627-abe7-53b9-16085b67562c	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5627-abe7-c129-5327ccf7dc19	Marijino vnebovzetje	15	8	\N	t
00430000-5627-abe7-84e1-5983aa608e0d	dan reformacije	31	10	\N	t
00430000-5627-abe7-cf85-9adde2748297	velikonočna nedelja	27	3	2016	t
00430000-5627-abe7-3437-d10d97e37692	velikonočna nedelja	16	4	2017	t
00430000-5627-abe7-511f-181c86e84887	velikonočna nedelja	1	4	2018	t
00430000-5627-abe7-5d59-3cde50a5945e	velikonočna nedelja	21	4	2019	t
00430000-5627-abe7-adae-a64d9a9c1014	velikonočna nedelja	12	4	2020	t
00430000-5627-abe7-9036-f5c8ab358d3c	velikonočna nedelja	4	4	2021	t
00430000-5627-abe7-edfc-20fe3a55eee7	velikonočna nedelja	17	4	2022	t
00430000-5627-abe7-bf3a-8187d3a19476	velikonočna nedelja	9	4	2023	t
00430000-5627-abe7-821f-269a1a6b2da0	velikonočna nedelja	31	3	2024	t
00430000-5627-abe7-c7b9-b223e6a7dce3	velikonočna nedelja	20	4	2025	t
00430000-5627-abe7-c12f-0c96b1003270	velikonočna nedelja	5	4	2026	t
00430000-5627-abe7-11be-8f23be9f14bb	velikonočna nedelja	28	3	2027	t
00430000-5627-abe7-403d-d2fd1f390c12	velikonočna nedelja	16	4	2028	t
00430000-5627-abe7-248e-4e3c0c770bf7	velikonočna nedelja	1	4	2029	t
00430000-5627-abe7-1230-1adac3539007	velikonočna nedelja	21	4	2030	t
00430000-5627-abe7-bb23-8bfa3fcb026a	velikonočni ponedeljek	28	3	2016	t
00430000-5627-abe7-856b-90324d20eb8a	velikonočni ponedeljek	17	4	2017	t
00430000-5627-abe7-decb-4505051fc162	velikonočni ponedeljek	2	4	2018	t
00430000-5627-abe7-b724-d1fd7a617840	velikonočni ponedeljek	22	4	2019	t
00430000-5627-abe7-8d72-e1976891d6a3	velikonočni ponedeljek	13	4	2020	t
00430000-5627-abe7-9f2b-405851531a16	velikonočni ponedeljek	5	4	2021	t
00430000-5627-abe7-9216-008468b386b1	velikonočni ponedeljek	18	4	2022	t
00430000-5627-abe7-7f29-f03adf9f2c08	velikonočni ponedeljek	10	4	2023	t
00430000-5627-abe7-c33b-00cde03d83ef	velikonočni ponedeljek	1	4	2024	t
00430000-5627-abe7-524a-895740131de4	velikonočni ponedeljek	21	4	2025	t
00430000-5627-abe7-dffd-cf69b89683b7	velikonočni ponedeljek	6	4	2026	t
00430000-5627-abe7-7404-098f53c83e86	velikonočni ponedeljek	29	3	2027	t
00430000-5627-abe7-20c1-5fd071b654fc	velikonočni ponedeljek	17	4	2028	t
00430000-5627-abe7-72d3-a0103376a9a9	velikonočni ponedeljek	2	4	2029	t
00430000-5627-abe7-2525-224102a3551d	velikonočni ponedeljek	22	4	2030	t
00430000-5627-abe7-bdb2-1a063b8789fb	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5627-abe7-e4c8-d7784c5f0fd9	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5627-abe7-9a58-e8bb4a1bccff	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5627-abe7-7f27-6bee36acc4ab	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5627-abe7-7f8b-37f39353ae8a	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5627-abe7-e517-90cf2af2a1be	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5627-abe7-165e-75c53fff351f	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5627-abe7-94e4-ad7bd6913ee8	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5627-abe7-4a2c-974098c26542	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5627-abe7-24a3-2cbbc761fb29	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5627-abe7-ec5b-0e351e89b626	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5627-abe7-767a-65d3fed135fa	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5627-abe7-2c66-649973b1b79c	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5627-abe7-e7c7-8cdd404088c0	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5627-abe7-a6e5-d5f6162d15ac	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3077 (class 0 OID 23107503)
-- Dependencies: 196
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3078 (class 0 OID 23107515)
-- Dependencies: 197
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3093 (class 0 OID 23107657)
-- Dependencies: 212
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 23108067)
-- Dependencies: 238
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 23108077)
-- Dependencies: 239
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5627-abe9-4a21-89c0c564e2b5	00080000-5627-abe9-6586-6f3564e60915	0987	AK
00190000-5627-abe9-8153-fc32e78344e7	00080000-5627-abe9-de38-4f7e81495262	0989	AK
00190000-5627-abe9-a765-25aae59adb9f	00080000-5627-abe9-bc03-02a2d5cb5a1f	0986	AK
00190000-5627-abe9-9a55-ab3514fed9ef	00080000-5627-abe9-ab84-08b6a2428d50	0984	AK
00190000-5627-abe9-7897-645ab05050a6	00080000-5627-abe9-2afc-51c5b7285fa9	0983	AK
00190000-5627-abe9-a83d-32e822469d53	00080000-5627-abe9-99fb-d132491715d9	0982	AK
00190000-5627-abeb-cb67-bfb9a8b6f397	00080000-5627-abeb-1a8a-d4619369367f	1001	AK
\.


--
-- TOC entry 3117 (class 0 OID 23107992)
-- Dependencies: 236
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5627-abea-58ab-474ddab201fa	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3121 (class 0 OID 23108085)
-- Dependencies: 240
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 23107686)
-- Dependencies: 216
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5627-abe9-a122-2b9f02af50da	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5627-abe9-ec75-6dd525940b90	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5627-abe9-d078-5385bd2fc26c	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5627-abe9-16fb-fc00bcc8e83b	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5627-abe9-4548-f2a0c079510e	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5627-abe9-0566-4139cb284bdf	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5627-abe9-2076-65d0dda0afce	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3089 (class 0 OID 23107630)
-- Dependencies: 208
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3088 (class 0 OID 23107620)
-- Dependencies: 207
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 23107831)
-- Dependencies: 229
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 23107761)
-- Dependencies: 223
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3075 (class 0 OID 23107477)
-- Dependencies: 194
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 23107251)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5627-abeb-1a8a-d4619369367f	00010000-5627-abe8-f64b-61fa4e98392f	2015-10-21 17:14:51	INS	a:0:{}
2	App\\Entity\\Option	00000000-5627-abeb-b400-41a1c2bbf924	00010000-5627-abe8-f64b-61fa4e98392f	2015-10-21 17:14:51	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5627-abeb-cb67-bfb9a8b6f397	00010000-5627-abe8-f64b-61fa4e98392f	2015-10-21 17:14:51	INS	a:0:{}
\.


--
-- TOC entry 3140 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3098 (class 0 OID 23107699)
-- Dependencies: 217
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3060 (class 0 OID 23107289)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5627-abe8-e5d7-1b6ca9bcdab2	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5627-abe8-de20-e076abf65fc5	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5627-abe8-cdb5-db32c11b5893	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5627-abe8-24a2-2b7206fd644c	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5627-abe8-5316-170b94e3318d	planer	Planer dogodkov v koledarju	t
00020000-5627-abe8-0ce9-a12671eaf1b8	kadrovska	Kadrovska služba	t
00020000-5627-abe8-9dc8-abe9bbcb8e70	arhivar	Ažuriranje arhivalij	t
00020000-5627-abe8-b32e-18d235d80135	igralec	Igralec	t
00020000-5627-abe8-8c3d-ff7780e3ad84	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5627-abe9-f9bf-7de06ffd5550	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3058 (class 0 OID 23107273)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5627-abe8-0753-8ea939dae2ba	00020000-5627-abe8-cdb5-db32c11b5893
00010000-5627-abe8-f64b-61fa4e98392f	00020000-5627-abe8-cdb5-db32c11b5893
00010000-5627-abe9-95d6-5532a6ae142a	00020000-5627-abe9-f9bf-7de06ffd5550
\.


--
-- TOC entry 3100 (class 0 OID 23107713)
-- Dependencies: 219
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3092 (class 0 OID 23107651)
-- Dependencies: 211
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3086 (class 0 OID 23107597)
-- Dependencies: 205
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5627-abe9-f3c0-c1d832f94d52	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5627-abe9-da1b-a3a7092d745f	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5627-abe9-ac09-b05fb066cbf2	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3054 (class 0 OID 23107238)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5627-abe7-b7f6-fc6a1dc5b5f3	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5627-abe7-4e11-09fc9979ffbb	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5627-abe7-c649-d792cbef4339	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5627-abe7-91ce-a04cf5bc6989	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5627-abe7-cd0b-6a60d46c103d	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3053 (class 0 OID 23107230)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5627-abe7-91c8-5599dca565e8	00230000-5627-abe7-91ce-a04cf5bc6989	popa
00240000-5627-abe7-7349-67ebbe8ada76	00230000-5627-abe7-91ce-a04cf5bc6989	oseba
00240000-5627-abe7-5d52-74faa3cdf617	00230000-5627-abe7-91ce-a04cf5bc6989	tippopa
00240000-5627-abe7-20b9-92c6edf684e4	00230000-5627-abe7-91ce-a04cf5bc6989	organizacijskaenota
00240000-5627-abe7-f1fb-780a9ae26653	00230000-5627-abe7-91ce-a04cf5bc6989	sezona
00240000-5627-abe7-391d-e8c12c6cc7ba	00230000-5627-abe7-91ce-a04cf5bc6989	tipvaje
00240000-5627-abe7-0ad0-bf0bbaa552fa	00230000-5627-abe7-4e11-09fc9979ffbb	prostor
00240000-5627-abe7-c8a1-cb9245f8837d	00230000-5627-abe7-91ce-a04cf5bc6989	besedilo
00240000-5627-abe7-d758-c0067f8d0756	00230000-5627-abe7-91ce-a04cf5bc6989	uprizoritev
00240000-5627-abe7-9cf6-5b698bc9a22f	00230000-5627-abe7-91ce-a04cf5bc6989	funkcija
00240000-5627-abe7-71a6-5e978cd4d2d1	00230000-5627-abe7-91ce-a04cf5bc6989	tipfunkcije
00240000-5627-abe7-f13c-e8de89d1281f	00230000-5627-abe7-91ce-a04cf5bc6989	alternacija
00240000-5627-abe7-e2a8-c29f37672c50	00230000-5627-abe7-b7f6-fc6a1dc5b5f3	pogodba
00240000-5627-abe7-d1bc-e9c88f290670	00230000-5627-abe7-91ce-a04cf5bc6989	zaposlitev
00240000-5627-abe7-2b44-5fa64c371f84	00230000-5627-abe7-91ce-a04cf5bc6989	zvrstuprizoritve
00240000-5627-abe7-eb6b-21ade0bd8650	00230000-5627-abe7-b7f6-fc6a1dc5b5f3	programdela
00240000-5627-abe7-4916-133ff2eb39e0	00230000-5627-abe7-91ce-a04cf5bc6989	zapis
\.


--
-- TOC entry 3052 (class 0 OID 23107225)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
5faee74b-7d35-4401-ae1c-78fd16e62e53	00240000-5627-abe7-91c8-5599dca565e8	0	1001
\.


--
-- TOC entry 3106 (class 0 OID 23107778)
-- Dependencies: 225
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5627-abea-bda4-c0ff8334bff8	000e0000-5627-abe9-7469-4d6aee2cc776	00080000-5627-abe9-530f-28cd2615a3c9	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5627-abe7-0be2-cf9dd179f43d
00270000-5627-abea-68f4-603e14d1bef2	000e0000-5627-abe9-7469-4d6aee2cc776	00080000-5627-abe9-530f-28cd2615a3c9	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5627-abe7-0be2-cf9dd179f43d
\.


--
-- TOC entry 3066 (class 0 OID 23107361)
-- Dependencies: 185
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3087 (class 0 OID 23107607)
-- Dependencies: 206
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5627-abea-d4f3-866f3f064413	00180000-5627-abea-b8b6-1a8222188106	000c0000-5627-abea-9ce6-15dba8d5990a	00090000-5627-abe9-f005-94a0b4d930a6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5627-abea-a9f2-098b25d7b70a	00180000-5627-abea-b8b6-1a8222188106	000c0000-5627-abea-4eaf-38edeaad1a20	00090000-5627-abe9-f4b4-02e4a31eb6f4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5627-abea-7a1a-6137313316c6	00180000-5627-abea-b8b6-1a8222188106	000c0000-5627-abea-95ad-efe77577ae4f	00090000-5627-abe9-e780-dcb159636edd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5627-abea-fded-6f8d345e49c4	00180000-5627-abea-b8b6-1a8222188106	000c0000-5627-abea-713f-5dc809c765d5	00090000-5627-abe9-579f-4c6e25f8b2a8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5627-abea-fb63-eef63d273ec2	00180000-5627-abea-b8b6-1a8222188106	000c0000-5627-abea-6815-faf58294c0f7	00090000-5627-abe9-f838-f206603f31fe	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5627-abea-10af-7e17b941adbd	00180000-5627-abea-53b3-2947c92cbece	\N	00090000-5627-abe9-f838-f206603f31fe	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5627-abea-3ae6-fe4652589dd1	00180000-5627-abea-53b3-2947c92cbece	\N	00090000-5627-abe9-f4b4-02e4a31eb6f4	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3109 (class 0 OID 23107819)
-- Dependencies: 228
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5627-abe7-437f-dfa3bcba21f2	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5627-abe7-2555-443b94a7698c	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5627-abe7-f8e7-5c66b8dab74c	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5627-abe7-8a52-270f1376c9d0	04	Režija	Režija	Režija	umetnik	30
000f0000-5627-abe7-599f-12a2de978004	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5627-abe7-e47e-01f61c203586	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5627-abe7-e21a-234c1069d85a	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5627-abe7-586d-ceb9ba2ea501	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5627-abe7-a703-738b461a7cf5	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5627-abe7-2588-023dd348bfdf	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5627-abe7-0888-3111c3fae609	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5627-abe7-f183-719043c68fb4	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5627-abe7-2d1d-3c52fc5a8c3c	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5627-abe7-a09d-b4c6dd379b77	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5627-abe7-c50a-790cd863dc2e	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5627-abe7-9099-c97173cb909d	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5627-abe7-c6eb-1e05486b32ec	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5627-abe7-ce97-df31f850e86d	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3063 (class 0 OID 23107315)
-- Dependencies: 182
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5627-abe9-1adf-9138df7eb05d	0001	šola	osnovna ali srednja šola
00400000-5627-abe9-0ba4-2e842a51192c	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5627-abe9-9ca6-e057581c7c98	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3122 (class 0 OID 23108096)
-- Dependencies: 241
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5627-abe7-d7c9-893fe64cac00	01	Velika predstava	f	1.00	1.00
002b0000-5627-abe7-4ef6-48481e8ebd74	02	Mala predstava	f	0.50	0.50
002b0000-5627-abe7-78d6-e608a5cbc28d	03	Mala koprodukcija	t	0.40	1.00
002b0000-5627-abe7-3141-5f5adee9bf30	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5627-abe7-1191-100bd0e0c94f	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3085 (class 0 OID 23107587)
-- Dependencies: 204
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5627-abe7-d702-234c4540b508	0001	prva vaja	prva vaja
00420000-5627-abe7-0b9c-f4b003c7301e	0002	tehnična vaja	tehnična vaja
00420000-5627-abe7-b543-4ccc398a3cd4	0003	lučna vaja	lučna vaja
00420000-5627-abe7-576c-6548ece93f9f	0004	kostumska vaja	kostumska vaja
00420000-5627-abe7-abc2-30d383d5cba4	0005	foto vaja	foto vaja
00420000-5627-abe7-35e5-37b9613f0375	0006	1. glavna vaja	1. glavna vaja
00420000-5627-abe7-3714-a41d2fecb33c	0007	2. glavna vaja	2. glavna vaja
00420000-5627-abe7-4175-37fea715e59d	0008	1. generalka	1. generalka
00420000-5627-abe7-e3e1-348b3fae9d28	0009	2. generalka	2. generalka
00420000-5627-abe7-8574-d696829a5660	0010	odprta generalka	odprta generalka
00420000-5627-abe7-fcf9-a510cb2af215	0011	obnovitvena vaja	obnovitvena vaja
00420000-5627-abe7-081e-c3a6096a8c4f	0012	pevska vaja	pevska vaja
00420000-5627-abe7-bd72-211ec3a7c5ca	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5627-abe7-f7a8-0981ae4b5072	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3072 (class 0 OID 23107434)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 23107260)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5627-abe8-f64b-61fa4e98392f	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROTgw6.kskzLuxIM36oOrm6T9q0hXX5qa	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5627-abe9-5298-a7779dea0514	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5627-abe9-711e-3e6b9aebced4	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5627-abe9-02f6-97ddde327f21	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5627-abe9-44e6-ad519cdfe439	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5627-abe9-3113-e4f4ad97febd	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5627-abe9-d2b4-19d39590c46c	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5627-abe9-be5b-723c1c9a263c	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5627-abe9-d651-de8afde94d19	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5627-abe9-87bb-c19e286119cb	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5627-abe9-95d6-5532a6ae142a	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5627-abe8-0753-8ea939dae2ba	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3113 (class 0 OID 23107869)
-- Dependencies: 232
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5627-abe9-0120-9e4fda6f5a07	00160000-5627-abe9-a512-a24a976cd201	\N	00140000-5627-abe7-903d-85b788a09b09	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5627-abe9-4548-f2a0c079510e
000e0000-5627-abe9-7469-4d6aee2cc776	00160000-5627-abe9-1a5b-3aa019940944	\N	00140000-5627-abe7-f669-e508984a8275	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5627-abe9-0566-4139cb284bdf
000e0000-5627-abe9-e6cf-82b142576538	\N	\N	00140000-5627-abe7-f669-e508984a8275	00190000-5627-abe9-4a21-89c0c564e2b5	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5627-abe9-4548-f2a0c079510e
000e0000-5627-abe9-0ad8-10276ccd238f	\N	\N	00140000-5627-abe7-f669-e508984a8275	00190000-5627-abe9-4a21-89c0c564e2b5	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5627-abe9-4548-f2a0c079510e
000e0000-5627-abe9-4826-95cc7a0c31f3	\N	\N	00140000-5627-abe7-f669-e508984a8275	00190000-5627-abe9-4a21-89c0c564e2b5	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5627-abe9-a122-2b9f02af50da
000e0000-5627-abe9-262b-eb7c98105e98	\N	\N	00140000-5627-abe7-f669-e508984a8275	00190000-5627-abe9-4a21-89c0c564e2b5	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5627-abe9-a122-2b9f02af50da
\.


--
-- TOC entry 3080 (class 0 OID 23107533)
-- Dependencies: 199
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5627-abe9-17eb-4c8e860fce25	\N	000e0000-5627-abe9-7469-4d6aee2cc776	1	
00200000-5627-abe9-3c1f-a52238c4657c	\N	000e0000-5627-abe9-7469-4d6aee2cc776	2	
00200000-5627-abe9-9bdf-7ae785346c62	\N	000e0000-5627-abe9-7469-4d6aee2cc776	3	
00200000-5627-abe9-6648-a06fd3a9e126	\N	000e0000-5627-abe9-7469-4d6aee2cc776	4	
00200000-5627-abe9-cbd0-38dd121ec6c7	\N	000e0000-5627-abe9-7469-4d6aee2cc776	5	
\.


--
-- TOC entry 3096 (class 0 OID 23107678)
-- Dependencies: 215
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 23107792)
-- Dependencies: 226
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5627-abe7-1b09-cff4a47e7c9a	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5627-abe7-8005-19d1c555121a	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5627-abe7-e344-2f2f156626ed	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5627-abe7-8b6f-75179524032b	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5627-abe7-4291-04a9ada7d319	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5627-abe7-5774-1274f5b655eb	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5627-abe7-93a1-618d8c3abdea	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5627-abe7-b596-fb1b58f106ce	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5627-abe7-0be2-cf9dd179f43d	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5627-abe7-8bb4-33a1aa6a9390	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5627-abe7-17cc-851f92734fff	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5627-abe7-fcdb-0aca54dbd3e1	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5627-abe7-4383-9454103f6ff9	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5627-abe7-b043-9aa315480266	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5627-abe7-7db1-514b008df896	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5627-abe7-ece0-adcfab5ae658	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5627-abe7-30aa-39367f03c1c0	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5627-abe7-57d9-c3aa05325766	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5627-abe7-9e33-f34e642608b3	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5627-abe7-1b93-f216198908f4	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5627-abe7-00ac-1429237bd367	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5627-abe7-e09b-d807041eab02	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5627-abe7-d655-c4293c4b8d70	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5627-abe7-a40a-8a2c7f85b483	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5627-abe7-ef32-7465b8c74a89	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5627-abe7-f225-98abc1976a35	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5627-abe7-8080-153ed50be47b	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5627-abe7-9f3d-363ec4a32967	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3125 (class 0 OID 23108143)
-- Dependencies: 244
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 23108115)
-- Dependencies: 243
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 23108155)
-- Dependencies: 245
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 23107750)
-- Dependencies: 222
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5627-abe9-7fe1-f92713b1351b	00090000-5627-abe9-f4b4-02e4a31eb6f4	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5627-abe9-2ac1-429431c908a4	00090000-5627-abe9-e780-dcb159636edd	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5627-abe9-f623-3703165bfd51	00090000-5627-abe9-a2c3-4607abd47d13	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5627-abe9-275e-f5a7ffd85dcc	00090000-5627-abe9-a8a0-fbd32edc03ce	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5627-abe9-c251-a871e27178d4	00090000-5627-abe9-f981-040631845dac	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5627-abe9-c944-c9bda3dfd2b2	00090000-5627-abe9-2b97-e5bcd788684a	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3083 (class 0 OID 23107576)
-- Dependencies: 202
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 23107859)
-- Dependencies: 231
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5627-abe7-903d-85b788a09b09	01	Drama	drama (SURS 01)
00140000-5627-abe7-4461-f61cf42b97f1	02	Opera	opera (SURS 02)
00140000-5627-abe7-e819-2051f3aaefbd	03	Balet	balet (SURS 03)
00140000-5627-abe7-4f7c-5459824471aa	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5627-abe7-f573-5e74591ff665	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5627-abe7-f669-e508984a8275	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5627-abe7-f511-7347b260eb2f	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3102 (class 0 OID 23107740)
-- Dependencies: 221
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2551 (class 2606 OID 23107314)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 23107918)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 23107908)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 23107775)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 23107817)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 23108195)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 23107565)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 23107586)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 23108113)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 23107460)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 23107986)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 23107736)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 23107531)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 23107498)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 23107474)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 23107643)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 23108172)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2822 (class 2606 OID 23108179)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2829 (class 2606 OID 23108203)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 22757752)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2686 (class 2606 OID 23107670)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 23107432)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 23107333)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 23107394)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 23107357)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 23107303)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2542 (class 2606 OID 23107288)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 23107676)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 23107712)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 23107854)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 23107385)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 23107420)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 23108065)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 23107649)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 23107410)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 23107550)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 23107519)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2618 (class 2606 OID 23107511)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 23107661)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 23108074)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 23108082)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 23108052)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 23108094)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 23107694)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 23107634)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 23107625)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 23107841)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 23107768)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 23107486)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 23107259)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 23107703)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 23107277)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2544 (class 2606 OID 23107297)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 23107721)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 23107656)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 23107605)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 23107247)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 23107235)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 23107229)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 23107788)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 23107366)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 23107616)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 23107828)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 23107322)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 23108106)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 23107594)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 23107445)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 23107272)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 23107887)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 23107540)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 23107684)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 23107800)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 23108153)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 23108137)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 23108161)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 23107758)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 23107580)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 23107867)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 23107748)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 1259 OID 23107574)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2635 (class 1259 OID 23107575)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2636 (class 1259 OID 23107573)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2637 (class 1259 OID 23107572)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2638 (class 1259 OID 23107571)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2729 (class 1259 OID 23107789)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2730 (class 1259 OID 23107790)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2731 (class 1259 OID 23107791)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2815 (class 1259 OID 23108174)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2816 (class 1259 OID 23108173)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2569 (class 1259 OID 23107387)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2570 (class 1259 OID 23107388)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2687 (class 1259 OID 23107677)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2802 (class 1259 OID 23108141)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2803 (class 1259 OID 23108140)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2804 (class 1259 OID 23108142)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2805 (class 1259 OID 23108139)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2806 (class 1259 OID 23108138)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2681 (class 1259 OID 23107663)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2682 (class 1259 OID 23107662)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2626 (class 1259 OID 23107541)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2627 (class 1259 OID 23107542)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2711 (class 1259 OID 23107737)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2712 (class 1259 OID 23107739)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2713 (class 1259 OID 23107738)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2601 (class 1259 OID 23107476)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2602 (class 1259 OID 23107475)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2793 (class 1259 OID 23108095)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2745 (class 1259 OID 23107856)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2746 (class 1259 OID 23107857)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2747 (class 1259 OID 23107858)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2812 (class 1259 OID 23108162)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2754 (class 1259 OID 23107892)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2755 (class 1259 OID 23107889)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2756 (class 1259 OID 23107893)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2757 (class 1259 OID 23107891)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2758 (class 1259 OID 23107890)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2591 (class 1259 OID 23107447)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2592 (class 1259 OID 23107446)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2560 (class 1259 OID 23107360)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2699 (class 1259 OID 23107704)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2546 (class 1259 OID 23107304)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2547 (class 1259 OID 23107305)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2704 (class 1259 OID 23107724)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2705 (class 1259 OID 23107723)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2706 (class 1259 OID 23107722)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2574 (class 1259 OID 23107397)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2575 (class 1259 OID 23107396)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2576 (class 1259 OID 23107398)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2614 (class 1259 OID 23107514)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2615 (class 1259 OID 23107512)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2616 (class 1259 OID 23107513)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2526 (class 1259 OID 23107237)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2661 (class 1259 OID 23107629)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2662 (class 1259 OID 23107627)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2663 (class 1259 OID 23107626)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2664 (class 1259 OID 23107628)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2537 (class 1259 OID 23107278)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2538 (class 1259 OID 23107279)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2690 (class 1259 OID 23107685)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2825 (class 1259 OID 23108196)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2727 (class 1259 OID 23107777)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2728 (class 1259 OID 23107776)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2826 (class 1259 OID 23108204)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2827 (class 1259 OID 23108205)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2676 (class 1259 OID 23107650)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2721 (class 1259 OID 23107769)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2722 (class 1259 OID 23107770)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2775 (class 1259 OID 23107991)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2776 (class 1259 OID 23107990)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2777 (class 1259 OID 23107987)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2778 (class 1259 OID 23107988)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2779 (class 1259 OID 23107989)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2580 (class 1259 OID 23107412)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2581 (class 1259 OID 23107411)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2582 (class 1259 OID 23107413)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2693 (class 1259 OID 23107698)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2694 (class 1259 OID 23107697)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2785 (class 1259 OID 23108075)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2786 (class 1259 OID 23108076)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2768 (class 1259 OID 23107922)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2769 (class 1259 OID 23107923)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2770 (class 1259 OID 23107920)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2771 (class 1259 OID 23107921)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2717 (class 1259 OID 23107759)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2718 (class 1259 OID 23107760)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2667 (class 1259 OID 23107638)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2668 (class 1259 OID 23107637)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2669 (class 1259 OID 23107635)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2670 (class 1259 OID 23107636)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2764 (class 1259 OID 23107910)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2765 (class 1259 OID 23107909)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2605 (class 1259 OID 23107487)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2608 (class 1259 OID 23107501)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2609 (class 1259 OID 23107500)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2610 (class 1259 OID 23107499)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2611 (class 1259 OID 23107502)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2625 (class 1259 OID 23107532)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2619 (class 1259 OID 23107520)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2620 (class 1259 OID 23107521)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2782 (class 1259 OID 23108066)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2801 (class 1259 OID 23108114)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2819 (class 1259 OID 23108180)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2820 (class 1259 OID 23108181)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2556 (class 1259 OID 23107335)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2557 (class 1259 OID 23107334)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2565 (class 1259 OID 23107367)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2566 (class 1259 OID 23107368)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2644 (class 1259 OID 23107581)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2656 (class 1259 OID 23107619)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2657 (class 1259 OID 23107618)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2658 (class 1259 OID 23107617)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2639 (class 1259 OID 23107567)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2640 (class 1259 OID 23107568)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2641 (class 1259 OID 23107566)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2642 (class 1259 OID 23107570)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2643 (class 1259 OID 23107569)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2573 (class 1259 OID 23107386)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2554 (class 1259 OID 23107323)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2555 (class 1259 OID 23107324)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2597 (class 1259 OID 23107461)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 23107463)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2599 (class 1259 OID 23107462)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2600 (class 1259 OID 23107464)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2675 (class 1259 OID 23107644)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2750 (class 1259 OID 23107855)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2759 (class 1259 OID 23107888)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 23107829)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2742 (class 1259 OID 23107830)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2563 (class 1259 OID 23107358)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 23107359)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2714 (class 1259 OID 23107749)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2532 (class 1259 OID 23107248)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2590 (class 1259 OID 23107433)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2579 (class 1259 OID 23107395)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2529 (class 1259 OID 23107236)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2798 (class 1259 OID 23108107)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2697 (class 1259 OID 23107696)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2698 (class 1259 OID 23107695)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2651 (class 1259 OID 23107595)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2652 (class 1259 OID 23107596)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2772 (class 1259 OID 23107919)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2587 (class 1259 OID 23107421)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2751 (class 1259 OID 23107868)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2809 (class 1259 OID 23108154)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2791 (class 1259 OID 23108083)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2792 (class 1259 OID 23108084)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2738 (class 1259 OID 23107818)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2655 (class 1259 OID 23107606)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2545 (class 1259 OID 23107298)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2868 (class 2606 OID 23108376)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2867 (class 2606 OID 23108381)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2863 (class 2606 OID 23108401)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2869 (class 2606 OID 23108371)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2865 (class 2606 OID 23108391)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2864 (class 2606 OID 23108396)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2866 (class 2606 OID 23108386)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2905 (class 2606 OID 23108571)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2904 (class 2606 OID 23108576)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2903 (class 2606 OID 23108581)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2937 (class 2606 OID 23108746)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2938 (class 2606 OID 23108741)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2842 (class 2606 OID 23108261)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2841 (class 2606 OID 23108266)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2886 (class 2606 OID 23108486)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2932 (class 2606 OID 23108726)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2933 (class 2606 OID 23108721)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2931 (class 2606 OID 23108731)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2934 (class 2606 OID 23108716)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2935 (class 2606 OID 23108711)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2884 (class 2606 OID 23108481)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2885 (class 2606 OID 23108476)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2862 (class 2606 OID 23108361)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2861 (class 2606 OID 23108366)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2896 (class 2606 OID 23108526)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2894 (class 2606 OID 23108536)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2895 (class 2606 OID 23108531)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2851 (class 2606 OID 23108316)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2852 (class 2606 OID 23108311)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2882 (class 2606 OID 23108466)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2929 (class 2606 OID 23108701)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2908 (class 2606 OID 23108586)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2907 (class 2606 OID 23108591)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2906 (class 2606 OID 23108596)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2936 (class 2606 OID 23108736)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2910 (class 2606 OID 23108616)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2913 (class 2606 OID 23108601)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2909 (class 2606 OID 23108621)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2911 (class 2606 OID 23108611)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2912 (class 2606 OID 23108606)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2849 (class 2606 OID 23108306)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2850 (class 2606 OID 23108301)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2837 (class 2606 OID 23108246)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2838 (class 2606 OID 23108241)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2890 (class 2606 OID 23108506)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2834 (class 2606 OID 23108221)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2833 (class 2606 OID 23108226)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2891 (class 2606 OID 23108521)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2892 (class 2606 OID 23108516)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2893 (class 2606 OID 23108511)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2844 (class 2606 OID 23108276)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2845 (class 2606 OID 23108271)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2843 (class 2606 OID 23108281)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2855 (class 2606 OID 23108341)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2857 (class 2606 OID 23108331)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2856 (class 2606 OID 23108336)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2830 (class 2606 OID 23108206)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2874 (class 2606 OID 23108441)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2876 (class 2606 OID 23108431)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2877 (class 2606 OID 23108426)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2875 (class 2606 OID 23108436)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2832 (class 2606 OID 23108211)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2831 (class 2606 OID 23108216)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2887 (class 2606 OID 23108491)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2941 (class 2606 OID 23108761)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2901 (class 2606 OID 23108566)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2902 (class 2606 OID 23108561)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2943 (class 2606 OID 23108766)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2942 (class 2606 OID 23108771)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2883 (class 2606 OID 23108471)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2900 (class 2606 OID 23108551)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2899 (class 2606 OID 23108556)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2920 (class 2606 OID 23108676)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2921 (class 2606 OID 23108671)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2924 (class 2606 OID 23108656)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2923 (class 2606 OID 23108661)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2922 (class 2606 OID 23108666)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2847 (class 2606 OID 23108291)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2848 (class 2606 OID 23108286)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2846 (class 2606 OID 23108296)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2888 (class 2606 OID 23108501)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2889 (class 2606 OID 23108496)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2927 (class 2606 OID 23108686)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2926 (class 2606 OID 23108691)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2917 (class 2606 OID 23108646)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2916 (class 2606 OID 23108651)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2919 (class 2606 OID 23108636)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2918 (class 2606 OID 23108641)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2898 (class 2606 OID 23108541)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2897 (class 2606 OID 23108546)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2878 (class 2606 OID 23108461)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2879 (class 2606 OID 23108456)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2881 (class 2606 OID 23108446)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2880 (class 2606 OID 23108451)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2914 (class 2606 OID 23108631)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2915 (class 2606 OID 23108626)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2853 (class 2606 OID 23108321)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2854 (class 2606 OID 23108326)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2860 (class 2606 OID 23108356)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2859 (class 2606 OID 23108346)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2858 (class 2606 OID 23108351)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2925 (class 2606 OID 23108681)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2928 (class 2606 OID 23108696)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2930 (class 2606 OID 23108706)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2940 (class 2606 OID 23108751)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2939 (class 2606 OID 23108756)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2835 (class 2606 OID 23108236)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2836 (class 2606 OID 23108231)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2840 (class 2606 OID 23108251)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2839 (class 2606 OID 23108256)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2870 (class 2606 OID 23108406)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2871 (class 2606 OID 23108421)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2872 (class 2606 OID 23108416)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2873 (class 2606 OID 23108411)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-21 17:14:53 CEST

--
-- PostgreSQL database dump complete
--

