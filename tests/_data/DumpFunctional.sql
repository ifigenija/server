--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-27 22:40:18 CEST

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
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 245
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 20787577)
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
-- TOC entry 229 (class 1259 OID 20788134)
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
-- TOC entry 228 (class 1259 OID 20788117)
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
-- TOC entry 219 (class 1259 OID 20787994)
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
-- TOC entry 222 (class 1259 OID 20788024)
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
-- TOC entry 243 (class 1259 OID 20788374)
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
-- TOC entry 197 (class 1259 OID 20787784)
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
-- TOC entry 199 (class 1259 OID 20787816)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 20788300)
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
-- TOC entry 190 (class 1259 OID 20787698)
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
-- TOC entry 230 (class 1259 OID 20788147)
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
-- TOC entry 215 (class 1259 OID 20787949)
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
-- TOC entry 195 (class 1259 OID 20787763)
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
-- TOC entry 193 (class 1259 OID 20787738)
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
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 191 (class 1259 OID 20787715)
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
-- TOC entry 204 (class 1259 OID 20787863)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 20788355)
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
-- TOC entry 242 (class 1259 OID 20788367)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 20788389)
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
-- TOC entry 170 (class 1259 OID 20579799)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 20787888)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 20787672)
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
-- TOC entry 182 (class 1259 OID 20787586)
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
-- TOC entry 183 (class 1259 OID 20787597)
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
-- TOC entry 178 (class 1259 OID 20787551)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 20787570)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 20787895)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 20787929)
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
-- TOC entry 225 (class 1259 OID 20788065)
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
-- TOC entry 185 (class 1259 OID 20787630)
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
-- TOC entry 187 (class 1259 OID 20787664)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 20788245)
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
-- TOC entry 205 (class 1259 OID 20787869)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 20787649)
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
-- TOC entry 194 (class 1259 OID 20787753)
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
-- TOC entry 207 (class 1259 OID 20787881)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 20788259)
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
-- TOC entry 234 (class 1259 OID 20788269)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 20788202)
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
-- TOC entry 235 (class 1259 OID 20788277)
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
-- TOC entry 211 (class 1259 OID 20787910)
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
-- TOC entry 203 (class 1259 OID 20787854)
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
-- TOC entry 202 (class 1259 OID 20787844)
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
-- TOC entry 224 (class 1259 OID 20788054)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 20787984)
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
-- TOC entry 192 (class 1259 OID 20787727)
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
-- TOC entry 175 (class 1259 OID 20787522)
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
-- TOC entry 174 (class 1259 OID 20787520)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 212 (class 1259 OID 20787923)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 20787560)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 20787544)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 20787937)
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
-- TOC entry 206 (class 1259 OID 20787875)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 20787821)
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
-- TOC entry 173 (class 1259 OID 20787509)
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
-- TOC entry 172 (class 1259 OID 20787501)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 20787496)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 20788001)
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
-- TOC entry 184 (class 1259 OID 20787622)
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
-- TOC entry 201 (class 1259 OID 20787831)
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
-- TOC entry 223 (class 1259 OID 20788042)
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
-- TOC entry 236 (class 1259 OID 20788288)
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
-- TOC entry 189 (class 1259 OID 20787684)
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
-- TOC entry 176 (class 1259 OID 20787531)
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
-- TOC entry 227 (class 1259 OID 20788092)
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
-- TOC entry 196 (class 1259 OID 20787774)
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
-- TOC entry 210 (class 1259 OID 20787902)
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
-- TOC entry 221 (class 1259 OID 20788015)
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
-- TOC entry 239 (class 1259 OID 20788335)
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
-- TOC entry 238 (class 1259 OID 20788307)
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
-- TOC entry 240 (class 1259 OID 20788347)
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
-- TOC entry 217 (class 1259 OID 20787974)
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
-- TOC entry 198 (class 1259 OID 20787810)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 20788082)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 20787964)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 20787525)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2975 (class 0 OID 20787577)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 20788134)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5608-542f-c438-04347827b150	000d0000-5608-542f-9fde-fd634f83118f	\N	00090000-5608-542f-7670-d378176c0c85	000b0000-5608-542f-0b97-a7d477ba33f1	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5608-542f-cbcb-803ab563c128	000d0000-5608-542f-da64-8dc3fded1e18	00100000-5608-542f-6d39-39b98daa54c8	00090000-5608-542f-71d7-344c7048c411	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5608-542f-adf2-c8d2f2cc54fd	000d0000-5608-542f-d2ab-d00263a03a29	00100000-5608-542f-0b8f-683be6760c0a	00090000-5608-542f-10b9-440a1bf8cf15	\N	0003	t	\N	2015-09-27	\N	2	t	\N	f	f
000c0000-5608-542f-5220-5920468968ff	000d0000-5608-542f-7511-18456a03b82c	\N	00090000-5608-542f-0339-7cced74b5b6c	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5608-542f-6c15-d71c944f8776	000d0000-5608-542f-e9e7-68e2d615ff95	\N	00090000-5608-542f-5c09-95f7e3558c91	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5608-542f-cd98-38bbbd37e928	000d0000-5608-542f-2746-e004086f37bf	\N	00090000-5608-542f-3185-9f2993aa3ae2	000b0000-5608-542f-2c41-429014765c70	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5608-542f-0507-e51806d395e1	000d0000-5608-542f-32c0-2bfc753e7852	00100000-5608-542f-5f78-8f055c0f5c89	00090000-5608-542f-50b9-8368043fb62d	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5608-542f-8e7d-840702fb75bb	000d0000-5608-542f-745d-e1148008e669	\N	00090000-5608-542f-7e10-6b29a07e44ca	000b0000-5608-542f-da2f-3b58d216ccdd	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5608-542f-9cdf-044581f179a3	000d0000-5608-542f-32c0-2bfc753e7852	00100000-5608-542f-89df-9ef3400c7a05	00090000-5608-542f-8274-28143f14f584	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5608-542f-9710-74e06d763f98	000d0000-5608-542f-32c0-2bfc753e7852	00100000-5608-542f-c5a7-82fe2c5d8e5f	00090000-5608-542f-a954-73aa4e333d93	\N	0010	t	\N	2015-09-27	\N	16	f	\N	f	t
000c0000-5608-542f-46d1-dc9f0297522d	000d0000-5608-542f-32c0-2bfc753e7852	00100000-5608-542f-6d66-692406f6d195	00090000-5608-542f-c546-e06396e48c59	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5608-542f-6a7b-d871392d31e2	000d0000-5608-542f-2c7d-d18fc39737b2	\N	00090000-5608-542f-71d7-344c7048c411	000b0000-5608-542f-d3ae-9a87cddb247a	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3022 (class 0 OID 20788117)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 20787994)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5608-542f-ae20-b46b0bf90150	00160000-5608-542f-bd64-883258e4d80b	00090000-5608-542f-33d1-36b7434b9690	aizv	10	t
003d0000-5608-542f-7784-b7276db9ca21	00160000-5608-542f-bd64-883258e4d80b	00090000-5608-542f-2294-821bfc983949	apri	14	t
003d0000-5608-542f-f7cb-45cc4dd67b8c	00160000-5608-542f-11cc-44613e4df79d	00090000-5608-542f-2b90-9bcaa88c6742	aizv	11	t
003d0000-5608-542f-e99b-ad828b4e63b9	00160000-5608-542f-eb8c-1b98fbd60c9a	00090000-5608-542f-1b8a-6f4c984ca824	aizv	12	t
003d0000-5608-542f-9563-11d6f17b18b3	00160000-5608-542f-bd64-883258e4d80b	00090000-5608-542f-686e-4d93fc65f8a6	apri	18	f
\.


--
-- TOC entry 3016 (class 0 OID 20788024)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5608-542f-bd64-883258e4d80b	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	\N
00160000-5608-542f-11cc-44613e4df79d	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	\N
00160000-5608-542f-eb8c-1b98fbd60c9a	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	\N
\.


