--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-10-26 16:11:28 CET

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
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 249
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 23432969)
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
-- TOC entry 233 (class 1259 OID 23433577)
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
-- TOC entry 232 (class 1259 OID 23433560)
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
-- TOC entry 223 (class 1259 OID 23433437)
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
-- TOC entry 226 (class 1259 OID 23433467)
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
-- TOC entry 247 (class 1259 OID 23433848)
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
-- TOC entry 200 (class 1259 OID 23433217)
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
-- TOC entry 202 (class 1259 OID 23433248)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 23433774)
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
-- TOC entry 191 (class 1259 OID 23433114)
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
-- TOC entry 234 (class 1259 OID 23433590)
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
-- TOC entry 219 (class 1259 OID 23433391)
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
-- TOC entry 197 (class 1259 OID 23433188)
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
-- TOC entry 194 (class 1259 OID 23433154)
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
-- TOC entry 3134 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 192 (class 1259 OID 23433131)
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
-- TOC entry 208 (class 1259 OID 23433305)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 245 (class 1259 OID 23433829)
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
-- TOC entry 246 (class 1259 OID 23433841)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 248 (class 1259 OID 23433863)
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
-- TOC entry 212 (class 1259 OID 23433330)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 189 (class 1259 OID 23433088)
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
-- TOC entry 182 (class 1259 OID 23432988)
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
-- TOC entry 186 (class 1259 OID 23433055)
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
-- TOC entry 183 (class 1259 OID 23432999)
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
    twitter character varying(255) DEFAULT NULL::character varying,
    skype character varying(255) DEFAULT NULL::character varying,
    fb character varying(255) DEFAULT NULL::character varying,
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
-- TOC entry 177 (class 1259 OID 23432943)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 23432962)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 23433337)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 217 (class 1259 OID 23433371)
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
-- TOC entry 229 (class 1259 OID 23433508)
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
-- TOC entry 185 (class 1259 OID 23433035)
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
-- TOC entry 188 (class 1259 OID 23433080)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 23433719)
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
-- TOC entry 209 (class 1259 OID 23433311)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 187 (class 1259 OID 23433065)
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
-- TOC entry 199 (class 1259 OID 23433209)
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
-- TOC entry 195 (class 1259 OID 23433169)
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
-- TOC entry 196 (class 1259 OID 23433181)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 23433323)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 23433733)
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
-- TOC entry 238 (class 1259 OID 23433743)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 23433658)
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
-- TOC entry 239 (class 1259 OID 23433751)
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
-- TOC entry 215 (class 1259 OID 23433352)
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
-- TOC entry 207 (class 1259 OID 23433296)
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
-- TOC entry 206 (class 1259 OID 23433286)
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
-- TOC entry 228 (class 1259 OID 23433497)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 222 (class 1259 OID 23433427)
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
-- TOC entry 193 (class 1259 OID 23433143)
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
-- TOC entry 174 (class 1259 OID 23432914)
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
-- TOC entry 173 (class 1259 OID 23432912)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3135 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 216 (class 1259 OID 23433365)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 23432952)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 23432936)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 23433379)
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
-- TOC entry 210 (class 1259 OID 23433317)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 204 (class 1259 OID 23433263)
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
-- TOC entry 172 (class 1259 OID 23432901)
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
-- TOC entry 171 (class 1259 OID 23432893)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 170 (class 1259 OID 23432888)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 224 (class 1259 OID 23433444)
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
-- TOC entry 184 (class 1259 OID 23433027)
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
-- TOC entry 205 (class 1259 OID 23433273)
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
-- TOC entry 227 (class 1259 OID 23433485)
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
-- TOC entry 181 (class 1259 OID 23432978)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 240 (class 1259 OID 23433762)
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
-- TOC entry 203 (class 1259 OID 23433253)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 190 (class 1259 OID 23433100)
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
-- TOC entry 175 (class 1259 OID 23432923)
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
-- TOC entry 231 (class 1259 OID 23433535)
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
-- TOC entry 198 (class 1259 OID 23433199)
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
-- TOC entry 214 (class 1259 OID 23433344)
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
-- TOC entry 225 (class 1259 OID 23433458)
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
-- TOC entry 243 (class 1259 OID 23433809)
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
-- TOC entry 242 (class 1259 OID 23433781)
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
-- TOC entry 244 (class 1259 OID 23433821)
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
-- TOC entry 221 (class 1259 OID 23433416)
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
-- TOC entry 201 (class 1259 OID 23433242)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 230 (class 1259 OID 23433525)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 220 (class 1259 OID 23433406)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2220 (class 2604 OID 23432917)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3058 (class 0 OID 23432969)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-562e-429d-d9a5-fb6de7fc4ee6	10	30	Otroci	Abonma za otroke	200
000a0000-562e-429d-0c64-e5cd0e6e8633	20	60	Mladina	Abonma za mladino	400
000a0000-562e-429d-f578-8e9cece73627	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3111 (class 0 OID 23433577)
-- Dependencies: 233
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-562e-429d-fff9-5d4a2720ca89	000d0000-562e-429d-6b11-382df6a59d53	\N	00090000-562e-429d-87d5-5e31284de100	000b0000-562e-429d-ec10-1a34e8c58793	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-562e-429d-2a1a-578cd363d055	000d0000-562e-429d-ad04-67a6cf182196	00100000-562e-429d-3c27-4425b86338dd	00090000-562e-429d-d2ea-87391b3e846f	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-562e-429d-0909-6525365bbe1b	000d0000-562e-429d-f5a7-0ec385267f6e	00100000-562e-429d-0cc5-3bb40ed9db31	00090000-562e-429d-44c0-29942e3aac58	\N	0003	t	\N	2015-10-26	\N	2	t	\N	f	f
000c0000-562e-429d-37d7-0e8fe726074c	000d0000-562e-429d-3614-5c27e00e3721	\N	00090000-562e-429d-13f3-51a73502b56f	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-562e-429d-d107-e651335573e6	000d0000-562e-429d-2bbb-949d32ea6b64	\N	00090000-562e-429d-981e-4819d3c12f1b	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-562e-429d-1d8b-1c30e25a8a14	000d0000-562e-429d-2a13-2dd408a1ef8f	\N	00090000-562e-429d-efdd-559c9c6cbad8	000b0000-562e-429d-f984-9e71b47be75e	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-562e-429d-6408-6d708292475c	000d0000-562e-429d-172c-32c4ed7f5244	00100000-562e-429d-17ff-79a00ecdbf98	00090000-562e-429d-9682-376dec1dfa22	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-562e-429d-b253-06876ad6c466	000d0000-562e-429d-92f8-b479c7a69795	\N	00090000-562e-429d-b0a7-90020110a99a	000b0000-562e-429d-d2a9-3f2a588b6453	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-562e-429d-66ca-8f68d0de3b21	000d0000-562e-429d-172c-32c4ed7f5244	00100000-562e-429d-56f4-2c87248a4faf	00090000-562e-429d-9edd-0e4d1302a2fb	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-562e-429d-c088-bbe0fd282212	000d0000-562e-429d-172c-32c4ed7f5244	00100000-562e-429d-da1b-84d0572f91c6	00090000-562e-429d-0f7d-7858a02bfd7d	\N	0010	t	\N	2015-10-26	\N	16	f	\N	f	t
000c0000-562e-429d-930e-ccb570c2f360	000d0000-562e-429d-172c-32c4ed7f5244	00100000-562e-429d-9b5f-448135b18d5e	00090000-562e-429d-a49f-4c58844bd3c2	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-562e-429d-821f-3a78f01b6c85	000d0000-562e-429d-5d55-2b0b34ad8923	\N	00090000-562e-429d-d2ea-87391b3e846f	000b0000-562e-429d-874b-397bcd6a1aef	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3110 (class 0 OID 23433560)
-- Dependencies: 232
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 23433437)
-- Dependencies: 223
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-562e-429d-2a38-fd0a283e2408	00160000-562e-429d-48f3-537ee5fddf18	00090000-562e-429d-e8ff-542ceaf8e36c	aizv	10	t
003d0000-562e-429d-f56e-3fe304c62f32	00160000-562e-429d-48f3-537ee5fddf18	00090000-562e-429d-f006-67c8c21f56df	apri	14	t
003d0000-562e-429d-ddb2-6ac1131498c2	00160000-562e-429d-f907-7089d0bb595c	00090000-562e-429d-0e84-2aed0194563f	aizv	11	t
003d0000-562e-429d-bcc2-589118fba69b	00160000-562e-429d-30b4-79847347e8ba	00090000-562e-429d-29c7-ada523151dbe	aizv	12	t
003d0000-562e-429d-7399-7c2ea98a9b62	00160000-562e-429d-48f3-537ee5fddf18	00090000-562e-429d-caa1-0ea71ee68d03	apri	18	f
\.


