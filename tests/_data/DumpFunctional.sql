--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-07 14:11:43 CEST

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
-- TOC entry 181 (class 1259 OID 21385477)
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
-- TOC entry 229 (class 1259 OID 21386034)
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
-- TOC entry 228 (class 1259 OID 21386017)
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
-- TOC entry 219 (class 1259 OID 21385894)
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
-- TOC entry 222 (class 1259 OID 21385924)
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
-- TOC entry 243 (class 1259 OID 21386279)
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
-- TOC entry 197 (class 1259 OID 21385685)
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
-- TOC entry 199 (class 1259 OID 21385716)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 21386205)
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
-- TOC entry 190 (class 1259 OID 21385598)
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
-- TOC entry 230 (class 1259 OID 21386047)
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
-- TOC entry 215 (class 1259 OID 21385849)
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
-- TOC entry 195 (class 1259 OID 21385664)
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
-- TOC entry 193 (class 1259 OID 21385638)
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
-- TOC entry 191 (class 1259 OID 21385615)
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
-- TOC entry 204 (class 1259 OID 21385763)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 21386260)
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
-- TOC entry 242 (class 1259 OID 21386272)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 21386294)
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
-- TOC entry 208 (class 1259 OID 21385788)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 21385572)
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
-- TOC entry 182 (class 1259 OID 21385486)
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
-- TOC entry 183 (class 1259 OID 21385497)
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
-- TOC entry 178 (class 1259 OID 21385451)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 21385470)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 21385795)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 21385829)
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
-- TOC entry 225 (class 1259 OID 21385965)
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
-- TOC entry 185 (class 1259 OID 21385530)
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
-- TOC entry 187 (class 1259 OID 21385564)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 21386150)
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
-- TOC entry 205 (class 1259 OID 21385769)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 21385549)
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
-- TOC entry 194 (class 1259 OID 21385653)
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
-- TOC entry 207 (class 1259 OID 21385781)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 21386164)
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
-- TOC entry 234 (class 1259 OID 21386174)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 21386107)
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
-- TOC entry 235 (class 1259 OID 21386182)
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
-- TOC entry 211 (class 1259 OID 21385810)
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
-- TOC entry 203 (class 1259 OID 21385754)
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
-- TOC entry 202 (class 1259 OID 21385744)
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
-- TOC entry 224 (class 1259 OID 21385954)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 21385884)
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
-- TOC entry 192 (class 1259 OID 21385627)
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
-- TOC entry 175 (class 1259 OID 21385422)
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
-- TOC entry 174 (class 1259 OID 21385420)
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
-- TOC entry 212 (class 1259 OID 21385823)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 21385460)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 21385444)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 21385837)
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
-- TOC entry 206 (class 1259 OID 21385775)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 21385721)
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
-- TOC entry 173 (class 1259 OID 21385409)
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
-- TOC entry 172 (class 1259 OID 21385401)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 21385396)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 21385901)
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
-- TOC entry 184 (class 1259 OID 21385522)
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
-- TOC entry 201 (class 1259 OID 21385731)
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
-- TOC entry 223 (class 1259 OID 21385942)
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
-- TOC entry 236 (class 1259 OID 21386193)
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
-- TOC entry 189 (class 1259 OID 21385584)
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
-- TOC entry 176 (class 1259 OID 21385431)
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
-- TOC entry 227 (class 1259 OID 21385992)
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
-- TOC entry 196 (class 1259 OID 21385675)
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
-- TOC entry 210 (class 1259 OID 21385802)
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
-- TOC entry 221 (class 1259 OID 21385915)
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
-- TOC entry 239 (class 1259 OID 21386240)
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
-- TOC entry 238 (class 1259 OID 21386212)
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
-- TOC entry 240 (class 1259 OID 21386252)
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
-- TOC entry 217 (class 1259 OID 21385874)
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
-- TOC entry 198 (class 1259 OID 21385710)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 21385982)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 21385864)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 21385425)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2980 (class 0 OID 21385477)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 21386034)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5615-0bfc-f96b-3529628d18b3	000d0000-5615-0bfc-6e7a-07c74eae4b44	\N	00090000-5615-0bfc-fb7d-c078071d447c	000b0000-5615-0bfc-b9f0-9c78301ac5bd	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5615-0bfc-3989-bb78f03af586	000d0000-5615-0bfc-cc80-6aeaf1f3b3e8	00100000-5615-0bfc-3d28-8cfdcc89a3c2	00090000-5615-0bfc-7a98-7f564c121eb9	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5615-0bfc-a579-af79227c743a	000d0000-5615-0bfc-08d2-c764b3c71df6	00100000-5615-0bfc-ed22-2ae0bf63fca0	00090000-5615-0bfc-356d-d2b223183d95	\N	0003	t	\N	2015-10-07	\N	2	t	\N	f	f
000c0000-5615-0bfc-6912-826bae47b064	000d0000-5615-0bfc-8896-99dc93f13e33	\N	00090000-5615-0bfc-e833-781442584129	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5615-0bfc-e425-9c5384a377c7	000d0000-5615-0bfc-2e07-98a27db3c1bd	\N	00090000-5615-0bfc-600c-6438e9d78092	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5615-0bfc-fcd2-e06ea787e689	000d0000-5615-0bfc-2607-c31ebcb248b5	\N	00090000-5615-0bfc-3b6e-5af406bbc074	000b0000-5615-0bfc-f974-bc4eddca6b66	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5615-0bfc-6146-73ea6adea0d0	000d0000-5615-0bfc-ea77-682e45d2ae9f	00100000-5615-0bfc-46e4-68155ad95076	00090000-5615-0bfc-fa93-cd0a0d4d5fab	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5615-0bfc-b719-f2a578bf823b	000d0000-5615-0bfc-9446-18accb626832	\N	00090000-5615-0bfc-4b0a-437e7f616877	000b0000-5615-0bfc-1fdb-736a953f201e	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5615-0bfc-ea73-07590c69b505	000d0000-5615-0bfc-ea77-682e45d2ae9f	00100000-5615-0bfc-1782-9564a77f6f81	00090000-5615-0bfc-69d1-5bfb54a6c568	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5615-0bfc-2999-e0a39fcad4f3	000d0000-5615-0bfc-ea77-682e45d2ae9f	00100000-5615-0bfc-4bf7-b999d4f00813	00090000-5615-0bfc-df29-0f2cd3a867d6	\N	0010	t	\N	2015-10-07	\N	16	f	\N	f	t
000c0000-5615-0bfc-588d-9283ff4a3082	000d0000-5615-0bfc-ea77-682e45d2ae9f	00100000-5615-0bfc-d832-7484a0f31e94	00090000-5615-0bfc-27e4-3f3ed6d1d7bf	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5615-0bfc-ce76-1a0a98f7f944	000d0000-5615-0bfc-2a36-78882f6ed4d2	\N	00090000-5615-0bfc-7a98-7f564c121eb9	000b0000-5615-0bfc-ebbf-abe65a90d9c2	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3027 (class 0 OID 21386017)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 21385894)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5615-0bfc-fd90-68d5258eea1e	00160000-5615-0bfb-8db9-1528222b8c81	00090000-5615-0bfc-9eb2-04141b3419e0	aizv	10	t
003d0000-5615-0bfc-e655-d42e5587e235	00160000-5615-0bfb-8db9-1528222b8c81	00090000-5615-0bfc-01ec-e6b520b1fafc	apri	14	t
003d0000-5615-0bfc-3a90-bdeecd6418a2	00160000-5615-0bfb-bf81-1c7a26723661	00090000-5615-0bfc-c620-df8d9721cb9a	aizv	11	t
003d0000-5615-0bfc-a770-e744b59b8753	00160000-5615-0bfb-bcc1-b3ef651c6255	00090000-5615-0bfc-4223-5483556c5660	aizv	12	t
003d0000-5615-0bfc-995d-2158487c87a3	00160000-5615-0bfb-8db9-1528222b8c81	00090000-5615-0bfc-de29-d3f5646f1d04	apri	18	f
\.


