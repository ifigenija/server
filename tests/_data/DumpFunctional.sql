--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-23 14:17:17 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 4294698)
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
-- TOC entry 226 (class 1259 OID 4295212)
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
-- TOC entry 221 (class 1259 OID 4295143)
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
-- TOC entry 225 (class 1259 OID 4295205)
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
-- TOC entry 227 (class 1259 OID 4295225)
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
-- TOC entry 238 (class 1259 OID 4295427)
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
-- TOC entry 199 (class 1259 OID 4294921)
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
    allday boolean DEFAULT false,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status character varying(4) DEFAULT NULL::character varying,
    razred character varying(4) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 4294947)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 4295402)
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
-- TOC entry 188 (class 1259 OID 4294797)
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
-- TOC entry 232 (class 1259 OID 4295323)
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
    prikoproducentu boolean,
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
-- TOC entry 229 (class 1259 OID 4295253)
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
-- TOC entry 194 (class 1259 OID 4294874)
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
-- TOC entry 192 (class 1259 OID 4294848)
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
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 170 (class 1259 OID 4211950)
-- Name: job_datoteka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE job_datoteka (
    job_id uuid NOT NULL,
    datoteka_id uuid NOT NULL
);


--
-- TOC entry 191 (class 1259 OID 4294836)
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
-- TOC entry 211 (class 1259 OID 4295043)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 239 (class 1259 OID 4295442)
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
-- TOC entry 240 (class 1259 OID 4295454)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 4295461)
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
-- TOC entry 214 (class 1259 OID 4295063)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 185 (class 1259 OID 4294752)
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
-- TOC entry 184 (class 1259 OID 4294741)
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
-- TOC entry 186 (class 1259 OID 4294764)
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
-- TOC entry 180 (class 1259 OID 4294689)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 4294682)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 4295026)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 205 (class 1259 OID 4294984)
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
-- TOC entry 220 (class 1259 OID 4295126)
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
    aktivna boolean,
    zaposlenvdrjz boolean,
    samozaposlen boolean,
    igralec boolean,
    opis text
);


--
-- TOC entry 182 (class 1259 OID 4294707)
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
-- TOC entry 190 (class 1259 OID 4294828)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 4295388)
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
-- TOC entry 204 (class 1259 OID 4294978)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 183 (class 1259 OID 4294726)
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
-- TOC entry 198 (class 1259 OID 4294911)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 202 (class 1259 OID 4294965)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 4295417)
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
-- TOC entry 236 (class 1259 OID 4295409)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 4295280)
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
-- TOC entry 233 (class 1259 OID 4295378)
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
-- TOC entry 207 (class 1259 OID 4295001)
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
-- TOC entry 206 (class 1259 OID 4294992)
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
-- TOC entry 210 (class 1259 OID 4295033)
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
-- TOC entry 216 (class 1259 OID 4295084)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 4295116)
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
-- TOC entry 193 (class 1259 OID 4294863)
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
-- TOC entry 177 (class 1259 OID 4294663)
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
-- TOC entry 176 (class 1259 OID 4294661)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 4295057)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 4294672)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 4294654)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 4295014)
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
-- TOC entry 203 (class 1259 OID 4294972)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 196 (class 1259 OID 4294895)
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
-- TOC entry 171 (class 1259 OID 4294617)
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
-- TOC entry 172 (class 1259 OID 4294628)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 4294636)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 215 (class 1259 OID 4295070)
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
-- TOC entry 187 (class 1259 OID 4294789)
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
-- TOC entry 201 (class 1259 OID 4294952)
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
-- TOC entry 218 (class 1259 OID 4295104)
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
-- TOC entry 230 (class 1259 OID 4295268)
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
-- TOC entry 189 (class 1259 OID 4294814)
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
-- TOC entry 174 (class 1259 OID 4294641)
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
-- TOC entry 223 (class 1259 OID 4295170)
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
-- TOC entry 195 (class 1259 OID 4294885)
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
-- TOC entry 212 (class 1259 OID 4295049)
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
-- TOC entry 217 (class 1259 OID 4295095)
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
-- TOC entry 243 (class 1259 OID 4295498)
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
-- TOC entry 242 (class 1259 OID 4295470)
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
-- TOC entry 244 (class 1259 OID 4295510)
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
-- TOC entry 224 (class 1259 OID 4295195)
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
-- TOC entry 197 (class 1259 OID 4294905)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 222 (class 1259 OID 4295160)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 4295243)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2206 (class 2604 OID 4294666)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2976 (class 0 OID 4294698)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 4295212)
-- Dependencies: 226
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5602-980c-64a3-5087a42a52e9	000d0000-5602-980c-ca09-dc7e5d10b986	\N	00090000-5602-980c-25b3-dba64c849c09	000b0000-5602-980c-a2fa-94e98c8cb297	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5602-980c-ba5c-fc9cf760a964	000d0000-5602-980c-d989-3e5849cb3fb8	00100000-5602-980c-ea1e-47c6e387b598	00090000-5602-980c-f5bd-61b5c2904e77	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5602-980c-4399-5b1903486399	000d0000-5602-980c-91a8-e17f69a0b113	00100000-5602-980c-d6a4-52d017cddee1	00090000-5602-980c-af81-2d5916c40175	\N	0003	t	\N	2015-09-23	\N	2	t	\N	f	f
000c0000-5602-980c-fadd-abc5ecbdada8	000d0000-5602-980c-3082-30578f31dfca	\N	00090000-5602-980c-d02b-b7cc9a3cc9ab	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5602-980c-9c64-ace1ddf585ee	000d0000-5602-980c-09c1-bdff57770687	\N	00090000-5602-980c-692d-9cec6017e592	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5602-980c-932e-13922a9edc16	000d0000-5602-980c-8ef9-4494806dc649	\N	00090000-5602-980c-5b89-816022c29c4c	000b0000-5602-980c-a566-e30fbbf9438d	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5602-980c-96d4-d17619520851	000d0000-5602-980c-3e52-e95ee54a93cf	00100000-5602-980c-39a6-0b4484ae9ee8	00090000-5602-980c-0ffc-3797fe9043fd	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5602-980c-b58e-f361e296c982	000d0000-5602-980c-7009-150a7adbda84	\N	00090000-5602-980c-ddad-b9595b090961	000b0000-5602-980c-f117-f534a4b4508e	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5602-980c-dc55-c8059a94d0db	000d0000-5602-980c-3e52-e95ee54a93cf	00100000-5602-980c-71fc-d7b2fa5bf43a	00090000-5602-980c-4fd7-2446a4b35f4c	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5602-980c-9e08-0c1023f587f2	000d0000-5602-980c-3e52-e95ee54a93cf	00100000-5602-980c-8973-28dd4020a29d	00090000-5602-980c-ec1f-5c4b60ee6915	\N	0010	t	\N	2015-09-23	\N	16	f	\N	f	t
000c0000-5602-980c-96a4-0d7c08bef102	000d0000-5602-980c-3e52-e95ee54a93cf	00100000-5602-980c-8511-63720f6a4620	00090000-5602-980c-b165-3ad24ac38893	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5602-980c-3997-d81f79b2b960	000d0000-5602-980c-f62c-efc8b785a60c	\N	00090000-5602-980c-f5bd-61b5c2904e77	000b0000-5602-980c-99b5-583d200bb4ee	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3016 (class 0 OID 4295143)
-- Dependencies: 221
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 4295205)
-- Dependencies: 225
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5602-980c-cbc6-d68d3d5a6ade	00160000-5602-980c-52b8-9c8f5bd75111	00090000-5602-980c-16a9-dd349d162cff	Avtor originala	10	t
003d0000-5602-980c-166e-454a983c57d6	00160000-5602-980c-52b8-9c8f5bd75111	00090000-5602-980c-7d48-66e6fb450e0c	Predelava	14	t
003d0000-5602-980c-2779-ca88c2566f41	00160000-5602-980c-792a-018ceec401c3	00090000-5602-980c-ee66-5e24e045c571	Avtor originala	11	t
003d0000-5602-980c-f53a-06344bc4b9e1	00160000-5602-980c-0d46-b4058e7fd1fa	00090000-5602-980c-6dd1-7c653af6b4e2	Avtor originala	12	t
003d0000-5602-980c-b655-5d3fa4722af9	00160000-5602-980c-52b8-9c8f5bd75111	00090000-5602-980c-ed4c-25e71a1a786c	Predelava	18	f
\.


--
-- TOC entry 3022 (class 0 OID 4295225)
-- Dependencies: 227
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5602-980c-52b8-9c8f5bd75111	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	\N
00160000-5602-980c-792a-018ceec401c3	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	\N
00160000-5602-980c-0d46-b4058e7fd1fa	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	\N
\.