--
-- TOC entry 3037 (class 0 OID 20788374)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 20787784)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5608-542f-7fd2-6dc8c3a3d688	\N	\N	00200000-5608-542f-0a8c-1a53906a755b	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5608-542f-3a48-b0c539c564aa	\N	\N	00200000-5608-542f-f167-cde6923175ef	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5608-542f-6f38-677bf5b64b77	\N	\N	00200000-5608-542f-2e5e-fae7c1958445	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5608-542f-9373-aa6b8a38b581	\N	\N	00200000-5608-542f-0d94-0ae09876b0c1	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5608-542f-c9c7-5ddaf19a0738	\N	\N	00200000-5608-542f-9d38-2c7ac8106460	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2993 (class 0 OID 20787816)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 20788300)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 20787698)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5608-542d-d965-3e547abf1a36	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5608-542d-39af-c065a4603ec3	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5608-542d-a0ba-f4313396e6dd	AL	ALB	008	Albania 	Albanija	\N
00040000-5608-542d-b785-5359f2e7f4eb	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5608-542d-da19-0e64170faf04	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5608-542d-62f8-4c19f631b2d5	AD	AND	020	Andorra 	Andora	\N
00040000-5608-542d-5401-994ee09a6ecc	AO	AGO	024	Angola 	Angola	\N
00040000-5608-542d-2dbb-15de19fa58ca	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5608-542d-eee4-da0e7f0a449f	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5608-542d-1d92-2874adcf9dfe	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5608-542d-8024-f10ed661cf11	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5608-542d-bcd2-f2576a09f39f	AM	ARM	051	Armenia 	Armenija	\N
00040000-5608-542d-db86-a86b88439078	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5608-542d-ac5a-1070a93418d4	AU	AUS	036	Australia 	Avstralija	\N
00040000-5608-542d-e3d5-89af14a3e7b0	AT	AUT	040	Austria 	Avstrija	\N
00040000-5608-542d-922c-86f250f32986	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5608-542d-390d-26826144e254	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5608-542d-f87b-d0395580b886	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5608-542d-8795-5d135790c9fa	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5608-542d-bb9c-2f67974369a3	BB	BRB	052	Barbados 	Barbados	\N
00040000-5608-542d-f4a1-25259899bc4b	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5608-542d-43d1-e81d29dd3839	BE	BEL	056	Belgium 	Belgija	\N
00040000-5608-542d-cece-37a14aceb4aa	BZ	BLZ	084	Belize 	Belize	\N
00040000-5608-542d-0abc-93719eb864d3	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5608-542d-3c55-87833e4194e1	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5608-542d-05ce-7696439d518f	BT	BTN	064	Bhutan 	Butan	\N
00040000-5608-542d-b746-48871c5dd927	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5608-542d-5995-fa14093a88dd	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5608-542d-5561-19464df7e608	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5608-542d-32bd-2c4626d409f3	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5608-542d-7c38-e88019589045	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5608-542d-6913-f1bbea331ed9	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5608-542d-e6eb-112577b9a71c	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5608-542d-4315-052ba9e6f609	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5608-542d-abdc-156975710d16	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5608-542d-6447-c2253d63e624	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5608-542d-0195-9efe0dc339ae	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5608-542d-e73a-ce5e68ec0234	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5608-542d-1f52-54f55dbaabb7	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5608-542d-8c31-05b715f8dff8	CA	CAN	124	Canada 	Kanada	\N
00040000-5608-542d-5b95-84368b851f33	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5608-542d-7daf-b3ff32f5ad59	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5608-542d-867f-0265253e797d	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5608-542d-5243-695091ddc888	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5608-542d-77cd-5209d1795b1d	CL	CHL	152	Chile 	Čile	\N
00040000-5608-542d-84bb-54a0ab990690	CN	CHN	156	China 	Kitajska	\N
00040000-5608-542d-273e-9024f3b867dc	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5608-542d-3213-a9f042463553	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5608-542d-5c4b-9c5f85746efc	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5608-542d-cf9f-b6e097c276ca	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5608-542d-e889-88e2d0c4d311	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5608-542d-1f95-175aded53725	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5608-542d-1051-b9a93de66cb4	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5608-542d-e73a-a61d386dad20	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5608-542d-d136-9d56a59da22c	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5608-542d-a2b4-0f065324270a	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5608-542d-cdcd-e8dd350bce50	CU	CUB	192	Cuba 	Kuba	\N
00040000-5608-542d-0904-1beb8fce4f04	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5608-542d-4e35-731d7ef46194	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5608-542d-bc05-ce13c83e2871	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5608-542d-a3b1-6978f9635b8f	DK	DNK	208	Denmark 	Danska	\N
00040000-5608-542d-31fb-cf86d2d49ad5	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5608-542d-b244-81b584234f4b	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5608-542d-4f81-a1e0dbf076d2	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5608-542d-fb3b-64f33b81f497	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5608-542d-a6c1-d6832c20cbe7	EG	EGY	818	Egypt 	Egipt	\N
00040000-5608-542d-5def-ef14b0cdd4a0	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5608-542d-e5c8-3a0b15975ff4	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5608-542d-874e-e36e49678338	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5608-542d-3b93-1d951b64ae31	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5608-542d-6528-655e3cbf09b5	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5608-542d-f5f7-12e0da92d90c	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5608-542d-6e6d-47e60ee86963	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5608-542d-7afd-fbecc2c8fb06	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5608-542d-4f03-964d06d73dd1	FI	FIN	246	Finland 	Finska	\N
00040000-5608-542d-01d9-7e900f61de21	FR	FRA	250	France 	Francija	\N
00040000-5608-542d-47bb-3702571ccbe2	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5608-542d-9f12-3ef114c238e1	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5608-542d-8dda-0e863dff68d3	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5608-542d-a95f-4a72eb6ff6df	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5608-542d-8e3a-30f7f789ce12	GA	GAB	266	Gabon 	Gabon	\N
00040000-5608-542d-6c7d-175332d23127	GM	GMB	270	Gambia 	Gambija	\N
00040000-5608-542d-e0af-b8a97c22487d	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5608-542d-5ed5-3b7382f502c9	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5608-542d-0f8d-8ad3f9270812	GH	GHA	288	Ghana 	Gana	\N
00040000-5608-542d-3fb2-ef692b8aae51	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5608-542d-3864-780c55fec2b2	GR	GRC	300	Greece 	Grčija	\N
00040000-5608-542d-2480-69bd72dfd093	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5608-542d-cea1-b8d0c66691e2	GD	GRD	308	Grenada 	Grenada	\N
00040000-5608-542d-b172-df51989f1291	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5608-542d-d301-ae40297832bd	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5608-542d-bdbc-ce92fd0c69fc	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5608-542d-709c-15ab338f9366	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5608-542d-7a38-1a5957e7b5ed	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5608-542d-aeb8-12972550d321	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5608-542d-2478-cc5349ccfc95	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5608-542d-3cc5-a118bfbddf06	HT	HTI	332	Haiti 	Haiti	\N
00040000-5608-542d-5bee-9d3238789f09	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5608-542d-aef5-32962d438953	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5608-542d-0edc-d01787a40d8e	HN	HND	340	Honduras 	Honduras	\N
00040000-5608-542d-d1fe-5d0c06393592	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5608-542d-cbff-337ac1347a71	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5608-542d-a594-116c258b9658	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5608-542d-fe3a-6a8e030dc448	IN	IND	356	India 	Indija	\N
00040000-5608-542d-bce6-57d2e9551bdb	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5608-542d-39d7-866db0121743	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5608-542d-1aa4-5830349d5771	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5608-542d-df20-8893a9374c81	IE	IRL	372	Ireland 	Irska	\N
00040000-5608-542d-bf4c-ab7c35835973	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5608-542d-7de1-7449740d6d9e	IL	ISR	376	Israel 	Izrael	\N
00040000-5608-542d-b7e5-893adb5a823f	IT	ITA	380	Italy 	Italija	\N
00040000-5608-542d-cd94-78179079e28f	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5608-542d-ff62-012440ff4c94	JP	JPN	392	Japan 	Japonska	\N
00040000-5608-542d-cc1c-840e153c167c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5608-542d-49ed-f43b931fd8c5	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5608-542d-ff6a-d47a45358c2d	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5608-542d-5bb5-2de0c18917b4	KE	KEN	404	Kenya 	Kenija	\N
00040000-5608-542d-5f27-1eaddb40cb76	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5608-542d-6e31-e933ea043069	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5608-542d-3b99-5cbcf18ac687	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5608-542d-9a16-749b47c4d407	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5608-542d-cc5d-e5ebedc531a9	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5608-542d-5b61-213fcfb6a28f	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5608-542d-f042-b68c55335163	LV	LVA	428	Latvia 	Latvija	\N
00040000-5608-542d-f21f-876fbae5f399	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5608-542d-4500-694eb23c5d40	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5608-542d-6384-ab55489ef828	LR	LBR	430	Liberia 	Liberija	\N
00040000-5608-542d-09a3-49a678465001	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5608-542d-c014-3020951b669c	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5608-542d-82a5-0955b48eca37	LT	LTU	440	Lithuania 	Litva	\N
00040000-5608-542d-8076-22bc97f0ab92	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5608-542d-b592-35e631d9529f	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5608-542d-4348-fa95bc8bb092	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5608-542d-e00f-7f0ed7b6d69b	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5608-542d-158e-103d24654ef4	MW	MWI	454	Malawi 	Malavi	\N
00040000-5608-542d-4cb7-a7306fa4c0d7	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5608-542d-7266-7c4d58d844f2	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5608-542d-cfbc-58bef8bea00f	ML	MLI	466	Mali 	Mali	\N
00040000-5608-542d-fc52-aa982bb44127	MT	MLT	470	Malta 	Malta	\N
00040000-5608-542d-128a-4317e1917b24	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5608-542d-1adf-5b77fd2ce565	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5608-542d-1382-531167afb618	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5608-542d-3b3e-bd1821e084e7	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5608-542d-b1d2-9ef905b2a964	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5608-542d-f4ae-6c527230642a	MX	MEX	484	Mexico 	Mehika	\N
00040000-5608-542d-1f50-5d3a2d67c320	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5608-542d-20ed-01216f213854	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5608-542d-271b-ff151f74f2d2	MC	MCO	492	Monaco 	Monako	\N
00040000-5608-542d-bc7b-0a8f85d51281	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5608-542d-b1d5-b850ff5d603b	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5608-542d-a2c8-6e09bec2cb1c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5608-542d-10ac-f63912806e91	MA	MAR	504	Morocco 	Maroko	\N
00040000-5608-542d-1a57-7e9df4fff2b7	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5608-542d-9845-375e3d72be3c	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5608-542d-df95-0c55c5cde2a2	NA	NAM	516	Namibia 	Namibija	\N
00040000-5608-542d-090d-1261ce4fe02c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5608-542d-d0a4-d2f875724137	NP	NPL	524	Nepal 	Nepal	\N
00040000-5608-542d-e693-86a41bdae84f	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5608-542d-25a2-dab371f1f662	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5608-542d-ff10-b65dcd0631b6	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5608-542d-de08-311bfa6059f1	NE	NER	562	Niger 	Niger 	\N
00040000-5608-542d-6509-0b09249d5dad	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5608-542d-9a1b-93307d908ccd	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5608-542d-cc83-e3b970b6a957	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5608-542d-15d8-3ddfad6116d0	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5608-542d-bce6-42f838622721	NO	NOR	578	Norway 	Norveška	\N
00040000-5608-542d-bf89-612cd62c6ddf	OM	OMN	512	Oman 	Oman	\N
00040000-5608-542d-ebfe-57f38246418c	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5608-542d-c365-523bcef0bc33	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5608-542d-d332-cd4460c921c0	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5608-542d-c62e-5c5d0ef146e3	PA	PAN	591	Panama 	Panama	\N
00040000-5608-542d-5812-79d3b25313a3	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5608-542d-643b-356eee2ef98f	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5608-542d-710f-4348a0cbd02c	PE	PER	604	Peru 	Peru	\N
00040000-5608-542d-07c4-e7c70ff1ae11	PH	PHL	608	Philippines 	Filipini	\N
00040000-5608-542d-959f-d36f8bfaeecd	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5608-542d-a022-94b27e108110	PL	POL	616	Poland 	Poljska	\N
00040000-5608-542d-4506-a4a213370a5e	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5608-542d-7f2d-6f0694ca3fc4	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5608-542d-b2c2-7735d25e5138	QA	QAT	634	Qatar 	Katar	\N
00040000-5608-542d-7b19-654e3bf5c441	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5608-542d-dbe0-30766794e3d0	RO	ROU	642	Romania 	Romunija	\N
00040000-5608-542d-e653-a99acfd0bf47	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5608-542d-53c2-1f70b4804f2a	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5608-542d-613b-84624088adf0	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5608-542d-f4c2-931d810913c6	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5608-542d-1bad-43e74c9960da	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5608-542d-3033-b6281224276b	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5608-542d-b84f-697f41272f52	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5608-542d-c263-a5449d0b5d20	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5608-542d-fd6f-051415680c11	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5608-542d-12ee-f7513db39358	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5608-542d-69a2-57a1b1f36961	SM	SMR	674	San Marino 	San Marino	\N
00040000-5608-542d-ce9b-fdfb4c28adca	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5608-542d-3d9d-f0348b09fa03	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5608-542d-0d19-353e06765b3a	SN	SEN	686	Senegal 	Senegal	\N
00040000-5608-542d-e6b3-19fd2a1dbb28	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5608-542d-9b42-fb7d4f97093e	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5608-542d-d24b-62feed612410	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5608-542d-64ad-30bd6bf6153b	SG	SGP	702	Singapore 	Singapur	\N
00040000-5608-542d-6712-7789a9fd6652	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5608-542d-3d13-00ee3f1c0899	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5608-542d-32b0-c2bdb0c4a760	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5608-542d-0767-3c319329b73b	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5608-542d-7d3f-da2341db984e	SO	SOM	706	Somalia 	Somalija	\N
00040000-5608-542d-c38c-85bbd97640fd	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5608-542d-f249-2210e6bfb02d	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5608-542d-c2d4-4b765c1b5af7	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5608-542d-3532-520c50adb6e1	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5608-542d-cbcc-2919e88fbc85	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5608-542d-b863-4151350336f9	SD	SDN	729	Sudan 	Sudan	\N
00040000-5608-542d-45b4-0e0aaba82514	SR	SUR	740	Suriname 	Surinam	\N
00040000-5608-542d-65b9-6443a1c1ae24	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5608-542d-9aca-c5dcbaf597a4	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5608-542d-d2e0-9b44647501be	SE	SWE	752	Sweden 	Švedska	\N
00040000-5608-542d-a18a-a53dd5d88bcf	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5608-542d-3120-e9f5a61bd2cd	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5608-542d-e751-b04b27901c91	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5608-542d-b282-c568f109a018	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5608-542d-1607-1dd87b6881e9	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5608-542d-cb08-30881062e302	TH	THA	764	Thailand 	Tajska	\N
00040000-5608-542d-0b7e-b643bb7262ab	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5608-542d-3ca4-f8778409ea62	TG	TGO	768	Togo 	Togo	\N
00040000-5608-542d-f7d4-47a13ffbd965	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5608-542d-2b75-ac31c077a07d	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5608-542d-009d-a770113b3ae8	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5608-542d-cd6e-8ae23083d057	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5608-542d-9f34-72ed00fb62cf	TR	TUR	792	Turkey 	Turčija	\N
00040000-5608-542d-369b-cb7ca6413258	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5608-542d-1e0f-a22398955faf	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5608-542d-4bc1-e3fa7946fbd1	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5608-542d-ac17-2a5e176b3835	UG	UGA	800	Uganda 	Uganda	\N
00040000-5608-542d-36c4-ef2aeae29633	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5608-542d-a3d5-7aa3b221cb2e	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5608-542d-d3e2-474cddfcc799	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5608-542d-477c-e39752f17083	US	USA	840	United States 	Združene države Amerike	\N
00040000-5608-542d-1cbe-912edf484ae7	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5608-542d-38e3-f7f7075f03fb	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5608-542d-8a3b-94208e375b12	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5608-542d-0670-6f1fc45928e4	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5608-542d-42e5-a055b356638b	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5608-542d-b6e8-3b5259f1f21c	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5608-542d-dbed-6bc1d248cd13	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5608-542d-3594-4b9966752ee9	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5608-542d-b449-2e56b9f6f849	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5608-542d-7a24-dd08e3762518	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5608-542d-4d17-e9b5007af0ff	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5608-542d-4b28-d3b45830f4e7	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5608-542d-1b8f-2b6f56771265	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3024 (class 0 OID 20788147)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5608-542f-96b8-7ed7489755bf	000e0000-5608-542f-f043-623e27be08b2	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5608-542d-07f4-cdfe58d204b8	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5608-542f-fd22-ff163d82d601	000e0000-5608-542f-0ef6-b6f3952fdc23	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5608-542d-5513-f2f487e6ba39	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5608-542f-eda2-8daf8963e50d	000e0000-5608-542f-4c82-345adc67f975	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5608-542d-07f4-cdfe58d204b8	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5608-542f-f323-1d8ca0cfa38c	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	0	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5608-542f-bc31-017cda40c126	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	0	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3009 (class 0 OID 20787949)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5608-542f-9fde-fd634f83118f	000e0000-5608-542f-0ef6-b6f3952fdc23	000c0000-5608-542f-c438-04347827b150	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5608-542d-9886-93bf3010b50f
000d0000-5608-542f-da64-8dc3fded1e18	000e0000-5608-542f-0ef6-b6f3952fdc23	000c0000-5608-542f-cbcb-803ab563c128	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5608-542d-7113-ed105d071f26
000d0000-5608-542f-d2ab-d00263a03a29	000e0000-5608-542f-0ef6-b6f3952fdc23	000c0000-5608-542f-adf2-c8d2f2cc54fd	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5608-542d-4e1c-af1b80bf762b
000d0000-5608-542f-7511-18456a03b82c	000e0000-5608-542f-0ef6-b6f3952fdc23	000c0000-5608-542f-5220-5920468968ff	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5608-542d-51bf-cd7d765cb9b2
000d0000-5608-542f-e9e7-68e2d615ff95	000e0000-5608-542f-0ef6-b6f3952fdc23	000c0000-5608-542f-6c15-d71c944f8776	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5608-542d-51bf-cd7d765cb9b2
000d0000-5608-542f-2746-e004086f37bf	000e0000-5608-542f-0ef6-b6f3952fdc23	000c0000-5608-542f-cd98-38bbbd37e928	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5608-542d-9886-93bf3010b50f
000d0000-5608-542f-32c0-2bfc753e7852	000e0000-5608-542f-0ef6-b6f3952fdc23	000c0000-5608-542f-9cdf-044581f179a3	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5608-542d-9886-93bf3010b50f
000d0000-5608-542f-745d-e1148008e669	000e0000-5608-542f-0ef6-b6f3952fdc23	000c0000-5608-542f-8e7d-840702fb75bb	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5608-542d-3112-ec266b4c94ff
000d0000-5608-542f-2c7d-d18fc39737b2	000e0000-5608-542f-0ef6-b6f3952fdc23	000c0000-5608-542f-6a7b-d871392d31e2	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5608-542d-0ee3-b0d2d4ca0a06
\.


--
-- TOC entry 2989 (class 0 OID 20787763)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 20787738)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 20787715)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5608-542f-c03f-6b462f9ee172	00080000-5608-542f-78b1-e8e9d00d4688	00090000-5608-542f-a954-73aa4e333d93	AK		igralka
\.


--
-- TOC entry 2998 (class 0 OID 20787863)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 20788355)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 20788367)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 20788389)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 20579799)
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
\.


