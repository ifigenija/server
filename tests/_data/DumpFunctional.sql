--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-12 11:39:19 CEST

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
-- TOC entry 181 (class 1259 OID 21665782)
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
-- TOC entry 229 (class 1259 OID 21666339)
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
-- TOC entry 228 (class 1259 OID 21666322)
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
-- TOC entry 219 (class 1259 OID 21666199)
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
-- TOC entry 222 (class 1259 OID 21666229)
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
-- TOC entry 243 (class 1259 OID 21666598)
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
-- TOC entry 197 (class 1259 OID 21665990)
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
-- TOC entry 199 (class 1259 OID 21666021)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 21666524)
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
-- TOC entry 190 (class 1259 OID 21665903)
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
-- TOC entry 230 (class 1259 OID 21666352)
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
-- TOC entry 215 (class 1259 OID 21666154)
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
-- TOC entry 195 (class 1259 OID 21665969)
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
-- TOC entry 193 (class 1259 OID 21665943)
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
-- TOC entry 191 (class 1259 OID 21665920)
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
-- TOC entry 204 (class 1259 OID 21666068)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 21666579)
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
-- TOC entry 242 (class 1259 OID 21666591)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 21666613)
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
-- TOC entry 208 (class 1259 OID 21666093)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 21665877)
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
-- TOC entry 182 (class 1259 OID 21665791)
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
-- TOC entry 183 (class 1259 OID 21665802)
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
-- TOC entry 178 (class 1259 OID 21665756)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 21665775)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 21666100)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 21666134)
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
-- TOC entry 225 (class 1259 OID 21666270)
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
-- TOC entry 185 (class 1259 OID 21665835)
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
-- TOC entry 187 (class 1259 OID 21665869)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 21666469)
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
-- TOC entry 205 (class 1259 OID 21666074)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 21665854)
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
-- TOC entry 194 (class 1259 OID 21665958)
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
-- TOC entry 207 (class 1259 OID 21666086)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 21666483)
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
-- TOC entry 234 (class 1259 OID 21666493)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 21666416)
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
-- TOC entry 235 (class 1259 OID 21666501)
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
-- TOC entry 211 (class 1259 OID 21666115)
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
-- TOC entry 203 (class 1259 OID 21666059)
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
-- TOC entry 202 (class 1259 OID 21666049)
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
-- TOC entry 224 (class 1259 OID 21666259)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 21666189)
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
-- TOC entry 192 (class 1259 OID 21665932)
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
-- TOC entry 175 (class 1259 OID 21665727)
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
-- TOC entry 174 (class 1259 OID 21665725)
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
-- TOC entry 212 (class 1259 OID 21666128)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 21665765)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 21665749)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 21666142)
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
-- TOC entry 206 (class 1259 OID 21666080)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 21666026)
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
-- TOC entry 173 (class 1259 OID 21665714)
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
-- TOC entry 172 (class 1259 OID 21665706)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 21665701)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 21666206)
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
-- TOC entry 184 (class 1259 OID 21665827)
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
-- TOC entry 201 (class 1259 OID 21666036)
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
-- TOC entry 223 (class 1259 OID 21666247)
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
-- TOC entry 236 (class 1259 OID 21666512)
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
-- TOC entry 189 (class 1259 OID 21665889)
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
-- TOC entry 176 (class 1259 OID 21665736)
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
-- TOC entry 227 (class 1259 OID 21666297)
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
-- TOC entry 196 (class 1259 OID 21665980)
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
-- TOC entry 210 (class 1259 OID 21666107)
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
-- TOC entry 221 (class 1259 OID 21666220)
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
-- TOC entry 239 (class 1259 OID 21666559)
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
-- TOC entry 238 (class 1259 OID 21666531)
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
-- TOC entry 240 (class 1259 OID 21666571)
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
-- TOC entry 217 (class 1259 OID 21666179)
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
-- TOC entry 198 (class 1259 OID 21666015)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 21666287)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 21666169)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 21665730)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2994 (class 0 OID 21665782)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 21666339)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-561b-7fc5-ff64-3851a226e7f1	000d0000-561b-7fc5-ab53-f567edc2856f	\N	00090000-561b-7fc4-29f7-05896536e1e1	000b0000-561b-7fc5-9162-76b8b99efbb6	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-561b-7fc5-2a16-f270892a3bd3	000d0000-561b-7fc5-631b-9142cb76f9d8	00100000-561b-7fc5-f563-2ad37a71cca9	00090000-561b-7fc4-6eaa-1ecece291e0a	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-561b-7fc5-45c5-b088a627502d	000d0000-561b-7fc5-a4c4-130739cc1dc7	00100000-561b-7fc5-3e11-95d47e125030	00090000-561b-7fc4-ddbc-0d1ad5a68bc1	\N	0003	t	\N	2015-10-12	\N	2	t	\N	f	f
000c0000-561b-7fc5-5b2d-2accd466d4d1	000d0000-561b-7fc5-7791-80e94201a0d4	\N	00090000-561b-7fc4-55b7-6dedc7244952	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-561b-7fc5-83c7-6fc406253a7b	000d0000-561b-7fc5-7c7f-f3fb0831c4fc	\N	00090000-561b-7fc4-8dad-a9fe3ff873b2	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-561b-7fc5-8d03-fea7d3163dc4	000d0000-561b-7fc5-9260-782152e1fef6	\N	00090000-561b-7fc4-3db5-cf14ba989b92	000b0000-561b-7fc5-7423-13f413dc6a92	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-561b-7fc5-906d-c0d855febe38	000d0000-561b-7fc5-03b0-e6172fd0ce58	00100000-561b-7fc5-cb92-4ea29c4061ed	00090000-561b-7fc4-8b5a-31139e830c05	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-561b-7fc5-71c1-aced6794a7c2	000d0000-561b-7fc5-c514-ddd86cbe7469	\N	00090000-561b-7fc4-8138-6140c65cb999	000b0000-561b-7fc5-c21c-10c96be86da1	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-561b-7fc5-678e-113092c34aaf	000d0000-561b-7fc5-03b0-e6172fd0ce58	00100000-561b-7fc5-cf49-7865c54b30b1	00090000-561b-7fc4-09c1-b56a0f25d9aa	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-561b-7fc5-1392-311f54aff07f	000d0000-561b-7fc5-03b0-e6172fd0ce58	00100000-561b-7fc5-e47b-e395f6bfca99	00090000-561b-7fc4-f28e-d6bef3dae078	\N	0010	t	\N	2015-10-12	\N	16	f	\N	f	t
000c0000-561b-7fc5-97b7-9126d2c840a7	000d0000-561b-7fc5-03b0-e6172fd0ce58	00100000-561b-7fc5-4d61-43a699a7e81a	00090000-561b-7fc4-95a6-66c7a6e2e6b4	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-561b-7fc5-c485-d889488218d3	000d0000-561b-7fc5-bdcd-82b12563ec3b	\N	00090000-561b-7fc4-6eaa-1ecece291e0a	000b0000-561b-7fc5-ecd7-978b6dd032c5	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3041 (class 0 OID 21666322)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 21666199)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-561b-7fc5-cf65-edcd6fe8feb9	00160000-561b-7fc4-4ec2-52054cfc47b3	00090000-561b-7fc4-ef47-d91c391ddf64	aizv	10	t
003d0000-561b-7fc5-0c87-4e337f2597a4	00160000-561b-7fc4-4ec2-52054cfc47b3	00090000-561b-7fc4-b2f6-7b264df0eefc	apri	14	t
003d0000-561b-7fc5-c994-56067daa2771	00160000-561b-7fc4-1856-ad4d0867fb5b	00090000-561b-7fc4-5208-eee525be8932	aizv	11	t
003d0000-561b-7fc5-5ec6-76a67a9d8c38	00160000-561b-7fc4-eff6-d02378580889	00090000-561b-7fc4-99e0-630bf48b5aad	aizv	12	t
003d0000-561b-7fc5-7aa3-a1c5aef6d2ca	00160000-561b-7fc4-4ec2-52054cfc47b3	00090000-561b-7fc4-6377-1e9c648875af	apri	18	f
\.