--
-- TOC entry 3021 (class 0 OID 21385924)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5615-0bfb-8db9-1528222b8c81	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5615-0bfb-bf81-1c7a26723661	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5615-0bfb-bcc1-b3ef651c6255	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3042 (class 0 OID 21386279)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 21385685)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5615-0bfc-e70f-4430f504eab1	\N	\N	00200000-5615-0bfc-4dd2-f393c8208925	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5615-0bfc-ae0d-d30d548c9664	\N	\N	00200000-5615-0bfc-ab70-e926f56cb037	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5615-0bfc-8c07-494fdd4f24fc	\N	\N	00200000-5615-0bfc-7c44-81fb7bcbd9f5	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5615-0bfc-2caf-ff85c9fb3671	\N	\N	00200000-5615-0bfc-cf56-257ced6753b2	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5615-0bfc-66e8-2cc30bbf8c3c	\N	\N	00200000-5615-0bfc-8dfe-5ee54c46fa8e	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2998 (class 0 OID 21385716)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 21386205)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 21385598)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5615-0bfa-11cb-8cecf83a747f	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5615-0bfa-e942-5eb97bd8941a	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5615-0bfa-6ab5-83b8bbf9e1f0	AL	ALB	008	Albania 	Albanija	\N
00040000-5615-0bfa-7839-7c68e25f0261	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5615-0bfa-a9ef-edaed5c8d2d2	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5615-0bfa-ce05-b8d8d034c5e4	AD	AND	020	Andorra 	Andora	\N
00040000-5615-0bfa-e5ae-3a5a0d06ece8	AO	AGO	024	Angola 	Angola	\N
00040000-5615-0bfa-788b-dfdeea3b78d3	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5615-0bfa-c234-27c57125458f	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5615-0bfa-d074-53288be288f2	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5615-0bfa-e297-8b69fa35e015	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5615-0bfa-e989-f103618467d7	AM	ARM	051	Armenia 	Armenija	\N
00040000-5615-0bfa-eac6-b32a9e98494f	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5615-0bfa-0924-4acd3833ec80	AU	AUS	036	Australia 	Avstralija	\N
00040000-5615-0bfa-a858-662f45c92203	AT	AUT	040	Austria 	Avstrija	\N
00040000-5615-0bfa-6971-bd271061851f	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5615-0bfa-f3d6-9c512cc94a01	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5615-0bfa-1701-cf12bcacc0d3	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5615-0bfa-52d1-32351fccdeff	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5615-0bfa-de6b-e02fd5a9cb69	BB	BRB	052	Barbados 	Barbados	\N
00040000-5615-0bfa-3514-6db39b59a7fe	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5615-0bfa-ef77-eac1d1086e57	BE	BEL	056	Belgium 	Belgija	\N
00040000-5615-0bfa-9f76-431418ed0c40	BZ	BLZ	084	Belize 	Belize	\N
00040000-5615-0bfa-a56e-db427dcc11b5	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5615-0bfa-da36-27505524ede3	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5615-0bfa-56e2-e27f6eccddc9	BT	BTN	064	Bhutan 	Butan	\N
00040000-5615-0bfa-1058-b7812c78ac1f	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5615-0bfa-2cf2-db39d6dac9b9	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5615-0bfa-7c9f-bbb86db2ca98	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5615-0bfa-e556-474d13f6edbc	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5615-0bfa-82b0-dbab257f1434	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5615-0bfa-7abc-203f2a730b2b	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5615-0bfa-3fa1-d1e5b2a46dcf	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5615-0bfa-970a-8ad18bb5dd2b	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5615-0bfa-29a7-8138c7d5d44e	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5615-0bfa-98ea-4841941f09f5	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5615-0bfa-a4bd-37859bbbc70f	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5615-0bfa-8e55-53e4bfba6de6	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5615-0bfa-6eaa-3f561b265bd5	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5615-0bfa-527d-5c54d646cab6	CA	CAN	124	Canada 	Kanada	\N
00040000-5615-0bfa-90ee-eb4374c3adbf	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5615-0bfa-3aa2-492f215b6eea	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5615-0bfa-d0d6-d89644de6b73	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5615-0bfa-d7c5-cf206f44b16e	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5615-0bfa-4648-84c678ad793c	CL	CHL	152	Chile 	Čile	\N
00040000-5615-0bfa-61bc-3d8332754cd8	CN	CHN	156	China 	Kitajska	\N
00040000-5615-0bfa-0288-652ff2ac6de3	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5615-0bfa-023d-b8e094e48e25	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5615-0bfa-a812-69e8cb643b21	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5615-0bfa-5271-ba82e610b855	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5615-0bfa-878c-dc04e5fe16ef	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5615-0bfa-2cc0-0e9b0c5847f5	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5615-0bfa-90cb-ef2dff79a7f8	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5615-0bfa-e235-7e4f7306e51b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5615-0bfa-b9f9-4ebc0313a3c6	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5615-0bfa-4e4f-5ed85d0af554	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5615-0bfa-946b-b7e75e69c58c	CU	CUB	192	Cuba 	Kuba	\N
00040000-5615-0bfa-d22f-651bf8fc5f73	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5615-0bfa-09e0-bcab245f0193	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5615-0bfa-06e2-eb57290f3164	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5615-0bfa-8dad-562dfe9ecd53	DK	DNK	208	Denmark 	Danska	\N
00040000-5615-0bfa-1ba4-3024e1ec2f32	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5615-0bfa-61d0-b1bda5e3a7a4	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5615-0bfa-39d9-889d210ac819	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5615-0bfa-7b48-13298dcddc96	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5615-0bfa-a4dc-b6c44bcded1b	EG	EGY	818	Egypt 	Egipt	\N
00040000-5615-0bfa-d8e4-f461aa8250b7	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5615-0bfa-c88e-f1739c796c7c	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5615-0bfa-2b0e-1682f5db6c5e	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5615-0bfa-4cf5-5752084ae7ca	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5615-0bfa-dac0-edae603920f6	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5615-0bfa-7b6b-d0cae06186b7	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5615-0bfa-e2a7-74949a90aee2	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5615-0bfa-4c24-d6d1faec8122	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5615-0bfa-8912-11c1251fd2f1	FI	FIN	246	Finland 	Finska	\N
00040000-5615-0bfa-6d81-82b4991cb4a8	FR	FRA	250	France 	Francija	\N
00040000-5615-0bfa-a30c-85c864393226	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5615-0bfa-a35b-8992d74f5d8e	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5615-0bfa-d8f5-c6d121cc63dc	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5615-0bfa-5927-2e35f79af606	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5615-0bfa-0f49-364e9fe0e605	GA	GAB	266	Gabon 	Gabon	\N
00040000-5615-0bfa-6412-06c5b57cc0b6	GM	GMB	270	Gambia 	Gambija	\N
00040000-5615-0bfa-17bf-8b3cb0dd7f5d	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5615-0bfa-b6eb-cdff5b5b033a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5615-0bfa-4d85-7ed850209f09	GH	GHA	288	Ghana 	Gana	\N
00040000-5615-0bfa-1247-b2200ab0e784	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5615-0bfa-f065-09ca9a8ce25b	GR	GRC	300	Greece 	Grčija	\N
00040000-5615-0bfa-b779-5e54905b4cb7	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5615-0bfa-08f4-202b62f214cb	GD	GRD	308	Grenada 	Grenada	\N
00040000-5615-0bfa-ab8d-d697551625a8	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5615-0bfa-fbf2-bebf83f63bed	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5615-0bfa-e505-a6f75818e020	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5615-0bfa-a609-0ef6c2e43c66	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5615-0bfa-cd9a-b025933fda31	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5615-0bfa-467a-48934545b2ad	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5615-0bfa-9ed2-d42c92fe450f	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5615-0bfa-2d14-24259d33fc11	HT	HTI	332	Haiti 	Haiti	\N
00040000-5615-0bfa-a88d-150912fe3c7f	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5615-0bfa-62c8-1609c9c33fd1	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5615-0bfa-cd57-510517c5979b	HN	HND	340	Honduras 	Honduras	\N
00040000-5615-0bfa-b3b7-33306955ad47	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5615-0bfa-6fe0-49ae83c91fe9	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5615-0bfa-e02c-8974989067b6	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5615-0bfa-8fac-3187c28df718	IN	IND	356	India 	Indija	\N
00040000-5615-0bfa-414a-9d6d3cb49a69	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5615-0bfa-1e3c-35a56b7593bc	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5615-0bfa-8bf3-7a7d06a618eb	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5615-0bfa-22d2-8e32e53695f9	IE	IRL	372	Ireland 	Irska	\N
00040000-5615-0bfa-0c3f-9a6f7280fdd1	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5615-0bfa-ba1f-6c1d2f6efe40	IL	ISR	376	Israel 	Izrael	\N
00040000-5615-0bfa-6df8-5dded0e201b8	IT	ITA	380	Italy 	Italija	\N
00040000-5615-0bfa-bca8-f62352bed379	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5615-0bfa-995b-804238e3afe3	JP	JPN	392	Japan 	Japonska	\N
00040000-5615-0bfa-40a0-bb618e681eac	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5615-0bfa-7caf-45459d81d446	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5615-0bfa-c9a6-c7b9c024de49	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5615-0bfa-3603-d15baeb3671a	KE	KEN	404	Kenya 	Kenija	\N
00040000-5615-0bfa-02c7-29edffb239ea	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5615-0bfa-4a75-4ebf50945cc4	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5615-0bfa-e94f-0de1b95c6d98	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5615-0bfa-ebfe-62b0cd38e043	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5615-0bfa-35af-981c49a5b729	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5615-0bfa-9cd9-2d4d8a95bf56	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5615-0bfa-59e5-a54583fb5fa2	LV	LVA	428	Latvia 	Latvija	\N
00040000-5615-0bfa-799a-976841c3c473	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5615-0bfa-5ecb-71dd11ec3024	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5615-0bfa-694c-dcffcb46b388	LR	LBR	430	Liberia 	Liberija	\N
00040000-5615-0bfa-7e11-c462d562ff7e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5615-0bfa-8ed9-bcfeca3bacb5	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5615-0bfa-163e-ba8d75c94d0f	LT	LTU	440	Lithuania 	Litva	\N
00040000-5615-0bfa-21ce-17092d3a768e	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5615-0bfa-ad38-5f578dcd7976	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5615-0bfa-9402-57f94ee79385	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5615-0bfa-dc1b-5108f1a4ebae	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5615-0bfa-13ba-ee8176f29758	MW	MWI	454	Malawi 	Malavi	\N
00040000-5615-0bfa-00fa-19e173f310a0	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5615-0bfa-f838-6693fd2296ad	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5615-0bfa-c7e8-2c6dd6c44ef7	ML	MLI	466	Mali 	Mali	\N
00040000-5615-0bfa-6df2-78fadad9875b	MT	MLT	470	Malta 	Malta	\N
00040000-5615-0bfa-0ca7-211c60aaffb5	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5615-0bfa-b8ec-48dc868f66ca	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5615-0bfa-39ba-0e481a11e1f3	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5615-0bfa-d0a7-578a15891e76	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5615-0bfa-6ee4-066faf9c362b	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5615-0bfa-1f1e-33724a8edd01	MX	MEX	484	Mexico 	Mehika	\N
00040000-5615-0bfa-db10-172e99a38b7b	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5615-0bfa-f0dd-545678ee062a	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5615-0bfa-ee40-1c29b97c429d	MC	MCO	492	Monaco 	Monako	\N
00040000-5615-0bfa-f3a0-1ab9cf6ffb72	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5615-0bfa-2019-09e8f227cdf1	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5615-0bfa-e3c1-b13207735fb2	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5615-0bfa-1c6b-972133695904	MA	MAR	504	Morocco 	Maroko	\N
00040000-5615-0bfa-4a7d-a8df4de6e108	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5615-0bfa-7a43-d29eb540d8af	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5615-0bfa-b78b-a66b26437c19	NA	NAM	516	Namibia 	Namibija	\N
00040000-5615-0bfa-893f-9660baeee0a5	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5615-0bfa-0d31-714d9dffc069	NP	NPL	524	Nepal 	Nepal	\N
00040000-5615-0bfa-cdb9-915ec20f15c5	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5615-0bfa-29bd-c45fbf0d0942	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5615-0bfa-f760-8204e9a5539a	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5615-0bfa-f8cb-2f8140d9a2e7	NE	NER	562	Niger 	Niger 	\N
00040000-5615-0bfa-a43c-97b365b1e5d9	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5615-0bfa-7afd-23fae53ee331	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5615-0bfa-91b2-0ebdc0202c6b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5615-0bfa-f605-57d321e05848	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5615-0bfa-a226-c6b5c3efaefa	NO	NOR	578	Norway 	Norveška	\N
00040000-5615-0bfa-3102-ea7c867dfc38	OM	OMN	512	Oman 	Oman	\N
00040000-5615-0bfa-b04d-f6adf8070834	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5615-0bfa-3f86-def06b488d9d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5615-0bfa-4dd6-0747aaa5ba56	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5615-0bfa-2026-c011d20e6c61	PA	PAN	591	Panama 	Panama	\N
00040000-5615-0bfa-f511-7f8d3524f49d	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5615-0bfa-3e2a-b3f5ff26eb26	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5615-0bfa-6260-64602ee9ad82	PE	PER	604	Peru 	Peru	\N
00040000-5615-0bfa-43b1-4009f5f55f2e	PH	PHL	608	Philippines 	Filipini	\N
00040000-5615-0bfa-67e9-85bea22a2941	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5615-0bfa-d928-2cec0d404cbc	PL	POL	616	Poland 	Poljska	\N
00040000-5615-0bfa-3766-4651b704986b	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5615-0bfa-4c14-31de97e4119a	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5615-0bfa-4eba-fdacccbb1e3a	QA	QAT	634	Qatar 	Katar	\N
00040000-5615-0bfa-6c11-abb08373be23	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5615-0bfa-ae56-e29cbc670645	RO	ROU	642	Romania 	Romunija	\N
00040000-5615-0bfa-06ad-bf0d70712ffe	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5615-0bfa-2801-3b02d64eeb77	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5615-0bfa-9293-c33208054b6b	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5615-0bfa-55c4-84189dee190a	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5615-0bfa-48b6-ffd15671fdee	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5615-0bfa-8e01-4f6156acc831	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5615-0bfa-fbc6-393f919566e9	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5615-0bfa-7a1f-685ef9139a8f	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5615-0bfa-caac-2e8b04aff9d5	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5615-0bfa-1770-4a124cbdd3fc	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5615-0bfa-d80a-1987a16f4e46	SM	SMR	674	San Marino 	San Marino	\N
00040000-5615-0bfa-3d45-2413f84019be	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5615-0bfa-abf0-0d8e46ceae5c	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5615-0bfa-2db2-e14ed531b090	SN	SEN	686	Senegal 	Senegal	\N
00040000-5615-0bfa-fc68-ee0974545424	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5615-0bfa-9748-3dbfe596531b	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5615-0bfa-82b0-bdf681a2b673	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5615-0bfa-0058-eefaa1248ea8	SG	SGP	702	Singapore 	Singapur	\N
00040000-5615-0bfa-12cc-64be5d0689ca	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5615-0bfa-0a79-22224034cbd0	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5615-0bfa-45b0-c8fce5f0a5e4	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5615-0bfa-6e91-288d86070922	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5615-0bfa-3832-3a007e3d094f	SO	SOM	706	Somalia 	Somalija	\N
00040000-5615-0bfa-54a5-74847917d9f4	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5615-0bfa-23d2-29c253c75fb4	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5615-0bfa-2410-62d0ef39896b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5615-0bfa-0d04-fcf38f1292b5	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5615-0bfa-6da9-a2305092040b	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5615-0bfa-2e16-5726e73f6a37	SD	SDN	729	Sudan 	Sudan	\N
00040000-5615-0bfa-a28d-8a83dea67aa3	SR	SUR	740	Suriname 	Surinam	\N
00040000-5615-0bfa-8a40-886dfc79ea6f	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5615-0bfa-6a44-e555e4b79f6c	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5615-0bfa-cf5c-110f0787a366	SE	SWE	752	Sweden 	Švedska	\N
00040000-5615-0bfa-59e9-31834c27bf42	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5615-0bfa-a110-fc9025f18eae	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5615-0bfa-c323-da7293ceaf89	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5615-0bfa-a692-0b68f6cab7bd	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5615-0bfa-5f88-da47f2c694c0	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5615-0bfa-1632-6d286af32f1f	TH	THA	764	Thailand 	Tajska	\N
00040000-5615-0bfa-db7e-56178f0b6127	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5615-0bfa-4538-8a690493f6e1	TG	TGO	768	Togo 	Togo	\N
00040000-5615-0bfa-ead5-0d424ed2a4a0	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5615-0bfa-f0c7-97fef056f3fd	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5615-0bfa-baf8-1c2a603b8c02	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5615-0bfa-261a-69076c0ba954	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5615-0bfa-2429-9c5a01c52038	TR	TUR	792	Turkey 	Turčija	\N
00040000-5615-0bfa-ccdc-6e954557b0d8	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5615-0bfa-665c-a2c11047289a	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5615-0bfa-a986-d9ee705a3f7c	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5615-0bfa-2c36-e51b2add2259	UG	UGA	800	Uganda 	Uganda	\N
00040000-5615-0bfa-5c4d-5989cf95a5d1	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5615-0bfa-3541-22ab9590c964	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5615-0bfa-c7b8-5a41b53c8340	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5615-0bfa-2b8d-0f5ba17b33b6	US	USA	840	United States 	Združene države Amerike	\N
00040000-5615-0bfa-500b-abaeac28ee08	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5615-0bfa-d748-bec479a8d4eb	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5615-0bfa-5f35-4b6e54778f48	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5615-0bfa-a975-dfae85a79079	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5615-0bfa-db74-378833993660	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5615-0bfa-bfa8-51ad6cb9523b	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5615-0bfa-f842-3c432860e776	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5615-0bfa-421d-0e5d975491d8	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5615-0bfa-40ba-3406055b929c	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5615-0bfa-4c23-7523b22109da	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5615-0bfa-e94a-9ff81c0a21a1	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5615-0bfa-a2ef-81555104c11f	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5615-0bfa-63b6-eda612d1cc81	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3029 (class 0 OID 21386047)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5615-0bfc-f6ad-9959e44e752e	000e0000-5615-0bfc-2826-49f3ca731632	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5615-0bf9-9bb2-19dc831e15a4	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5615-0bfc-1fe0-7b6543670b78	000e0000-5615-0bfc-81a7-e7bc7cd78f05	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5615-0bf9-62e5-150737c815c3	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5615-0bfc-0e58-27ff2b1deda3	000e0000-5615-0bfc-5abc-cbb84b3b65e6	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5615-0bf9-9bb2-19dc831e15a4	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5615-0bfc-c5f4-cfff082743cf	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5615-0bfc-fa65-94614104b078	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3014 (class 0 OID 21385849)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5615-0bfc-6e7a-07c74eae4b44	000e0000-5615-0bfc-81a7-e7bc7cd78f05	000c0000-5615-0bfc-f96b-3529628d18b3	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5615-0bf9-59d1-885188fb350c
000d0000-5615-0bfc-cc80-6aeaf1f3b3e8	000e0000-5615-0bfc-81a7-e7bc7cd78f05	000c0000-5615-0bfc-3989-bb78f03af586	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5615-0bf9-901e-c1455c7d0b6f
000d0000-5615-0bfc-08d2-c764b3c71df6	000e0000-5615-0bfc-81a7-e7bc7cd78f05	000c0000-5615-0bfc-a579-af79227c743a	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5615-0bf9-e7da-7b68413fd3c6
000d0000-5615-0bfc-8896-99dc93f13e33	000e0000-5615-0bfc-81a7-e7bc7cd78f05	000c0000-5615-0bfc-6912-826bae47b064	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5615-0bf9-394b-a2102c087e99
000d0000-5615-0bfc-2e07-98a27db3c1bd	000e0000-5615-0bfc-81a7-e7bc7cd78f05	000c0000-5615-0bfc-e425-9c5384a377c7	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5615-0bf9-394b-a2102c087e99
000d0000-5615-0bfc-2607-c31ebcb248b5	000e0000-5615-0bfc-81a7-e7bc7cd78f05	000c0000-5615-0bfc-fcd2-e06ea787e689	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5615-0bf9-59d1-885188fb350c
000d0000-5615-0bfc-ea77-682e45d2ae9f	000e0000-5615-0bfc-81a7-e7bc7cd78f05	000c0000-5615-0bfc-ea73-07590c69b505	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5615-0bf9-59d1-885188fb350c
000d0000-5615-0bfc-9446-18accb626832	000e0000-5615-0bfc-81a7-e7bc7cd78f05	000c0000-5615-0bfc-b719-f2a578bf823b	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5615-0bf9-9c18-d18330131a37
000d0000-5615-0bfc-2a36-78882f6ed4d2	000e0000-5615-0bfc-81a7-e7bc7cd78f05	000c0000-5615-0bfc-ce76-1a0a98f7f944	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5615-0bf9-7073-9a46068c647b
\.


--
-- TOC entry 2994 (class 0 OID 21385664)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 21385638)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 21385615)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5615-0bfc-18b1-3f917d7bfdb5	00080000-5615-0bfb-a1e9-6359821e2d4f	00090000-5615-0bfc-df29-0f2cd3a867d6	AK		igralka
\.