--
-- TOC entry 3002 (class 0 OID 20787888)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 20787672)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5608-542e-e27b-76d78ca37e7c	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5608-542e-a2d7-e1129f7633bd	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5608-542e-34be-8de763d0550c	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5608-542e-4aa0-dbf106b9021f	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5608-542e-42a5-e5c0f74187fe	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5608-542e-f955-f6d36f2822de	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5608-542e-895c-8befcb994220	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5608-542e-4abe-c0da3da413ee	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5608-542e-03f5-59722f443b47	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5608-542e-7920-1000e3053358	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5608-542e-7828-541b0f711e68	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5608-542e-9712-b815e6bb0100	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5608-542e-32c7-9e6006ee74fe	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5608-542e-b4bc-dfe3d3fb58f3	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5608-542e-33fd-9248f2a27277	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5608-542f-6fc4-42265ae9a273	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5608-542f-9f87-8d2f78acb901	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5608-542f-0897-d16edb6df1a2	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5608-542f-3311-50e4d0f56733	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5608-542f-bbd6-97a7b77cbed5	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5608-5430-00d0-9cdb15f33214	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2976 (class 0 OID 20787586)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5608-542f-e731-58428a1fb3bd	00000000-5608-542f-6fc4-42265ae9a273	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5608-542f-1101-11b136307146	00000000-5608-542f-6fc4-42265ae9a273	00010000-5608-542e-15a8-b21a457dcfad	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5608-542f-1baf-c7fc24fbd2c3	00000000-5608-542f-9f87-8d2f78acb901	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2977 (class 0 OID 20787597)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5608-542f-7670-d378176c0c85	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5608-542f-0339-7cced74b5b6c	00010000-5608-542f-7365-e985b2140732	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5608-542f-10b9-440a1bf8cf15	00010000-5608-542f-39dc-71156623749b	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5608-542f-8274-28143f14f584	00010000-5608-542f-548e-bfebe829eaae	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5608-542f-94ad-dfb2bef410dd	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5608-542f-3185-9f2993aa3ae2	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5608-542f-c546-e06396e48c59	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5608-542f-50b9-8368043fb62d	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5608-542f-a954-73aa4e333d93	00010000-5608-542f-db37-7f8bcc0067d9	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5608-542f-71d7-344c7048c411	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5608-542f-bbd4-17ab044b1277	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5608-542f-5c09-95f7e3558c91	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5608-542f-7e10-6b29a07e44ca	00010000-5608-542f-9c2f-d1a44bfd8b56	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5608-542f-33d1-36b7434b9690	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5608-542f-2294-821bfc983949	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5608-542f-2b90-9bcaa88c6742	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5608-542f-1b8a-6f4c984ca824	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5608-542f-686e-4d93fc65f8a6	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2972 (class 0 OID 20787551)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5608-542d-520d-740de48f7e87	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5608-542d-c991-c75f3cd925ee	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5608-542d-b711-681764da180f	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5608-542d-e048-9f41a520db41	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5608-542d-3bcb-bd7cdd1e2a65	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5608-542d-2ae0-059fa6d20162	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5608-542d-060e-39943d1577c1	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5608-542d-898c-c430d60e6132	Abonma-read	Abonma - branje	f
00030000-5608-542d-6072-cdc10a63561b	Abonma-write	Abonma - spreminjanje	f
00030000-5608-542d-b297-c67a168cc6f2	Alternacija-read	Alternacija - branje	f
00030000-5608-542d-9986-19ee77e5a783	Alternacija-write	Alternacija - spreminjanje	f
00030000-5608-542d-b69f-c8c0262aea9c	Arhivalija-read	Arhivalija - branje	f
00030000-5608-542d-850e-8bb149eb4ea1	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5608-542d-48e9-b8935c193605	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5608-542d-8300-1282c824b84f	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5608-542d-9cde-7a48102e591c	Besedilo-read	Besedilo - branje	f
00030000-5608-542d-2b77-2912bce951f2	Besedilo-write	Besedilo - spreminjanje	f
00030000-5608-542d-82ef-6b43a0994d42	DogodekIzven-read	DogodekIzven - branje	f
00030000-5608-542d-5e40-0267dbe0bdd2	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5608-542d-60a7-3588d8c88c29	Dogodek-read	Dogodek - branje	f
00030000-5608-542d-8e52-cd0bcdcf81e3	Dogodek-write	Dogodek - spreminjanje	f
00030000-5608-542d-9312-1cb681ba26dc	DrugiVir-read	DrugiVir - branje	f
00030000-5608-542d-17f6-35ae2ee76f6e	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5608-542d-ff2d-ffd912ea8cfb	Drzava-read	Drzava - branje	f
00030000-5608-542d-4a7b-2d91b637415d	Drzava-write	Drzava - spreminjanje	f
00030000-5608-542d-600a-fe74cad6369a	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5608-542e-fd2a-53fff75f317b	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5608-542e-0c84-ac63a574c411	Funkcija-read	Funkcija - branje	f
00030000-5608-542e-75da-883a813deb31	Funkcija-write	Funkcija - spreminjanje	f
00030000-5608-542e-ffef-cc5bfd983192	Gostovanje-read	Gostovanje - branje	f
00030000-5608-542e-d121-f1a9c49a10cc	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5608-542e-40ef-d032fb43d566	Gostujoca-read	Gostujoca - branje	f
00030000-5608-542e-24ae-9f34461e8a9a	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5608-542e-fe9b-cdd8046fbd4b	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5608-542e-e3a1-fed31043f66f	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5608-542e-a6ef-5e2a16da8ee2	Kupec-read	Kupec - branje	f
00030000-5608-542e-0e66-9645806f9ba5	Kupec-write	Kupec - spreminjanje	f
00030000-5608-542e-15b0-b083545ddeb2	NacinPlacina-read	NacinPlacina - branje	f
00030000-5608-542e-a395-8738d738f1b6	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5608-542e-493f-16d53dcae307	Option-read	Option - branje	f
00030000-5608-542e-c841-90085cf26b22	Option-write	Option - spreminjanje	f
00030000-5608-542e-c1ab-ca3e209ff7d1	OptionValue-read	OptionValue - branje	f
00030000-5608-542e-1f1a-de042f0b5a84	OptionValue-write	OptionValue - spreminjanje	f
00030000-5608-542e-51c8-1ebe0dca643c	Oseba-read	Oseba - branje	f
00030000-5608-542e-95b1-e996a6b06b87	Oseba-write	Oseba - spreminjanje	f
00030000-5608-542e-ce9b-fb775203d550	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5608-542e-891b-078db90ea0a5	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5608-542e-5629-62745ed01f0a	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5608-542e-3bf5-7ac81426a4e2	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5608-542e-de5a-aef7a73bf47d	Pogodba-read	Pogodba - branje	f
00030000-5608-542e-e975-ac66f411c4ad	Pogodba-write	Pogodba - spreminjanje	f
00030000-5608-542e-a9f5-17abe8ac6880	Popa-read	Popa - branje	f
00030000-5608-542e-4e04-b000a187414c	Popa-write	Popa - spreminjanje	f
00030000-5608-542e-3511-a1a4583aeb65	Posta-read	Posta - branje	f
00030000-5608-542e-2d03-cda791de645a	Posta-write	Posta - spreminjanje	f
00030000-5608-542e-af99-354a8dbe7b26	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5608-542e-e764-c96e1ac403db	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5608-542e-c34b-025f2dde65a7	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5608-542e-46e7-bc4f94ed6c94	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5608-542e-f37c-0e64d9e0e114	PostniNaslov-read	PostniNaslov - branje	f
00030000-5608-542e-628e-77bd01bd4d96	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5608-542e-8de8-d014d1d35cd4	Predstava-read	Predstava - branje	f
00030000-5608-542e-9550-951e6ba914fb	Predstava-write	Predstava - spreminjanje	f
00030000-5608-542e-4d3c-33c12b4d109e	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5608-542e-0529-e50f82279b06	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5608-542e-4ed4-e0948eda6c8f	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5608-542e-fec0-6dee0580f98b	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5608-542e-76ac-2c63b91797c9	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5608-542e-81b4-a63f1caa91f3	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5608-542e-abd3-c2ffb9d83909	ProgramDela-read	ProgramDela - branje	f
00030000-5608-542e-1c06-412f2a117a3e	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5608-542e-64ee-ee97caf746ff	ProgramFestival-read	ProgramFestival - branje	f
00030000-5608-542e-6834-edfd2d7d4548	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5608-542e-4790-65a77da89d23	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5608-542e-2276-1394b787e408	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5608-542e-cc16-d6ee6a38b619	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5608-542e-b046-d368a26ef690	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5608-542e-7a98-1965c87f1611	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5608-542e-354a-0d8756636e43	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5608-542e-4742-77805d2d46ef	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5608-542e-4956-e67979a1f6ac	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5608-542e-eb06-a08d0cd4cf5a	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5608-542e-46b9-e48141088938	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5608-542e-68a0-ccf3a33f49b2	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5608-542e-fa7f-139f67423152	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5608-542e-c869-8c597b8cfc0d	ProgramRazno-read	ProgramRazno - branje	f
00030000-5608-542e-2bf6-d6f46c9c34ce	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5608-542e-7ca5-6c8b12f7516a	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5608-542e-2d68-8c5e38eb91b1	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5608-542e-f906-04e8a77cc797	Prostor-read	Prostor - branje	f
00030000-5608-542e-cb1d-070d90d7a106	Prostor-write	Prostor - spreminjanje	f
00030000-5608-542e-406e-f21c7c03f89e	Racun-read	Racun - branje	f
00030000-5608-542e-532b-1f204149f531	Racun-write	Racun - spreminjanje	f
00030000-5608-542e-ccfc-a067a952fde8	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5608-542e-1b35-4bb5ef30dee9	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5608-542e-522a-487a4d78cedf	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5608-542e-0974-a5f3324d1c8c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5608-542e-7ff8-8650f7115772	Rekvizit-read	Rekvizit - branje	f
00030000-5608-542e-d3c2-3d0600efb0d3	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5608-542e-a52e-3caacbcbae1f	Revizija-read	Revizija - branje	f
00030000-5608-542e-1100-3fc3b9598e70	Revizija-write	Revizija - spreminjanje	f
00030000-5608-542e-57af-f852e288d2dd	Rezervacija-read	Rezervacija - branje	f
00030000-5608-542e-305c-b539514396bc	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5608-542e-8f97-c6fdd2b6d3b0	SedezniRed-read	SedezniRed - branje	f
00030000-5608-542e-e4d1-e1c5c08b6be7	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5608-542e-784d-b02d3bcb454b	Sedez-read	Sedez - branje	f
00030000-5608-542e-6cef-4f29077f10be	Sedez-write	Sedez - spreminjanje	f
00030000-5608-542e-838b-730db4f8374c	Sezona-read	Sezona - branje	f
00030000-5608-542e-91ca-cc8e76b9cd65	Sezona-write	Sezona - spreminjanje	f
00030000-5608-542e-9fc6-362103f2ef50	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5608-542e-af2b-fc61db52cb19	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5608-542e-0aad-dc46468fc471	Stevilcenje-read	Stevilcenje - branje	f
00030000-5608-542e-17bc-ca144d545652	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5608-542e-46fa-bc5a29b58037	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5608-542e-4516-ee487dc1a45a	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5608-542e-18e5-7d88330caecb	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5608-542e-61ea-441cf7285a5a	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5608-542e-1a9f-85bbcfe72bd1	Telefonska-read	Telefonska - branje	f
00030000-5608-542e-c824-6b4f2c376a11	Telefonska-write	Telefonska - spreminjanje	f
00030000-5608-542e-b665-51791015ac88	TerminStoritve-read	TerminStoritve - branje	f
00030000-5608-542e-11e2-3f326525ad54	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5608-542e-e119-d2134ecaf10b	TipFunkcije-read	TipFunkcije - branje	f
00030000-5608-542e-fd4d-053bec54db62	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5608-542e-d321-61b86c4e16a2	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5608-542e-45ff-17119c10e53e	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5608-542e-4de0-ffc06e828c72	Trr-read	Trr - branje	f
00030000-5608-542e-3f3a-80338db67e90	Trr-write	Trr - spreminjanje	f
00030000-5608-542e-dafe-69809e45b20c	Uprizoritev-read	Uprizoritev - branje	f
00030000-5608-542e-036c-e3b71ee0df83	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5608-542e-29bb-8f0a5cc8a61b	Vaja-read	Vaja - branje	f
00030000-5608-542e-9d35-7f4cbb1d288d	Vaja-write	Vaja - spreminjanje	f
00030000-5608-542e-b8b5-d2da1c7a2499	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5608-542e-7f72-597725670bbb	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5608-542e-9846-573b60847b6f	VrstaStroska-read	VrstaStroska - branje	f
00030000-5608-542e-75fd-f9a174102470	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5608-542e-c8ad-6d706f5dbafa	Zaposlitev-read	Zaposlitev - branje	f
00030000-5608-542e-abde-56bb70402296	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5608-542e-5600-fffa78c3ff91	Zasedenost-read	Zasedenost - branje	f
00030000-5608-542e-45e1-f77ebf02f160	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5608-542e-3494-d491e37b1ce7	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5608-542e-48b7-ae6c78261216	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5608-542e-d4cf-e4b9e890a235	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5608-542e-1483-d1c096045030	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5608-542e-9a28-e169b75ab78b	Job-read	Branje opravil - samo zase - branje	f
00030000-5608-542e-1c45-54afaf506182	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5608-542e-747f-e233f09d374d	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5608-542e-fb42-3f52c60a2fdf	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5608-542e-9dd0-83d42b30c906	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5608-542e-e72a-628a67ffb071	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5608-542e-65f7-d03fb71b6417	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5608-542e-5068-1da39cc7e40a	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5608-542e-6ae4-0fbe7a5cd223	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5608-542e-5e37-0400dc00b3fe	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5608-542e-83ea-abf57c8840f6	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5608-542e-e0a0-3d26338ce820	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5608-542e-f148-3b313067d403	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5608-542e-fd2b-f8d1a51ddc28	Datoteka-write	Datoteka - spreminjanje	f
00030000-5608-542e-8fe8-70f2ec371cf2	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2974 (class 0 OID 20787570)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5608-542e-a919-e4e4238a4272	00030000-5608-542d-c991-c75f3cd925ee
00020000-5608-542e-15b7-89c8a6f41960	00030000-5608-542d-ff2d-ffd912ea8cfb
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542d-898c-c430d60e6132
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542d-6072-cdc10a63561b
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542d-b297-c67a168cc6f2
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542d-9986-19ee77e5a783
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542d-b69f-c8c0262aea9c
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542d-60a7-3588d8c88c29
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542d-e048-9f41a520db41
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542d-8e52-cd0bcdcf81e3
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542d-ff2d-ffd912ea8cfb
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542d-4a7b-2d91b637415d
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-0c84-ac63a574c411
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-75da-883a813deb31
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-ffef-cc5bfd983192
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-d121-f1a9c49a10cc
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-40ef-d032fb43d566
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-24ae-9f34461e8a9a
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-fe9b-cdd8046fbd4b
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-e3a1-fed31043f66f
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-493f-16d53dcae307
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-c1ab-ca3e209ff7d1
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-51c8-1ebe0dca643c
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-95b1-e996a6b06b87
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-a9f5-17abe8ac6880
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-4e04-b000a187414c
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-3511-a1a4583aeb65
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-2d03-cda791de645a
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-f37c-0e64d9e0e114
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-628e-77bd01bd4d96
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-8de8-d014d1d35cd4
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-9550-951e6ba914fb
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-76ac-2c63b91797c9
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-81b4-a63f1caa91f3
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-f906-04e8a77cc797
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-cb1d-070d90d7a106
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-522a-487a4d78cedf
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-0974-a5f3324d1c8c
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-7ff8-8650f7115772
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-d3c2-3d0600efb0d3
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-838b-730db4f8374c
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-91ca-cc8e76b9cd65
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-e119-d2134ecaf10b
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-dafe-69809e45b20c
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-036c-e3b71ee0df83
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-29bb-8f0a5cc8a61b
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-9d35-7f4cbb1d288d
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-5600-fffa78c3ff91
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-45e1-f77ebf02f160
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-3494-d491e37b1ce7
00020000-5608-542e-330d-2ac42726e0ea	00030000-5608-542e-d4cf-e4b9e890a235
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542d-898c-c430d60e6132
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542d-b69f-c8c0262aea9c
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542d-60a7-3588d8c88c29
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542d-ff2d-ffd912ea8cfb
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542e-ffef-cc5bfd983192
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542e-40ef-d032fb43d566
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542e-fe9b-cdd8046fbd4b
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542e-e3a1-fed31043f66f
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542e-493f-16d53dcae307
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542e-c1ab-ca3e209ff7d1
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542e-51c8-1ebe0dca643c
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542e-95b1-e996a6b06b87
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542e-a9f5-17abe8ac6880
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542e-3511-a1a4583aeb65
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542e-f37c-0e64d9e0e114
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542e-628e-77bd01bd4d96
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542e-8de8-d014d1d35cd4
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542e-f906-04e8a77cc797
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542e-522a-487a4d78cedf
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542e-7ff8-8650f7115772
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542e-838b-730db4f8374c
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542e-1a9f-85bbcfe72bd1
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542e-c824-6b4f2c376a11
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542e-4de0-ffc06e828c72
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542e-3f3a-80338db67e90
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542e-c8ad-6d706f5dbafa
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542e-abde-56bb70402296
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542e-3494-d491e37b1ce7
00020000-5608-542e-dd56-b804e12dfcfb	00030000-5608-542e-d4cf-e4b9e890a235
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542d-898c-c430d60e6132
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542d-b297-c67a168cc6f2
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542d-b69f-c8c0262aea9c
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542d-850e-8bb149eb4ea1
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542d-9cde-7a48102e591c
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542d-82ef-6b43a0994d42
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542d-60a7-3588d8c88c29
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542d-ff2d-ffd912ea8cfb
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542e-0c84-ac63a574c411
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542e-ffef-cc5bfd983192
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542e-40ef-d032fb43d566
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542e-fe9b-cdd8046fbd4b
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542e-493f-16d53dcae307
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542e-c1ab-ca3e209ff7d1
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542e-51c8-1ebe0dca643c
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542e-a9f5-17abe8ac6880
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542e-3511-a1a4583aeb65
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542e-8de8-d014d1d35cd4
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542e-76ac-2c63b91797c9
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542e-f906-04e8a77cc797
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542e-522a-487a4d78cedf
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542e-7ff8-8650f7115772
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542e-838b-730db4f8374c
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542e-e119-d2134ecaf10b
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542e-29bb-8f0a5cc8a61b
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542e-5600-fffa78c3ff91
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542e-3494-d491e37b1ce7
00020000-5608-542e-ad4a-66bff51037d0	00030000-5608-542e-d4cf-e4b9e890a235
00020000-5608-542e-fe32-6572b1be379c	00030000-5608-542d-898c-c430d60e6132
00020000-5608-542e-fe32-6572b1be379c	00030000-5608-542d-6072-cdc10a63561b
00020000-5608-542e-fe32-6572b1be379c	00030000-5608-542d-9986-19ee77e5a783
00020000-5608-542e-fe32-6572b1be379c	00030000-5608-542d-b69f-c8c0262aea9c
00020000-5608-542e-fe32-6572b1be379c	00030000-5608-542d-60a7-3588d8c88c29
00020000-5608-542e-fe32-6572b1be379c	00030000-5608-542d-ff2d-ffd912ea8cfb
00020000-5608-542e-fe32-6572b1be379c	00030000-5608-542e-ffef-cc5bfd983192
00020000-5608-542e-fe32-6572b1be379c	00030000-5608-542e-40ef-d032fb43d566
00020000-5608-542e-fe32-6572b1be379c	00030000-5608-542e-493f-16d53dcae307
00020000-5608-542e-fe32-6572b1be379c	00030000-5608-542e-c1ab-ca3e209ff7d1
00020000-5608-542e-fe32-6572b1be379c	00030000-5608-542e-a9f5-17abe8ac6880
00020000-5608-542e-fe32-6572b1be379c	00030000-5608-542e-3511-a1a4583aeb65
00020000-5608-542e-fe32-6572b1be379c	00030000-5608-542e-8de8-d014d1d35cd4
00020000-5608-542e-fe32-6572b1be379c	00030000-5608-542e-f906-04e8a77cc797
00020000-5608-542e-fe32-6572b1be379c	00030000-5608-542e-522a-487a4d78cedf
00020000-5608-542e-fe32-6572b1be379c	00030000-5608-542e-7ff8-8650f7115772
00020000-5608-542e-fe32-6572b1be379c	00030000-5608-542e-838b-730db4f8374c
00020000-5608-542e-fe32-6572b1be379c	00030000-5608-542e-e119-d2134ecaf10b
00020000-5608-542e-fe32-6572b1be379c	00030000-5608-542e-3494-d491e37b1ce7
00020000-5608-542e-fe32-6572b1be379c	00030000-5608-542e-d4cf-e4b9e890a235
00020000-5608-542e-e136-c27d070dbd01	00030000-5608-542d-898c-c430d60e6132
00020000-5608-542e-e136-c27d070dbd01	00030000-5608-542d-b69f-c8c0262aea9c
00020000-5608-542e-e136-c27d070dbd01	00030000-5608-542d-60a7-3588d8c88c29
00020000-5608-542e-e136-c27d070dbd01	00030000-5608-542d-ff2d-ffd912ea8cfb
00020000-5608-542e-e136-c27d070dbd01	00030000-5608-542e-ffef-cc5bfd983192
00020000-5608-542e-e136-c27d070dbd01	00030000-5608-542e-40ef-d032fb43d566
00020000-5608-542e-e136-c27d070dbd01	00030000-5608-542e-493f-16d53dcae307
00020000-5608-542e-e136-c27d070dbd01	00030000-5608-542e-c1ab-ca3e209ff7d1
00020000-5608-542e-e136-c27d070dbd01	00030000-5608-542e-a9f5-17abe8ac6880
00020000-5608-542e-e136-c27d070dbd01	00030000-5608-542e-3511-a1a4583aeb65
00020000-5608-542e-e136-c27d070dbd01	00030000-5608-542e-8de8-d014d1d35cd4
00020000-5608-542e-e136-c27d070dbd01	00030000-5608-542e-f906-04e8a77cc797
00020000-5608-542e-e136-c27d070dbd01	00030000-5608-542e-522a-487a4d78cedf
00020000-5608-542e-e136-c27d070dbd01	00030000-5608-542e-7ff8-8650f7115772
00020000-5608-542e-e136-c27d070dbd01	00030000-5608-542e-838b-730db4f8374c
00020000-5608-542e-e136-c27d070dbd01	00030000-5608-542e-b665-51791015ac88
00020000-5608-542e-e136-c27d070dbd01	00030000-5608-542d-b711-681764da180f
00020000-5608-542e-e136-c27d070dbd01	00030000-5608-542e-e119-d2134ecaf10b
00020000-5608-542e-e136-c27d070dbd01	00030000-5608-542e-3494-d491e37b1ce7
00020000-5608-542e-e136-c27d070dbd01	00030000-5608-542e-d4cf-e4b9e890a235
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542d-520d-740de48f7e87
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542d-c991-c75f3cd925ee
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542d-b711-681764da180f
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542d-e048-9f41a520db41
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542d-3bcb-bd7cdd1e2a65
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542d-2ae0-059fa6d20162
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542d-060e-39943d1577c1
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542d-898c-c430d60e6132
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542d-6072-cdc10a63561b
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542d-b297-c67a168cc6f2
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542d-9986-19ee77e5a783
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542d-b69f-c8c0262aea9c
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542d-850e-8bb149eb4ea1
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542d-9cde-7a48102e591c
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542d-2b77-2912bce951f2
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542d-82ef-6b43a0994d42
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542d-5e40-0267dbe0bdd2
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542d-60a7-3588d8c88c29
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542d-8e52-cd0bcdcf81e3
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542d-ff2d-ffd912ea8cfb
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542d-4a7b-2d91b637415d
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542d-9312-1cb681ba26dc
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542d-17f6-35ae2ee76f6e
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542d-600a-fe74cad6369a
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-fd2a-53fff75f317b
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-0c84-ac63a574c411
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-75da-883a813deb31
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-ffef-cc5bfd983192
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-d121-f1a9c49a10cc
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-40ef-d032fb43d566
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-24ae-9f34461e8a9a
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-fe9b-cdd8046fbd4b
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-e3a1-fed31043f66f
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-a6ef-5e2a16da8ee2
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-0e66-9645806f9ba5
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-15b0-b083545ddeb2
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-a395-8738d738f1b6
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-493f-16d53dcae307
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-c841-90085cf26b22
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-c1ab-ca3e209ff7d1
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-1f1a-de042f0b5a84
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-51c8-1ebe0dca643c
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-95b1-e996a6b06b87
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-ce9b-fb775203d550
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-891b-078db90ea0a5
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-5629-62745ed01f0a
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-3bf5-7ac81426a4e2
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-de5a-aef7a73bf47d
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-e975-ac66f411c4ad
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-a9f5-17abe8ac6880
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-4e04-b000a187414c
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-3511-a1a4583aeb65
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-2d03-cda791de645a
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-af99-354a8dbe7b26
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-e764-c96e1ac403db
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-c34b-025f2dde65a7
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-46e7-bc4f94ed6c94
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-f37c-0e64d9e0e114
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-628e-77bd01bd4d96
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-8de8-d014d1d35cd4
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-9550-951e6ba914fb
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-4d3c-33c12b4d109e
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-0529-e50f82279b06
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-4ed4-e0948eda6c8f
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-fec0-6dee0580f98b
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-76ac-2c63b91797c9
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-81b4-a63f1caa91f3
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-abd3-c2ffb9d83909
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-1c06-412f2a117a3e
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-64ee-ee97caf746ff
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-6834-edfd2d7d4548
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-4790-65a77da89d23
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-2276-1394b787e408
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-cc16-d6ee6a38b619
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-b046-d368a26ef690
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-7a98-1965c87f1611
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-354a-0d8756636e43
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-4742-77805d2d46ef
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-4956-e67979a1f6ac
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-eb06-a08d0cd4cf5a
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-46b9-e48141088938
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-68a0-ccf3a33f49b2
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-fa7f-139f67423152
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-c869-8c597b8cfc0d
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-2bf6-d6f46c9c34ce
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-7ca5-6c8b12f7516a
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-2d68-8c5e38eb91b1
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-f906-04e8a77cc797
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-cb1d-070d90d7a106
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-406e-f21c7c03f89e
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-532b-1f204149f531
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-ccfc-a067a952fde8
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-1b35-4bb5ef30dee9
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-522a-487a4d78cedf
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-0974-a5f3324d1c8c
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-7ff8-8650f7115772
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-d3c2-3d0600efb0d3
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-a52e-3caacbcbae1f
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-1100-3fc3b9598e70
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-57af-f852e288d2dd
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-305c-b539514396bc
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-8f97-c6fdd2b6d3b0
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-e4d1-e1c5c08b6be7
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-784d-b02d3bcb454b
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-6cef-4f29077f10be
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-838b-730db4f8374c
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-91ca-cc8e76b9cd65
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-9fc6-362103f2ef50
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-af2b-fc61db52cb19
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-0aad-dc46468fc471
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-17bc-ca144d545652
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-46fa-bc5a29b58037
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-4516-ee487dc1a45a
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-18e5-7d88330caecb
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-61ea-441cf7285a5a
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-1a9f-85bbcfe72bd1
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-c824-6b4f2c376a11
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-b665-51791015ac88
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-11e2-3f326525ad54
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-e119-d2134ecaf10b
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-fd4d-053bec54db62
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-d321-61b86c4e16a2
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-45ff-17119c10e53e
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-4de0-ffc06e828c72
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-3f3a-80338db67e90
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-dafe-69809e45b20c
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-036c-e3b71ee0df83
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-29bb-8f0a5cc8a61b
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-9d35-7f4cbb1d288d
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-b8b5-d2da1c7a2499
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-7f72-597725670bbb
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-9846-573b60847b6f
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-75fd-f9a174102470
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-c8ad-6d706f5dbafa
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-abde-56bb70402296
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-5600-fffa78c3ff91
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-45e1-f77ebf02f160
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-3494-d491e37b1ce7
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-48b7-ae6c78261216
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-d4cf-e4b9e890a235
00020000-5608-542f-4778-f9a0c18017a1	00030000-5608-542e-1483-d1c096045030
\.