--
-- TOC entry 3104 (class 0 OID 23433467)
-- Dependencies: 226
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-562e-429d-48f3-537ee5fddf18	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-562e-429d-f907-7089d0bb595c	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-562e-429d-30b4-79847347e8ba	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3125 (class 0 OID 23433848)
-- Dependencies: 247
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3078 (class 0 OID 23433217)
-- Dependencies: 200
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-562e-429d-fa10-0b0d14a91525	\N	\N	00200000-562e-429d-11da-42a65cb93db2	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-562e-429d-b72e-2970ea6775bc	\N	\N	00200000-562e-429d-f366-96d4861256d8	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-562e-429d-cc76-1e2fc45d8a4f	\N	\N	00200000-562e-429d-013b-38666d9bdc03	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-562e-429d-ccae-e0db8c3dcc8a	\N	\N	00200000-562e-429d-e39f-d5f08f1aaf01	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-562e-429d-3a77-3692ecbdbd2d	\N	\N	00200000-562e-429d-23ba-be1fa791fd26	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3080 (class 0 OID 23433248)
-- Dependencies: 202
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 23433774)
-- Dependencies: 241
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3069 (class 0 OID 23433114)
-- Dependencies: 191
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-562e-429a-8233-2b4e008cc761	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-562e-429a-89ff-ec9b130abc77	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-562e-429a-e63b-4c7fc7774d9a	AL	ALB	008	Albania 	Albanija	\N
00040000-562e-429a-6e5b-a704b82401d9	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-562e-429a-a567-f92c96f38455	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-562e-429a-557b-1d10fc5e985f	AD	AND	020	Andorra 	Andora	\N
00040000-562e-429a-f766-ce17c5448abf	AO	AGO	024	Angola 	Angola	\N
00040000-562e-429a-804f-da379cec839f	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-562e-429a-fa7e-e7b78b41bbe1	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-562e-429a-8e38-8f3879d9905c	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-562e-429a-e5e7-89288d0ce3f3	AR	ARG	032	Argentina 	Argenitna	\N
00040000-562e-429a-db6f-f369339e3839	AM	ARM	051	Armenia 	Armenija	\N
00040000-562e-429a-cb9a-a66bdf51d709	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-562e-429a-f00c-8cdc5c91d70e	AU	AUS	036	Australia 	Avstralija	\N
00040000-562e-429a-665e-c3dd18ea558e	AT	AUT	040	Austria 	Avstrija	\N
00040000-562e-429a-a703-42dc1e219ebd	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-562e-429a-eb4b-d72db1561d0a	BS	BHS	044	Bahamas 	Bahami	\N
00040000-562e-429a-a6b8-1830be2f1f57	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-562e-429a-cb27-bd84f7e56492	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-562e-429a-656d-5de7a000963c	BB	BRB	052	Barbados 	Barbados	\N
00040000-562e-429a-9b13-4bce6254343c	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-562e-429a-736b-09efcae35f5e	BE	BEL	056	Belgium 	Belgija	\N
00040000-562e-429a-0161-ecb7a634a147	BZ	BLZ	084	Belize 	Belize	\N
00040000-562e-429a-d4d9-ad08b8f949b8	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-562e-429a-335d-1d234be106db	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-562e-429a-e5f8-21eb7f17ccda	BT	BTN	064	Bhutan 	Butan	\N
00040000-562e-429a-6fb7-25f9e5e30467	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-562e-429a-672b-3195e02831da	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-562e-429a-7c88-26d919868e83	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-562e-429a-f57b-fae9d5944cc2	BW	BWA	072	Botswana 	Bocvana	\N
00040000-562e-429a-8c65-9ca3c6a44493	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-562e-429a-1ba0-473ec752b048	BR	BRA	076	Brazil 	Brazilija	\N
00040000-562e-429a-5e00-5a259694d9a8	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-562e-429a-0f0d-0ac3802bf907	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-562e-429a-3a7a-21780ff1e3b4	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-562e-429a-46a3-ab7ce2925517	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-562e-429a-6b86-b96c5623cdd4	BI	BDI	108	Burundi 	Burundi 	\N
00040000-562e-429a-cf0e-cee2c26f060e	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-562e-429a-7369-2431e7c0f7b0	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-562e-429a-0766-987a828e7634	CA	CAN	124	Canada 	Kanada	\N
00040000-562e-429a-f1ca-037dda73ba94	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-562e-429a-423a-4c60ed533e4a	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-562e-429a-b61b-6650d860cbea	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-562e-429a-1743-c9706accbe3f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-562e-429a-06b7-fa08d7b830e0	CL	CHL	152	Chile 	Čile	\N
00040000-562e-429a-5236-ee00367b4c5c	CN	CHN	156	China 	Kitajska	\N
00040000-562e-429a-1ca3-eb7a6e62a104	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-562e-429a-4157-e259c294045e	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-562e-429a-4944-c49320984765	CO	COL	170	Colombia 	Kolumbija	\N
00040000-562e-429a-2e60-43c3ace6918f	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-562e-429a-ee62-bad0021f5b36	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-562e-429a-b34d-23ca74ca9b06	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-562e-429a-d594-c51adc68bbd2	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-562e-429a-5b60-b117c10448ba	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-562e-429a-1d41-4abb9a8cdd4f	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-562e-429b-ef14-2512ce566217	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-562e-429b-3ed0-dac8c7884234	CU	CUB	192	Cuba 	Kuba	\N
00040000-562e-429b-5ab7-b60eb806b8be	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-562e-429b-2217-c460d8e28f42	CY	CYP	196	Cyprus 	Ciper	\N
00040000-562e-429b-c4a1-234b493af096	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-562e-429b-6a25-479da449fed4	DK	DNK	208	Denmark 	Danska	\N
00040000-562e-429b-9230-a65b118014c7	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-562e-429b-4f91-3e1641cdf148	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-562e-429b-8c8b-eeb64e62f930	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-562e-429b-f5bc-da90d39a58b8	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-562e-429b-eef2-ca0410937403	EG	EGY	818	Egypt 	Egipt	\N
00040000-562e-429b-e4d8-99310dcac7a7	SV	SLV	222	El Salvador 	Salvador	\N
00040000-562e-429b-61fe-8b7e6403e632	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-562e-429b-33d9-a33814377378	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-562e-429b-60b4-620a65d56693	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-562e-429b-6fb5-33c4ca2ccbd3	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-562e-429b-1898-72a24be580bc	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-562e-429b-8141-7b4527fd4970	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-562e-429b-ebec-07e17ceac433	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-562e-429b-4a6b-5631a5b162c3	FI	FIN	246	Finland 	Finska	\N
00040000-562e-429b-8cf8-b3dec93e39b9	FR	FRA	250	France 	Francija	\N
00040000-562e-429b-5302-d1b3a1e24f46	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-562e-429b-0f75-fa383feb78cf	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-562e-429b-f2eb-13fe2345064d	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-562e-429b-0867-fd15c082c7b9	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-562e-429b-1cec-52b2314dc3c6	GA	GAB	266	Gabon 	Gabon	\N
00040000-562e-429b-9124-2adb53991de2	GM	GMB	270	Gambia 	Gambija	\N
00040000-562e-429b-77ab-2513d1d7d285	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-562e-429b-a5bb-1ed30de28d7d	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-562e-429b-b7bb-bd9b78944043	GH	GHA	288	Ghana 	Gana	\N
00040000-562e-429b-ce98-03af684eeb34	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-562e-429b-720a-f6f2d151f29e	GR	GRC	300	Greece 	Grčija	\N
00040000-562e-429b-5c24-853092e4723d	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-562e-429b-fb0e-c8671e31ab14	GD	GRD	308	Grenada 	Grenada	\N
00040000-562e-429b-5dc3-8f0ba36ca097	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-562e-429b-0d1c-9843bbb454cd	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-562e-429b-826c-a5328389a3bb	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-562e-429b-c802-76e4db0b2841	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-562e-429b-808b-60c6d1e0214b	GN	GIN	324	Guinea 	Gvineja	\N
00040000-562e-429b-b3ce-032979e5d345	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-562e-429b-6528-d42bd225c62b	GY	GUY	328	Guyana 	Gvajana	\N
00040000-562e-429b-41e8-edd2c3bb0f10	HT	HTI	332	Haiti 	Haiti	\N
00040000-562e-429b-a946-45735799271d	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-562e-429b-c399-5836f9d8016a	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-562e-429b-9a52-d8e697135b1b	HN	HND	340	Honduras 	Honduras	\N
00040000-562e-429b-48e1-2e4f6aa6c52b	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-562e-429b-2994-56a2411d31de	HU	HUN	348	Hungary 	Madžarska	\N
00040000-562e-429b-2ece-3dc1acbdf3ff	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-562e-429b-7d4e-db92fcdbc110	IN	IND	356	India 	Indija	\N
00040000-562e-429b-5730-163f98b521b2	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-562e-429b-82f0-f3928ae91d47	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-562e-429b-31f0-1416a42c4ff1	IQ	IRQ	368	Iraq 	Irak	\N
00040000-562e-429b-c641-b5c68e60633a	IE	IRL	372	Ireland 	Irska	\N
00040000-562e-429b-554f-5e7b1480ef8f	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-562e-429b-9a65-2badc7172443	IL	ISR	376	Israel 	Izrael	\N
00040000-562e-429b-3658-1cf3e835da72	IT	ITA	380	Italy 	Italija	\N
00040000-562e-429b-5617-8bff79a63f5f	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-562e-429b-ed43-7fa402d297ae	JP	JPN	392	Japan 	Japonska	\N
00040000-562e-429b-be4a-1fbedb5c8818	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-562e-429b-b657-58688fd1be45	JO	JOR	400	Jordan 	Jordanija	\N
00040000-562e-429b-0487-60f3d50d9979	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-562e-429b-ebb9-58ef36d2df9a	KE	KEN	404	Kenya 	Kenija	\N
00040000-562e-429b-53f5-7bcdd12684e0	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-562e-429b-bcf0-c09928c5a16f	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-562e-429b-4ae2-b3be4efa513a	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-562e-429b-fb86-2115eeb78b1d	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-562e-429b-a470-813f578cd8d5	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-562e-429b-6065-72fb9a397e6d	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-562e-429b-5073-c708dd73f401	LV	LVA	428	Latvia 	Latvija	\N
00040000-562e-429b-0d56-ff555d5472f4	LB	LBN	422	Lebanon 	Libanon	\N
00040000-562e-429b-3bd7-869498921d85	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-562e-429b-feae-caae6a3ebc19	LR	LBR	430	Liberia 	Liberija	\N
00040000-562e-429b-a488-b8a303461d2a	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-562e-429b-5cc8-f01d6fd0eff3	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-562e-429b-cdf0-ea4868d88104	LT	LTU	440	Lithuania 	Litva	\N
00040000-562e-429b-2fdb-eb1d2c4d2409	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-562e-429b-866f-c5d707ee34bc	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-562e-429b-fdcf-3161252f99f4	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-562e-429b-fb15-7bbab9aa63c2	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-562e-429b-da00-744bbd3eddf6	MW	MWI	454	Malawi 	Malavi	\N
00040000-562e-429b-287e-0198c3ff5caa	MY	MYS	458	Malaysia 	Malezija	\N
00040000-562e-429b-f9a5-ddab49be8686	MV	MDV	462	Maldives 	Maldivi	\N
00040000-562e-429b-c2d6-8756031170d0	ML	MLI	466	Mali 	Mali	\N
00040000-562e-429b-a313-ca1fb7bced2b	MT	MLT	470	Malta 	Malta	\N
00040000-562e-429b-bc6b-e556ba872a98	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-562e-429b-b8a0-c25b3aa17219	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-562e-429b-0921-7cbb09875bdb	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-562e-429b-6f86-03b0b842ccb0	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-562e-429b-9278-ad7f464505de	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-562e-429b-a53b-317d5ff1afa0	MX	MEX	484	Mexico 	Mehika	\N
00040000-562e-429b-2712-61083abb6726	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-562e-429b-ff22-359697073121	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-562e-429b-3b47-307d3f2b7eb1	MC	MCO	492	Monaco 	Monako	\N
00040000-562e-429b-f9bc-355ce816e55f	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-562e-429b-1462-7a89d353d2a4	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-562e-429b-a08e-db33da983740	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-562e-429b-843d-3996a80a08bf	MA	MAR	504	Morocco 	Maroko	\N
00040000-562e-429b-90cd-03ea2a649ba0	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-562e-429b-4c9b-a53cbae4119b	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-562e-429b-2637-00d3a90e1c96	NA	NAM	516	Namibia 	Namibija	\N
00040000-562e-429b-861d-8b699faff3aa	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-562e-429b-2d9a-ba7e88d240de	NP	NPL	524	Nepal 	Nepal	\N
00040000-562e-429b-de9a-ca8837782ee1	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-562e-429b-ba90-b6d11f7cfe84	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-562e-429b-08eb-c89d3f706f55	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-562e-429b-2244-3175ad87e6fd	NE	NER	562	Niger 	Niger 	\N
00040000-562e-429b-c9bf-1df3ac8230f5	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-562e-429b-213b-6c3e5faa105c	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-562e-429b-1be6-925600c795fd	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-562e-429b-c8d5-03428b9317f0	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-562e-429b-01de-6c48cc8a2d25	NO	NOR	578	Norway 	Norveška	\N
00040000-562e-429b-0292-d887c6b25990	OM	OMN	512	Oman 	Oman	\N
00040000-562e-429b-c342-1346c593a579	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-562e-429b-3844-1e23d86d7d44	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-562e-429b-213d-99355e319fca	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-562e-429b-6d16-86ba6c7d75d4	PA	PAN	591	Panama 	Panama	\N
00040000-562e-429b-6750-dd427a2348e5	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-562e-429b-4ba0-8d0c5c3863c8	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-562e-429b-eb28-7ea1597b71ac	PE	PER	604	Peru 	Peru	\N
00040000-562e-429b-4fb2-6d6dc9d62a17	PH	PHL	608	Philippines 	Filipini	\N
00040000-562e-429b-7cd8-75789f587bc1	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-562e-429b-e825-c6fabc9faf30	PL	POL	616	Poland 	Poljska	\N
00040000-562e-429b-3f93-2db2b4d842e6	PT	PRT	620	Portugal 	Portugalska	\N
00040000-562e-429b-5556-f31293ae8511	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-562e-429b-973a-a149d9e5a1e5	QA	QAT	634	Qatar 	Katar	\N
00040000-562e-429b-6e53-d436168ba963	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-562e-429b-d23a-14bed0538f0a	RO	ROU	642	Romania 	Romunija	\N
00040000-562e-429b-c623-0cdbd9253359	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-562e-429b-10ff-edb4a0b5cfd6	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-562e-429b-1dec-a6d11582943b	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-562e-429b-7bd6-068155cf88f8	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-562e-429b-091b-1b0603757c69	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-562e-429b-2194-a94f94dfb61c	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-562e-429b-4a4c-ed56cce3a4cb	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-562e-429b-f50a-bcc7bc8e358c	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-562e-429b-c0ad-3e689c3564ee	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-562e-429b-2f3b-85387302936d	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-562e-429b-d3b4-8514224f1588	SM	SMR	674	San Marino 	San Marino	\N
00040000-562e-429b-9e7b-9516fcb0aa24	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-562e-429b-603b-7cf8fc02b67b	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-562e-429b-c60b-145247e48004	SN	SEN	686	Senegal 	Senegal	\N
00040000-562e-429b-cf30-d9c949918c29	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-562e-429b-fc96-f2b115ee2c5b	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-562e-429b-34c5-7b9e762b1d47	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-562e-429b-2d85-608fd127974e	SG	SGP	702	Singapore 	Singapur	\N
00040000-562e-429b-dd17-7ff3f3919c55	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-562e-429b-9fe8-538e1f4c1c0a	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-562e-429b-9bfe-eb60946e92d8	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-562e-429b-fd72-2b6060157fec	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-562e-429b-84a4-c83ecd094e98	SO	SOM	706	Somalia 	Somalija	\N
00040000-562e-429b-0f64-dad8e7126367	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-562e-429b-03c8-eb274b7b80c8	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-562e-429b-8418-34107efee4de	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-562e-429b-ae92-48ca92ce5c8c	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-562e-429b-ea10-a2e0e4825dfa	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-562e-429b-6e21-1c68f2fbff3f	SD	SDN	729	Sudan 	Sudan	\N
00040000-562e-429b-ec68-43f150097c0a	SR	SUR	740	Suriname 	Surinam	\N
00040000-562e-429b-e1f5-cd8352d2293a	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-562e-429b-6b47-fb0661ea4d34	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-562e-429b-9fb0-78fccf3bd672	SE	SWE	752	Sweden 	Švedska	\N
00040000-562e-429b-a591-02cfcfaa5b9f	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-562e-429b-83ed-57f8193f71d0	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-562e-429b-5707-32f2a14ef916	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-562e-429b-08c7-af254e340b5c	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-562e-429b-54c8-fe4d61007075	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-562e-429b-04c7-3f8f991a4f2f	TH	THA	764	Thailand 	Tajska	\N
00040000-562e-429b-670f-bbfb887bb07d	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-562e-429b-0254-7c51865ff34c	TG	TGO	768	Togo 	Togo	\N
00040000-562e-429b-b866-b6ab77ff242a	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-562e-429b-4781-de0ea6b67355	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-562e-429b-e38b-6e284b25f714	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-562e-429b-73ed-adab849a728f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-562e-429b-73ca-42422ee2350a	TR	TUR	792	Turkey 	Turčija	\N
00040000-562e-429b-49cd-f4e54139757a	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-562e-429b-0112-6a6c7efab8f1	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-562e-429b-be7a-16d89d3769af	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-562e-429b-ed73-ca3ab1f5587c	UG	UGA	800	Uganda 	Uganda	\N
00040000-562e-429b-99c4-40d0e7597a7a	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-562e-429b-a710-25d69dcf1036	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-562e-429b-c9e2-2a8054395e39	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-562e-429b-e6a5-8631eed43c7a	US	USA	840	United States 	Združene države Amerike	\N
00040000-562e-429b-6052-819991b4f34b	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-562e-429b-e023-e6406cb5d84b	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-562e-429b-897e-2aac4f9480c1	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-562e-429b-d069-6c29635816d3	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-562e-429b-4b03-df6b5ebb3e8d	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-562e-429b-c5f3-3662b4bf310a	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-562e-429b-7d35-5be092f4162e	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-562e-429b-c46a-f92f33ed55a5	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-562e-429b-3cd7-9fc2300d9ce0	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-562e-429b-c09d-ed8ead131b6d	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-562e-429b-8a4d-3b9cef2c9a18	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-562e-429b-1703-2ef839ffb787	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-562e-429b-30a3-ea0122fef5ac	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3112 (class 0 OID 23433590)
-- Dependencies: 234
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-562e-429d-f784-9cf18568cd2c	000e0000-562e-429d-61a0-e532a4075a08	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-562e-429a-88a5-f4ba9debea3e	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-562e-429d-d378-15c5f42c2ee1	000e0000-562e-429d-f361-b4b39ae6a19f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-562e-429a-3ea1-3c28ff65057b	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-562e-429d-218c-456501d8243e	000e0000-562e-429d-1ad9-9192a1fd49ed	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-562e-429a-88a5-f4ba9debea3e	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-562e-429d-f90e-dfd47923da22	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-562e-429d-9155-e0ab3b182480	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3097 (class 0 OID 23433391)
-- Dependencies: 219
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-562e-429d-6b11-382df6a59d53	000e0000-562e-429d-f361-b4b39ae6a19f	000c0000-562e-429d-fff9-5d4a2720ca89	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-562e-429a-deba-3376f442b7f1
000d0000-562e-429d-ad04-67a6cf182196	000e0000-562e-429d-f361-b4b39ae6a19f	000c0000-562e-429d-2a1a-578cd363d055	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-562e-429a-b9c9-020b5dfada87
000d0000-562e-429d-f5a7-0ec385267f6e	000e0000-562e-429d-f361-b4b39ae6a19f	000c0000-562e-429d-0909-6525365bbe1b	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-562e-429a-982d-3f47d03d4811
000d0000-562e-429d-3614-5c27e00e3721	000e0000-562e-429d-f361-b4b39ae6a19f	000c0000-562e-429d-37d7-0e8fe726074c	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-562e-429a-e90a-756e989cc77f
000d0000-562e-429d-2bbb-949d32ea6b64	000e0000-562e-429d-f361-b4b39ae6a19f	000c0000-562e-429d-d107-e651335573e6	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-562e-429a-e90a-756e989cc77f
000d0000-562e-429d-2a13-2dd408a1ef8f	000e0000-562e-429d-f361-b4b39ae6a19f	000c0000-562e-429d-1d8b-1c30e25a8a14	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-562e-429a-deba-3376f442b7f1
000d0000-562e-429d-172c-32c4ed7f5244	000e0000-562e-429d-f361-b4b39ae6a19f	000c0000-562e-429d-66ca-8f68d0de3b21	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-562e-429a-deba-3376f442b7f1
000d0000-562e-429d-92f8-b479c7a69795	000e0000-562e-429d-f361-b4b39ae6a19f	000c0000-562e-429d-b253-06876ad6c466	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-562e-429a-d244-b8c777193a9c
000d0000-562e-429d-5d55-2b0b34ad8923	000e0000-562e-429d-f361-b4b39ae6a19f	000c0000-562e-429d-821f-3a78f01b6c85	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-562e-429a-b635-3e6c8e443721
\.


--
-- TOC entry 3075 (class 0 OID 23433188)
-- Dependencies: 197
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3072 (class 0 OID 23433154)
-- Dependencies: 194
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3070 (class 0 OID 23433131)
-- Dependencies: 192
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-562e-429d-f3e8-e0e14f62f4c3	00080000-562e-429d-fc8e-56feff9cd6f2	00090000-562e-429d-0f7d-7858a02bfd7d	AK		igralka
\.


--
-- TOC entry 3086 (class 0 OID 23433305)
-- Dependencies: 208
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 23433829)
-- Dependencies: 245
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 23433841)
-- Dependencies: 246
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 23433863)
-- Dependencies: 248
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3090 (class 0 OID 23433330)
-- Dependencies: 212
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3067 (class 0 OID 23433088)
-- Dependencies: 189
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-562e-429b-ead5-47229d6f2867	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-562e-429b-ceaa-53a9f3899d67	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-562e-429b-d54b-527af8ed1736	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-562e-429b-2638-c4fce4862300	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-562e-429b-aee7-56a98f4e9768	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-562e-429b-50d5-75cccb960572	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-562e-429b-dbd2-91a1c82f4a21	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-562e-429b-9853-e9873ae06485	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-562e-429b-35be-bdce54dd3042	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-562e-429b-40c5-2a07375f047d	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-562e-429b-73eb-f546d89924b6	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-562e-429b-b928-0752e0ecba63	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-562e-429b-61cf-5b0eebd204de	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-562e-429b-c09d-a52f8b63bc7e	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-562e-429b-6264-9f308967ca00	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-562e-429d-019c-0d79d064b5d2	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-562e-429d-5678-edb46edb2b5e	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-562e-429d-7570-2b036463f978	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-562e-429d-a56c-261efb0c2e36	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-562e-429d-0af8-0ec2f3b8839d	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-562e-429e-09a0-928480b4eed5	application.tenant.maticnopodjetje	string	s:36:"00080000-562e-429e-6f92-8559fa8794fb";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3060 (class 0 OID 23432988)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-562e-429d-1f68-9c666f51cb23	00000000-562e-429d-019c-0d79d064b5d2	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-562e-429d-c50f-b92be2cc4733	00000000-562e-429d-019c-0d79d064b5d2	00010000-562e-429b-b770-4c6de51633ef	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-562e-429d-095e-3ef89b771bfb	00000000-562e-429d-5678-edb46edb2b5e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3064 (class 0 OID 23433055)
-- Dependencies: 186
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-562e-429d-6d9e-075aa06b8316	\N	00100000-562e-429d-3c27-4425b86338dd	00100000-562e-429d-0cc5-3bb40ed9db31	01	Gledališče Nimbis
00410000-562e-429d-b178-a8feabe63f1e	00410000-562e-429d-6d9e-075aa06b8316	00100000-562e-429d-3c27-4425b86338dd	00100000-562e-429d-0cc5-3bb40ed9db31	02	Tehnika
\.