--
-- TOC entry 3003 (class 0 OID 21385763)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 21386260)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3041 (class 0 OID 21386272)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3043 (class 0 OID 21386294)
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
-- TOC entry 3007 (class 0 OID 21385788)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 21385572)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5615-0bfa-b3bf-39702616b265	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5615-0bfa-985d-d531b2692ce6	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5615-0bfa-e3df-b1f20da1390a	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5615-0bfa-8fa1-6bbf5452aed6	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5615-0bfa-7591-be805623ed18	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5615-0bfa-38f3-257d3fea4586	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5615-0bfa-feea-2a9b3ac50635	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5615-0bfa-be36-7088ffec5bfd	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5615-0bfa-c384-086f9a364e68	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5615-0bfa-42ea-dddd52eb8dca	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5615-0bfa-4bb7-a7d0ea7036a0	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5615-0bfa-96db-61b963bc8e26	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5615-0bfa-46d6-7f8d86d817f8	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5615-0bfa-3f17-bc3a44b37c0f	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5615-0bfa-e11c-4ab8d52d964c	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5615-0bfb-a8fa-4a033bff06e5	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5615-0bfb-a6f5-cab46e50db32	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5615-0bfb-2592-0b55e335c75e	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5615-0bfb-31d3-cc8d432df280	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5615-0bfb-758d-97796e8e0b9e	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5615-0bfe-1a11-c095701f2868	application.tenant.maticnopodjetje	string	s:36:"00080000-5615-0bfe-01b4-e55c6cf96d62";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 2981 (class 0 OID 21385486)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5615-0bfb-5d58-a8dfa018bbc7	00000000-5615-0bfb-a8fa-4a033bff06e5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5615-0bfb-98b6-7a16f21db93c	00000000-5615-0bfb-a8fa-4a033bff06e5	00010000-5615-0bfa-5791-6ebb895a408a	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5615-0bfb-a402-fd45126acd9b	00000000-5615-0bfb-a6f5-cab46e50db32	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2982 (class 0 OID 21385497)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5615-0bfc-fb7d-c078071d447c	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5615-0bfc-e833-781442584129	00010000-5615-0bfc-a298-a105c8cde1ac	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5615-0bfc-356d-d2b223183d95	00010000-5615-0bfc-e765-bef674c01049	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5615-0bfc-69d1-5bfb54a6c568	00010000-5615-0bfc-4e1c-15ebe7e40ddb	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5615-0bfc-6a86-719f8e582c7f	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5615-0bfc-3b6e-5af406bbc074	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5615-0bfc-27e4-3f3ed6d1d7bf	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5615-0bfc-fa93-cd0a0d4d5fab	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5615-0bfc-df29-0f2cd3a867d6	00010000-5615-0bfc-8ede-41cbb655e6e0	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5615-0bfc-7a98-7f564c121eb9	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5615-0bfc-4dba-23eccb96d239	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5615-0bfc-600c-6438e9d78092	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5615-0bfc-4b0a-437e7f616877	00010000-5615-0bfc-7d6c-c47df3b664cb	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5615-0bfc-9eb2-04141b3419e0	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5615-0bfc-01ec-e6b520b1fafc	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5615-0bfc-c620-df8d9721cb9a	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5615-0bfc-4223-5483556c5660	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5615-0bfc-de29-d3f5646f1d04	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2977 (class 0 OID 21385451)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5615-0bfa-86aa-be2dfe15675c	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5615-0bfa-7965-dc47e095d64f	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5615-0bfa-8ee9-01460cd700a7	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5615-0bfa-fdf6-f3538c7a6c52	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5615-0bfa-b3e6-33fa609b083a	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5615-0bfa-c655-45f502565e86	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5615-0bfa-8323-97b98650d58c	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5615-0bfa-ff84-097dfbf000ec	Abonma-read	Abonma - branje	f
00030000-5615-0bfa-9eb4-76d1a740fb8b	Abonma-write	Abonma - spreminjanje	f
00030000-5615-0bfa-c704-7a9ce6bc62fa	Alternacija-read	Alternacija - branje	f
00030000-5615-0bfa-2080-bb3425a5c87d	Alternacija-write	Alternacija - spreminjanje	f
00030000-5615-0bfa-f37c-73071f9326c1	Arhivalija-read	Arhivalija - branje	f
00030000-5615-0bfa-b91e-ebcaf108f9ae	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5615-0bfa-fc77-bb6799a890ce	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5615-0bfa-1aee-f3c78f300e13	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5615-0bfa-b03a-44d9bf919150	Besedilo-read	Besedilo - branje	f
00030000-5615-0bfa-c6f8-491433ba02f1	Besedilo-write	Besedilo - spreminjanje	f
00030000-5615-0bfa-6026-dd77f6a4b3a8	DogodekIzven-read	DogodekIzven - branje	f
00030000-5615-0bfa-9296-97d8c4d551c7	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5615-0bfa-8f24-c1cee8fca9bf	Dogodek-read	Dogodek - branje	f
00030000-5615-0bfa-94f6-43e4e9680cbf	Dogodek-write	Dogodek - spreminjanje	f
00030000-5615-0bfa-f06b-d4dc719b88be	DrugiVir-read	DrugiVir - branje	f
00030000-5615-0bfa-b69b-c558082e3b52	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5615-0bfa-235b-62f8168178ca	Drzava-read	Drzava - branje	f
00030000-5615-0bfa-bc9d-143413598398	Drzava-write	Drzava - spreminjanje	f
00030000-5615-0bfa-34a5-ec2690f365a2	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5615-0bfa-e9c4-c370083e0c01	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5615-0bfa-5822-9edc70c3669e	Funkcija-read	Funkcija - branje	f
00030000-5615-0bfa-94a5-b16517439500	Funkcija-write	Funkcija - spreminjanje	f
00030000-5615-0bfa-b4c9-a3a1dafc42ae	Gostovanje-read	Gostovanje - branje	f
00030000-5615-0bfa-7bc3-c884f570f04d	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5615-0bfa-7921-a21af4454322	Gostujoca-read	Gostujoca - branje	f
00030000-5615-0bfa-66bb-3a369d040a29	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5615-0bfa-0d34-ce646d97b86d	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5615-0bfa-b023-f7352ec62300	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5615-0bfa-596e-3c5ecf967d92	Kupec-read	Kupec - branje	f
00030000-5615-0bfa-9b20-7b281886853c	Kupec-write	Kupec - spreminjanje	f
00030000-5615-0bfa-3d9f-7f52e07531d7	NacinPlacina-read	NacinPlacina - branje	f
00030000-5615-0bfa-31ee-f029aaf3039e	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5615-0bfa-f47c-c7ebad772565	Option-read	Option - branje	f
00030000-5615-0bfa-6186-a5139a411305	Option-write	Option - spreminjanje	f
00030000-5615-0bfa-f0ca-f2a13d4bf045	OptionValue-read	OptionValue - branje	f
00030000-5615-0bfa-02f2-db86b0dfa020	OptionValue-write	OptionValue - spreminjanje	f
00030000-5615-0bfa-0570-991973dee5f9	Oseba-read	Oseba - branje	f
00030000-5615-0bfa-452c-203aa7272eb6	Oseba-write	Oseba - spreminjanje	f
00030000-5615-0bfa-dc2b-b16fb2c5d971	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5615-0bfa-3023-5a47e9434152	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5615-0bfa-dbe6-6f35c38e4ece	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5615-0bfa-77c2-b74a2180081a	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5615-0bfa-8896-f24def71de18	Pogodba-read	Pogodba - branje	f
00030000-5615-0bfa-0ee6-38e19e09ee55	Pogodba-write	Pogodba - spreminjanje	f
00030000-5615-0bfa-1c84-6ef4247b9bb5	Popa-read	Popa - branje	f
00030000-5615-0bfa-8203-ffab265bed23	Popa-write	Popa - spreminjanje	f
00030000-5615-0bfa-b055-ce6593c4edc6	Posta-read	Posta - branje	f
00030000-5615-0bfa-018b-18c7e402f423	Posta-write	Posta - spreminjanje	f
00030000-5615-0bfa-8602-9b301eb23ed2	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5615-0bfa-e621-409231770922	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5615-0bfa-1307-422bdeec4397	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5615-0bfa-ca31-ffb1c3398f5f	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5615-0bfa-ad06-4b838169620c	PostniNaslov-read	PostniNaslov - branje	f
00030000-5615-0bfa-f072-20849dbb022a	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5615-0bfa-2e33-699fac041715	Predstava-read	Predstava - branje	f
00030000-5615-0bfa-4094-2b45fb111919	Predstava-write	Predstava - spreminjanje	f
00030000-5615-0bfa-cd9c-8c708e865cfb	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5615-0bfa-4dd3-302e0547a621	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5615-0bfa-b561-f8a88ed89a66	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5615-0bfa-ed64-93c55083baec	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5615-0bfa-d64e-0797e6455c65	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5615-0bfa-f006-1bc7cbd8ed23	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5615-0bfa-e4ab-4a2f899a88f0	ProgramDela-read	ProgramDela - branje	f
00030000-5615-0bfa-0b4b-6aeee68f11ef	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5615-0bfa-9793-ff390d21df9e	ProgramFestival-read	ProgramFestival - branje	f
00030000-5615-0bfa-de78-ff9071ba8461	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5615-0bfa-d736-613b3cb65a6b	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5615-0bfa-d795-edd0eb182c12	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5615-0bfa-c26a-1a9138e67867	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5615-0bfa-dd62-f5ac98fb791b	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5615-0bfa-cee1-91308b07d182	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5615-0bfa-9ac2-422c4571b6df	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5615-0bfa-51ed-79583ddb12dd	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5615-0bfa-0708-20957aeb43df	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5615-0bfa-50ee-15c0d417a730	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5615-0bfa-9bd7-e26873676842	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5615-0bfa-2d84-3a84c9db6eb0	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5615-0bfa-dee8-fe11003d8e8f	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5615-0bfa-84e4-fdc35b443983	ProgramRazno-read	ProgramRazno - branje	f
00030000-5615-0bfa-3c09-9aba08c4bb1b	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5615-0bfa-01eb-447eabeee59c	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5615-0bfa-801d-9ee9e67d0c2d	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5615-0bfa-4b68-79a78cc29f23	Prostor-read	Prostor - branje	f
00030000-5615-0bfa-f8ec-fac08362c9fe	Prostor-write	Prostor - spreminjanje	f
00030000-5615-0bfa-34af-55a092c44153	Racun-read	Racun - branje	f
00030000-5615-0bfa-f792-f545758155de	Racun-write	Racun - spreminjanje	f
00030000-5615-0bfa-b98d-d926e16963cb	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5615-0bfa-ac0a-873360808592	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5615-0bfa-8a39-2e0f1b7d92ac	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5615-0bfa-2452-ae5dc68d6a2a	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5615-0bfa-d8f5-90d3063fcdf4	Rekvizit-read	Rekvizit - branje	f
00030000-5615-0bfa-d33c-41c793881589	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5615-0bfa-9757-a1315695de76	Revizija-read	Revizija - branje	f
00030000-5615-0bfa-a5cd-ed0b530cdb2f	Revizija-write	Revizija - spreminjanje	f
00030000-5615-0bfa-ad05-7bd5772632ad	Rezervacija-read	Rezervacija - branje	f
00030000-5615-0bfa-82b9-52a949cc9b0d	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5615-0bfa-478a-c6d8371c6bd3	SedezniRed-read	SedezniRed - branje	f
00030000-5615-0bfa-a9a0-f909c9ae0e39	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5615-0bfa-83f4-501eecff31e7	Sedez-read	Sedez - branje	f
00030000-5615-0bfa-16b6-2076ede348ce	Sedez-write	Sedez - spreminjanje	f
00030000-5615-0bfa-c816-4e1a8a9a99f4	Sezona-read	Sezona - branje	f
00030000-5615-0bfa-3658-0b9e68d97d2f	Sezona-write	Sezona - spreminjanje	f
00030000-5615-0bfa-39a0-89f16aa18fea	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5615-0bfa-759c-b8ef49fda545	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5615-0bfa-69cb-13f4b5e5b999	Stevilcenje-read	Stevilcenje - branje	f
00030000-5615-0bfa-f17d-b8e6cce284d3	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5615-0bfa-ecde-6fe58fd03af5	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5615-0bfa-8621-062a17eb403c	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5615-0bfa-adb6-04e87a6bbc3f	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5615-0bfa-fea7-28ab5a0c0bc9	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5615-0bfa-4747-850e93c283eb	Telefonska-read	Telefonska - branje	f
00030000-5615-0bfa-1dc1-68b18e499040	Telefonska-write	Telefonska - spreminjanje	f
00030000-5615-0bfa-d5dc-d4caffca3ae7	TerminStoritve-read	TerminStoritve - branje	f
00030000-5615-0bfa-337e-0ea2b8bc84ea	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5615-0bfa-1931-85e64e3254c3	TipFunkcije-read	TipFunkcije - branje	f
00030000-5615-0bfa-7acf-3333e61589f8	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5615-0bfa-717d-be98c8e0e41c	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5615-0bfa-b8f2-2f28554a6598	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5615-0bfa-b24c-27b6da4147f4	Trr-read	Trr - branje	f
00030000-5615-0bfa-5b9e-7edc5f70dc78	Trr-write	Trr - spreminjanje	f
00030000-5615-0bfa-0ea8-8381e01553c4	Uprizoritev-read	Uprizoritev - branje	f
00030000-5615-0bfa-718c-d296c31847fa	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5615-0bfa-3adf-501aa2a223f6	Vaja-read	Vaja - branje	f
00030000-5615-0bfa-4710-92c37b81964f	Vaja-write	Vaja - spreminjanje	f
00030000-5615-0bfa-8ad3-f7bf88be9e6b	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5615-0bfa-f070-2864305c5323	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5615-0bfa-a14c-1ab03ef06929	VrstaStroska-read	VrstaStroska - branje	f
00030000-5615-0bfa-55c7-249e09a4759c	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5615-0bfa-f655-84a778911736	Zaposlitev-read	Zaposlitev - branje	f
00030000-5615-0bfa-57f4-dc6e88a4506b	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5615-0bfa-8140-8560bcd83cc6	Zasedenost-read	Zasedenost - branje	f
00030000-5615-0bfa-1b99-f3dda320f7aa	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5615-0bfa-5a19-cf94c2b20586	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5615-0bfa-40ad-9f8e9af49a71	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5615-0bfa-7cce-d0523f5f4b3f	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5615-0bfa-3ee1-8e24cb80e6d4	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5615-0bfa-1691-6a05d14de6fc	Job-read	Branje opravil - samo zase - branje	f
00030000-5615-0bfa-0233-972ee70e35c0	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5615-0bfa-53a7-efd3c77c1c3c	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5615-0bfa-400f-9a7ff7afc129	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5615-0bfa-82e8-08686942911c	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5615-0bfa-57df-9df0d317f22f	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5615-0bfa-8aff-e2849144eb08	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5615-0bfa-7910-208faaf84e83	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5615-0bfa-06e1-dadfc1c980c7	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5615-0bfa-3c38-fa2dc185df1a	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5615-0bfa-3801-9ca21a04872d	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5615-0bfa-3b65-6e8952b874e6	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5615-0bfa-67d7-563672b75dd7	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5615-0bfa-77d8-ed6ec53ac451	Datoteka-write	Datoteka - spreminjanje	f
00030000-5615-0bfa-a11c-a821c9233c65	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2979 (class 0 OID 21385470)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5615-0bfa-3c14-1a946430a9a0	00030000-5615-0bfa-7965-dc47e095d64f
00020000-5615-0bfa-95cb-0b4b9e0b4e4c	00030000-5615-0bfa-235b-62f8168178ca
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-ff84-097dfbf000ec
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-9eb4-76d1a740fb8b
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-c704-7a9ce6bc62fa
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-2080-bb3425a5c87d
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-f37c-73071f9326c1
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-8f24-c1cee8fca9bf
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-fdf6-f3538c7a6c52
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-94f6-43e4e9680cbf
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-235b-62f8168178ca
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-bc9d-143413598398
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-5822-9edc70c3669e
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-94a5-b16517439500
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-b4c9-a3a1dafc42ae
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-7bc3-c884f570f04d
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-7921-a21af4454322
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-66bb-3a369d040a29
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-0d34-ce646d97b86d
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-b023-f7352ec62300
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-f47c-c7ebad772565
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-f0ca-f2a13d4bf045
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-0570-991973dee5f9
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-452c-203aa7272eb6
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-1c84-6ef4247b9bb5
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-8203-ffab265bed23
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-b055-ce6593c4edc6
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-018b-18c7e402f423
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-ad06-4b838169620c
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-f072-20849dbb022a
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-2e33-699fac041715
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-4094-2b45fb111919
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-d64e-0797e6455c65
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-f006-1bc7cbd8ed23
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-4b68-79a78cc29f23
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-f8ec-fac08362c9fe
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-8a39-2e0f1b7d92ac
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-2452-ae5dc68d6a2a
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-d8f5-90d3063fcdf4
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-d33c-41c793881589
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-c816-4e1a8a9a99f4
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-3658-0b9e68d97d2f
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-1931-85e64e3254c3
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-0ea8-8381e01553c4
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-718c-d296c31847fa
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-3adf-501aa2a223f6
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-4710-92c37b81964f
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-8140-8560bcd83cc6
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-1b99-f3dda320f7aa
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-5a19-cf94c2b20586
00020000-5615-0bfa-c4a2-c2346b7caeed	00030000-5615-0bfa-7cce-d0523f5f4b3f
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-ff84-097dfbf000ec
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-f37c-73071f9326c1
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-8f24-c1cee8fca9bf
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-235b-62f8168178ca
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-b4c9-a3a1dafc42ae
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-7921-a21af4454322
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-0d34-ce646d97b86d
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-b023-f7352ec62300
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-f47c-c7ebad772565
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-f0ca-f2a13d4bf045
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-0570-991973dee5f9
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-452c-203aa7272eb6
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-1c84-6ef4247b9bb5
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-b055-ce6593c4edc6
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-ad06-4b838169620c
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-f072-20849dbb022a
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-2e33-699fac041715
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-4b68-79a78cc29f23
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-8a39-2e0f1b7d92ac
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-d8f5-90d3063fcdf4
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-c816-4e1a8a9a99f4
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-4747-850e93c283eb
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-1dc1-68b18e499040
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-b24c-27b6da4147f4
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-5b9e-7edc5f70dc78
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-f655-84a778911736
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-57f4-dc6e88a4506b
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-5a19-cf94c2b20586
00020000-5615-0bfa-031f-d0cc5b9a54f7	00030000-5615-0bfa-7cce-d0523f5f4b3f
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-ff84-097dfbf000ec
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-c704-7a9ce6bc62fa
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-f37c-73071f9326c1
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-b91e-ebcaf108f9ae
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-b03a-44d9bf919150
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-6026-dd77f6a4b3a8
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-8f24-c1cee8fca9bf
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-235b-62f8168178ca
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-5822-9edc70c3669e
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-b4c9-a3a1dafc42ae
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-7921-a21af4454322
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-0d34-ce646d97b86d
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-f47c-c7ebad772565
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-f0ca-f2a13d4bf045
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-0570-991973dee5f9
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-1c84-6ef4247b9bb5
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-b055-ce6593c4edc6
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-2e33-699fac041715
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-d64e-0797e6455c65
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-4b68-79a78cc29f23
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-8a39-2e0f1b7d92ac
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-d8f5-90d3063fcdf4
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-c816-4e1a8a9a99f4
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-1931-85e64e3254c3
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-3adf-501aa2a223f6
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-8140-8560bcd83cc6
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-5a19-cf94c2b20586
00020000-5615-0bfa-6b7d-12dd8b1cecd0	00030000-5615-0bfa-7cce-d0523f5f4b3f
00020000-5615-0bfa-fc40-a65bc0001ce8	00030000-5615-0bfa-ff84-097dfbf000ec
00020000-5615-0bfa-fc40-a65bc0001ce8	00030000-5615-0bfa-9eb4-76d1a740fb8b
00020000-5615-0bfa-fc40-a65bc0001ce8	00030000-5615-0bfa-2080-bb3425a5c87d
00020000-5615-0bfa-fc40-a65bc0001ce8	00030000-5615-0bfa-f37c-73071f9326c1
00020000-5615-0bfa-fc40-a65bc0001ce8	00030000-5615-0bfa-8f24-c1cee8fca9bf
00020000-5615-0bfa-fc40-a65bc0001ce8	00030000-5615-0bfa-235b-62f8168178ca
00020000-5615-0bfa-fc40-a65bc0001ce8	00030000-5615-0bfa-b4c9-a3a1dafc42ae
00020000-5615-0bfa-fc40-a65bc0001ce8	00030000-5615-0bfa-7921-a21af4454322
00020000-5615-0bfa-fc40-a65bc0001ce8	00030000-5615-0bfa-f47c-c7ebad772565
00020000-5615-0bfa-fc40-a65bc0001ce8	00030000-5615-0bfa-f0ca-f2a13d4bf045
00020000-5615-0bfa-fc40-a65bc0001ce8	00030000-5615-0bfa-1c84-6ef4247b9bb5
00020000-5615-0bfa-fc40-a65bc0001ce8	00030000-5615-0bfa-b055-ce6593c4edc6
00020000-5615-0bfa-fc40-a65bc0001ce8	00030000-5615-0bfa-2e33-699fac041715
00020000-5615-0bfa-fc40-a65bc0001ce8	00030000-5615-0bfa-4b68-79a78cc29f23
00020000-5615-0bfa-fc40-a65bc0001ce8	00030000-5615-0bfa-8a39-2e0f1b7d92ac
00020000-5615-0bfa-fc40-a65bc0001ce8	00030000-5615-0bfa-d8f5-90d3063fcdf4
00020000-5615-0bfa-fc40-a65bc0001ce8	00030000-5615-0bfa-c816-4e1a8a9a99f4
00020000-5615-0bfa-fc40-a65bc0001ce8	00030000-5615-0bfa-1931-85e64e3254c3
00020000-5615-0bfa-fc40-a65bc0001ce8	00030000-5615-0bfa-5a19-cf94c2b20586
00020000-5615-0bfa-fc40-a65bc0001ce8	00030000-5615-0bfa-7cce-d0523f5f4b3f
00020000-5615-0bfa-b2f9-87bbeca6f6de	00030000-5615-0bfa-ff84-097dfbf000ec
00020000-5615-0bfa-b2f9-87bbeca6f6de	00030000-5615-0bfa-f37c-73071f9326c1
00020000-5615-0bfa-b2f9-87bbeca6f6de	00030000-5615-0bfa-8f24-c1cee8fca9bf
00020000-5615-0bfa-b2f9-87bbeca6f6de	00030000-5615-0bfa-235b-62f8168178ca
00020000-5615-0bfa-b2f9-87bbeca6f6de	00030000-5615-0bfa-b4c9-a3a1dafc42ae
00020000-5615-0bfa-b2f9-87bbeca6f6de	00030000-5615-0bfa-7921-a21af4454322
00020000-5615-0bfa-b2f9-87bbeca6f6de	00030000-5615-0bfa-f47c-c7ebad772565
00020000-5615-0bfa-b2f9-87bbeca6f6de	00030000-5615-0bfa-f0ca-f2a13d4bf045
00020000-5615-0bfa-b2f9-87bbeca6f6de	00030000-5615-0bfa-1c84-6ef4247b9bb5
00020000-5615-0bfa-b2f9-87bbeca6f6de	00030000-5615-0bfa-b055-ce6593c4edc6
00020000-5615-0bfa-b2f9-87bbeca6f6de	00030000-5615-0bfa-2e33-699fac041715
00020000-5615-0bfa-b2f9-87bbeca6f6de	00030000-5615-0bfa-4b68-79a78cc29f23
00020000-5615-0bfa-b2f9-87bbeca6f6de	00030000-5615-0bfa-8a39-2e0f1b7d92ac
00020000-5615-0bfa-b2f9-87bbeca6f6de	00030000-5615-0bfa-d8f5-90d3063fcdf4
00020000-5615-0bfa-b2f9-87bbeca6f6de	00030000-5615-0bfa-c816-4e1a8a9a99f4
00020000-5615-0bfa-b2f9-87bbeca6f6de	00030000-5615-0bfa-d5dc-d4caffca3ae7
00020000-5615-0bfa-b2f9-87bbeca6f6de	00030000-5615-0bfa-8ee9-01460cd700a7
00020000-5615-0bfa-b2f9-87bbeca6f6de	00030000-5615-0bfa-1931-85e64e3254c3
00020000-5615-0bfa-b2f9-87bbeca6f6de	00030000-5615-0bfa-5a19-cf94c2b20586
00020000-5615-0bfa-b2f9-87bbeca6f6de	00030000-5615-0bfa-7cce-d0523f5f4b3f
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-86aa-be2dfe15675c
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-7965-dc47e095d64f
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-8ee9-01460cd700a7
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-fdf6-f3538c7a6c52
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-b3e6-33fa609b083a
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-c655-45f502565e86
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-8323-97b98650d58c
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-ff84-097dfbf000ec
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-9eb4-76d1a740fb8b
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-c704-7a9ce6bc62fa
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-2080-bb3425a5c87d
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-f37c-73071f9326c1
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-b91e-ebcaf108f9ae
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-b03a-44d9bf919150
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-c6f8-491433ba02f1
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-6026-dd77f6a4b3a8
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-9296-97d8c4d551c7
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-8f24-c1cee8fca9bf
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-94f6-43e4e9680cbf
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-235b-62f8168178ca
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-bc9d-143413598398
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-f06b-d4dc719b88be
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-b69b-c558082e3b52
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-34a5-ec2690f365a2
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-e9c4-c370083e0c01
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-5822-9edc70c3669e
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-94a5-b16517439500
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-b4c9-a3a1dafc42ae
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-7bc3-c884f570f04d
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-7921-a21af4454322
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-66bb-3a369d040a29
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-0d34-ce646d97b86d
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-b023-f7352ec62300
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-596e-3c5ecf967d92
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-9b20-7b281886853c
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-3d9f-7f52e07531d7
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-31ee-f029aaf3039e
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-f47c-c7ebad772565
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-6186-a5139a411305
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-f0ca-f2a13d4bf045
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-02f2-db86b0dfa020
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-0570-991973dee5f9
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-452c-203aa7272eb6
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-dc2b-b16fb2c5d971
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-3023-5a47e9434152
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-dbe6-6f35c38e4ece
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-77c2-b74a2180081a
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-8896-f24def71de18
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-0ee6-38e19e09ee55
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-1c84-6ef4247b9bb5
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-8203-ffab265bed23
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-b055-ce6593c4edc6
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-018b-18c7e402f423
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-8602-9b301eb23ed2
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-e621-409231770922
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-1307-422bdeec4397
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-ca31-ffb1c3398f5f
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-ad06-4b838169620c
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-f072-20849dbb022a
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-2e33-699fac041715
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-4094-2b45fb111919
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-cd9c-8c708e865cfb
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-4dd3-302e0547a621
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-b561-f8a88ed89a66
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-ed64-93c55083baec
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-d64e-0797e6455c65
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-f006-1bc7cbd8ed23
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-e4ab-4a2f899a88f0
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-0b4b-6aeee68f11ef
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-9793-ff390d21df9e
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-de78-ff9071ba8461
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-d736-613b3cb65a6b
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-d795-edd0eb182c12
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-c26a-1a9138e67867
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-dd62-f5ac98fb791b
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-cee1-91308b07d182
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-9ac2-422c4571b6df
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-51ed-79583ddb12dd
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-0708-20957aeb43df
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-50ee-15c0d417a730
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-9bd7-e26873676842
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-2d84-3a84c9db6eb0
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-dee8-fe11003d8e8f
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-84e4-fdc35b443983
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-3c09-9aba08c4bb1b
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-01eb-447eabeee59c
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-801d-9ee9e67d0c2d
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-4b68-79a78cc29f23
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-f8ec-fac08362c9fe
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-34af-55a092c44153
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-f792-f545758155de
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-b98d-d926e16963cb
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-ac0a-873360808592
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-8a39-2e0f1b7d92ac
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-2452-ae5dc68d6a2a
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-d8f5-90d3063fcdf4
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-d33c-41c793881589
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-9757-a1315695de76
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-a5cd-ed0b530cdb2f
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-ad05-7bd5772632ad
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-82b9-52a949cc9b0d
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-478a-c6d8371c6bd3
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-a9a0-f909c9ae0e39
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-83f4-501eecff31e7
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-16b6-2076ede348ce
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-c816-4e1a8a9a99f4
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-3658-0b9e68d97d2f
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-39a0-89f16aa18fea
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-759c-b8ef49fda545
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-69cb-13f4b5e5b999
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-f17d-b8e6cce284d3
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-ecde-6fe58fd03af5
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-8621-062a17eb403c
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-adb6-04e87a6bbc3f
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-fea7-28ab5a0c0bc9
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-4747-850e93c283eb
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-1dc1-68b18e499040
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-d5dc-d4caffca3ae7
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-337e-0ea2b8bc84ea
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-1931-85e64e3254c3
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-7acf-3333e61589f8
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-717d-be98c8e0e41c
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-b8f2-2f28554a6598
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-b24c-27b6da4147f4
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-5b9e-7edc5f70dc78
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-0ea8-8381e01553c4
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-718c-d296c31847fa
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-3adf-501aa2a223f6
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-4710-92c37b81964f
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-8ad3-f7bf88be9e6b
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-f070-2864305c5323
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-a14c-1ab03ef06929
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-55c7-249e09a4759c
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-f655-84a778911736
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-57f4-dc6e88a4506b
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-8140-8560bcd83cc6
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-1b99-f3dda320f7aa
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-5a19-cf94c2b20586
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-40ad-9f8e9af49a71
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-7cce-d0523f5f4b3f
00020000-5615-0bfc-8427-8f53a8bdf783	00030000-5615-0bfa-3ee1-8e24cb80e6d4
\.