--
-- TOC entry 3003 (class 0 OID 20787895)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 20787929)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 20788065)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5608-542f-0b97-a7d477ba33f1	00090000-5608-542f-7670-d378176c0c85	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5608-542f-2c41-429014765c70	00090000-5608-542f-3185-9f2993aa3ae2	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5608-542f-da2f-3b58d216ccdd	00090000-5608-542f-7e10-6b29a07e44ca	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5608-542f-d3ae-9a87cddb247a	00090000-5608-542f-71d7-344c7048c411	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2979 (class 0 OID 20787630)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5608-542f-78b1-e8e9d00d4688	00040000-5608-542d-32b0-c2bdb0c4a760	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5608-542f-052b-70f2bf0fe0b5	00040000-5608-542d-32b0-c2bdb0c4a760	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5608-542f-ee9c-83e7588f2853	00040000-5608-542d-32b0-c2bdb0c4a760	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5608-542f-319f-f52f026c3fc1	00040000-5608-542d-32b0-c2bdb0c4a760	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5608-542f-f053-074e1041ac82	00040000-5608-542d-32b0-c2bdb0c4a760	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5608-542f-81c3-bf3580a9973c	00040000-5608-542d-8024-f10ed661cf11	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5608-542f-aacc-0c8c53318678	00040000-5608-542d-a2b4-0f065324270a	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5608-542f-1de1-a7b24f7c092b	00040000-5608-542d-e3d5-89af14a3e7b0	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5608-542f-6aef-ffde0e7c995b	00040000-5608-542d-5ed5-3b7382f502c9	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5608-5430-a092-33c7abec18c9	00040000-5608-542d-32b0-c2bdb0c4a760	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2981 (class 0 OID 20787664)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5608-542d-afdc-ae3928fa1286	8341	Adlešiči
00050000-5608-542d-d0ee-a2f4067918fb	5270	Ajdovščina
00050000-5608-542d-6c77-c2ad0206300a	6280	Ankaran/Ancarano
00050000-5608-542d-3705-b27acca4ba20	9253	Apače
00050000-5608-542d-abba-fea83072d3f3	8253	Artiče
00050000-5608-542d-9e4f-11e8eec9d5b1	4275	Begunje na Gorenjskem
00050000-5608-542d-5b69-c09f579399e2	1382	Begunje pri Cerknici
00050000-5608-542d-40e6-015d1c5ded4c	9231	Beltinci
00050000-5608-542d-e5ea-95d5c6684f9c	2234	Benedikt
00050000-5608-542d-4035-13e48e55ef6b	2345	Bistrica ob Dravi
00050000-5608-542d-63f0-e5d1e23e61d7	3256	Bistrica ob Sotli
00050000-5608-542d-cbad-c7904c37cc02	8259	Bizeljsko
00050000-5608-542d-a5b5-176b5c98ef8b	1223	Blagovica
00050000-5608-542d-5335-c8503532bbb2	8283	Blanca
00050000-5608-542d-5a0f-31ddeb007540	4260	Bled
00050000-5608-542d-e88f-db79a56ad1db	4273	Blejska Dobrava
00050000-5608-542d-6ac9-d6211901ce73	9265	Bodonci
00050000-5608-542d-199f-a1700837d89d	9222	Bogojina
00050000-5608-542d-22a7-b48c537d9b32	4263	Bohinjska Bela
00050000-5608-542d-fecf-a6ddda1ded4d	4264	Bohinjska Bistrica
00050000-5608-542d-d014-c6b37303cf3c	4265	Bohinjsko jezero
00050000-5608-542d-4f29-ae55ff2eb7cf	1353	Borovnica
00050000-5608-542d-d2dd-127f2c6d0076	8294	Boštanj
00050000-5608-542d-1e10-be4668e04486	5230	Bovec
00050000-5608-542d-9ee2-795f2370474d	5295	Branik
00050000-5608-542d-bbf7-6d5cecf9c743	3314	Braslovče
00050000-5608-542d-77cf-402de4026378	5223	Breginj
00050000-5608-542d-f675-ddc74c7a5bf7	8280	Brestanica
00050000-5608-542d-b8ca-813ffcd8e743	2354	Bresternica
00050000-5608-542d-bbb2-d381d9e1b3ec	4243	Brezje
00050000-5608-542d-f732-bcd6bfb18fc4	1351	Brezovica pri Ljubljani
00050000-5608-542d-9a99-ccc40fc5d1cb	8250	Brežice
00050000-5608-542d-40a1-584efad8927b	4210	Brnik - Aerodrom
00050000-5608-542d-406b-229bcd7ecb39	8321	Brusnice
00050000-5608-542d-be0e-508f013b24e4	3255	Buče
00050000-5608-542d-b216-870c5a9e6142	8276	Bučka 
00050000-5608-542d-bfc1-2652b946e4c7	9261	Cankova
00050000-5608-542d-665a-44e9c4d29633	3000	Celje 
00050000-5608-542d-d8b5-7e602c00a6ae	3001	Celje - poštni predali
00050000-5608-542d-79ef-88efcd27142e	4207	Cerklje na Gorenjskem
00050000-5608-542d-7f27-2c193e88b647	8263	Cerklje ob Krki
00050000-5608-542d-42c0-69e2d981559d	1380	Cerknica
00050000-5608-542d-4d72-968017f3a39c	5282	Cerkno
00050000-5608-542d-7fbd-8d4ed25d4ea0	2236	Cerkvenjak
00050000-5608-542d-6584-5200f716bdcb	2215	Ceršak
00050000-5608-542d-ac5e-93f1cb9297e6	2326	Cirkovce
00050000-5608-542d-91d0-928359d44688	2282	Cirkulane
00050000-5608-542d-b5e0-aec1f001e470	5273	Col
00050000-5608-542d-6833-6f8e7f153a79	8251	Čatež ob Savi
00050000-5608-542d-e366-acf52bc53495	1413	Čemšenik
00050000-5608-542d-5d48-ec843d861ee5	5253	Čepovan
00050000-5608-542d-277c-deecd97c0693	9232	Črenšovci
00050000-5608-542d-fecf-7b4d815c266e	2393	Črna na Koroškem
00050000-5608-542d-b6f3-7b7823749b8f	6275	Črni Kal
00050000-5608-542d-6b33-ab968f07523d	5274	Črni Vrh nad Idrijo
00050000-5608-542d-b595-9b0a06d8b0b5	5262	Črniče
00050000-5608-542d-429e-48bd3e9fa763	8340	Črnomelj
00050000-5608-542d-02a0-7571e812dfa5	6271	Dekani
00050000-5608-542d-7815-d54fb6372c1d	5210	Deskle
00050000-5608-542d-7298-8bb80e116bdb	2253	Destrnik
00050000-5608-542d-7c36-2769e4adcdf0	6215	Divača
00050000-5608-542d-d2f0-029d59ec13fc	1233	Dob
00050000-5608-542d-fef3-98ca5c4f7d86	3224	Dobje pri Planini
00050000-5608-542d-a99f-58c4297908b9	8257	Dobova
00050000-5608-542d-78af-9dd2e8482a59	1423	Dobovec
00050000-5608-542d-928d-bee5c368c313	5263	Dobravlje
00050000-5608-542d-643a-6a22c6b30dbe	3204	Dobrna
00050000-5608-542d-3225-f2b4b986542a	8211	Dobrnič
00050000-5608-542d-cf8a-0b4fea2a0b50	1356	Dobrova
00050000-5608-542d-0b5c-fb1b032db065	9223	Dobrovnik/Dobronak 
00050000-5608-542d-598d-44abe3947b71	5212	Dobrovo v Brdih
00050000-5608-542d-83a0-e3ead51dc6f9	1431	Dol pri Hrastniku
00050000-5608-542d-4ade-3ffe79dac631	1262	Dol pri Ljubljani
00050000-5608-542d-eb55-4f809c1efd16	1273	Dole pri Litiji
00050000-5608-542d-d3c3-5fd7309503de	1331	Dolenja vas
00050000-5608-542d-8449-5b544a0dd8d9	8350	Dolenjske Toplice
00050000-5608-542d-4a85-d5a8782a5995	1230	Domžale
00050000-5608-542d-3887-e45a48a032df	2252	Dornava
00050000-5608-542d-4fc6-0cdc3da64e52	5294	Dornberk
00050000-5608-542d-7c10-86608a040186	1319	Draga
00050000-5608-542d-acf6-0113326d7662	8343	Dragatuš
00050000-5608-542d-8494-82010f32a8b6	3222	Dramlje
00050000-5608-542d-7bfa-b43078ae3a2e	2370	Dravograd
00050000-5608-542d-1e1c-d0d3e8085beb	4203	Duplje
00050000-5608-542d-5ee5-4c463daa6e9b	6221	Dutovlje
00050000-5608-542d-6015-7c81c5870819	8361	Dvor
00050000-5608-542d-b597-a002054e51a9	2343	Fala
00050000-5608-542d-110d-def3671f83ee	9208	Fokovci
00050000-5608-542d-14ab-4c161d77899a	2313	Fram
00050000-5608-542d-60ab-6354ff0f939d	3213	Frankolovo
00050000-5608-542d-04d2-93edb32d6919	1274	Gabrovka
00050000-5608-542d-a9ed-c6fe654bf0fa	8254	Globoko
00050000-5608-542d-a51c-bb1e9bb1445b	5275	Godovič
00050000-5608-542d-b449-db3637792bc1	4204	Golnik
00050000-5608-542d-0f83-6e74c7af8968	3303	Gomilsko
00050000-5608-542d-a872-e534dd594f3e	4224	Gorenja vas
00050000-5608-542d-eb03-df252365a77f	3263	Gorica pri Slivnici
00050000-5608-542d-c64c-8309ef9a3cee	2272	Gorišnica
00050000-5608-542d-6b97-e5ef1ab51d08	9250	Gornja Radgona
00050000-5608-542d-2ecd-2d128d3b6aba	3342	Gornji Grad
00050000-5608-542d-f342-82369a9ff971	4282	Gozd Martuljek
00050000-5608-542d-3692-526faca39328	6272	Gračišče
00050000-5608-542d-aab6-fc25360a61ef	9264	Grad
00050000-5608-542d-5ef6-5c8d6e780156	8332	Gradac
00050000-5608-542d-e406-a9783bfcdf5c	1384	Grahovo
00050000-5608-542d-399e-e116fc10e5fb	5242	Grahovo ob Bači
00050000-5608-542d-f8ac-05385952b8d3	5251	Grgar
00050000-5608-542d-2b48-711da8be24d0	3302	Griže
00050000-5608-542d-cc6f-1222d74eb4fd	3231	Grobelno
00050000-5608-542d-6b4c-38e0e0648be8	1290	Grosuplje
00050000-5608-542d-9b56-5869d87b97a9	2288	Hajdina
00050000-5608-542d-9f80-fd249cd4be17	8362	Hinje
00050000-5608-542d-faa1-db9eccce9e63	2311	Hoče
00050000-5608-542d-8046-60d6fca1be5c	9205	Hodoš/Hodos
00050000-5608-542d-11d9-12b72992368f	1354	Horjul
00050000-5608-542d-8249-0fb23a7c73c7	1372	Hotedršica
00050000-5608-542d-17ef-244a69366af1	1430	Hrastnik
00050000-5608-542d-4dff-ac2c42371f1c	6225	Hruševje
00050000-5608-542d-6d4e-51a75076df03	4276	Hrušica
00050000-5608-542d-63d2-36861cbcd105	5280	Idrija
00050000-5608-542d-fae1-9dc617040f5a	1292	Ig
00050000-5608-542d-9058-f0bb98651772	6250	Ilirska Bistrica
00050000-5608-542d-31de-a3869cee43a1	6251	Ilirska Bistrica-Trnovo
00050000-5608-542d-aa06-1e3cb964353d	1295	Ivančna Gorica
00050000-5608-542d-3d44-c7f7c4a1bdf7	2259	Ivanjkovci
00050000-5608-542d-2b34-4f9e8b9001f1	1411	Izlake
00050000-5608-542d-8fa1-7ed1be6f57be	6310	Izola/Isola
00050000-5608-542d-24be-40d8cb6345c5	2222	Jakobski Dol
00050000-5608-542d-5400-8d5cc84f2f2c	2221	Jarenina
00050000-5608-542d-e470-afabc08e0b88	6254	Jelšane
00050000-5608-542d-87c1-a0bacb2cd2fc	4270	Jesenice
00050000-5608-542d-9aa3-5ba9733e9a49	8261	Jesenice na Dolenjskem
00050000-5608-542d-d220-01c54ccb9173	3273	Jurklošter
00050000-5608-542d-b649-3aa2e18a4970	2223	Jurovski Dol
00050000-5608-542d-981e-7697e7d2b46c	2256	Juršinci
00050000-5608-542d-d488-7c850baab1a7	5214	Kal nad Kanalom
00050000-5608-542d-33e4-b1a737fa52e2	3233	Kalobje
00050000-5608-542d-3e7f-4545855f3aea	4246	Kamna Gorica
00050000-5608-542d-5e28-a427f32869df	2351	Kamnica
00050000-5608-542d-8777-b1f46d499279	1241	Kamnik
00050000-5608-542d-3751-16293b8c1e1f	5213	Kanal
00050000-5608-542d-9450-9751139a0e56	8258	Kapele
00050000-5608-542d-66e1-dd8ee0ff206b	2362	Kapla
00050000-5608-542d-0ec7-ddb7d231c88b	2325	Kidričevo
00050000-5608-542d-e24b-f88b3b544ced	1412	Kisovec
00050000-5608-542d-fc83-92695a7fe20a	6253	Knežak
00050000-5608-542d-7adb-d3f49982e6f0	5222	Kobarid
00050000-5608-542d-c6b5-ea6d70a22024	9227	Kobilje
00050000-5608-542d-be05-bc45bf61ecef	1330	Kočevje
00050000-5608-542d-9efd-441337782d20	1338	Kočevska Reka
00050000-5608-542d-e16c-79a9c0d83bb5	2276	Kog
00050000-5608-542d-4468-0bb478aa8e27	5211	Kojsko
00050000-5608-542d-9449-c58cf21c6d89	6223	Komen
00050000-5608-542d-deae-c2b5d173212d	1218	Komenda
00050000-5608-542d-aae5-79c78e159819	6000	Koper/Capodistria 
00050000-5608-542d-b958-e0e352656f55	6001	Koper/Capodistria - poštni predali
00050000-5608-542d-455c-b2eb362e515f	8282	Koprivnica
00050000-5608-542d-89cc-30f76d15daef	5296	Kostanjevica na Krasu
00050000-5608-542d-06d7-fb7c0aed55d1	8311	Kostanjevica na Krki
00050000-5608-542d-c426-19c737836f65	1336	Kostel
00050000-5608-542d-f80a-3a642783dce8	6256	Košana
00050000-5608-542d-19e4-561d35697f26	2394	Kotlje
00050000-5608-542d-0651-e21320c67466	6240	Kozina
00050000-5608-542d-4708-e83d28aa6849	3260	Kozje
00050000-5608-542d-8eb4-8ef797398e23	4000	Kranj 
00050000-5608-542d-f1c0-63b5b7dd103d	4001	Kranj - poštni predali
00050000-5608-542d-01d3-c18af40fbfec	4280	Kranjska Gora
00050000-5608-542d-c2c5-41b6bc471afd	1281	Kresnice
00050000-5608-542d-7bf1-e9ef09ba36f9	4294	Križe
00050000-5608-542d-a6cb-a93285712a5f	9206	Križevci
00050000-5608-542d-a415-1a961f23b470	9242	Križevci pri Ljutomeru
00050000-5608-542d-94f4-877b860f42e1	1301	Krka
00050000-5608-542d-3cdd-36d0450ff647	8296	Krmelj
00050000-5608-542d-cdba-1e052732efff	4245	Kropa
00050000-5608-542d-760d-b7e37d8a790a	8262	Krška vas
00050000-5608-542d-42ff-f6371c294119	8270	Krško
00050000-5608-542d-4694-62872e57acb1	9263	Kuzma
00050000-5608-542d-548d-0ea6f7dc87e4	2318	Laporje
00050000-5608-542d-d98d-22939702a6ff	3270	Laško
00050000-5608-542d-f90b-bb0b9c8b29de	1219	Laze v Tuhinju
00050000-5608-542d-536a-f764863adf96	2230	Lenart v Slovenskih goricah
00050000-5608-542d-76c3-39d660624270	9220	Lendava/Lendva
00050000-5608-542d-bbfb-9e8e76c43c7b	4248	Lesce
00050000-5608-542d-1c5c-06076e56cb2e	3261	Lesično
00050000-5608-542d-ba98-d433f84e0fda	8273	Leskovec pri Krškem
00050000-5608-542d-b519-9fab58db10fe	2372	Libeliče
00050000-5608-542d-cc0e-baab6bc43362	2341	Limbuš
00050000-5608-542d-fe5a-2300ea20dc5f	1270	Litija
00050000-5608-542d-e15e-b024751b24d6	3202	Ljubečna
00050000-5608-542d-3090-eeb04e90c844	1000	Ljubljana 
00050000-5608-542d-c5af-c68cdca7638b	1001	Ljubljana - poštni predali
00050000-5608-542d-fadf-473a2bcfd419	1231	Ljubljana - Črnuče
00050000-5608-542d-072c-05ef4c42a191	1261	Ljubljana - Dobrunje
00050000-5608-542d-feca-d1b9779c954f	1260	Ljubljana - Polje
00050000-5608-542d-4a2b-1fdced4e4d77	1210	Ljubljana - Šentvid
00050000-5608-542d-35d9-110a74ad5791	1211	Ljubljana - Šmartno
00050000-5608-542d-1393-400d3e471b08	3333	Ljubno ob Savinji
00050000-5608-542d-3dc0-db7e5fa5683b	9240	Ljutomer
00050000-5608-542d-dd14-01a78dbd864e	3215	Loče
00050000-5608-542d-0d52-1ca6689f6726	5231	Log pod Mangartom
00050000-5608-542d-300a-8bfa04b643ad	1358	Log pri Brezovici
00050000-5608-542d-725e-9810f667343e	1370	Logatec
00050000-5608-542d-dc75-74edae6714f3	1371	Logatec
00050000-5608-542d-69c4-0617cdee81f8	1434	Loka pri Zidanem Mostu
00050000-5608-542d-0a4d-13409f5b8f92	3223	Loka pri Žusmu
00050000-5608-542d-9406-36cd3c880015	6219	Lokev
00050000-5608-542d-e12f-9b720f9fcd22	1318	Loški Potok
00050000-5608-542d-6e99-5191fd217890	2324	Lovrenc na Dravskem polju
00050000-5608-542d-8bed-7d51f0a6d849	2344	Lovrenc na Pohorju
00050000-5608-542d-b913-14018ab78184	3334	Luče
00050000-5608-542d-3690-27a5c2c8e574	1225	Lukovica
00050000-5608-542d-f09c-25c83abe4de6	9202	Mačkovci
00050000-5608-542d-e55a-b48ccf310a45	2322	Majšperk
00050000-5608-542d-a3f4-bd7f1022e5eb	2321	Makole
00050000-5608-542d-b266-67763771da88	9243	Mala Nedelja
00050000-5608-542d-6e77-de432c2278a3	2229	Malečnik
00050000-5608-542d-7a01-fc5338861c07	6273	Marezige
00050000-5608-542d-4d8e-216a613fd5b1	2000	Maribor 
00050000-5608-542d-8420-b029d07c37cd	2001	Maribor - poštni predali
00050000-5608-542d-aabd-11bf5b287d18	2206	Marjeta na Dravskem polju
00050000-5608-542d-1e7d-f2260ea7bf85	2281	Markovci
00050000-5608-542d-3f34-9f5b01b16514	9221	Martjanci
00050000-5608-542d-03b5-99bc70881132	6242	Materija
00050000-5608-542d-77cc-7fbc6cf84699	4211	Mavčiče
00050000-5608-542d-dc4f-f424409c9758	1215	Medvode
00050000-5608-542d-4d71-9cbbc86e0842	1234	Mengeš
00050000-5608-542d-12c4-c195aea8ea68	8330	Metlika
00050000-5608-542d-f0d6-775e0f8468b8	2392	Mežica
00050000-5608-542d-9322-c3514f4432b8	2204	Miklavž na Dravskem polju
00050000-5608-542d-4e42-bb36c6dab110	2275	Miklavž pri Ormožu
00050000-5608-542d-fcbf-a136010395cf	5291	Miren
00050000-5608-542d-9602-09b1854c2f54	8233	Mirna
00050000-5608-542d-7188-1e5fbd50342d	8216	Mirna Peč
00050000-5608-542d-a477-f4ffc7900787	2382	Mislinja
00050000-5608-542d-3562-9cf4ed494169	4281	Mojstrana
00050000-5608-542d-be5a-fa6725ed8dd3	8230	Mokronog
00050000-5608-542d-80b6-95f96613fac1	1251	Moravče
00050000-5608-542d-6910-df002affc69c	9226	Moravske Toplice
00050000-5608-542d-79fe-76137f7a6982	5216	Most na Soči
00050000-5608-542d-8e03-ed8a87566508	1221	Motnik
00050000-5608-542d-2c3f-9ff88c402103	3330	Mozirje
00050000-5608-542d-83df-62c76e2de731	9000	Murska Sobota 
00050000-5608-542d-dcaf-00b4c9eee00d	9001	Murska Sobota - poštni predali
00050000-5608-542d-77af-324fa920a139	2366	Muta
00050000-5608-542d-0e8e-487dca80c371	4202	Naklo
00050000-5608-542d-528d-20cb2b42df70	3331	Nazarje
00050000-5608-542d-df8a-ba4cd42e1614	1357	Notranje Gorice
00050000-5608-542d-bfb6-198315e7b81d	3203	Nova Cerkev
00050000-5608-542d-9d47-16fd65505697	5000	Nova Gorica 
00050000-5608-542d-ad04-b80b3a505952	5001	Nova Gorica - poštni predali
00050000-5608-542d-13ed-7706ea8079f7	1385	Nova vas
00050000-5608-542d-dbba-43af19601b64	8000	Novo mesto
00050000-5608-542d-3bec-7ffc1f3d03b2	8001	Novo mesto - poštni predali
00050000-5608-542d-1ab6-b6a9260679a2	6243	Obrov
00050000-5608-542d-1ca5-93d32f141b97	9233	Odranci
00050000-5608-542d-0138-fd88373eb54e	2317	Oplotnica
00050000-5608-542d-0b1c-db2dda775452	2312	Orehova vas
00050000-5608-542d-87e4-14469ff0d3c8	2270	Ormož
00050000-5608-542d-f21d-c5cd96ceb68d	1316	Ortnek
00050000-5608-542d-f0cb-aba8d6b5500b	1337	Osilnica
00050000-5608-542d-b2ec-c5d4e412a065	8222	Otočec
00050000-5608-542d-8bf3-c1c25a338134	2361	Ožbalt
00050000-5608-542d-17dd-a5a18db9ea1c	2231	Pernica
00050000-5608-542d-da7d-e394d1a2008c	2211	Pesnica pri Mariboru
00050000-5608-542d-d5de-d89f06ed1f5a	9203	Petrovci
00050000-5608-542d-d2d2-80cf3c8bf896	3301	Petrovče
00050000-5608-542d-0dd0-f8214a868da5	6330	Piran/Pirano
00050000-5608-542d-3194-3c42ff0a0ff7	8255	Pišece
00050000-5608-542d-d9bf-832ff07a1ef2	6257	Pivka
00050000-5608-542d-f087-c5598e8b9471	6232	Planina
00050000-5608-542d-8a0b-c2e85a326885	3225	Planina pri Sevnici
00050000-5608-542d-6b38-f8aca2e24e01	6276	Pobegi
00050000-5608-542d-6db0-dd56d2775d06	8312	Podbočje
00050000-5608-542d-3b49-01174f76f598	5243	Podbrdo
00050000-5608-542d-9098-42c1bc3a331a	3254	Podčetrtek
00050000-5608-542d-37e1-738616e5fff8	2273	Podgorci
00050000-5608-542d-e92b-5571d001aa78	6216	Podgorje
00050000-5608-542d-3089-60aad2eadc7f	2381	Podgorje pri Slovenj Gradcu
00050000-5608-542d-131f-45b604ec2344	6244	Podgrad
00050000-5608-542d-450e-146cfecb52f6	1414	Podkum
00050000-5608-542d-f82a-2af1d39f2c76	2286	Podlehnik
00050000-5608-542d-de94-058bd1f25bc1	5272	Podnanos
00050000-5608-542d-2f65-21b37e3dc335	4244	Podnart
00050000-5608-542d-143d-0975d292b18c	3241	Podplat
00050000-5608-542d-dcce-cb6193bc5e29	3257	Podsreda
00050000-5608-542d-8fcd-2a138c4f49f9	2363	Podvelka
00050000-5608-542d-7cc3-3f9cfed9a819	2208	Pohorje
00050000-5608-542d-a375-3a3ff68eff17	2257	Polenšak
00050000-5608-542d-8f49-787bbf9d9b52	1355	Polhov Gradec
00050000-5608-542d-a529-01bb57fb47d5	4223	Poljane nad Škofjo Loko
00050000-5608-542d-26a1-76dac59af7fc	2319	Poljčane
00050000-5608-542d-8747-e4ef4d924ccc	1272	Polšnik
00050000-5608-542d-ac5f-1f6c7ba24c5b	3313	Polzela
00050000-5608-542d-06f6-c7cecc4f6cef	3232	Ponikva
00050000-5608-542d-7a6a-48796b1f1dcd	6320	Portorož/Portorose
00050000-5608-542d-b5f6-6e8f20564759	6230	Postojna
00050000-5608-542d-be84-653fe871c60a	2331	Pragersko
00050000-5608-542d-8c3f-47c137592001	3312	Prebold
00050000-5608-542d-5f04-9e3fed30e3de	4205	Preddvor
00050000-5608-542d-43b0-38933778f543	6255	Prem
00050000-5608-542d-7558-8a5184e943e0	1352	Preserje
00050000-5608-542d-c1c8-387af4f541e3	6258	Prestranek
00050000-5608-542d-3536-e9d7cfdd8e56	2391	Prevalje
00050000-5608-542d-66de-192fcf33eee7	3262	Prevorje
00050000-5608-542d-2673-a6e73003c4ba	1276	Primskovo 
00050000-5608-542d-1b76-d8bfbb691501	3253	Pristava pri Mestinju
00050000-5608-542d-87e6-ee9e40f78243	9207	Prosenjakovci/Partosfalva
00050000-5608-542d-e661-bad9ef7f238e	5297	Prvačina
00050000-5608-542d-7bf5-14b3c903ecdc	2250	Ptuj
00050000-5608-542d-9b78-6b497888ecc9	2323	Ptujska Gora
00050000-5608-542d-4312-51c1d64998b6	9201	Puconci
00050000-5608-542d-661b-eeec1f65deab	2327	Rače
00050000-5608-542d-1c22-cdfca3aefa95	1433	Radeče
00050000-5608-542d-928e-6b3f14799c59	9252	Radenci
00050000-5608-542d-ff6f-6def0e5ff173	2360	Radlje ob Dravi
00050000-5608-542d-2200-cb3947fb8d88	1235	Radomlje
00050000-5608-542d-4d72-796274dc1a4f	4240	Radovljica
00050000-5608-542d-2729-bbe927995d12	8274	Raka
00050000-5608-542d-f661-2ebc620d91aa	1381	Rakek
00050000-5608-542d-5b44-4e329f2daa54	4283	Rateče - Planica
00050000-5608-542d-0541-c3153704d9cf	2390	Ravne na Koroškem
00050000-5608-542d-d670-dcc783c5765f	9246	Razkrižje
00050000-5608-542d-7c21-174b3045aa50	3332	Rečica ob Savinji
00050000-5608-542d-5668-8785ec1eec16	5292	Renče
00050000-5608-542d-76a3-d0667c4f3005	1310	Ribnica
00050000-5608-542d-2450-318060bbed87	2364	Ribnica na Pohorju
00050000-5608-542d-5634-ae5ffabad0e5	3272	Rimske Toplice
00050000-5608-542d-ea84-36a2f15a2595	1314	Rob
00050000-5608-542d-8415-35321504f225	5215	Ročinj
00050000-5608-542d-407c-79cba223682f	3250	Rogaška Slatina
00050000-5608-542d-8a6a-25fdc423c7f6	9262	Rogašovci
00050000-5608-542d-eecb-5bf5d87cdfbb	3252	Rogatec
00050000-5608-542d-ba50-f103866a00c1	1373	Rovte
00050000-5608-542d-ed53-b8e2924562a4	2342	Ruše
00050000-5608-542d-ed32-9f03687fcd0a	1282	Sava
00050000-5608-542d-08dc-ea8f3292ef6a	6333	Sečovlje/Sicciole
00050000-5608-542d-a845-6e8cf5b9dce5	4227	Selca
00050000-5608-542d-69af-6c89f302eedb	2352	Selnica ob Dravi
00050000-5608-542d-f8be-cb5c9a44d421	8333	Semič
00050000-5608-542d-feea-f4931bcc6ecf	8281	Senovo
00050000-5608-542d-f0ae-074f7e366652	6224	Senožeče
00050000-5608-542d-f073-90b201f8df9c	8290	Sevnica
00050000-5608-542d-bb78-e0f6ebae0eb8	6210	Sežana
00050000-5608-542d-00b0-07da918c3fec	2214	Sladki Vrh
00050000-5608-542d-5a86-2ad00c3389c3	5283	Slap ob Idrijci
00050000-5608-542d-474b-04c9786bb281	2380	Slovenj Gradec
00050000-5608-542d-7707-82d0dd1aba2a	2310	Slovenska Bistrica
00050000-5608-542d-12bd-2922b67db593	3210	Slovenske Konjice
00050000-5608-542d-e4cc-5b2d13bd1d01	1216	Smlednik
00050000-5608-542d-8c9b-05474825cd56	5232	Soča
00050000-5608-542d-c345-b765d5bc7d0d	1317	Sodražica
00050000-5608-542d-ad17-fa86333c5bdb	3335	Solčava
00050000-5608-542d-8e6f-7104cce979b7	5250	Solkan
00050000-5608-542d-559a-81ecedb16b99	4229	Sorica
00050000-5608-542d-6e49-8ca26644cd90	4225	Sovodenj
00050000-5608-542d-3bc3-37b8dd10c961	5281	Spodnja Idrija
00050000-5608-542d-1442-2984de8cdd50	2241	Spodnji Duplek
00050000-5608-542d-4e45-6e666b2513e8	9245	Spodnji Ivanjci
00050000-5608-542d-0a6e-c4b1ffc49d65	2277	Središče ob Dravi
00050000-5608-542d-2817-7be6c0c74027	4267	Srednja vas v Bohinju
00050000-5608-542d-bfc9-bcdd56bbd6e2	8256	Sromlje 
00050000-5608-542d-f8a4-8c4851b4b04a	5224	Srpenica
00050000-5608-542d-6e96-a86f66e67e8f	1242	Stahovica
00050000-5608-542d-2d7f-974b53799412	1332	Stara Cerkev
00050000-5608-542d-d98d-ff0dae27b9a9	8342	Stari trg ob Kolpi
00050000-5608-542d-8cd9-0b8df93182fd	1386	Stari trg pri Ložu
00050000-5608-542d-bdf9-d7d663bce9bd	2205	Starše
00050000-5608-542d-2f54-94c6288fbcac	2289	Stoperce
00050000-5608-542d-cdea-2bcce9c6d911	8322	Stopiče
00050000-5608-542d-d143-797a86f4c9af	3206	Stranice
00050000-5608-542d-0f00-7fdf7baab3e8	8351	Straža
00050000-5608-542d-5b5a-fec530c8c091	1313	Struge
00050000-5608-542d-58e5-378c8fb2721c	8293	Studenec
00050000-5608-542d-9734-f08420114bab	8331	Suhor
00050000-5608-542d-0e8c-098f4d800e5f	2233	Sv. Ana v Slovenskih goricah
00050000-5608-542d-43b3-79078cd2826a	2235	Sv. Trojica v Slovenskih goricah
00050000-5608-542d-0f8a-c801cf91466c	2353	Sveti Duh na Ostrem Vrhu
00050000-5608-542d-d6c5-6ad7a6e87297	9244	Sveti Jurij ob Ščavnici
00050000-5608-542d-1dbd-78de3c31b5fb	3264	Sveti Štefan
00050000-5608-542d-983a-77a5fe9fbf80	2258	Sveti Tomaž
00050000-5608-542d-23e1-91bba8adf625	9204	Šalovci
00050000-5608-542d-0828-26349836ccb1	5261	Šempas
00050000-5608-542d-7f3f-3de8e72ad6ad	5290	Šempeter pri Gorici
00050000-5608-542d-7dac-8963fe237ecb	3311	Šempeter v Savinjski dolini
00050000-5608-542d-7a63-68c9b8a5bb47	4208	Šenčur
00050000-5608-542d-b400-9899116c848a	2212	Šentilj v Slovenskih goricah
00050000-5608-542d-316d-e3546351a59b	8297	Šentjanž
00050000-5608-542d-f604-711ceacde3c4	2373	Šentjanž pri Dravogradu
00050000-5608-542d-9291-bf07d31849a6	8310	Šentjernej
00050000-5608-542d-a4ee-501722733e66	3230	Šentjur
00050000-5608-542d-e947-b4ae463dd1ec	3271	Šentrupert
00050000-5608-542d-c916-0e9f589254b7	8232	Šentrupert
00050000-5608-542d-235b-b53b40cbe143	1296	Šentvid pri Stični
00050000-5608-542d-ad02-fcb9d48f0def	8275	Škocjan
00050000-5608-542d-ca57-3dc0285a087c	6281	Škofije
00050000-5608-542d-43c5-b55f0defd435	4220	Škofja Loka
00050000-5608-542d-157f-648fc8f4f3d9	3211	Škofja vas
00050000-5608-542d-2928-6347491576e3	1291	Škofljica
00050000-5608-542d-9a22-b946f4d71023	6274	Šmarje
00050000-5608-542d-d0c7-981e2c8f9100	1293	Šmarje - Sap
00050000-5608-542d-32c1-0a3951259430	3240	Šmarje pri Jelšah
00050000-5608-542d-2ece-574e9cc8e102	8220	Šmarješke Toplice
00050000-5608-542d-1d4b-4c042e2a6517	2315	Šmartno na Pohorju
00050000-5608-542d-6cb3-0b798aee485a	3341	Šmartno ob Dreti
00050000-5608-542d-bb60-0b85333db2ec	3327	Šmartno ob Paki
00050000-5608-542d-8113-28d11fba8dda	1275	Šmartno pri Litiji
00050000-5608-542d-9dcb-fa789f5d7531	2383	Šmartno pri Slovenj Gradcu
00050000-5608-542d-d077-73d747cbae98	3201	Šmartno v Rožni dolini
00050000-5608-542d-2fa4-4ebb198d1f2c	3325	Šoštanj
00050000-5608-542d-e707-844facfeb507	6222	Štanjel
00050000-5608-542d-b5e0-191efc647f4a	3220	Štore
00050000-5608-542d-325b-4f2bdcdeceb6	3304	Tabor
00050000-5608-542d-3e95-336246291684	3221	Teharje
00050000-5608-542d-446a-254fa44c6829	9251	Tišina
00050000-5608-542d-d25a-103c30e9d95f	5220	Tolmin
00050000-5608-542d-cb19-3e3d97e662f8	3326	Topolšica
00050000-5608-542d-ea21-720cc7884b9e	2371	Trbonje
00050000-5608-542d-b4d9-16c67166428a	1420	Trbovlje
00050000-5608-542d-84ae-2fb80ee2a034	8231	Trebelno 
00050000-5608-542d-02ac-b8ad7e14a5cd	8210	Trebnje
00050000-5608-542d-09ac-b923de437c87	5252	Trnovo pri Gorici
00050000-5608-542d-5f2b-7ad40a74e1f4	2254	Trnovska vas
00050000-5608-542d-b9a1-689199f15c78	1222	Trojane
00050000-5608-542d-7796-daf259508564	1236	Trzin
00050000-5608-542d-30aa-f4af382fb83d	4290	Tržič
00050000-5608-542d-16c2-7b39f80e90c0	8295	Tržišče
00050000-5608-542d-cb45-4e6dd76ca7c8	1311	Turjak
00050000-5608-542d-b625-8217a807399a	9224	Turnišče
00050000-5608-542d-a796-506ddd9683b3	8323	Uršna sela
00050000-5608-542d-8d07-6d09f43bfd2e	1252	Vače
00050000-5608-542d-4d48-23fb9fc440ca	3320	Velenje 
00050000-5608-542d-7906-09fa5591c26c	3322	Velenje - poštni predali
00050000-5608-542d-1582-fb93292018cc	8212	Velika Loka
00050000-5608-542d-aee0-0af9ee429cf7	2274	Velika Nedelja
00050000-5608-542d-68fb-a90b6282f84d	9225	Velika Polana
00050000-5608-542d-1236-da55fb57752a	1315	Velike Lašče
00050000-5608-542d-bd31-509812501d7e	8213	Veliki Gaber
00050000-5608-542d-f523-4857af794c63	9241	Veržej
00050000-5608-542d-df99-7fbceebf2204	1312	Videm - Dobrepolje
00050000-5608-542d-998b-7ace73175c3d	2284	Videm pri Ptuju
00050000-5608-542d-ce7d-398fddf7a5fc	8344	Vinica
00050000-5608-542d-6532-af0ad9055fd9	5271	Vipava
00050000-5608-542d-e9da-51e27d6af8e6	4212	Visoko
00050000-5608-542d-0e62-23fd8135ff28	1294	Višnja Gora
00050000-5608-542d-8361-c9c37cd4a8e6	3205	Vitanje
00050000-5608-542d-f1d1-506bddf07ba7	2255	Vitomarci
00050000-5608-542d-b397-4d8932459f9e	1217	Vodice
00050000-5608-542d-9eb7-84b2c6726dda	3212	Vojnik\t
00050000-5608-542d-68e0-0bef29abe018	5293	Volčja Draga
00050000-5608-542d-1518-25e9a9ad8b9e	2232	Voličina
00050000-5608-542d-f7e9-99f1f63c2722	3305	Vransko
00050000-5608-542d-ee02-c4663fc18e78	6217	Vremski Britof
00050000-5608-542d-0fd5-3649d88212b7	1360	Vrhnika
00050000-5608-542d-7c6f-d9c4ea2c2d71	2365	Vuhred
00050000-5608-542d-99a7-43253119e457	2367	Vuzenica
00050000-5608-542d-c210-956afb673680	8292	Zabukovje 
00050000-5608-542d-0d96-02adfa9e273f	1410	Zagorje ob Savi
00050000-5608-542d-8eb8-bf7a7eb12950	1303	Zagradec
00050000-5608-542d-a993-b781df7f4759	2283	Zavrč
00050000-5608-542d-1228-6d437e662544	8272	Zdole 
00050000-5608-542d-16db-2b1e5dedccea	4201	Zgornja Besnica
00050000-5608-542d-6543-03ec2cc1bf39	2242	Zgornja Korena
00050000-5608-542d-6bab-d60277266ef5	2201	Zgornja Kungota
00050000-5608-542d-db74-3267c243dd11	2316	Zgornja Ložnica
00050000-5608-542d-6ad5-7eb0a501cb05	2314	Zgornja Polskava
00050000-5608-542d-16db-da85118cbb04	2213	Zgornja Velka
00050000-5608-542d-d0b0-8a7e8a947579	4247	Zgornje Gorje
00050000-5608-542d-8bbf-8a424aef4f1d	4206	Zgornje Jezersko
00050000-5608-542d-007e-6ad77ac92366	2285	Zgornji Leskovec
00050000-5608-542d-c8e2-c695700d128c	1432	Zidani Most
00050000-5608-542d-22f8-edf42cea875b	3214	Zreče
00050000-5608-542d-732e-2f0867a57484	4209	Žabnica
00050000-5608-542d-a16e-ec01d8106e05	3310	Žalec
00050000-5608-542d-c0f2-34595a265034	4228	Železniki
00050000-5608-542d-61e8-133e5d0c52a8	2287	Žetale
00050000-5608-542d-a854-213823c9c802	4226	Žiri
00050000-5608-542d-4bd8-0f849fe9de6f	4274	Žirovnica
00050000-5608-542d-f1ad-9ee7a82723f4	8360	Žužemberk
\.