--
-- TOC entry 3033 (class 0 OID 4295427)
-- Dependencies: 238
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 4294921)
-- Dependencies: 199
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5602-980c-a976-9ef4aeba95b3	\N	\N	00200000-5602-980c-8ca9-199b23f83f98	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5602-980c-eee9-76ad66504549	\N	\N	00200000-5602-980c-d2ef-b5882afc9dac	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5602-980c-1a13-9811f61f487d	\N	\N	00200000-5602-980c-0168-278e13dd2a35	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5602-980c-8218-4d175dcd2139	\N	\N	00200000-5602-980c-bafc-45eb15fddc95	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5602-980c-3371-9b668544da1f	\N	\N	00200000-5602-980c-7e3a-c2d5df6cd891	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2995 (class 0 OID 4294947)
-- Dependencies: 200
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 4295402)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 4294797)
-- Dependencies: 188
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5602-980a-8e5c-dd7b592cd0bf	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5602-980a-8b2e-b6591376d2e0	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5602-980a-0d02-4a1dc70a23f7	AL	ALB	008	Albania 	Albanija	\N
00040000-5602-980a-339c-14cda0672ba1	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5602-980a-a9b8-c1aa7da59261	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5602-980a-499d-4b847dbd28b4	AD	AND	020	Andorra 	Andora	\N
00040000-5602-980a-40e2-bded33d2906f	AO	AGO	024	Angola 	Angola	\N
00040000-5602-980a-945c-395e80e594f8	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5602-980a-4fdf-2da52f3559f3	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5602-980a-b1d1-7be421a13ba1	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5602-980a-fabc-5333bcc2adcd	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5602-980a-b2c6-121990eea69b	AM	ARM	051	Armenia 	Armenija	\N
00040000-5602-980a-c585-72bf99402d95	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5602-980a-e7eb-f001fcebe5d2	AU	AUS	036	Australia 	Avstralija	\N
00040000-5602-980a-297f-d9ac3b509463	AT	AUT	040	Austria 	Avstrija	\N
00040000-5602-980a-9a9d-499567d54eda	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5602-980a-f6f5-7ded68df6046	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5602-980a-7df0-1fcfbbb4af49	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5602-980a-a6a9-4cf9c47ddc7c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5602-980a-8fcb-1e64ae9335ac	BB	BRB	052	Barbados 	Barbados	\N
00040000-5602-980a-27e1-e85c8cf42726	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5602-980a-df0e-80b15527786d	BE	BEL	056	Belgium 	Belgija	\N
00040000-5602-980a-a2c3-c5dcf82408a4	BZ	BLZ	084	Belize 	Belize	\N
00040000-5602-980a-6ac9-43f334d91943	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5602-980a-a017-f370d8b0bcad	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5602-980a-0fd6-d14134cda448	BT	BTN	064	Bhutan 	Butan	\N
00040000-5602-980a-d7e2-2111ea221f10	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5602-980a-62cb-d484ae0a148a	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5602-980a-3210-a05cc1be4707	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5602-980a-f6e1-52b118751811	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5602-980a-0b5b-ff76d1a2e405	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5602-980a-d325-95be099e82e3	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5602-980a-0d1f-0a9d7143a97e	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5602-980a-b53d-8eb0d7d73b37	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5602-980a-b02f-745896558322	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5602-980a-aa9e-2b6135bb0596	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5602-980a-e894-b21e9b43e783	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5602-980a-daf9-1f6b93de7b56	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5602-980a-0d4a-7e55f7202a19	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5602-980a-da62-89cdb0656f34	CA	CAN	124	Canada 	Kanada	\N
00040000-5602-980a-ca1e-5e3d49e39062	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5602-980a-4a20-2f226ee5cf26	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5602-980a-a0b5-04d6356fb010	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5602-980a-cc4c-08f7aabe3a92	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5602-980a-1baa-b9eb2fa80f1e	CL	CHL	152	Chile 	Čile	\N
00040000-5602-980a-a110-c67208aa987d	CN	CHN	156	China 	Kitajska	\N
00040000-5602-980a-54b9-8118cc362c80	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5602-980a-0221-7f36859788d2	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5602-980a-e6d4-cb056562bab1	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5602-980a-6304-f2615f4cc38d	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5602-980a-5402-efecedfd5b70	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5602-980a-3600-08b73433d93c	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5602-980a-bddc-42d22ba6c8b5	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5602-980a-01a1-08ab66e64f86	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5602-980a-6c74-0bbb70ebc5ca	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5602-980a-e2b9-0c19ac759da4	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5602-980a-d9ca-457f36bc6edc	CU	CUB	192	Cuba 	Kuba	\N
00040000-5602-980a-86c2-c2009f56f672	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5602-980a-fb2e-a5a6819d3480	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5602-980a-344e-579891dd6ece	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5602-980a-8af1-c068e8f5ae99	DK	DNK	208	Denmark 	Danska	\N
00040000-5602-980a-585f-db636105c709	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5602-980a-72be-2b668e7f0e7f	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5602-980a-98b2-34227af09131	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5602-980a-6acc-feb566610ba2	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5602-980a-28d6-d97587b52748	EG	EGY	818	Egypt 	Egipt	\N
00040000-5602-980a-9a66-d40e81c92bcd	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5602-980a-a861-820cb338f4f8	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5602-980a-ca0f-9ae4ae02fa8e	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5602-980a-b83e-aa01128b25e9	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5602-980a-2ba8-ece321766f7a	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5602-980a-f774-0197eb249455	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5602-980a-bbaa-ba7b11ba1435	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5602-980a-ad8d-09070e808c76	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5602-980a-7035-ea059c12936d	FI	FIN	246	Finland 	Finska	\N
00040000-5602-980a-cd8d-d64e312ee165	FR	FRA	250	France 	Francija	\N
00040000-5602-980a-78d8-d40e3b30560a	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5602-980a-5dae-37ab16a75288	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5602-980a-7921-986eaef5897b	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5602-980a-aed4-cd38b104152e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5602-980a-b911-295f31416cc1	GA	GAB	266	Gabon 	Gabon	\N
00040000-5602-980a-4d34-c49426e40a5b	GM	GMB	270	Gambia 	Gambija	\N
00040000-5602-980a-8fae-482175cca278	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5602-980a-1c1e-405e92768f9f	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5602-980a-dc03-deb2a9125d6d	GH	GHA	288	Ghana 	Gana	\N
00040000-5602-980a-c5f4-4e489b2809e8	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5602-980a-ef96-83e62cc65a51	GR	GRC	300	Greece 	Grčija	\N
00040000-5602-980a-9c8a-21d6cc024bc8	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5602-980a-4477-76ea4ebbc4dc	GD	GRD	308	Grenada 	Grenada	\N
00040000-5602-980a-d3b1-c974ad04c5bf	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5602-980a-0d7a-fb0bfc06f740	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5602-980a-2b4b-824038271465	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5602-980a-63a8-9d5e951c23ee	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5602-980a-5215-3872d5ff845b	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5602-980a-e57f-0403f4782ba5	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5602-980a-3dd2-c51f728945cb	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5602-980a-a2e3-bbdf519b5ca4	HT	HTI	332	Haiti 	Haiti	\N
00040000-5602-980a-629f-31a8523b5736	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5602-980a-fb10-b25c9cc9402e	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5602-980a-4f90-c6726fa969c8	HN	HND	340	Honduras 	Honduras	\N
00040000-5602-980a-8332-f4de5affedf3	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5602-980a-54a4-51ef2dedc7e4	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5602-980a-9ad3-a0c7dc3633f9	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5602-980a-6828-bacbf1ffb143	IN	IND	356	India 	Indija	\N
00040000-5602-980a-8ce2-34e8acdeb4c0	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5602-980a-df6f-77ba20ac09fa	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5602-980a-4bc8-417643630f49	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5602-980a-926f-cfe2f739d786	IE	IRL	372	Ireland 	Irska	\N
00040000-5602-980a-b3ee-8d40ea873227	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5602-980a-0362-984c2c2865ed	IL	ISR	376	Israel 	Izrael	\N
00040000-5602-980a-45cf-d2e91320dd26	IT	ITA	380	Italy 	Italija	\N
00040000-5602-980a-9fcf-f6c4deb4d4ef	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5602-980a-c48a-37924617cc27	JP	JPN	392	Japan 	Japonska	\N
00040000-5602-980a-51e3-d385704df592	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5602-980a-93ee-1a47940bd362	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5602-980a-b7ad-a403b2f45beb	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5602-980a-9b95-e37db2064ced	KE	KEN	404	Kenya 	Kenija	\N
00040000-5602-980a-7173-c9549c68793a	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5602-980a-12f7-e074ab2cfa4e	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5602-980a-67df-19dac25b309a	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5602-980a-1c53-22eebc74c03c	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5602-980a-a2fc-40c519ff03de	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5602-980a-b5c0-651718f253fc	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5602-980a-f6f5-f36e3980efda	LV	LVA	428	Latvia 	Latvija	\N
00040000-5602-980a-a381-b5997919d9af	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5602-980a-0c17-26f6369af4cc	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5602-980a-8ced-5626caebf56b	LR	LBR	430	Liberia 	Liberija	\N
00040000-5602-980a-2220-9b0a2235313f	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5602-980a-a930-c2418a54b831	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5602-980a-84c2-b72f684a75cb	LT	LTU	440	Lithuania 	Litva	\N
00040000-5602-980a-5cdb-f4a40da82a36	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5602-980a-19c7-6304234779e3	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5602-980a-049c-0c32df1ea0a1	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5602-980a-683a-3f763ccc5766	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5602-980a-5892-1f872feb4ce9	MW	MWI	454	Malawi 	Malavi	\N
00040000-5602-980a-8248-a196c5616e58	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5602-980a-5d9c-e8fcbd63e67c	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5602-980a-3e9f-7efd6bc0af2d	ML	MLI	466	Mali 	Mali	\N
00040000-5602-980a-c49d-4c8df6c88985	MT	MLT	470	Malta 	Malta	\N
00040000-5602-980a-7840-dbdd8c8d06ad	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5602-980a-d8a2-9a949717558e	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5602-980a-f745-82731367bd17	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5602-980a-192b-c52b5522e2fc	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5602-980a-6e4e-e2d576173f7a	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5602-980a-2d92-27b32b1f0594	MX	MEX	484	Mexico 	Mehika	\N
00040000-5602-980a-104b-35a470ded7c9	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5602-980a-c2d5-ab72f6fd14f2	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5602-980a-b4ec-13fb09171e96	MC	MCO	492	Monaco 	Monako	\N
00040000-5602-980a-d800-667319af2f6d	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5602-980a-c9cb-ad2d01ba8724	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5602-980a-0c12-3875c8d19e3a	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5602-980a-c396-260def2de639	MA	MAR	504	Morocco 	Maroko	\N
00040000-5602-980a-1475-1323f3da4be8	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5602-980a-4d2e-b18d5f41e405	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5602-980a-4e91-780077ed2e85	NA	NAM	516	Namibia 	Namibija	\N
00040000-5602-980a-c3aa-f8deeae8c9c8	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5602-980a-1b80-65f1850dcd3d	NP	NPL	524	Nepal 	Nepal	\N
00040000-5602-980a-465e-e1a45ed78b9f	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5602-980a-94a1-80ea391cb6fd	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5602-980a-598d-8a6e68e9ae22	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5602-980a-7f00-f886f5c12245	NE	NER	562	Niger 	Niger 	\N
00040000-5602-980a-2009-556ee0fe6824	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5602-980a-0d1c-6b36d28cf8b8	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5602-980a-12d9-950b3e69f9f0	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5602-980a-85a9-ee6d8c6b2219	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5602-980a-2835-c13ff0d25996	NO	NOR	578	Norway 	Norveška	\N
00040000-5602-980a-92eb-f4f58e904348	OM	OMN	512	Oman 	Oman	\N
00040000-5602-980a-1e47-83229260dae1	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5602-980a-fd0c-83fe94a49597	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5602-980a-18cf-6c95e4659a00	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5602-980a-fde9-c40b06426e44	PA	PAN	591	Panama 	Panama	\N
00040000-5602-980a-a9d9-8f2fefcf5f44	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5602-980a-6ee3-5c42762a254c	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5602-980a-09c8-b4605ec65668	PE	PER	604	Peru 	Peru	\N
00040000-5602-980a-0189-370e517d954f	PH	PHL	608	Philippines 	Filipini	\N
00040000-5602-980a-b486-1c8acee2c6c2	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5602-980a-236a-53e858b3e1ec	PL	POL	616	Poland 	Poljska	\N
00040000-5602-980a-64f0-51952a4b6cee	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5602-980a-de09-807624018b16	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5602-980a-5cc1-98d8155e338f	QA	QAT	634	Qatar 	Katar	\N
00040000-5602-980a-916e-ffcf3c0314d8	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5602-980a-2a05-42413077a15b	RO	ROU	642	Romania 	Romunija	\N
00040000-5602-980a-5313-d6e3a2a78599	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5602-980a-e9cc-57acda3915d7	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5602-980a-65c3-903bb4d2cdfd	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5602-980a-e4cd-5f8206fcb09a	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5602-980a-4455-322338c3c363	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5602-980a-d62f-e872bcc394cc	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5602-980a-9017-613d8c4d6d83	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5602-980a-3ba0-d1170006110d	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5602-980a-3d17-117b0ae6ef9d	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5602-980a-969f-dc645a09ad32	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5602-980a-9296-9520c2d41c17	SM	SMR	674	San Marino 	San Marino	\N
00040000-5602-980a-4170-25e68f490222	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5602-980a-af79-45be1372b251	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5602-980a-0339-5f82e3596a4d	SN	SEN	686	Senegal 	Senegal	\N
00040000-5602-980a-9bbc-00add7c73199	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5602-980a-aa36-df63d8631987	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5602-980a-5d3c-592a3ca6e91a	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5602-980a-785b-feb5a248149a	SG	SGP	702	Singapore 	Singapur	\N
00040000-5602-980a-6192-60ca9e4ced0e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5602-980a-e3cb-ba5319178894	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5602-980a-04e9-d1b1722d8332	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5602-980a-63f6-9b702eb09c2a	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5602-980a-808c-f65f514df49a	SO	SOM	706	Somalia 	Somalija	\N
00040000-5602-980a-b12e-8ddeaf408c9b	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5602-980a-a9b9-bcdfb476046b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5602-980a-063d-9e151c367d06	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5602-980a-6ebb-09e91f3eecd6	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5602-980a-349c-045bd316d224	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5602-980a-3ec5-6d6e745c5503	SD	SDN	729	Sudan 	Sudan	\N
00040000-5602-980a-949d-74df1251ad01	SR	SUR	740	Suriname 	Surinam	\N
00040000-5602-980a-6300-68d38eb7b913	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5602-980a-a1f0-ce9ed3259078	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5602-980a-cab4-1b3a9879066e	SE	SWE	752	Sweden 	Švedska	\N
00040000-5602-980a-5034-260057987fdc	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5602-980a-b3b6-00cb995fcf62	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5602-980a-f69c-b1f6159ab024	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5602-980a-bb31-9e6548ea1771	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5602-980a-3f52-e41b1d1102eb	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5602-980a-9cbe-ea4486e1ce24	TH	THA	764	Thailand 	Tajska	\N
00040000-5602-980a-3a2a-224131eaf5aa	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5602-980a-8ef3-a4441be8322d	TG	TGO	768	Togo 	Togo	\N
00040000-5602-980a-9891-773501a04315	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5602-980a-e90a-9bcdb3a9dc38	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5602-980a-9e8e-35e470dcf8df	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5602-980a-84d1-0c52896c4f31	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5602-980a-3f5c-cf2d64301078	TR	TUR	792	Turkey 	Turčija	\N
00040000-5602-980a-6789-d3f91085ddb0	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5602-980a-689e-5a3b4a755467	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5602-980a-28f8-f134bc30d90b	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5602-980a-65c5-be81a15f92a7	UG	UGA	800	Uganda 	Uganda	\N
00040000-5602-980a-5366-a7640107a3dc	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5602-980a-a10e-0ebe30cc0233	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5602-980a-e7ba-023a21aa3d29	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5602-980a-ec0f-21c49cb0aab9	US	USA	840	United States 	Združene države Amerike	\N
00040000-5602-980a-15f6-4f324219756c	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5602-980a-18a6-c082b2bbf472	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5602-980a-b4d5-42e61e25655c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5602-980a-a8d5-6f54bf3e41b7	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5602-980a-17b9-4cf47586a90a	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5602-980a-657e-6d00fbb3c31d	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5602-980a-f295-4e227d07d8ff	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5602-980a-9177-dc88c31ef781	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5602-980a-c77d-309e9d9efeb1	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5602-980a-5e02-e0a43e025c07	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5602-980a-5a8b-0ca77d818655	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5602-980a-24a9-aabab3d92f98	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5602-980a-7fcd-7bed02af77a0	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3027 (class 0 OID 4295323)
-- Dependencies: 232
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-5602-980c-ff18-056031eb399b	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5602-980c-9bf4-9f55bb9b6ce8	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5602-980c-30ea-6ca55627003a	000e0000-5602-980c-0838-a678f5f18ad4	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5602-980b-40e8-6b3d442821bf	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5602-980c-ebfa-9545ddca529a	000e0000-5602-980c-512e-970c20b9287b	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5602-980b-c30d-af387ea19bab	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5602-980c-ca0b-e399e97e1233	000e0000-5602-980c-ddbd-66d20ee5cff4	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5602-980b-40e8-6b3d442821bf	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3024 (class 0 OID 4295253)
-- Dependencies: 229
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5602-980c-ca09-dc7e5d10b986	000e0000-5602-980c-512e-970c20b9287b	000c0000-5602-980c-64a3-5087a42a52e9	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5602-980b-7a0e-a5fa38f014e0
000d0000-5602-980c-d989-3e5849cb3fb8	000e0000-5602-980c-512e-970c20b9287b	000c0000-5602-980c-ba5c-fc9cf760a964	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5602-980b-2b39-76680c272014
000d0000-5602-980c-91a8-e17f69a0b113	000e0000-5602-980c-512e-970c20b9287b	000c0000-5602-980c-4399-5b1903486399	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5602-980b-58f4-ded72c6efe46
000d0000-5602-980c-3082-30578f31dfca	000e0000-5602-980c-512e-970c20b9287b	000c0000-5602-980c-fadd-abc5ecbdada8	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5602-980b-58d3-406498ec0a47
000d0000-5602-980c-09c1-bdff57770687	000e0000-5602-980c-512e-970c20b9287b	000c0000-5602-980c-9c64-ace1ddf585ee	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5602-980b-58d3-406498ec0a47
000d0000-5602-980c-8ef9-4494806dc649	000e0000-5602-980c-512e-970c20b9287b	000c0000-5602-980c-932e-13922a9edc16	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5602-980b-7a0e-a5fa38f014e0
000d0000-5602-980c-3e52-e95ee54a93cf	000e0000-5602-980c-512e-970c20b9287b	000c0000-5602-980c-dc55-c8059a94d0db	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5602-980b-7a0e-a5fa38f014e0
000d0000-5602-980c-7009-150a7adbda84	000e0000-5602-980c-512e-970c20b9287b	000c0000-5602-980c-b58e-f361e296c982	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5602-980b-141f-9aebfc5a738c
000d0000-5602-980c-f62c-efc8b785a60c	000e0000-5602-980c-512e-970c20b9287b	000c0000-5602-980c-3997-d81f79b2b960	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5602-980b-52eb-bcb419fa5c76
\.


--
-- TOC entry 2989 (class 0 OID 4294874)
-- Dependencies: 194
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 4294848)
-- Dependencies: 192
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 4211950)
-- Dependencies: 170
-- Data for Name: job_datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job_datoteka (job_id, datoteka_id) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 4294836)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5602-980c-5db9-4c533a36667f	00080000-5602-980c-0927-354d528ffffc	00090000-5602-980c-ec1f-5c4b60ee6915	AK		igralka
\.