--
-- TOC entry 3008 (class 0 OID 21385795)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 21385829)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 21385965)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5615-0bfc-b9f0-9c78301ac5bd	00090000-5615-0bfc-fb7d-c078071d447c	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5615-0bfc-f974-bc4eddca6b66	00090000-5615-0bfc-3b6e-5af406bbc074	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5615-0bfc-1fdb-736a953f201e	00090000-5615-0bfc-4b0a-437e7f616877	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5615-0bfc-ebbf-abe65a90d9c2	00090000-5615-0bfc-7a98-7f564c121eb9	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2984 (class 0 OID 21385530)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5615-0bfb-a1e9-6359821e2d4f	00040000-5615-0bfa-45b0-c8fce5f0a5e4	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5615-0bfb-c84f-2b2bb0f63c84	00040000-5615-0bfa-45b0-c8fce5f0a5e4	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5615-0bfb-ea99-df16f7bb253f	00040000-5615-0bfa-45b0-c8fce5f0a5e4	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5615-0bfb-a36d-7a7ece9870c5	00040000-5615-0bfa-45b0-c8fce5f0a5e4	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5615-0bfb-5520-9b01f38427d5	00040000-5615-0bfa-45b0-c8fce5f0a5e4	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5615-0bfb-240a-5f8bc680a327	00040000-5615-0bfa-e297-8b69fa35e015	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5615-0bfb-ef8e-aedaff8589d0	00040000-5615-0bfa-4e4f-5ed85d0af554	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5615-0bfb-b2f5-86ef3a18a6d2	00040000-5615-0bfa-a858-662f45c92203	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5615-0bfb-3f98-5ae78280803f	00040000-5615-0bfa-b6eb-cdff5b5b033a	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5615-0bfe-01b4-e55c6cf96d62	00040000-5615-0bfa-45b0-c8fce5f0a5e4	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2986 (class 0 OID 21385564)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5615-0bf9-3540-9e45edd9d4ce	8341	Adlešiči
00050000-5615-0bf9-8bec-bcb765455b60	5270	Ajdovščina
00050000-5615-0bf9-d17e-de81548b075d	6280	Ankaran/Ancarano
00050000-5615-0bf9-4bde-4976a7631e00	9253	Apače
00050000-5615-0bf9-cef4-40bf047d6b3b	8253	Artiče
00050000-5615-0bf9-5d4a-60dc502bf027	4275	Begunje na Gorenjskem
00050000-5615-0bf9-c026-5b0c25e8c81b	1382	Begunje pri Cerknici
00050000-5615-0bf9-4d7a-688bacfa68d6	9231	Beltinci
00050000-5615-0bf9-8ff6-e811e09c10fa	2234	Benedikt
00050000-5615-0bf9-8da1-6ed5ec0188c3	2345	Bistrica ob Dravi
00050000-5615-0bf9-8c4c-f9d33bf04451	3256	Bistrica ob Sotli
00050000-5615-0bf9-baab-4a9f0924f56a	8259	Bizeljsko
00050000-5615-0bf9-76a9-dd3d2423b3b4	1223	Blagovica
00050000-5615-0bf9-ab1b-02cabc9b2be7	8283	Blanca
00050000-5615-0bf9-040d-9eef03e5a7c2	4260	Bled
00050000-5615-0bf9-a277-a3eb765f80a7	4273	Blejska Dobrava
00050000-5615-0bf9-a8aa-50acc676c2f3	9265	Bodonci
00050000-5615-0bf9-806a-26cd94b215a4	9222	Bogojina
00050000-5615-0bf9-b047-96abf349b888	4263	Bohinjska Bela
00050000-5615-0bf9-6173-a7a0aa8e4313	4264	Bohinjska Bistrica
00050000-5615-0bf9-288d-9237006a962b	4265	Bohinjsko jezero
00050000-5615-0bf9-cf08-89ba7bf3e8e3	1353	Borovnica
00050000-5615-0bf9-79a2-8b4650840622	8294	Boštanj
00050000-5615-0bf9-96c1-4e0517724d14	5230	Bovec
00050000-5615-0bf9-8a45-09b94bf5da9d	5295	Branik
00050000-5615-0bf9-bae8-5a65ea8a9d11	3314	Braslovče
00050000-5615-0bf9-1643-d325ca74c9c6	5223	Breginj
00050000-5615-0bf9-fdc5-64eeef8b4427	8280	Brestanica
00050000-5615-0bf9-c434-30a9c50631d9	2354	Bresternica
00050000-5615-0bf9-b0a9-bbebcf17a5f8	4243	Brezje
00050000-5615-0bf9-7272-338c68fe265d	1351	Brezovica pri Ljubljani
00050000-5615-0bf9-2f07-2da7e7cda33e	8250	Brežice
00050000-5615-0bf9-dbae-9b92d0e1741d	4210	Brnik - Aerodrom
00050000-5615-0bf9-a58c-56814614200b	8321	Brusnice
00050000-5615-0bf9-06b6-3fe387448fe6	3255	Buče
00050000-5615-0bf9-1c17-61fb5bfb191c	8276	Bučka 
00050000-5615-0bf9-2d12-ea74502fd775	9261	Cankova
00050000-5615-0bf9-3095-081c3879dc70	3000	Celje 
00050000-5615-0bf9-42e8-14c30bc86bec	3001	Celje - poštni predali
00050000-5615-0bf9-e5b2-cdda42ee711a	4207	Cerklje na Gorenjskem
00050000-5615-0bf9-8966-70704b8c81fe	8263	Cerklje ob Krki
00050000-5615-0bf9-000c-cddb6ee133c9	1380	Cerknica
00050000-5615-0bf9-14a2-e4f1ada6cba4	5282	Cerkno
00050000-5615-0bf9-5720-550da6e7e99d	2236	Cerkvenjak
00050000-5615-0bf9-e904-417a1e7773da	2215	Ceršak
00050000-5615-0bf9-3b23-55661e0902ef	2326	Cirkovce
00050000-5615-0bf9-b2fa-f6b23d3afa8d	2282	Cirkulane
00050000-5615-0bf9-fa99-ddea4e4b7c85	5273	Col
00050000-5615-0bf9-6ac5-da6b2d9caaf5	8251	Čatež ob Savi
00050000-5615-0bf9-206d-cb51390fe8b2	1413	Čemšenik
00050000-5615-0bf9-e9d6-bf807e3ec075	5253	Čepovan
00050000-5615-0bf9-9f82-0d2eeca9b79c	9232	Črenšovci
00050000-5615-0bf9-5d55-fb89a4baa070	2393	Črna na Koroškem
00050000-5615-0bf9-b22c-48227984b687	6275	Črni Kal
00050000-5615-0bf9-9ad4-b3d2be638de8	5274	Črni Vrh nad Idrijo
00050000-5615-0bf9-799b-455e5ba7db1d	5262	Črniče
00050000-5615-0bf9-3e51-7fb372157258	8340	Črnomelj
00050000-5615-0bf9-1437-0c60525e370b	6271	Dekani
00050000-5615-0bf9-5904-1fcb0bf2e0bb	5210	Deskle
00050000-5615-0bf9-f8c6-7ef8dbd5ff27	2253	Destrnik
00050000-5615-0bf9-8491-dade62c1ec16	6215	Divača
00050000-5615-0bf9-d05c-53afd077ab39	1233	Dob
00050000-5615-0bf9-35b7-db353e9c5008	3224	Dobje pri Planini
00050000-5615-0bf9-2982-80cb168a753f	8257	Dobova
00050000-5615-0bf9-1bc5-e9f20d7fe2a4	1423	Dobovec
00050000-5615-0bf9-cc10-b892061f1974	5263	Dobravlje
00050000-5615-0bf9-ce68-23384081cec1	3204	Dobrna
00050000-5615-0bf9-ffbb-df5e6b8b6b92	8211	Dobrnič
00050000-5615-0bf9-4aab-e7b5fab852cf	1356	Dobrova
00050000-5615-0bf9-d0b5-2a6e9c9bd39a	9223	Dobrovnik/Dobronak 
00050000-5615-0bf9-0ea0-cd4d6ed575f4	5212	Dobrovo v Brdih
00050000-5615-0bf9-1e4c-1c8b2b615a68	1431	Dol pri Hrastniku
00050000-5615-0bf9-8504-ee1e98f90a89	1262	Dol pri Ljubljani
00050000-5615-0bf9-327f-52b9a0975914	1273	Dole pri Litiji
00050000-5615-0bf9-85da-c874a24046d5	1331	Dolenja vas
00050000-5615-0bf9-3204-2cfbe202a7b9	8350	Dolenjske Toplice
00050000-5615-0bf9-f3d4-b5237cd669ed	1230	Domžale
00050000-5615-0bf9-28c9-9dcccc3ec136	2252	Dornava
00050000-5615-0bf9-48de-3d8d15dd0d9e	5294	Dornberk
00050000-5615-0bf9-569b-af06b68802a3	1319	Draga
00050000-5615-0bf9-ead7-10238b348ce4	8343	Dragatuš
00050000-5615-0bf9-d7dc-b9f8dec79a48	3222	Dramlje
00050000-5615-0bf9-8a19-8f159a34c960	2370	Dravograd
00050000-5615-0bf9-6d2d-6386c4e6c91e	4203	Duplje
00050000-5615-0bf9-0602-1000c046ffdd	6221	Dutovlje
00050000-5615-0bf9-25d5-5341dc87d185	8361	Dvor
00050000-5615-0bf9-8b8e-697106f6f941	2343	Fala
00050000-5615-0bf9-2c78-59edf6202406	9208	Fokovci
00050000-5615-0bf9-b395-6679153762da	2313	Fram
00050000-5615-0bf9-076a-6816f6923eb4	3213	Frankolovo
00050000-5615-0bf9-ecc8-c07527c55b89	1274	Gabrovka
00050000-5615-0bf9-0df1-e81aa4ea82d3	8254	Globoko
00050000-5615-0bf9-d1af-0d61ce59dfd3	5275	Godovič
00050000-5615-0bf9-ff00-7b01f6b489bc	4204	Golnik
00050000-5615-0bf9-ef38-3300be09c489	3303	Gomilsko
00050000-5615-0bf9-8cb3-6498ce4642d6	4224	Gorenja vas
00050000-5615-0bf9-0380-bcab5eca7c73	3263	Gorica pri Slivnici
00050000-5615-0bf9-fd4a-28dc992a20f0	2272	Gorišnica
00050000-5615-0bf9-ba21-44970bcf9248	9250	Gornja Radgona
00050000-5615-0bf9-cc7c-cc5cdfa01f87	3342	Gornji Grad
00050000-5615-0bf9-62bc-11b37fffe98b	4282	Gozd Martuljek
00050000-5615-0bf9-0e56-734e71c35bf5	6272	Gračišče
00050000-5615-0bf9-73ce-861495c76a8f	9264	Grad
00050000-5615-0bf9-0202-9a1dd943af3e	8332	Gradac
00050000-5615-0bf9-1212-4be30403d755	1384	Grahovo
00050000-5615-0bf9-055d-6fc47b3ddccd	5242	Grahovo ob Bači
00050000-5615-0bf9-0126-cb90458e99f3	5251	Grgar
00050000-5615-0bf9-7b8b-df710c473f9a	3302	Griže
00050000-5615-0bf9-dbc1-1e0a509f4268	3231	Grobelno
00050000-5615-0bf9-e8a3-138ac4d4d7ad	1290	Grosuplje
00050000-5615-0bf9-35af-4626e8a3506c	2288	Hajdina
00050000-5615-0bf9-1c45-89af9706899c	8362	Hinje
00050000-5615-0bf9-12d6-db5366509d43	2311	Hoče
00050000-5615-0bf9-514b-413c17e745b0	9205	Hodoš/Hodos
00050000-5615-0bf9-cc07-2cacde01de41	1354	Horjul
00050000-5615-0bf9-95d8-2e41202542b2	1372	Hotedršica
00050000-5615-0bf9-5a09-68ec6ba7dd55	1430	Hrastnik
00050000-5615-0bf9-0b4b-9a2305c0f1a8	6225	Hruševje
00050000-5615-0bf9-66b3-07edf116821e	4276	Hrušica
00050000-5615-0bf9-0aa7-f1fd1e5ba7da	5280	Idrija
00050000-5615-0bf9-6ca3-9445197784f0	1292	Ig
00050000-5615-0bf9-4305-cfe39dc57ee4	6250	Ilirska Bistrica
00050000-5615-0bf9-9e07-8867e5fd97a5	6251	Ilirska Bistrica-Trnovo
00050000-5615-0bf9-1811-95e9785569b5	1295	Ivančna Gorica
00050000-5615-0bf9-6201-e10ce8d142e7	2259	Ivanjkovci
00050000-5615-0bf9-c712-9983c986c188	1411	Izlake
00050000-5615-0bf9-5ef0-aadbdbf5c69e	6310	Izola/Isola
00050000-5615-0bf9-40ff-b18559c1e2c5	2222	Jakobski Dol
00050000-5615-0bf9-b914-98e9cab3ca16	2221	Jarenina
00050000-5615-0bf9-0c14-cadda40303db	6254	Jelšane
00050000-5615-0bf9-89cd-f50ddb679e38	4270	Jesenice
00050000-5615-0bf9-2000-8bd48da02a0a	8261	Jesenice na Dolenjskem
00050000-5615-0bf9-54ac-86141182a823	3273	Jurklošter
00050000-5615-0bf9-274e-ec1558c56394	2223	Jurovski Dol
00050000-5615-0bf9-634a-9c7528869ed9	2256	Juršinci
00050000-5615-0bf9-d12d-066ffc598793	5214	Kal nad Kanalom
00050000-5615-0bf9-b552-83c6e59f8682	3233	Kalobje
00050000-5615-0bf9-31ea-6e4bd192722a	4246	Kamna Gorica
00050000-5615-0bf9-248a-69baafc35a4b	2351	Kamnica
00050000-5615-0bf9-25d4-2f54f38a06d8	1241	Kamnik
00050000-5615-0bf9-beb8-9402cb783871	5213	Kanal
00050000-5615-0bf9-5b58-561d628588e6	8258	Kapele
00050000-5615-0bf9-6202-3da62b4e5626	2362	Kapla
00050000-5615-0bf9-a267-d260beb26cb0	2325	Kidričevo
00050000-5615-0bf9-79f7-337be6252e1b	1412	Kisovec
00050000-5615-0bf9-41bc-0748f1ac2ae2	6253	Knežak
00050000-5615-0bf9-1cc9-69713bcc8fe4	5222	Kobarid
00050000-5615-0bf9-223c-4a9e9c4dc401	9227	Kobilje
00050000-5615-0bf9-0bc3-01f96afc035b	1330	Kočevje
00050000-5615-0bf9-69e8-e45150f70ebe	1338	Kočevska Reka
00050000-5615-0bf9-4f9f-452e53988eba	2276	Kog
00050000-5615-0bf9-9077-955ebf659547	5211	Kojsko
00050000-5615-0bf9-d8e3-7d7b979a4087	6223	Komen
00050000-5615-0bf9-372e-1070041a981c	1218	Komenda
00050000-5615-0bf9-99f7-4940d23eff41	6000	Koper/Capodistria 
00050000-5615-0bf9-fd22-d77afaf4c049	6001	Koper/Capodistria - poštni predali
00050000-5615-0bf9-868e-ecd4718c6ea4	8282	Koprivnica
00050000-5615-0bf9-a9bd-03ae369b26ef	5296	Kostanjevica na Krasu
00050000-5615-0bf9-cb2b-d6b16d938276	8311	Kostanjevica na Krki
00050000-5615-0bf9-3b01-2ea56e7ec47e	1336	Kostel
00050000-5615-0bf9-5ecf-2399251a164b	6256	Košana
00050000-5615-0bf9-88c5-e7e8027d8cec	2394	Kotlje
00050000-5615-0bf9-bf1c-3d7b3fb72371	6240	Kozina
00050000-5615-0bf9-65b1-7b2b95813f32	3260	Kozje
00050000-5615-0bf9-d90f-33bea03c1829	4000	Kranj 
00050000-5615-0bf9-77a8-26479664c7a0	4001	Kranj - poštni predali
00050000-5615-0bf9-f0a6-848c8f992cb1	4280	Kranjska Gora
00050000-5615-0bf9-322d-dd467ebbe5c9	1281	Kresnice
00050000-5615-0bf9-f761-b576ca94b4d4	4294	Križe
00050000-5615-0bf9-2ae6-732715ec77b9	9206	Križevci
00050000-5615-0bf9-4aa0-4aa168319fb4	9242	Križevci pri Ljutomeru
00050000-5615-0bf9-99cd-8c8d3374313d	1301	Krka
00050000-5615-0bf9-1fc8-50eb3598dbe1	8296	Krmelj
00050000-5615-0bf9-b651-19e9319d6b29	4245	Kropa
00050000-5615-0bf9-907b-9451f9a6b1e6	8262	Krška vas
00050000-5615-0bf9-9dc0-afb0827947d5	8270	Krško
00050000-5615-0bf9-9fc3-68eb2c9a55ed	9263	Kuzma
00050000-5615-0bf9-7f69-a770d1d5a969	2318	Laporje
00050000-5615-0bf9-9ad9-ea827f588c22	3270	Laško
00050000-5615-0bf9-6f42-30fb1bfbae33	1219	Laze v Tuhinju
00050000-5615-0bf9-f634-4eb2b07197ee	2230	Lenart v Slovenskih goricah
00050000-5615-0bf9-dc6e-90c5c1db836a	9220	Lendava/Lendva
00050000-5615-0bf9-6570-ef540e2bca22	4248	Lesce
00050000-5615-0bf9-0186-6b106681479f	3261	Lesično
00050000-5615-0bf9-26f4-694b2cc01d78	8273	Leskovec pri Krškem
00050000-5615-0bf9-1072-0bfdd87d808a	2372	Libeliče
00050000-5615-0bf9-f1e7-262de85ad4f4	2341	Limbuš
00050000-5615-0bf9-57ee-fc0645ef8a36	1270	Litija
00050000-5615-0bf9-fa73-7e6e5e6ce4dc	3202	Ljubečna
00050000-5615-0bf9-260c-26114e428ea2	1000	Ljubljana 
00050000-5615-0bf9-5e93-59b219c79e76	1001	Ljubljana - poštni predali
00050000-5615-0bf9-47e5-8559e0e63783	1231	Ljubljana - Črnuče
00050000-5615-0bf9-9934-8fa71622d6a6	1261	Ljubljana - Dobrunje
00050000-5615-0bf9-e08c-782c4d75e207	1260	Ljubljana - Polje
00050000-5615-0bf9-72aa-1cb7173cc056	1210	Ljubljana - Šentvid
00050000-5615-0bf9-1fd8-3af871a99649	1211	Ljubljana - Šmartno
00050000-5615-0bf9-1bfb-fb67762d5687	3333	Ljubno ob Savinji
00050000-5615-0bf9-9e87-c6fd16d9c093	9240	Ljutomer
00050000-5615-0bf9-4fb0-291ab99d7701	3215	Loče
00050000-5615-0bf9-f55f-7c7567ccc270	5231	Log pod Mangartom
00050000-5615-0bf9-1423-1b420a7a8e4c	1358	Log pri Brezovici
00050000-5615-0bf9-858c-63b3239be964	1370	Logatec
00050000-5615-0bf9-182b-8b5c14cd24d6	1371	Logatec
00050000-5615-0bf9-4e65-11e265b376c6	1434	Loka pri Zidanem Mostu
00050000-5615-0bf9-96db-fc7b9b6f339c	3223	Loka pri Žusmu
00050000-5615-0bf9-15f8-42401e9f507a	6219	Lokev
00050000-5615-0bf9-9bea-8bf7aa0c65e1	1318	Loški Potok
00050000-5615-0bf9-dc76-16479eec0d74	2324	Lovrenc na Dravskem polju
00050000-5615-0bf9-ba96-f1d37691c442	2344	Lovrenc na Pohorju
00050000-5615-0bf9-1d85-87b18ed27023	3334	Luče
00050000-5615-0bf9-01fc-0ae38a50810c	1225	Lukovica
00050000-5615-0bf9-9615-81368549988c	9202	Mačkovci
00050000-5615-0bf9-1e38-b614fa573a10	2322	Majšperk
00050000-5615-0bf9-e01f-ed68a2249415	2321	Makole
00050000-5615-0bf9-e2ee-6455e0b507b8	9243	Mala Nedelja
00050000-5615-0bf9-4bb8-99fbf5a93652	2229	Malečnik
00050000-5615-0bf9-3bc4-272f2eb72879	6273	Marezige
00050000-5615-0bf9-8c81-43113ded7ff2	2000	Maribor 
00050000-5615-0bf9-84a2-ba0c77deea6c	2001	Maribor - poštni predali
00050000-5615-0bf9-956b-4d593ec3c1cb	2206	Marjeta na Dravskem polju
00050000-5615-0bf9-3691-82c45ea8af40	2281	Markovci
00050000-5615-0bf9-f809-ebae324425e0	9221	Martjanci
00050000-5615-0bf9-bbaf-7b237a637a71	6242	Materija
00050000-5615-0bf9-689b-3c080b26c9de	4211	Mavčiče
00050000-5615-0bf9-c0ac-eb477b9fa107	1215	Medvode
00050000-5615-0bf9-fc39-71774512416c	1234	Mengeš
00050000-5615-0bf9-b3ad-9b8700d815e6	8330	Metlika
00050000-5615-0bf9-75e4-e75293a063e9	2392	Mežica
00050000-5615-0bf9-e02c-162a1cbaf148	2204	Miklavž na Dravskem polju
00050000-5615-0bf9-b4c7-994a9a9bc8e3	2275	Miklavž pri Ormožu
00050000-5615-0bf9-a973-b890c6319623	5291	Miren
00050000-5615-0bf9-b640-532d19a418ef	8233	Mirna
00050000-5615-0bf9-799f-592af469cab6	8216	Mirna Peč
00050000-5615-0bf9-1ba1-45c981a70374	2382	Mislinja
00050000-5615-0bf9-9c07-7797486703e6	4281	Mojstrana
00050000-5615-0bf9-3253-fe92e90cd0aa	8230	Mokronog
00050000-5615-0bf9-6dd8-553acc873412	1251	Moravče
00050000-5615-0bf9-a949-72bfff76cdba	9226	Moravske Toplice
00050000-5615-0bf9-c1db-52641e4d098e	5216	Most na Soči
00050000-5615-0bf9-b2cb-001df6c624f4	1221	Motnik
00050000-5615-0bf9-1733-18be254c425c	3330	Mozirje
00050000-5615-0bf9-eb0f-28e6cffe2af9	9000	Murska Sobota 
00050000-5615-0bf9-dba8-13e27f2aa283	9001	Murska Sobota - poštni predali
00050000-5615-0bf9-67a1-af5cec429744	2366	Muta
00050000-5615-0bf9-40cd-ac2eca106531	4202	Naklo
00050000-5615-0bf9-2fe7-e7604607c3b5	3331	Nazarje
00050000-5615-0bf9-a2fc-c443bd551906	1357	Notranje Gorice
00050000-5615-0bf9-2360-f75421806a91	3203	Nova Cerkev
00050000-5615-0bf9-a4b6-ec171721b4fe	5000	Nova Gorica 
00050000-5615-0bf9-e6aa-6c5470245457	5001	Nova Gorica - poštni predali
00050000-5615-0bf9-757d-7bac1a4a4222	1385	Nova vas
00050000-5615-0bf9-da93-da163ae2a98e	8000	Novo mesto
00050000-5615-0bf9-9167-63bee7e93486	8001	Novo mesto - poštni predali
00050000-5615-0bf9-2c7c-82ff951650c9	6243	Obrov
00050000-5615-0bf9-925f-e2e4e1a0cfe5	9233	Odranci
00050000-5615-0bf9-27f6-c3200d126a42	2317	Oplotnica
00050000-5615-0bf9-0c3c-1ffc8a1a0643	2312	Orehova vas
00050000-5615-0bf9-7580-74f1aa6fdcd9	2270	Ormož
00050000-5615-0bf9-7abf-fd3c33ba24fc	1316	Ortnek
00050000-5615-0bf9-8620-edacabffdf28	1337	Osilnica
00050000-5615-0bf9-2cc9-93ea257f7087	8222	Otočec
00050000-5615-0bf9-3d1d-cb711bcc416a	2361	Ožbalt
00050000-5615-0bf9-966b-1b805baf6370	2231	Pernica
00050000-5615-0bf9-182f-f9106dce7d86	2211	Pesnica pri Mariboru
00050000-5615-0bf9-6723-a0352fbaba9a	9203	Petrovci
00050000-5615-0bf9-8e35-b79aef2902fc	3301	Petrovče
00050000-5615-0bf9-7d7e-349249287d42	6330	Piran/Pirano
00050000-5615-0bf9-b50f-56463e3e4a31	8255	Pišece
00050000-5615-0bf9-8f99-32d87151f1c8	6257	Pivka
00050000-5615-0bf9-81fc-d5c8718bd599	6232	Planina
00050000-5615-0bf9-feb3-5982fe08b9c0	3225	Planina pri Sevnici
00050000-5615-0bf9-d3ec-d4302cc0a14c	6276	Pobegi
00050000-5615-0bf9-21dc-de885f86cd64	8312	Podbočje
00050000-5615-0bf9-46e8-18eb8e2f8300	5243	Podbrdo
00050000-5615-0bf9-1a11-f76c0981e27e	3254	Podčetrtek
00050000-5615-0bf9-addc-1a3bfc1b6ee7	2273	Podgorci
00050000-5615-0bf9-52c3-89aaffb6c1df	6216	Podgorje
00050000-5615-0bf9-501b-c98f8d8765d9	2381	Podgorje pri Slovenj Gradcu
00050000-5615-0bf9-2dfb-8ad39e00784f	6244	Podgrad
00050000-5615-0bf9-3081-41ba8a9f6448	1414	Podkum
00050000-5615-0bf9-0fc1-e1a45becc7bf	2286	Podlehnik
00050000-5615-0bf9-9db7-e2487bc6f972	5272	Podnanos
00050000-5615-0bf9-df77-2cf36a7f5a69	4244	Podnart
00050000-5615-0bf9-5dec-d658975e4b2e	3241	Podplat
00050000-5615-0bf9-3560-41b14094adc4	3257	Podsreda
00050000-5615-0bf9-867b-3517e1b9cdab	2363	Podvelka
00050000-5615-0bf9-7c63-edd03b2b7479	2208	Pohorje
00050000-5615-0bf9-7d7e-155c83d06115	2257	Polenšak
00050000-5615-0bf9-2200-728ef68418ed	1355	Polhov Gradec
00050000-5615-0bf9-2ebe-c8ca4ae6a368	4223	Poljane nad Škofjo Loko
00050000-5615-0bf9-f204-ef8caf9e6d34	2319	Poljčane
00050000-5615-0bf9-1cef-f5b7a18f63b5	1272	Polšnik
00050000-5615-0bf9-f11c-6ada1fbf252a	3313	Polzela
00050000-5615-0bf9-45ab-4b0e918fc5c8	3232	Ponikva
00050000-5615-0bf9-2bb0-284eed81101e	6320	Portorož/Portorose
00050000-5615-0bf9-2f24-8f6b9f56d536	6230	Postojna
00050000-5615-0bf9-2530-c3a7eac62d9e	2331	Pragersko
00050000-5615-0bf9-01d1-ee86b41e57fa	3312	Prebold
00050000-5615-0bf9-9c51-3565820df316	4205	Preddvor
00050000-5615-0bf9-c6d3-a2a49bb9464b	6255	Prem
00050000-5615-0bf9-d95f-e2e9d2ba9f0a	1352	Preserje
00050000-5615-0bf9-01ad-9be54c5e5ad1	6258	Prestranek
00050000-5615-0bf9-06f4-638de6a3c97a	2391	Prevalje
00050000-5615-0bf9-87be-7ca3a3afe91e	3262	Prevorje
00050000-5615-0bf9-164c-9b41cd4cb076	1276	Primskovo 
00050000-5615-0bf9-1db1-95b58aff8a3e	3253	Pristava pri Mestinju
00050000-5615-0bf9-adcf-1350b2475521	9207	Prosenjakovci/Partosfalva
00050000-5615-0bf9-7ecf-86bddb04aaa4	5297	Prvačina
00050000-5615-0bf9-2c3c-4bdb67d97b47	2250	Ptuj
00050000-5615-0bf9-4201-9caa718b48cf	2323	Ptujska Gora
00050000-5615-0bf9-e5b7-e80c250fcb2c	9201	Puconci
00050000-5615-0bf9-1ae1-4bdeffab7eb6	2327	Rače
00050000-5615-0bf9-0ec2-5ff8123b98c6	1433	Radeče
00050000-5615-0bf9-0864-14933f320d09	9252	Radenci
00050000-5615-0bf9-d0ed-031326e6ce26	2360	Radlje ob Dravi
00050000-5615-0bf9-f444-2e22582afe73	1235	Radomlje
00050000-5615-0bf9-0e54-589556d0c572	4240	Radovljica
00050000-5615-0bf9-c65f-425e40b98589	8274	Raka
00050000-5615-0bf9-9682-5aa61c6c2907	1381	Rakek
00050000-5615-0bf9-455c-50eb92dc88ee	4283	Rateče - Planica
00050000-5615-0bf9-fdfe-83c6ffbbe5d3	2390	Ravne na Koroškem
00050000-5615-0bf9-9342-0cfeea78aa97	9246	Razkrižje
00050000-5615-0bf9-c2ed-e8df550b68ea	3332	Rečica ob Savinji
00050000-5615-0bf9-0d77-fb2d787bc317	5292	Renče
00050000-5615-0bf9-2b4d-efeb1149d5f2	1310	Ribnica
00050000-5615-0bf9-dc0f-658f9022f984	2364	Ribnica na Pohorju
00050000-5615-0bf9-bd99-3b8f4669ce57	3272	Rimske Toplice
00050000-5615-0bf9-3135-71f9c0ba4b2a	1314	Rob
00050000-5615-0bf9-b632-c734d8be863c	5215	Ročinj
00050000-5615-0bf9-fdbb-3597fdd2df3b	3250	Rogaška Slatina
00050000-5615-0bf9-7dac-6c4e999d9f39	9262	Rogašovci
00050000-5615-0bf9-8dd1-94674d20cb05	3252	Rogatec
00050000-5615-0bf9-d07b-c2d5b0a3df1d	1373	Rovte
00050000-5615-0bf9-89df-823769f35207	2342	Ruše
00050000-5615-0bf9-a7db-c15d384cebcd	1282	Sava
00050000-5615-0bf9-d68d-9503f9203f8c	6333	Sečovlje/Sicciole
00050000-5615-0bf9-8fe8-00431c49a4bb	4227	Selca
00050000-5615-0bf9-7781-cbb1e7014fe6	2352	Selnica ob Dravi
00050000-5615-0bf9-9d92-b30dbfc34e1c	8333	Semič
00050000-5615-0bf9-ea18-0708640c4e58	8281	Senovo
00050000-5615-0bf9-3d0b-5d6a35d0f249	6224	Senožeče
00050000-5615-0bf9-4bfe-9d44d11e2779	8290	Sevnica
00050000-5615-0bf9-f82d-a116c9eeac74	6210	Sežana
00050000-5615-0bf9-0e02-94633d13fd95	2214	Sladki Vrh
00050000-5615-0bf9-8f27-1b0e588068b5	5283	Slap ob Idrijci
00050000-5615-0bf9-2072-01a0e99e7bd6	2380	Slovenj Gradec
00050000-5615-0bf9-6876-0bb4b7334cac	2310	Slovenska Bistrica
00050000-5615-0bf9-11a6-b3dfa669c3e1	3210	Slovenske Konjice
00050000-5615-0bf9-aacb-2efb39f517ad	1216	Smlednik
00050000-5615-0bf9-def7-f4ca27884860	5232	Soča
00050000-5615-0bf9-a632-b4e08dbd7cc0	1317	Sodražica
00050000-5615-0bf9-f4ac-6c63fa6d9332	3335	Solčava
00050000-5615-0bf9-c2d3-351068b4fd2c	5250	Solkan
00050000-5615-0bf9-5c25-030ce65e9cc3	4229	Sorica
00050000-5615-0bf9-4deb-a6fe80bf20fc	4225	Sovodenj
00050000-5615-0bf9-ec24-4ba4d2aa76c3	5281	Spodnja Idrija
00050000-5615-0bf9-1c23-7fe661b29bd9	2241	Spodnji Duplek
00050000-5615-0bf9-0379-ded473d4d363	9245	Spodnji Ivanjci
00050000-5615-0bf9-aa65-5bfe67223e1e	2277	Središče ob Dravi
00050000-5615-0bf9-1724-0bfa3c5c6a13	4267	Srednja vas v Bohinju
00050000-5615-0bf9-3219-ae93a53fddc7	8256	Sromlje 
00050000-5615-0bf9-015a-1714fe51cf0f	5224	Srpenica
00050000-5615-0bf9-511f-38c89063281c	1242	Stahovica
00050000-5615-0bf9-1f4e-a7ad02f02c72	1332	Stara Cerkev
00050000-5615-0bf9-29f2-af8f6bc3b996	8342	Stari trg ob Kolpi
00050000-5615-0bf9-4067-5f513899cc5f	1386	Stari trg pri Ložu
00050000-5615-0bf9-1e0b-716809c52556	2205	Starše
00050000-5615-0bf9-5d6f-55af10c7e511	2289	Stoperce
00050000-5615-0bf9-2923-297e917cce78	8322	Stopiče
00050000-5615-0bf9-5f3b-acb39466991a	3206	Stranice
00050000-5615-0bf9-5167-2f63adcb6abc	8351	Straža
00050000-5615-0bf9-b63f-147f51e088fd	1313	Struge
00050000-5615-0bf9-1346-41a8ee30286e	8293	Studenec
00050000-5615-0bf9-8b97-55ed34673381	8331	Suhor
00050000-5615-0bf9-9d34-93036d6f98d7	2233	Sv. Ana v Slovenskih goricah
00050000-5615-0bf9-2cc2-b5b7708343c4	2235	Sv. Trojica v Slovenskih goricah
00050000-5615-0bf9-188d-7b5dace38c63	2353	Sveti Duh na Ostrem Vrhu
00050000-5615-0bf9-6fea-88a9b91603ed	9244	Sveti Jurij ob Ščavnici
00050000-5615-0bf9-1068-51cd1f81c092	3264	Sveti Štefan
00050000-5615-0bf9-88be-4140ee3c3ff8	2258	Sveti Tomaž
00050000-5615-0bf9-af32-e37fcab90c0f	9204	Šalovci
00050000-5615-0bf9-1647-f854c48c3291	5261	Šempas
00050000-5615-0bf9-04a0-3e648077ba3c	5290	Šempeter pri Gorici
00050000-5615-0bf9-b92b-17b852c2d1c9	3311	Šempeter v Savinjski dolini
00050000-5615-0bf9-18a6-9532aceb7e2d	4208	Šenčur
00050000-5615-0bf9-e0e7-1d38e711788e	2212	Šentilj v Slovenskih goricah
00050000-5615-0bf9-d24e-8c65307c7c92	8297	Šentjanž
00050000-5615-0bf9-f067-df6d439f53dc	2373	Šentjanž pri Dravogradu
00050000-5615-0bf9-a242-3cb97f0d887f	8310	Šentjernej
00050000-5615-0bf9-c04d-3413a2a24405	3230	Šentjur
00050000-5615-0bf9-53cc-388041ff2c16	3271	Šentrupert
00050000-5615-0bf9-e1ac-1cec6965eebb	8232	Šentrupert
00050000-5615-0bf9-2217-da46434964a9	1296	Šentvid pri Stični
00050000-5615-0bf9-e6a9-b9fba5fb35cb	8275	Škocjan
00050000-5615-0bf9-62bb-7c8ff651edce	6281	Škofije
00050000-5615-0bf9-3757-093f324c6e9c	4220	Škofja Loka
00050000-5615-0bf9-c12f-cef418197b0e	3211	Škofja vas
00050000-5615-0bf9-5de1-c0572461f8b0	1291	Škofljica
00050000-5615-0bf9-b473-61a441653bea	6274	Šmarje
00050000-5615-0bf9-7181-7d190c311b2a	1293	Šmarje - Sap
00050000-5615-0bf9-18a9-f0629d3e832a	3240	Šmarje pri Jelšah
00050000-5615-0bf9-e3e4-44c510fab34c	8220	Šmarješke Toplice
00050000-5615-0bf9-811b-16f718b4abdb	2315	Šmartno na Pohorju
00050000-5615-0bf9-9a3a-cad9ded92d83	3341	Šmartno ob Dreti
00050000-5615-0bf9-cbd8-ee7901221e12	3327	Šmartno ob Paki
00050000-5615-0bf9-85bd-7e6f0d97325f	1275	Šmartno pri Litiji
00050000-5615-0bf9-4f60-3870ba16e00e	2383	Šmartno pri Slovenj Gradcu
00050000-5615-0bf9-b2a8-aef31a72bf3f	3201	Šmartno v Rožni dolini
00050000-5615-0bf9-3655-fdb986226a18	3325	Šoštanj
00050000-5615-0bf9-462c-c7c0ac100286	6222	Štanjel
00050000-5615-0bf9-bce3-50ee263cd7b7	3220	Štore
00050000-5615-0bf9-e0bc-eec8201c8dde	3304	Tabor
00050000-5615-0bf9-1a42-1e755fc7b1fd	3221	Teharje
00050000-5615-0bf9-a332-204c7dc302ec	9251	Tišina
00050000-5615-0bf9-9a2f-0326cc5cf5d2	5220	Tolmin
00050000-5615-0bf9-aafb-78cef135e999	3326	Topolšica
00050000-5615-0bf9-3ff2-e6e26678587b	2371	Trbonje
00050000-5615-0bf9-437b-af141e9597d9	1420	Trbovlje
00050000-5615-0bf9-a2d0-937f24fa4c65	8231	Trebelno 
00050000-5615-0bf9-804f-5906871ffe60	8210	Trebnje
00050000-5615-0bf9-110d-edbf4b7dfae2	5252	Trnovo pri Gorici
00050000-5615-0bf9-484f-cea9c63a7d95	2254	Trnovska vas
00050000-5615-0bf9-fdd2-4a06ec96a4db	1222	Trojane
00050000-5615-0bf9-0954-e98d0a8f1315	1236	Trzin
00050000-5615-0bf9-5051-eda2f71f2c1d	4290	Tržič
00050000-5615-0bf9-8b82-d1a3e2769194	8295	Tržišče
00050000-5615-0bf9-2291-c828798371cd	1311	Turjak
00050000-5615-0bf9-e8e0-ebaaa6c3c764	9224	Turnišče
00050000-5615-0bf9-beeb-8452a5810172	8323	Uršna sela
00050000-5615-0bf9-8ae8-40175337a2c9	1252	Vače
00050000-5615-0bf9-9668-4e8867fb7db5	3320	Velenje 
00050000-5615-0bf9-c7fc-723c380bb111	3322	Velenje - poštni predali
00050000-5615-0bf9-b8ef-99cc86bcb0cc	8212	Velika Loka
00050000-5615-0bf9-da43-ec993e5448b9	2274	Velika Nedelja
00050000-5615-0bf9-12be-f03baff44cbf	9225	Velika Polana
00050000-5615-0bf9-269e-57579a2dd554	1315	Velike Lašče
00050000-5615-0bf9-559c-facb124fa3dd	8213	Veliki Gaber
00050000-5615-0bf9-b9f4-149e0094944a	9241	Veržej
00050000-5615-0bf9-a1c9-59049a8a990c	1312	Videm - Dobrepolje
00050000-5615-0bf9-7a58-5db665774692	2284	Videm pri Ptuju
00050000-5615-0bf9-e484-7f9cae2cc094	8344	Vinica
00050000-5615-0bf9-a879-dead12599919	5271	Vipava
00050000-5615-0bf9-900f-9e85ada290f7	4212	Visoko
00050000-5615-0bf9-336e-c47756f6f03f	1294	Višnja Gora
00050000-5615-0bf9-f74d-c1f2bf2c6250	3205	Vitanje
00050000-5615-0bf9-957e-b959e5671c82	2255	Vitomarci
00050000-5615-0bf9-fcef-1bb37e7c56b2	1217	Vodice
00050000-5615-0bf9-3949-593e299962b1	3212	Vojnik\t
00050000-5615-0bf9-5320-09a355fb5dcb	5293	Volčja Draga
00050000-5615-0bf9-a3b2-3f5881297c4e	2232	Voličina
00050000-5615-0bf9-ab9d-735bf13e80d1	3305	Vransko
00050000-5615-0bf9-d5da-f1d6f6d05974	6217	Vremski Britof
00050000-5615-0bf9-f4d5-f4395488504e	1360	Vrhnika
00050000-5615-0bf9-d43b-6648cad5b7e1	2365	Vuhred
00050000-5615-0bf9-58f9-2e5eb8e4e9a8	2367	Vuzenica
00050000-5615-0bf9-17a3-3e528af64006	8292	Zabukovje 
00050000-5615-0bf9-bc32-93d9a29ec041	1410	Zagorje ob Savi
00050000-5615-0bf9-719a-505b229bd874	1303	Zagradec
00050000-5615-0bf9-3147-387928d6c3ed	2283	Zavrč
00050000-5615-0bf9-6ab8-34280fb9dedb	8272	Zdole 
00050000-5615-0bf9-6cd2-d233d2f215e9	4201	Zgornja Besnica
00050000-5615-0bf9-495b-512a21163ed9	2242	Zgornja Korena
00050000-5615-0bf9-c70a-393e7b710046	2201	Zgornja Kungota
00050000-5615-0bf9-6133-9a84c5ffbe87	2316	Zgornja Ložnica
00050000-5615-0bf9-632b-1d23bccd6198	2314	Zgornja Polskava
00050000-5615-0bf9-e415-b3ff60fdb15d	2213	Zgornja Velka
00050000-5615-0bf9-abb1-8342c58d3284	4247	Zgornje Gorje
00050000-5615-0bf9-7ff1-f2f44d4c63e4	4206	Zgornje Jezersko
00050000-5615-0bf9-13e6-99107df828cc	2285	Zgornji Leskovec
00050000-5615-0bf9-aa60-3a28d9801de5	1432	Zidani Most
00050000-5615-0bf9-4565-8ab05bf38bcd	3214	Zreče
00050000-5615-0bf9-7f7e-dcfd06340014	4209	Žabnica
00050000-5615-0bf9-8bc0-96a8e950c4ff	3310	Žalec
00050000-5615-0bf9-1d15-5d99e9fda43e	4228	Železniki
00050000-5615-0bf9-d069-deba2d1d6d52	2287	Žetale
00050000-5615-0bf9-3e9d-0ff8b885fa3c	4226	Žiri
00050000-5615-0bf9-7751-de72b307c7f8	4274	Žirovnica
00050000-5615-0bf9-30d3-ef3aefcd5ec8	8360	Žužemberk
\.