--
-- TOC entry 3026 (class 0 OID 20788245)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 20787869)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 20787649)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5608-542f-0ec6-930ef2a8a31a	00080000-5608-542f-78b1-e8e9d00d4688	\N	00040000-5608-542d-32b0-c2bdb0c4a760	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5608-542f-69f6-46d1bc2a131a	00080000-5608-542f-78b1-e8e9d00d4688	\N	00040000-5608-542d-32b0-c2bdb0c4a760	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5608-542f-11ac-57d24a0fe46e	00080000-5608-542f-052b-70f2bf0fe0b5	\N	00040000-5608-542d-32b0-c2bdb0c4a760	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2988 (class 0 OID 20787753)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 20787881)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 20788259)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 20788269)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5608-542f-5264-da2bf2305c35	00080000-5608-542f-ee9c-83e7588f2853	0987	AK
00190000-5608-542f-746e-e44851d37681	00080000-5608-542f-052b-70f2bf0fe0b5	0989	AK
00190000-5608-542f-5fe3-b297314922bc	00080000-5608-542f-319f-f52f026c3fc1	0986	AK
00190000-5608-542f-34ad-074ab39d6704	00080000-5608-542f-81c3-bf3580a9973c	0984	AK
00190000-5608-542f-367b-b453ca146a46	00080000-5608-542f-aacc-0c8c53318678	0983	AK
00190000-5608-542f-a6fd-f86104478742	00080000-5608-542f-1de1-a7b24f7c092b	0982	AK
00190000-5608-5430-bf4e-ead2414f46c0	00080000-5608-5430-a092-33c7abec18c9	1001	AK
\.