--
-- TOC entry 3006 (class 0 OID 4295043)
-- Dependencies: 211
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 4295442)
-- Dependencies: 239
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 4295454)
-- Dependencies: 240
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 4295461)
-- Dependencies: 241
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 4295063)
-- Dependencies: 214
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 4294752)
-- Dependencies: 185
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5602-980b-f72f-78978bb4ed17	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5602-980b-38bb-44992f8ef25f	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5602-980b-5e2f-5d08d944c492	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5602-980b-8dd9-552a6a2b92fc	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5602-980b-ac3e-871ec645dd33	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5602-980b-b30a-40d32fc6cad4	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5602-980b-924d-5ff8284017d1	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5602-980b-41e3-9e9606383905	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5602-980b-4b2b-ce8d51413a56	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5602-980b-bd0a-424d5e50928d	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5602-980b-d880-32112c319c93	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5602-980b-2586-30476b371e33	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5602-980b-7af9-401af9d5df6f	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5602-980b-de7e-eaae51788908	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5602-980c-7384-b18a9be5a53b	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5602-980c-a4f2-c8d476e9f552	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5602-980c-931f-ca76a553fb3a	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5602-980c-48b2-976360658873	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5602-980c-b79a-868b67763182	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5602-980e-8de1-74de824cc976	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2979 (class 0 OID 4294741)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5602-980c-275c-7548550d2b5a	00000000-5602-980c-7384-b18a9be5a53b	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5602-980c-bb77-ae6f099f298f	00000000-5602-980c-7384-b18a9be5a53b	00010000-5602-980b-4332-15f792374724	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5602-980c-b84e-6ce28d376522	00000000-5602-980c-a4f2-c8d476e9f552	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2981 (class 0 OID 4294764)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5602-980c-25b3-dba64c849c09	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5602-980c-d02b-b7cc9a3cc9ab	00010000-5602-980c-2dbf-de6a46c875eb	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5602-980c-af81-2d5916c40175	00010000-5602-980c-f699-cb6ec9ab5b56	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5602-980c-4fd7-2446a4b35f4c	00010000-5602-980c-af8c-f42cda305f77	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5602-980c-a038-5bbb567c2d2c	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5602-980c-5b89-816022c29c4c	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5602-980c-b165-3ad24ac38893	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5602-980c-0ffc-3797fe9043fd	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5602-980c-ec1f-5c4b60ee6915	00010000-5602-980c-032e-59674eea7448	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5602-980c-f5bd-61b5c2904e77	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5602-980c-2b45-0c1dc0137739	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5602-980c-692d-9cec6017e592	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5602-980c-ddad-b9595b090961	00010000-5602-980c-d780-31cb6e9e6283	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5602-980c-16a9-dd349d162cff	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5602-980c-7d48-66e6fb450e0c	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5602-980c-ee66-5e24e045c571	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5602-980c-6dd1-7c653af6b4e2	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5602-980c-ed4c-25e71a1a786c	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2975 (class 0 OID 4294689)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5602-980b-fcbf-1578775db80c	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5602-980b-0ba7-633d52508302	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5602-980b-a34e-30158ea0cfe8	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5602-980b-80f3-5683f63d84c0	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5602-980b-c10b-8fefc5c0cc63	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5602-980b-ecac-a2b25876acf6	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5602-980b-3520-e59e7b45c1ba	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5602-980b-fa83-a36e890c1c3f	Abonma-read	Abonma - branje	f
00030000-5602-980b-c853-ac458281bfe7	Abonma-write	Abonma - spreminjanje	f
00030000-5602-980b-b52a-4bb9e00fe6f6	Alternacija-read	Alternacija - branje	f
00030000-5602-980b-00a6-b519db51c4a2	Alternacija-write	Alternacija - spreminjanje	f
00030000-5602-980b-7c10-8e75f3ec96f6	Arhivalija-read	Arhivalija - branje	f
00030000-5602-980b-baf8-f31e32beeaf0	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5602-980b-1b42-098e59655d0f	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5602-980b-ba99-0a518218cdb3	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5602-980b-595f-0a89f1c18aa1	Besedilo-read	Besedilo - branje	f
00030000-5602-980b-0cb3-b33dc84a2a7f	Besedilo-write	Besedilo - spreminjanje	f
00030000-5602-980b-b127-bd9f99a8a2fe	DogodekIzven-read	DogodekIzven - branje	f
00030000-5602-980b-93ec-eecce49b08c4	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5602-980b-dc2e-ea03dc96101e	Dogodek-read	Dogodek - branje	f
00030000-5602-980b-581b-29100d769eb2	Dogodek-write	Dogodek - spreminjanje	f
00030000-5602-980b-0b5b-57ed1ee3d68f	DrugiVir-read	DrugiVir - branje	f
00030000-5602-980b-f97b-280a459df21f	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5602-980b-522c-5f2f7089c5d9	Drzava-read	Drzava - branje	f
00030000-5602-980b-1608-b723f088ac40	Drzava-write	Drzava - spreminjanje	f
00030000-5602-980b-1aa1-f72906bcf631	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5602-980b-1c00-08e479c1a857	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5602-980b-6cd4-4e49748a1d6b	Funkcija-read	Funkcija - branje	f
00030000-5602-980b-47bf-e6cec95ce2b5	Funkcija-write	Funkcija - spreminjanje	f
00030000-5602-980b-4cf4-70c6c574bedd	Gostovanje-read	Gostovanje - branje	f
00030000-5602-980b-ed65-1cf96cc5ac45	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5602-980b-614c-33270a567660	Gostujoca-read	Gostujoca - branje	f
00030000-5602-980b-60ac-2681045e9ce6	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5602-980b-dfe3-09c7c2f73d70	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5602-980b-bf66-5eaa66d3eb0b	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5602-980b-03d7-59929e6f2440	Kupec-read	Kupec - branje	f
00030000-5602-980b-74c6-e4f9f28d5286	Kupec-write	Kupec - spreminjanje	f
00030000-5602-980b-31de-115e85014fe0	NacinPlacina-read	NacinPlacina - branje	f
00030000-5602-980b-9cc9-ff58c140e860	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5602-980b-645c-b5a9e7e9df52	Option-read	Option - branje	f
00030000-5602-980b-fc12-76b9e0e4b6c1	Option-write	Option - spreminjanje	f
00030000-5602-980b-0931-2c3db04f0f79	OptionValue-read	OptionValue - branje	f
00030000-5602-980b-63e6-6011ec06bc35	OptionValue-write	OptionValue - spreminjanje	f
00030000-5602-980b-b339-e3d17664f44c	Oseba-read	Oseba - branje	f
00030000-5602-980b-4c5d-e2a637728e1e	Oseba-write	Oseba - spreminjanje	f
00030000-5602-980b-38bc-2eb85b83c4e2	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5602-980b-d814-a17f191a65f1	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5602-980b-c0ac-93a37ad55d7f	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5602-980b-9211-17fea767cab5	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5602-980b-a9a6-3ae78d90a488	Pogodba-read	Pogodba - branje	f
00030000-5602-980b-a2ec-a490d3024d65	Pogodba-write	Pogodba - spreminjanje	f
00030000-5602-980b-240f-1514a39091b3	Popa-read	Popa - branje	f
00030000-5602-980b-ebdc-10f723b2b4db	Popa-write	Popa - spreminjanje	f
00030000-5602-980b-03d8-cd7612d0d252	Posta-read	Posta - branje	f
00030000-5602-980b-0990-6820974e0538	Posta-write	Posta - spreminjanje	f
00030000-5602-980b-42ef-50f1e1e2fac4	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5602-980b-72c5-a1d8e525b54c	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5602-980b-c885-f303608ddd7f	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5602-980b-7ced-ad9a6a7764d5	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5602-980b-531d-841e4df22b59	PostniNaslov-read	PostniNaslov - branje	f
00030000-5602-980b-c226-251810f78b63	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5602-980b-5208-c0909d4fe25b	Predstava-read	Predstava - branje	f
00030000-5602-980b-b6d6-42e192910879	Predstava-write	Predstava - spreminjanje	f
00030000-5602-980b-0d4e-607172ad9ccc	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5602-980b-d58a-439227336096	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5602-980b-3805-6463cab331f4	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5602-980b-63d8-4ca33a88f977	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5602-980b-b605-88560e63147a	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5602-980b-ffda-a167ed7bf1da	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5602-980b-5d9f-a84b78fcff89	ProgramDela-read	ProgramDela - branje	f
00030000-5602-980b-ce82-f231a704cfcc	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5602-980b-6684-fecdd94398bc	ProgramFestival-read	ProgramFestival - branje	f
00030000-5602-980b-8417-2bbfbd4162d6	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5602-980b-36ee-f4ae1542ec4a	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5602-980b-40bf-8cfe095b0d46	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5602-980b-987b-87447edc7de5	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5602-980b-2565-d89d9f027342	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5602-980b-9a0b-6c7b708e0508	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5602-980b-256e-fccfcb9eaf14	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5602-980b-1233-c4f65e52d08a	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5602-980b-7e1b-d59fe9d1aa89	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5602-980b-fb53-98e30722abaf	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5602-980b-1058-d9229ef2a164	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5602-980b-9b0d-559b4dfb765c	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5602-980b-1afc-e0978d4c62c4	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5602-980b-145f-d9292fe8c971	ProgramRazno-read	ProgramRazno - branje	f
00030000-5602-980b-b98e-aa6acd3273cf	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5602-980b-e66a-f177b8101e35	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5602-980b-f164-9d5568b48208	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5602-980b-4372-5806af8ed5f2	Prostor-read	Prostor - branje	f
00030000-5602-980b-330e-12c2f57e6c0b	Prostor-write	Prostor - spreminjanje	f
00030000-5602-980b-3156-533a92adf00c	Racun-read	Racun - branje	f
00030000-5602-980b-e3d7-5c37235df533	Racun-write	Racun - spreminjanje	f
00030000-5602-980b-30e7-9c1b4f49f5c3	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5602-980b-352e-0b2f4d020969	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5602-980b-ac9e-eecd2bb04ebf	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5602-980b-57b9-0b09265db868	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5602-980b-9bb8-49b87eb1437a	Rekvizit-read	Rekvizit - branje	f
00030000-5602-980b-4fff-81561ee345f9	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5602-980b-e936-d4ea1b5af91a	Revizija-read	Revizija - branje	f
00030000-5602-980b-64ec-b5ca49f7c5e4	Revizija-write	Revizija - spreminjanje	f
00030000-5602-980b-021d-d859df21ea57	Rezervacija-read	Rezervacija - branje	f
00030000-5602-980b-d4dc-50159fde406b	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5602-980b-65a6-def13ed9957a	SedezniRed-read	SedezniRed - branje	f
00030000-5602-980b-a3ce-7f5b3bf6471c	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5602-980b-2518-e758b89a2e5a	Sedez-read	Sedez - branje	f
00030000-5602-980b-1e80-05d304e294ef	Sedez-write	Sedez - spreminjanje	f
00030000-5602-980b-d1ad-45720ae677d0	Sezona-read	Sezona - branje	f
00030000-5602-980b-e47a-567e6a07f0a6	Sezona-write	Sezona - spreminjanje	f
00030000-5602-980b-1e26-d60cb20dbf4c	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5602-980b-8d85-e4f9ac4f97e4	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5602-980b-ca7b-53262bb48264	Stevilcenje-read	Stevilcenje - branje	f
00030000-5602-980b-6d7a-3474f91055ce	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5602-980b-79eb-a017a55ac8c7	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5602-980b-1338-88392333fb0e	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5602-980b-8314-2b7b5dfc059c	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5602-980b-a262-15af4c920a59	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5602-980b-3475-23955c39957d	Telefonska-read	Telefonska - branje	f
00030000-5602-980b-09d0-18e89d217605	Telefonska-write	Telefonska - spreminjanje	f
00030000-5602-980b-17d8-839dfc0a2f82	TerminStoritve-read	TerminStoritve - branje	f
00030000-5602-980b-5b61-f9bc36d304d1	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5602-980b-3b44-cef65dddf362	TipFunkcije-read	TipFunkcije - branje	f
00030000-5602-980b-7041-fffe7c54a00c	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5602-980b-28a0-42ed73c843d3	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5602-980b-b967-4b2b7d84db07	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5602-980b-a781-5e469da666f4	Trr-read	Trr - branje	f
00030000-5602-980b-b14c-1ac49f8afa7b	Trr-write	Trr - spreminjanje	f
00030000-5602-980b-c3ae-6c5bab52f3ac	Uprizoritev-read	Uprizoritev - branje	f
00030000-5602-980b-d641-2c7b91a2f79f	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5602-980b-571d-f9c6d703bdc4	Vaja-read	Vaja - branje	f
00030000-5602-980b-21b0-f96bff2e847d	Vaja-write	Vaja - spreminjanje	f
00030000-5602-980b-639f-0fbcad6fe2f7	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5602-980b-4ec0-f0cc63fac21f	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5602-980b-4324-e900ce806c6c	VrstaStroska-read	VrstaStroska - branje	f
00030000-5602-980b-ba93-8a07eb6b3e11	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5602-980b-fa00-80b9a6e82064	Zaposlitev-read	Zaposlitev - branje	f
00030000-5602-980b-3e51-5f30d608cfc7	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5602-980b-3d04-50082f8a8360	Zasedenost-read	Zasedenost - branje	f
00030000-5602-980b-5705-1d2d0faaf542	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5602-980b-8e57-d6be1940e3bd	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5602-980b-8fe6-afabfab41e30	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5602-980b-da10-f2e216dc7dbd	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5602-980b-15f7-cdde952909c3	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5602-980b-61ed-6a536485f1b1	Job-read	Branje opravil - samo zase - branje	f
00030000-5602-980b-ebc1-42cd84ad1675	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5602-980b-c38a-7723d92f1fbf	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5602-980b-6950-dde4d5d9238e	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5602-980b-a2c7-866a9f3f5607	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5602-980b-93f7-f5de769d4d71	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5602-980b-5bba-ff5f0e2d970e	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5602-980b-6b3a-2e991eeee6ee	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5602-980b-9d47-5129ca52981c	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5602-980b-a8b7-4d5330f2be6c	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5602-980b-3ea4-9c5b8cd87bae	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5602-980b-e8f3-419fec6e1b07	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5602-980b-e7c6-af372f55b592	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5602-980b-8b48-68dadec7ccb9	Datoteka-write	Datoteka - spreminjanje	f
00030000-5602-980b-5b01-6081a0a96524	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2974 (class 0 OID 4294682)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5602-980b-6fc6-e0b67a6fd68b	00030000-5602-980b-0ba7-633d52508302
00020000-5602-980b-c245-5a7a0902423d	00030000-5602-980b-522c-5f2f7089c5d9
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-fa83-a36e890c1c3f
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-c853-ac458281bfe7
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-b52a-4bb9e00fe6f6
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-00a6-b519db51c4a2
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-7c10-8e75f3ec96f6
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-dc2e-ea03dc96101e
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-80f3-5683f63d84c0
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-581b-29100d769eb2
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-522c-5f2f7089c5d9
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-1608-b723f088ac40
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-6cd4-4e49748a1d6b
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-47bf-e6cec95ce2b5
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-4cf4-70c6c574bedd
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-ed65-1cf96cc5ac45
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-614c-33270a567660
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-60ac-2681045e9ce6
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-dfe3-09c7c2f73d70
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-bf66-5eaa66d3eb0b
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-645c-b5a9e7e9df52
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-0931-2c3db04f0f79
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-b339-e3d17664f44c
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-4c5d-e2a637728e1e
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-240f-1514a39091b3
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-ebdc-10f723b2b4db
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-03d8-cd7612d0d252
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-0990-6820974e0538
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-531d-841e4df22b59
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-c226-251810f78b63
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-5208-c0909d4fe25b
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-b6d6-42e192910879
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-b605-88560e63147a
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-ffda-a167ed7bf1da
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-4372-5806af8ed5f2
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-330e-12c2f57e6c0b
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-ac9e-eecd2bb04ebf
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-57b9-0b09265db868
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-9bb8-49b87eb1437a
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-4fff-81561ee345f9
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-d1ad-45720ae677d0
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-e47a-567e6a07f0a6
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-3b44-cef65dddf362
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-c3ae-6c5bab52f3ac
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-d641-2c7b91a2f79f
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-571d-f9c6d703bdc4
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-21b0-f96bff2e847d
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-3d04-50082f8a8360
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-5705-1d2d0faaf542
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-8e57-d6be1940e3bd
00020000-5602-980b-e9b4-57e62a02be43	00030000-5602-980b-da10-f2e216dc7dbd
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-fa83-a36e890c1c3f
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-7c10-8e75f3ec96f6
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-dc2e-ea03dc96101e
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-522c-5f2f7089c5d9
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-4cf4-70c6c574bedd
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-614c-33270a567660
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-dfe3-09c7c2f73d70
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-bf66-5eaa66d3eb0b
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-645c-b5a9e7e9df52
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-0931-2c3db04f0f79
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-b339-e3d17664f44c
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-4c5d-e2a637728e1e
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-240f-1514a39091b3
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-03d8-cd7612d0d252
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-531d-841e4df22b59
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-c226-251810f78b63
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-5208-c0909d4fe25b
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-4372-5806af8ed5f2
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-ac9e-eecd2bb04ebf
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-9bb8-49b87eb1437a
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-d1ad-45720ae677d0
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-3475-23955c39957d
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-09d0-18e89d217605
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-a781-5e469da666f4
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-b14c-1ac49f8afa7b
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-fa00-80b9a6e82064
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-3e51-5f30d608cfc7
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-8e57-d6be1940e3bd
00020000-5602-980b-56da-3711a5127689	00030000-5602-980b-da10-f2e216dc7dbd
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-fa83-a36e890c1c3f
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-b52a-4bb9e00fe6f6
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-7c10-8e75f3ec96f6
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-baf8-f31e32beeaf0
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-595f-0a89f1c18aa1
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-b127-bd9f99a8a2fe
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-dc2e-ea03dc96101e
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-522c-5f2f7089c5d9
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-6cd4-4e49748a1d6b
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-4cf4-70c6c574bedd
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-614c-33270a567660
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-dfe3-09c7c2f73d70
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-645c-b5a9e7e9df52
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-0931-2c3db04f0f79
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-b339-e3d17664f44c
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-240f-1514a39091b3
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-03d8-cd7612d0d252
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-5208-c0909d4fe25b
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-b605-88560e63147a
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-4372-5806af8ed5f2
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-ac9e-eecd2bb04ebf
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-9bb8-49b87eb1437a
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-d1ad-45720ae677d0
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-3b44-cef65dddf362
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-571d-f9c6d703bdc4
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-3d04-50082f8a8360
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-8e57-d6be1940e3bd
00020000-5602-980b-3101-7f9d6c8c9712	00030000-5602-980b-da10-f2e216dc7dbd
00020000-5602-980b-ec76-fe0d20bde162	00030000-5602-980b-fa83-a36e890c1c3f
00020000-5602-980b-ec76-fe0d20bde162	00030000-5602-980b-c853-ac458281bfe7
00020000-5602-980b-ec76-fe0d20bde162	00030000-5602-980b-00a6-b519db51c4a2
00020000-5602-980b-ec76-fe0d20bde162	00030000-5602-980b-7c10-8e75f3ec96f6
00020000-5602-980b-ec76-fe0d20bde162	00030000-5602-980b-dc2e-ea03dc96101e
00020000-5602-980b-ec76-fe0d20bde162	00030000-5602-980b-522c-5f2f7089c5d9
00020000-5602-980b-ec76-fe0d20bde162	00030000-5602-980b-4cf4-70c6c574bedd
00020000-5602-980b-ec76-fe0d20bde162	00030000-5602-980b-614c-33270a567660
00020000-5602-980b-ec76-fe0d20bde162	00030000-5602-980b-645c-b5a9e7e9df52
00020000-5602-980b-ec76-fe0d20bde162	00030000-5602-980b-0931-2c3db04f0f79
00020000-5602-980b-ec76-fe0d20bde162	00030000-5602-980b-240f-1514a39091b3
00020000-5602-980b-ec76-fe0d20bde162	00030000-5602-980b-03d8-cd7612d0d252
00020000-5602-980b-ec76-fe0d20bde162	00030000-5602-980b-5208-c0909d4fe25b
00020000-5602-980b-ec76-fe0d20bde162	00030000-5602-980b-4372-5806af8ed5f2
00020000-5602-980b-ec76-fe0d20bde162	00030000-5602-980b-ac9e-eecd2bb04ebf
00020000-5602-980b-ec76-fe0d20bde162	00030000-5602-980b-9bb8-49b87eb1437a
00020000-5602-980b-ec76-fe0d20bde162	00030000-5602-980b-d1ad-45720ae677d0
00020000-5602-980b-ec76-fe0d20bde162	00030000-5602-980b-3b44-cef65dddf362
00020000-5602-980b-ec76-fe0d20bde162	00030000-5602-980b-8e57-d6be1940e3bd
00020000-5602-980b-ec76-fe0d20bde162	00030000-5602-980b-da10-f2e216dc7dbd
00020000-5602-980b-3075-4034ae87a847	00030000-5602-980b-fa83-a36e890c1c3f
00020000-5602-980b-3075-4034ae87a847	00030000-5602-980b-7c10-8e75f3ec96f6
00020000-5602-980b-3075-4034ae87a847	00030000-5602-980b-dc2e-ea03dc96101e
00020000-5602-980b-3075-4034ae87a847	00030000-5602-980b-522c-5f2f7089c5d9
00020000-5602-980b-3075-4034ae87a847	00030000-5602-980b-4cf4-70c6c574bedd
00020000-5602-980b-3075-4034ae87a847	00030000-5602-980b-614c-33270a567660
00020000-5602-980b-3075-4034ae87a847	00030000-5602-980b-645c-b5a9e7e9df52
00020000-5602-980b-3075-4034ae87a847	00030000-5602-980b-0931-2c3db04f0f79
00020000-5602-980b-3075-4034ae87a847	00030000-5602-980b-240f-1514a39091b3
00020000-5602-980b-3075-4034ae87a847	00030000-5602-980b-03d8-cd7612d0d252
00020000-5602-980b-3075-4034ae87a847	00030000-5602-980b-5208-c0909d4fe25b
00020000-5602-980b-3075-4034ae87a847	00030000-5602-980b-4372-5806af8ed5f2
00020000-5602-980b-3075-4034ae87a847	00030000-5602-980b-ac9e-eecd2bb04ebf
00020000-5602-980b-3075-4034ae87a847	00030000-5602-980b-9bb8-49b87eb1437a
00020000-5602-980b-3075-4034ae87a847	00030000-5602-980b-d1ad-45720ae677d0
00020000-5602-980b-3075-4034ae87a847	00030000-5602-980b-17d8-839dfc0a2f82
00020000-5602-980b-3075-4034ae87a847	00030000-5602-980b-a34e-30158ea0cfe8
00020000-5602-980b-3075-4034ae87a847	00030000-5602-980b-3b44-cef65dddf362
00020000-5602-980b-3075-4034ae87a847	00030000-5602-980b-8e57-d6be1940e3bd
00020000-5602-980b-3075-4034ae87a847	00030000-5602-980b-da10-f2e216dc7dbd
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-fcbf-1578775db80c
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-0ba7-633d52508302
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-a34e-30158ea0cfe8
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-80f3-5683f63d84c0
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-c10b-8fefc5c0cc63
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-ecac-a2b25876acf6
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-3520-e59e7b45c1ba
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-fa83-a36e890c1c3f
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-c853-ac458281bfe7
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-b52a-4bb9e00fe6f6
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-00a6-b519db51c4a2
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-7c10-8e75f3ec96f6
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-baf8-f31e32beeaf0
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-595f-0a89f1c18aa1
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-0cb3-b33dc84a2a7f
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-b127-bd9f99a8a2fe
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-93ec-eecce49b08c4
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-dc2e-ea03dc96101e
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-581b-29100d769eb2
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-522c-5f2f7089c5d9
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-1608-b723f088ac40
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-0b5b-57ed1ee3d68f
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-f97b-280a459df21f
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-1aa1-f72906bcf631
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-1c00-08e479c1a857
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-6cd4-4e49748a1d6b
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-47bf-e6cec95ce2b5
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-4cf4-70c6c574bedd
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-ed65-1cf96cc5ac45
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-614c-33270a567660
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-60ac-2681045e9ce6
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-dfe3-09c7c2f73d70
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-bf66-5eaa66d3eb0b
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-03d7-59929e6f2440
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-74c6-e4f9f28d5286
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-31de-115e85014fe0
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-9cc9-ff58c140e860
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-645c-b5a9e7e9df52
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-fc12-76b9e0e4b6c1
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-0931-2c3db04f0f79
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-63e6-6011ec06bc35
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-b339-e3d17664f44c
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-4c5d-e2a637728e1e
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-38bc-2eb85b83c4e2
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-d814-a17f191a65f1
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-c0ac-93a37ad55d7f
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-9211-17fea767cab5
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-a9a6-3ae78d90a488
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-a2ec-a490d3024d65
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-240f-1514a39091b3
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-ebdc-10f723b2b4db
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-03d8-cd7612d0d252
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-0990-6820974e0538
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-42ef-50f1e1e2fac4
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-72c5-a1d8e525b54c
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-c885-f303608ddd7f
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-7ced-ad9a6a7764d5
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-531d-841e4df22b59
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-c226-251810f78b63
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-5208-c0909d4fe25b
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-b6d6-42e192910879
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-0d4e-607172ad9ccc
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-d58a-439227336096
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-3805-6463cab331f4
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-63d8-4ca33a88f977
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-b605-88560e63147a
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-ffda-a167ed7bf1da
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-5d9f-a84b78fcff89
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-ce82-f231a704cfcc
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-6684-fecdd94398bc
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-8417-2bbfbd4162d6
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-36ee-f4ae1542ec4a
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-40bf-8cfe095b0d46
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-987b-87447edc7de5
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-2565-d89d9f027342
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-9a0b-6c7b708e0508
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-256e-fccfcb9eaf14
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-1233-c4f65e52d08a
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-7e1b-d59fe9d1aa89
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-fb53-98e30722abaf
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-1058-d9229ef2a164
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-9b0d-559b4dfb765c
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-1afc-e0978d4c62c4
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-145f-d9292fe8c971
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-b98e-aa6acd3273cf
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-e66a-f177b8101e35
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-f164-9d5568b48208
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-4372-5806af8ed5f2
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-330e-12c2f57e6c0b
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-3156-533a92adf00c
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-e3d7-5c37235df533
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-30e7-9c1b4f49f5c3
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-352e-0b2f4d020969
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-ac9e-eecd2bb04ebf
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-57b9-0b09265db868
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-9bb8-49b87eb1437a
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-4fff-81561ee345f9
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-e936-d4ea1b5af91a
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-64ec-b5ca49f7c5e4
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-021d-d859df21ea57
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-d4dc-50159fde406b
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-65a6-def13ed9957a
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-a3ce-7f5b3bf6471c
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-2518-e758b89a2e5a
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-1e80-05d304e294ef
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-d1ad-45720ae677d0
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-e47a-567e6a07f0a6
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-1e26-d60cb20dbf4c
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-8d85-e4f9ac4f97e4
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-ca7b-53262bb48264
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-6d7a-3474f91055ce
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-79eb-a017a55ac8c7
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-1338-88392333fb0e
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-8314-2b7b5dfc059c
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-a262-15af4c920a59
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-3475-23955c39957d
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-09d0-18e89d217605
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-17d8-839dfc0a2f82
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-5b61-f9bc36d304d1
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-3b44-cef65dddf362
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-7041-fffe7c54a00c
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-28a0-42ed73c843d3
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-b967-4b2b7d84db07
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-a781-5e469da666f4
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-b14c-1ac49f8afa7b
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-c3ae-6c5bab52f3ac
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-d641-2c7b91a2f79f
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-571d-f9c6d703bdc4
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-21b0-f96bff2e847d
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-639f-0fbcad6fe2f7
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-4ec0-f0cc63fac21f
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-4324-e900ce806c6c
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-ba93-8a07eb6b3e11
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-fa00-80b9a6e82064
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-3e51-5f30d608cfc7
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-3d04-50082f8a8360
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-5705-1d2d0faaf542
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-8e57-d6be1940e3bd
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-8fe6-afabfab41e30
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-da10-f2e216dc7dbd
00020000-5602-980c-bb74-00a627d7e750	00030000-5602-980b-15f7-cdde952909c3
\.