--
-- TOC entry 3031 (class 0 OID 21386150)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 21385769)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 21385549)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5615-0bfc-f2d7-636cfbb90228	00080000-5615-0bfb-a1e9-6359821e2d4f	\N	00040000-5615-0bfa-45b0-c8fce5f0a5e4	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5615-0bfc-84bf-c1f8d2053cc9	00080000-5615-0bfb-a1e9-6359821e2d4f	\N	00040000-5615-0bfa-45b0-c8fce5f0a5e4	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5615-0bfc-a681-e23ef61c3769	00080000-5615-0bfb-c84f-2b2bb0f63c84	\N	00040000-5615-0bfa-45b0-c8fce5f0a5e4	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2993 (class 0 OID 21385653)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 21385781)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 21386164)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 21386174)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5615-0bfc-461f-842dd898c863	00080000-5615-0bfb-ea99-df16f7bb253f	0987	AK
00190000-5615-0bfc-fb79-e8474ba5b09d	00080000-5615-0bfb-c84f-2b2bb0f63c84	0989	AK
00190000-5615-0bfc-9e32-0268b62104f2	00080000-5615-0bfb-a36d-7a7ece9870c5	0986	AK
00190000-5615-0bfc-35ff-40459a8681ef	00080000-5615-0bfb-240a-5f8bc680a327	0984	AK
00190000-5615-0bfc-c955-2b53d94e6b0d	00080000-5615-0bfb-ef8e-aedaff8589d0	0983	AK
00190000-5615-0bfc-8346-297569dea521	00080000-5615-0bfb-b2f5-86ef3a18a6d2	0982	AK
00190000-5615-0bfe-26cd-cbfb6a75c015	00080000-5615-0bfe-01b4-e55c6cf96d62	1001	AK
\.