--
-- TOC entry 3025 (class 0 OID 20788202)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5608-542f-c68a-a85241f31d4f	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3029 (class 0 OID 20788277)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 20787910)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5608-542f-e787-cdee49755e43	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5608-542f-673c-dfe8167478d5	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5608-542f-f296-43c39152abcb	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5608-542f-86e8-17eb357f0edd	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5608-542f-38ca-fc50a027a0b2	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5608-542f-30ff-9dd5ccdb6c3b	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5608-542f-e3e7-cd427a186c70	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2997 (class 0 OID 20787854)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 20787844)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 20788054)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 20787984)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 20787727)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 20787522)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5608-5430-a092-33c7abec18c9	00010000-5608-542e-ae12-a750570f3829	2015-09-27 22:40:16	INS	a:0:{}
2	App\\Entity\\Option	00000000-5608-5430-00d0-9cdb15f33214	00010000-5608-542e-ae12-a750570f3829	2015-09-27 22:40:16	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5608-5430-bf4e-ead2414f46c0	00010000-5608-542e-ae12-a750570f3829	2015-09-27 22:40:16	INS	a:0:{}
\.


--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3006 (class 0 OID 20787923)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 20787560)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5608-542e-a919-e4e4238a4272	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5608-542e-15b7-89c8a6f41960	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5608-542e-ec6a-37f00ad5fe23	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5608-542e-ff6b-979ae642ebd5	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5608-542e-330d-2ac42726e0ea	planer	Planer dogodkov v koledarju	t
00020000-5608-542e-dd56-b804e12dfcfb	kadrovska	Kadrovska služba	t
00020000-5608-542e-ad4a-66bff51037d0	arhivar	Ažuriranje arhivalij	t
00020000-5608-542e-fe32-6572b1be379c	igralec	Igralec	t
00020000-5608-542e-e136-c27d070dbd01	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5608-542f-4778-f9a0c18017a1	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2971 (class 0 OID 20787544)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5608-542e-15a8-b21a457dcfad	00020000-5608-542e-ec6a-37f00ad5fe23
00010000-5608-542e-ae12-a750570f3829	00020000-5608-542e-ec6a-37f00ad5fe23
00010000-5608-542f-a78c-339f6a19494a	00020000-5608-542f-4778-f9a0c18017a1
\.