--
-- TOC entry 3004 (class 0 OID 4295026)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 4294984)
-- Dependencies: 205
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 4295126)
-- Dependencies: 220
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5602-980c-a2fa-94e98c8cb297	00090000-5602-980c-25b3-dba64c849c09	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-5602-980c-a566-e30fbbf9438d	00090000-5602-980c-5b89-816022c29c4c	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-5602-980c-f117-f534a4b4508e	00090000-5602-980c-ddad-b9595b090961	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	\N	f	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-5602-980c-99b5-583d200bb4ee	00090000-5602-980c-f5bd-61b5c2904e77	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	\N	f	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2977 (class 0 OID 4294707)
-- Dependencies: 182
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5602-980c-0927-354d528ffffc	00040000-5602-980a-04e9-d1b1722d8332	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-980c-d3ab-7fd97d1cdf65	00040000-5602-980a-04e9-d1b1722d8332	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5602-980c-c7db-d12911a15d7e	00040000-5602-980a-04e9-d1b1722d8332	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-980c-29fd-0163c7ceff49	00040000-5602-980a-04e9-d1b1722d8332	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-980c-62c4-0b6fb3e5c5ae	00040000-5602-980a-04e9-d1b1722d8332	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-980c-14f9-cc427abe994b	00040000-5602-980a-fabc-5333bcc2adcd	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-980c-46c3-3cad8fb5a40e	00040000-5602-980a-e2b9-0c19ac759da4	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-980c-0a01-a51da79d58a1	00040000-5602-980a-297f-d9ac3b509463	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-980c-5816-e7c69efe5a89	00040000-5602-980a-1c1e-405e92768f9f	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-980e-2642-8cb20e75a6e3	00040000-5602-980a-04e9-d1b1722d8332	1001	AK	Mestno gledališče XYZ		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2985 (class 0 OID 4294828)
-- Dependencies: 190
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5602-980a-d713-f626f467d82f	8341	Adlešiči
00050000-5602-980a-d26c-8efaaa6feb62	5270	Ajdovščina
00050000-5602-980a-d607-3cd5c06db016	6280	Ankaran/Ancarano
00050000-5602-980a-e6f4-764ab40618bb	9253	Apače
00050000-5602-980a-a671-ad7f778e065d	8253	Artiče
00050000-5602-980a-f213-6531493f1504	4275	Begunje na Gorenjskem
00050000-5602-980a-5722-a36f63100b9c	1382	Begunje pri Cerknici
00050000-5602-980a-77c8-c746c65d448d	9231	Beltinci
00050000-5602-980a-20b1-c317e45fbf8e	2234	Benedikt
00050000-5602-980a-305a-e7ef3a76f2df	2345	Bistrica ob Dravi
00050000-5602-980a-bf00-ec21e365260b	3256	Bistrica ob Sotli
00050000-5602-980a-62be-5cea9a8c9693	8259	Bizeljsko
00050000-5602-980a-eadb-d68eafca6e8e	1223	Blagovica
00050000-5602-980a-1034-51dc3b355f7e	8283	Blanca
00050000-5602-980a-5492-9c481f698d9f	4260	Bled
00050000-5602-980a-dbba-e2fa95b4bdaa	4273	Blejska Dobrava
00050000-5602-980a-48a0-1bc326dee022	9265	Bodonci
00050000-5602-980a-4569-eb49d617f7e3	9222	Bogojina
00050000-5602-980a-69e7-186d068a6e95	4263	Bohinjska Bela
00050000-5602-980a-6880-6e8d18f9274e	4264	Bohinjska Bistrica
00050000-5602-980a-4ca2-941827674fbe	4265	Bohinjsko jezero
00050000-5602-980a-a998-1100167f46e7	1353	Borovnica
00050000-5602-980a-84e7-73edd2e03b0d	8294	Boštanj
00050000-5602-980a-f3ac-8d41d0934e4f	5230	Bovec
00050000-5602-980a-4fba-96d25ac70ff3	5295	Branik
00050000-5602-980a-f60f-cba2fcbf38d7	3314	Braslovče
00050000-5602-980a-2720-d558dce24099	5223	Breginj
00050000-5602-980a-d764-88a8fa212de6	8280	Brestanica
00050000-5602-980a-15a9-33f61da86e0f	2354	Bresternica
00050000-5602-980a-f734-aa97cc7e0e46	4243	Brezje
00050000-5602-980a-27e7-46e474e85f1f	1351	Brezovica pri Ljubljani
00050000-5602-980a-e485-cb9f7e5a62c9	8250	Brežice
00050000-5602-980a-3e17-905371427072	4210	Brnik - Aerodrom
00050000-5602-980a-e860-f94ac6602816	8321	Brusnice
00050000-5602-980a-920c-025f45c80f9a	3255	Buče
00050000-5602-980a-48cb-c8a3bb24667c	8276	Bučka 
00050000-5602-980a-128e-c2d82a3b5847	9261	Cankova
00050000-5602-980a-b9aa-5aa06dd3fe27	3000	Celje 
00050000-5602-980a-173b-5ff6ebe2368d	3001	Celje - poštni predali
00050000-5602-980a-7f6c-a358e89e2e2a	4207	Cerklje na Gorenjskem
00050000-5602-980a-2877-eeef7689c2f4	8263	Cerklje ob Krki
00050000-5602-980a-613f-57b714c409de	1380	Cerknica
00050000-5602-980a-0637-0ed7a4eb784a	5282	Cerkno
00050000-5602-980a-84e1-96631aca6ce1	2236	Cerkvenjak
00050000-5602-980a-c19f-454373ae5c69	2215	Ceršak
00050000-5602-980a-70d4-3254790de142	2326	Cirkovce
00050000-5602-980a-8452-ed3a31bbcdd2	2282	Cirkulane
00050000-5602-980a-1f34-91b5170b2d38	5273	Col
00050000-5602-980a-8422-f27bee697e20	8251	Čatež ob Savi
00050000-5602-980a-cd2d-1e0a961aa559	1413	Čemšenik
00050000-5602-980a-5ccb-6258dd07e172	5253	Čepovan
00050000-5602-980a-6bd7-6275cf331e54	9232	Črenšovci
00050000-5602-980a-aa7d-3833a020cbb8	2393	Črna na Koroškem
00050000-5602-980a-6721-bde6fbd0c8f1	6275	Črni Kal
00050000-5602-980a-9cc3-33ce66321fa8	5274	Črni Vrh nad Idrijo
00050000-5602-980a-d8b4-216e6ab963bb	5262	Črniče
00050000-5602-980a-de37-9e9d04a2a0cc	8340	Črnomelj
00050000-5602-980a-0888-c5919ea8dc61	6271	Dekani
00050000-5602-980a-585a-b1be7ecd4c72	5210	Deskle
00050000-5602-980a-bec9-b3fa348950f5	2253	Destrnik
00050000-5602-980a-3092-fa38e1ad9ddd	6215	Divača
00050000-5602-980a-08f4-eab2d206572a	1233	Dob
00050000-5602-980a-cfc4-e2ec24e9a356	3224	Dobje pri Planini
00050000-5602-980a-267e-03886c9ba840	8257	Dobova
00050000-5602-980a-9c5d-1655a5d23ef8	1423	Dobovec
00050000-5602-980a-2b2a-ca1c877759f5	5263	Dobravlje
00050000-5602-980a-3f4b-26dc11b7a6f8	3204	Dobrna
00050000-5602-980a-47dd-615142b6197e	8211	Dobrnič
00050000-5602-980a-3aef-2db30937b607	1356	Dobrova
00050000-5602-980a-4654-56f06edf4e40	9223	Dobrovnik/Dobronak 
00050000-5602-980a-1fea-ebd1d8544bc5	5212	Dobrovo v Brdih
00050000-5602-980a-0d99-2521928eb031	1431	Dol pri Hrastniku
00050000-5602-980a-7b85-420731792f24	1262	Dol pri Ljubljani
00050000-5602-980a-137c-3d0097ee3908	1273	Dole pri Litiji
00050000-5602-980a-d9a0-ef6215f72bdd	1331	Dolenja vas
00050000-5602-980a-645a-d612c365f8dc	8350	Dolenjske Toplice
00050000-5602-980a-76e8-91848b601ab0	1230	Domžale
00050000-5602-980a-0ae3-60a176badc74	2252	Dornava
00050000-5602-980a-a037-355ee5d602da	5294	Dornberk
00050000-5602-980a-7eed-c533f62c87c9	1319	Draga
00050000-5602-980a-0fdc-4a8720ef850d	8343	Dragatuš
00050000-5602-980a-a95a-0b2b60f819c7	3222	Dramlje
00050000-5602-980a-48db-e6fea2349ed1	2370	Dravograd
00050000-5602-980a-186e-0ff3ddbec9e4	4203	Duplje
00050000-5602-980a-0cdf-8e803b205bab	6221	Dutovlje
00050000-5602-980a-2753-e9e211637fd5	8361	Dvor
00050000-5602-980a-7b45-287ab7ddf152	2343	Fala
00050000-5602-980a-a277-459f7ab8192e	9208	Fokovci
00050000-5602-980a-fd43-b14953fa9461	2313	Fram
00050000-5602-980a-971e-5a73c748dbd2	3213	Frankolovo
00050000-5602-980a-ce36-71cf032925fb	1274	Gabrovka
00050000-5602-980a-37fa-96a3c9a91f81	8254	Globoko
00050000-5602-980a-4235-f3b0e81baaf3	5275	Godovič
00050000-5602-980a-98b7-977adf5af6a3	4204	Golnik
00050000-5602-980a-96c2-5cfe7086b575	3303	Gomilsko
00050000-5602-980a-1611-87e519e1fca8	4224	Gorenja vas
00050000-5602-980a-50d3-ce45bf0f6fe2	3263	Gorica pri Slivnici
00050000-5602-980a-da1b-7cc849ca22b6	2272	Gorišnica
00050000-5602-980a-935b-c535b0881b13	9250	Gornja Radgona
00050000-5602-980a-d1a4-887fe39e7cd6	3342	Gornji Grad
00050000-5602-980a-c64b-23fc6e636d0c	4282	Gozd Martuljek
00050000-5602-980a-a648-fd86f4531ede	6272	Gračišče
00050000-5602-980a-7fd0-fcbc369594ef	9264	Grad
00050000-5602-980a-b45b-d51b63e77173	8332	Gradac
00050000-5602-980a-0111-b9eeee33108c	1384	Grahovo
00050000-5602-980a-39e4-5d1bfacb9e09	5242	Grahovo ob Bači
00050000-5602-980a-ca0a-472c3555e3ab	5251	Grgar
00050000-5602-980a-783c-742e644818ef	3302	Griže
00050000-5602-980a-8feb-672e379a5fa9	3231	Grobelno
00050000-5602-980a-b912-7c685d8678a7	1290	Grosuplje
00050000-5602-980a-5882-59869104cb00	2288	Hajdina
00050000-5602-980a-82ce-20e5d4387ce8	8362	Hinje
00050000-5602-980a-4e2c-6bd45aa3c023	2311	Hoče
00050000-5602-980a-1b64-b2e225492a13	9205	Hodoš/Hodos
00050000-5602-980a-d576-58a8fa620ed5	1354	Horjul
00050000-5602-980a-e8f0-4ecfe4615f19	1372	Hotedršica
00050000-5602-980a-296c-f5bdaa9b88db	1430	Hrastnik
00050000-5602-980a-d777-64aa191781a1	6225	Hruševje
00050000-5602-980a-ede1-3373a13019a7	4276	Hrušica
00050000-5602-980a-0a28-651d9dfa850f	5280	Idrija
00050000-5602-980a-cc80-17f18ba09018	1292	Ig
00050000-5602-980a-5e4f-7cadb169d0d4	6250	Ilirska Bistrica
00050000-5602-980a-6299-3461eeae00e4	6251	Ilirska Bistrica-Trnovo
00050000-5602-980a-8071-2f3fcc22ec61	1295	Ivančna Gorica
00050000-5602-980a-12f4-372304e6e349	2259	Ivanjkovci
00050000-5602-980a-6e45-c19f9bb0fc0e	1411	Izlake
00050000-5602-980a-70af-f41ffd36cfb0	6310	Izola/Isola
00050000-5602-980a-f9e5-7b732d7171d1	2222	Jakobski Dol
00050000-5602-980a-a61a-f314e661a1d8	2221	Jarenina
00050000-5602-980a-c7f3-41efe5a29969	6254	Jelšane
00050000-5602-980a-b6e5-e23f8a74215e	4270	Jesenice
00050000-5602-980a-08d5-c842d3c042c1	8261	Jesenice na Dolenjskem
00050000-5602-980a-69bc-f2b7d5434e19	3273	Jurklošter
00050000-5602-980a-49ca-bea62d78b5bc	2223	Jurovski Dol
00050000-5602-980a-d45e-47016215a312	2256	Juršinci
00050000-5602-980a-b8a7-b10bfc4830a4	5214	Kal nad Kanalom
00050000-5602-980a-ab3c-cee13a6bef59	3233	Kalobje
00050000-5602-980a-d739-73115bd76a23	4246	Kamna Gorica
00050000-5602-980a-c229-db82cf61bc84	2351	Kamnica
00050000-5602-980a-2354-dd33e67b6fe2	1241	Kamnik
00050000-5602-980a-bcbf-8be38ea48539	5213	Kanal
00050000-5602-980a-9c9b-7431d7f81afe	8258	Kapele
00050000-5602-980a-4c19-742b9a65160f	2362	Kapla
00050000-5602-980a-02d0-9e4639383c1f	2325	Kidričevo
00050000-5602-980a-3cca-d677c7c3b991	1412	Kisovec
00050000-5602-980a-b421-efb90261d4f7	6253	Knežak
00050000-5602-980a-83dd-2d41555c5a21	5222	Kobarid
00050000-5602-980a-62e8-3d988312d94c	9227	Kobilje
00050000-5602-980a-0078-262928cdbbb2	1330	Kočevje
00050000-5602-980a-bd86-10f821047f75	1338	Kočevska Reka
00050000-5602-980a-a2ed-c31db6f6653d	2276	Kog
00050000-5602-980a-77d8-4ec7d84571d8	5211	Kojsko
00050000-5602-980a-20a4-fb2dc3ec3454	6223	Komen
00050000-5602-980a-52fe-36352b879291	1218	Komenda
00050000-5602-980a-5365-86818e4bc5cb	6000	Koper/Capodistria 
00050000-5602-980a-130e-c484954c6f32	6001	Koper/Capodistria - poštni predali
00050000-5602-980a-da68-2a3e38cef684	8282	Koprivnica
00050000-5602-980a-27a3-93784fd0e4dc	5296	Kostanjevica na Krasu
00050000-5602-980a-2f37-b65d40046604	8311	Kostanjevica na Krki
00050000-5602-980a-8ccf-04645d71f983	1336	Kostel
00050000-5602-980a-6b82-a3a2dc19fe22	6256	Košana
00050000-5602-980a-4d48-c670d0e87c7e	2394	Kotlje
00050000-5602-980a-a118-854bdbc202bf	6240	Kozina
00050000-5602-980a-d7e7-eb4bcb294685	3260	Kozje
00050000-5602-980a-aae2-8c74bf2473a0	4000	Kranj 
00050000-5602-980a-fee7-669b8a7f1476	4001	Kranj - poštni predali
00050000-5602-980a-0b8e-05f5a0ae5a91	4280	Kranjska Gora
00050000-5602-980a-54d1-3a993e49ba3c	1281	Kresnice
00050000-5602-980a-4e25-b3d2cb9154a6	4294	Križe
00050000-5602-980a-f35b-815d182204a2	9206	Križevci
00050000-5602-980a-4f2e-9a688e4c855e	9242	Križevci pri Ljutomeru
00050000-5602-980a-ab1e-de34f66cbec5	1301	Krka
00050000-5602-980a-2bc0-770af39ce6e4	8296	Krmelj
00050000-5602-980a-5062-629959889791	4245	Kropa
00050000-5602-980a-1044-f89b762d7185	8262	Krška vas
00050000-5602-980a-f8ac-bcc40731b0ac	8270	Krško
00050000-5602-980a-1501-d4ba3f92a907	9263	Kuzma
00050000-5602-980a-43f8-5aef864ae640	2318	Laporje
00050000-5602-980a-3870-e3c0fb1e816a	3270	Laško
00050000-5602-980a-ed2a-27750b20e427	1219	Laze v Tuhinju
00050000-5602-980a-b9be-78181cdb6e60	2230	Lenart v Slovenskih goricah
00050000-5602-980a-85b8-3a8612dacd6e	9220	Lendava/Lendva
00050000-5602-980a-26b2-fbf645071d2c	4248	Lesce
00050000-5602-980a-5dd0-3d8cc22013fa	3261	Lesično
00050000-5602-980a-6d10-1d0725753f0a	8273	Leskovec pri Krškem
00050000-5602-980a-8faf-2f5d881bee81	2372	Libeliče
00050000-5602-980a-8db9-3117f751f42f	2341	Limbuš
00050000-5602-980a-680e-6af4dd6f40f3	1270	Litija
00050000-5602-980a-82fd-a7b2e164bccf	3202	Ljubečna
00050000-5602-980a-fec7-84dcadcb6e94	1000	Ljubljana 
00050000-5602-980a-6736-08484e69d5d8	1001	Ljubljana - poštni predali
00050000-5602-980a-6d76-cda141d07d11	1231	Ljubljana - Črnuče
00050000-5602-980a-26ff-9ab890dcddbd	1261	Ljubljana - Dobrunje
00050000-5602-980a-c98f-d41976a6ee66	1260	Ljubljana - Polje
00050000-5602-980a-c5a6-357eb27be52b	1210	Ljubljana - Šentvid
00050000-5602-980a-2187-0259597f75f6	1211	Ljubljana - Šmartno
00050000-5602-980a-88d9-1122b55d6fea	3333	Ljubno ob Savinji
00050000-5602-980a-4c9a-828b972516c0	9240	Ljutomer
00050000-5602-980a-c9bd-3f17d08eaeb3	3215	Loče
00050000-5602-980a-f3f4-c3d83e897f1b	5231	Log pod Mangartom
00050000-5602-980a-6fd1-5f84e18677d0	1358	Log pri Brezovici
00050000-5602-980a-7563-e6fbe889987f	1370	Logatec
00050000-5602-980a-79e6-fdf61f35b463	1371	Logatec
00050000-5602-980a-e7ca-17bf17a69c18	1434	Loka pri Zidanem Mostu
00050000-5602-980a-9f9d-f02a6e58eb6d	3223	Loka pri Žusmu
00050000-5602-980a-e4c8-0c18cad5c8b4	6219	Lokev
00050000-5602-980a-a6b6-4b93fcf22b7e	1318	Loški Potok
00050000-5602-980a-12b5-fcfbaeb572f7	2324	Lovrenc na Dravskem polju
00050000-5602-980a-e755-1a01122bfff1	2344	Lovrenc na Pohorju
00050000-5602-980a-580b-3e679ce606cc	3334	Luče
00050000-5602-980a-0d8d-6aff65841582	1225	Lukovica
00050000-5602-980a-7f69-83313157cfb6	9202	Mačkovci
00050000-5602-980a-6c34-7dbd3c183774	2322	Majšperk
00050000-5602-980a-b4e8-7d89442bd901	2321	Makole
00050000-5602-980a-836f-319fed740b52	9243	Mala Nedelja
00050000-5602-980a-5e6f-209aa40a429b	2229	Malečnik
00050000-5602-980a-89f2-7ec5d233dc76	6273	Marezige
00050000-5602-980a-4d6b-12f627987d79	2000	Maribor 
00050000-5602-980a-2622-493750194316	2001	Maribor - poštni predali
00050000-5602-980a-1967-c27f4caed1b5	2206	Marjeta na Dravskem polju
00050000-5602-980a-707f-fb974bf7f2e4	2281	Markovci
00050000-5602-980a-75f3-540ae371b7a0	9221	Martjanci
00050000-5602-980a-ceb4-628bdee8995c	6242	Materija
00050000-5602-980a-8360-e1eb8d1cb615	4211	Mavčiče
00050000-5602-980a-3ded-9cb699175e8e	1215	Medvode
00050000-5602-980a-0510-9db4543b9cb3	1234	Mengeš
00050000-5602-980a-2b1e-c2f29e648c21	8330	Metlika
00050000-5602-980a-bddf-21fd7bbff6bd	2392	Mežica
00050000-5602-980a-ceb2-6a5430466ab7	2204	Miklavž na Dravskem polju
00050000-5602-980a-fedb-b7c3b8ad071c	2275	Miklavž pri Ormožu
00050000-5602-980a-f5ec-d143e18614ac	5291	Miren
00050000-5602-980a-b83c-18dcc96f230d	8233	Mirna
00050000-5602-980a-61eb-9e069cd51352	8216	Mirna Peč
00050000-5602-980a-19fa-9f8968719278	2382	Mislinja
00050000-5602-980a-8fb3-db8dc02bab07	4281	Mojstrana
00050000-5602-980a-190d-20469e07f6b7	8230	Mokronog
00050000-5602-980a-5635-c8f498ef83de	1251	Moravče
00050000-5602-980a-4070-dee37df2ddd7	9226	Moravske Toplice
00050000-5602-980a-d935-42848bfc15da	5216	Most na Soči
00050000-5602-980a-a742-600e9faabd21	1221	Motnik
00050000-5602-980a-34f8-8aaf39e3d2a8	3330	Mozirje
00050000-5602-980a-7270-12b4e969d4bf	9000	Murska Sobota 
00050000-5602-980a-f38c-9e7e25734775	9001	Murska Sobota - poštni predali
00050000-5602-980a-857b-9e23763fe192	2366	Muta
00050000-5602-980a-5291-6cd0c9b57638	4202	Naklo
00050000-5602-980a-21b0-04ad745009c9	3331	Nazarje
00050000-5602-980a-c124-e02025ce0477	1357	Notranje Gorice
00050000-5602-980a-d61c-7f8af6e465c5	3203	Nova Cerkev
00050000-5602-980a-0537-a5e9584e0272	5000	Nova Gorica 
00050000-5602-980a-9c37-1126a162f8d3	5001	Nova Gorica - poštni predali
00050000-5602-980a-0891-85a38ca2c910	1385	Nova vas
00050000-5602-980a-ea96-3665c1d36733	8000	Novo mesto
00050000-5602-980a-811c-02b3fd7b51e1	8001	Novo mesto - poštni predali
00050000-5602-980a-829a-aa9f2e7395dc	6243	Obrov
00050000-5602-980a-3179-595aab3e2fa2	9233	Odranci
00050000-5602-980a-da47-a4c01f9067de	2317	Oplotnica
00050000-5602-980a-efa1-281f38dc607f	2312	Orehova vas
00050000-5602-980a-0b77-f41dc59728ac	2270	Ormož
00050000-5602-980a-a2d8-a155b400f4e3	1316	Ortnek
00050000-5602-980a-fdb0-844bf4ac6b07	1337	Osilnica
00050000-5602-980a-8cad-f6b5b1812d35	8222	Otočec
00050000-5602-980a-1685-f4e548f68199	2361	Ožbalt
00050000-5602-980a-90cd-4602db7d8cfb	2231	Pernica
00050000-5602-980a-07ee-41129f2b048a	2211	Pesnica pri Mariboru
00050000-5602-980a-fbe6-543978e9d863	9203	Petrovci
00050000-5602-980a-ebd3-7e070bebc84f	3301	Petrovče
00050000-5602-980a-51fa-3908551b608a	6330	Piran/Pirano
00050000-5602-980a-519a-2c14319edc57	8255	Pišece
00050000-5602-980a-64c8-6ff2e75d545b	6257	Pivka
00050000-5602-980a-9e65-f6c118a0e853	6232	Planina
00050000-5602-980a-ab4c-751ce25a8920	3225	Planina pri Sevnici
00050000-5602-980a-2723-852b2b2a2b62	6276	Pobegi
00050000-5602-980a-8d73-c78b1d3f3dec	8312	Podbočje
00050000-5602-980a-7091-b2d79ecab755	5243	Podbrdo
00050000-5602-980a-67c5-2b701f75d1eb	3254	Podčetrtek
00050000-5602-980a-d466-9bae710d8341	2273	Podgorci
00050000-5602-980a-f136-c90dbc35ac01	6216	Podgorje
00050000-5602-980a-a750-be5901fc669d	2381	Podgorje pri Slovenj Gradcu
00050000-5602-980a-2ece-b51e2b770c62	6244	Podgrad
00050000-5602-980a-c9bb-d3b6a2a4ccf4	1414	Podkum
00050000-5602-980a-edb7-fc8635a1e227	2286	Podlehnik
00050000-5602-980a-dd49-02a12d53dc33	5272	Podnanos
00050000-5602-980a-0af9-920e33fcc266	4244	Podnart
00050000-5602-980a-32d9-2ebefa9dbe12	3241	Podplat
00050000-5602-980a-cd97-1b9d6b522aae	3257	Podsreda
00050000-5602-980a-6a3e-ba7b069e9592	2363	Podvelka
00050000-5602-980a-c982-4d174c28f0b3	2208	Pohorje
00050000-5602-980a-cf97-2058ca918251	2257	Polenšak
00050000-5602-980a-7519-235b794c36dc	1355	Polhov Gradec
00050000-5602-980a-13d3-e7c71ea7a98a	4223	Poljane nad Škofjo Loko
00050000-5602-980a-be4b-50f660ced94f	2319	Poljčane
00050000-5602-980a-c70f-9fb4f53799b1	1272	Polšnik
00050000-5602-980a-426e-44494ff46404	3313	Polzela
00050000-5602-980a-1b38-0bfcc295a712	3232	Ponikva
00050000-5602-980a-6d0f-317cd4311bd8	6320	Portorož/Portorose
00050000-5602-980a-015e-0c3848d770e4	6230	Postojna
00050000-5602-980a-a7fa-4d00be87125e	2331	Pragersko
00050000-5602-980a-8514-afd65aebdd12	3312	Prebold
00050000-5602-980a-80fa-6c30aa6b6402	4205	Preddvor
00050000-5602-980a-8f72-3e76391918ef	6255	Prem
00050000-5602-980a-e5a0-4cc0a50a9a71	1352	Preserje
00050000-5602-980a-56bc-0005c0a443c8	6258	Prestranek
00050000-5602-980a-47de-59a73fc2209d	2391	Prevalje
00050000-5602-980a-e0ea-69ab5a70e167	3262	Prevorje
00050000-5602-980a-d2a2-49a408a86986	1276	Primskovo 
00050000-5602-980a-426b-797604b57345	3253	Pristava pri Mestinju
00050000-5602-980a-1675-531872bfda1b	9207	Prosenjakovci/Partosfalva
00050000-5602-980a-2c39-ebf8ecf11f12	5297	Prvačina
00050000-5602-980a-2c5e-25083f5abf04	2250	Ptuj
00050000-5602-980a-9c8e-fb8d5ec14f67	2323	Ptujska Gora
00050000-5602-980a-a0c9-d2e556ff9fa6	9201	Puconci
00050000-5602-980a-ff11-1e4049d24174	2327	Rače
00050000-5602-980a-b519-a5aab1b3c63a	1433	Radeče
00050000-5602-980a-534f-56deed5b22c1	9252	Radenci
00050000-5602-980a-2504-07c57fe85e35	2360	Radlje ob Dravi
00050000-5602-980a-e1e1-887298da6de3	1235	Radomlje
00050000-5602-980a-f8a9-36617f2aa7ca	4240	Radovljica
00050000-5602-980a-e60e-5ed8b46de9ab	8274	Raka
00050000-5602-980a-2e09-e4def75c3b39	1381	Rakek
00050000-5602-980a-53cb-5833f2423cdd	4283	Rateče - Planica
00050000-5602-980a-23d9-29633958cc48	2390	Ravne na Koroškem
00050000-5602-980a-ece3-10cf9f356425	9246	Razkrižje
00050000-5602-980a-86bf-c79b154a1d21	3332	Rečica ob Savinji
00050000-5602-980a-aa29-ebb43287b449	5292	Renče
00050000-5602-980a-0946-bf6b6f694f2a	1310	Ribnica
00050000-5602-980a-2839-d50a46212088	2364	Ribnica na Pohorju
00050000-5602-980a-2a99-f45d91a18524	3272	Rimske Toplice
00050000-5602-980a-f2e4-4b12b839b038	1314	Rob
00050000-5602-980a-b311-688120351839	5215	Ročinj
00050000-5602-980a-0b98-c7adf49cd6d3	3250	Rogaška Slatina
00050000-5602-980a-553a-9e6440e00700	9262	Rogašovci
00050000-5602-980a-298f-1ca59a95a482	3252	Rogatec
00050000-5602-980a-1b70-8a2ad3ed8e6e	1373	Rovte
00050000-5602-980a-43d9-4a82e09c3921	2342	Ruše
00050000-5602-980a-e12e-95bed64e2728	1282	Sava
00050000-5602-980a-d518-942409dcd769	6333	Sečovlje/Sicciole
00050000-5602-980a-407c-f8bee65b3341	4227	Selca
00050000-5602-980a-a79e-d8fb824769bd	2352	Selnica ob Dravi
00050000-5602-980a-1127-bfc4480e156f	8333	Semič
00050000-5602-980a-c428-35d2c42cf041	8281	Senovo
00050000-5602-980a-05bb-d72efca3bd10	6224	Senožeče
00050000-5602-980a-9c96-0350294fa048	8290	Sevnica
00050000-5602-980a-6d0d-e859537a96ec	6210	Sežana
00050000-5602-980a-a4ae-9cdaf94a7eb9	2214	Sladki Vrh
00050000-5602-980a-5156-3de4e651a7bc	5283	Slap ob Idrijci
00050000-5602-980a-9900-81b1374e85b2	2380	Slovenj Gradec
00050000-5602-980a-9833-4058ad545c42	2310	Slovenska Bistrica
00050000-5602-980a-4514-c6671108b79d	3210	Slovenske Konjice
00050000-5602-980a-2928-ffa5dc9de740	1216	Smlednik
00050000-5602-980a-a7c3-d26a992b2c5c	5232	Soča
00050000-5602-980a-4c5a-9d525229ccdd	1317	Sodražica
00050000-5602-980a-7ae9-2d229b08323d	3335	Solčava
00050000-5602-980a-3dab-0097cb463fb6	5250	Solkan
00050000-5602-980a-4758-b5537b042c82	4229	Sorica
00050000-5602-980a-028a-c19fed466843	4225	Sovodenj
00050000-5602-980a-af8d-14a7dc90c0c3	5281	Spodnja Idrija
00050000-5602-980a-cd11-49a7e3601d91	2241	Spodnji Duplek
00050000-5602-980a-1748-116f8aa56570	9245	Spodnji Ivanjci
00050000-5602-980a-d11c-71f759c4f627	2277	Središče ob Dravi
00050000-5602-980a-ce63-c64d640caa4e	4267	Srednja vas v Bohinju
00050000-5602-980a-577e-26ebeb231754	8256	Sromlje 
00050000-5602-980a-ff10-3ac3db2db9e1	5224	Srpenica
00050000-5602-980a-d868-e3c7569d0534	1242	Stahovica
00050000-5602-980a-fbf4-d1422ce54339	1332	Stara Cerkev
00050000-5602-980a-5b3f-e2a9ae0b0ea3	8342	Stari trg ob Kolpi
00050000-5602-980a-31e3-e7be52930dfb	1386	Stari trg pri Ložu
00050000-5602-980a-8ac8-04e3af4d577b	2205	Starše
00050000-5602-980a-7b47-338486f9c56c	2289	Stoperce
00050000-5602-980a-9e7c-6402ba452a34	8322	Stopiče
00050000-5602-980a-2a79-57b0c8a8ac20	3206	Stranice
00050000-5602-980a-959e-f5d0f4144fd4	8351	Straža
00050000-5602-980a-86a7-9d8d5368bbf7	1313	Struge
00050000-5602-980a-68c3-e40606a9882c	8293	Studenec
00050000-5602-980a-195b-4f6893975997	8331	Suhor
00050000-5602-980a-1a4c-e01fffae0489	2233	Sv. Ana v Slovenskih goricah
00050000-5602-980a-039a-8d5c4efa3225	2235	Sv. Trojica v Slovenskih goricah
00050000-5602-980a-2b2d-025a3137dbc4	2353	Sveti Duh na Ostrem Vrhu
00050000-5602-980a-23fc-c8b22cd04d7d	9244	Sveti Jurij ob Ščavnici
00050000-5602-980a-b907-ed50ffbd3505	3264	Sveti Štefan
00050000-5602-980a-92b1-be4a9fd991c5	2258	Sveti Tomaž
00050000-5602-980a-0494-c1d728e7fbb4	9204	Šalovci
00050000-5602-980a-7665-ea3ddc9eef68	5261	Šempas
00050000-5602-980a-af62-45337f610057	5290	Šempeter pri Gorici
00050000-5602-980a-f172-361c5bf78e0e	3311	Šempeter v Savinjski dolini
00050000-5602-980a-4d37-beb1452e0aa0	4208	Šenčur
00050000-5602-980a-fe85-aef6c221f92b	2212	Šentilj v Slovenskih goricah
00050000-5602-980a-8027-39565428a2b7	8297	Šentjanž
00050000-5602-980a-9c66-26e48197fcdf	2373	Šentjanž pri Dravogradu
00050000-5602-980a-c2e7-a7292eb87b1f	8310	Šentjernej
00050000-5602-980a-97f7-35e5db9be2ca	3230	Šentjur
00050000-5602-980a-10b4-93dfd2a33af7	3271	Šentrupert
00050000-5602-980a-c95c-ab082772c51c	8232	Šentrupert
00050000-5602-980a-3173-e6b7265e2a68	1296	Šentvid pri Stični
00050000-5602-980a-95be-f6a2a7cd1871	8275	Škocjan
00050000-5602-980a-063c-5bb3aaef9064	6281	Škofije
00050000-5602-980a-8df4-316a9818f22b	4220	Škofja Loka
00050000-5602-980a-3ef2-c3ee6b9fcb0e	3211	Škofja vas
00050000-5602-980a-7c94-6539b75c96d9	1291	Škofljica
00050000-5602-980a-4ec5-dcd0ff8ad7ae	6274	Šmarje
00050000-5602-980a-c521-ec4b15c39799	1293	Šmarje - Sap
00050000-5602-980a-309e-ca035222f0da	3240	Šmarje pri Jelšah
00050000-5602-980a-7e1f-7fc5151c3c34	8220	Šmarješke Toplice
00050000-5602-980a-486c-ee12a7cc63cf	2315	Šmartno na Pohorju
00050000-5602-980a-ada6-6de8009b69b0	3341	Šmartno ob Dreti
00050000-5602-980a-9dab-e02a20ec7028	3327	Šmartno ob Paki
00050000-5602-980a-4fcb-cfe12c7a085b	1275	Šmartno pri Litiji
00050000-5602-980a-3212-a2547f1d522c	2383	Šmartno pri Slovenj Gradcu
00050000-5602-980a-3bcf-93a22e25353f	3201	Šmartno v Rožni dolini
00050000-5602-980a-0953-09ce3e442c23	3325	Šoštanj
00050000-5602-980a-f10e-1493398e5279	6222	Štanjel
00050000-5602-980a-0cf6-e1984a207642	3220	Štore
00050000-5602-980a-ac12-086482f7c334	3304	Tabor
00050000-5602-980a-c4ea-0f2360f4df6a	3221	Teharje
00050000-5602-980a-ccc5-713f2339bc1a	9251	Tišina
00050000-5602-980a-979d-7911f542ffdf	5220	Tolmin
00050000-5602-980a-cdca-04513a65c2cc	3326	Topolšica
00050000-5602-980a-0c3e-77d2443b3c0a	2371	Trbonje
00050000-5602-980a-9698-fdb5abf8b610	1420	Trbovlje
00050000-5602-980a-c60a-fabaa4be4a8a	8231	Trebelno 
00050000-5602-980a-642b-e5247773f837	8210	Trebnje
00050000-5602-980a-6dff-3dff5942a771	5252	Trnovo pri Gorici
00050000-5602-980a-ba9f-259bf343d425	2254	Trnovska vas
00050000-5602-980a-5e37-a6b1e8cbc26a	1222	Trojane
00050000-5602-980a-747f-004103c570d0	1236	Trzin
00050000-5602-980a-9590-bdcd722a0855	4290	Tržič
00050000-5602-980a-e775-be75d2b603e9	8295	Tržišče
00050000-5602-980a-b2e2-81d18e81d5ff	1311	Turjak
00050000-5602-980a-91b5-f0202ba0a152	9224	Turnišče
00050000-5602-980a-2a1e-7eb2cf1a396b	8323	Uršna sela
00050000-5602-980b-1700-ee264a7046f2	1252	Vače
00050000-5602-980b-9bf5-c2275f721ac5	3320	Velenje 
00050000-5602-980b-c3ce-03b46a0a1377	3322	Velenje - poštni predali
00050000-5602-980b-696c-3c9d52c677d0	8212	Velika Loka
00050000-5602-980b-8217-9a7ad768016a	2274	Velika Nedelja
00050000-5602-980b-e01b-b73e07543e8c	9225	Velika Polana
00050000-5602-980b-cb9c-0791839f93e8	1315	Velike Lašče
00050000-5602-980b-4ed2-85e3d3af7998	8213	Veliki Gaber
00050000-5602-980b-2d72-7798483efe34	9241	Veržej
00050000-5602-980b-35ce-9f0342f91f28	1312	Videm - Dobrepolje
00050000-5602-980b-dbef-e15de15d6a99	2284	Videm pri Ptuju
00050000-5602-980b-0295-3192ecbbeafa	8344	Vinica
00050000-5602-980b-f031-5f255c7603ef	5271	Vipava
00050000-5602-980b-6800-3c657ed9f89b	4212	Visoko
00050000-5602-980b-d9cc-c923ff967727	1294	Višnja Gora
00050000-5602-980b-6480-01c6cf88a4c8	3205	Vitanje
00050000-5602-980b-507a-69a6eff05b44	2255	Vitomarci
00050000-5602-980b-9c09-1307724891e4	1217	Vodice
00050000-5602-980b-7bf0-4d1307f06034	3212	Vojnik\t
00050000-5602-980b-50f4-d194433cdbee	5293	Volčja Draga
00050000-5602-980b-d9fa-0d20994eff5d	2232	Voličina
00050000-5602-980b-fe0f-f3f466069320	3305	Vransko
00050000-5602-980b-51d3-6da0c2bd4e88	6217	Vremski Britof
00050000-5602-980b-f929-c60e0f1bde9a	1360	Vrhnika
00050000-5602-980b-2dbb-cdb19f012c24	2365	Vuhred
00050000-5602-980b-80d4-d286f9364dcf	2367	Vuzenica
00050000-5602-980b-0ddd-fd4568313b31	8292	Zabukovje 
00050000-5602-980b-2fea-f2b4ad85ed8a	1410	Zagorje ob Savi
00050000-5602-980b-bdef-bcb9b4b3504f	1303	Zagradec
00050000-5602-980b-9bcd-afc0b26edd5f	2283	Zavrč
00050000-5602-980b-7c5f-4b055dd33245	8272	Zdole 
00050000-5602-980b-a6f7-634d4c94ad71	4201	Zgornja Besnica
00050000-5602-980b-69e0-d99ff6814e21	2242	Zgornja Korena
00050000-5602-980b-719a-ac0523992ffb	2201	Zgornja Kungota
00050000-5602-980b-559b-4fe92b452ec0	2316	Zgornja Ložnica
00050000-5602-980b-4b98-f51c4dc7edd0	2314	Zgornja Polskava
00050000-5602-980b-c24d-0e2096b0ea85	2213	Zgornja Velka
00050000-5602-980b-d8c5-9d14dd6d28af	4247	Zgornje Gorje
00050000-5602-980b-14f5-59d713638c53	4206	Zgornje Jezersko
00050000-5602-980b-2046-600e8c315340	2285	Zgornji Leskovec
00050000-5602-980b-cbfb-ab4cafcda1ca	1432	Zidani Most
00050000-5602-980b-8545-57b63eb91160	3214	Zreče
00050000-5602-980b-7f42-5b7c93897d3b	4209	Žabnica
00050000-5602-980b-e889-1ec287fce1af	3310	Žalec
00050000-5602-980b-c1ef-32e44b930501	4228	Železniki
00050000-5602-980b-055e-f13b5bdd995a	2287	Žetale
00050000-5602-980b-ad6e-20bdf22f6226	4226	Žiri
00050000-5602-980b-a5e9-d1441f6f9d42	4274	Žirovnica
00050000-5602-980b-9c69-892da954eb58	8360	Žužemberk
\.