--
-- TOC entry 3061 (class 0 OID 23432999)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-562e-429d-87d5-5e31284de100	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-562e-429d-13f3-51a73502b56f	00010000-562e-429d-a696-c677e7b29e79	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-562e-429d-44c0-29942e3aac58	00010000-562e-429d-5c00-5f43b4b5f243	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-562e-429d-9edd-0e4d1302a2fb	00010000-562e-429d-0acf-13e3e1f84782	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-562e-429d-435c-4d9ded4ff0a7	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-562e-429d-efdd-559c9c6cbad8	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-562e-429d-a49f-4c58844bd3c2	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-562e-429d-9682-376dec1dfa22	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-562e-429d-0f7d-7858a02bfd7d	00010000-562e-429d-a6cd-905daed25465	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-562e-429d-d2ea-87391b3e846f	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-562e-429d-29c6-fff47581421b	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-562e-429d-981e-4819d3c12f1b	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-562e-429d-b0a7-90020110a99a	00010000-562e-429d-0da8-aecaa3ad5709	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-562e-429d-e8ff-542ceaf8e36c	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-562e-429d-f006-67c8c21f56df	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-562e-429d-0e84-2aed0194563f	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-562e-429d-29c7-ada523151dbe	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-562e-429d-caa1-0ea71ee68d03	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-562e-429d-a43f-8bccbce804fa	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-562e-429d-8c4c-890f319f702d	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-562e-429d-b6a9-a6fdf8e3053e	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3055 (class 0 OID 23432943)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-562e-429b-d6af-a7d7019d0d51	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-562e-429b-6c35-c91c90f06348	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-562e-429b-68a0-31eff5dc52f0	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-562e-429b-01db-6043cc03a0cf	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-562e-429b-f849-317956d4867c	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-562e-429b-2dfe-9119f10bad2e	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-562e-429b-c644-37b32a1bd42d	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-562e-429b-8b8e-0ba7197e10ab	Abonma-read	Abonma - branje	t
00030000-562e-429b-8193-447e163fd469	Abonma-write	Abonma - spreminjanje	t
00030000-562e-429b-fe1c-9fc237888817	Alternacija-read	Alternacija - branje	t
00030000-562e-429b-21ba-bb1b59d1927d	Alternacija-write	Alternacija - spreminjanje	t
00030000-562e-429b-3895-1af3ec53f78d	Arhivalija-read	Arhivalija - branje	t
00030000-562e-429b-bd75-325b197686aa	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-562e-429b-ccfe-ced16798571a	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-562e-429b-61a4-e05e03c800dc	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-562e-429b-b1aa-87003e7889bf	Besedilo-read	Besedilo - branje	t
00030000-562e-429b-d101-0d2b93586409	Besedilo-write	Besedilo - spreminjanje	t
00030000-562e-429b-1709-a96d274d52ea	DogodekIzven-read	DogodekIzven - branje	t
00030000-562e-429b-e69d-e0dd83215cb0	DogodekIzven-write	DogodekIzven - spreminjanje	t
00030000-562e-429b-eaad-77a83b7f8c12	Dogodek-read	Dogodek - branje	t
00030000-562e-429b-f6d7-574f2132a541	Dogodek-write	Dogodek - spreminjanje	t
00030000-562e-429b-47c2-086d46bd3680	DrugiVir-read	DrugiVir - branje	t
00030000-562e-429b-7428-5c7106146df6	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-562e-429b-a29c-d1648f47b2e1	Drzava-read	Drzava - branje	t
00030000-562e-429b-fa25-29317d473918	Drzava-write	Drzava - spreminjanje	t
00030000-562e-429b-a98e-3f51ec7124bd	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-562e-429b-f677-7b8500964b81	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-562e-429b-24df-80f9018b2cc9	Funkcija-read	Funkcija - branje	t
00030000-562e-429b-ee5f-ba7247f8e364	Funkcija-write	Funkcija - spreminjanje	t
00030000-562e-429b-e73d-c2a476671b6a	Gostovanje-read	Gostovanje - branje	t
00030000-562e-429b-754b-2e66b4cc9541	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-562e-429b-9b54-372e5aba22ca	Gostujoca-read	Gostujoca - branje	t
00030000-562e-429b-02ae-45bf785ffbe6	Gostujoca-write	Gostujoca - spreminjanje	t
00030000-562e-429b-ad6d-0e22870797f3	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-562e-429b-9039-f6db99fff18d	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-562e-429b-f1ff-bd3d69cb31c0	Kupec-read	Kupec - branje	t
00030000-562e-429b-00ff-bcc8c2b341e7	Kupec-write	Kupec - spreminjanje	t
00030000-562e-429b-ab8c-e21d9269e475	NacinPlacina-read	NacinPlacina - branje	t
00030000-562e-429b-98e1-9aa5d92d64e2	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-562e-429b-2305-23004a4d1848	Option-read	Option - branje	t
00030000-562e-429b-2c05-561db95d5023	Option-write	Option - spreminjanje	t
00030000-562e-429b-efbe-1c515cec8ebd	OptionValue-read	OptionValue - branje	t
00030000-562e-429b-f515-8818765b73d9	OptionValue-write	OptionValue - spreminjanje	t
00030000-562e-429b-d963-4f118cde2dac	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-562e-429b-cef9-e4307aeba084	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-562e-429b-4486-e77d226fa356	Oseba-read	Oseba - branje	t
00030000-562e-429b-8b2d-b1e3cb38a066	Oseba-write	Oseba - spreminjanje	t
00030000-562e-429b-e9b4-e393a0ad0a92	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-562e-429b-8596-d0eb4da6e9c5	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-562e-429b-c4a2-945f73e0ebc1	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-562e-429b-2738-ce8322130bd3	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-562e-429b-310e-632ff85e0a0e	Pogodba-read	Pogodba - branje	t
00030000-562e-429b-9b24-d251631b3ff2	Pogodba-write	Pogodba - spreminjanje	t
00030000-562e-429b-7ae3-83c6fec1ad62	Popa-read	Popa - branje	t
00030000-562e-429b-7d6e-34c36a23de2d	Popa-write	Popa - spreminjanje	t
00030000-562e-429b-766f-9b96bfb7a66a	Posta-read	Posta - branje	t
00030000-562e-429b-a399-f7da9cb386e0	Posta-write	Posta - spreminjanje	t
00030000-562e-429b-d103-358a89e6a299	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-562e-429b-1f49-6ef177dc5cfb	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-562e-429b-eb6c-552829c5e3c8	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-562e-429b-6bcb-8946c79b70ba	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-562e-429b-196d-c78ec11d54b9	PostniNaslov-read	PostniNaslov - branje	t
00030000-562e-429b-2550-4a07aab85c09	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-562e-429b-bca7-227b339dc650	Predstava-read	Predstava - branje	t
00030000-562e-429b-841f-6d63eb45a509	Predstava-write	Predstava - spreminjanje	t
00030000-562e-429b-c0c2-ea2d731e02e0	Praznik-read	Praznik - branje	t
00030000-562e-429b-c152-748a68ae2ee8	Praznik-write	Praznik - spreminjanje	t
00030000-562e-429b-1df8-4aeadbf5d3f8	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-562e-429b-b24a-70ab31305464	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-562e-429b-b638-2930351db424	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-562e-429b-0b38-a671773d620f	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-562e-429b-a083-387b235e94c2	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-562e-429b-9bf7-07ef240f0300	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-562e-429b-1324-b97bc37a244c	ProgramDela-read	ProgramDela - branje	t
00030000-562e-429b-1b53-5403f0936297	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-562e-429b-5a2d-345b9dfcb079	ProgramFestival-read	ProgramFestival - branje	t
00030000-562e-429b-89b9-cbc4f5575a43	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-562e-429b-3d2e-fe4c37d35474	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-562e-429b-0eaa-9c9f0b88a173	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-562e-429b-55ef-9c6d9ed6892d	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-562e-429b-e5f4-d02e4b6fc360	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-562e-429b-ec5b-ef9d5daca520	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-562e-429b-0f36-23e75b4042d7	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-562e-429b-4a06-b2df10401dac	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-562e-429b-aa67-8c426346c849	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-562e-429b-3224-49afcbf66964	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-562e-429b-ff7d-150b980aba23	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-562e-429b-0a57-1e9cbd701203	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-562e-429b-ac2a-bd491255e9c4	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-562e-429b-589d-f40685b20e2e	ProgramRazno-read	ProgramRazno - branje	t
00030000-562e-429b-bbdc-f357d8a85862	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-562e-429b-610e-f1f242a165cc	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-562e-429b-2422-8e46813da4cc	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-562e-429b-8220-93ed22c9abf8	Prostor-read	Prostor - branje	t
00030000-562e-429b-bec8-8ff98d3e8c42	Prostor-write	Prostor - spreminjanje	t
00030000-562e-429b-717f-4f2cbed27ba5	Racun-read	Racun - branje	t
00030000-562e-429b-76fd-da7e2d06af15	Racun-write	Racun - spreminjanje	t
00030000-562e-429b-5e4e-040165d16f14	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-562e-429b-df9a-0ca3a1e5490e	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-562e-429b-4a5e-92d8c22b1e89	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-562e-429b-6684-b2987c5aa1cd	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-562e-429b-6551-6185c69b7c23	Rekvizit-read	Rekvizit - branje	t
00030000-562e-429b-afc4-cf803f61f517	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-562e-429b-f3c9-8b4c4050bfa4	Revizija-read	Revizija - branje	t
00030000-562e-429b-c26b-7fe902122434	Revizija-write	Revizija - spreminjanje	t
00030000-562e-429b-0370-6e5fc6cfd416	Rezervacija-read	Rezervacija - branje	t
00030000-562e-429b-ec79-e89894f30ba2	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-562e-429b-51c0-54361125c23a	SedezniRed-read	SedezniRed - branje	t
00030000-562e-429b-ef83-f9078c203197	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-562e-429b-23cc-52e76b6f7620	Sedez-read	Sedez - branje	t
00030000-562e-429b-2c7c-08324242609d	Sedez-write	Sedez - spreminjanje	t
00030000-562e-429b-dbaa-aca40b559a02	Sezona-read	Sezona - branje	t
00030000-562e-429b-a499-5e791e04dd99	Sezona-write	Sezona - spreminjanje	t
00030000-562e-429b-f9f1-663fe50b8dbd	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-562e-429b-d2f2-ce35ac298efa	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-562e-429b-03c1-34e3539db826	Stevilcenje-read	Stevilcenje - branje	t
00030000-562e-429b-080b-42530607b217	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-562e-429b-5e2d-fb8e22040088	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-562e-429b-1645-7a5250dc4fd2	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-562e-429b-a5e4-fcb385539c3e	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-562e-429b-a659-1ac989fae427	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-562e-429b-ee6e-6113cb621a55	Telefonska-read	Telefonska - branje	t
00030000-562e-429b-5a6e-85a14654fdc2	Telefonska-write	Telefonska - spreminjanje	t
00030000-562e-429b-a7a9-115073778153	TerminStoritve-read	TerminStoritve - branje	t
00030000-562e-429b-035a-7d2da3625eb4	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-562e-429b-e1f5-7d5235e19cdd	TipFunkcije-read	TipFunkcije - branje	t
00030000-562e-429b-a946-6282be68c3cc	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-562e-429b-f2ac-acac4d3d6a6a	TipPopa-read	TipPopa - branje	t
00030000-562e-429b-01cc-a56ce1d797d7	TipPopa-write	TipPopa - spreminjanje	t
00030000-562e-429b-b64f-c4c48a58d382	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-562e-429b-3a18-06fc6d39d0b4	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-562e-429b-cf4f-6f226dd88a50	TipVaje-read	TipVaje - branje	t
00030000-562e-429b-d345-e98b0a6f88d4	TipVaje-write	TipVaje - spreminjanje	t
00030000-562e-429b-4512-7d26024e70b0	Trr-read	Trr - branje	t
00030000-562e-429b-09f9-5eab1df77e6a	Trr-write	Trr - spreminjanje	t
00030000-562e-429b-a487-0fa7557c04b9	Uprizoritev-read	Uprizoritev - branje	t
00030000-562e-429b-ad03-28d4557a8e5e	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-562e-429b-d90a-55ee1219d9db	Vaja-read	Vaja - branje	t
00030000-562e-429b-0d2d-e34c22f87251	Vaja-write	Vaja - spreminjanje	t
00030000-562e-429b-5c34-162c2fc510f1	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-562e-429b-9be4-003b42d27dc9	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-562e-429b-e5eb-4cfe03376447	VrstaStroska-read	VrstaStroska - branje	t
00030000-562e-429b-ceec-661c19fbc248	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-562e-429b-736f-4c4e382795df	Zaposlitev-read	Zaposlitev - branje	t
00030000-562e-429b-12df-8e863192a3c5	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-562e-429b-be4e-d56bcf702b46	Zasedenost-read	Zasedenost - branje	t
00030000-562e-429b-f8be-28fb3c185f55	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-562e-429b-c1cb-8832e905714e	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-562e-429b-ab58-3b0eaf7bcfee	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-562e-429b-ec0a-ee65a3c5aa41	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-562e-429b-5e7d-355fb50ab488	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-562e-429b-a431-e55a96ff20ac	Job-read	Branje opravil - samo zase - branje	t
00030000-562e-429b-c737-ed3aa28ae842	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-562e-429b-85d1-634ba7619966	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-562e-429b-2890-fe48a70019f1	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-562e-429b-f8c5-028b6944fa76	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-562e-429b-72bd-426d0ba996f0	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-562e-429b-3b8d-f631c830d720	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-562e-429b-282e-6bdc42321493	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-562e-429b-dbdf-c1dac79a4d35	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-562e-429b-970b-975dcb09bb3d	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-562e-429b-b44b-a4dcffe77ae9	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-562e-429b-b171-7f1352ff9686	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-562e-429b-d75c-9e1e7ae2d24c	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-562e-429b-790d-8577143a54e2	Datoteka-write	Datoteka - spreminjanje	t
00030000-562e-429b-4a87-4598a61c63bf	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3057 (class 0 OID 23432962)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-562e-429b-100e-7bba1985bff2	00030000-562e-429b-6c35-c91c90f06348
00020000-562e-429b-e4aa-9edfdcdb0e2a	00030000-562e-429b-a29c-d1648f47b2e1
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-8b8e-0ba7197e10ab
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-8193-447e163fd469
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-fe1c-9fc237888817
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-21ba-bb1b59d1927d
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-3895-1af3ec53f78d
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-eaad-77a83b7f8c12
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-01db-6043cc03a0cf
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-f6d7-574f2132a541
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-a29c-d1648f47b2e1
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-fa25-29317d473918
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-24df-80f9018b2cc9
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-ee5f-ba7247f8e364
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-e73d-c2a476671b6a
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-754b-2e66b4cc9541
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-9b54-372e5aba22ca
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-02ae-45bf785ffbe6
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-ad6d-0e22870797f3
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-9039-f6db99fff18d
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-2305-23004a4d1848
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-efbe-1c515cec8ebd
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-4486-e77d226fa356
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-8b2d-b1e3cb38a066
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-7ae3-83c6fec1ad62
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-7d6e-34c36a23de2d
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-766f-9b96bfb7a66a
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-a399-f7da9cb386e0
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-196d-c78ec11d54b9
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-2550-4a07aab85c09
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-bca7-227b339dc650
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-841f-6d63eb45a509
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-a083-387b235e94c2
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-9bf7-07ef240f0300
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-8220-93ed22c9abf8
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-bec8-8ff98d3e8c42
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-4a5e-92d8c22b1e89
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-6684-b2987c5aa1cd
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-6551-6185c69b7c23
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-afc4-cf803f61f517
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-dbaa-aca40b559a02
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-a499-5e791e04dd99
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-e1f5-7d5235e19cdd
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-a487-0fa7557c04b9
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-ad03-28d4557a8e5e
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-d90a-55ee1219d9db
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-0d2d-e34c22f87251
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-be4e-d56bcf702b46
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-f8be-28fb3c185f55
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-c1cb-8832e905714e
00020000-562e-429b-d38e-65c537347490	00030000-562e-429b-ec0a-ee65a3c5aa41
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-8b8e-0ba7197e10ab
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-3895-1af3ec53f78d
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-eaad-77a83b7f8c12
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-a29c-d1648f47b2e1
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-e73d-c2a476671b6a
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-9b54-372e5aba22ca
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-ad6d-0e22870797f3
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-9039-f6db99fff18d
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-2305-23004a4d1848
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-efbe-1c515cec8ebd
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-4486-e77d226fa356
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-8b2d-b1e3cb38a066
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-7ae3-83c6fec1ad62
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-766f-9b96bfb7a66a
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-196d-c78ec11d54b9
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-2550-4a07aab85c09
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-bca7-227b339dc650
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-8220-93ed22c9abf8
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-4a5e-92d8c22b1e89
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-6551-6185c69b7c23
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-dbaa-aca40b559a02
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-ee6e-6113cb621a55
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-5a6e-85a14654fdc2
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-4512-7d26024e70b0
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-09f9-5eab1df77e6a
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-736f-4c4e382795df
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-12df-8e863192a3c5
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-c1cb-8832e905714e
00020000-562e-429b-9942-1f1bc85dda86	00030000-562e-429b-ec0a-ee65a3c5aa41
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-8b8e-0ba7197e10ab
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-fe1c-9fc237888817
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-3895-1af3ec53f78d
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-bd75-325b197686aa
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-b1aa-87003e7889bf
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-1709-a96d274d52ea
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-eaad-77a83b7f8c12
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-a29c-d1648f47b2e1
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-24df-80f9018b2cc9
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-e73d-c2a476671b6a
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-9b54-372e5aba22ca
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-ad6d-0e22870797f3
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-2305-23004a4d1848
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-efbe-1c515cec8ebd
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-4486-e77d226fa356
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-7ae3-83c6fec1ad62
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-766f-9b96bfb7a66a
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-bca7-227b339dc650
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-a083-387b235e94c2
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-8220-93ed22c9abf8
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-4a5e-92d8c22b1e89
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-6551-6185c69b7c23
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-dbaa-aca40b559a02
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-e1f5-7d5235e19cdd
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-d90a-55ee1219d9db
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-be4e-d56bcf702b46
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-c1cb-8832e905714e
00020000-562e-429b-3851-5dfded56f1f3	00030000-562e-429b-ec0a-ee65a3c5aa41
00020000-562e-429b-fe88-462f03b50701	00030000-562e-429b-8b8e-0ba7197e10ab
00020000-562e-429b-fe88-462f03b50701	00030000-562e-429b-8193-447e163fd469
00020000-562e-429b-fe88-462f03b50701	00030000-562e-429b-21ba-bb1b59d1927d
00020000-562e-429b-fe88-462f03b50701	00030000-562e-429b-3895-1af3ec53f78d
00020000-562e-429b-fe88-462f03b50701	00030000-562e-429b-eaad-77a83b7f8c12
00020000-562e-429b-fe88-462f03b50701	00030000-562e-429b-a29c-d1648f47b2e1
00020000-562e-429b-fe88-462f03b50701	00030000-562e-429b-e73d-c2a476671b6a
00020000-562e-429b-fe88-462f03b50701	00030000-562e-429b-9b54-372e5aba22ca
00020000-562e-429b-fe88-462f03b50701	00030000-562e-429b-2305-23004a4d1848
00020000-562e-429b-fe88-462f03b50701	00030000-562e-429b-efbe-1c515cec8ebd
00020000-562e-429b-fe88-462f03b50701	00030000-562e-429b-7ae3-83c6fec1ad62
00020000-562e-429b-fe88-462f03b50701	00030000-562e-429b-766f-9b96bfb7a66a
00020000-562e-429b-fe88-462f03b50701	00030000-562e-429b-bca7-227b339dc650
00020000-562e-429b-fe88-462f03b50701	00030000-562e-429b-8220-93ed22c9abf8
00020000-562e-429b-fe88-462f03b50701	00030000-562e-429b-4a5e-92d8c22b1e89
00020000-562e-429b-fe88-462f03b50701	00030000-562e-429b-6551-6185c69b7c23
00020000-562e-429b-fe88-462f03b50701	00030000-562e-429b-dbaa-aca40b559a02
00020000-562e-429b-fe88-462f03b50701	00030000-562e-429b-e1f5-7d5235e19cdd
00020000-562e-429b-fe88-462f03b50701	00030000-562e-429b-c1cb-8832e905714e
00020000-562e-429b-fe88-462f03b50701	00030000-562e-429b-ec0a-ee65a3c5aa41
00020000-562e-429b-b52b-c65a4ae7ffdf	00030000-562e-429b-8b8e-0ba7197e10ab
00020000-562e-429b-b52b-c65a4ae7ffdf	00030000-562e-429b-3895-1af3ec53f78d
00020000-562e-429b-b52b-c65a4ae7ffdf	00030000-562e-429b-eaad-77a83b7f8c12
00020000-562e-429b-b52b-c65a4ae7ffdf	00030000-562e-429b-a29c-d1648f47b2e1
00020000-562e-429b-b52b-c65a4ae7ffdf	00030000-562e-429b-e73d-c2a476671b6a
00020000-562e-429b-b52b-c65a4ae7ffdf	00030000-562e-429b-9b54-372e5aba22ca
00020000-562e-429b-b52b-c65a4ae7ffdf	00030000-562e-429b-2305-23004a4d1848
00020000-562e-429b-b52b-c65a4ae7ffdf	00030000-562e-429b-efbe-1c515cec8ebd
00020000-562e-429b-b52b-c65a4ae7ffdf	00030000-562e-429b-7ae3-83c6fec1ad62
00020000-562e-429b-b52b-c65a4ae7ffdf	00030000-562e-429b-766f-9b96bfb7a66a
00020000-562e-429b-b52b-c65a4ae7ffdf	00030000-562e-429b-bca7-227b339dc650
00020000-562e-429b-b52b-c65a4ae7ffdf	00030000-562e-429b-8220-93ed22c9abf8
00020000-562e-429b-b52b-c65a4ae7ffdf	00030000-562e-429b-4a5e-92d8c22b1e89
00020000-562e-429b-b52b-c65a4ae7ffdf	00030000-562e-429b-6551-6185c69b7c23
00020000-562e-429b-b52b-c65a4ae7ffdf	00030000-562e-429b-dbaa-aca40b559a02
00020000-562e-429b-b52b-c65a4ae7ffdf	00030000-562e-429b-a7a9-115073778153
00020000-562e-429b-b52b-c65a4ae7ffdf	00030000-562e-429b-68a0-31eff5dc52f0
00020000-562e-429b-b52b-c65a4ae7ffdf	00030000-562e-429b-e1f5-7d5235e19cdd
00020000-562e-429b-b52b-c65a4ae7ffdf	00030000-562e-429b-c1cb-8832e905714e
00020000-562e-429b-b52b-c65a4ae7ffdf	00030000-562e-429b-ec0a-ee65a3c5aa41
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-d6af-a7d7019d0d51
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-6c35-c91c90f06348
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-8b8e-0ba7197e10ab
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-8193-447e163fd469
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-fe1c-9fc237888817
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-21ba-bb1b59d1927d
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-3895-1af3ec53f78d
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-bd75-325b197686aa
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-ccfe-ced16798571a
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-61a4-e05e03c800dc
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-b1aa-87003e7889bf
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-d101-0d2b93586409
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-1709-a96d274d52ea
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-e69d-e0dd83215cb0
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-eaad-77a83b7f8c12
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-01db-6043cc03a0cf
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-f6d7-574f2132a541
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-47c2-086d46bd3680
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-7428-5c7106146df6
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-a29c-d1648f47b2e1
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-fa25-29317d473918
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-a98e-3f51ec7124bd
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-f677-7b8500964b81
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-24df-80f9018b2cc9
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-ee5f-ba7247f8e364
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-e73d-c2a476671b6a
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-754b-2e66b4cc9541
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-9b54-372e5aba22ca
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-02ae-45bf785ffbe6
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-ad6d-0e22870797f3
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-9039-f6db99fff18d
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-f1ff-bd3d69cb31c0
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-00ff-bcc8c2b341e7
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-ab8c-e21d9269e475
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-98e1-9aa5d92d64e2
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-2305-23004a4d1848
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-efbe-1c515cec8ebd
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-f515-8818765b73d9
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-2c05-561db95d5023
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-d963-4f118cde2dac
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-cef9-e4307aeba084
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-4486-e77d226fa356
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-f849-317956d4867c
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-8b2d-b1e3cb38a066
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-e9b4-e393a0ad0a92
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-8596-d0eb4da6e9c5
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-c4a2-945f73e0ebc1
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-2738-ce8322130bd3
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-310e-632ff85e0a0e
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-9b24-d251631b3ff2
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-7ae3-83c6fec1ad62
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-7d6e-34c36a23de2d
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-766f-9b96bfb7a66a
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-d103-358a89e6a299
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-1f49-6ef177dc5cfb
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-eb6c-552829c5e3c8
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-6bcb-8946c79b70ba
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-a399-f7da9cb386e0
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-196d-c78ec11d54b9
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-2550-4a07aab85c09
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-c0c2-ea2d731e02e0
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-c152-748a68ae2ee8
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-bca7-227b339dc650
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-841f-6d63eb45a509
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-1df8-4aeadbf5d3f8
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-b24a-70ab31305464
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-b638-2930351db424
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-0b38-a671773d620f
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-a083-387b235e94c2
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-9bf7-07ef240f0300
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-2dfe-9119f10bad2e
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-1324-b97bc37a244c
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-c644-37b32a1bd42d
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-1b53-5403f0936297
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-5a2d-345b9dfcb079
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-89b9-cbc4f5575a43
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-3d2e-fe4c37d35474
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-0eaa-9c9f0b88a173
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-55ef-9c6d9ed6892d
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-e5f4-d02e4b6fc360
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-ec5b-ef9d5daca520
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-0f36-23e75b4042d7
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-4a06-b2df10401dac
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-aa67-8c426346c849
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-3224-49afcbf66964
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-ff7d-150b980aba23
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-0a57-1e9cbd701203
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-ac2a-bd491255e9c4
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-589d-f40685b20e2e
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-bbdc-f357d8a85862
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-610e-f1f242a165cc
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-2422-8e46813da4cc
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-8220-93ed22c9abf8
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-bec8-8ff98d3e8c42
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-717f-4f2cbed27ba5
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-76fd-da7e2d06af15
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-5e4e-040165d16f14
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-df9a-0ca3a1e5490e
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-4a5e-92d8c22b1e89
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-6684-b2987c5aa1cd
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-6551-6185c69b7c23
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-afc4-cf803f61f517
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-f3c9-8b4c4050bfa4
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-c26b-7fe902122434
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-0370-6e5fc6cfd416
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-ec79-e89894f30ba2
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-51c0-54361125c23a
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-ef83-f9078c203197
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-23cc-52e76b6f7620
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-2c7c-08324242609d
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-dbaa-aca40b559a02
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-a499-5e791e04dd99
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-f9f1-663fe50b8dbd
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-d2f2-ce35ac298efa
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-03c1-34e3539db826
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-5e2d-fb8e22040088
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-1645-7a5250dc4fd2
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-080b-42530607b217
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-a5e4-fcb385539c3e
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-a659-1ac989fae427
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-ee6e-6113cb621a55
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-5a6e-85a14654fdc2
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-a7a9-115073778153
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-68a0-31eff5dc52f0
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-035a-7d2da3625eb4
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-e1f5-7d5235e19cdd
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-a946-6282be68c3cc
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-f2ac-acac4d3d6a6a
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-01cc-a56ce1d797d7
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-b64f-c4c48a58d382
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-3a18-06fc6d39d0b4
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-cf4f-6f226dd88a50
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-d345-e98b0a6f88d4
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-4512-7d26024e70b0
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-09f9-5eab1df77e6a
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-a487-0fa7557c04b9
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-ad03-28d4557a8e5e
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-d90a-55ee1219d9db
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-0d2d-e34c22f87251
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-5c34-162c2fc510f1
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-9be4-003b42d27dc9
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-e5eb-4cfe03376447
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-ceec-661c19fbc248
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-736f-4c4e382795df
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-12df-8e863192a3c5
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-be4e-d56bcf702b46
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-f8be-28fb3c185f55
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-c1cb-8832e905714e
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-ab58-3b0eaf7bcfee
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-ec0a-ee65a3c5aa41
00020000-562e-429d-789b-f5628fe0b2b3	00030000-562e-429b-5e7d-355fb50ab488
\.