--
-- TOC entry 3008 (class 0 OID 20787937)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 20787875)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 20787821)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 20787509)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5608-542d-ca6d-210340fa9ca8	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5608-542d-9ee9-e508a513f11f	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5608-542d-5384-ca2b3822aeb7	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5608-542d-725a-977e1639762b	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5608-542d-bba7-4151f652fd88	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2966 (class 0 OID 20787501)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5608-542d-080d-087872069cd4	00230000-5608-542d-725a-977e1639762b	popa
00240000-5608-542d-c6f6-06f6dff7ca62	00230000-5608-542d-725a-977e1639762b	oseba
00240000-5608-542d-91f2-7bb26672bd4b	00230000-5608-542d-725a-977e1639762b	sezona
00240000-5608-542d-e9ee-bd5e57bdb2e4	00230000-5608-542d-9ee9-e508a513f11f	prostor
00240000-5608-542d-8646-069d5d657347	00230000-5608-542d-725a-977e1639762b	besedilo
00240000-5608-542d-d433-de2b8f7ce84e	00230000-5608-542d-725a-977e1639762b	uprizoritev
00240000-5608-542d-36f3-f42d81504102	00230000-5608-542d-725a-977e1639762b	funkcija
00240000-5608-542d-12e5-8ced27c9c5b2	00230000-5608-542d-725a-977e1639762b	tipfunkcije
00240000-5608-542d-3da8-16d534635263	00230000-5608-542d-725a-977e1639762b	alternacija
00240000-5608-542d-4e62-6cbfb49eef68	00230000-5608-542d-ca6d-210340fa9ca8	pogodba
00240000-5608-542d-3f6b-dbcf85c5cfac	00230000-5608-542d-725a-977e1639762b	zaposlitev
00240000-5608-542d-02ab-adfccd1c53be	00230000-5608-542d-725a-977e1639762b	zvrstuprizoritve
00240000-5608-542d-827d-3e731dd94a72	00230000-5608-542d-ca6d-210340fa9ca8	programdela
00240000-5608-542d-5fe4-99cba0f6f017	00230000-5608-542d-725a-977e1639762b	zapis
\.


--
-- TOC entry 2965 (class 0 OID 20787496)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
464db07f-e8a6-4d9a-865d-737979e89362	00240000-5608-542d-080d-087872069cd4	0	1001
\.


--
-- TOC entry 3014 (class 0 OID 20788001)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5608-542f-e840-631bfb99dc1a	000e0000-5608-542f-0ef6-b6f3952fdc23	00080000-5608-542f-78b1-e8e9d00d4688	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5608-542d-29cb-ca8afb152d2c
00270000-5608-542f-7971-db3af42a6958	000e0000-5608-542f-0ef6-b6f3952fdc23	00080000-5608-542f-78b1-e8e9d00d4688	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5608-542d-29cb-ca8afb152d2c
\.


--
-- TOC entry 2978 (class 0 OID 20787622)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 20787831)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5608-542f-d622-02251312e4d4	00180000-5608-542f-7fd2-6dc8c3a3d688	000c0000-5608-542f-c438-04347827b150	00090000-5608-542f-a954-73aa4e333d93	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5608-542f-c1ca-22bb938e8d5d	00180000-5608-542f-7fd2-6dc8c3a3d688	000c0000-5608-542f-cbcb-803ab563c128	00090000-5608-542f-71d7-344c7048c411	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5608-542f-9155-93ee8d2ae127	00180000-5608-542f-7fd2-6dc8c3a3d688	000c0000-5608-542f-adf2-c8d2f2cc54fd	00090000-5608-542f-10b9-440a1bf8cf15	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5608-542f-3b07-84ca277d4c55	00180000-5608-542f-7fd2-6dc8c3a3d688	000c0000-5608-542f-5220-5920468968ff	00090000-5608-542f-0339-7cced74b5b6c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5608-542f-1128-88511b2db507	00180000-5608-542f-7fd2-6dc8c3a3d688	000c0000-5608-542f-6c15-d71c944f8776	00090000-5608-542f-5c09-95f7e3558c91	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5608-542f-0e9c-46392233c6fb	00180000-5608-542f-6f38-677bf5b64b77	\N	00090000-5608-542f-5c09-95f7e3558c91	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3017 (class 0 OID 20788042)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5608-542d-0ee3-b0d2d4ca0a06	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5608-542d-1376-2b257adea9eb	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5608-542d-f0b2-e1011f769d83	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5608-542d-7113-ed105d071f26	04	Režija	Režija	Režija	umetnik	30
000f0000-5608-542d-59c6-47520ba0b0af	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5608-542d-a303-d5f207b98695	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5608-542d-8a69-5e70ff22740a	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5608-542d-ae16-9c4e64df9330	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5608-542d-868a-86eb61eac757	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5608-542d-f564-4f4468e91451	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5608-542d-3112-ec266b4c94ff	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5608-542d-aeb6-67d6998d8942	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5608-542d-8218-2b9d0aa5f41c	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5608-542d-89cb-9c5fbef0131b	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5608-542d-9886-93bf3010b50f	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5608-542d-581b-e6ecd4d007f1	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5608-542d-51bf-cd7d765cb9b2	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5608-542d-4e1c-af1b80bf762b	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3030 (class 0 OID 20788288)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5608-542d-f68e-2585a44acf2c	01	Velika predstava	f	1.00	1.00
002b0000-5608-542d-2657-d90b9b0aee7e	02	Mala predstava	f	0.50	0.50
002b0000-5608-542d-ede8-c31089edfde9	03	Mala koprodukcija	t	0.40	1.00
002b0000-5608-542d-07f4-cdfe58d204b8	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5608-542d-5513-f2f487e6ba39	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2983 (class 0 OID 20787684)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 20787531)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5608-542e-ae12-a750570f3829	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROInH4Nmr7RSfhU1BjOxcvhaQ2CPFL2DS	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5608-542f-39dc-71156623749b	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5608-542f-7365-e985b2140732	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5608-542f-db37-7f8bcc0067d9	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5608-542f-9c2f-d1a44bfd8b56	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5608-542f-548e-bfebe829eaae	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5608-542f-e503-4cbb75b79f84	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5608-542f-3171-8d97b07c2123	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5608-542f-3c6a-29e6eed747d4	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5608-542f-7d4b-77e861b809eb	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5608-542f-a78c-339f6a19494a	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5608-542e-15a8-b21a457dcfad	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3021 (class 0 OID 20788092)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5608-542f-f043-623e27be08b2	00160000-5608-542f-bd64-883258e4d80b	\N	00140000-5608-542d-e3dc-52f9638e38e2	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	\N	f	2				\N	f	\N	\N		\N	00220000-5608-542f-38ca-fc50a027a0b2
000e0000-5608-542f-0ef6-b6f3952fdc23	00160000-5608-542f-eb8c-1b98fbd60c9a	\N	00140000-5608-542d-81c8-d03f565ee772	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	\N	f	2				\N	f	\N	\N		\N	00220000-5608-542f-30ff-9dd5ccdb6c3b
000e0000-5608-542f-4c82-345adc67f975	\N	\N	00140000-5608-542d-81c8-d03f565ee772	00190000-5608-542f-5264-da2bf2305c35	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5608-542f-38ca-fc50a027a0b2
000e0000-5608-542f-e19a-f79e7d35adce	\N	\N	00140000-5608-542d-81c8-d03f565ee772	00190000-5608-542f-5264-da2bf2305c35	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5608-542f-38ca-fc50a027a0b2
000e0000-5608-542f-79e9-e4c50103bc4b	\N	\N	00140000-5608-542d-81c8-d03f565ee772	00190000-5608-542f-5264-da2bf2305c35	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5608-542f-e787-cdee49755e43
000e0000-5608-542f-be27-db8461fbbffd	\N	\N	00140000-5608-542d-81c8-d03f565ee772	00190000-5608-542f-5264-da2bf2305c35	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5608-542f-e787-cdee49755e43
\.