--
-- TOC entry 3029 (class 0 OID 4295388)
-- Dependencies: 234
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 4294978)
-- Dependencies: 204
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 4294726)
-- Dependencies: 183
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5602-980c-e3da-bd0115171fd5	00080000-5602-980c-0927-354d528ffffc	\N	00040000-5602-980a-04e9-d1b1722d8332	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5602-980c-7413-5db585e40557	00080000-5602-980c-0927-354d528ffffc	\N	00040000-5602-980a-04e9-d1b1722d8332	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5602-980c-3e34-aae8194ed75e	00080000-5602-980c-d3ab-7fd97d1cdf65	\N	00040000-5602-980a-04e9-d1b1722d8332	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2993 (class 0 OID 4294911)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 4294965)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 4295417)
-- Dependencies: 237
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 4295409)
-- Dependencies: 236
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5602-980c-4d00-0e1fdf97a47f	00080000-5602-980c-c7db-d12911a15d7e	0987	AK
00190000-5602-980c-8b0d-529e665d0bd6	00080000-5602-980c-d3ab-7fd97d1cdf65	0989	AK
00190000-5602-980c-c492-e2b722833a61	00080000-5602-980c-29fd-0163c7ceff49	0986	AK
00190000-5602-980c-e7ba-1dd63ad1fd8a	00080000-5602-980c-14f9-cc427abe994b	0984	AK
00190000-5602-980c-9994-05488e77b857	00080000-5602-980c-46c3-3cad8fb5a40e	0983	AK
00190000-5602-980c-ad6d-5e22a23cbd99	00080000-5602-980c-0a01-a51da79d58a1	0982	AK
00190000-5602-980e-bfe2-2b8fcf167f1e	00080000-5602-980e-2642-8cb20e75a6e3	1001	AK
\.