--
-- TOC entry 3030 (class 0 OID 21386107)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5615-0bfc-2620-9ffee47a932e	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3034 (class 0 OID 21386182)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 21385810)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5615-0bfb-9229-eace2381297f	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5615-0bfb-c429-2b4187390588	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5615-0bfb-05e3-561524a2512c	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5615-0bfb-c8d4-b9ec6c848e7c	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5615-0bfb-c801-c58a77b98a14	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5615-0bfb-848e-daa67b97d87b	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5615-0bfb-f410-5b4ec5396b83	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3002 (class 0 OID 21385754)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 21385744)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 21385954)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 21385884)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 21385627)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 21385422)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5615-0bfe-01b4-e55c6cf96d62	00010000-5615-0bfa-5ee4-10af58feb06e	2015-10-07 14:11:42	INS	a:0:{}
2	App\\Entity\\Option	00000000-5615-0bfe-1a11-c095701f2868	00010000-5615-0bfa-5ee4-10af58feb06e	2015-10-07 14:11:42	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5615-0bfe-26cd-cbfb6a75c015	00010000-5615-0bfa-5ee4-10af58feb06e	2015-10-07 14:11:42	INS	a:0:{}
\.


--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3011 (class 0 OID 21385823)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 21385460)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5615-0bfa-3c14-1a946430a9a0	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5615-0bfa-95cb-0b4b9e0b4e4c	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5615-0bfa-d03f-dbbef0c92d57	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5615-0bfa-fd5b-793c04671ccc	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5615-0bfa-c4a2-c2346b7caeed	planer	Planer dogodkov v koledarju	t
00020000-5615-0bfa-031f-d0cc5b9a54f7	kadrovska	Kadrovska služba	t
00020000-5615-0bfa-6b7d-12dd8b1cecd0	arhivar	Ažuriranje arhivalij	t
00020000-5615-0bfa-fc40-a65bc0001ce8	igralec	Igralec	t
00020000-5615-0bfa-b2f9-87bbeca6f6de	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5615-0bfc-8427-8f53a8bdf783	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2976 (class 0 OID 21385444)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5615-0bfa-5791-6ebb895a408a	00020000-5615-0bfa-d03f-dbbef0c92d57
00010000-5615-0bfa-5ee4-10af58feb06e	00020000-5615-0bfa-d03f-dbbef0c92d57
00010000-5615-0bfc-2f8f-809eb2944231	00020000-5615-0bfc-8427-8f53a8bdf783
\.