--
-- TOC entry 3035 (class 0 OID 21666229)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-561b-7fc4-4ec2-52054cfc47b3	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-561b-7fc4-1856-ad4d0867fb5b	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-561b-7fc4-eff6-d02378580889	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3056 (class 0 OID 21666598)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 21665990)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-561b-7fc5-1a9f-18ed0aaedca4	\N	\N	00200000-561b-7fc5-7cd6-c14785565130	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-561b-7fc5-c953-665b04a0dbf2	\N	\N	00200000-561b-7fc5-0f8d-ed8f9aa0da85	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-561b-7fc5-13ca-1d36a883af6c	\N	\N	00200000-561b-7fc5-4089-ac35001d35c5	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-561b-7fc5-60e7-8c621820b00d	\N	\N	00200000-561b-7fc5-3b33-7f850b57e3a2	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-561b-7fc5-0ac6-00fdbf4b63b7	\N	\N	00200000-561b-7fc5-9de3-9da0d4a730bd	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3012 (class 0 OID 21666021)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 21666524)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 21665903)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-561b-7fc2-d052-074b7a9375cd	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-561b-7fc2-4e92-b98ba2c26f7f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-561b-7fc2-c152-ee2acccd00f9	AL	ALB	008	Albania 	Albanija	\N
00040000-561b-7fc2-f03b-ebf9ee8f4dac	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-561b-7fc2-020d-f00c7cb58b52	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-561b-7fc2-4f37-461eab4b8432	AD	AND	020	Andorra 	Andora	\N
00040000-561b-7fc2-6aa7-1419544a2409	AO	AGO	024	Angola 	Angola	\N
00040000-561b-7fc2-10fd-b053ab0a66f0	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-561b-7fc2-267b-f2b8e22aa48b	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-561b-7fc2-3d34-062ebc46c739	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-561b-7fc2-2379-5e2b8dfbe054	AR	ARG	032	Argentina 	Argenitna	\N
00040000-561b-7fc2-273f-cab458b66612	AM	ARM	051	Armenia 	Armenija	\N
00040000-561b-7fc2-4405-2747b9973c8b	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-561b-7fc2-2ec7-75c0e3ef65fa	AU	AUS	036	Australia 	Avstralija	\N
00040000-561b-7fc2-8688-edd563d4e70a	AT	AUT	040	Austria 	Avstrija	\N
00040000-561b-7fc2-a8fd-dcbf792a8011	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-561b-7fc2-1280-17ed739baccd	BS	BHS	044	Bahamas 	Bahami	\N
00040000-561b-7fc2-dd00-660779e60c6f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-561b-7fc2-629e-6e847e804762	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-561b-7fc2-80eb-d32622c55a51	BB	BRB	052	Barbados 	Barbados	\N
00040000-561b-7fc2-281d-f3ba54f730f3	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-561b-7fc2-59e8-30a8f08658d6	BE	BEL	056	Belgium 	Belgija	\N
00040000-561b-7fc2-7a19-aaaf5f320d68	BZ	BLZ	084	Belize 	Belize	\N
00040000-561b-7fc2-a84e-863e7421987d	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-561b-7fc2-f6a3-d3a2d7286480	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-561b-7fc2-704d-6c484162cd26	BT	BTN	064	Bhutan 	Butan	\N
00040000-561b-7fc2-cea8-794b9299025e	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-561b-7fc2-647d-f9eadd10f287	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-561b-7fc2-d219-effb1e1e2a64	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-561b-7fc2-8269-c276ec9d394b	BW	BWA	072	Botswana 	Bocvana	\N
00040000-561b-7fc2-d47e-5c297d22bed2	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-561b-7fc2-d8e2-c25855030d8a	BR	BRA	076	Brazil 	Brazilija	\N
00040000-561b-7fc2-7649-61f2d1c5f6c5	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-561b-7fc2-ae86-dbfb48fac32a	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-561b-7fc2-57c6-ecf1fdd7bb34	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-561b-7fc2-0633-e94e5b762b3c	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-561b-7fc2-b692-9d6f01c46648	BI	BDI	108	Burundi 	Burundi 	\N
00040000-561b-7fc2-cee6-ee4add072276	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-561b-7fc2-045c-353de73a36b0	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-561b-7fc2-1360-4441af2730c9	CA	CAN	124	Canada 	Kanada	\N
00040000-561b-7fc2-019f-1e4d5bbd41ee	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-561b-7fc2-5f38-423cf769bf2f	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-561b-7fc2-83b0-f1171495cb37	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-561b-7fc2-1e7d-eac42ea409a1	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-561b-7fc2-6f00-ced58531c5b3	CL	CHL	152	Chile 	Čile	\N
00040000-561b-7fc2-ec0e-141e4610c0c0	CN	CHN	156	China 	Kitajska	\N
00040000-561b-7fc2-f8f9-1ce8858982d2	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-561b-7fc2-93ce-daddec5de6f1	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-561b-7fc2-16f1-9739d81efeb5	CO	COL	170	Colombia 	Kolumbija	\N
00040000-561b-7fc2-76df-f671c50f2c86	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-561b-7fc2-0546-d6659c3a18ea	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-561b-7fc2-1eb4-739c4637e8ba	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-561b-7fc2-1709-1f7d3f4002dc	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-561b-7fc2-018e-49a6bb06c6cd	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-561b-7fc2-c0fa-fc89f15de4cc	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-561b-7fc2-2de1-a7dfc6944610	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-561b-7fc2-9b58-0ec9ca68e0cc	CU	CUB	192	Cuba 	Kuba	\N
00040000-561b-7fc2-43da-d4b05a4e688a	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-561b-7fc2-74ef-060cbb163f8c	CY	CYP	196	Cyprus 	Ciper	\N
00040000-561b-7fc2-75c6-2989d434733f	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-561b-7fc2-76d6-974e3c9581f1	DK	DNK	208	Denmark 	Danska	\N
00040000-561b-7fc2-1bc4-b6fc912c7e79	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-561b-7fc2-4f8f-a0042ab50b59	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-561b-7fc2-cdf2-57e05b4ad8b4	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-561b-7fc2-9728-cd11aa4614a8	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-561b-7fc2-0de4-3c9cebe95093	EG	EGY	818	Egypt 	Egipt	\N
00040000-561b-7fc2-59c6-09fb120fa8d7	SV	SLV	222	El Salvador 	Salvador	\N
00040000-561b-7fc2-cc23-c98b3caecace	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-561b-7fc2-ef2e-94b04779812a	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-561b-7fc2-d56b-9c671cf4671a	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-561b-7fc2-63e3-ae2090f4daf6	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-561b-7fc2-b1a3-c7d2028005c0	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-561b-7fc2-197b-5bc8d2fe778f	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-561b-7fc2-3d20-75759a3ea425	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-561b-7fc2-0a15-15d801527d6a	FI	FIN	246	Finland 	Finska	\N
00040000-561b-7fc2-2eca-5a91d530c392	FR	FRA	250	France 	Francija	\N
00040000-561b-7fc2-39b6-1f7e710d289b	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-561b-7fc2-d0c4-2e1641c3ff78	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-561b-7fc2-92cd-dd7c8134f997	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-561b-7fc2-bad9-cbb34e8a2faa	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-561b-7fc2-79f2-672b2710710d	GA	GAB	266	Gabon 	Gabon	\N
00040000-561b-7fc2-dacf-ec49e6629879	GM	GMB	270	Gambia 	Gambija	\N
00040000-561b-7fc2-8cce-f2e840e5c6a8	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-561b-7fc2-4cdb-c1ca698ab0d0	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-561b-7fc2-8015-0d61c984bdfe	GH	GHA	288	Ghana 	Gana	\N
00040000-561b-7fc2-950a-d25bfe0d90c1	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-561b-7fc2-c107-493b62ad167d	GR	GRC	300	Greece 	Grčija	\N
00040000-561b-7fc2-484e-71c3ebdabc5f	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-561b-7fc2-117a-cb75a002a87e	GD	GRD	308	Grenada 	Grenada	\N
00040000-561b-7fc2-a971-2def4d64bd31	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-561b-7fc2-0fe6-97894b8eb86a	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-561b-7fc2-50ac-d172aeeb6380	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-561b-7fc2-45b8-74dac1758c5f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-561b-7fc2-bef5-06d85f9d7437	GN	GIN	324	Guinea 	Gvineja	\N
00040000-561b-7fc2-4e85-033a6fb7abb6	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-561b-7fc2-dcfd-d0500a95a7ae	GY	GUY	328	Guyana 	Gvajana	\N
00040000-561b-7fc2-699b-befcaa841cd9	HT	HTI	332	Haiti 	Haiti	\N
00040000-561b-7fc2-1eef-865ac1c694ff	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-561b-7fc2-026d-51bc2ee0272c	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-561b-7fc2-c92d-fd9e6cd200e9	HN	HND	340	Honduras 	Honduras	\N
00040000-561b-7fc2-2f5d-7c08b207af1a	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-561b-7fc2-219c-4d5d6be4a9b3	HU	HUN	348	Hungary 	Madžarska	\N
00040000-561b-7fc2-4409-97a5f699b907	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-561b-7fc2-ddef-67b265e8f3fb	IN	IND	356	India 	Indija	\N
00040000-561b-7fc2-f55b-4c8cd2b7bdc0	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-561b-7fc2-948c-9568bdec6cbe	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-561b-7fc2-7386-9948884f8eee	IQ	IRQ	368	Iraq 	Irak	\N
00040000-561b-7fc2-e45f-4b820f948064	IE	IRL	372	Ireland 	Irska	\N
00040000-561b-7fc2-6d1d-82e683ba9b53	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-561b-7fc2-fca6-3ff727bc2d60	IL	ISR	376	Israel 	Izrael	\N
00040000-561b-7fc2-5503-c2a6c41030eb	IT	ITA	380	Italy 	Italija	\N
00040000-561b-7fc2-acf1-fe9a1efdd542	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-561b-7fc2-b1a1-dd89a5bc8d7e	JP	JPN	392	Japan 	Japonska	\N
00040000-561b-7fc2-47b2-64e8c6421275	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-561b-7fc2-9b53-d25e7c8f7c83	JO	JOR	400	Jordan 	Jordanija	\N
00040000-561b-7fc2-09e4-52ac3106c2f4	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-561b-7fc2-5b86-bc28c41ab011	KE	KEN	404	Kenya 	Kenija	\N
00040000-561b-7fc2-6cfc-1b3b868a4d78	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-561b-7fc2-5be0-d6eed0cce339	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-561b-7fc2-f4d4-bf455e4347da	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-561b-7fc2-a1e3-db4bb9098e71	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-561b-7fc2-86cd-32271591dabe	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-561b-7fc2-e85f-0f4465e8bddd	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-561b-7fc2-cb00-769773f6a335	LV	LVA	428	Latvia 	Latvija	\N
00040000-561b-7fc2-c817-0277a4c89e8f	LB	LBN	422	Lebanon 	Libanon	\N
00040000-561b-7fc2-094f-7cca5590c214	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-561b-7fc2-5262-0a54939bfcaf	LR	LBR	430	Liberia 	Liberija	\N
00040000-561b-7fc2-251d-31f4467cead3	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-561b-7fc2-f1a5-d9669902d70b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-561b-7fc2-08d1-f2a5867b803c	LT	LTU	440	Lithuania 	Litva	\N
00040000-561b-7fc2-ec43-d162ef10380d	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-561b-7fc2-7162-5724e81a6a32	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-561b-7fc2-5215-58698a5fb920	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-561b-7fc2-c972-00b0ed282d04	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-561b-7fc2-4501-0c1b30378fd5	MW	MWI	454	Malawi 	Malavi	\N
00040000-561b-7fc2-6bd6-c4f12a70ff2c	MY	MYS	458	Malaysia 	Malezija	\N
00040000-561b-7fc2-e063-39c00512cb47	MV	MDV	462	Maldives 	Maldivi	\N
00040000-561b-7fc2-ed1d-2e207b9bca76	ML	MLI	466	Mali 	Mali	\N
00040000-561b-7fc2-9ce0-8ed9e4d83586	MT	MLT	470	Malta 	Malta	\N
00040000-561b-7fc2-1823-3586cc479fcc	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-561b-7fc2-8b25-79a95c1fc3c0	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-561b-7fc2-8621-2e0a80166495	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-561b-7fc2-9fae-a9dc81d84861	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-561b-7fc2-663f-0e616743c08a	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-561b-7fc2-233a-c1afd11a0a9c	MX	MEX	484	Mexico 	Mehika	\N
00040000-561b-7fc2-ffe1-855003ad8662	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-561b-7fc2-095c-192012063b22	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-561b-7fc2-f012-1b90fe179ee3	MC	MCO	492	Monaco 	Monako	\N
00040000-561b-7fc2-3fb9-9482e624a646	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-561b-7fc2-5398-fdf566754134	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-561b-7fc2-fcff-eabb6f8c5145	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-561b-7fc2-483f-1f39e9190f5f	MA	MAR	504	Morocco 	Maroko	\N
00040000-561b-7fc2-1690-64ac307c2c71	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-561b-7fc2-2150-9ab3a05657ec	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-561b-7fc2-613b-465a0ace65d5	NA	NAM	516	Namibia 	Namibija	\N
00040000-561b-7fc2-b90a-d320f7ee5086	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-561b-7fc2-bc43-f8073deb31a1	NP	NPL	524	Nepal 	Nepal	\N
00040000-561b-7fc2-2457-f061a41e2506	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-561b-7fc2-f154-fe938b977064	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-561b-7fc2-7ca0-108d215a5241	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-561b-7fc2-6fe0-ae506223131c	NE	NER	562	Niger 	Niger 	\N
00040000-561b-7fc2-3fc4-a727de3f2bce	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-561b-7fc2-1b15-1e525b78b8d7	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-561b-7fc2-9d46-52dde4fbffd3	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-561b-7fc2-d885-a1824e3b171d	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-561b-7fc2-bd6b-a698e369dfe7	NO	NOR	578	Norway 	Norveška	\N
00040000-561b-7fc2-ecc8-a81b80402d16	OM	OMN	512	Oman 	Oman	\N
00040000-561b-7fc2-3774-febe545ff73a	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-561b-7fc2-6a70-1f7f4cbcbde9	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-561b-7fc2-2b3c-7a00bbc9365c	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-561b-7fc2-5c4a-fab6862ce4a2	PA	PAN	591	Panama 	Panama	\N
00040000-561b-7fc2-80e7-96ee0f39904d	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-561b-7fc2-3d75-894092273af5	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-561b-7fc2-0a94-f35cfc633f8d	PE	PER	604	Peru 	Peru	\N
00040000-561b-7fc2-134f-30c145f77bb0	PH	PHL	608	Philippines 	Filipini	\N
00040000-561b-7fc2-4d5c-46b8067d7961	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-561b-7fc2-11df-53f6d6d8c8e4	PL	POL	616	Poland 	Poljska	\N
00040000-561b-7fc2-be53-26da96b55224	PT	PRT	620	Portugal 	Portugalska	\N
00040000-561b-7fc2-0f05-6aae2a5bedfc	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-561b-7fc2-be89-bea8785df141	QA	QAT	634	Qatar 	Katar	\N
00040000-561b-7fc2-5fa9-970660b08d3e	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-561b-7fc2-0683-0cafcb0579c1	RO	ROU	642	Romania 	Romunija	\N
00040000-561b-7fc2-2931-2133f3b36968	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-561b-7fc2-7f83-ab61ad727944	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-561b-7fc2-6f02-8e948c4ec247	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-561b-7fc2-8403-9aa057e6c934	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-561b-7fc2-0f99-1200c4641373	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-561b-7fc2-03f2-67900e613103	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-561b-7fc2-616d-92d68b803e84	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-561b-7fc2-f46b-117471a3bbf8	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-561b-7fc2-3bf4-b34987b41922	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-561b-7fc2-d699-382d0fb88a6b	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-561b-7fc2-47c0-268881c7ab13	SM	SMR	674	San Marino 	San Marino	\N
00040000-561b-7fc2-deb2-c64137a8afc6	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-561b-7fc2-d06c-f279cb63fc6f	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-561b-7fc2-ae14-559558278cb2	SN	SEN	686	Senegal 	Senegal	\N
00040000-561b-7fc2-5e96-7ad822b85b02	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-561b-7fc2-079f-92a80c7b65e5	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-561b-7fc2-62ab-7955ca4b36fd	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-561b-7fc2-63d6-3200f2570a4f	SG	SGP	702	Singapore 	Singapur	\N
00040000-561b-7fc2-742b-b32d2cbadffa	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-561b-7fc2-2e0e-264cc1a7d75c	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-561b-7fc2-f5d1-19401673e5b3	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-561b-7fc2-560c-e9cb30a7db01	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-561b-7fc2-e2a3-1a7e394a2151	SO	SOM	706	Somalia 	Somalija	\N
00040000-561b-7fc2-ba06-6a7666a40359	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-561b-7fc2-76c8-a426abbbb689	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-561b-7fc2-c2ce-66731f1b0aec	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-561b-7fc2-0e6b-556f104666e2	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-561b-7fc2-6cb4-b2168e9dfb0a	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-561b-7fc2-e69b-79998ea45913	SD	SDN	729	Sudan 	Sudan	\N
00040000-561b-7fc2-0bac-bf5d5d197ce9	SR	SUR	740	Suriname 	Surinam	\N
00040000-561b-7fc2-8515-29493c551126	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-561b-7fc2-b474-38974be327ba	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-561b-7fc2-0360-1bfdea263737	SE	SWE	752	Sweden 	Švedska	\N
00040000-561b-7fc2-ca11-157f0bac0c77	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-561b-7fc2-b239-3e8f8cebdbd4	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-561b-7fc2-cfd8-1f8f03d1bb72	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-561b-7fc2-7b0b-fb2fac63543a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-561b-7fc2-ec19-b3976f9b889e	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-561b-7fc2-432d-9b461629b7f7	TH	THA	764	Thailand 	Tajska	\N
00040000-561b-7fc2-6c15-36a20997c359	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-561b-7fc2-2f6a-6126c65853c8	TG	TGO	768	Togo 	Togo	\N
00040000-561b-7fc2-2f2a-fa52d8c21739	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-561b-7fc2-cd99-f6e5b6101a2d	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-561b-7fc2-af5b-29e0f603531e	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-561b-7fc2-d855-9e9cff71bd68	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-561b-7fc2-10e5-f879f53e86a0	TR	TUR	792	Turkey 	Turčija	\N
00040000-561b-7fc2-624b-fe18ea4646db	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-561b-7fc2-bbf4-19ff4e6d9ecf	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-561b-7fc2-689f-d0e883bfee21	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-561b-7fc2-8cf1-745cb14dea22	UG	UGA	800	Uganda 	Uganda	\N
00040000-561b-7fc2-a93c-f71b952f2b24	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-561b-7fc2-c605-6de88d296b70	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-561b-7fc2-f481-2cea200eeb52	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-561b-7fc2-ccac-c6b5165b46ec	US	USA	840	United States 	Združene države Amerike	\N
00040000-561b-7fc2-2ce4-a1507c6ca07c	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-561b-7fc2-c5e9-be02d21705ce	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-561b-7fc2-a44e-7737c9f02b4c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-561b-7fc2-7be1-11597ee145c8	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-561b-7fc2-d4b2-c8e1e5101fb3	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-561b-7fc2-a8d7-1a9042dd6344	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-561b-7fc2-9703-2a2b321f54f3	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-561b-7fc2-ade1-5ed58e769847	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-561b-7fc2-2f91-e19766fae8ec	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-561b-7fc2-7a17-629eeb8087e0	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-561b-7fc2-39da-701767d40313	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-561b-7fc2-8b1d-b2a1826b6e02	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-561b-7fc2-074a-ca7823172e95	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3043 (class 0 OID 21666352)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-561b-7fc5-7429-92382c10f0ed	000e0000-561b-7fc5-8db3-10cee6dd0237	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561b-7fc2-4152-fe8a802ebc5a	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561b-7fc5-f639-d56c40a2ae2d	000e0000-561b-7fc5-393a-3a14c28a107e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561b-7fc2-d32f-00980c5b5893	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-561b-7fc5-87f1-cdc7646561ad	000e0000-561b-7fc5-1ccb-82ac33af3f39	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-561b-7fc2-4152-fe8a802ebc5a	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-561b-7fc5-09f9-7ac8ed3f6c97	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-561b-7fc5-ee8e-7a2c9b35c645	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3028 (class 0 OID 21666154)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-561b-7fc5-ab53-f567edc2856f	000e0000-561b-7fc5-393a-3a14c28a107e	000c0000-561b-7fc5-ff64-3851a226e7f1	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-561b-7fc2-e6a5-a7bba6a220cf
000d0000-561b-7fc5-631b-9142cb76f9d8	000e0000-561b-7fc5-393a-3a14c28a107e	000c0000-561b-7fc5-2a16-f270892a3bd3	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-561b-7fc2-6288-fdf0b15e51e6
000d0000-561b-7fc5-a4c4-130739cc1dc7	000e0000-561b-7fc5-393a-3a14c28a107e	000c0000-561b-7fc5-45c5-b088a627502d	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-561b-7fc2-a764-2089a0ff096b
000d0000-561b-7fc5-7791-80e94201a0d4	000e0000-561b-7fc5-393a-3a14c28a107e	000c0000-561b-7fc5-5b2d-2accd466d4d1	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-561b-7fc2-73ac-07907aabf804
000d0000-561b-7fc5-7c7f-f3fb0831c4fc	000e0000-561b-7fc5-393a-3a14c28a107e	000c0000-561b-7fc5-83c7-6fc406253a7b	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-561b-7fc2-73ac-07907aabf804
000d0000-561b-7fc5-9260-782152e1fef6	000e0000-561b-7fc5-393a-3a14c28a107e	000c0000-561b-7fc5-8d03-fea7d3163dc4	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-561b-7fc2-e6a5-a7bba6a220cf
000d0000-561b-7fc5-03b0-e6172fd0ce58	000e0000-561b-7fc5-393a-3a14c28a107e	000c0000-561b-7fc5-678e-113092c34aaf	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-561b-7fc2-e6a5-a7bba6a220cf
000d0000-561b-7fc5-c514-ddd86cbe7469	000e0000-561b-7fc5-393a-3a14c28a107e	000c0000-561b-7fc5-71c1-aced6794a7c2	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-561b-7fc2-486d-d6aa3168a8ad
000d0000-561b-7fc5-bdcd-82b12563ec3b	000e0000-561b-7fc5-393a-3a14c28a107e	000c0000-561b-7fc5-c485-d889488218d3	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-561b-7fc2-e011-a3d71b8d9b2e
\.


--
-- TOC entry 3008 (class 0 OID 21665969)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 21665943)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 21665920)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-561b-7fc5-590a-183ab35b4edc	00080000-561b-7fc4-8e75-da9f3869d928	00090000-561b-7fc4-f28e-d6bef3dae078	AK		igralka
\.