--
-- TOC entry 3091 (class 0 OID 23433337)
-- Dependencies: 213
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3095 (class 0 OID 23433371)
-- Dependencies: 217
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 23433508)
-- Dependencies: 229
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-562e-429d-ec10-1a34e8c58793	00090000-562e-429d-87d5-5e31284de100	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-562e-429d-f984-9e71b47be75e	00090000-562e-429d-efdd-559c9c6cbad8	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-562e-429d-d2a9-3f2a588b6453	00090000-562e-429d-b0a7-90020110a99a	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-562e-429d-874b-397bcd6a1aef	00090000-562e-429d-d2ea-87391b3e846f	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3063 (class 0 OID 23433035)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-562e-429d-fc8e-56feff9cd6f2	\N	00040000-562e-429b-9bfe-eb60946e92d8	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562e-429d-0e62-72c86d432fe4	\N	00040000-562e-429b-9bfe-eb60946e92d8	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-562e-429d-3882-eba78cd200a4	\N	00040000-562e-429b-9bfe-eb60946e92d8	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562e-429d-42ee-87f826c580b9	\N	00040000-562e-429b-9bfe-eb60946e92d8	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562e-429d-6171-635749b16f64	\N	00040000-562e-429b-9bfe-eb60946e92d8	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562e-429d-622d-443d34d7f612	\N	00040000-562e-429a-e5e7-89288d0ce3f3	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562e-429d-0ae9-8cde25bafd82	\N	00040000-562e-429b-ef14-2512ce566217	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562e-429d-ee4d-04b9ae81fe04	\N	00040000-562e-429a-665e-c3dd18ea558e	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562e-429d-ccca-886ae506d54e	\N	00040000-562e-429b-a5bb-1ed30de28d7d	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-562e-429e-6f92-8559fa8794fb	\N	00040000-562e-429b-9bfe-eb60946e92d8	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3066 (class 0 OID 23433080)
-- Dependencies: 188
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-562e-429a-6658-ee33ab36c552	8341	Adlešiči
00050000-562e-429a-926e-b586c89781cc	5270	Ajdovščina
00050000-562e-429a-58fb-782ba7fc34fa	6280	Ankaran/Ancarano
00050000-562e-429a-3c56-2ce8c784a193	9253	Apače
00050000-562e-429a-ad9f-e2df33d97294	8253	Artiče
00050000-562e-429a-9df8-832df772347b	4275	Begunje na Gorenjskem
00050000-562e-429a-6e59-e76a54a6bda3	1382	Begunje pri Cerknici
00050000-562e-429a-15de-cee4a70420fd	9231	Beltinci
00050000-562e-429a-a17e-4b474a195973	2234	Benedikt
00050000-562e-429a-a351-815ceb18d433	2345	Bistrica ob Dravi
00050000-562e-429a-bcd0-6aef55fdb0af	3256	Bistrica ob Sotli
00050000-562e-429a-b950-cd8ac1eb28f0	8259	Bizeljsko
00050000-562e-429a-4c46-2e5951704a53	1223	Blagovica
00050000-562e-429a-b473-32a290e7caa5	8283	Blanca
00050000-562e-429a-594f-21b6253c8e1e	4260	Bled
00050000-562e-429a-96e7-dfcb37f44954	4273	Blejska Dobrava
00050000-562e-429a-e086-cbe93c37e008	9265	Bodonci
00050000-562e-429a-0fcd-588423986ae8	9222	Bogojina
00050000-562e-429a-f79b-c310480f1a81	4263	Bohinjska Bela
00050000-562e-429a-9935-86ca70810062	4264	Bohinjska Bistrica
00050000-562e-429a-40bf-1d18e1c0c8e1	4265	Bohinjsko jezero
00050000-562e-429a-a1b7-2de7c3035a66	1353	Borovnica
00050000-562e-429a-d7ca-a710ecc4d7a7	8294	Boštanj
00050000-562e-429a-3956-695f625fc1f3	5230	Bovec
00050000-562e-429a-d457-dfcae191223a	5295	Branik
00050000-562e-429a-8abf-375d27893722	3314	Braslovče
00050000-562e-429a-b273-6f1afcafc841	5223	Breginj
00050000-562e-429a-57b1-307fc6b37105	8280	Brestanica
00050000-562e-429a-0518-7d462f6de2e9	2354	Bresternica
00050000-562e-429a-f5f4-24ac4cab647e	4243	Brezje
00050000-562e-429a-a572-5a7e57c1347a	1351	Brezovica pri Ljubljani
00050000-562e-429a-4629-421378d7041b	8250	Brežice
00050000-562e-429a-82ae-b74dd18b4188	4210	Brnik - Aerodrom
00050000-562e-429a-56e3-a2e3a60496a2	8321	Brusnice
00050000-562e-429a-66a2-7bfb70797a25	3255	Buče
00050000-562e-429a-96cb-97a07ed65cb3	8276	Bučka 
00050000-562e-429a-596b-5849b1e077b8	9261	Cankova
00050000-562e-429a-731f-e63b678facf3	3000	Celje 
00050000-562e-429a-bf21-a6001e7677b0	3001	Celje - poštni predali
00050000-562e-429a-66cc-e401ca0c3878	4207	Cerklje na Gorenjskem
00050000-562e-429a-e3d7-0b33c170dff2	8263	Cerklje ob Krki
00050000-562e-429a-c01e-3a66472120aa	1380	Cerknica
00050000-562e-429a-7b65-e501417197b7	5282	Cerkno
00050000-562e-429a-bea9-98c4c3935c11	2236	Cerkvenjak
00050000-562e-429a-f451-3bd991670322	2215	Ceršak
00050000-562e-429a-02d9-c552039d9a2d	2326	Cirkovce
00050000-562e-429a-1c6b-60aceaca8185	2282	Cirkulane
00050000-562e-429a-5830-68e273e3a808	5273	Col
00050000-562e-429a-0758-f763f704a144	8251	Čatež ob Savi
00050000-562e-429a-2190-72c9672ff070	1413	Čemšenik
00050000-562e-429a-f9f9-64670072b5e1	5253	Čepovan
00050000-562e-429a-3927-e79eef0085eb	9232	Črenšovci
00050000-562e-429a-4bff-6fa1ac8bae30	2393	Črna na Koroškem
00050000-562e-429a-b76d-6cd0f583ee7b	6275	Črni Kal
00050000-562e-429a-30b9-ff619c61dcd7	5274	Črni Vrh nad Idrijo
00050000-562e-429a-9ce2-71e0ec940ca7	5262	Črniče
00050000-562e-429a-580a-75fbce1b9af8	8340	Črnomelj
00050000-562e-429a-8ed7-7a942187803e	6271	Dekani
00050000-562e-429a-81eb-46fd9773d1bc	5210	Deskle
00050000-562e-429a-a985-cfedfcadd318	2253	Destrnik
00050000-562e-429a-bae4-a18e078512cc	6215	Divača
00050000-562e-429a-ce0e-bc0ff695e5a7	1233	Dob
00050000-562e-429a-3a53-6bd2e0e586a0	3224	Dobje pri Planini
00050000-562e-429a-43f9-db323bc43bb6	8257	Dobova
00050000-562e-429a-c3c5-00be82dcc2a1	1423	Dobovec
00050000-562e-429a-f0a3-3157a3dea14e	5263	Dobravlje
00050000-562e-429a-6462-105cec6693f4	3204	Dobrna
00050000-562e-429a-3924-1ff1a20ace93	8211	Dobrnič
00050000-562e-429a-0a73-8a7031219e40	1356	Dobrova
00050000-562e-429a-77e9-1397ede2a747	9223	Dobrovnik/Dobronak 
00050000-562e-429a-8d9e-e3b1bbdcfb3b	5212	Dobrovo v Brdih
00050000-562e-429a-ec3a-e0a89b1e6018	1431	Dol pri Hrastniku
00050000-562e-429a-786e-8b8158d56bd2	1262	Dol pri Ljubljani
00050000-562e-429a-5236-ca26464d458a	1273	Dole pri Litiji
00050000-562e-429a-a8dd-5a3b304ae020	1331	Dolenja vas
00050000-562e-429a-fe1c-37f876b8c2ba	8350	Dolenjske Toplice
00050000-562e-429a-7692-36911b465c45	1230	Domžale
00050000-562e-429a-8e7c-797a58ee5caf	2252	Dornava
00050000-562e-429a-c89c-23636726da13	5294	Dornberk
00050000-562e-429a-bab0-1c4323ac6f83	1319	Draga
00050000-562e-429a-ddaa-7bf4c1cc540d	8343	Dragatuš
00050000-562e-429a-ccc8-ed18523c6e83	3222	Dramlje
00050000-562e-429a-3e68-8757d0dc2eeb	2370	Dravograd
00050000-562e-429a-c803-0c937a693611	4203	Duplje
00050000-562e-429a-94ad-8cb1aedd2366	6221	Dutovlje
00050000-562e-429a-e85c-e4de92e58de9	8361	Dvor
00050000-562e-429a-71aa-cbc2345476a7	2343	Fala
00050000-562e-429a-675c-f582445b823e	9208	Fokovci
00050000-562e-429a-c430-7909a7b5d5c2	2313	Fram
00050000-562e-429a-1cf6-59539f911d6c	3213	Frankolovo
00050000-562e-429a-a174-2da1bd5882f6	1274	Gabrovka
00050000-562e-429a-44ed-cb9bbb2767cf	8254	Globoko
00050000-562e-429a-1ca9-31fb60fb6a11	5275	Godovič
00050000-562e-429a-154b-8273db251f1f	4204	Golnik
00050000-562e-429a-a101-715f8db636a7	3303	Gomilsko
00050000-562e-429a-cc4e-c7f5ab967f8d	4224	Gorenja vas
00050000-562e-429a-7097-5bee5cecf508	3263	Gorica pri Slivnici
00050000-562e-429a-193b-ef6aaf7329ef	2272	Gorišnica
00050000-562e-429a-d046-ded636b24737	9250	Gornja Radgona
00050000-562e-429a-10ae-d5e7c3617539	3342	Gornji Grad
00050000-562e-429a-fe01-463fcc4d4cd2	4282	Gozd Martuljek
00050000-562e-429a-c7d3-0b06cf3f26c4	6272	Gračišče
00050000-562e-429a-d526-c872a4c6be95	9264	Grad
00050000-562e-429a-1af6-a275df6452f9	8332	Gradac
00050000-562e-429a-b76a-8b8d285e294d	1384	Grahovo
00050000-562e-429a-c6f0-e91822561c40	5242	Grahovo ob Bači
00050000-562e-429a-71aa-1c93707e3f72	5251	Grgar
00050000-562e-429a-e000-a426d11f7cb7	3302	Griže
00050000-562e-429a-7808-6deac4df6754	3231	Grobelno
00050000-562e-429a-5b83-8806770aed2a	1290	Grosuplje
00050000-562e-429a-337e-76190e247aec	2288	Hajdina
00050000-562e-429a-a6f0-934226be5aa9	8362	Hinje
00050000-562e-429a-48bf-5eb535e263a6	2311	Hoče
00050000-562e-429a-a3e8-22677e8d300d	9205	Hodoš/Hodos
00050000-562e-429a-ba80-343b5b610c06	1354	Horjul
00050000-562e-429a-3a58-4af57e5249de	1372	Hotedršica
00050000-562e-429a-a4b2-6c11cc29a4f0	1430	Hrastnik
00050000-562e-429a-8d84-82d678959e26	6225	Hruševje
00050000-562e-429a-2a23-4fd3acf6a960	4276	Hrušica
00050000-562e-429a-3d78-7da4bed042bb	5280	Idrija
00050000-562e-429a-7856-8483bfed037a	1292	Ig
00050000-562e-429a-57e8-732b3f70dd03	6250	Ilirska Bistrica
00050000-562e-429a-e9df-4bd9fc48c081	6251	Ilirska Bistrica-Trnovo
00050000-562e-429a-ffc4-86252bd781b9	1295	Ivančna Gorica
00050000-562e-429a-5ade-2a53a477fb1f	2259	Ivanjkovci
00050000-562e-429a-c4bc-90010f893cea	1411	Izlake
00050000-562e-429a-f9d5-dbfaf708465a	6310	Izola/Isola
00050000-562e-429a-0160-1478f0773905	2222	Jakobski Dol
00050000-562e-429a-5c69-22ad10a0c9d2	2221	Jarenina
00050000-562e-429a-a502-cd81552db64a	6254	Jelšane
00050000-562e-429a-2e9b-63776abc921f	4270	Jesenice
00050000-562e-429a-a1cf-697e87f763cd	8261	Jesenice na Dolenjskem
00050000-562e-429a-2a44-85188e7cac0d	3273	Jurklošter
00050000-562e-429a-50a2-e1109a5e094b	2223	Jurovski Dol
00050000-562e-429a-cc3b-155ce0be1ea2	2256	Juršinci
00050000-562e-429a-12f2-7899ee5157fb	5214	Kal nad Kanalom
00050000-562e-429a-2c16-00e9d46a6080	3233	Kalobje
00050000-562e-429a-2ff4-a13e8037043c	4246	Kamna Gorica
00050000-562e-429a-efd1-cd1af7a98d80	2351	Kamnica
00050000-562e-429a-1921-b970ff64050e	1241	Kamnik
00050000-562e-429a-036c-c1e76d3847b8	5213	Kanal
00050000-562e-429a-0844-88f309b728f2	8258	Kapele
00050000-562e-429a-2ff2-7c9cc1f28fdc	2362	Kapla
00050000-562e-429a-2a2a-2eaf11348101	2325	Kidričevo
00050000-562e-429a-051a-3e37b970882a	1412	Kisovec
00050000-562e-429a-5bde-ff26bf7ce2a4	6253	Knežak
00050000-562e-429a-427a-cf4f6e7aeb94	5222	Kobarid
00050000-562e-429a-fc09-c4be5e0efb56	9227	Kobilje
00050000-562e-429a-de79-772527919a82	1330	Kočevje
00050000-562e-429a-96dc-8995dab7cb81	1338	Kočevska Reka
00050000-562e-429a-ffe9-107007ee722f	2276	Kog
00050000-562e-429a-dabd-53873ff850e1	5211	Kojsko
00050000-562e-429a-791f-df6177c12899	6223	Komen
00050000-562e-429a-99a9-13a64b933944	1218	Komenda
00050000-562e-429a-478d-bc6fbba5a70d	6000	Koper/Capodistria 
00050000-562e-429a-229d-a3811726d510	6001	Koper/Capodistria - poštni predali
00050000-562e-429a-66a4-09298f86b377	8282	Koprivnica
00050000-562e-429a-df38-e7b56155a712	5296	Kostanjevica na Krasu
00050000-562e-429a-05e6-c4a4a4e290ac	8311	Kostanjevica na Krki
00050000-562e-429a-d0dd-53b251a1bcf1	1336	Kostel
00050000-562e-429a-9446-71aef7e0dfa9	6256	Košana
00050000-562e-429a-85dd-5ae4d4566328	2394	Kotlje
00050000-562e-429a-c4dd-032d09693814	6240	Kozina
00050000-562e-429a-1c58-4a76d25971e7	3260	Kozje
00050000-562e-429a-ce47-920ff3db6d5f	4000	Kranj 
00050000-562e-429a-52ac-773cbee44727	4001	Kranj - poštni predali
00050000-562e-429a-0f1c-6608415d55aa	4280	Kranjska Gora
00050000-562e-429a-75bd-d39f9c66ef51	1281	Kresnice
00050000-562e-429a-9ae9-41c4328c89a8	4294	Križe
00050000-562e-429a-0075-470d90514b48	9206	Križevci
00050000-562e-429a-19b7-bde51b8863a0	9242	Križevci pri Ljutomeru
00050000-562e-429a-cdc9-e5b060855077	1301	Krka
00050000-562e-429a-d698-467f74cf754e	8296	Krmelj
00050000-562e-429a-9712-c56d50943de7	4245	Kropa
00050000-562e-429a-081a-167377df353b	8262	Krška vas
00050000-562e-429a-736b-af605c074236	8270	Krško
00050000-562e-429a-7af1-f276da3e0f41	9263	Kuzma
00050000-562e-429a-a648-36b0b7d1462d	2318	Laporje
00050000-562e-429a-6304-d5968c04c207	3270	Laško
00050000-562e-429a-d3f5-f3991531dd51	1219	Laze v Tuhinju
00050000-562e-429a-8ae9-2eb703065613	2230	Lenart v Slovenskih goricah
00050000-562e-429a-810f-f4030da82a16	9220	Lendava/Lendva
00050000-562e-429a-b33c-ee4e863e5652	4248	Lesce
00050000-562e-429a-573d-cde916e9d74b	3261	Lesično
00050000-562e-429a-38c8-b1488b4fa022	8273	Leskovec pri Krškem
00050000-562e-429a-9069-ad821da34224	2372	Libeliče
00050000-562e-429a-d73a-65f51f7a5300	2341	Limbuš
00050000-562e-429a-5c4c-e0384bac58f2	1270	Litija
00050000-562e-429a-3603-244a67128a44	3202	Ljubečna
00050000-562e-429a-dd7e-827bc36a6cf0	1000	Ljubljana 
00050000-562e-429a-99ff-6e39b39dd12a	1001	Ljubljana - poštni predali
00050000-562e-429a-50f9-b4e12432483b	1231	Ljubljana - Črnuče
00050000-562e-429a-3bc8-fb622c235481	1261	Ljubljana - Dobrunje
00050000-562e-429a-c631-5c35546bf891	1260	Ljubljana - Polje
00050000-562e-429a-c634-f7e89069d0ae	1210	Ljubljana - Šentvid
00050000-562e-429a-e681-176ecf146c7d	1211	Ljubljana - Šmartno
00050000-562e-429a-1a9e-4bfc6960af6e	3333	Ljubno ob Savinji
00050000-562e-429a-8edd-e597afae1e18	9240	Ljutomer
00050000-562e-429a-29bb-60ce3fef8cd0	3215	Loče
00050000-562e-429a-4c7f-e21817644be5	5231	Log pod Mangartom
00050000-562e-429a-4d8f-a81f90e417e4	1358	Log pri Brezovici
00050000-562e-429a-3a3e-acb985a9d5a0	1370	Logatec
00050000-562e-429a-5bf0-0d285377fe50	1371	Logatec
00050000-562e-429a-94ea-6e4392c892d5	1434	Loka pri Zidanem Mostu
00050000-562e-429a-e041-ba134396dc73	3223	Loka pri Žusmu
00050000-562e-429a-9a10-6dcc135e623d	6219	Lokev
00050000-562e-429a-bdce-109e6aae5080	1318	Loški Potok
00050000-562e-429a-d8e0-912afc844ea7	2324	Lovrenc na Dravskem polju
00050000-562e-429a-865c-b53453d75b02	2344	Lovrenc na Pohorju
00050000-562e-429a-7958-f3a6ab67da14	3334	Luče
00050000-562e-429a-e136-4f6d66c65a52	1225	Lukovica
00050000-562e-429a-aece-baeb7a267cab	9202	Mačkovci
00050000-562e-429a-8914-229a9af8e0cb	2322	Majšperk
00050000-562e-429a-9f4f-f5cea9ec1212	2321	Makole
00050000-562e-429a-3d24-95584a9652bb	9243	Mala Nedelja
00050000-562e-429a-83c3-70db822a4edf	2229	Malečnik
00050000-562e-429a-86c0-be6913653377	6273	Marezige
00050000-562e-429a-1745-86ce585bc939	2000	Maribor 
00050000-562e-429a-ea11-4fdd7a42225e	2001	Maribor - poštni predali
00050000-562e-429a-ed63-12920166b844	2206	Marjeta na Dravskem polju
00050000-562e-429a-7fad-e1c518f942a2	2281	Markovci
00050000-562e-429a-4827-c79c1d7e5dd1	9221	Martjanci
00050000-562e-429a-a82a-d474a3a91271	6242	Materija
00050000-562e-429a-c5c2-9a415e32bae5	4211	Mavčiče
00050000-562e-429a-994d-b00120c14439	1215	Medvode
00050000-562e-429a-2eb7-ba78a3ee4816	1234	Mengeš
00050000-562e-429a-bdae-63f0aca49123	8330	Metlika
00050000-562e-429a-09e8-d8708baafe71	2392	Mežica
00050000-562e-429a-02f6-345d3823b813	2204	Miklavž na Dravskem polju
00050000-562e-429a-2454-ca1363fb420d	2275	Miklavž pri Ormožu
00050000-562e-429a-6364-49b717c7ca04	5291	Miren
00050000-562e-429a-926c-d140e68395b6	8233	Mirna
00050000-562e-429a-f8ba-3a67709c5f8e	8216	Mirna Peč
00050000-562e-429a-52a6-23284213634f	2382	Mislinja
00050000-562e-429a-3353-62557c89bdc9	4281	Mojstrana
00050000-562e-429a-4975-61861f84c5fa	8230	Mokronog
00050000-562e-429a-5abd-e837f1fa4bea	1251	Moravče
00050000-562e-429a-80fe-2b73ce43f580	9226	Moravske Toplice
00050000-562e-429a-4668-b73a225172e3	5216	Most na Soči
00050000-562e-429a-6ad8-20ffe10f0e71	1221	Motnik
00050000-562e-429a-935a-6f2b245e4868	3330	Mozirje
00050000-562e-429a-1430-cb5064fe3529	9000	Murska Sobota 
00050000-562e-429a-f5a1-e7eba0fed30e	9001	Murska Sobota - poštni predali
00050000-562e-429a-a33e-e2073abaa127	2366	Muta
00050000-562e-429a-0e4a-f52f1d7cda3a	4202	Naklo
00050000-562e-429a-689f-d0d3ff81e2da	3331	Nazarje
00050000-562e-429a-5c93-a6df89820381	1357	Notranje Gorice
00050000-562e-429a-31a3-d2d6924dd585	3203	Nova Cerkev
00050000-562e-429a-42ba-1f48bb46848f	5000	Nova Gorica 
00050000-562e-429a-7b23-13e2a70a5413	5001	Nova Gorica - poštni predali
00050000-562e-429a-e889-b6f9e3b4c285	1385	Nova vas
00050000-562e-429a-7ec2-1254d5512b1f	8000	Novo mesto
00050000-562e-429a-fb97-a23afeb5ccd2	8001	Novo mesto - poštni predali
00050000-562e-429a-5dce-4b916fd64ece	6243	Obrov
00050000-562e-429a-07f7-a6ca0a88b5d3	9233	Odranci
00050000-562e-429a-1393-a53e956bbbfb	2317	Oplotnica
00050000-562e-429a-06bf-68127e36b5b1	2312	Orehova vas
00050000-562e-429a-b104-102d17d28a08	2270	Ormož
00050000-562e-429a-9790-407199160b2f	1316	Ortnek
00050000-562e-429a-7c10-c19c9761cf6e	1337	Osilnica
00050000-562e-429a-3c48-ae23ee82c394	8222	Otočec
00050000-562e-429a-cc65-1bfb63db8952	2361	Ožbalt
00050000-562e-429a-0660-29282fb662bc	2231	Pernica
00050000-562e-429a-6bc5-5aca0b83328a	2211	Pesnica pri Mariboru
00050000-562e-429a-80e1-011febe12921	9203	Petrovci
00050000-562e-429a-a8fa-07affb6ef362	3301	Petrovče
00050000-562e-429a-bbc1-ba7fece09042	6330	Piran/Pirano
00050000-562e-429a-f7fa-ae91f8e1e4b9	8255	Pišece
00050000-562e-429a-4198-02f651c5e35a	6257	Pivka
00050000-562e-429a-d3aa-9ff17f145791	6232	Planina
00050000-562e-429a-dbfe-e0d7fe0f8f7d	3225	Planina pri Sevnici
00050000-562e-429a-d219-2ac26e15ddc4	6276	Pobegi
00050000-562e-429a-95d7-6ac10818fd85	8312	Podbočje
00050000-562e-429a-7cad-56de9b8086bf	5243	Podbrdo
00050000-562e-429a-a3f0-f3d3b19662f7	3254	Podčetrtek
00050000-562e-429a-e81f-1abb5ed9227a	2273	Podgorci
00050000-562e-429a-c507-f02789f542d1	6216	Podgorje
00050000-562e-429a-f388-b54c4cb8187e	2381	Podgorje pri Slovenj Gradcu
00050000-562e-429a-c820-0a954e741bc1	6244	Podgrad
00050000-562e-429a-3c02-415bf153a6e1	1414	Podkum
00050000-562e-429a-2b61-e441c7ddd278	2286	Podlehnik
00050000-562e-429a-002c-202823a94a2f	5272	Podnanos
00050000-562e-429a-e432-eeddc28e78b1	4244	Podnart
00050000-562e-429a-d1eb-e12863f64854	3241	Podplat
00050000-562e-429a-36f9-1ae99cad4eaf	3257	Podsreda
00050000-562e-429a-b62a-9997777a85c7	2363	Podvelka
00050000-562e-429a-884b-a730b3bc25fe	2208	Pohorje
00050000-562e-429a-6115-d9da8618d79c	2257	Polenšak
00050000-562e-429a-e220-49c48586ce3d	1355	Polhov Gradec
00050000-562e-429a-d512-f11fbbf34e06	4223	Poljane nad Škofjo Loko
00050000-562e-429a-5b71-924f05b7d1c9	2319	Poljčane
00050000-562e-429a-5806-4a25e9bdacf8	1272	Polšnik
00050000-562e-429a-89a1-6884a2c8eb0e	3313	Polzela
00050000-562e-429a-7698-e2b7697873f5	3232	Ponikva
00050000-562e-429a-a4f1-839c1a4d2bc6	6320	Portorož/Portorose
00050000-562e-429a-be7e-6cc6c1a12a86	6230	Postojna
00050000-562e-429a-6b6d-145731ac1b88	2331	Pragersko
00050000-562e-429a-da07-d1a616eac8ff	3312	Prebold
00050000-562e-429a-c514-d2e135c36d96	4205	Preddvor
00050000-562e-429a-51bb-faf4d418d1de	6255	Prem
00050000-562e-429a-b75d-07317b7c7be4	1352	Preserje
00050000-562e-429a-e897-969675e06467	6258	Prestranek
00050000-562e-429a-4bb0-e63f9af77974	2391	Prevalje
00050000-562e-429a-b240-bbfcb6e3dafb	3262	Prevorje
00050000-562e-429a-13a5-42a1c1f2f0d4	1276	Primskovo 
00050000-562e-429a-840b-f440f0269cda	3253	Pristava pri Mestinju
00050000-562e-429a-742a-260391ecd459	9207	Prosenjakovci/Partosfalva
00050000-562e-429a-cafb-443a0198bfde	5297	Prvačina
00050000-562e-429a-e90a-4c6297511124	2250	Ptuj
00050000-562e-429a-95e2-8aaa3be8b705	2323	Ptujska Gora
00050000-562e-429a-a14a-77bbc745ee81	9201	Puconci
00050000-562e-429a-9f87-693aa29cab2c	2327	Rače
00050000-562e-429a-093f-7e51f2e9fe37	1433	Radeče
00050000-562e-429a-a3e3-93f088c74d86	9252	Radenci
00050000-562e-429a-084b-345935b6b1d5	2360	Radlje ob Dravi
00050000-562e-429a-4140-0a4b6cc3fefe	1235	Radomlje
00050000-562e-429a-fa1f-f233f06099ae	4240	Radovljica
00050000-562e-429a-4d0c-1c9710fe8f80	8274	Raka
00050000-562e-429a-0073-57f0d7e1ce0a	1381	Rakek
00050000-562e-429a-00a5-a7cf914196b1	4283	Rateče - Planica
00050000-562e-429a-533c-f95bbbd5ef54	2390	Ravne na Koroškem
00050000-562e-429a-6d9a-f928026fde17	9246	Razkrižje
00050000-562e-429a-2da1-77e7daa5c066	3332	Rečica ob Savinji
00050000-562e-429a-2657-4414eacd1f1a	5292	Renče
00050000-562e-429a-4e13-732ace3ffed8	1310	Ribnica
00050000-562e-429a-0fcc-07f024eac448	2364	Ribnica na Pohorju
00050000-562e-429a-0aaf-2bb40ac05506	3272	Rimske Toplice
00050000-562e-429a-22ed-429668d71f68	1314	Rob
00050000-562e-429a-9456-89f10005c82b	5215	Ročinj
00050000-562e-429a-5258-90fe40573d0e	3250	Rogaška Slatina
00050000-562e-429a-8dd3-b311dfb72852	9262	Rogašovci
00050000-562e-429a-4d6d-a6ca628084c6	3252	Rogatec
00050000-562e-429a-138a-c1375e5417ac	1373	Rovte
00050000-562e-429a-9cfe-801a1a2a535b	2342	Ruše
00050000-562e-429a-6e40-ce942246e543	1282	Sava
00050000-562e-429a-eaa8-0dbec0d5b5b5	6333	Sečovlje/Sicciole
00050000-562e-429a-7941-88b2a99b9184	4227	Selca
00050000-562e-429a-61ff-5cd253ce7981	2352	Selnica ob Dravi
00050000-562e-429a-0909-bd8976243613	8333	Semič
00050000-562e-429a-d0a3-ca0185b8b8bf	8281	Senovo
00050000-562e-429a-6104-dca07243a171	6224	Senožeče
00050000-562e-429a-8b2b-1691b200e5b2	8290	Sevnica
00050000-562e-429a-9964-82bd003726ef	6210	Sežana
00050000-562e-429a-5c56-4af97d3e780e	2214	Sladki Vrh
00050000-562e-429a-334d-629cfdf1d657	5283	Slap ob Idrijci
00050000-562e-429a-ca4c-75fb639f16e7	2380	Slovenj Gradec
00050000-562e-429a-fe78-d02408fe791d	2310	Slovenska Bistrica
00050000-562e-429a-12c5-864b44582319	3210	Slovenske Konjice
00050000-562e-429a-c626-cf3d59426d04	1216	Smlednik
00050000-562e-429a-c223-1c14ea87911f	5232	Soča
00050000-562e-429a-6311-e3630186de03	1317	Sodražica
00050000-562e-429a-688b-319329a03e65	3335	Solčava
00050000-562e-429a-5015-c60c37caf2e8	5250	Solkan
00050000-562e-429a-930b-486bec189ad5	4229	Sorica
00050000-562e-429a-92fe-047f548b7702	4225	Sovodenj
00050000-562e-429a-1aa5-502247db6c87	5281	Spodnja Idrija
00050000-562e-429a-04fb-c8106da407ae	2241	Spodnji Duplek
00050000-562e-429a-752e-b0cd4defb19e	9245	Spodnji Ivanjci
00050000-562e-429a-5b46-8480d0073b1c	2277	Središče ob Dravi
00050000-562e-429a-c93b-bafcad71b8f6	4267	Srednja vas v Bohinju
00050000-562e-429a-fb1b-e3fd27542c9d	8256	Sromlje 
00050000-562e-429a-9dc3-28ae393d9420	5224	Srpenica
00050000-562e-429a-1d05-ca2e2f374333	1242	Stahovica
00050000-562e-429a-7173-7a0d99688b54	1332	Stara Cerkev
00050000-562e-429a-be37-6699495db32c	8342	Stari trg ob Kolpi
00050000-562e-429a-b9f7-32177fcef95f	1386	Stari trg pri Ložu
00050000-562e-429a-c40e-676c6926590c	2205	Starše
00050000-562e-429a-73d1-9d8083dffb4c	2289	Stoperce
00050000-562e-429a-8da5-8078875b68b5	8322	Stopiče
00050000-562e-429a-811d-1eb279650a7a	3206	Stranice
00050000-562e-429a-8eb6-51db0011458b	8351	Straža
00050000-562e-429a-df33-08eb73a8ab97	1313	Struge
00050000-562e-429a-6665-07bc285ed740	8293	Studenec
00050000-562e-429a-3177-f6067d75c707	8331	Suhor
00050000-562e-429a-def0-3aa297fef4a7	2233	Sv. Ana v Slovenskih goricah
00050000-562e-429a-776e-890e9324d4fa	2235	Sv. Trojica v Slovenskih goricah
00050000-562e-429a-2121-c13b7c3aba3b	2353	Sveti Duh na Ostrem Vrhu
00050000-562e-429a-2785-bd2d8a8aa197	9244	Sveti Jurij ob Ščavnici
00050000-562e-429a-e8fd-36f85b6242cb	3264	Sveti Štefan
00050000-562e-429a-43e9-26cac9e94afd	2258	Sveti Tomaž
00050000-562e-429a-cd71-8548178f58b3	9204	Šalovci
00050000-562e-429a-a42d-18707fadf879	5261	Šempas
00050000-562e-429a-6ec4-63a57c0b0d0e	5290	Šempeter pri Gorici
00050000-562e-429a-1850-2c19cc619537	3311	Šempeter v Savinjski dolini
00050000-562e-429a-2636-de0080d69a8b	4208	Šenčur
00050000-562e-429a-75aa-74d9318a4d28	2212	Šentilj v Slovenskih goricah
00050000-562e-429a-63d7-3583b78b2160	8297	Šentjanž
00050000-562e-429a-1874-27be5581e4c6	2373	Šentjanž pri Dravogradu
00050000-562e-429a-b17e-17d5e97db7f6	8310	Šentjernej
00050000-562e-429a-766a-a6dbb7cd380e	3230	Šentjur
00050000-562e-429a-1795-5d6d3ae6e021	3271	Šentrupert
00050000-562e-429a-fde4-09cadba00778	8232	Šentrupert
00050000-562e-429a-648b-4dad6cca2d5e	1296	Šentvid pri Stični
00050000-562e-429a-0985-15d3fe10254b	8275	Škocjan
00050000-562e-429a-c86e-1b3d59f6d629	6281	Škofije
00050000-562e-429a-c8c3-6cf30f2e6587	4220	Škofja Loka
00050000-562e-429a-3aa5-279036791392	3211	Škofja vas
00050000-562e-429a-4e23-b99de1879eeb	1291	Škofljica
00050000-562e-429a-591a-432643db6e89	6274	Šmarje
00050000-562e-429a-c094-bc74159718d7	1293	Šmarje - Sap
00050000-562e-429a-9c1d-7b2f1ac554c7	3240	Šmarje pri Jelšah
00050000-562e-429a-e537-8433f5df240b	8220	Šmarješke Toplice
00050000-562e-429a-96b6-12a70ca68aef	2315	Šmartno na Pohorju
00050000-562e-429a-85f3-a322026dbb62	3341	Šmartno ob Dreti
00050000-562e-429a-c83a-e03757905eca	3327	Šmartno ob Paki
00050000-562e-429a-0588-d4e923c9546e	1275	Šmartno pri Litiji
00050000-562e-429a-ad9e-b54c9e65e9cc	2383	Šmartno pri Slovenj Gradcu
00050000-562e-429a-7847-3cd783c07ca0	3201	Šmartno v Rožni dolini
00050000-562e-429a-17f9-23a23a10b0a8	3325	Šoštanj
00050000-562e-429a-663a-4dd77b800bec	6222	Štanjel
00050000-562e-429a-1598-92598b2637a0	3220	Štore
00050000-562e-429a-56e1-c867d7a59781	3304	Tabor
00050000-562e-429a-0ef2-08f5e37ca4e4	3221	Teharje
00050000-562e-429a-3c06-7bf2379357ff	9251	Tišina
00050000-562e-429a-c450-5b72fd723c1a	5220	Tolmin
00050000-562e-429a-c0ce-b7afd279bf22	3326	Topolšica
00050000-562e-429a-ed88-13f14226e333	2371	Trbonje
00050000-562e-429a-c338-b147b4713483	1420	Trbovlje
00050000-562e-429a-4769-ab54baa77bab	8231	Trebelno 
00050000-562e-429a-0e5e-f5b25d27cc09	8210	Trebnje
00050000-562e-429a-4d34-9c9d1ff681bc	5252	Trnovo pri Gorici
00050000-562e-429a-25ef-6e038852e936	2254	Trnovska vas
00050000-562e-429a-2ccf-798d91f74b0a	1222	Trojane
00050000-562e-429a-881e-7644d32ae2ff	1236	Trzin
00050000-562e-429a-249d-d16627498daf	4290	Tržič
00050000-562e-429a-7ef1-eb5a00143c44	8295	Tržišče
00050000-562e-429a-8e7f-3adbc41f398d	1311	Turjak
00050000-562e-429a-6246-d3fc642db265	9224	Turnišče
00050000-562e-429a-675d-1b346bdcbfe7	8323	Uršna sela
00050000-562e-429a-7220-268a5c2720f6	1252	Vače
00050000-562e-429a-5ded-1485f4c2d579	3320	Velenje 
00050000-562e-429a-032f-53d21a16ff29	3322	Velenje - poštni predali
00050000-562e-429a-6fcd-a33883c5694b	8212	Velika Loka
00050000-562e-429a-5def-6fe6e89f41ad	2274	Velika Nedelja
00050000-562e-429a-0b26-5aba14351b20	9225	Velika Polana
00050000-562e-429a-169d-47e210dae9e9	1315	Velike Lašče
00050000-562e-429a-bff7-8d8ed98ebd40	8213	Veliki Gaber
00050000-562e-429a-8cce-959718c47af1	9241	Veržej
00050000-562e-429a-7c8b-00e51c477393	1312	Videm - Dobrepolje
00050000-562e-429a-55f4-075a9131e841	2284	Videm pri Ptuju
00050000-562e-429a-1aa1-a6e2c964ac23	8344	Vinica
00050000-562e-429a-d3a7-6bb97ebb03be	5271	Vipava
00050000-562e-429a-af4a-ebe7991893ac	4212	Visoko
00050000-562e-429a-4a42-cbf9675abb6e	1294	Višnja Gora
00050000-562e-429a-4ad3-c8e756146158	3205	Vitanje
00050000-562e-429a-014b-e6c64503a714	2255	Vitomarci
00050000-562e-429a-4ac6-9e3e3a7175c8	1217	Vodice
00050000-562e-429a-a20a-4eafb2a3e0eb	3212	Vojnik\t
00050000-562e-429a-82ca-05784d35db25	5293	Volčja Draga
00050000-562e-429a-eb23-09879adbdcda	2232	Voličina
00050000-562e-429a-ee2a-73050031451a	3305	Vransko
00050000-562e-429a-fd6b-e9e081d5e5fb	6217	Vremski Britof
00050000-562e-429a-02f6-b5b7e6264d22	1360	Vrhnika
00050000-562e-429a-d948-e41957397f3f	2365	Vuhred
00050000-562e-429a-776e-8596ddf78e32	2367	Vuzenica
00050000-562e-429a-40c3-4e4ff71dc78a	8292	Zabukovje 
00050000-562e-429a-1812-0fb7383b7f89	1410	Zagorje ob Savi
00050000-562e-429a-017a-1eb27878349c	1303	Zagradec
00050000-562e-429a-5ccb-f9f417a5b8aa	2283	Zavrč
00050000-562e-429a-9298-62bf104367b8	8272	Zdole 
00050000-562e-429a-a432-746a795800ca	4201	Zgornja Besnica
00050000-562e-429a-257b-579384ba2f14	2242	Zgornja Korena
00050000-562e-429a-af63-ebdb95a83a5e	2201	Zgornja Kungota
00050000-562e-429a-c7cb-58e0b5435d1a	2316	Zgornja Ložnica
00050000-562e-429a-9cad-2ebb65b61d48	2314	Zgornja Polskava
00050000-562e-429a-52ba-e280f0987a43	2213	Zgornja Velka
00050000-562e-429a-d0d2-46d26bac6b5d	4247	Zgornje Gorje
00050000-562e-429a-e7ee-766e408f877e	4206	Zgornje Jezersko
00050000-562e-429a-6540-87f92aeae11d	2285	Zgornji Leskovec
00050000-562e-429a-78be-5af115302c92	1432	Zidani Most
00050000-562e-429a-9cfd-d93789f314c2	3214	Zreče
00050000-562e-429a-6ec6-7d3ad55965ba	4209	Žabnica
00050000-562e-429a-efe3-4859fcd3d582	3310	Žalec
00050000-562e-429a-6f34-8b06ae70d888	4228	Železniki
00050000-562e-429a-ae4a-7ac117da6572	2287	Žetale
00050000-562e-429a-a8ff-ddaaad2d6491	4226	Žiri
00050000-562e-429a-8865-ea3c119c450a	4274	Žirovnica
00050000-562e-429a-7204-3db77b16218f	8360	Žužemberk
\.