--
-- TOC entry 3013 (class 0 OID 21385837)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 21385775)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 21385721)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 21385409)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5615-0bfa-3512-0e0c356e3f5f	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5615-0bfa-6fc3-bb32291cbec6	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5615-0bfa-f470-4099de96e650	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5615-0bfa-4172-f5024cc7502b	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5615-0bfa-fb4a-8e247f5b66fc	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2971 (class 0 OID 21385401)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5615-0bfa-b2ed-7fd474c3becc	00230000-5615-0bfa-4172-f5024cc7502b	popa
00240000-5615-0bfa-8e19-6d1e6252d646	00230000-5615-0bfa-4172-f5024cc7502b	oseba
00240000-5615-0bfa-5167-c8c877d2570a	00230000-5615-0bfa-4172-f5024cc7502b	sezona
00240000-5615-0bfa-a2e4-feb4a6e3fe4b	00230000-5615-0bfa-6fc3-bb32291cbec6	prostor
00240000-5615-0bfa-915f-238b0049f184	00230000-5615-0bfa-4172-f5024cc7502b	besedilo
00240000-5615-0bfa-b670-772d17f75e1e	00230000-5615-0bfa-4172-f5024cc7502b	uprizoritev
00240000-5615-0bfa-bf16-7794bc799d43	00230000-5615-0bfa-4172-f5024cc7502b	funkcija
00240000-5615-0bfa-42f8-a0e222131b11	00230000-5615-0bfa-4172-f5024cc7502b	tipfunkcije
00240000-5615-0bfa-7729-207592cd40c0	00230000-5615-0bfa-4172-f5024cc7502b	alternacija
00240000-5615-0bfa-61ee-1f6f8ae148f8	00230000-5615-0bfa-3512-0e0c356e3f5f	pogodba
00240000-5615-0bfa-68db-9278940b322a	00230000-5615-0bfa-4172-f5024cc7502b	zaposlitev
00240000-5615-0bfa-c6c9-ede7ffbd26ad	00230000-5615-0bfa-4172-f5024cc7502b	zvrstuprizoritve
00240000-5615-0bfa-2fcd-8cacfe49945a	00230000-5615-0bfa-3512-0e0c356e3f5f	programdela
00240000-5615-0bfa-fbb4-8bcefc945773	00230000-5615-0bfa-4172-f5024cc7502b	zapis
\.


--
-- TOC entry 2970 (class 0 OID 21385396)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
8ada4ed1-4d37-47c7-865c-770a3c05c6b9	00240000-5615-0bfa-b2ed-7fd474c3becc	0	1001
\.


--
-- TOC entry 3019 (class 0 OID 21385901)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5615-0bfc-1c48-efac22df647e	000e0000-5615-0bfc-81a7-e7bc7cd78f05	00080000-5615-0bfb-a1e9-6359821e2d4f	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5615-0bfa-0c94-30196ef10ab7
00270000-5615-0bfc-975b-e8ea81b104e7	000e0000-5615-0bfc-81a7-e7bc7cd78f05	00080000-5615-0bfb-a1e9-6359821e2d4f	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5615-0bfa-0c94-30196ef10ab7
\.


--
-- TOC entry 2983 (class 0 OID 21385522)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 21385731)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5615-0bfc-5481-6b77fea92121	00180000-5615-0bfc-e70f-4430f504eab1	000c0000-5615-0bfc-f96b-3529628d18b3	00090000-5615-0bfc-df29-0f2cd3a867d6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5615-0bfc-29e0-a3166d1166ad	00180000-5615-0bfc-e70f-4430f504eab1	000c0000-5615-0bfc-3989-bb78f03af586	00090000-5615-0bfc-7a98-7f564c121eb9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5615-0bfc-0726-d17a02339723	00180000-5615-0bfc-e70f-4430f504eab1	000c0000-5615-0bfc-a579-af79227c743a	00090000-5615-0bfc-356d-d2b223183d95	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5615-0bfc-aac2-8eda06255e64	00180000-5615-0bfc-e70f-4430f504eab1	000c0000-5615-0bfc-6912-826bae47b064	00090000-5615-0bfc-e833-781442584129	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5615-0bfc-67ca-adfda4f1f9e5	00180000-5615-0bfc-e70f-4430f504eab1	000c0000-5615-0bfc-e425-9c5384a377c7	00090000-5615-0bfc-600c-6438e9d78092	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5615-0bfc-c486-3faa8cdfdf50	00180000-5615-0bfc-8c07-494fdd4f24fc	\N	00090000-5615-0bfc-600c-6438e9d78092	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3022 (class 0 OID 21385942)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5615-0bf9-7073-9a46068c647b	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5615-0bf9-0891-0267f3291359	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5615-0bf9-eecf-fe0812ac697c	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5615-0bf9-901e-c1455c7d0b6f	04	Režija	Režija	Režija	umetnik	30
000f0000-5615-0bf9-924e-61c8aa1cd824	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5615-0bf9-da70-5b393d13c7ad	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5615-0bf9-8899-798d5492dc6f	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5615-0bf9-ba9b-282f6d1b3e34	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5615-0bf9-0814-b515441fec51	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5615-0bf9-58b6-86161ab20689	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5615-0bf9-9c18-d18330131a37	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5615-0bf9-f6c1-7a60ee76da60	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5615-0bf9-5e49-0313a619fbd8	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5615-0bf9-9243-45432172e9ad	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5615-0bf9-59d1-885188fb350c	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5615-0bf9-b688-3077356cfcaa	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5615-0bf9-394b-a2102c087e99	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5615-0bf9-e7da-7b68413fd3c6	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3035 (class 0 OID 21386193)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5615-0bf9-7693-d9cea4d22f58	01	Velika predstava	f	1.00	1.00
002b0000-5615-0bf9-e35e-1672536ff65f	02	Mala predstava	f	0.50	0.50
002b0000-5615-0bf9-4800-1468f912f809	03	Mala koprodukcija	t	0.40	1.00
002b0000-5615-0bf9-9bb2-19dc831e15a4	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5615-0bf9-62e5-150737c815c3	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2988 (class 0 OID 21385584)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2975 (class 0 OID 21385431)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5615-0bfa-5ee4-10af58feb06e	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROVCXi9e2IwWjWj2acbBBwa4T5AyFNuVu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5615-0bfc-e765-bef674c01049	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5615-0bfc-a298-a105c8cde1ac	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5615-0bfc-8ede-41cbb655e6e0	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5615-0bfc-7d6c-c47df3b664cb	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5615-0bfc-4e1c-15ebe7e40ddb	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5615-0bfc-144a-706a20948fc1	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5615-0bfc-0818-779097212a7a	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5615-0bfc-be52-c45b5a3f60a6	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5615-0bfc-b089-6bb05ab2cb18	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5615-0bfc-2f8f-809eb2944231	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5615-0bfa-5791-6ebb895a408a	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3026 (class 0 OID 21385992)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5615-0bfc-2826-49f3ca731632	00160000-5615-0bfb-8db9-1528222b8c81	\N	00140000-5615-0bfa-2753-a6e34df776ac	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5615-0bfb-c801-c58a77b98a14
000e0000-5615-0bfc-81a7-e7bc7cd78f05	00160000-5615-0bfb-bcc1-b3ef651c6255	\N	00140000-5615-0bfa-56a1-56e1a4c43278	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5615-0bfb-848e-daa67b97d87b
000e0000-5615-0bfc-5abc-cbb84b3b65e6	\N	\N	00140000-5615-0bfa-56a1-56e1a4c43278	00190000-5615-0bfc-461f-842dd898c863	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5615-0bfb-c801-c58a77b98a14
000e0000-5615-0bfc-d9fb-f2249c159577	\N	\N	00140000-5615-0bfa-56a1-56e1a4c43278	00190000-5615-0bfc-461f-842dd898c863	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5615-0bfb-c801-c58a77b98a14
000e0000-5615-0bfc-f092-ddd689957c17	\N	\N	00140000-5615-0bfa-56a1-56e1a4c43278	00190000-5615-0bfc-461f-842dd898c863	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5615-0bfb-9229-eace2381297f
000e0000-5615-0bfc-2bba-3b7ee6141e8a	\N	\N	00140000-5615-0bfa-56a1-56e1a4c43278	00190000-5615-0bfc-461f-842dd898c863	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5615-0bfb-9229-eace2381297f
\.