--
-- TOC entry 3017 (class 0 OID 21666068)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 21666579)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 21666591)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 21666613)
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
-- TOC entry 3021 (class 0 OID 21666093)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 21665877)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-561b-7fc3-5d41-09e535cf5134	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-561b-7fc3-0451-91497490c5a3	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-561b-7fc3-3efe-2fd30d8cfd4a	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-561b-7fc3-b8e3-7a4af6798c3a	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-561b-7fc3-11a9-ee23f6f730a5	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-561b-7fc3-9a55-d5d539e7d6ee	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-561b-7fc3-659d-003b04688c80	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-561b-7fc3-ffd4-c6fda2fe306a	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-561b-7fc3-a3b2-ca71fd4977d0	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-561b-7fc3-4066-ae166a43ab9f	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-561b-7fc3-0480-591af9ae8c07	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-561b-7fc3-d11f-2856650d1cf5	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-561b-7fc3-820f-69cb113c7c08	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-561b-7fc3-035c-945fb3f1b51e	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-561b-7fc3-a6bd-0f197a7883c3	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-561b-7fc4-e818-0876690f4096	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-561b-7fc4-c435-b34b4be4a8eb	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-561b-7fc4-7999-eaaaca285c36	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-561b-7fc4-e20a-971b19f30423	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-561b-7fc4-2bb9-e8cbc6fa6d65	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-561b-7fc6-84be-5b38524a6191	application.tenant.maticnopodjetje	string	s:36:"00080000-561b-7fc6-0c6a-f3f271585c2d";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 2995 (class 0 OID 21665791)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-561b-7fc4-1123-ed370396d84f	00000000-561b-7fc4-e818-0876690f4096	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-561b-7fc4-661f-2a388d56e185	00000000-561b-7fc4-e818-0876690f4096	00010000-561b-7fc2-74f5-9ed21a5dd6a5	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-561b-7fc4-22dd-ed92e14e8e54	00000000-561b-7fc4-c435-b34b4be4a8eb	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2996 (class 0 OID 21665802)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-561b-7fc4-29f7-05896536e1e1	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-561b-7fc4-55b7-6dedc7244952	00010000-561b-7fc4-4728-dfc4a7b5fde5	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-561b-7fc4-ddbc-0d1ad5a68bc1	00010000-561b-7fc4-47a3-e6a2a3a72bf2	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-561b-7fc4-09c1-b56a0f25d9aa	00010000-561b-7fc4-859a-8182c1c13a0b	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-561b-7fc4-efdd-4a313d0b98ff	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-561b-7fc4-3db5-cf14ba989b92	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-561b-7fc4-95a6-66c7a6e2e6b4	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-561b-7fc4-8b5a-31139e830c05	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-561b-7fc4-f28e-d6bef3dae078	00010000-561b-7fc4-895e-9b8cd31748f6	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-561b-7fc4-6eaa-1ecece291e0a	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-561b-7fc4-cca8-e6e4cc3c1e1e	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-561b-7fc4-8dad-a9fe3ff873b2	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-561b-7fc4-8138-6140c65cb999	00010000-561b-7fc4-3685-779485edcd8c	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-561b-7fc4-ef47-d91c391ddf64	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-561b-7fc4-b2f6-7b264df0eefc	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-561b-7fc4-5208-eee525be8932	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-561b-7fc4-99e0-630bf48b5aad	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-561b-7fc4-6377-1e9c648875af	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2991 (class 0 OID 21665756)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-561b-7fc2-2b05-7e29796a202a	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-561b-7fc2-80f0-a9fac1b2a2b8	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-561b-7fc2-4c54-d546edb3132d	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-561b-7fc2-8966-538ba5793b57	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-561b-7fc2-d793-ef80cc649f8e	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-561b-7fc2-8fa4-51c59d0bc285	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-561b-7fc2-55bc-cac6052d5f14	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-561b-7fc2-347c-345b38e45513	Abonma-read	Abonma - branje	f
00030000-561b-7fc2-f5ba-46e04b2acf8c	Abonma-write	Abonma - spreminjanje	f
00030000-561b-7fc2-dedc-b92f5d25da0b	Alternacija-read	Alternacija - branje	f
00030000-561b-7fc2-30be-34f0b96ddc5e	Alternacija-write	Alternacija - spreminjanje	f
00030000-561b-7fc2-b761-213af0507206	Arhivalija-read	Arhivalija - branje	f
00030000-561b-7fc2-cfd9-e76ef2363bab	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-561b-7fc2-9861-1daa07681d59	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-561b-7fc2-2c64-3d6b27ecd40c	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-561b-7fc2-d207-667d4f478062	Besedilo-read	Besedilo - branje	f
00030000-561b-7fc2-052c-61a879d90b26	Besedilo-write	Besedilo - spreminjanje	f
00030000-561b-7fc2-192b-539e1f079403	DogodekIzven-read	DogodekIzven - branje	f
00030000-561b-7fc2-2fa0-bb9e3469045c	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-561b-7fc2-96b2-295f76fbdae0	Dogodek-read	Dogodek - branje	f
00030000-561b-7fc2-4751-de3634c77f65	Dogodek-write	Dogodek - spreminjanje	f
00030000-561b-7fc2-281f-f2357d36413e	DrugiVir-read	DrugiVir - branje	f
00030000-561b-7fc2-92b4-b3dfac6e0411	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-561b-7fc2-18e2-d0b7d0487af6	Drzava-read	Drzava - branje	f
00030000-561b-7fc2-e067-cae8a6b818e5	Drzava-write	Drzava - spreminjanje	f
00030000-561b-7fc2-905a-8a258dc6eb82	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-561b-7fc2-c3f9-5fbfcbd92418	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-561b-7fc2-7d54-39874ae7c0b3	Funkcija-read	Funkcija - branje	f
00030000-561b-7fc2-69ad-8091830473a2	Funkcija-write	Funkcija - spreminjanje	f
00030000-561b-7fc2-4211-adafa4d8f88e	Gostovanje-read	Gostovanje - branje	f
00030000-561b-7fc2-b717-6798cd639b6e	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-561b-7fc2-c6ae-07b7a60f4613	Gostujoca-read	Gostujoca - branje	f
00030000-561b-7fc2-43c1-9bfb4f4fe6d8	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-561b-7fc2-2f2a-ee7a5c4471a8	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-561b-7fc2-ac07-c339cf16e403	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-561b-7fc2-6627-4066055467f6	Kupec-read	Kupec - branje	f
00030000-561b-7fc2-5522-ffd03db19fe3	Kupec-write	Kupec - spreminjanje	f
00030000-561b-7fc2-408b-f4c1916b8f23	NacinPlacina-read	NacinPlacina - branje	f
00030000-561b-7fc2-4e68-97df22508dd3	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-561b-7fc2-1c3f-233b07c9f051	Option-read	Option - branje	f
00030000-561b-7fc2-a986-74752a089912	Option-write	Option - spreminjanje	f
00030000-561b-7fc2-d03f-7c7bc517194c	OptionValue-read	OptionValue - branje	f
00030000-561b-7fc2-4ba3-0324817dd7fd	OptionValue-write	OptionValue - spreminjanje	f
00030000-561b-7fc2-d036-0880d7fb19ed	Oseba-read	Oseba - branje	f
00030000-561b-7fc2-771e-9ce8ae9b0040	Oseba-write	Oseba - spreminjanje	f
00030000-561b-7fc2-10e4-20376793a194	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-561b-7fc2-78ff-bb76b5d58693	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-561b-7fc2-2a1f-619f6c585f80	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-561b-7fc2-9253-3580245f7fbf	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-561b-7fc2-a65f-a8ae86c682ed	Pogodba-read	Pogodba - branje	f
00030000-561b-7fc2-9421-34521f1ba66e	Pogodba-write	Pogodba - spreminjanje	f
00030000-561b-7fc2-73cd-a8973d346fb2	Popa-read	Popa - branje	f
00030000-561b-7fc2-f247-2e319c559d54	Popa-write	Popa - spreminjanje	f
00030000-561b-7fc2-8280-e30ca74e690b	Posta-read	Posta - branje	f
00030000-561b-7fc2-0582-40ac86a69569	Posta-write	Posta - spreminjanje	f
00030000-561b-7fc2-7820-22668702dfb7	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-561b-7fc2-13fd-8c538845500e	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-561b-7fc2-2cde-ea2984b4bd38	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-561b-7fc2-c594-eee22b75e2e4	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-561b-7fc2-519f-8f288cf9bc02	PostniNaslov-read	PostniNaslov - branje	f
00030000-561b-7fc2-cf6c-509237e0c05e	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-561b-7fc2-d3b1-48a60809636e	Predstava-read	Predstava - branje	f
00030000-561b-7fc2-b281-43e08705c3d9	Predstava-write	Predstava - spreminjanje	f
00030000-561b-7fc2-7a75-883146cc1ffa	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-561b-7fc2-21c9-3f4ded199e5e	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-561b-7fc2-0d91-6d1ecf1095c0	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-561b-7fc2-41b2-42d68b280592	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-561b-7fc2-8908-81a6d2f94357	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-561b-7fc2-3bfb-d6922c1001c8	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-561b-7fc2-7d46-b9bfc2832c1d	ProgramDela-read	ProgramDela - branje	f
00030000-561b-7fc2-0a81-7319eb81203d	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-561b-7fc2-e2ce-7376ccaf3c3e	ProgramFestival-read	ProgramFestival - branje	f
00030000-561b-7fc2-77ba-85d8d552fe78	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-561b-7fc2-50c7-c8bb5e1a9599	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-561b-7fc2-77e7-24948240f07b	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-561b-7fc2-b16b-7c22d94d939c	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-561b-7fc2-45a3-da024230b569	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-561b-7fc2-ab63-95e7846991f9	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-561b-7fc2-bb38-046e49849827	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-561b-7fc2-a09a-be279db1db7a	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-561b-7fc2-472e-3d8d4aa33fc8	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-561b-7fc2-6135-fa2553aebe23	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-561b-7fc2-320c-9372a6e4c213	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-561b-7fc2-64de-2124d94c277f	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-561b-7fc2-02e1-c58355a97bbf	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-561b-7fc2-c989-381b980ac5ac	ProgramRazno-read	ProgramRazno - branje	f
00030000-561b-7fc2-cbba-11ffe2b71f9b	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-561b-7fc2-8c42-b7e97aed91ea	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-561b-7fc2-346b-d70a00ccec6b	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-561b-7fc2-4467-01cb59882873	Prostor-read	Prostor - branje	f
00030000-561b-7fc2-8faa-c15df74ade60	Prostor-write	Prostor - spreminjanje	f
00030000-561b-7fc2-47d0-7febbb39159b	Racun-read	Racun - branje	f
00030000-561b-7fc2-122b-bb813293fdbd	Racun-write	Racun - spreminjanje	f
00030000-561b-7fc2-8634-9684ae3196d3	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-561b-7fc2-401c-b0d6c2a45061	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-561b-7fc2-17ae-2f0ca3b0d6dc	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-561b-7fc2-3456-b71682f94ea2	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-561b-7fc2-4d4e-715d09b9fcd9	Rekvizit-read	Rekvizit - branje	f
00030000-561b-7fc2-7907-4fe7f9ddeb9c	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-561b-7fc2-6e8e-92dc3fad95f7	Revizija-read	Revizija - branje	f
00030000-561b-7fc2-e34d-9b43fe2ae349	Revizija-write	Revizija - spreminjanje	f
00030000-561b-7fc2-086b-807308549673	Rezervacija-read	Rezervacija - branje	f
00030000-561b-7fc2-82cb-7deb5d5f91b2	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-561b-7fc2-e490-6e2d4ee23de9	SedezniRed-read	SedezniRed - branje	f
00030000-561b-7fc2-94e7-00ebf7ded13e	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-561b-7fc2-8b27-cf09b48c2e65	Sedez-read	Sedez - branje	f
00030000-561b-7fc2-bedb-7929c9e1d2d2	Sedez-write	Sedez - spreminjanje	f
00030000-561b-7fc2-acd2-8724b0340210	Sezona-read	Sezona - branje	f
00030000-561b-7fc2-b41f-53f99d753521	Sezona-write	Sezona - spreminjanje	f
00030000-561b-7fc2-4993-5cf9c01c1742	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-561b-7fc2-a759-b303e0fb86bd	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-561b-7fc2-5fb3-8a6bac35b62b	Stevilcenje-read	Stevilcenje - branje	f
00030000-561b-7fc2-b5a6-053a15404769	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-561b-7fc2-3729-e3f0842a7ed4	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-561b-7fc2-f78d-701dc6b066f6	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-561b-7fc2-dfda-ecca4d16ef0f	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-561b-7fc2-2100-0ff92a012c35	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-561b-7fc2-0406-6513fe660eef	Telefonska-read	Telefonska - branje	f
00030000-561b-7fc2-bc01-d7223b08beb7	Telefonska-write	Telefonska - spreminjanje	f
00030000-561b-7fc2-6b7c-cd1ea5996770	TerminStoritve-read	TerminStoritve - branje	f
00030000-561b-7fc2-0983-15a6f4b5caf4	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-561b-7fc2-c6ce-cd5f586a264e	TipFunkcije-read	TipFunkcije - branje	f
00030000-561b-7fc2-b76c-6dd785f8c725	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-561b-7fc2-3def-bbb22986ee48	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-561b-7fc2-659e-bc45f890ac6c	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-561b-7fc2-7d55-5752587f06da	Trr-read	Trr - branje	f
00030000-561b-7fc2-9711-c9c0df1016f6	Trr-write	Trr - spreminjanje	f
00030000-561b-7fc2-c91d-4574d43dd823	Uprizoritev-read	Uprizoritev - branje	f
00030000-561b-7fc2-94d2-1d24340df7b9	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-561b-7fc2-03b1-213b30fd2f20	Vaja-read	Vaja - branje	f
00030000-561b-7fc2-d9e1-555d33954e4e	Vaja-write	Vaja - spreminjanje	f
00030000-561b-7fc2-e7b5-10483c4f14e0	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-561b-7fc2-e692-7009fa259d2e	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-561b-7fc2-da90-c3306b5c1d2a	VrstaStroska-read	VrstaStroska - branje	f
00030000-561b-7fc2-9a4c-eafc423c7f47	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-561b-7fc2-a801-7a1686f9de8c	Zaposlitev-read	Zaposlitev - branje	f
00030000-561b-7fc2-a40a-f36fa05e2b3a	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-561b-7fc2-46f6-2c0386d14b2a	Zasedenost-read	Zasedenost - branje	f
00030000-561b-7fc2-0c82-e72b69442e6f	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-561b-7fc2-a389-e3a956e44363	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-561b-7fc2-de9b-7ce9bfeb363d	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-561b-7fc2-ccc3-2a8d3b32c638	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-561b-7fc2-5442-37a432e6c38c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-561b-7fc2-bf7c-28f7a2515c0f	Job-read	Branje opravil - samo zase - branje	f
00030000-561b-7fc2-8659-474c14b24db6	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-561b-7fc2-5d7d-3c8f745b5cde	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-561b-7fc2-1e59-249393ff0863	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-561b-7fc2-1b43-f42d03d8121a	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-561b-7fc2-06b1-f75ce3c52e58	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-561b-7fc2-b168-c7d26085b156	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-561b-7fc2-1dbb-7b1c2960bbd2	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-561b-7fc2-0087-89c75fe00901	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-561b-7fc2-007d-56b1e88ba62c	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-561b-7fc2-cb31-07534ab59c6f	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-561b-7fc2-4ffb-a76a87566e69	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-561b-7fc2-b5bb-f96ba503808a	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-561b-7fc2-838d-2876e9017708	Datoteka-write	Datoteka - spreminjanje	f
00030000-561b-7fc2-964d-4342d71baae1	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2993 (class 0 OID 21665775)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-561b-7fc2-57b6-00233a782b93	00030000-561b-7fc2-80f0-a9fac1b2a2b8
00020000-561b-7fc2-8698-779b6d70fcd1	00030000-561b-7fc2-18e2-d0b7d0487af6
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-347c-345b38e45513
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-f5ba-46e04b2acf8c
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-dedc-b92f5d25da0b
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-30be-34f0b96ddc5e
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-b761-213af0507206
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-96b2-295f76fbdae0
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-8966-538ba5793b57
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-4751-de3634c77f65
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-18e2-d0b7d0487af6
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-e067-cae8a6b818e5
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-7d54-39874ae7c0b3
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-69ad-8091830473a2
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-4211-adafa4d8f88e
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-b717-6798cd639b6e
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-c6ae-07b7a60f4613
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-43c1-9bfb4f4fe6d8
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-2f2a-ee7a5c4471a8
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-ac07-c339cf16e403
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-1c3f-233b07c9f051
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-d03f-7c7bc517194c
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-d036-0880d7fb19ed
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-771e-9ce8ae9b0040
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-73cd-a8973d346fb2
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-f247-2e319c559d54
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-8280-e30ca74e690b
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-0582-40ac86a69569
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-519f-8f288cf9bc02
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-cf6c-509237e0c05e
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-d3b1-48a60809636e
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-b281-43e08705c3d9
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-8908-81a6d2f94357
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-3bfb-d6922c1001c8
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-4467-01cb59882873
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-8faa-c15df74ade60
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-17ae-2f0ca3b0d6dc
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-3456-b71682f94ea2
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-4d4e-715d09b9fcd9
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-7907-4fe7f9ddeb9c
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-acd2-8724b0340210
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-b41f-53f99d753521
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-c6ce-cd5f586a264e
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-c91d-4574d43dd823
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-94d2-1d24340df7b9
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-03b1-213b30fd2f20
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-d9e1-555d33954e4e
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-46f6-2c0386d14b2a
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-0c82-e72b69442e6f
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-a389-e3a956e44363
00020000-561b-7fc2-d37b-ce94301a35cf	00030000-561b-7fc2-ccc3-2a8d3b32c638
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-347c-345b38e45513
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-b761-213af0507206
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-96b2-295f76fbdae0
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-18e2-d0b7d0487af6
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-4211-adafa4d8f88e
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-c6ae-07b7a60f4613
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-2f2a-ee7a5c4471a8
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-ac07-c339cf16e403
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-1c3f-233b07c9f051
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-d03f-7c7bc517194c
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-d036-0880d7fb19ed
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-771e-9ce8ae9b0040
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-73cd-a8973d346fb2
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-8280-e30ca74e690b
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-519f-8f288cf9bc02
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-cf6c-509237e0c05e
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-d3b1-48a60809636e
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-4467-01cb59882873
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-17ae-2f0ca3b0d6dc
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-4d4e-715d09b9fcd9
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-acd2-8724b0340210
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-0406-6513fe660eef
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-bc01-d7223b08beb7
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-7d55-5752587f06da
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-9711-c9c0df1016f6
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-a801-7a1686f9de8c
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-a40a-f36fa05e2b3a
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-a389-e3a956e44363
00020000-561b-7fc2-fd3d-0e5cbf850ea7	00030000-561b-7fc2-ccc3-2a8d3b32c638
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-347c-345b38e45513
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-dedc-b92f5d25da0b
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-b761-213af0507206
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-cfd9-e76ef2363bab
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-d207-667d4f478062
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-192b-539e1f079403
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-96b2-295f76fbdae0
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-18e2-d0b7d0487af6
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-7d54-39874ae7c0b3
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-4211-adafa4d8f88e
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-c6ae-07b7a60f4613
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-2f2a-ee7a5c4471a8
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-1c3f-233b07c9f051
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-d03f-7c7bc517194c
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-d036-0880d7fb19ed
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-73cd-a8973d346fb2
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-8280-e30ca74e690b
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-d3b1-48a60809636e
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-8908-81a6d2f94357
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-4467-01cb59882873
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-17ae-2f0ca3b0d6dc
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-4d4e-715d09b9fcd9
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-acd2-8724b0340210
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-c6ce-cd5f586a264e
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-03b1-213b30fd2f20
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-46f6-2c0386d14b2a
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-a389-e3a956e44363
00020000-561b-7fc2-cfc0-4d8ee51eab39	00030000-561b-7fc2-ccc3-2a8d3b32c638
00020000-561b-7fc2-aea9-37940ff6e485	00030000-561b-7fc2-347c-345b38e45513
00020000-561b-7fc2-aea9-37940ff6e485	00030000-561b-7fc2-f5ba-46e04b2acf8c
00020000-561b-7fc2-aea9-37940ff6e485	00030000-561b-7fc2-30be-34f0b96ddc5e
00020000-561b-7fc2-aea9-37940ff6e485	00030000-561b-7fc2-b761-213af0507206
00020000-561b-7fc2-aea9-37940ff6e485	00030000-561b-7fc2-96b2-295f76fbdae0
00020000-561b-7fc2-aea9-37940ff6e485	00030000-561b-7fc2-18e2-d0b7d0487af6
00020000-561b-7fc2-aea9-37940ff6e485	00030000-561b-7fc2-4211-adafa4d8f88e
00020000-561b-7fc2-aea9-37940ff6e485	00030000-561b-7fc2-c6ae-07b7a60f4613
00020000-561b-7fc2-aea9-37940ff6e485	00030000-561b-7fc2-1c3f-233b07c9f051
00020000-561b-7fc2-aea9-37940ff6e485	00030000-561b-7fc2-d03f-7c7bc517194c
00020000-561b-7fc2-aea9-37940ff6e485	00030000-561b-7fc2-73cd-a8973d346fb2
00020000-561b-7fc2-aea9-37940ff6e485	00030000-561b-7fc2-8280-e30ca74e690b
00020000-561b-7fc2-aea9-37940ff6e485	00030000-561b-7fc2-d3b1-48a60809636e
00020000-561b-7fc2-aea9-37940ff6e485	00030000-561b-7fc2-4467-01cb59882873
00020000-561b-7fc2-aea9-37940ff6e485	00030000-561b-7fc2-17ae-2f0ca3b0d6dc
00020000-561b-7fc2-aea9-37940ff6e485	00030000-561b-7fc2-4d4e-715d09b9fcd9
00020000-561b-7fc2-aea9-37940ff6e485	00030000-561b-7fc2-acd2-8724b0340210
00020000-561b-7fc2-aea9-37940ff6e485	00030000-561b-7fc2-c6ce-cd5f586a264e
00020000-561b-7fc2-aea9-37940ff6e485	00030000-561b-7fc2-a389-e3a956e44363
00020000-561b-7fc2-aea9-37940ff6e485	00030000-561b-7fc2-ccc3-2a8d3b32c638
00020000-561b-7fc2-5c16-5a8665a67cfb	00030000-561b-7fc2-347c-345b38e45513
00020000-561b-7fc2-5c16-5a8665a67cfb	00030000-561b-7fc2-b761-213af0507206
00020000-561b-7fc2-5c16-5a8665a67cfb	00030000-561b-7fc2-96b2-295f76fbdae0
00020000-561b-7fc2-5c16-5a8665a67cfb	00030000-561b-7fc2-18e2-d0b7d0487af6
00020000-561b-7fc2-5c16-5a8665a67cfb	00030000-561b-7fc2-4211-adafa4d8f88e
00020000-561b-7fc2-5c16-5a8665a67cfb	00030000-561b-7fc2-c6ae-07b7a60f4613
00020000-561b-7fc2-5c16-5a8665a67cfb	00030000-561b-7fc2-1c3f-233b07c9f051
00020000-561b-7fc2-5c16-5a8665a67cfb	00030000-561b-7fc2-d03f-7c7bc517194c
00020000-561b-7fc2-5c16-5a8665a67cfb	00030000-561b-7fc2-73cd-a8973d346fb2
00020000-561b-7fc2-5c16-5a8665a67cfb	00030000-561b-7fc2-8280-e30ca74e690b
00020000-561b-7fc2-5c16-5a8665a67cfb	00030000-561b-7fc2-d3b1-48a60809636e
00020000-561b-7fc2-5c16-5a8665a67cfb	00030000-561b-7fc2-4467-01cb59882873
00020000-561b-7fc2-5c16-5a8665a67cfb	00030000-561b-7fc2-17ae-2f0ca3b0d6dc
00020000-561b-7fc2-5c16-5a8665a67cfb	00030000-561b-7fc2-4d4e-715d09b9fcd9
00020000-561b-7fc2-5c16-5a8665a67cfb	00030000-561b-7fc2-acd2-8724b0340210
00020000-561b-7fc2-5c16-5a8665a67cfb	00030000-561b-7fc2-6b7c-cd1ea5996770
00020000-561b-7fc2-5c16-5a8665a67cfb	00030000-561b-7fc2-4c54-d546edb3132d
00020000-561b-7fc2-5c16-5a8665a67cfb	00030000-561b-7fc2-c6ce-cd5f586a264e
00020000-561b-7fc2-5c16-5a8665a67cfb	00030000-561b-7fc2-a389-e3a956e44363
00020000-561b-7fc2-5c16-5a8665a67cfb	00030000-561b-7fc2-ccc3-2a8d3b32c638
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-2b05-7e29796a202a
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-80f0-a9fac1b2a2b8
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-4c54-d546edb3132d
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-8966-538ba5793b57
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-d793-ef80cc649f8e
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-8fa4-51c59d0bc285
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-55bc-cac6052d5f14
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-347c-345b38e45513
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-f5ba-46e04b2acf8c
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-dedc-b92f5d25da0b
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-30be-34f0b96ddc5e
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-b761-213af0507206
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-cfd9-e76ef2363bab
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-d207-667d4f478062
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-052c-61a879d90b26
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-192b-539e1f079403
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-2fa0-bb9e3469045c
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-96b2-295f76fbdae0
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-4751-de3634c77f65
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-18e2-d0b7d0487af6
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-e067-cae8a6b818e5
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-281f-f2357d36413e
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-92b4-b3dfac6e0411
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-905a-8a258dc6eb82
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-c3f9-5fbfcbd92418
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-7d54-39874ae7c0b3
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-69ad-8091830473a2
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-4211-adafa4d8f88e
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-b717-6798cd639b6e
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-c6ae-07b7a60f4613
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-43c1-9bfb4f4fe6d8
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-2f2a-ee7a5c4471a8
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-ac07-c339cf16e403
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-6627-4066055467f6
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-5522-ffd03db19fe3
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-408b-f4c1916b8f23
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-4e68-97df22508dd3
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-1c3f-233b07c9f051
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-a986-74752a089912
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-d03f-7c7bc517194c
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-4ba3-0324817dd7fd
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-d036-0880d7fb19ed
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-771e-9ce8ae9b0040
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-10e4-20376793a194
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-78ff-bb76b5d58693
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-2a1f-619f6c585f80
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-9253-3580245f7fbf
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-a65f-a8ae86c682ed
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-9421-34521f1ba66e
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-73cd-a8973d346fb2
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-f247-2e319c559d54
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-8280-e30ca74e690b
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-0582-40ac86a69569
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-7820-22668702dfb7
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-13fd-8c538845500e
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-2cde-ea2984b4bd38
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-c594-eee22b75e2e4
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-519f-8f288cf9bc02
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-cf6c-509237e0c05e
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-d3b1-48a60809636e
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-b281-43e08705c3d9
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-7a75-883146cc1ffa
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-21c9-3f4ded199e5e
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-0d91-6d1ecf1095c0
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-41b2-42d68b280592
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-8908-81a6d2f94357
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-3bfb-d6922c1001c8
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-7d46-b9bfc2832c1d
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-0a81-7319eb81203d
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-e2ce-7376ccaf3c3e
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-77ba-85d8d552fe78
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-50c7-c8bb5e1a9599
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-77e7-24948240f07b
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-b16b-7c22d94d939c
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-45a3-da024230b569
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-ab63-95e7846991f9
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-bb38-046e49849827
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-a09a-be279db1db7a
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-472e-3d8d4aa33fc8
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-6135-fa2553aebe23
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-320c-9372a6e4c213
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-64de-2124d94c277f
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-02e1-c58355a97bbf
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-c989-381b980ac5ac
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-cbba-11ffe2b71f9b
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-8c42-b7e97aed91ea
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-346b-d70a00ccec6b
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-4467-01cb59882873
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-8faa-c15df74ade60
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-47d0-7febbb39159b
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-122b-bb813293fdbd
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-8634-9684ae3196d3
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-401c-b0d6c2a45061
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-17ae-2f0ca3b0d6dc
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-3456-b71682f94ea2
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-4d4e-715d09b9fcd9
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-7907-4fe7f9ddeb9c
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-6e8e-92dc3fad95f7
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-e34d-9b43fe2ae349
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-086b-807308549673
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-82cb-7deb5d5f91b2
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-e490-6e2d4ee23de9
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-94e7-00ebf7ded13e
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-8b27-cf09b48c2e65
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-bedb-7929c9e1d2d2
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-acd2-8724b0340210
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-b41f-53f99d753521
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-4993-5cf9c01c1742
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-a759-b303e0fb86bd
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-5fb3-8a6bac35b62b
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-b5a6-053a15404769
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-3729-e3f0842a7ed4
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-f78d-701dc6b066f6
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-dfda-ecca4d16ef0f
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-2100-0ff92a012c35
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-0406-6513fe660eef
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-bc01-d7223b08beb7
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-6b7c-cd1ea5996770
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-0983-15a6f4b5caf4
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-c6ce-cd5f586a264e
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-b76c-6dd785f8c725
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-3def-bbb22986ee48
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-659e-bc45f890ac6c
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-7d55-5752587f06da
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-9711-c9c0df1016f6
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-c91d-4574d43dd823
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-94d2-1d24340df7b9
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-03b1-213b30fd2f20
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-d9e1-555d33954e4e
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-e7b5-10483c4f14e0
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-e692-7009fa259d2e
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-da90-c3306b5c1d2a
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-9a4c-eafc423c7f47
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-a801-7a1686f9de8c
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-a40a-f36fa05e2b3a
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-46f6-2c0386d14b2a
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-0c82-e72b69442e6f
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-a389-e3a956e44363
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-de9b-7ce9bfeb363d
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-ccc3-2a8d3b32c638
00020000-561b-7fc4-3e64-1716cd26efbb	00030000-561b-7fc2-5442-37a432e6c38c
\.