--
-- TOC entry 3114 (class 0 OID 23433719)
-- Dependencies: 236
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3087 (class 0 OID 23433311)
-- Dependencies: 209
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3065 (class 0 OID 23433065)
-- Dependencies: 187
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-562e-429d-7308-9b46e6a9f9b9	00080000-562e-429d-fc8e-56feff9cd6f2	\N	00040000-562e-429b-9bfe-eb60946e92d8	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-562e-429d-ffc2-c504b0900d15	00080000-562e-429d-fc8e-56feff9cd6f2	\N	00040000-562e-429b-9bfe-eb60946e92d8	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-562e-429d-ee9b-60b010618e1a	00080000-562e-429d-0e62-72c86d432fe4	\N	00040000-562e-429b-9bfe-eb60946e92d8	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3077 (class 0 OID 23433209)
-- Dependencies: 199
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-562e-429b-dee5-78baaed6a8f2	novo leto	1	1	\N	t
00430000-562e-429b-c0b0-7eb8b312ed56	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-562e-429b-0c5e-002bfe798428	dan upora proti okupatorju	27	4	\N	t
00430000-562e-429b-7330-556b651468ab	praznik dela	1	5	\N	t
00430000-562e-429b-be6b-38acc23d874c	praznik dela	2	5	\N	t
00430000-562e-429b-0a6c-de2783c1d9cb	dan Primoža Trubarja	8	6	\N	f
00430000-562e-429b-8c90-2fca91934719	dan državnosti	25	6	\N	t
00430000-562e-429b-617b-e3aaae24234d	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-562e-429b-7bba-b5b3ece86e48	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-562e-429b-961f-38c9ff506448	dan suverenosti	25	10	\N	f
00430000-562e-429b-2163-e8cbcd3e3c42	dan spomina na mrtve	1	11	\N	t
00430000-562e-429b-f1fd-c9b99bc768b2	dan Rudolfa Maistra	23	11	\N	f
00430000-562e-429b-26b8-02f0a2e4be57	božič	25	12	\N	t
00430000-562e-429b-531e-2c02a15a0711	dan samostojnosti in enotnosti	26	12	\N	t
00430000-562e-429b-e362-063091196ae3	Marijino vnebovzetje	15	8	\N	t
00430000-562e-429b-54fa-01b8748c4187	dan reformacije	31	10	\N	t
00430000-562e-429b-411d-890ca6fa7994	velikonočna nedelja	27	3	2016	t
00430000-562e-429b-f1ed-87c9abbd4248	velikonočna nedelja	16	4	2017	t
00430000-562e-429b-4030-35866b2bc4c6	velikonočna nedelja	1	4	2018	t
00430000-562e-429b-267a-0466810352ee	velikonočna nedelja	21	4	2019	t
00430000-562e-429b-44cf-af4540b52183	velikonočna nedelja	12	4	2020	t
00430000-562e-429b-9546-7cfc6f13d699	velikonočna nedelja	4	4	2021	t
00430000-562e-429b-7304-15c9f1645a1e	velikonočna nedelja	17	4	2022	t
00430000-562e-429b-255d-eb2b4920631e	velikonočna nedelja	9	4	2023	t
00430000-562e-429b-a314-382b7555e6c0	velikonočna nedelja	31	3	2024	t
00430000-562e-429b-8514-9a9b4eeab5e1	velikonočna nedelja	20	4	2025	t
00430000-562e-429b-7503-c57266ddfa6c	velikonočna nedelja	5	4	2026	t
00430000-562e-429b-64e4-66cff73001f4	velikonočna nedelja	28	3	2027	t
00430000-562e-429b-b80a-d682fd5c47d1	velikonočna nedelja	16	4	2028	t
00430000-562e-429b-dbcf-035ffaf73ca6	velikonočna nedelja	1	4	2029	t
00430000-562e-429b-9747-35def6c4782a	velikonočna nedelja	21	4	2030	t
00430000-562e-429b-995f-523edbf65704	velikonočni ponedeljek	28	3	2016	t
00430000-562e-429b-7d03-af3eb181de07	velikonočni ponedeljek	17	4	2017	t
00430000-562e-429b-f217-6b85a44147c3	velikonočni ponedeljek	2	4	2018	t
00430000-562e-429b-dc3d-b3f8b3256a65	velikonočni ponedeljek	22	4	2019	t
00430000-562e-429b-b009-aea1ba0b223b	velikonočni ponedeljek	13	4	2020	t
00430000-562e-429b-41a8-efea705a8db4	velikonočni ponedeljek	5	4	2021	t
00430000-562e-429b-b9c0-1261a973061f	velikonočni ponedeljek	18	4	2022	t
00430000-562e-429b-3e7f-ddee496b28f9	velikonočni ponedeljek	10	4	2023	t
00430000-562e-429b-2d5b-263d964c4755	velikonočni ponedeljek	1	4	2024	t
00430000-562e-429b-a02d-a9a20e89664a	velikonočni ponedeljek	21	4	2025	t
00430000-562e-429b-98e6-7748c59816ee	velikonočni ponedeljek	6	4	2026	t
00430000-562e-429b-4633-19d462798b58	velikonočni ponedeljek	29	3	2027	t
00430000-562e-429b-0d11-9ba0b5df18a4	velikonočni ponedeljek	17	4	2028	t
00430000-562e-429b-c6f0-05349e27c946	velikonočni ponedeljek	2	4	2029	t
00430000-562e-429b-4c30-f2e44007d862	velikonočni ponedeljek	22	4	2030	t
00430000-562e-429b-cbc0-6b6aafecc647	binkoštna nedelja - binkošti	15	5	2016	t
00430000-562e-429b-e17b-f9b8c44ff5b7	binkoštna nedelja - binkošti	4	6	2017	t
00430000-562e-429b-0bf2-282ffcb4f3d2	binkoštna nedelja - binkošti	20	5	2018	t
00430000-562e-429b-e5b6-2ff550c652d2	binkoštna nedelja - binkošti	9	6	2019	t
00430000-562e-429b-c30d-b38f05567366	binkoštna nedelja - binkošti	31	5	2020	t
00430000-562e-429b-dac6-b03e26c22501	binkoštna nedelja - binkošti	23	5	2021	t
00430000-562e-429b-4cfa-2ab83abad64b	binkoštna nedelja - binkošti	5	6	2022	t
00430000-562e-429b-f0d9-2eb258aa7618	binkoštna nedelja - binkošti	28	5	2023	t
00430000-562e-429b-f7ff-17830fe590f5	binkoštna nedelja - binkošti	19	5	2024	t
00430000-562e-429b-4fe2-8174c79922b5	binkoštna nedelja - binkošti	8	6	2025	t
00430000-562e-429b-dc11-617a6c5d7f52	binkoštna nedelja - binkošti	24	5	2026	t
00430000-562e-429b-14f3-9b3b812057bf	binkoštna nedelja - binkošti	16	5	2027	t
00430000-562e-429b-0f48-c61771c120ad	binkoštna nedelja - binkošti	4	6	2028	t
00430000-562e-429b-0822-f0a657222a66	binkoštna nedelja - binkošti	20	5	2029	t
00430000-562e-429b-5127-cfbe535ae10c	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3073 (class 0 OID 23433169)
-- Dependencies: 195
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3074 (class 0 OID 23433181)
-- Dependencies: 196
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3089 (class 0 OID 23433323)
-- Dependencies: 211
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 23433733)
-- Dependencies: 237
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 23433743)
-- Dependencies: 238
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-562e-429d-f101-31afa350dcdb	00080000-562e-429d-3882-eba78cd200a4	0987	AK
00190000-562e-429d-2fa3-907452aceb6d	00080000-562e-429d-0e62-72c86d432fe4	0989	AK
00190000-562e-429d-246c-d2aa07e68955	00080000-562e-429d-42ee-87f826c580b9	0986	AK
00190000-562e-429d-2dbb-d76bb2ed92f0	00080000-562e-429d-622d-443d34d7f612	0984	AK
00190000-562e-429d-0d5a-61ca0fbe6538	00080000-562e-429d-0ae9-8cde25bafd82	0983	AK
00190000-562e-429d-262d-767c3633fdbe	00080000-562e-429d-ee4d-04b9ae81fe04	0982	AK
00190000-562e-429e-0131-73439e367d24	00080000-562e-429e-6f92-8559fa8794fb	1001	AK
\.