--
-- TOC entry 2995 (class 0 OID 21385675)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5615-0bfc-4dd2-f393c8208925	000e0000-5615-0bfc-81a7-e7bc7cd78f05	\N	1	
00200000-5615-0bfc-ab70-e926f56cb037	000e0000-5615-0bfc-81a7-e7bc7cd78f05	\N	2	
00200000-5615-0bfc-7c44-81fb7bcbd9f5	000e0000-5615-0bfc-81a7-e7bc7cd78f05	\N	3	
00200000-5615-0bfc-cf56-257ced6753b2	000e0000-5615-0bfc-81a7-e7bc7cd78f05	\N	4	
00200000-5615-0bfc-8dfe-5ee54c46fa8e	000e0000-5615-0bfc-81a7-e7bc7cd78f05	\N	5	
\.


--
-- TOC entry 3009 (class 0 OID 21385802)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 21385915)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5615-0bfa-afbf-196ade407e3d	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5615-0bfa-365d-0539505026ae	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5615-0bfa-12c9-46e102601b78	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5615-0bfa-b501-557694f88a56	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5615-0bfa-2a67-225d2575ebd2	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5615-0bfa-cb77-dfc51eb419db	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5615-0bfa-b4c6-ae3ba2244e78	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5615-0bfa-e028-25c4db31afe8	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5615-0bfa-0c94-30196ef10ab7	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5615-0bfa-b643-2aa5917df534	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5615-0bfa-9af4-d21dd343ffe7	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5615-0bfa-290e-7b159f471df6	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5615-0bfa-57e7-c2cb1e9fe704	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5615-0bfa-1e62-1528c336f03d	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5615-0bfa-8a35-fc830bd74389	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5615-0bfa-81c7-07e3ce3ddf1d	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5615-0bfa-cc79-8637d55fb4b3	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5615-0bfa-a543-76b12f85c0c4	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5615-0bfa-0eee-26037c01f2e5	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5615-0bfa-3237-e7194e79c36d	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5615-0bfa-6d28-a8d27bb00acc	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5615-0bfa-f38d-21a0de725f8b	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5615-0bfa-f7a0-8e1f3009edbe	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5615-0bfa-ae99-9c625ab19348	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5615-0bfa-e4ab-26b0615c70a1	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5615-0bfa-f2b6-7d762fb772c3	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5615-0bfa-6db8-e9f5aef1e4a0	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5615-0bfa-0610-97afc3705d31	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3038 (class 0 OID 21386240)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 21386212)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 21386252)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 21385874)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5615-0bfc-3d28-8cfdcc89a3c2	00090000-5615-0bfc-7a98-7f564c121eb9	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-5615-0bfc-ed22-2ae0bf63fca0	00090000-5615-0bfc-356d-d2b223183d95	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-5615-0bfc-46e4-68155ad95076	00090000-5615-0bfc-fa93-cd0a0d4d5fab	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-5615-0bfc-1782-9564a77f6f81	00090000-5615-0bfc-69d1-5bfb54a6c568	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-5615-0bfc-4bf7-b999d4f00813	00090000-5615-0bfc-df29-0f2cd3a867d6	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-5615-0bfc-d832-7484a0f31e94	00090000-5615-0bfc-27e4-3f3ed6d1d7bf	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 2997 (class 0 OID 21385710)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 21385982)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5615-0bfa-2753-a6e34df776ac	01	Drama	drama (SURS 01)
00140000-5615-0bfa-65e6-aa2494ba3d79	02	Opera	opera (SURS 02)
00140000-5615-0bfa-3871-e1c3454665e5	03	Balet	balet (SURS 03)
00140000-5615-0bfa-3442-e9f0f0566a86	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5615-0bfa-d5e0-c384c1a766e5	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5615-0bfa-56a1-56e1a4c43278	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5615-0bfa-d9b3-2b22a88fc8b9	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3015 (class 0 OID 21385864)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2502 (class 2606 OID 21385485)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 21386041)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 21386031)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 21385898)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 21385940)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2751 (class 2606 OID 21386292)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 21385699)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 21385720)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 21386210)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 21385610)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 21386101)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 21385860)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 21385673)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 21385648)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 21385624)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 21385767)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 21386269)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 21386276)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2756 (class 2606 OID 21386300)
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
-- TOC entry 2614 (class 2606 OID 21385794)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 21385582)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 21385494)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 21385518)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 21385474)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2493 (class 2606 OID 21385459)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 21385800)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 21385836)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 21385977)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 21385546)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 21385570)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 21386162)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 21385773)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 21385560)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 21385661)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 21385785)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 21386171)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 21386179)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 21386149)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 21386191)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 21385818)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 21385758)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 21385749)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 21385964)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 21385891)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 21385636)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 21385430)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 21385827)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 21385448)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2495 (class 2606 OID 21385468)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 21385845)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 21385780)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 21385729)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 21385418)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 21385406)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 21385400)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 21385911)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 21385527)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 21385740)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 21385951)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 21386203)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 21385595)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 21385443)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 21386010)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 21385683)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 21385808)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 21385923)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 21386250)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 21386234)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 21386258)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 21385882)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 21385714)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 21385990)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 21385872)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 1259 OID 21385708)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2567 (class 1259 OID 21385709)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2568 (class 1259 OID 21385707)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2569 (class 1259 OID 21385706)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2570 (class 1259 OID 21385705)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2656 (class 1259 OID 21385912)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2657 (class 1259 OID 21385913)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2658 (class 1259 OID 21385914)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2742 (class 1259 OID 21386271)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2743 (class 1259 OID 21386270)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2516 (class 1259 OID 21385548)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2615 (class 1259 OID 21385801)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2729 (class 1259 OID 21386238)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2730 (class 1259 OID 21386237)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2731 (class 1259 OID 21386239)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2732 (class 1259 OID 21386236)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2733 (class 1259 OID 21386235)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2609 (class 1259 OID 21385787)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2610 (class 1259 OID 21385786)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2561 (class 1259 OID 21385684)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2639 (class 1259 OID 21385861)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2640 (class 1259 OID 21385863)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2641 (class 1259 OID 21385862)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2541 (class 1259 OID 21385626)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2542 (class 1259 OID 21385625)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2720 (class 1259 OID 21386192)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2672 (class 1259 OID 21385979)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 21385980)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2674 (class 1259 OID 21385981)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2739 (class 1259 OID 21386259)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2681 (class 1259 OID 21386015)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2682 (class 1259 OID 21386012)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2683 (class 1259 OID 21386016)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2684 (class 1259 OID 21386014)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2685 (class 1259 OID 21386013)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2531 (class 1259 OID 21385597)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2532 (class 1259 OID 21385596)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2507 (class 1259 OID 21385521)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2627 (class 1259 OID 21385828)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2497 (class 1259 OID 21385475)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2498 (class 1259 OID 21385476)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2632 (class 1259 OID 21385848)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2633 (class 1259 OID 21385847)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2634 (class 1259 OID 21385846)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2554 (class 1259 OID 21385662)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2555 (class 1259 OID 21385663)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2477 (class 1259 OID 21385408)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2589 (class 1259 OID 21385753)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2590 (class 1259 OID 21385751)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2591 (class 1259 OID 21385750)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2592 (class 1259 OID 21385752)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2488 (class 1259 OID 21385449)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2489 (class 1259 OID 21385450)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2618 (class 1259 OID 21385809)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2752 (class 1259 OID 21386293)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2654 (class 1259 OID 21385900)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2655 (class 1259 OID 21385899)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2753 (class 1259 OID 21386301)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2754 (class 1259 OID 21386302)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2604 (class 1259 OID 21385774)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2648 (class 1259 OID 21385892)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2649 (class 1259 OID 21385893)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2702 (class 1259 OID 21386106)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2703 (class 1259 OID 21386105)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2704 (class 1259 OID 21386102)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2705 (class 1259 OID 21386103)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2706 (class 1259 OID 21386104)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2520 (class 1259 OID 21385562)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2521 (class 1259 OID 21385561)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2522 (class 1259 OID 21385563)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2621 (class 1259 OID 21385822)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2622 (class 1259 OID 21385821)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2712 (class 1259 OID 21386172)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2713 (class 1259 OID 21386173)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2695 (class 1259 OID 21386045)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2696 (class 1259 OID 21386046)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2697 (class 1259 OID 21386043)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2698 (class 1259 OID 21386044)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2645 (class 1259 OID 21385883)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2595 (class 1259 OID 21385762)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2596 (class 1259 OID 21385761)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2597 (class 1259 OID 21385759)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2598 (class 1259 OID 21385760)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2691 (class 1259 OID 21386033)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2692 (class 1259 OID 21386032)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2545 (class 1259 OID 21385637)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2548 (class 1259 OID 21385651)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2549 (class 1259 OID 21385650)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2550 (class 1259 OID 21385649)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2551 (class 1259 OID 21385652)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2560 (class 1259 OID 21385674)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2709 (class 1259 OID 21386163)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2728 (class 1259 OID 21386211)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2746 (class 1259 OID 21386277)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2747 (class 1259 OID 21386278)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2503 (class 1259 OID 21385496)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2504 (class 1259 OID 21385495)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2512 (class 1259 OID 21385528)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2513 (class 1259 OID 21385529)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2576 (class 1259 OID 21385715)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2584 (class 1259 OID 21385743)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2585 (class 1259 OID 21385742)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2586 (class 1259 OID 21385741)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2571 (class 1259 OID 21385701)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2572 (class 1259 OID 21385702)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2573 (class 1259 OID 21385700)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2574 (class 1259 OID 21385704)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2575 (class 1259 OID 21385703)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2519 (class 1259 OID 21385547)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 21385611)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2538 (class 1259 OID 21385613)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2539 (class 1259 OID 21385612)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2540 (class 1259 OID 21385614)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2603 (class 1259 OID 21385768)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2677 (class 1259 OID 21385978)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2686 (class 1259 OID 21386011)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2668 (class 1259 OID 21385952)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 21385953)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2510 (class 1259 OID 21385519)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2511 (class 1259 OID 21385520)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2642 (class 1259 OID 21385873)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2483 (class 1259 OID 21385419)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2530 (class 1259 OID 21385583)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2480 (class 1259 OID 21385407)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2725 (class 1259 OID 21386204)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 21385820)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2626 (class 1259 OID 21385819)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2699 (class 1259 OID 21386042)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2527 (class 1259 OID 21385571)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2678 (class 1259 OID 21385991)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2736 (class 1259 OID 21386251)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2718 (class 1259 OID 21386180)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2719 (class 1259 OID 21386181)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2665 (class 1259 OID 21385941)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2583 (class 1259 OID 21385730)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2496 (class 1259 OID 21385469)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2787 (class 2606 OID 21386433)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2786 (class 2606 OID 21386438)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2782 (class 2606 OID 21386458)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2788 (class 2606 OID 21386428)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2784 (class 2606 OID 21386448)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2783 (class 2606 OID 21386453)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2785 (class 2606 OID 21386443)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2823 (class 2606 OID 21386623)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2822 (class 2606 OID 21386628)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2821 (class 2606 OID 21386633)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2855 (class 2606 OID 21386798)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2856 (class 2606 OID 21386793)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2768 (class 2606 OID 21386358)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2805 (class 2606 OID 21386543)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2850 (class 2606 OID 21386778)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2851 (class 2606 OID 21386773)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2849 (class 2606 OID 21386783)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2852 (class 2606 OID 21386768)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2853 (class 2606 OID 21386763)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2803 (class 2606 OID 21386538)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2804 (class 2606 OID 21386533)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2781 (class 2606 OID 21386423)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2815 (class 2606 OID 21386583)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2813 (class 2606 OID 21386593)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2814 (class 2606 OID 21386588)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2774 (class 2606 OID 21386393)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2775 (class 2606 OID 21386388)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2801 (class 2606 OID 21386523)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2847 (class 2606 OID 21386753)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2826 (class 2606 OID 21386638)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2825 (class 2606 OID 21386643)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2824 (class 2606 OID 21386648)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2854 (class 2606 OID 21386788)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2828 (class 2606 OID 21386668)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2831 (class 2606 OID 21386653)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2827 (class 2606 OID 21386673)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2829 (class 2606 OID 21386663)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2830 (class 2606 OID 21386658)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2772 (class 2606 OID 21386383)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2773 (class 2606 OID 21386378)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2764 (class 2606 OID 21386343)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2765 (class 2606 OID 21386338)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2809 (class 2606 OID 21386563)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2761 (class 2606 OID 21386318)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2760 (class 2606 OID 21386323)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2810 (class 2606 OID 21386578)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2811 (class 2606 OID 21386573)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2812 (class 2606 OID 21386568)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2779 (class 2606 OID 21386408)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2778 (class 2606 OID 21386413)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2757 (class 2606 OID 21386303)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2793 (class 2606 OID 21386498)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2795 (class 2606 OID 21386488)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2796 (class 2606 OID 21386483)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2794 (class 2606 OID 21386493)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2759 (class 2606 OID 21386308)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2758 (class 2606 OID 21386313)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2806 (class 2606 OID 21386548)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2859 (class 2606 OID 21386813)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2819 (class 2606 OID 21386618)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2820 (class 2606 OID 21386613)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2861 (class 2606 OID 21386818)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2860 (class 2606 OID 21386823)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2802 (class 2606 OID 21386528)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2818 (class 2606 OID 21386603)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2817 (class 2606 OID 21386608)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2838 (class 2606 OID 21386728)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2839 (class 2606 OID 21386723)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2842 (class 2606 OID 21386708)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2841 (class 2606 OID 21386713)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2840 (class 2606 OID 21386718)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2770 (class 2606 OID 21386368)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2771 (class 2606 OID 21386363)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2769 (class 2606 OID 21386373)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2807 (class 2606 OID 21386558)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2808 (class 2606 OID 21386553)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2845 (class 2606 OID 21386738)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2844 (class 2606 OID 21386743)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2835 (class 2606 OID 21386698)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2834 (class 2606 OID 21386703)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2837 (class 2606 OID 21386688)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2836 (class 2606 OID 21386693)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2816 (class 2606 OID 21386598)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2797 (class 2606 OID 21386518)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2798 (class 2606 OID 21386513)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2800 (class 2606 OID 21386503)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2799 (class 2606 OID 21386508)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2832 (class 2606 OID 21386683)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2833 (class 2606 OID 21386678)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2776 (class 2606 OID 21386398)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2777 (class 2606 OID 21386403)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2780 (class 2606 OID 21386418)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2843 (class 2606 OID 21386733)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2846 (class 2606 OID 21386748)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2848 (class 2606 OID 21386758)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2858 (class 2606 OID 21386803)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2857 (class 2606 OID 21386808)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2762 (class 2606 OID 21386333)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2763 (class 2606 OID 21386328)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2767 (class 2606 OID 21386348)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2766 (class 2606 OID 21386353)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2789 (class 2606 OID 21386463)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2790 (class 2606 OID 21386478)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2791 (class 2606 OID 21386473)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2792 (class 2606 OID 21386468)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-07 14:11:44 CEST

--
-- PostgreSQL database dump complete
--