--
-- TOC entry 3022 (class 0 OID 21666100)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 21666134)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 21666270)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-561b-7fc5-9162-76b8b99efbb6	00090000-561b-7fc4-29f7-05896536e1e1	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-561b-7fc5-7423-13f413dc6a92	00090000-561b-7fc4-3db5-cf14ba989b92	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-561b-7fc5-c21c-10c96be86da1	00090000-561b-7fc4-8138-6140c65cb999	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-561b-7fc5-ecd7-978b6dd032c5	00090000-561b-7fc4-6eaa-1ecece291e0a	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2998 (class 0 OID 21665835)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-561b-7fc4-8e75-da9f3869d928	00040000-561b-7fc2-f5d1-19401673e5b3	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-7fc4-0e38-e30b46c12a1a	00040000-561b-7fc2-f5d1-19401673e5b3	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-561b-7fc4-8d60-8e3a8890d3f6	00040000-561b-7fc2-f5d1-19401673e5b3	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-7fc4-0042-71b8d2bf2125	00040000-561b-7fc2-f5d1-19401673e5b3	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-7fc4-d0eb-5fa35799e8bc	00040000-561b-7fc2-f5d1-19401673e5b3	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-7fc4-acea-f16ae1c1d41f	00040000-561b-7fc2-2379-5e2b8dfbe054	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-7fc4-14cf-ab3664b8f0d0	00040000-561b-7fc2-2de1-a7dfc6944610	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-7fc4-bae7-0da23cd9a944	00040000-561b-7fc2-8688-edd563d4e70a	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-7fc4-fc27-843b4376b5c6	00040000-561b-7fc2-4cdb-c1ca698ab0d0	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-561b-7fc6-0c6a-f3f271585c2d	00040000-561b-7fc2-f5d1-19401673e5b3	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3000 (class 0 OID 21665869)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-561b-7fc2-4986-62396670b47f	8341	Adlešiči
00050000-561b-7fc2-0184-7ac77be0244e	5270	Ajdovščina
00050000-561b-7fc2-a6ad-087532670f09	6280	Ankaran/Ancarano
00050000-561b-7fc2-4fb5-ddfc1cf8265c	9253	Apače
00050000-561b-7fc2-dd3f-6a5109801583	8253	Artiče
00050000-561b-7fc2-164b-0f089f3c4d08	4275	Begunje na Gorenjskem
00050000-561b-7fc2-5232-499e3e07f74a	1382	Begunje pri Cerknici
00050000-561b-7fc2-061e-3b876377ed6e	9231	Beltinci
00050000-561b-7fc2-e4ec-bada5bb7165e	2234	Benedikt
00050000-561b-7fc2-a563-16686837d814	2345	Bistrica ob Dravi
00050000-561b-7fc2-7f85-c10102e7e23d	3256	Bistrica ob Sotli
00050000-561b-7fc2-a8c3-4a6f5a605201	8259	Bizeljsko
00050000-561b-7fc2-8c04-8832ee1e4e4d	1223	Blagovica
00050000-561b-7fc2-4561-3005badd9b6b	8283	Blanca
00050000-561b-7fc2-cb4e-9eff02f47141	4260	Bled
00050000-561b-7fc2-64c6-b98f66a858a6	4273	Blejska Dobrava
00050000-561b-7fc2-6528-c6095e4675b4	9265	Bodonci
00050000-561b-7fc2-a740-74e84d052cb4	9222	Bogojina
00050000-561b-7fc2-4ee6-20fe1ed0dfcc	4263	Bohinjska Bela
00050000-561b-7fc2-2fb6-f899f3b609e5	4264	Bohinjska Bistrica
00050000-561b-7fc2-e028-137bc02ee6f1	4265	Bohinjsko jezero
00050000-561b-7fc2-79b5-1ec38898ec54	1353	Borovnica
00050000-561b-7fc2-2b7a-11433861f006	8294	Boštanj
00050000-561b-7fc2-2786-6aaebc35dc1a	5230	Bovec
00050000-561b-7fc2-2f30-9cf33c9b8fc1	5295	Branik
00050000-561b-7fc2-c7ef-6fb1abd55474	3314	Braslovče
00050000-561b-7fc2-0b4f-e9be7e6c4c00	5223	Breginj
00050000-561b-7fc2-47f7-0f6349d5ad90	8280	Brestanica
00050000-561b-7fc2-bd7c-8c3d3cf9eab1	2354	Bresternica
00050000-561b-7fc2-41a0-888b86c9f4fe	4243	Brezje
00050000-561b-7fc2-4814-ccd2c8f3ace1	1351	Brezovica pri Ljubljani
00050000-561b-7fc2-727f-3ebae8e5c635	8250	Brežice
00050000-561b-7fc2-eb5c-f510c56ec111	4210	Brnik - Aerodrom
00050000-561b-7fc2-b687-9747967e65b5	8321	Brusnice
00050000-561b-7fc2-3531-667120135ee6	3255	Buče
00050000-561b-7fc2-d567-f994c178d234	8276	Bučka 
00050000-561b-7fc2-b19f-1e7d55d9e466	9261	Cankova
00050000-561b-7fc2-6d06-638e457a4925	3000	Celje 
00050000-561b-7fc2-e936-58335195db06	3001	Celje - poštni predali
00050000-561b-7fc2-3ea1-4ec8e53cf2f5	4207	Cerklje na Gorenjskem
00050000-561b-7fc2-ca1f-3e5cfa4545ce	8263	Cerklje ob Krki
00050000-561b-7fc2-d117-70f4991a5040	1380	Cerknica
00050000-561b-7fc2-3e36-c9be3fc7342b	5282	Cerkno
00050000-561b-7fc2-6258-4f90233dd3e4	2236	Cerkvenjak
00050000-561b-7fc2-9a9b-8cd2d217360b	2215	Ceršak
00050000-561b-7fc2-f1ca-27e742d2e572	2326	Cirkovce
00050000-561b-7fc2-62f9-95f51de1d245	2282	Cirkulane
00050000-561b-7fc2-1132-985185c6cdad	5273	Col
00050000-561b-7fc2-080c-b51eba1220be	8251	Čatež ob Savi
00050000-561b-7fc2-2bce-6cd4dcc8cb6d	1413	Čemšenik
00050000-561b-7fc2-f95f-b0c0f19555fd	5253	Čepovan
00050000-561b-7fc2-bba2-a162d7d51641	9232	Črenšovci
00050000-561b-7fc2-63b5-8404d224288f	2393	Črna na Koroškem
00050000-561b-7fc2-bc86-0e12647be806	6275	Črni Kal
00050000-561b-7fc2-858d-d6f686d87036	5274	Črni Vrh nad Idrijo
00050000-561b-7fc2-7f4a-b954d0492756	5262	Črniče
00050000-561b-7fc2-4d5a-fe6588c88c68	8340	Črnomelj
00050000-561b-7fc2-bc5f-c1f31415eae5	6271	Dekani
00050000-561b-7fc2-24f1-5d58e0c06c51	5210	Deskle
00050000-561b-7fc2-01ba-5cabad132df2	2253	Destrnik
00050000-561b-7fc2-7b38-be026ba77e0a	6215	Divača
00050000-561b-7fc2-232d-62883d1e8c34	1233	Dob
00050000-561b-7fc2-4cd3-cf1a970324db	3224	Dobje pri Planini
00050000-561b-7fc2-6148-3de5c3385471	8257	Dobova
00050000-561b-7fc2-ad2e-ed32ab62de6a	1423	Dobovec
00050000-561b-7fc2-6d7d-35f0a924b3ec	5263	Dobravlje
00050000-561b-7fc2-057b-14579a0c0a96	3204	Dobrna
00050000-561b-7fc2-41e3-4edaf8d87188	8211	Dobrnič
00050000-561b-7fc2-bec9-84133143e179	1356	Dobrova
00050000-561b-7fc2-d148-b81acb850635	9223	Dobrovnik/Dobronak 
00050000-561b-7fc2-c45d-0ba05a47b31e	5212	Dobrovo v Brdih
00050000-561b-7fc2-3d16-5e5087f26aa8	1431	Dol pri Hrastniku
00050000-561b-7fc2-0c0a-5c459097ad78	1262	Dol pri Ljubljani
00050000-561b-7fc2-1b6d-bbe6a7fd640c	1273	Dole pri Litiji
00050000-561b-7fc2-f125-015d99435bee	1331	Dolenja vas
00050000-561b-7fc2-a803-c36f5a7b42c5	8350	Dolenjske Toplice
00050000-561b-7fc2-2632-6f235fd00e42	1230	Domžale
00050000-561b-7fc2-bc4b-f8393f3e2aad	2252	Dornava
00050000-561b-7fc2-8b0f-06293384ec79	5294	Dornberk
00050000-561b-7fc2-cd3d-792971549600	1319	Draga
00050000-561b-7fc2-4eae-1c6c93cfab63	8343	Dragatuš
00050000-561b-7fc2-22bd-4838f8e6faf3	3222	Dramlje
00050000-561b-7fc2-c194-1f3fa1a1ea9e	2370	Dravograd
00050000-561b-7fc2-7a56-265a5d5890b4	4203	Duplje
00050000-561b-7fc2-9cb5-5300bf6f4ff7	6221	Dutovlje
00050000-561b-7fc2-87fc-8e1b9e2e7e38	8361	Dvor
00050000-561b-7fc2-ee72-7d034a3df16c	2343	Fala
00050000-561b-7fc2-d482-c6d45ffea91b	9208	Fokovci
00050000-561b-7fc2-a508-4171f91ece94	2313	Fram
00050000-561b-7fc2-16c4-6a3de3f4715b	3213	Frankolovo
00050000-561b-7fc2-13cd-3d5d56ebf3a9	1274	Gabrovka
00050000-561b-7fc2-a0fa-3a7fd17c0737	8254	Globoko
00050000-561b-7fc2-d106-45506b761893	5275	Godovič
00050000-561b-7fc2-cee1-8046fa51a856	4204	Golnik
00050000-561b-7fc2-e8d9-72929c1f1499	3303	Gomilsko
00050000-561b-7fc2-b129-b3a30f832a74	4224	Gorenja vas
00050000-561b-7fc2-9e0d-b1233aa3fa7f	3263	Gorica pri Slivnici
00050000-561b-7fc2-5898-c93c6605b0b0	2272	Gorišnica
00050000-561b-7fc2-a748-8b55c569d233	9250	Gornja Radgona
00050000-561b-7fc2-71d3-48029f2ee53a	3342	Gornji Grad
00050000-561b-7fc2-d0ee-5831c84293c9	4282	Gozd Martuljek
00050000-561b-7fc2-a85d-dd358008edeb	6272	Gračišče
00050000-561b-7fc2-e620-1e163a87392a	9264	Grad
00050000-561b-7fc2-73f7-515e4aa5e79c	8332	Gradac
00050000-561b-7fc2-7cad-ae28f5a4d841	1384	Grahovo
00050000-561b-7fc2-6397-29ccc752268a	5242	Grahovo ob Bači
00050000-561b-7fc2-09e1-f640396a466f	5251	Grgar
00050000-561b-7fc2-e5fc-e987c705d96e	3302	Griže
00050000-561b-7fc2-2a7a-c2da69c4dc78	3231	Grobelno
00050000-561b-7fc2-9d4d-8bde0e8ebb45	1290	Grosuplje
00050000-561b-7fc2-3af1-ca955856362c	2288	Hajdina
00050000-561b-7fc2-1901-0472249e2e84	8362	Hinje
00050000-561b-7fc2-d035-65369279f8b6	2311	Hoče
00050000-561b-7fc2-aa21-243810140033	9205	Hodoš/Hodos
00050000-561b-7fc2-d3f1-f53e12d94871	1354	Horjul
00050000-561b-7fc2-52a3-a3287fe61184	1372	Hotedršica
00050000-561b-7fc2-4e79-b6cbec93af20	1430	Hrastnik
00050000-561b-7fc2-884e-e325e3fbfb0e	6225	Hruševje
00050000-561b-7fc2-c80e-76be2bccbd04	4276	Hrušica
00050000-561b-7fc2-ac4a-6781852231c5	5280	Idrija
00050000-561b-7fc2-e514-0b8e41c01e27	1292	Ig
00050000-561b-7fc2-1424-85154d49dadf	6250	Ilirska Bistrica
00050000-561b-7fc2-9fba-85b393a4ff39	6251	Ilirska Bistrica-Trnovo
00050000-561b-7fc2-5484-af50878d76e3	1295	Ivančna Gorica
00050000-561b-7fc2-d7cc-382b04e2bd5c	2259	Ivanjkovci
00050000-561b-7fc2-f3f4-11e6971fdd41	1411	Izlake
00050000-561b-7fc2-d8c1-4315d120f1d5	6310	Izola/Isola
00050000-561b-7fc2-dff2-be42bf53cea1	2222	Jakobski Dol
00050000-561b-7fc2-5c10-db573067d9ba	2221	Jarenina
00050000-561b-7fc2-d2a7-739d5b3ae0af	6254	Jelšane
00050000-561b-7fc2-2bcf-89b6d1f2419d	4270	Jesenice
00050000-561b-7fc2-6502-6846953d4b04	8261	Jesenice na Dolenjskem
00050000-561b-7fc2-b76f-4786114e1dab	3273	Jurklošter
00050000-561b-7fc2-4db6-3d31ec5d637c	2223	Jurovski Dol
00050000-561b-7fc2-1414-afdb794105c1	2256	Juršinci
00050000-561b-7fc2-0519-735198a2ff2b	5214	Kal nad Kanalom
00050000-561b-7fc2-9173-9e228993c604	3233	Kalobje
00050000-561b-7fc2-f832-24ad5df6a6c2	4246	Kamna Gorica
00050000-561b-7fc2-efea-572c5c2b86da	2351	Kamnica
00050000-561b-7fc2-5ca1-f9ce63548c7f	1241	Kamnik
00050000-561b-7fc2-b311-90a355843b79	5213	Kanal
00050000-561b-7fc2-4eeb-488c4eb210ba	8258	Kapele
00050000-561b-7fc2-8614-6e6b5b0916de	2362	Kapla
00050000-561b-7fc2-666e-f1263fcd9457	2325	Kidričevo
00050000-561b-7fc2-4110-3b7088247aa4	1412	Kisovec
00050000-561b-7fc2-0036-4daed23615ea	6253	Knežak
00050000-561b-7fc2-0660-1bf52cfbafea	5222	Kobarid
00050000-561b-7fc2-7cd5-cda1bf012c32	9227	Kobilje
00050000-561b-7fc2-096f-28c936aeeb9a	1330	Kočevje
00050000-561b-7fc2-160f-d0dceb33a795	1338	Kočevska Reka
00050000-561b-7fc2-8bf9-beec1ed1f2c1	2276	Kog
00050000-561b-7fc2-ea77-0dab61fce39c	5211	Kojsko
00050000-561b-7fc2-e182-0ac4af284d5a	6223	Komen
00050000-561b-7fc2-92ac-cd3700ecd4e8	1218	Komenda
00050000-561b-7fc2-3e2e-89ae77147bcd	6000	Koper/Capodistria 
00050000-561b-7fc2-0506-2425136ed5fc	6001	Koper/Capodistria - poštni predali
00050000-561b-7fc2-9849-7788c6bbe195	8282	Koprivnica
00050000-561b-7fc2-6510-64c0d4634847	5296	Kostanjevica na Krasu
00050000-561b-7fc2-a39c-5429caff7f8c	8311	Kostanjevica na Krki
00050000-561b-7fc2-523a-bb403430b4f8	1336	Kostel
00050000-561b-7fc2-6f03-2f637b283717	6256	Košana
00050000-561b-7fc2-7412-ec0377f0bb75	2394	Kotlje
00050000-561b-7fc2-a9df-90454e8154c1	6240	Kozina
00050000-561b-7fc2-09dd-128afc37dd36	3260	Kozje
00050000-561b-7fc2-3a19-da893ecd8a29	4000	Kranj 
00050000-561b-7fc2-eb0a-2d67047754aa	4001	Kranj - poštni predali
00050000-561b-7fc2-b77f-e5339c9b7041	4280	Kranjska Gora
00050000-561b-7fc2-83bb-ec89e4d57071	1281	Kresnice
00050000-561b-7fc2-135d-b2bff0fa5aba	4294	Križe
00050000-561b-7fc2-4675-217dd5893373	9206	Križevci
00050000-561b-7fc2-6664-7bb7824deeb5	9242	Križevci pri Ljutomeru
00050000-561b-7fc2-2230-f73f6d66f601	1301	Krka
00050000-561b-7fc2-b27f-80a0603d0a8b	8296	Krmelj
00050000-561b-7fc2-eceb-481642f46908	4245	Kropa
00050000-561b-7fc2-44de-bd6c013f69b4	8262	Krška vas
00050000-561b-7fc2-d603-fb6a14ab7e88	8270	Krško
00050000-561b-7fc2-1237-146fcae2c8e1	9263	Kuzma
00050000-561b-7fc2-a43d-f181dd924769	2318	Laporje
00050000-561b-7fc2-90d3-192364686fb0	3270	Laško
00050000-561b-7fc2-94ca-217ccc0ea951	1219	Laze v Tuhinju
00050000-561b-7fc2-4500-f3b12f93b175	2230	Lenart v Slovenskih goricah
00050000-561b-7fc2-e5d5-86a4d5f2591b	9220	Lendava/Lendva
00050000-561b-7fc2-1ecf-faa4db0e02ea	4248	Lesce
00050000-561b-7fc2-2c12-9c9be8388997	3261	Lesično
00050000-561b-7fc2-7237-1ae8966e5b7a	8273	Leskovec pri Krškem
00050000-561b-7fc2-b198-f068d5a8c045	2372	Libeliče
00050000-561b-7fc2-e48d-db24bf8f9824	2341	Limbuš
00050000-561b-7fc2-d3b3-5794e091a733	1270	Litija
00050000-561b-7fc2-7497-58be6cfd2363	3202	Ljubečna
00050000-561b-7fc2-677f-fb218d0b2bd3	1000	Ljubljana 
00050000-561b-7fc2-5300-ddeb9a6641dc	1001	Ljubljana - poštni predali
00050000-561b-7fc2-f2f1-cee0a4d3f73b	1231	Ljubljana - Črnuče
00050000-561b-7fc2-94db-e30b17e79b0b	1261	Ljubljana - Dobrunje
00050000-561b-7fc2-e6fd-8aaf1732060b	1260	Ljubljana - Polje
00050000-561b-7fc2-b1ed-a2ba299ff1b3	1210	Ljubljana - Šentvid
00050000-561b-7fc2-3d1f-8d5bc667c2a9	1211	Ljubljana - Šmartno
00050000-561b-7fc2-9629-3b4eb0c4ed82	3333	Ljubno ob Savinji
00050000-561b-7fc2-ce14-c2961ec09281	9240	Ljutomer
00050000-561b-7fc2-af88-646b89f8ef48	3215	Loče
00050000-561b-7fc2-2da5-97ab9d023ab2	5231	Log pod Mangartom
00050000-561b-7fc2-ee96-73bdc2451355	1358	Log pri Brezovici
00050000-561b-7fc2-dece-741ecc987483	1370	Logatec
00050000-561b-7fc2-4bf9-809a47ae732e	1371	Logatec
00050000-561b-7fc2-eaa8-54df623f4806	1434	Loka pri Zidanem Mostu
00050000-561b-7fc2-9b92-55f3119d6ed7	3223	Loka pri Žusmu
00050000-561b-7fc2-383e-35b0482f14b2	6219	Lokev
00050000-561b-7fc2-7958-0c47987dc750	1318	Loški Potok
00050000-561b-7fc2-339c-8717c1f6f2de	2324	Lovrenc na Dravskem polju
00050000-561b-7fc2-3e6a-928bceda8d16	2344	Lovrenc na Pohorju
00050000-561b-7fc2-645b-51686bba30fb	3334	Luče
00050000-561b-7fc2-885d-95ee3bea2ab6	1225	Lukovica
00050000-561b-7fc2-b8ca-918925a95832	9202	Mačkovci
00050000-561b-7fc2-d9ff-c25754a02130	2322	Majšperk
00050000-561b-7fc2-74c4-996a114e9963	2321	Makole
00050000-561b-7fc2-d276-de3c08fd466a	9243	Mala Nedelja
00050000-561b-7fc2-3c7e-a98e6f14ff65	2229	Malečnik
00050000-561b-7fc2-5c58-9c9939a71b5a	6273	Marezige
00050000-561b-7fc2-c08e-151e6005c2d9	2000	Maribor 
00050000-561b-7fc2-fe0b-075d90242f37	2001	Maribor - poštni predali
00050000-561b-7fc2-90b6-35284c19766d	2206	Marjeta na Dravskem polju
00050000-561b-7fc2-931d-0fcef0e2905b	2281	Markovci
00050000-561b-7fc2-3d0f-1d058096eb02	9221	Martjanci
00050000-561b-7fc2-0a51-55dd72909bee	6242	Materija
00050000-561b-7fc2-62ef-f14231db5b59	4211	Mavčiče
00050000-561b-7fc2-761a-ce486513097f	1215	Medvode
00050000-561b-7fc2-190c-e3bbc51a6341	1234	Mengeš
00050000-561b-7fc2-cfb6-f920daf0006f	8330	Metlika
00050000-561b-7fc2-abbd-934caffb757f	2392	Mežica
00050000-561b-7fc2-6112-5f1df0cf10e6	2204	Miklavž na Dravskem polju
00050000-561b-7fc2-5cd8-09f1e7f3c19e	2275	Miklavž pri Ormožu
00050000-561b-7fc2-38b5-41289f7d8759	5291	Miren
00050000-561b-7fc2-dc8c-538ddeba6ba6	8233	Mirna
00050000-561b-7fc2-64b2-ed51673c5243	8216	Mirna Peč
00050000-561b-7fc2-65bc-e1d6dd58d48c	2382	Mislinja
00050000-561b-7fc2-3266-43c055ebc613	4281	Mojstrana
00050000-561b-7fc2-a894-cbb99aca1f7f	8230	Mokronog
00050000-561b-7fc2-7553-3886e8ef448c	1251	Moravče
00050000-561b-7fc2-ca08-3a2f9a4ebb38	9226	Moravske Toplice
00050000-561b-7fc2-cbd0-d7ee1b710b4d	5216	Most na Soči
00050000-561b-7fc2-d8ee-449598218435	1221	Motnik
00050000-561b-7fc2-79ad-9641a7e3d8a9	3330	Mozirje
00050000-561b-7fc2-2528-50e021a4b342	9000	Murska Sobota 
00050000-561b-7fc2-384c-2099922068a6	9001	Murska Sobota - poštni predali
00050000-561b-7fc2-44c3-663a80f27102	2366	Muta
00050000-561b-7fc2-e76a-adc9bd7a9b3b	4202	Naklo
00050000-561b-7fc2-05e6-90ad22d8f154	3331	Nazarje
00050000-561b-7fc2-5f00-cdfd5a136d29	1357	Notranje Gorice
00050000-561b-7fc2-ebd7-ad73515074f3	3203	Nova Cerkev
00050000-561b-7fc2-bc52-460ceb9198a1	5000	Nova Gorica 
00050000-561b-7fc2-842d-8db2315910b0	5001	Nova Gorica - poštni predali
00050000-561b-7fc2-9c4c-52574582fb41	1385	Nova vas
00050000-561b-7fc2-a99b-093e068d1b97	8000	Novo mesto
00050000-561b-7fc2-9650-f2dfbc9bcfb9	8001	Novo mesto - poštni predali
00050000-561b-7fc2-7237-ec0e426be41c	6243	Obrov
00050000-561b-7fc2-df85-a17fe5fda137	9233	Odranci
00050000-561b-7fc2-c63f-bb7a4c6ba007	2317	Oplotnica
00050000-561b-7fc2-92d7-5364284dc6c7	2312	Orehova vas
00050000-561b-7fc2-47bf-61e1a218e201	2270	Ormož
00050000-561b-7fc2-5614-4f48ca2b1bca	1316	Ortnek
00050000-561b-7fc2-8f42-4899b7692512	1337	Osilnica
00050000-561b-7fc2-d925-5526913e3611	8222	Otočec
00050000-561b-7fc2-0f81-466dc7150cde	2361	Ožbalt
00050000-561b-7fc2-4196-dd7a5a43096d	2231	Pernica
00050000-561b-7fc2-0878-dfe73a0c97b0	2211	Pesnica pri Mariboru
00050000-561b-7fc2-63e0-cc98a664b554	9203	Petrovci
00050000-561b-7fc2-a4a0-6cc882e897d7	3301	Petrovče
00050000-561b-7fc2-fd13-497810fb89a7	6330	Piran/Pirano
00050000-561b-7fc2-e323-2b9c0cb9f86a	8255	Pišece
00050000-561b-7fc2-f057-582d3170eeaf	6257	Pivka
00050000-561b-7fc2-6893-c2e78a14c79c	6232	Planina
00050000-561b-7fc2-cd15-36b1f1d5d5b0	3225	Planina pri Sevnici
00050000-561b-7fc2-c21b-d55f3f90e335	6276	Pobegi
00050000-561b-7fc2-9858-fe5b4fb22928	8312	Podbočje
00050000-561b-7fc2-f48f-784ca3653ab0	5243	Podbrdo
00050000-561b-7fc2-eae0-57b2db64ef67	3254	Podčetrtek
00050000-561b-7fc2-2bd2-ac987ead5c87	2273	Podgorci
00050000-561b-7fc2-e16f-5f335e56d862	6216	Podgorje
00050000-561b-7fc2-047d-35ba317b759a	2381	Podgorje pri Slovenj Gradcu
00050000-561b-7fc2-de20-72598ffdc1ed	6244	Podgrad
00050000-561b-7fc2-f6de-f26b24ad272d	1414	Podkum
00050000-561b-7fc2-d0ba-2f48c4c58ae1	2286	Podlehnik
00050000-561b-7fc2-fb47-a463ece31e89	5272	Podnanos
00050000-561b-7fc2-b3a9-1aceadeb8b5f	4244	Podnart
00050000-561b-7fc2-9d6f-5253a98c3594	3241	Podplat
00050000-561b-7fc2-30ab-f984913e68ac	3257	Podsreda
00050000-561b-7fc2-ea5c-d26eb184cd98	2363	Podvelka
00050000-561b-7fc2-6173-cb876a8fc839	2208	Pohorje
00050000-561b-7fc2-dbdb-656ecbdcd585	2257	Polenšak
00050000-561b-7fc2-70de-930356387114	1355	Polhov Gradec
00050000-561b-7fc2-2d43-e9e7fab431b3	4223	Poljane nad Škofjo Loko
00050000-561b-7fc2-746d-1e60ad8d7694	2319	Poljčane
00050000-561b-7fc2-e12c-c8cb4dad6485	1272	Polšnik
00050000-561b-7fc2-8c46-fb25de2a6873	3313	Polzela
00050000-561b-7fc2-a83b-e652487b80b8	3232	Ponikva
00050000-561b-7fc2-52fb-a8ed5548130c	6320	Portorož/Portorose
00050000-561b-7fc2-01a0-541a2d40455a	6230	Postojna
00050000-561b-7fc2-4c9b-7968d994f659	2331	Pragersko
00050000-561b-7fc2-0aa7-62ac966893ab	3312	Prebold
00050000-561b-7fc2-02ec-f9051a561c43	4205	Preddvor
00050000-561b-7fc2-ea0b-71ee1c21b1ed	6255	Prem
00050000-561b-7fc2-2a44-19262e2640b8	1352	Preserje
00050000-561b-7fc2-13e2-50f59bbcfb23	6258	Prestranek
00050000-561b-7fc2-dc2e-46a30ca161b3	2391	Prevalje
00050000-561b-7fc2-9fdd-a04eab859252	3262	Prevorje
00050000-561b-7fc2-1349-e2c656599c3d	1276	Primskovo 
00050000-561b-7fc2-4d9e-90cabc32cb43	3253	Pristava pri Mestinju
00050000-561b-7fc2-014f-8cdcd982dc77	9207	Prosenjakovci/Partosfalva
00050000-561b-7fc2-c584-f23bea177615	5297	Prvačina
00050000-561b-7fc2-7c61-5c8b2f8a14f5	2250	Ptuj
00050000-561b-7fc2-fcc2-674cf2cad822	2323	Ptujska Gora
00050000-561b-7fc2-37dc-c0b770ab7e68	9201	Puconci
00050000-561b-7fc2-bfdc-3d45c2b34921	2327	Rače
00050000-561b-7fc2-2b62-e99913362576	1433	Radeče
00050000-561b-7fc2-d3e7-a2b7e63d23f6	9252	Radenci
00050000-561b-7fc2-d631-d09c9e2823d6	2360	Radlje ob Dravi
00050000-561b-7fc2-1369-5c0eec7759fd	1235	Radomlje
00050000-561b-7fc2-3e7c-01ea1e84721b	4240	Radovljica
00050000-561b-7fc2-7739-9693952fa473	8274	Raka
00050000-561b-7fc2-916f-08cbc42e7088	1381	Rakek
00050000-561b-7fc2-f44f-d2e623747069	4283	Rateče - Planica
00050000-561b-7fc2-b990-f92c3481d92b	2390	Ravne na Koroškem
00050000-561b-7fc2-23a5-d5bdec58eebb	9246	Razkrižje
00050000-561b-7fc2-2324-d9ae70c689f2	3332	Rečica ob Savinji
00050000-561b-7fc2-f46a-2ca109753223	5292	Renče
00050000-561b-7fc2-1782-bbb8bac1d5da	1310	Ribnica
00050000-561b-7fc2-f398-60ad5e9f635f	2364	Ribnica na Pohorju
00050000-561b-7fc2-d6e7-e8ffb47a01a2	3272	Rimske Toplice
00050000-561b-7fc2-a471-68847c33e5ed	1314	Rob
00050000-561b-7fc2-12ec-65dddb2ea586	5215	Ročinj
00050000-561b-7fc2-c7a5-63ebb26bc55d	3250	Rogaška Slatina
00050000-561b-7fc2-87d4-c3e1b1dd3d53	9262	Rogašovci
00050000-561b-7fc2-c552-cdec63a0379b	3252	Rogatec
00050000-561b-7fc2-a4c0-57f497a87e5c	1373	Rovte
00050000-561b-7fc2-57ca-2699238b6439	2342	Ruše
00050000-561b-7fc2-3656-1f1ea8d85edc	1282	Sava
00050000-561b-7fc2-d587-7e4a5474dce4	6333	Sečovlje/Sicciole
00050000-561b-7fc2-03ab-2aa27eff9d24	4227	Selca
00050000-561b-7fc2-bc19-774d6494e3cf	2352	Selnica ob Dravi
00050000-561b-7fc2-a748-6d14bc26d734	8333	Semič
00050000-561b-7fc2-253f-cd65782c4842	8281	Senovo
00050000-561b-7fc2-d419-ad8b99787721	6224	Senožeče
00050000-561b-7fc2-e628-fff4b9a9dc12	8290	Sevnica
00050000-561b-7fc2-53ed-5b630fa2449d	6210	Sežana
00050000-561b-7fc2-6ed6-cf246d874e06	2214	Sladki Vrh
00050000-561b-7fc2-2dd4-a5f64c9a7e97	5283	Slap ob Idrijci
00050000-561b-7fc2-0fd9-664322af3ca7	2380	Slovenj Gradec
00050000-561b-7fc2-f429-4568cae9df19	2310	Slovenska Bistrica
00050000-561b-7fc2-b858-181335907bdd	3210	Slovenske Konjice
00050000-561b-7fc2-3df5-fe1949631719	1216	Smlednik
00050000-561b-7fc2-e92b-3c377d515299	5232	Soča
00050000-561b-7fc2-a735-39b19145b259	1317	Sodražica
00050000-561b-7fc2-28b4-c2db9eda5293	3335	Solčava
00050000-561b-7fc2-377b-296db4f65b56	5250	Solkan
00050000-561b-7fc2-27f9-8e62b42b4ab6	4229	Sorica
00050000-561b-7fc2-7cc7-1c9b63b4dcb4	4225	Sovodenj
00050000-561b-7fc2-e0de-228cac49013c	5281	Spodnja Idrija
00050000-561b-7fc2-9020-081efcc9ce51	2241	Spodnji Duplek
00050000-561b-7fc2-00d9-3b46eba155df	9245	Spodnji Ivanjci
00050000-561b-7fc2-c32a-7cbbae9b27ef	2277	Središče ob Dravi
00050000-561b-7fc2-d019-786c84f5eb61	4267	Srednja vas v Bohinju
00050000-561b-7fc2-eea0-69f7401009ac	8256	Sromlje 
00050000-561b-7fc2-9a4d-0a49f451c117	5224	Srpenica
00050000-561b-7fc2-a45b-28e398825573	1242	Stahovica
00050000-561b-7fc2-5dac-d4f0ee715534	1332	Stara Cerkev
00050000-561b-7fc2-40c4-9bf605169f5c	8342	Stari trg ob Kolpi
00050000-561b-7fc2-14b0-b31a5fe5475f	1386	Stari trg pri Ložu
00050000-561b-7fc2-3022-3f20d2ca31e6	2205	Starše
00050000-561b-7fc2-0083-be514a6674c3	2289	Stoperce
00050000-561b-7fc2-fa00-06bcc06aaa1a	8322	Stopiče
00050000-561b-7fc2-879b-c050f7a68c33	3206	Stranice
00050000-561b-7fc2-1708-6b4439eb08b1	8351	Straža
00050000-561b-7fc2-4916-f37e248680e1	1313	Struge
00050000-561b-7fc2-02ac-bcb11a52e472	8293	Studenec
00050000-561b-7fc2-8416-180b84f52fd4	8331	Suhor
00050000-561b-7fc2-23bf-726a52efd774	2233	Sv. Ana v Slovenskih goricah
00050000-561b-7fc2-b88f-e542fdf1bfcb	2235	Sv. Trojica v Slovenskih goricah
00050000-561b-7fc2-1e73-a478fe026b31	2353	Sveti Duh na Ostrem Vrhu
00050000-561b-7fc2-bcf7-058cdd9a800f	9244	Sveti Jurij ob Ščavnici
00050000-561b-7fc2-7d7d-edcab0a18154	3264	Sveti Štefan
00050000-561b-7fc2-259b-940da5166e94	2258	Sveti Tomaž
00050000-561b-7fc2-41e8-806406c826f3	9204	Šalovci
00050000-561b-7fc2-4e1a-61588be8bea2	5261	Šempas
00050000-561b-7fc2-9196-218e17b805c7	5290	Šempeter pri Gorici
00050000-561b-7fc2-c1aa-8307f8d684f9	3311	Šempeter v Savinjski dolini
00050000-561b-7fc2-2f26-42e7b110db36	4208	Šenčur
00050000-561b-7fc2-6eed-4bb25de045c3	2212	Šentilj v Slovenskih goricah
00050000-561b-7fc2-3ed7-79887d6b6da5	8297	Šentjanž
00050000-561b-7fc2-1461-1bb6040e0af8	2373	Šentjanž pri Dravogradu
00050000-561b-7fc2-0e0a-79e53ce1db6b	8310	Šentjernej
00050000-561b-7fc2-d5ce-3f5a4e77a4c1	3230	Šentjur
00050000-561b-7fc2-0aa8-20e306be6783	3271	Šentrupert
00050000-561b-7fc2-116f-e8ac7f6f2197	8232	Šentrupert
00050000-561b-7fc2-2689-680bfadc3d3c	1296	Šentvid pri Stični
00050000-561b-7fc2-f338-4f668d23bea2	8275	Škocjan
00050000-561b-7fc2-2f09-576f4dfc5450	6281	Škofije
00050000-561b-7fc2-f0da-1ee5234bc908	4220	Škofja Loka
00050000-561b-7fc2-597d-bb12a2b65ec3	3211	Škofja vas
00050000-561b-7fc2-8e05-468fe51a7fd2	1291	Škofljica
00050000-561b-7fc2-3251-18976783c423	6274	Šmarje
00050000-561b-7fc2-c280-d3f6495f0eec	1293	Šmarje - Sap
00050000-561b-7fc2-fb7e-2168434e28ea	3240	Šmarje pri Jelšah
00050000-561b-7fc2-d5b4-a01a3bc7519b	8220	Šmarješke Toplice
00050000-561b-7fc2-379b-d8d8bc9f35e1	2315	Šmartno na Pohorju
00050000-561b-7fc2-beb5-e7d1b08705b4	3341	Šmartno ob Dreti
00050000-561b-7fc2-5817-688ffa97837a	3327	Šmartno ob Paki
00050000-561b-7fc2-0665-cc22c68fcb71	1275	Šmartno pri Litiji
00050000-561b-7fc2-794b-2838505936cc	2383	Šmartno pri Slovenj Gradcu
00050000-561b-7fc2-49da-e99aaa68fa5d	3201	Šmartno v Rožni dolini
00050000-561b-7fc2-09e2-4821babf133d	3325	Šoštanj
00050000-561b-7fc2-f4ce-910b5e60b3d6	6222	Štanjel
00050000-561b-7fc2-58b5-23754b9be320	3220	Štore
00050000-561b-7fc2-b60b-5f2d23e52e0b	3304	Tabor
00050000-561b-7fc2-5b72-98cc55cc5405	3221	Teharje
00050000-561b-7fc2-8e08-fce9381d9e0d	9251	Tišina
00050000-561b-7fc2-aa3f-7fd7b947b984	5220	Tolmin
00050000-561b-7fc2-5e5d-f6221a1ed237	3326	Topolšica
00050000-561b-7fc2-b501-973a275bdfa5	2371	Trbonje
00050000-561b-7fc2-486c-da5cc7a66a45	1420	Trbovlje
00050000-561b-7fc2-80c0-f460bea51f62	8231	Trebelno 
00050000-561b-7fc2-0566-0719b9679e31	8210	Trebnje
00050000-561b-7fc2-c2c6-5a539af88537	5252	Trnovo pri Gorici
00050000-561b-7fc2-5897-d7ec87492ac5	2254	Trnovska vas
00050000-561b-7fc2-798b-b4cacea3ebb3	1222	Trojane
00050000-561b-7fc2-17fe-887cb1d54c76	1236	Trzin
00050000-561b-7fc2-d4a9-9e5ca7d970eb	4290	Tržič
00050000-561b-7fc2-3bea-18283b22ee2f	8295	Tržišče
00050000-561b-7fc2-6945-6cc7c446ce3b	1311	Turjak
00050000-561b-7fc2-7ff9-f3bf327979ba	9224	Turnišče
00050000-561b-7fc2-564e-bd71a4c909fa	8323	Uršna sela
00050000-561b-7fc2-11d5-f7746a78dece	1252	Vače
00050000-561b-7fc2-e486-6a1bf8bfd89f	3320	Velenje 
00050000-561b-7fc2-0544-beb97a489e62	3322	Velenje - poštni predali
00050000-561b-7fc2-4c78-fb5a600a85c7	8212	Velika Loka
00050000-561b-7fc2-31b2-cb7704a267b9	2274	Velika Nedelja
00050000-561b-7fc2-2f9d-8c94e9b6dc94	9225	Velika Polana
00050000-561b-7fc2-3644-b7f615ed30a4	1315	Velike Lašče
00050000-561b-7fc2-193a-3823e8408b2f	8213	Veliki Gaber
00050000-561b-7fc2-3b97-38d4cc70aff3	9241	Veržej
00050000-561b-7fc2-b9a5-4328069208c0	1312	Videm - Dobrepolje
00050000-561b-7fc2-6b25-229b478b5b5f	2284	Videm pri Ptuju
00050000-561b-7fc2-670a-4205e7de2f11	8344	Vinica
00050000-561b-7fc2-2bb2-6a6a8fa3af83	5271	Vipava
00050000-561b-7fc2-d2dd-d200e969e111	4212	Visoko
00050000-561b-7fc2-0e71-84f3cb7efc56	1294	Višnja Gora
00050000-561b-7fc2-96de-4e356b83ea9c	3205	Vitanje
00050000-561b-7fc2-a1fe-b91e460613e3	2255	Vitomarci
00050000-561b-7fc2-1fe1-f7e6012091ee	1217	Vodice
00050000-561b-7fc2-6fb4-136c2c66cd52	3212	Vojnik\t
00050000-561b-7fc2-49fc-9cb1613f258a	5293	Volčja Draga
00050000-561b-7fc2-f861-481b7b60bd66	2232	Voličina
00050000-561b-7fc2-4280-3f207a3ead87	3305	Vransko
00050000-561b-7fc2-8eb3-3c1d5ca0920a	6217	Vremski Britof
00050000-561b-7fc2-771b-4e9086971d63	1360	Vrhnika
00050000-561b-7fc2-9eec-7f24abe9140c	2365	Vuhred
00050000-561b-7fc2-8e71-22218d6d0713	2367	Vuzenica
00050000-561b-7fc2-56c1-e8531e3e7020	8292	Zabukovje 
00050000-561b-7fc2-e032-ab1ba66e431b	1410	Zagorje ob Savi
00050000-561b-7fc2-bacf-492aa9b4d3f4	1303	Zagradec
00050000-561b-7fc2-1865-b797a610b122	2283	Zavrč
00050000-561b-7fc2-5234-a6245026a2d2	8272	Zdole 
00050000-561b-7fc2-5bf5-d2fbd701c309	4201	Zgornja Besnica
00050000-561b-7fc2-35a6-ac6a35ae03f8	2242	Zgornja Korena
00050000-561b-7fc2-3b0b-3db2fb74dcb4	2201	Zgornja Kungota
00050000-561b-7fc2-8071-9e5f14e8606e	2316	Zgornja Ložnica
00050000-561b-7fc2-ec0a-7dc4c4ca42db	2314	Zgornja Polskava
00050000-561b-7fc2-c6a4-3867fc17ce0f	2213	Zgornja Velka
00050000-561b-7fc2-e28f-5370cf4f1b93	4247	Zgornje Gorje
00050000-561b-7fc2-556f-9547207734d9	4206	Zgornje Jezersko
00050000-561b-7fc2-15b6-0a2209d0eb4b	2285	Zgornji Leskovec
00050000-561b-7fc2-f9cd-1b88b5b3c8be	1432	Zidani Most
00050000-561b-7fc2-da49-0077ad4e0bd5	3214	Zreče
00050000-561b-7fc2-f5e5-f890c9a2deab	4209	Žabnica
00050000-561b-7fc2-739f-ef2996050c16	3310	Žalec
00050000-561b-7fc2-50e2-f62ef95dcb5b	4228	Železniki
00050000-561b-7fc2-38a6-8210aca22a84	2287	Žetale
00050000-561b-7fc2-d403-5298e50e20b7	4226	Žiri
00050000-561b-7fc2-d485-2ead162ec665	4274	Žirovnica
00050000-561b-7fc2-1dbc-ecae28e2313a	8360	Žužemberk
\.