--
-- TOC entry 3113 (class 0 OID 23433658)
-- Dependencies: 235
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-562e-429d-8f94-0d651550b42a	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3117 (class 0 OID 23433751)
-- Dependencies: 239
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3093 (class 0 OID 23433352)
-- Dependencies: 215
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-562e-429d-9da3-5c49d7869c6e	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-562e-429d-3647-ea78eab2924e	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-562e-429d-1aec-81f634e6a51d	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-562e-429d-08f5-563d216a523b	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-562e-429d-18bc-d602525f4aee	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-562e-429d-6503-dffc19ee135d	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-562e-429d-2e6e-f5c15661b5bc	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3085 (class 0 OID 23433296)
-- Dependencies: 207
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3084 (class 0 OID 23433286)
-- Dependencies: 206
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 23433497)
-- Dependencies: 228
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 23433427)
-- Dependencies: 222
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3071 (class 0 OID 23433143)
-- Dependencies: 193
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3052 (class 0 OID 23432914)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-562e-429e-6f92-8559fa8794fb	00010000-562e-429b-9605-55b518b19e71	2015-10-26 16:11:26	INS	a:0:{}
2	App\\Entity\\Option	00000000-562e-429e-09a0-928480b4eed5	00010000-562e-429b-9605-55b518b19e71	2015-10-26 16:11:26	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-562e-429e-0131-73439e367d24	00010000-562e-429b-9605-55b518b19e71	2015-10-26 16:11:26	INS	a:0:{}
\.