--
-- TOC entry 3026 (class 0 OID 4295280)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5602-980c-bd13-d34490eb2afd	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3028 (class 0 OID 4295378)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 4295001)
-- Dependencies: 207
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5602-980c-c107-0c4269921b08	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5602-980c-13cc-0d2a122bad12	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5602-980c-389c-890405b3e32f	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5602-980c-bc17-777e8dab9aec	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5602-980c-4e6e-b13dcdd8e39c	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-5602-980c-1d3a-60fb8f2de876	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5602-980c-1dbe-4bab50f13ca2	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3001 (class 0 OID 4294992)
-- Dependencies: 206
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 4295033)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 4295084)
-- Dependencies: 216
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 4295116)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 4294863)
-- Dependencies: 193
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 4294663)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5602-980e-2642-8cb20e75a6e3	00010000-5602-980b-a8db-c062cabbf5a6	2015-09-23 14:16:14	INS	a:0:{}
2	App\\Entity\\Option	00000000-5602-980e-8de1-74de824cc976	00010000-5602-980b-a8db-c062cabbf5a6	2015-09-23 14:16:14	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5602-980e-bfe2-2b8fcf167f1e	00010000-5602-980b-a8db-c062cabbf5a6	2015-09-23 14:16:14	INS	a:0:{}
\.