--
-- TOC entry 3045 (class 0 OID 21666469)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 21666074)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 21665854)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-561b-7fc4-c41d-bff16d8f6e88	00080000-561b-7fc4-8e75-da9f3869d928	\N	00040000-561b-7fc2-f5d1-19401673e5b3	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-561b-7fc4-a301-7f2e4b210263	00080000-561b-7fc4-8e75-da9f3869d928	\N	00040000-561b-7fc2-f5d1-19401673e5b3	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-561b-7fc4-4a9c-b5cd070e2bd3	00080000-561b-7fc4-0e38-e30b46c12a1a	\N	00040000-561b-7fc2-f5d1-19401673e5b3	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3007 (class 0 OID 21665958)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 21666086)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3046 (class 0 OID 21666483)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3047 (class 0 OID 21666493)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-561b-7fc4-b621-ab2bbfe3c858	00080000-561b-7fc4-8d60-8e3a8890d3f6	0987	AK
00190000-561b-7fc4-74af-05a8de4e341c	00080000-561b-7fc4-0e38-e30b46c12a1a	0989	AK
00190000-561b-7fc4-13a7-41ab6f956eb1	00080000-561b-7fc4-0042-71b8d2bf2125	0986	AK
00190000-561b-7fc4-7668-a46925dbb6f5	00080000-561b-7fc4-acea-f16ae1c1d41f	0984	AK
00190000-561b-7fc4-61b3-6f919abc5800	00080000-561b-7fc4-14cf-ab3664b8f0d0	0983	AK
00190000-561b-7fc4-1509-766c11f85ba2	00080000-561b-7fc4-bae7-0da23cd9a944	0982	AK
00190000-561b-7fc6-eb50-ef6ea4a69569	00080000-561b-7fc6-0c6a-f3f271585c2d	1001	AK
\.