--
-- TOC entry 3136 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3094 (class 0 OID 23433365)
-- Dependencies: 216
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 23432952)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-562e-429b-100e-7bba1985bff2	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-562e-429b-e4aa-9edfdcdb0e2a	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-562e-429b-3541-68b2ed9da5ca	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-562e-429b-1dd3-3c55fee866b4	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-562e-429b-d38e-65c537347490	planer	Planer dogodkov v koledarju	t
00020000-562e-429b-9942-1f1bc85dda86	kadrovska	Kadrovska služba	t
00020000-562e-429b-3851-5dfded56f1f3	arhivar	Ažuriranje arhivalij	t
00020000-562e-429b-fe88-462f03b50701	igralec	Igralec	t
00020000-562e-429b-b52b-c65a4ae7ffdf	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-562e-429d-789b-f5628fe0b2b3	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3054 (class 0 OID 23432936)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-562e-429b-b770-4c6de51633ef	00020000-562e-429b-3541-68b2ed9da5ca
00010000-562e-429b-9605-55b518b19e71	00020000-562e-429b-3541-68b2ed9da5ca
00010000-562e-429d-a823-85497a412a9a	00020000-562e-429d-789b-f5628fe0b2b3
\.


--
-- TOC entry 3096 (class 0 OID 23433379)
-- Dependencies: 218
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3088 (class 0 OID 23433317)
-- Dependencies: 210
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3082 (class 0 OID 23433263)
-- Dependencies: 204
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-562e-429d-db40-6b320a46f427	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-562e-429d-cc6d-7672fcc5e88b	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-562e-429d-5e71-0355076afbf0	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3050 (class 0 OID 23432901)
-- Dependencies: 172
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-562e-429a-ae85-29d9d9b655d9	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-562e-429a-bbe2-4e8039453d62	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-562e-429a-d081-2a3866905070	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-562e-429a-d221-01b3f9fcbbb5	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-562e-429a-e82d-210a92c5277d	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3049 (class 0 OID 23432893)
-- Dependencies: 171
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-562e-429a-80fb-d1ddea3bdfe5	00230000-562e-429a-d221-01b3f9fcbbb5	popa
00240000-562e-429a-a613-b6b530ec1660	00230000-562e-429a-d221-01b3f9fcbbb5	oseba
00240000-562e-429a-be03-b6c9a1a0ae43	00230000-562e-429a-d221-01b3f9fcbbb5	tippopa
00240000-562e-429a-b660-28f6ffa3f898	00230000-562e-429a-d221-01b3f9fcbbb5	organizacijskaenota
00240000-562e-429a-8f28-9f6db0ae199a	00230000-562e-429a-d221-01b3f9fcbbb5	sezona
00240000-562e-429a-2c28-dd9e0d4527a3	00230000-562e-429a-d221-01b3f9fcbbb5	tipvaje
00240000-562e-429a-7866-368404d7f67f	00230000-562e-429a-bbe2-4e8039453d62	prostor
00240000-562e-429a-2f66-20100e0bf676	00230000-562e-429a-d221-01b3f9fcbbb5	besedilo
00240000-562e-429a-6afe-ce6c9a56f202	00230000-562e-429a-d221-01b3f9fcbbb5	uprizoritev
00240000-562e-429a-aee6-9692e3cc7e41	00230000-562e-429a-d221-01b3f9fcbbb5	funkcija
00240000-562e-429a-4baf-f32c095bb44d	00230000-562e-429a-d221-01b3f9fcbbb5	tipfunkcije
00240000-562e-429a-d5fa-b5194a44c6ba	00230000-562e-429a-d221-01b3f9fcbbb5	alternacija
00240000-562e-429a-833b-79c393a144fc	00230000-562e-429a-ae85-29d9d9b655d9	pogodba
00240000-562e-429a-1bed-d2d1c9eed4ec	00230000-562e-429a-d221-01b3f9fcbbb5	zaposlitev
00240000-562e-429a-0b43-4a40908e0715	00230000-562e-429a-d221-01b3f9fcbbb5	zvrstuprizoritve
00240000-562e-429a-6488-b8e42980fafb	00230000-562e-429a-ae85-29d9d9b655d9	programdela
00240000-562e-429a-6c11-9ace9f88061e	00230000-562e-429a-d221-01b3f9fcbbb5	zapis
\.


--
-- TOC entry 3048 (class 0 OID 23432888)
-- Dependencies: 170
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
e8c0b0d6-0e89-45b4-a4ac-606db57b7fb2	00240000-562e-429a-80fb-d1ddea3bdfe5	0	1001
\.


--
-- TOC entry 3102 (class 0 OID 23433444)
-- Dependencies: 224
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-562e-429d-7659-ceea78880145	000e0000-562e-429d-f361-b4b39ae6a19f	00080000-562e-429d-fc8e-56feff9cd6f2	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-562e-429b-7b5b-b60c68418789
00270000-562e-429d-27c3-78838630cf13	000e0000-562e-429d-f361-b4b39ae6a19f	00080000-562e-429d-fc8e-56feff9cd6f2	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-562e-429b-7b5b-b60c68418789
\.


--
-- TOC entry 3062 (class 0 OID 23433027)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3083 (class 0 OID 23433273)
-- Dependencies: 205
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-562e-429d-cdf8-10162e526641	00180000-562e-429d-fa10-0b0d14a91525	000c0000-562e-429d-fff9-5d4a2720ca89	00090000-562e-429d-87d5-5e31284de100	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562e-429d-2643-1b4156295b13	00180000-562e-429d-fa10-0b0d14a91525	000c0000-562e-429d-2a1a-578cd363d055	00090000-562e-429d-d2ea-87391b3e846f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562e-429d-b9de-917b3cb0dc0c	00180000-562e-429d-fa10-0b0d14a91525	000c0000-562e-429d-0909-6525365bbe1b	00090000-562e-429d-44c0-29942e3aac58	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562e-429d-03bb-dd962822de0e	00180000-562e-429d-fa10-0b0d14a91525	000c0000-562e-429d-37d7-0e8fe726074c	00090000-562e-429d-13f3-51a73502b56f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562e-429d-4d8b-43c20c7ae566	00180000-562e-429d-fa10-0b0d14a91525	000c0000-562e-429d-d107-e651335573e6	00090000-562e-429d-981e-4819d3c12f1b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-562e-429d-680a-8499d466c564	00180000-562e-429d-cc76-1e2fc45d8a4f	\N	00090000-562e-429d-981e-4819d3c12f1b	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-562e-429d-a8db-3cbae86786b0	00180000-562e-429d-cc76-1e2fc45d8a4f	\N	00090000-562e-429d-d2ea-87391b3e846f	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3105 (class 0 OID 23433485)
-- Dependencies: 227
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-562e-429a-b635-3e6c8e443721	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-562e-429a-a77e-ce637abf5c59	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-562e-429a-19b0-1d28a6a0cae8	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-562e-429a-b9c9-020b5dfada87	04	Režija	Režija	Režija	umetnik	30
000f0000-562e-429a-570b-e9e8e37bcc16	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-562e-429a-c5d8-aa8d66efe9d7	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-562e-429a-8bcb-79c39305ad5f	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-562e-429a-6769-07a00d05392f	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-562e-429a-ec03-f38cb85d5e7c	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-562e-429a-4fa7-aa32fc194670	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-562e-429a-d244-b8c777193a9c	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-562e-429a-40de-8770f793361e	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-562e-429a-92a2-052ea9f7b08d	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-562e-429a-5bfe-0d2f2909b533	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-562e-429a-deba-3376f442b7f1	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-562e-429a-7578-f35313e6cd8c	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-562e-429a-e90a-756e989cc77f	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-562e-429a-982d-3f47d03d4811	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3059 (class 0 OID 23432978)
-- Dependencies: 181
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-562e-429d-6ef7-d015825c0d0d	0001	šola	osnovna ali srednja šola
00400000-562e-429d-a90b-a62ead33204b	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-562e-429d-979e-2e40fedeac1b	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3118 (class 0 OID 23433762)
-- Dependencies: 240
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-562e-429a-ccda-248144754fe5	01	Velika predstava	f	1.00	1.00
002b0000-562e-429a-8777-9dea05a10384	02	Mala predstava	f	0.50	0.50
002b0000-562e-429a-0441-3bce27ddc750	03	Mala koprodukcija	t	0.40	1.00
002b0000-562e-429a-88a5-f4ba9debea3e	04	Srednja koprodukcija	t	0.70	2.00
002b0000-562e-429a-3ea1-3c28ff65057b	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3081 (class 0 OID 23433253)
-- Dependencies: 203
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-562e-429a-07af-4c5d8af72475	0001	prva vaja	prva vaja
00420000-562e-429a-4303-9929ff7fe65a	0002	tehnična vaja	tehnična vaja
00420000-562e-429a-22ae-aa6229bf4d41	0003	lučna vaja	lučna vaja
00420000-562e-429a-50d7-63305abfa4f3	0004	kostumska vaja	kostumska vaja
00420000-562e-429a-73e1-1a74b8276ed4	0005	foto vaja	foto vaja
00420000-562e-429a-855b-7e71a131364c	0006	1. glavna vaja	1. glavna vaja
00420000-562e-429a-67bd-4aa3473b2d6d	0007	2. glavna vaja	2. glavna vaja
00420000-562e-429a-ca3a-c89efb17f5a6	0008	1. generalka	1. generalka
00420000-562e-429a-ab6c-f3d45ebc35c9	0009	2. generalka	2. generalka
00420000-562e-429a-cfcf-21c64bf2fac1	0010	odprta generalka	odprta generalka
00420000-562e-429a-f456-6962e55ac79b	0011	obnovitvena vaja	obnovitvena vaja
00420000-562e-429a-b308-636d40aabd36	0012	pevska vaja	pevska vaja
00420000-562e-429a-7a6f-68d71ed68d63	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-562e-429a-74d6-f8f52f75bde4	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3068 (class 0 OID 23433100)
-- Dependencies: 190
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 23432923)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-562e-429b-9605-55b518b19e71	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROURIgNgIr2isyrXA/wQhk.qkp4anrSA6	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-562e-429d-5c00-5f43b4b5f243	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-562e-429d-a696-c677e7b29e79	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-562e-429d-a6cd-905daed25465	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-562e-429d-0da8-aecaa3ad5709	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-562e-429d-0acf-13e3e1f84782	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-562e-429d-cb5a-14c4ccec793c	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-562e-429d-8054-8051ce079955	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-562e-429d-73ab-7248cd0fcdf6	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-562e-429d-38f4-0d8416067927	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-562e-429d-a823-85497a412a9a	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-562e-429b-b770-4c6de51633ef	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3109 (class 0 OID 23433535)
-- Dependencies: 231
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-562e-429d-61a0-e532a4075a08	00160000-562e-429d-48f3-537ee5fddf18	\N	00140000-562e-429a-b791-dd8c699e0697	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-562e-429d-18bc-d602525f4aee
000e0000-562e-429d-f361-b4b39ae6a19f	00160000-562e-429d-30b4-79847347e8ba	\N	00140000-562e-429a-81a8-909da5475183	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-562e-429d-6503-dffc19ee135d
000e0000-562e-429d-1ad9-9192a1fd49ed	\N	\N	00140000-562e-429a-81a8-909da5475183	00190000-562e-429d-f101-31afa350dcdb	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-562e-429d-18bc-d602525f4aee
000e0000-562e-429d-c89b-f0cb866cf2e8	\N	\N	00140000-562e-429a-81a8-909da5475183	00190000-562e-429d-f101-31afa350dcdb	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-562e-429d-18bc-d602525f4aee
000e0000-562e-429d-0ec4-7062932108e4	\N	\N	00140000-562e-429a-81a8-909da5475183	00190000-562e-429d-f101-31afa350dcdb	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-562e-429d-9da3-5c49d7869c6e
000e0000-562e-429d-1c3a-b94f15a978b0	\N	\N	00140000-562e-429a-81a8-909da5475183	00190000-562e-429d-f101-31afa350dcdb	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-562e-429d-9da3-5c49d7869c6e
\.