--
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3008 (class 0 OID 4295057)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 4294672)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5602-980b-6fc6-e0b67a6fd68b	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5602-980b-c245-5a7a0902423d	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5602-980b-8aa2-63b0ce484e20	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5602-980b-313a-1ba8d192a746	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5602-980b-e9b4-57e62a02be43	planer	Planer dogodkov v koledarju	t
00020000-5602-980b-56da-3711a5127689	kadrovska	Kadrovska služba	t
00020000-5602-980b-3101-7f9d6c8c9712	arhivar	Ažuriranje arhivalij	t
00020000-5602-980b-ec76-fe0d20bde162	igralec	Igralec	t
00020000-5602-980b-3075-4034ae87a847	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5602-980c-bb74-00a627d7e750	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2970 (class 0 OID 4294654)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5602-980b-4332-15f792374724	00020000-5602-980b-8aa2-63b0ce484e20
00010000-5602-980b-a8db-c062cabbf5a6	00020000-5602-980b-8aa2-63b0ce484e20
00010000-5602-980c-e002-0847bb219816	00020000-5602-980c-bb74-00a627d7e750
\.


--
-- TOC entry 3003 (class 0 OID 4295014)
-- Dependencies: 208
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 4294972)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 4294895)
-- Dependencies: 196
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 4294617)
-- Dependencies: 171
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5602-980b-7870-c705b085acff	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5602-980b-7022-c2675a7b566e	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5602-980b-e20b-fe87d504f33c	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5602-980b-055d-c765776cc8a3	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5602-980b-f358-1d1666b0eab9	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2967 (class 0 OID 4294628)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5602-980b-b82b-19adf1fecda3	00230000-5602-980b-055d-c765776cc8a3	popa
00240000-5602-980b-a2de-6ae419c594ea	00230000-5602-980b-055d-c765776cc8a3	oseba
00240000-5602-980b-6ef6-0593ed80a5c5	00230000-5602-980b-055d-c765776cc8a3	sezona
00240000-5602-980b-f882-bdc747735dac	00230000-5602-980b-7022-c2675a7b566e	prostor
00240000-5602-980b-c55a-5c7e6696576c	00230000-5602-980b-055d-c765776cc8a3	besedilo
00240000-5602-980b-97e9-869e8259f9e2	00230000-5602-980b-055d-c765776cc8a3	uprizoritev
00240000-5602-980b-9182-22b5fd3c2399	00230000-5602-980b-055d-c765776cc8a3	funkcija
00240000-5602-980b-31d2-123140141229	00230000-5602-980b-055d-c765776cc8a3	tipfunkcije
00240000-5602-980b-4cca-93f9263ea64a	00230000-5602-980b-055d-c765776cc8a3	alternacija
00240000-5602-980b-7fc9-093db89e72b1	00230000-5602-980b-7870-c705b085acff	pogodba
00240000-5602-980b-e2c9-4b51fee64fb2	00230000-5602-980b-055d-c765776cc8a3	zaposlitev
00240000-5602-980b-8c2f-e699d25d024a	00230000-5602-980b-055d-c765776cc8a3	zvrstuprizoritve
00240000-5602-980b-e757-c592e561ec13	00230000-5602-980b-7870-c705b085acff	programdela
00240000-5602-980b-d8af-8585bb06a439	00230000-5602-980b-055d-c765776cc8a3	zapis
\.


--
-- TOC entry 2968 (class 0 OID 4294636)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
bd5c73d5-9b78-47c3-beb7-ffca7a66d2d9	00240000-5602-980b-b82b-19adf1fecda3	0	1001
\.


--
-- TOC entry 3010 (class 0 OID 4295070)
-- Dependencies: 215
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5602-980c-1cfd-66c57ff85711	000e0000-5602-980c-512e-970c20b9287b	00080000-5602-980c-0927-354d528ffffc	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5602-980b-69a4-5724db267185
00270000-5602-980c-b068-0a57db51c6d6	000e0000-5602-980c-512e-970c20b9287b	00080000-5602-980c-0927-354d528ffffc	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5602-980b-69a4-5724db267185
\.


--
-- TOC entry 2982 (class 0 OID 4294789)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 4294952)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5602-980d-c302-e66956561427	00180000-5602-980c-a976-9ef4aeba95b3	000c0000-5602-980c-64a3-5087a42a52e9	00090000-5602-980c-ec1f-5c4b60ee6915	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-980d-8d25-e7609fa07076	00180000-5602-980c-a976-9ef4aeba95b3	000c0000-5602-980c-ba5c-fc9cf760a964	00090000-5602-980c-f5bd-61b5c2904e77	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-980d-7810-988db6218700	00180000-5602-980c-a976-9ef4aeba95b3	000c0000-5602-980c-4399-5b1903486399	00090000-5602-980c-af81-2d5916c40175	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-980d-ab6c-68f2a4c11ab5	00180000-5602-980c-a976-9ef4aeba95b3	000c0000-5602-980c-fadd-abc5ecbdada8	00090000-5602-980c-d02b-b7cc9a3cc9ab	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-980d-c7bf-138731c2e1db	00180000-5602-980c-a976-9ef4aeba95b3	000c0000-5602-980c-9c64-ace1ddf585ee	00090000-5602-980c-692d-9cec6017e592	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-980d-c294-bbae255bca8e	00180000-5602-980c-1a13-9811f61f487d	\N	00090000-5602-980c-692d-9cec6017e592	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3013 (class 0 OID 4295104)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-5602-980b-52eb-bcb419fa5c76	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-5602-980b-3267-a7116e8c2c74	02	Priredba	Priredba	Priredba	umetnik
000f0000-5602-980b-9114-17b52b703103	03	Prevod	Prevod	Prevod	umetnik
000f0000-5602-980b-2b39-76680c272014	04	Režija	Režija	Režija	umetnik
000f0000-5602-980b-811f-76ec6ba6d4db	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-5602-980b-8989-431af4a8a4d5	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-5602-980b-2c40-914fb42823e9	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-5602-980b-6b43-c35e4119f6ef	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-5602-980b-2210-294bff70219c	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-5602-980b-74ac-6faf7b2296da	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-5602-980b-141f-9aebfc5a738c	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-5602-980b-ff9d-3b6e7b62b6df	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-5602-980b-1108-ba63c4be78f3	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-5602-980b-dc1d-af605b6088d2	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-5602-980b-7a0e-a5fa38f014e0	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-5602-980b-314e-0a6c7c631488	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-5602-980b-58d3-406498ec0a47	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-5602-980b-58f4-ded72c6efe46	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3025 (class 0 OID 4295268)
-- Dependencies: 230
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5602-980b-cebf-38d4d7495859	01	Velika predstava	f	1.00	1.00
002b0000-5602-980b-8efc-933ec9c4e108	02	Mala predstava	f	0.50	0.50
002b0000-5602-980b-1207-4615d4efd464	03	Mala koprodukcija	t	0.40	1.00
002b0000-5602-980b-40e8-6b3d442821bf	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5602-980b-c30d-af387ea19bab	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2984 (class 0 OID 4294814)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 4294641)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5602-980b-a8db-c062cabbf5a6	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO2aO.aV6bDswKBwcCn1kFwG1ODouCzea	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5602-980c-f699-cb6ec9ab5b56	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5602-980c-2dbf-de6a46c875eb	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5602-980c-032e-59674eea7448	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5602-980c-d780-31cb6e9e6283	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5602-980c-af8c-f42cda305f77	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5602-980c-ea18-b592cd6c93d1	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5602-980c-fdb7-d35bb1f5fad8	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5602-980c-387c-fae9b528c72e	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5602-980c-1ee0-f640708b56bb	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5602-980c-e002-0847bb219816	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5602-980b-4332-15f792374724	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3018 (class 0 OID 4295170)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5602-980c-0838-a678f5f18ad4	00160000-5602-980c-52b8-9c8f5bd75111	\N	00140000-5602-980a-e3b1-091fbe7e96f2	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	\N	f	2				\N	f	\N	\N		00220000-5602-980c-4e6e-b13dcdd8e39c
000e0000-5602-980c-512e-970c20b9287b	00160000-5602-980c-0d46-b4058e7fd1fa	\N	00140000-5602-980a-8720-09d3d1a27ebc	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	\N	f	2				\N	f	\N	\N		00220000-5602-980c-1d3a-60fb8f2de876
000e0000-5602-980c-ddbd-66d20ee5cff4	\N	\N	00140000-5602-980a-8720-09d3d1a27ebc	00190000-5602-980c-4d00-0e1fdf97a47f	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		00220000-5602-980c-4e6e-b13dcdd8e39c
000e0000-5602-980c-24e9-d85a3e58fabd	\N	\N	00140000-5602-980a-8720-09d3d1a27ebc	00190000-5602-980c-4d00-0e1fdf97a47f	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		00220000-5602-980c-4e6e-b13dcdd8e39c
000e0000-5602-980c-51f7-0b7b6efe5223	\N	\N	00140000-5602-980a-8720-09d3d1a27ebc	00190000-5602-980c-4d00-0e1fdf97a47f	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		00220000-5602-980c-c107-0c4269921b08
000e0000-5602-980c-f0cb-6a56e472f844	\N	\N	00140000-5602-980a-8720-09d3d1a27ebc	00190000-5602-980c-4d00-0e1fdf97a47f	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		00220000-5602-980c-c107-0c4269921b08
\.