--
-- TOC entry 3044 (class 0 OID 21666416)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-561b-7fc5-b20a-055931889138	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3048 (class 0 OID 21666501)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 21666115)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-561b-7fc4-27dc-461fb33513d8	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-561b-7fc4-fe2f-6dbb596b1897	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-561b-7fc4-0c79-094614eff98a	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-561b-7fc4-bd1d-f8f403ccb53a	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-561b-7fc4-2ba0-f3a614b1106d	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-561b-7fc4-ba93-660a3bbc47df	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-561b-7fc4-c07e-fd6661242b85	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3016 (class 0 OID 21666059)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 21666049)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 21666259)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 21666189)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 21665932)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 21665727)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-561b-7fc6-0c6a-f3f271585c2d	00010000-561b-7fc2-127e-16a177ca7327	2015-10-12 11:39:18	INS	a:0:{}
2	App\\Entity\\Option	00000000-561b-7fc6-84be-5b38524a6191	00010000-561b-7fc2-127e-16a177ca7327	2015-10-12 11:39:18	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-561b-7fc6-eb50-ef6ea4a69569	00010000-561b-7fc2-127e-16a177ca7327	2015-10-12 11:39:18	INS	a:0:{}
\.


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3025 (class 0 OID 21666128)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 21665765)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-561b-7fc2-57b6-00233a782b93	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-561b-7fc2-8698-779b6d70fcd1	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-561b-7fc2-e887-10e28905dad4	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-561b-7fc2-af59-d6ee2cb67df8	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-561b-7fc2-d37b-ce94301a35cf	planer	Planer dogodkov v koledarju	t
00020000-561b-7fc2-fd3d-0e5cbf850ea7	kadrovska	Kadrovska služba	t
00020000-561b-7fc2-cfc0-4d8ee51eab39	arhivar	Ažuriranje arhivalij	t
00020000-561b-7fc2-aea9-37940ff6e485	igralec	Igralec	t
00020000-561b-7fc2-5c16-5a8665a67cfb	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-561b-7fc4-3e64-1716cd26efbb	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2990 (class 0 OID 21665749)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-561b-7fc2-74f5-9ed21a5dd6a5	00020000-561b-7fc2-e887-10e28905dad4
00010000-561b-7fc2-127e-16a177ca7327	00020000-561b-7fc2-e887-10e28905dad4
00010000-561b-7fc4-c565-d296c0a5046f	00020000-561b-7fc4-3e64-1716cd26efbb
\.