--
-- TOC entry 3076 (class 0 OID 23433199)
-- Dependencies: 198
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-562e-429d-11da-42a65cb93db2	\N	000e0000-562e-429d-f361-b4b39ae6a19f	1	
00200000-562e-429d-f366-96d4861256d8	\N	000e0000-562e-429d-f361-b4b39ae6a19f	2	
00200000-562e-429d-013b-38666d9bdc03	\N	000e0000-562e-429d-f361-b4b39ae6a19f	3	
00200000-562e-429d-e39f-d5f08f1aaf01	\N	000e0000-562e-429d-f361-b4b39ae6a19f	4	
00200000-562e-429d-23ba-be1fa791fd26	\N	000e0000-562e-429d-f361-b4b39ae6a19f	5	
\.


--
-- TOC entry 3092 (class 0 OID 23433344)
-- Dependencies: 214
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 23433458)
-- Dependencies: 225
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-562e-429b-3972-a55dc501b16e	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-562e-429b-5955-bce1c5fac87e	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-562e-429b-d33a-0c7e11beb519	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-562e-429b-b702-ffc5c04f3fd1	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-562e-429b-66af-225a2d0c4cca	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-562e-429b-8153-5aa2f1c097d6	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-562e-429b-8385-669d629f77d6	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-562e-429b-db03-9761a931205b	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-562e-429b-7b5b-b60c68418789	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-562e-429b-8212-21166022ab72	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-562e-429b-68f3-ab057c4146e3	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-562e-429b-98c8-ffc03cc43b5d	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-562e-429b-8152-e7d737552d52	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-562e-429b-1c48-b827df0f767c	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-562e-429b-56aa-b7a321208e49	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-562e-429b-5abc-a79cd80d65da	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-562e-429b-c5b2-dd17dec5e412	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-562e-429b-2f13-7aafb7fc3ca5	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-562e-429b-a890-e24d2762405d	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-562e-429b-d779-03603365ea49	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-562e-429b-659a-36b23d97855e	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-562e-429b-2e9c-94cb88f4881a	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-562e-429b-ba40-20ac2e85b881	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-562e-429b-bf7b-87cbe814bc2a	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-562e-429b-b4fa-732482cbe108	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-562e-429b-66a0-d217954d477a	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-562e-429b-aef1-c89289a7a874	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-562e-429b-210a-65ee433b9f63	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3121 (class 0 OID 23433809)
-- Dependencies: 243
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 23433781)
-- Dependencies: 242
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3122 (class 0 OID 23433821)
-- Dependencies: 244
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 23433416)
-- Dependencies: 221
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-562e-429d-3c27-4425b86338dd	00090000-562e-429d-d2ea-87391b3e846f	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562e-429d-0cc5-3bb40ed9db31	00090000-562e-429d-44c0-29942e3aac58	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562e-429d-17ff-79a00ecdbf98	00090000-562e-429d-9682-376dec1dfa22	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562e-429d-56f4-2c87248a4faf	00090000-562e-429d-9edd-0e4d1302a2fb	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562e-429d-da1b-84d0572f91c6	00090000-562e-429d-0f7d-7858a02bfd7d	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-562e-429d-9b5f-448135b18d5e	00090000-562e-429d-a49f-4c58844bd3c2	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3079 (class 0 OID 23433242)
-- Dependencies: 201
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 23433525)
-- Dependencies: 230
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-562e-429a-b791-dd8c699e0697	01	Drama	drama (SURS 01)
00140000-562e-429a-63bb-4533a14ebc57	02	Opera	opera (SURS 02)
00140000-562e-429a-5591-c2811061de4f	03	Balet	balet (SURS 03)
00140000-562e-429a-67cd-3cbab803cf04	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-562e-429a-5cee-a78837aa5524	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-562e-429a-81a8-909da5475183	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-562e-429a-1ffe-6963060fab2f	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3098 (class 0 OID 23433406)
-- Dependencies: 220
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2548 (class 2606 OID 23432977)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 23433584)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 23433574)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 23433441)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 23433483)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 23433861)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 23433231)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 23433252)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 23433779)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 23433126)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 23433652)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 23433402)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 23433197)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 23433164)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 23433140)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 23433309)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 23433838)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2819 (class 2606 OID 23433845)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2826 (class 2606 OID 23433869)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 23433336)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 23433098)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 23432996)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 23433060)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 23433023)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 23432966)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2539 (class 2606 OID 23432951)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 23433342)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 23433378)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 23433520)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 23433051)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 23433086)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 23433731)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 23433315)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 23433076)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 23433216)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 23433185)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2615 (class 2606 OID 23433177)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 23433327)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 23433740)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2787 (class 2606 OID 23433748)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 23433718)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 23433760)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 23433360)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 23433300)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 23433291)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 23433507)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 23433434)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 23433152)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 23432922)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 23433369)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 23432940)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2541 (class 2606 OID 23432960)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 23433387)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 23433322)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 23433271)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 23432910)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 23432898)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 23432892)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 23433454)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 23433032)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 23433282)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 23433494)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 23432985)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 23433772)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 23433260)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 23433111)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 23432935)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 23433553)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 23433206)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 23433350)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 23433466)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 23433819)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 23433803)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 23433827)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 23433424)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 23433246)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 23433533)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 23433414)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 1259 OID 23433240)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2632 (class 1259 OID 23433241)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2633 (class 1259 OID 23433239)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2634 (class 1259 OID 23433238)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2635 (class 1259 OID 23433237)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2726 (class 1259 OID 23433455)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2727 (class 1259 OID 23433456)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2728 (class 1259 OID 23433457)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2812 (class 1259 OID 23433840)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2813 (class 1259 OID 23433839)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2566 (class 1259 OID 23433053)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2567 (class 1259 OID 23433054)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2684 (class 1259 OID 23433343)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2799 (class 1259 OID 23433807)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2800 (class 1259 OID 23433806)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2801 (class 1259 OID 23433808)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2802 (class 1259 OID 23433805)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2803 (class 1259 OID 23433804)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2678 (class 1259 OID 23433329)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2679 (class 1259 OID 23433328)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2623 (class 1259 OID 23433207)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2624 (class 1259 OID 23433208)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2708 (class 1259 OID 23433403)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2709 (class 1259 OID 23433405)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2710 (class 1259 OID 23433404)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2598 (class 1259 OID 23433142)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2599 (class 1259 OID 23433141)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2790 (class 1259 OID 23433761)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2742 (class 1259 OID 23433522)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2743 (class 1259 OID 23433523)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2744 (class 1259 OID 23433524)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2809 (class 1259 OID 23433828)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2751 (class 1259 OID 23433558)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2752 (class 1259 OID 23433555)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2753 (class 1259 OID 23433559)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2754 (class 1259 OID 23433557)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2755 (class 1259 OID 23433556)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2588 (class 1259 OID 23433113)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2589 (class 1259 OID 23433112)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2557 (class 1259 OID 23433026)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2696 (class 1259 OID 23433370)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2543 (class 1259 OID 23432967)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2544 (class 1259 OID 23432968)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2701 (class 1259 OID 23433390)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2702 (class 1259 OID 23433389)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2703 (class 1259 OID 23433388)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2571 (class 1259 OID 23433063)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2572 (class 1259 OID 23433062)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2573 (class 1259 OID 23433064)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2611 (class 1259 OID 23433180)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2612 (class 1259 OID 23433178)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2613 (class 1259 OID 23433179)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2523 (class 1259 OID 23432900)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2658 (class 1259 OID 23433295)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2659 (class 1259 OID 23433293)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2660 (class 1259 OID 23433292)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2661 (class 1259 OID 23433294)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2534 (class 1259 OID 23432941)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2535 (class 1259 OID 23432942)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2687 (class 1259 OID 23433351)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2822 (class 1259 OID 23433862)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2724 (class 1259 OID 23433443)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2725 (class 1259 OID 23433442)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2823 (class 1259 OID 23433870)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2824 (class 1259 OID 23433871)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2673 (class 1259 OID 23433316)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2718 (class 1259 OID 23433435)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2719 (class 1259 OID 23433436)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2772 (class 1259 OID 23433657)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2773 (class 1259 OID 23433656)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2774 (class 1259 OID 23433653)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2775 (class 1259 OID 23433654)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2776 (class 1259 OID 23433655)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2577 (class 1259 OID 23433078)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2578 (class 1259 OID 23433077)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2579 (class 1259 OID 23433079)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2690 (class 1259 OID 23433364)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2691 (class 1259 OID 23433363)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2782 (class 1259 OID 23433741)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2783 (class 1259 OID 23433742)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2765 (class 1259 OID 23433588)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2766 (class 1259 OID 23433589)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2767 (class 1259 OID 23433586)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2768 (class 1259 OID 23433587)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2714 (class 1259 OID 23433425)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2715 (class 1259 OID 23433426)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2664 (class 1259 OID 23433304)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2665 (class 1259 OID 23433303)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2666 (class 1259 OID 23433301)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2667 (class 1259 OID 23433302)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2761 (class 1259 OID 23433576)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2762 (class 1259 OID 23433575)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2602 (class 1259 OID 23433153)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2605 (class 1259 OID 23433167)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2606 (class 1259 OID 23433166)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2607 (class 1259 OID 23433165)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2608 (class 1259 OID 23433168)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2622 (class 1259 OID 23433198)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2616 (class 1259 OID 23433186)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2617 (class 1259 OID 23433187)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2779 (class 1259 OID 23433732)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2798 (class 1259 OID 23433780)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2816 (class 1259 OID 23433846)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2817 (class 1259 OID 23433847)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2553 (class 1259 OID 23432998)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2554 (class 1259 OID 23432997)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2562 (class 1259 OID 23433033)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2563 (class 1259 OID 23433034)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2641 (class 1259 OID 23433247)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2653 (class 1259 OID 23433285)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2654 (class 1259 OID 23433284)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2655 (class 1259 OID 23433283)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2636 (class 1259 OID 23433233)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2637 (class 1259 OID 23433234)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2638 (class 1259 OID 23433232)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2639 (class 1259 OID 23433236)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2640 (class 1259 OID 23433235)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2570 (class 1259 OID 23433052)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2551 (class 1259 OID 23432986)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2552 (class 1259 OID 23432987)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2594 (class 1259 OID 23433127)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2595 (class 1259 OID 23433129)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2596 (class 1259 OID 23433128)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2597 (class 1259 OID 23433130)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2672 (class 1259 OID 23433310)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2747 (class 1259 OID 23433521)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2756 (class 1259 OID 23433554)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2738 (class 1259 OID 23433495)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2739 (class 1259 OID 23433496)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2560 (class 1259 OID 23433024)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2561 (class 1259 OID 23433025)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2711 (class 1259 OID 23433415)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2529 (class 1259 OID 23432911)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2587 (class 1259 OID 23433099)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2576 (class 1259 OID 23433061)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2526 (class 1259 OID 23432899)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2795 (class 1259 OID 23433773)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 23433362)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2695 (class 1259 OID 23433361)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 23433261)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 23433262)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2769 (class 1259 OID 23433585)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2584 (class 1259 OID 23433087)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2748 (class 1259 OID 23433534)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2806 (class 1259 OID 23433820)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2788 (class 1259 OID 23433749)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2789 (class 1259 OID 23433750)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2735 (class 1259 OID 23433484)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2652 (class 1259 OID 23433272)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2542 (class 1259 OID 23432961)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2865 (class 2606 OID 23434042)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2864 (class 2606 OID 23434047)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2860 (class 2606 OID 23434067)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2866 (class 2606 OID 23434037)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2862 (class 2606 OID 23434057)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2861 (class 2606 OID 23434062)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2863 (class 2606 OID 23434052)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2902 (class 2606 OID 23434237)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2901 (class 2606 OID 23434242)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2900 (class 2606 OID 23434247)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2934 (class 2606 OID 23434412)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2935 (class 2606 OID 23434407)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2839 (class 2606 OID 23433927)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2838 (class 2606 OID 23433932)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2883 (class 2606 OID 23434152)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2929 (class 2606 OID 23434392)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2930 (class 2606 OID 23434387)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2928 (class 2606 OID 23434397)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2931 (class 2606 OID 23434382)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2932 (class 2606 OID 23434377)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2881 (class 2606 OID 23434147)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2882 (class 2606 OID 23434142)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2859 (class 2606 OID 23434027)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2858 (class 2606 OID 23434032)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2893 (class 2606 OID 23434192)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2891 (class 2606 OID 23434202)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2892 (class 2606 OID 23434197)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2848 (class 2606 OID 23433982)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2849 (class 2606 OID 23433977)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2879 (class 2606 OID 23434132)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2926 (class 2606 OID 23434367)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2905 (class 2606 OID 23434252)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2904 (class 2606 OID 23434257)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2903 (class 2606 OID 23434262)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2933 (class 2606 OID 23434402)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2907 (class 2606 OID 23434282)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2910 (class 2606 OID 23434267)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2906 (class 2606 OID 23434287)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2908 (class 2606 OID 23434277)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2909 (class 2606 OID 23434272)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2846 (class 2606 OID 23433972)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2847 (class 2606 OID 23433967)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2834 (class 2606 OID 23433912)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2835 (class 2606 OID 23433907)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2887 (class 2606 OID 23434172)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2831 (class 2606 OID 23433887)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2830 (class 2606 OID 23433892)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2888 (class 2606 OID 23434187)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2889 (class 2606 OID 23434182)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2890 (class 2606 OID 23434177)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2841 (class 2606 OID 23433942)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2842 (class 2606 OID 23433937)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2840 (class 2606 OID 23433947)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2852 (class 2606 OID 23434007)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2854 (class 2606 OID 23433997)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2853 (class 2606 OID 23434002)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2827 (class 2606 OID 23433872)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2871 (class 2606 OID 23434107)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2873 (class 2606 OID 23434097)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2874 (class 2606 OID 23434092)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2872 (class 2606 OID 23434102)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2829 (class 2606 OID 23433877)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2828 (class 2606 OID 23433882)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2884 (class 2606 OID 23434157)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2938 (class 2606 OID 23434427)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2898 (class 2606 OID 23434232)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 23434227)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2940 (class 2606 OID 23434432)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2939 (class 2606 OID 23434437)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2880 (class 2606 OID 23434137)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2897 (class 2606 OID 23434217)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2896 (class 2606 OID 23434222)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2917 (class 2606 OID 23434342)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2918 (class 2606 OID 23434337)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2921 (class 2606 OID 23434322)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2920 (class 2606 OID 23434327)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2919 (class 2606 OID 23434332)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2844 (class 2606 OID 23433957)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2845 (class 2606 OID 23433952)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2843 (class 2606 OID 23433962)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2885 (class 2606 OID 23434167)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2886 (class 2606 OID 23434162)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 23434352)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2923 (class 2606 OID 23434357)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2914 (class 2606 OID 23434312)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 23434317)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2916 (class 2606 OID 23434302)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2915 (class 2606 OID 23434307)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2895 (class 2606 OID 23434207)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2894 (class 2606 OID 23434212)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2875 (class 2606 OID 23434127)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2876 (class 2606 OID 23434122)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2878 (class 2606 OID 23434112)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2877 (class 2606 OID 23434117)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2911 (class 2606 OID 23434297)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2912 (class 2606 OID 23434292)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2850 (class 2606 OID 23433987)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2851 (class 2606 OID 23433992)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2857 (class 2606 OID 23434022)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2856 (class 2606 OID 23434012)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2855 (class 2606 OID 23434017)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2922 (class 2606 OID 23434347)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2925 (class 2606 OID 23434362)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2927 (class 2606 OID 23434372)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2937 (class 2606 OID 23434417)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2936 (class 2606 OID 23434422)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2832 (class 2606 OID 23433902)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2833 (class 2606 OID 23433897)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2837 (class 2606 OID 23433917)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2836 (class 2606 OID 23433922)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2867 (class 2606 OID 23434072)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2868 (class 2606 OID 23434087)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2869 (class 2606 OID 23434082)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2870 (class 2606 OID 23434077)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-26 16:11:28 CET

--
-- PostgreSQL database dump complete
--