--
-- TOC entry 2990 (class 0 OID 20787774)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5608-542f-0a8c-1a53906a755b	000e0000-5608-542f-0ef6-b6f3952fdc23	\N	1	
00200000-5608-542f-f167-cde6923175ef	000e0000-5608-542f-0ef6-b6f3952fdc23	\N	2	
00200000-5608-542f-2e5e-fae7c1958445	000e0000-5608-542f-0ef6-b6f3952fdc23	\N	3	
00200000-5608-542f-0d94-0ae09876b0c1	000e0000-5608-542f-0ef6-b6f3952fdc23	\N	4	
00200000-5608-542f-9d38-2c7ac8106460	000e0000-5608-542f-0ef6-b6f3952fdc23	\N	5	
\.


--
-- TOC entry 3004 (class 0 OID 20787902)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 20788015)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5608-542d-1aab-2b2bdfddab31	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5608-542d-b42a-9ec98f3c852f	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5608-542d-2dbf-c577b28c3151	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5608-542d-b634-f3d0b8d7c927	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5608-542d-8e7c-490a7a392457	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5608-542d-9c8f-325238c9841d	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5608-542d-edec-6f3b9ade1154	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5608-542d-e52b-d7617aed382d	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5608-542d-29cb-ca8afb152d2c	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5608-542d-4495-6cd0f09fa046	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5608-542d-99ea-a50253a75590	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5608-542d-407f-403ad9b40d26	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5608-542d-649d-f646c125c169	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5608-542d-ff20-d789dc6968f7	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5608-542d-3267-8346921d059e	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5608-542d-b66d-60b7efe70b7c	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5608-542d-2e8b-b369f6dee57d	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5608-542d-cdff-b8ff4ab67376	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5608-542d-a0c3-cf60b4ba26dc	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5608-542d-58c0-cd1530a4d2ae	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5608-542d-ee7c-b9b179cf66d5	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5608-542d-b00f-596e68d597f6	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5608-542d-fb98-1e603993cada	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5608-542d-65dd-5d0b6e88635b	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5608-542d-f358-1ecd953d9dc8	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5608-542d-d91d-94b5d8e623db	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5608-542d-068b-64b775ac205d	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5608-542d-6aa9-0c4a656fae6e	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3033 (class 0 OID 20788335)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 20788307)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 20788347)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 20787974)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5608-542f-6d39-39b98daa54c8	00090000-5608-542f-71d7-344c7048c411	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-5608-542f-0b8f-683be6760c0a	00090000-5608-542f-10b9-440a1bf8cf15	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-5608-542f-5f78-8f055c0f5c89	00090000-5608-542f-50b9-8368043fb62d	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-5608-542f-89df-9ef3400c7a05	00090000-5608-542f-8274-28143f14f584	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-5608-542f-c5a7-82fe2c5d8e5f	00090000-5608-542f-a954-73aa4e333d93	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-5608-542f-6d66-692406f6d195	00090000-5608-542f-c546-e06396e48c59	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 2992 (class 0 OID 20787810)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 20788082)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5608-542d-e3dc-52f9638e38e2	01	Drama	drama (SURS 01)
00140000-5608-542d-ce50-572dd957bbee	02	Opera	opera (SURS 02)
00140000-5608-542d-19ab-b703b37b2943	03	Balet	balet (SURS 03)
00140000-5608-542d-f411-622d24d24c03	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5608-542d-3d4b-621f6c72428c	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5608-542d-81c8-d03f565ee772	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5608-542d-f471-e9f350bd05a9	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3010 (class 0 OID 20787964)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2497 (class 2606 OID 20787585)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 20788141)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 20788131)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 20787998)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 20788040)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 20788387)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 20787799)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 20787820)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 20788305)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 20787710)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 20788196)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 20787960)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 20787772)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 20787748)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 20787724)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 20787867)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 20788364)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 20788371)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2751 (class 2606 OID 20788395)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 20579803)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2609 (class 2606 OID 20787894)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 20787682)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 20787594)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 2606 OID 20787618)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 20787574)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2488 (class 2606 OID 20787559)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 20787900)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 20787936)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 20788077)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 20787646)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 20787670)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 20788257)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 20787873)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 20787660)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 20787760)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 20787885)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 20788266)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 20788274)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 20788244)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 20788286)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 20787918)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 20787858)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 20787849)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 20788064)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 20787991)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 20787736)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 20787530)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 20787927)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 20787548)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2490 (class 2606 OID 20787568)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 20787945)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 20787880)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 20787829)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 20787518)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 20787506)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 20787500)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 20788011)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 20787627)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 20787840)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 20788051)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 20788298)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 20787695)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 20787543)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 20788110)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 20787782)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 20787908)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 20788023)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 20788345)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 20788329)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 20788353)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 20787982)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 20787814)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 20788090)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 20787972)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 1259 OID 20787808)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2562 (class 1259 OID 20787809)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2563 (class 1259 OID 20787807)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2564 (class 1259 OID 20787806)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2565 (class 1259 OID 20787805)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2651 (class 1259 OID 20788012)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2652 (class 1259 OID 20788013)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 20788014)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2737 (class 1259 OID 20788366)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2738 (class 1259 OID 20788365)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2511 (class 1259 OID 20787648)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2610 (class 1259 OID 20787901)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2724 (class 1259 OID 20788333)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2725 (class 1259 OID 20788332)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2726 (class 1259 OID 20788334)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2727 (class 1259 OID 20788331)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2728 (class 1259 OID 20788330)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2604 (class 1259 OID 20787887)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2605 (class 1259 OID 20787886)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2556 (class 1259 OID 20787783)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2634 (class 1259 OID 20787961)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2635 (class 1259 OID 20787963)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2636 (class 1259 OID 20787962)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2536 (class 1259 OID 20787726)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2537 (class 1259 OID 20787725)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2715 (class 1259 OID 20788287)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2667 (class 1259 OID 20788079)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2668 (class 1259 OID 20788080)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2669 (class 1259 OID 20788081)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2734 (class 1259 OID 20788354)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2676 (class 1259 OID 20788115)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2677 (class 1259 OID 20788112)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2678 (class 1259 OID 20788116)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2679 (class 1259 OID 20788114)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2680 (class 1259 OID 20788113)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2526 (class 1259 OID 20787697)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2527 (class 1259 OID 20787696)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2502 (class 1259 OID 20787621)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2622 (class 1259 OID 20787928)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2492 (class 1259 OID 20787575)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2493 (class 1259 OID 20787576)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2627 (class 1259 OID 20787948)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2628 (class 1259 OID 20787947)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2629 (class 1259 OID 20787946)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2549 (class 1259 OID 20787761)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2550 (class 1259 OID 20787762)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2472 (class 1259 OID 20787508)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2584 (class 1259 OID 20787853)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2585 (class 1259 OID 20787851)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2586 (class 1259 OID 20787850)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2587 (class 1259 OID 20787852)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2483 (class 1259 OID 20787549)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2484 (class 1259 OID 20787550)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2613 (class 1259 OID 20787909)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2747 (class 1259 OID 20788388)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2649 (class 1259 OID 20788000)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2650 (class 1259 OID 20787999)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2748 (class 1259 OID 20788396)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2749 (class 1259 OID 20788397)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2599 (class 1259 OID 20787874)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2643 (class 1259 OID 20787992)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2644 (class 1259 OID 20787993)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2697 (class 1259 OID 20788201)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2698 (class 1259 OID 20788200)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2699 (class 1259 OID 20788197)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2700 (class 1259 OID 20788198)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2701 (class 1259 OID 20788199)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2515 (class 1259 OID 20787662)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 20787661)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2517 (class 1259 OID 20787663)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2616 (class 1259 OID 20787922)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2617 (class 1259 OID 20787921)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2707 (class 1259 OID 20788267)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2708 (class 1259 OID 20788268)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2690 (class 1259 OID 20788145)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2691 (class 1259 OID 20788146)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2692 (class 1259 OID 20788143)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2693 (class 1259 OID 20788144)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2640 (class 1259 OID 20787983)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2590 (class 1259 OID 20787862)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2591 (class 1259 OID 20787861)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2592 (class 1259 OID 20787859)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2593 (class 1259 OID 20787860)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2686 (class 1259 OID 20788133)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2687 (class 1259 OID 20788132)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2540 (class 1259 OID 20787737)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2543 (class 1259 OID 20787751)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2544 (class 1259 OID 20787750)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2545 (class 1259 OID 20787749)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2546 (class 1259 OID 20787752)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2555 (class 1259 OID 20787773)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2704 (class 1259 OID 20788258)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2723 (class 1259 OID 20788306)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2741 (class 1259 OID 20788372)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2742 (class 1259 OID 20788373)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2498 (class 1259 OID 20787596)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2499 (class 1259 OID 20787595)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2507 (class 1259 OID 20787628)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2508 (class 1259 OID 20787629)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2571 (class 1259 OID 20787815)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2579 (class 1259 OID 20787843)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2580 (class 1259 OID 20787842)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2581 (class 1259 OID 20787841)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2566 (class 1259 OID 20787801)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2567 (class 1259 OID 20787802)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2568 (class 1259 OID 20787800)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2569 (class 1259 OID 20787804)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2570 (class 1259 OID 20787803)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2514 (class 1259 OID 20787647)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2532 (class 1259 OID 20787711)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2533 (class 1259 OID 20787713)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2534 (class 1259 OID 20787712)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2535 (class 1259 OID 20787714)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2598 (class 1259 OID 20787868)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2672 (class 1259 OID 20788078)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2681 (class 1259 OID 20788111)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2663 (class 1259 OID 20788052)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2664 (class 1259 OID 20788053)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2505 (class 1259 OID 20787619)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2506 (class 1259 OID 20787620)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2637 (class 1259 OID 20787973)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2478 (class 1259 OID 20787519)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2525 (class 1259 OID 20787683)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2475 (class 1259 OID 20787507)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2720 (class 1259 OID 20788299)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 20787920)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2621 (class 1259 OID 20787919)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 20788142)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2522 (class 1259 OID 20787671)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2673 (class 1259 OID 20788091)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2731 (class 1259 OID 20788346)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2713 (class 1259 OID 20788275)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2714 (class 1259 OID 20788276)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2660 (class 1259 OID 20788041)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2578 (class 1259 OID 20787830)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2491 (class 1259 OID 20787569)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2778 (class 2606 OID 20788528)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2779 (class 2606 OID 20788533)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2783 (class 2606 OID 20788553)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2777 (class 2606 OID 20788523)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2781 (class 2606 OID 20788543)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2782 (class 2606 OID 20788548)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2780 (class 2606 OID 20788538)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2816 (class 2606 OID 20788718)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2817 (class 2606 OID 20788723)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2818 (class 2606 OID 20788728)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2851 (class 2606 OID 20788893)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2850 (class 2606 OID 20788888)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2763 (class 2606 OID 20788453)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2800 (class 2606 OID 20788638)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2847 (class 2606 OID 20788873)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2846 (class 2606 OID 20788868)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2848 (class 2606 OID 20788878)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2845 (class 2606 OID 20788863)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2844 (class 2606 OID 20788858)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2799 (class 2606 OID 20788633)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2798 (class 2606 OID 20788628)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2776 (class 2606 OID 20788518)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2808 (class 2606 OID 20788678)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2810 (class 2606 OID 20788688)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2809 (class 2606 OID 20788683)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2770 (class 2606 OID 20788488)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2769 (class 2606 OID 20788483)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2796 (class 2606 OID 20788618)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2842 (class 2606 OID 20788848)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2819 (class 2606 OID 20788733)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2820 (class 2606 OID 20788738)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2821 (class 2606 OID 20788743)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2849 (class 2606 OID 20788883)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2825 (class 2606 OID 20788763)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2822 (class 2606 OID 20788748)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2826 (class 2606 OID 20788768)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2824 (class 2606 OID 20788758)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2823 (class 2606 OID 20788753)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2768 (class 2606 OID 20788478)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2767 (class 2606 OID 20788473)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2760 (class 2606 OID 20788438)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2759 (class 2606 OID 20788433)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2804 (class 2606 OID 20788658)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2755 (class 2606 OID 20788413)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2756 (class 2606 OID 20788418)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2807 (class 2606 OID 20788673)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2806 (class 2606 OID 20788668)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2805 (class 2606 OID 20788663)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2773 (class 2606 OID 20788503)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2774 (class 2606 OID 20788508)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2752 (class 2606 OID 20788398)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2791 (class 2606 OID 20788593)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2789 (class 2606 OID 20788583)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2788 (class 2606 OID 20788578)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2790 (class 2606 OID 20788588)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2753 (class 2606 OID 20788403)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2754 (class 2606 OID 20788408)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2801 (class 2606 OID 20788643)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2854 (class 2606 OID 20788908)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2815 (class 2606 OID 20788713)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2814 (class 2606 OID 20788708)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2855 (class 2606 OID 20788913)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2856 (class 2606 OID 20788918)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2797 (class 2606 OID 20788623)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2812 (class 2606 OID 20788698)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2813 (class 2606 OID 20788703)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2837 (class 2606 OID 20788823)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2836 (class 2606 OID 20788818)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2833 (class 2606 OID 20788803)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2834 (class 2606 OID 20788808)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2835 (class 2606 OID 20788813)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2765 (class 2606 OID 20788463)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2764 (class 2606 OID 20788458)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2766 (class 2606 OID 20788468)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2803 (class 2606 OID 20788653)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2802 (class 2606 OID 20788648)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2839 (class 2606 OID 20788833)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2840 (class 2606 OID 20788838)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2831 (class 2606 OID 20788793)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2832 (class 2606 OID 20788798)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2829 (class 2606 OID 20788783)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2830 (class 2606 OID 20788788)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2811 (class 2606 OID 20788693)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2795 (class 2606 OID 20788613)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2794 (class 2606 OID 20788608)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2792 (class 2606 OID 20788598)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2793 (class 2606 OID 20788603)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2828 (class 2606 OID 20788778)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2827 (class 2606 OID 20788773)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2771 (class 2606 OID 20788493)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2772 (class 2606 OID 20788498)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2775 (class 2606 OID 20788513)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2838 (class 2606 OID 20788828)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2841 (class 2606 OID 20788843)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2843 (class 2606 OID 20788853)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2852 (class 2606 OID 20788898)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2853 (class 2606 OID 20788903)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2758 (class 2606 OID 20788428)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2757 (class 2606 OID 20788423)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2761 (class 2606 OID 20788443)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2762 (class 2606 OID 20788448)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2784 (class 2606 OID 20788558)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 20788573)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2786 (class 2606 OID 20788568)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2785 (class 2606 OID 20788563)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-27 22:40:18 CEST

--
-- PostgreSQL database dump complete
--