--
-- TOC entry 3027 (class 0 OID 21666142)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 21666080)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 21666026)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 21665714)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-561b-7fc2-628c-886c0175bc08	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-561b-7fc2-eb47-4c0d8e48caf4	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-561b-7fc2-f840-d59a74fc6a04	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-561b-7fc2-64d4-b1ca74982ca1	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-561b-7fc2-d15e-19a499ec8a72	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2985 (class 0 OID 21665706)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-561b-7fc2-83b4-2298d164eb4c	00230000-561b-7fc2-64d4-b1ca74982ca1	popa
00240000-561b-7fc2-707b-e01c45faa4dd	00230000-561b-7fc2-64d4-b1ca74982ca1	oseba
00240000-561b-7fc2-da0b-a0255c235639	00230000-561b-7fc2-64d4-b1ca74982ca1	sezona
00240000-561b-7fc2-ad7e-3193135fed40	00230000-561b-7fc2-eb47-4c0d8e48caf4	prostor
00240000-561b-7fc2-3b00-2d51d950b81f	00230000-561b-7fc2-64d4-b1ca74982ca1	besedilo
00240000-561b-7fc2-1ae5-ddc5dcbfa840	00230000-561b-7fc2-64d4-b1ca74982ca1	uprizoritev
00240000-561b-7fc2-1242-c3c62f797089	00230000-561b-7fc2-64d4-b1ca74982ca1	funkcija
00240000-561b-7fc2-6ddc-adbfeb587584	00230000-561b-7fc2-64d4-b1ca74982ca1	tipfunkcije
00240000-561b-7fc2-58f1-c78030c4fea6	00230000-561b-7fc2-64d4-b1ca74982ca1	alternacija
00240000-561b-7fc2-a729-729f72d7122d	00230000-561b-7fc2-628c-886c0175bc08	pogodba
00240000-561b-7fc2-2dd7-784da6f7eed8	00230000-561b-7fc2-64d4-b1ca74982ca1	zaposlitev
00240000-561b-7fc2-a78e-1920d53f594e	00230000-561b-7fc2-64d4-b1ca74982ca1	zvrstuprizoritve
00240000-561b-7fc2-affe-c2512011d94f	00230000-561b-7fc2-628c-886c0175bc08	programdela
00240000-561b-7fc2-44c6-f5d33f581e58	00230000-561b-7fc2-64d4-b1ca74982ca1	zapis
\.


--
-- TOC entry 2984 (class 0 OID 21665701)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
659016e6-6a2a-4782-9313-9a8718b95353	00240000-561b-7fc2-83b4-2298d164eb4c	0	1001
\.


--
-- TOC entry 3033 (class 0 OID 21666206)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-561b-7fc5-8cf9-c622257ab532	000e0000-561b-7fc5-393a-3a14c28a107e	00080000-561b-7fc4-8e75-da9f3869d928	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-561b-7fc2-27bd-bd3381b66325
00270000-561b-7fc5-4a61-b3470d3fdcfd	000e0000-561b-7fc5-393a-3a14c28a107e	00080000-561b-7fc4-8e75-da9f3869d928	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-561b-7fc2-27bd-bd3381b66325
\.


--
-- TOC entry 2997 (class 0 OID 21665827)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 21666036)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-561b-7fc5-8d1d-4e6a2584dc4b	00180000-561b-7fc5-1a9f-18ed0aaedca4	000c0000-561b-7fc5-ff64-3851a226e7f1	00090000-561b-7fc4-f28e-d6bef3dae078	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561b-7fc5-80ce-a191b2a24a2c	00180000-561b-7fc5-1a9f-18ed0aaedca4	000c0000-561b-7fc5-2a16-f270892a3bd3	00090000-561b-7fc4-6eaa-1ecece291e0a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561b-7fc5-3187-9c55558018f0	00180000-561b-7fc5-1a9f-18ed0aaedca4	000c0000-561b-7fc5-45c5-b088a627502d	00090000-561b-7fc4-ddbc-0d1ad5a68bc1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561b-7fc5-2908-a8a43405da83	00180000-561b-7fc5-1a9f-18ed0aaedca4	000c0000-561b-7fc5-5b2d-2accd466d4d1	00090000-561b-7fc4-55b7-6dedc7244952	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561b-7fc5-5a1f-620515629fd8	00180000-561b-7fc5-1a9f-18ed0aaedca4	000c0000-561b-7fc5-83c7-6fc406253a7b	00090000-561b-7fc4-8dad-a9fe3ff873b2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-561b-7fc5-d750-588e654ec26e	00180000-561b-7fc5-13ca-1d36a883af6c	\N	00090000-561b-7fc4-8dad-a9fe3ff873b2	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3036 (class 0 OID 21666247)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-561b-7fc2-e011-a3d71b8d9b2e	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-561b-7fc2-d12a-db51d8822ce8	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-561b-7fc2-5afb-2150a204be4c	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-561b-7fc2-6288-fdf0b15e51e6	04	Režija	Režija	Režija	umetnik	30
000f0000-561b-7fc2-1672-441609cbdcda	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-561b-7fc2-640e-3694b8759172	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-561b-7fc2-9146-45fc4fd59d09	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-561b-7fc2-8dd1-de6e074ee574	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-561b-7fc2-1edd-50ba74a89f1e	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-561b-7fc2-32b7-edbad97f2766	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-561b-7fc2-486d-d6aa3168a8ad	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-561b-7fc2-44ed-54b748eb733a	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-561b-7fc2-2365-4c0e3cd8522d	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-561b-7fc2-c272-cd9782d14d2e	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-561b-7fc2-e6a5-a7bba6a220cf	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-561b-7fc2-2027-ef379333d81d	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-561b-7fc2-73ac-07907aabf804	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-561b-7fc2-a764-2089a0ff096b	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3049 (class 0 OID 21666512)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-561b-7fc2-029d-a3b7951f5d11	01	Velika predstava	f	1.00	1.00
002b0000-561b-7fc2-b6e4-e1c67bdbc180	02	Mala predstava	f	0.50	0.50
002b0000-561b-7fc2-5538-d2a6666828c6	03	Mala koprodukcija	t	0.40	1.00
002b0000-561b-7fc2-4152-fe8a802ebc5a	04	Srednja koprodukcija	t	0.70	2.00
002b0000-561b-7fc2-d32f-00980c5b5893	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3002 (class 0 OID 21665889)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 21665736)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-561b-7fc2-127e-16a177ca7327	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROuKoZm8EX.I8ij/I9YMNaujUrj1wSqjy	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-561b-7fc4-47a3-e6a2a3a72bf2	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-561b-7fc4-4728-dfc4a7b5fde5	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-561b-7fc4-895e-9b8cd31748f6	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-561b-7fc4-3685-779485edcd8c	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-561b-7fc4-859a-8182c1c13a0b	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-561b-7fc4-cc9e-8307b44af15d	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-561b-7fc4-8bfd-6688a410feac	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-561b-7fc4-2d3c-3d8ec77465e9	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-561b-7fc4-5cc7-d523ba72a89b	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-561b-7fc4-c565-d296c0a5046f	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-561b-7fc2-74f5-9ed21a5dd6a5	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3040 (class 0 OID 21666297)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-561b-7fc5-8db3-10cee6dd0237	00160000-561b-7fc4-4ec2-52054cfc47b3	\N	00140000-561b-7fc2-84bf-43e9f0b916a8	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-561b-7fc4-2ba0-f3a614b1106d
000e0000-561b-7fc5-393a-3a14c28a107e	00160000-561b-7fc4-eff6-d02378580889	\N	00140000-561b-7fc2-2fb6-7ee79cd4ed87	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-561b-7fc4-ba93-660a3bbc47df
000e0000-561b-7fc5-1ccb-82ac33af3f39	\N	\N	00140000-561b-7fc2-2fb6-7ee79cd4ed87	00190000-561b-7fc4-b621-ab2bbfe3c858	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-561b-7fc4-2ba0-f3a614b1106d
000e0000-561b-7fc5-b7dd-46c3c2f0645d	\N	\N	00140000-561b-7fc2-2fb6-7ee79cd4ed87	00190000-561b-7fc4-b621-ab2bbfe3c858	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-561b-7fc4-2ba0-f3a614b1106d
000e0000-561b-7fc5-a84c-b5f9c7ca84e8	\N	\N	00140000-561b-7fc2-2fb6-7ee79cd4ed87	00190000-561b-7fc4-b621-ab2bbfe3c858	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-561b-7fc4-27dc-461fb33513d8
000e0000-561b-7fc5-41ac-f3993ffb29c8	\N	\N	00140000-561b-7fc2-2fb6-7ee79cd4ed87	00190000-561b-7fc4-b621-ab2bbfe3c858	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-561b-7fc4-27dc-461fb33513d8
\.