--
-- TOC entry 2990 (class 0 OID 4294885)
-- Dependencies: 195
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5602-980c-8ca9-199b23f83f98	000e0000-5602-980c-512e-970c20b9287b	\N	1	
00200000-5602-980c-d2ef-b5882afc9dac	000e0000-5602-980c-512e-970c20b9287b	\N	2	
00200000-5602-980c-0168-278e13dd2a35	000e0000-5602-980c-512e-970c20b9287b	\N	3	
00200000-5602-980c-bafc-45eb15fddc95	000e0000-5602-980c-512e-970c20b9287b	\N	4	
00200000-5602-980c-7e3a-c2d5df6cd891	000e0000-5602-980c-512e-970c20b9287b	\N	5	
\.


--
-- TOC entry 3007 (class 0 OID 4295049)
-- Dependencies: 212
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 4295095)
-- Dependencies: 217
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5602-980b-af32-41d8f60428f3	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5602-980b-4bd0-bda8f5b3ceab	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5602-980b-6a6e-cb477abf90ab	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5602-980b-6112-b4cdf3eb3f13	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5602-980b-2ba0-585a8595a88a	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5602-980b-902a-47c2dfb9638a	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5602-980b-8706-0b8874083a74	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5602-980b-1a39-8c34a07d4656	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5602-980b-69a4-5724db267185	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5602-980b-7077-b33b58894b85	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5602-980b-27aa-17f8b6fe7f7b	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5602-980b-b30b-4e4349f8db59	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5602-980b-60ca-a279548eba64	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5602-980b-ec70-ebe96e7fac6e	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5602-980b-e1a7-37d113d694ed	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5602-980b-3647-cb97068fcc98	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5602-980b-e6f9-60a31a3c4dc8	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5602-980b-53aa-3a000602f531	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5602-980b-ac7a-ea5362d4d0a6	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5602-980b-266a-f36438f279ce	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5602-980b-f90c-92a8d0a71e07	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5602-980b-38f2-b949aa1b2f0c	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5602-980b-d731-220b960b6024	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5602-980b-eeb0-89c041d2899b	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5602-980b-897c-6a56ceff0a9a	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5602-980b-f32a-58ca5e13bfc5	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5602-980b-4b9b-8d92dd9657bb	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5602-980b-c360-fdd04596edff	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3038 (class 0 OID 4295498)
-- Dependencies: 243
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 4295470)
-- Dependencies: 242
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 4295510)
-- Dependencies: 244
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 4295195)
-- Dependencies: 224
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5602-980c-ea1e-47c6e387b598	00090000-5602-980c-f5bd-61b5c2904e77	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-980c-d6a4-52d017cddee1	00090000-5602-980c-af81-2d5916c40175	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-980c-39a6-0b4484ae9ee8	00090000-5602-980c-0ffc-3797fe9043fd	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-980c-71fc-d7b2fa5bf43a	00090000-5602-980c-4fd7-2446a4b35f4c	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-980c-8973-28dd4020a29d	00090000-5602-980c-ec1f-5c4b60ee6915	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-980c-8511-63720f6a4620	00090000-5602-980c-b165-3ad24ac38893	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 2992 (class 0 OID 4294905)
-- Dependencies: 197
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 4295160)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5602-980a-e3b1-091fbe7e96f2	01	Drama	drama (SURS 01)
00140000-5602-980a-3b1c-468fc435e80d	02	Opera	opera (SURS 02)
00140000-5602-980a-c8da-788efc26f168	03	Balet	balet (SURS 03)
00140000-5602-980a-fde2-f23ac4ea59d5	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5602-980a-fc02-d6805aedb65c	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5602-980a-8720-09d3d1a27ebc	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5602-980a-c428-ab32dcf12e2a	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3023 (class 0 OID 4295243)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2498 (class 2606 OID 4294706)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 4295219)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 4295157)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 4295209)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 4295241)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 4295440)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 4294936)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 4294951)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 4295407)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 4294809)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 4295372)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 4295264)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 4294883)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 4211954)
-- Name: job_datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job_datoteka
    ADD CONSTRAINT job_datoteka_pkey PRIMARY KEY (job_id, datoteka_id);


--
-- TOC entry 2546 (class 2606 OID 4294858)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 4294845)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 4295047)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 4295451)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 4295458)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2739 (class 2606 OID 4295467)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 4295069)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 4294762)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 4294749)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 4294785)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 4294686)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2496 (class 2606 OID 4294697)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 4295031)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 4294991)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 4295138)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 4294723)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 4294834)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 4295400)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 4294982)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 4294737)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 4294918)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 4294969)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 4295424)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 4295414)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 4295322)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 4295386)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 4295009)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 4294996)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 4295038)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 4295094)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 4295123)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 4294872)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 4294671)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 4295061)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 4294658)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2489 (class 2606 OID 4294680)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 4295022)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 4294977)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 4294903)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 4294626)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 4294633)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 4294640)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 4295080)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 4294794)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 4294961)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 4295113)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 4295278)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 4294825)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 4294653)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 4295188)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 4294893)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 4295055)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 4295103)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 4295508)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 4295492)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 4295516)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 4295203)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 4294909)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 4295168)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 4295251)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 1259 OID 4294945)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2569 (class 1259 OID 4294946)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2570 (class 1259 OID 4294944)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2571 (class 1259 OID 4294943)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2572 (class 1259 OID 4294942)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2633 (class 1259 OID 4295081)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2634 (class 1259 OID 4295082)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2635 (class 1259 OID 4295083)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2728 (class 1259 OID 4295453)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2729 (class 1259 OID 4295452)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2499 (class 1259 OID 4294725)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2613 (class 1259 OID 4295032)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2740 (class 1259 OID 4295496)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2741 (class 1259 OID 4295495)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2742 (class 1259 OID 4295497)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2743 (class 1259 OID 4295494)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2744 (class 1259 OID 4295493)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2585 (class 1259 OID 4294971)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2586 (class 1259 OID 4294970)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2553 (class 1259 OID 4294894)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2693 (class 1259 OID 4295265)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2694 (class 1259 OID 4295267)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2695 (class 1259 OID 4295266)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2537 (class 1259 OID 4294847)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2538 (class 1259 OID 4294846)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2708 (class 1259 OID 4295387)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2650 (class 1259 OID 4295140)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2651 (class 1259 OID 4295141)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2652 (class 1259 OID 4295142)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2750 (class 1259 OID 4295517)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2663 (class 1259 OID 4295193)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2664 (class 1259 OID 4295190)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2665 (class 1259 OID 4295194)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2666 (class 1259 OID 4295192)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2667 (class 1259 OID 4295191)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2530 (class 1259 OID 4294827)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2531 (class 1259 OID 4294826)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2515 (class 1259 OID 4294788)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2628 (class 1259 OID 4295062)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2491 (class 1259 OID 4294687)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2492 (class 1259 OID 4294688)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2608 (class 1259 OID 4295025)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2609 (class 1259 OID 4295024)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2610 (class 1259 OID 4295023)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2562 (class 1259 OID 4294919)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2563 (class 1259 OID 4294920)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2474 (class 1259 OID 4294635)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2616 (class 1259 OID 4295042)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2617 (class 1259 OID 4295040)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2618 (class 1259 OID 4295039)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2619 (class 1259 OID 4295041)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2482 (class 1259 OID 4294659)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2483 (class 1259 OID 4294660)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2625 (class 1259 OID 4295056)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2727 (class 1259 OID 4295441)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2676 (class 1259 OID 4295211)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2677 (class 1259 OID 4295210)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2736 (class 1259 OID 4295468)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2737 (class 1259 OID 4295469)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2591 (class 1259 OID 4294983)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2646 (class 1259 OID 4295124)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2647 (class 1259 OID 4295125)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2703 (class 1259 OID 4295377)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2704 (class 1259 OID 4295376)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2705 (class 1259 OID 4295373)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2706 (class 1259 OID 4295374)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2707 (class 1259 OID 4295375)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2503 (class 1259 OID 4294739)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2504 (class 1259 OID 4294738)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2505 (class 1259 OID 4294740)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2602 (class 1259 OID 4295013)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2603 (class 1259 OID 4295012)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2721 (class 1259 OID 4295425)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2722 (class 1259 OID 4295426)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2680 (class 1259 OID 4295223)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2681 (class 1259 OID 4295224)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2682 (class 1259 OID 4295221)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2683 (class 1259 OID 4295222)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2671 (class 1259 OID 4295204)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2596 (class 1259 OID 4295000)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2597 (class 1259 OID 4294999)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2598 (class 1259 OID 4294997)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2599 (class 1259 OID 4294998)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2658 (class 1259 OID 4295159)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2659 (class 1259 OID 4295158)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2547 (class 1259 OID 4294873)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2541 (class 1259 OID 4294861)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2542 (class 1259 OID 4294860)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2543 (class 1259 OID 4294859)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2544 (class 1259 OID 4294862)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2552 (class 1259 OID 4294884)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2711 (class 1259 OID 4295401)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2467 (class 1259 OID 4211956)
-- Name: idx_e629e1eba54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e629e1eba54dbb1f ON job_datoteka USING btree (datoteka_id);


--
-- TOC entry 2468 (class 1259 OID 4211955)
-- Name: idx_e629e1ebbe04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e629e1ebbe04ea9 ON job_datoteka USING btree (job_id);


--
-- TOC entry 2716 (class 1259 OID 4295408)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2732 (class 1259 OID 4295459)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2733 (class 1259 OID 4295460)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2508 (class 1259 OID 4294751)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2509 (class 1259 OID 4294750)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2520 (class 1259 OID 4294795)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2521 (class 1259 OID 4294796)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2559 (class 1259 OID 4294910)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2580 (class 1259 OID 4294964)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2581 (class 1259 OID 4294963)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2582 (class 1259 OID 4294962)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2573 (class 1259 OID 4294938)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2574 (class 1259 OID 4294939)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2575 (class 1259 OID 4294937)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2576 (class 1259 OID 4294941)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2577 (class 1259 OID 4294940)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2502 (class 1259 OID 4294724)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2526 (class 1259 OID 4294810)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2527 (class 1259 OID 4294812)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2528 (class 1259 OID 4294811)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2529 (class 1259 OID 4294813)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2624 (class 1259 OID 4295048)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2655 (class 1259 OID 4295139)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2668 (class 1259 OID 4295189)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2644 (class 1259 OID 4295114)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2645 (class 1259 OID 4295115)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2518 (class 1259 OID 4294786)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2519 (class 1259 OID 4294787)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2688 (class 1259 OID 4295252)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2473 (class 1259 OID 4294627)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2514 (class 1259 OID 4294763)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2477 (class 1259 OID 4294634)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2698 (class 1259 OID 4295279)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2606 (class 1259 OID 4295011)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2607 (class 1259 OID 4295010)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2684 (class 1259 OID 4295220)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2536 (class 1259 OID 4294835)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2660 (class 1259 OID 4295169)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2747 (class 1259 OID 4295509)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2719 (class 1259 OID 4295415)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 4295416)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2687 (class 1259 OID 4295242)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2558 (class 1259 OID 4294904)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2490 (class 1259 OID 4294681)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2780 (class 2606 OID 4295653)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2781 (class 2606 OID 4295658)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2785 (class 2606 OID 4295678)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2779 (class 2606 OID 4295648)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2783 (class 2606 OID 4295668)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2784 (class 2606 OID 4295673)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2782 (class 2606 OID 4295663)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2809 (class 2606 OID 4295798)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2810 (class 2606 OID 4295803)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2811 (class 2606 OID 4295808)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2847 (class 2606 OID 4295988)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2846 (class 2606 OID 4295983)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2758 (class 2606 OID 4295543)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2801 (class 2606 OID 4295758)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2855 (class 2606 OID 4296028)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2854 (class 2606 OID 4296023)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2856 (class 2606 OID 4296033)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2853 (class 2606 OID 4296018)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2852 (class 2606 OID 4296013)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2790 (class 2606 OID 4295703)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2789 (class 2606 OID 4295698)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2775 (class 2606 OID 4295628)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2831 (class 2606 OID 4295908)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2833 (class 2606 OID 4295918)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2832 (class 2606 OID 4295913)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2771 (class 2606 OID 4295608)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2770 (class 2606 OID 4295603)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2806 (class 2606 OID 4295783)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2839 (class 2606 OID 4295948)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2814 (class 2606 OID 4295823)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2815 (class 2606 OID 4295828)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2816 (class 2606 OID 4295833)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2857 (class 2606 OID 4296038)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2822 (class 2606 OID 4295863)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2819 (class 2606 OID 4295848)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2823 (class 2606 OID 4295868)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2821 (class 2606 OID 4295858)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2820 (class 2606 OID 4295853)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2769 (class 2606 OID 4295598)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2768 (class 2606 OID 4295593)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2765 (class 2606 OID 4295578)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2764 (class 2606 OID 4295573)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2808 (class 2606 OID 4295793)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2756 (class 2606 OID 4295533)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2757 (class 2606 OID 4295538)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2800 (class 2606 OID 4295753)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2799 (class 2606 OID 4295748)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2798 (class 2606 OID 4295743)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2777 (class 2606 OID 4295638)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2778 (class 2606 OID 4295643)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2753 (class 2606 OID 4295518)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2805 (class 2606 OID 4295778)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2803 (class 2606 OID 4295768)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2802 (class 2606 OID 4295763)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2804 (class 2606 OID 4295773)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2754 (class 2606 OID 4295523)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2755 (class 2606 OID 4295528)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2807 (class 2606 OID 4295788)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2845 (class 2606 OID 4295978)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2826 (class 2606 OID 4295883)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2825 (class 2606 OID 4295878)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2850 (class 2606 OID 4296003)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2851 (class 2606 OID 4296008)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2791 (class 2606 OID 4295708)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2812 (class 2606 OID 4295813)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2813 (class 2606 OID 4295818)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2838 (class 2606 OID 4295943)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2837 (class 2606 OID 4295938)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2834 (class 2606 OID 4295923)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2835 (class 2606 OID 4295928)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2836 (class 2606 OID 4295933)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2760 (class 2606 OID 4295553)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2759 (class 2606 OID 4295548)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2761 (class 2606 OID 4295558)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2797 (class 2606 OID 4295738)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2796 (class 2606 OID 4295733)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2843 (class 2606 OID 4295968)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2844 (class 2606 OID 4295973)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2829 (class 2606 OID 4295898)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2830 (class 2606 OID 4295903)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2827 (class 2606 OID 4295888)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2828 (class 2606 OID 4295893)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2824 (class 2606 OID 4295873)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2795 (class 2606 OID 4295728)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2794 (class 2606 OID 4295723)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2792 (class 2606 OID 4295713)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2793 (class 2606 OID 4295718)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2818 (class 2606 OID 4295843)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2817 (class 2606 OID 4295838)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2773 (class 2606 OID 4295618)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2772 (class 2606 OID 4295613)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2774 (class 2606 OID 4295623)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2840 (class 2606 OID 4295953)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2842 (class 2606 OID 4295963)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2841 (class 2606 OID 4295958)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2848 (class 2606 OID 4295993)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2849 (class 2606 OID 4295998)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2763 (class 2606 OID 4295568)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2762 (class 2606 OID 4295563)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2766 (class 2606 OID 4295583)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2767 (class 2606 OID 4295588)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2776 (class 2606 OID 4295633)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2788 (class 2606 OID 4295693)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 4295688)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2786 (class 2606 OID 4295683)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-23 14:17:18 CEST

--
-- PostgreSQL database dump complete
--