--
-- TOC entry 3009 (class 0 OID 21665980)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-561b-7fc5-7cd6-c14785565130	000e0000-561b-7fc5-393a-3a14c28a107e	\N	1	
00200000-561b-7fc5-0f8d-ed8f9aa0da85	000e0000-561b-7fc5-393a-3a14c28a107e	\N	2	
00200000-561b-7fc5-4089-ac35001d35c5	000e0000-561b-7fc5-393a-3a14c28a107e	\N	3	
00200000-561b-7fc5-3b33-7f850b57e3a2	000e0000-561b-7fc5-393a-3a14c28a107e	\N	4	
00200000-561b-7fc5-9de3-9da0d4a730bd	000e0000-561b-7fc5-393a-3a14c28a107e	\N	5	
\.


--
-- TOC entry 3023 (class 0 OID 21666107)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 21666220)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-561b-7fc2-3c82-cfa4aa3465ea	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-561b-7fc2-e15e-cc9985e22524	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-561b-7fc2-cf8b-4cdb823c8bfc	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-561b-7fc2-8d10-6a345259dba5	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-561b-7fc2-d830-633d0070cf22	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-561b-7fc2-fc10-e056e47cd9f0	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-561b-7fc2-0ef3-721bacbab469	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-561b-7fc2-db7e-cbdaa480aeea	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-561b-7fc2-27bd-bd3381b66325	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-561b-7fc2-f45f-2786037255da	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-561b-7fc2-de67-904b54b36a58	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-561b-7fc2-7113-d12d3f71677c	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-561b-7fc2-4db0-0d71ad080274	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-561b-7fc2-4503-7e5b7bfbf451	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-561b-7fc2-be6e-0089d458ade1	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-561b-7fc2-4ccc-8896fe024fb9	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-561b-7fc2-c97b-15dc805661d0	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-561b-7fc2-3a44-2178c67dff64	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-561b-7fc2-27dc-e96196e3929a	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-561b-7fc2-b30f-33438e6d6453	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-561b-7fc2-f0f9-2f43a50f71da	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-561b-7fc2-915b-e67009b82fad	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-561b-7fc2-9a5d-8c7ceb06fef6	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-561b-7fc2-3d9c-9d9349b5f0bc	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-561b-7fc2-ad9c-e74fe056be96	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-561b-7fc2-39bc-bb44a7df52c6	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-561b-7fc2-f748-608bdddf9086	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-561b-7fc2-c69f-8bd63e5ab931	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3052 (class 0 OID 21666559)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3051 (class 0 OID 21666531)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 21666571)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 21666179)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-561b-7fc5-f563-2ad37a71cca9	00090000-561b-7fc4-6eaa-1ecece291e0a	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-561b-7fc5-3e11-95d47e125030	00090000-561b-7fc4-ddbc-0d1ad5a68bc1	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-561b-7fc5-cb92-4ea29c4061ed	00090000-561b-7fc4-8b5a-31139e830c05	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-561b-7fc5-cf49-7865c54b30b1	00090000-561b-7fc4-09c1-b56a0f25d9aa	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-561b-7fc5-e47b-e395f6bfca99	00090000-561b-7fc4-f28e-d6bef3dae078	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-561b-7fc5-4d61-43a699a7e81a	00090000-561b-7fc4-95a6-66c7a6e2e6b4	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 3011 (class 0 OID 21666015)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 21666287)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-561b-7fc2-84bf-43e9f0b916a8	01	Drama	drama (SURS 01)
00140000-561b-7fc2-1dbb-cf486faff7d3	02	Opera	opera (SURS 02)
00140000-561b-7fc2-b9c6-258d6f6d1bd5	03	Balet	balet (SURS 03)
00140000-561b-7fc2-7423-4cccb2051231	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-561b-7fc2-4749-43bb21170e40	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-561b-7fc2-2fb6-7ee79cd4ed87	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-561b-7fc2-c819-c7ea6208f789	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3029 (class 0 OID 21666169)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2516 (class 2606 OID 21665790)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 21666346)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 21666336)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 21666203)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 21666245)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2765 (class 2606 OID 21666611)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 21666004)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 21666025)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 21666529)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 21665915)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 21666410)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 21666165)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 21665978)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 21665953)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 21665929)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 21666072)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 21666588)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 21666595)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2770 (class 2606 OID 21666619)
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
-- TOC entry 2628 (class 2606 OID 21666099)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 21665887)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 21665799)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 21665823)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 21665779)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2507 (class 2606 OID 21665764)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 21666105)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 21666141)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 21666282)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 21665851)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 21665875)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 21666481)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 21666078)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 21665865)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 21665966)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 21666090)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 21666490)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 21666498)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 21666468)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 21666510)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 21666123)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 21666063)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 21666054)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 21666269)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 21666196)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 21665941)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 21665735)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 21666132)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 21665753)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2509 (class 2606 OID 21665773)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 21666150)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 21666085)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 21666034)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 21665723)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 21665711)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 21665705)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 21666216)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 21665832)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 21666045)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 21666256)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 21666522)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 21665900)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 21665748)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 21666315)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 21665988)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 21666113)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 21666228)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 21666569)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 21666553)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 21666577)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 21666187)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 21666019)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 21666295)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 21666177)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 1259 OID 21666013)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2581 (class 1259 OID 21666014)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2582 (class 1259 OID 21666012)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2583 (class 1259 OID 21666011)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2584 (class 1259 OID 21666010)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2670 (class 1259 OID 21666217)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2671 (class 1259 OID 21666218)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2672 (class 1259 OID 21666219)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2756 (class 1259 OID 21666590)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2757 (class 1259 OID 21666589)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2530 (class 1259 OID 21665853)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2629 (class 1259 OID 21666106)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2743 (class 1259 OID 21666557)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2744 (class 1259 OID 21666556)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2745 (class 1259 OID 21666558)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2746 (class 1259 OID 21666555)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2747 (class 1259 OID 21666554)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2623 (class 1259 OID 21666092)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2624 (class 1259 OID 21666091)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2575 (class 1259 OID 21665989)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 21666166)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2654 (class 1259 OID 21666168)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2655 (class 1259 OID 21666167)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2555 (class 1259 OID 21665931)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2556 (class 1259 OID 21665930)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2734 (class 1259 OID 21666511)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2686 (class 1259 OID 21666284)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2687 (class 1259 OID 21666285)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2688 (class 1259 OID 21666286)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2753 (class 1259 OID 21666578)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2695 (class 1259 OID 21666320)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2696 (class 1259 OID 21666317)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2697 (class 1259 OID 21666321)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2698 (class 1259 OID 21666319)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2699 (class 1259 OID 21666318)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2545 (class 1259 OID 21665902)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2546 (class 1259 OID 21665901)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2521 (class 1259 OID 21665826)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2641 (class 1259 OID 21666133)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2511 (class 1259 OID 21665780)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2512 (class 1259 OID 21665781)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2646 (class 1259 OID 21666153)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2647 (class 1259 OID 21666152)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2648 (class 1259 OID 21666151)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2568 (class 1259 OID 21665967)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 21665968)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2491 (class 1259 OID 21665713)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2603 (class 1259 OID 21666058)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2604 (class 1259 OID 21666056)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2605 (class 1259 OID 21666055)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2606 (class 1259 OID 21666057)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2502 (class 1259 OID 21665754)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2503 (class 1259 OID 21665755)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2632 (class 1259 OID 21666114)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2766 (class 1259 OID 21666612)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2668 (class 1259 OID 21666205)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2669 (class 1259 OID 21666204)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2767 (class 1259 OID 21666620)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2768 (class 1259 OID 21666621)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2618 (class 1259 OID 21666079)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2662 (class 1259 OID 21666197)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2663 (class 1259 OID 21666198)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2716 (class 1259 OID 21666415)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2717 (class 1259 OID 21666414)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2718 (class 1259 OID 21666411)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2719 (class 1259 OID 21666412)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2720 (class 1259 OID 21666413)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2534 (class 1259 OID 21665867)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2535 (class 1259 OID 21665866)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2536 (class 1259 OID 21665868)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2635 (class 1259 OID 21666127)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2636 (class 1259 OID 21666126)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2726 (class 1259 OID 21666491)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2727 (class 1259 OID 21666492)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2709 (class 1259 OID 21666350)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2710 (class 1259 OID 21666351)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2711 (class 1259 OID 21666348)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2712 (class 1259 OID 21666349)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2659 (class 1259 OID 21666188)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2609 (class 1259 OID 21666067)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2610 (class 1259 OID 21666066)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2611 (class 1259 OID 21666064)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2612 (class 1259 OID 21666065)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2705 (class 1259 OID 21666338)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2706 (class 1259 OID 21666337)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2559 (class 1259 OID 21665942)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2562 (class 1259 OID 21665956)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2563 (class 1259 OID 21665955)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2564 (class 1259 OID 21665954)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2565 (class 1259 OID 21665957)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2574 (class 1259 OID 21665979)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2723 (class 1259 OID 21666482)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2742 (class 1259 OID 21666530)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2760 (class 1259 OID 21666596)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2761 (class 1259 OID 21666597)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2517 (class 1259 OID 21665801)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2518 (class 1259 OID 21665800)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2526 (class 1259 OID 21665833)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2527 (class 1259 OID 21665834)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 21666020)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2598 (class 1259 OID 21666048)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2599 (class 1259 OID 21666047)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2600 (class 1259 OID 21666046)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2585 (class 1259 OID 21666006)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2586 (class 1259 OID 21666007)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2587 (class 1259 OID 21666005)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2588 (class 1259 OID 21666009)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2589 (class 1259 OID 21666008)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2533 (class 1259 OID 21665852)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2551 (class 1259 OID 21665916)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2552 (class 1259 OID 21665918)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2553 (class 1259 OID 21665917)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2554 (class 1259 OID 21665919)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2617 (class 1259 OID 21666073)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2691 (class 1259 OID 21666283)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2700 (class 1259 OID 21666316)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2682 (class 1259 OID 21666257)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2683 (class 1259 OID 21666258)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2524 (class 1259 OID 21665824)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2525 (class 1259 OID 21665825)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2656 (class 1259 OID 21666178)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2497 (class 1259 OID 21665724)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2544 (class 1259 OID 21665888)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2494 (class 1259 OID 21665712)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2739 (class 1259 OID 21666523)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2639 (class 1259 OID 21666125)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2640 (class 1259 OID 21666124)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2713 (class 1259 OID 21666347)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2541 (class 1259 OID 21665876)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 21666296)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 21666570)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2732 (class 1259 OID 21666499)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 21666500)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2679 (class 1259 OID 21666246)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2597 (class 1259 OID 21666035)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2510 (class 1259 OID 21665774)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2801 (class 2606 OID 21666752)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2800 (class 2606 OID 21666757)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2796 (class 2606 OID 21666777)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2802 (class 2606 OID 21666747)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2798 (class 2606 OID 21666767)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2797 (class 2606 OID 21666772)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2799 (class 2606 OID 21666762)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2837 (class 2606 OID 21666942)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2836 (class 2606 OID 21666947)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2835 (class 2606 OID 21666952)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2869 (class 2606 OID 21667117)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2870 (class 2606 OID 21667112)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2782 (class 2606 OID 21666677)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2819 (class 2606 OID 21666862)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2864 (class 2606 OID 21667097)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2865 (class 2606 OID 21667092)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2863 (class 2606 OID 21667102)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2866 (class 2606 OID 21667087)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2867 (class 2606 OID 21667082)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2817 (class 2606 OID 21666857)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2818 (class 2606 OID 21666852)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2795 (class 2606 OID 21666742)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2829 (class 2606 OID 21666902)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2827 (class 2606 OID 21666912)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2828 (class 2606 OID 21666907)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2788 (class 2606 OID 21666712)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2789 (class 2606 OID 21666707)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2815 (class 2606 OID 21666842)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2861 (class 2606 OID 21667072)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2840 (class 2606 OID 21666957)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2839 (class 2606 OID 21666962)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2838 (class 2606 OID 21666967)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2868 (class 2606 OID 21667107)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2842 (class 2606 OID 21666987)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2845 (class 2606 OID 21666972)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2841 (class 2606 OID 21666992)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2843 (class 2606 OID 21666982)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2844 (class 2606 OID 21666977)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2786 (class 2606 OID 21666702)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 21666697)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2778 (class 2606 OID 21666662)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2779 (class 2606 OID 21666657)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2823 (class 2606 OID 21666882)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2775 (class 2606 OID 21666637)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2774 (class 2606 OID 21666642)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2824 (class 2606 OID 21666897)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2825 (class 2606 OID 21666892)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2826 (class 2606 OID 21666887)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2793 (class 2606 OID 21666727)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2792 (class 2606 OID 21666732)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2771 (class 2606 OID 21666622)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2807 (class 2606 OID 21666817)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2809 (class 2606 OID 21666807)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2810 (class 2606 OID 21666802)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2808 (class 2606 OID 21666812)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2773 (class 2606 OID 21666627)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2772 (class 2606 OID 21666632)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2820 (class 2606 OID 21666867)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2873 (class 2606 OID 21667132)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2833 (class 2606 OID 21666937)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2834 (class 2606 OID 21666932)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2875 (class 2606 OID 21667137)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2874 (class 2606 OID 21667142)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2816 (class 2606 OID 21666847)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2832 (class 2606 OID 21666922)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2831 (class 2606 OID 21666927)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2852 (class 2606 OID 21667047)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2853 (class 2606 OID 21667042)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2856 (class 2606 OID 21667027)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2855 (class 2606 OID 21667032)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2854 (class 2606 OID 21667037)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2784 (class 2606 OID 21666687)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2785 (class 2606 OID 21666682)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2783 (class 2606 OID 21666692)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2821 (class 2606 OID 21666877)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2822 (class 2606 OID 21666872)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2859 (class 2606 OID 21667057)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2858 (class 2606 OID 21667062)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2849 (class 2606 OID 21667017)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2848 (class 2606 OID 21667022)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2851 (class 2606 OID 21667007)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2850 (class 2606 OID 21667012)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2830 (class 2606 OID 21666917)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2811 (class 2606 OID 21666837)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2812 (class 2606 OID 21666832)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2814 (class 2606 OID 21666822)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2813 (class 2606 OID 21666827)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2846 (class 2606 OID 21667002)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2847 (class 2606 OID 21666997)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2790 (class 2606 OID 21666717)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2791 (class 2606 OID 21666722)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2794 (class 2606 OID 21666737)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2857 (class 2606 OID 21667052)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2860 (class 2606 OID 21667067)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2862 (class 2606 OID 21667077)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2872 (class 2606 OID 21667122)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2871 (class 2606 OID 21667127)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2776 (class 2606 OID 21666652)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2777 (class 2606 OID 21666647)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2781 (class 2606 OID 21666667)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2780 (class 2606 OID 21666672)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2803 (class 2606 OID 21666782)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2804 (class 2606 OID 21666797)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2805 (class 2606 OID 21666792)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2806 (class 2606 OID 21666787)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-12 11:39:19 CEST

--
-- PostgreSQL database dump complete
--

